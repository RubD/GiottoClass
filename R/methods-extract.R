
#' @include generics.R
NULL

#' @title Extract or replace parts of an object
#' @name extract-methods
#' @docType methods
#' @aliases `[` `[<-` `$` `$<-`
#' @description Operators Giotto S4 internal data.tables to extract
#' or replace parts.
#' @param x Giotto S4 object to extract columns from
#' @param i,j indices specifying elements to extract or replace. Indices are
#' numeric or character vectors or empty
#' @param name A literal character string (possibly backtick quoted).
#' @param value value(s) to set
#' This is normally matched to the colnames of the data.table object within the S4.
#' @section \code{`$`} methods:
#' @section \code{`$<-`} methods:
#' @section \code{`[`} methods:
#' @section \code{`[<-`} methods:
#'
NULL

# $ S4 access generic ####

## * coordDataDT ####

#' @rdname extract-methods
#' @section \code{`$`} methods:
#'   Select by colname from giotto S4 data.table coordinates slot.
#' @export
setMethod('$', signature(x = 'coordDataDT'),
          function(x, name) x@coordinates[[name]])


#' @rdname extract-methods
#' @section \code{`$<-`} methods:
#'   Set values by colname into giotto S4 data.table coordinates slot.
#'   Works via data.table methods
#' @export
setMethod('$<-', signature(x = 'coordDataDT'),
          function(x, name, value) {
            if(x@coordinates[,.N] == 0) x@coordinates = data.table::data.table()
            x@coordinates[, (name) := value]
            x
          })

## * metaData ####

#' @rdname extract-methods
#' @section \code{`$`} methods:
#'   Select by colname from giotto S4 data.table metaDT slot.
#' @export
setMethod('$', signature(x = 'metaData'),
          function(x, name) x@metaDT[[name]])


#' @rdname extract-methods
#' @section \code{`$<-`} methods:
#'   Set values by colname into giotto S4 data.table metaDT slot.
#'   Works via data.table methods
#' @export
setMethod('$<-', signature(x = 'metaData'),
          function(x, name, value) {
            if(x@metaDT[,.N] == 0) x@metaDT = data.table::data.table()
            x@metaDT[, (name) := value]
            x
          })


# [ S4 access generic ####

## * coordDataDT ####



#' @rdname extract-methods
#' @section \code{`[`} methods:
#'   Select rows (i) and cols (j) from giotto S4 coordinates slot
#' @export
setMethod('[', signature(x = 'coordDataDT', i = 'missing', j = 'ANY', drop = 'missing'),
          function(x, i, j) {
            x@coordinates = x@coordinates[, j = j, with = FALSE]
            x
          })


# setMethod('[', signature(x = 'giotto', i = 'character', j = 'missing', drop = 'missing'),
#           function(x, i, spat_unit = NULL, feat_type = NULL, name = NULL) {
#
#             # set defaults
#             spat_unit = set_default_spat_unit(gobject = x,
#                                               spat_unit = spat_unit)
#             feat_type = set_default_feat_type(gobject = x,
#                                               spat_unit = spat_unit,
#                                               feat_type = feat_type)
#             if(is.null(name)) name = 1L
#
#             switch(i,
#                    'expression' = slot(x, 'expression')[[spat_unit]][[feat_type]][[name]],
#                    'spatial_locs' = slot(x, 'spatial_locs')[[spat_unit]][[name]],
#                    'spatial_info' = slot(x, 'spatial_info')[[name]],
#                    'feat_info' = slot(x, 'feat_info')[[feat_type]])
#           })

# setMethod('[', signature(x = 'giotto', i = 'character', j = 'numeric', drop = 'missing'),
#           function(x, i, j, spat_unit = NULL, feat_type = NULL, name = NULL) {
#
#             avail_data = switch(i,
#                                 'expression' = list_expression(gobject = x,
#                                                                spat_unit = spat_unit,
#                                                                feat_type = feat_type),
#                                 'spatial_locs' = list_spatial_locations(gobject = x,
#                                                                         spat_unit = spat_unit),
#                                 'spatial_info' = list_spatial_info(gobject = x),
#                                 'feat_info' = list_feature_info(gobject = x))
#
#             switch(i,
#                    'expression' = get_expression_values(gobject = x,
#                                                         spat_unit = avail_data$spat_unit[[j]],
#                                                         feat_type = avail_data$feat_type[[j]],
#                                                         values = avail_data$name[[j]],
#                                                         output = 'exprObj',
#                                                         set_defaults = FALSE))
#
#           })

#' @rdname extract-methods
#' @export
setMethod('[', signature(x = 'coordDataDT', i = 'ANY', j = 'missing', drop = 'missing'),
          function(x, i, j) {
            x@coordinates = x@coordinates[i = i,]
            x
          })

#' @rdname extract-methods
#' @export
setMethod('[', signature(x = 'coordDataDT', i = 'ANY', j = 'ANY', drop = 'missing'),
          function(x, i, j) {
            x@coordinates = x@coordinates[i = i, j = j, with = FALSE]
            x
          })

#' @name [
#' @rdname extract-methods
#' @aliases [,coordDataDT,missing,missing,missing-method
#' @section \code{`[`} methods:
#'   Return \code{coordinates} slot data.table from giotto S4
#' @export
setMethod('[', signature(x = 'coordDataDT', i = 'missing', j = 'missing', drop = 'missing'),
          function(x, i, j) {
            x@coordinates
          })

#' @name [
#' @rdname extract-methods
#' @aliases [<-,coordDataDT,missing,missing,ANY-method [<-,coordDataDT,missing,missing-method
#' @docType methods
#' @section \code{`[<-`} methods:
#'   Assign to \code{coordinates} slot in giotto S4
setReplaceMethod('[', signature(x = 'coordDataDT', i = 'missing', j = 'missing', value = 'ANY'),
                 function(x, i, j, value) {
                   x@coordinates = value
                   x
                 })

# setMethod("[[")

## * metaData ####

#' @rdname extract-methods
#' @section \code{`[`} methods:
#'   Select rows (i) and cols (j) from giotto S4 metaDT slot
#' @export
setMethod('[', signature(x = 'metaData', i = 'missing', j = 'ANY', drop = 'missing'),
          function(x, i, j) {
            x@metaDT = x@metaDT[, j = j, with = FALSE]
            x
          })

#' @rdname extract-methods
#' @export
setMethod('[', signature(x = 'metaData', i = 'ANY', j = 'missing', drop = 'missing'),
          function(x, i, j) {
            x@metaDT = x@metaDT[i = i,]
            x
          })

#' @rdname extract-methods
#' @export
setMethod('[', signature(x = 'metaData', i = 'ANY', j = 'ANY', drop = 'missing'),
          function(x, i, j) {
            x@metaDT = x@metaDT[i = i, j = j, with = FALSE]
            x
          })

#' @rdname extract-methods
#' @section \code{`[`} methods:
#'   Return \code{metaDT} slot data.table from giotto S4
#' @export
setMethod('[', signature(x = 'metaData', i = 'missing', j = 'missing', drop = 'missing'),
          function(x, i, j) {
            x@metaDT
          })

#' @rdname extract-methods
#' @aliases [<-,metaData,missing,missing,ANY-method [<-,metaData,missing,missing-method
#' @docType methods
#' @section \code{`[<-`} methods:
#'   Assign to \code{metaDT} slot in giotto S4
#' @export
setMethod('[<-', signature(x = 'metaData', i = 'missing', j = 'missing', value = 'ANY'),
          function(x, i, j, value) {
            x@metaDT = value
            x
          })


## * dimObj (temp) ####

#' @rdname extract-methods
#' @export
setMethod('[', signature(x = 'dimObj', i = 'ANY', j = 'ANY', drop = 'missing'),
          function(x, i, j) {
            x@coordinates = x@coordinates[i = i, j = j]
            x
          })

#' @rdname extract-methods
#' @section \code{`[`} methods:
#'    Return \code{coordinates} slot matrix from giotto S4 dimObj
#' @export
setMethod('[', signature(x = 'dimObj', i = 'missing', j = 'missing', drop = 'missing'),
          function(x, i, j) {
            x@coordinates
          })

#' @rdname extract-methods
#' @aliases [<-,dimObj,missing,missing,ANY-method [<-,dimObj,missing,missing-method
#' @docType methods
#' @section \code{`[<-`} methods:
#'   Assign to \code{coordinates} slot in giotto S4 dimObj
#' @export
setMethod('[<-', signature(x = 'dimObj', i = 'missing', j = 'missing', value = 'ANY'),
          function(x, i, j, value) {
            x@coordinates = value
            x
          })

## * exprData ####

#' @rdname extract-methods
#' @section \code{`[`} methods:
#'   Select rows (i) and cols (j) from giotto S4 exprMat slot
#' @export
setMethod('[', signature(x = 'exprData', i = 'missing', j = 'ANY', drop = 'missing'),
          function(x, i, j) {
            x@exprMat = x@exprMat[, j = j]
            x
          })

#' @rdname extract-methods
#' @export
setMethod('[', signature(x = 'exprData', i = 'ANY', j = 'missing', drop = 'missing'),
          function(x, i, j) {
            x@exprMat = x@exprMat[i = i,]
            x
          })

#' @rdname extract-methods
#' @export
setMethod('[', signature(x = 'exprData', i = 'ANY', j = 'ANY', drop = 'missing'),
          function(x, i, j) {
            x@exprMat = x@exprMat[i = i, j = j]
            x
          })

#' @rdname extract-methods
#' @section \code{`[`} methods:
#'   Return \code{exprMat} slot Matrix object from giotto S4
#' @export
setMethod('[', signature(x = 'exprData', i = 'missing', j = 'missing', drop = 'missing'),
          function(x, i, j) {
            x@exprMat
          })

#' @rdname extract-methods
#' @aliases [<-,exprData,missing,missing,ANY-method [<-,exprData,missing,missing-method
#' @docType methods
#' @section \code{`[<-`} methods:
#'   Assign to \code{exprMat} slot in giotto S4
#' @export
setMethod('[<-', signature(x = 'exprData', i = 'missing', j = 'missing', value = 'ANY'),
          function(x, i, j, value) {
            x@exprMat = value
            x
          })

# * spatNetData ####
#' @rdname extract-methods
#' @section \code{`[`} methods:
#'   Return \code{spatNetData} slot network data.table object from giotto S4
#' @export
setMethod('[', signature(x = 'spatNetData', i = 'missing', j = 'missing', drop = 'missing'),
          function(x, i, j) {
            x@networkDT
          })

#' @rdname extract-methods
#' @aliases [<-,spatNetData,missing,missing,ANY-method [<-,spatNetData,missing,missing-method
#' @docType methods
#' @section \code{`[<-`} methods:
#'   Assign to \code{networkDT} slot in giotto S4
#' @export
setMethod('[<-', signature(x = 'spatNetData', i = 'missing', j = 'missing', value = 'ANY'),
          function(x, i, j, value) {
            x@networkDT = value
            x
          })


# * nnData ####
#' @rdname extract-methods
#' @section \code{`[`} methods:
#'   Return \code{nnData} slot igraph object from giotto S4
#' @export
setMethod('[', signature(x = 'nnData', i = 'missing', j = 'missing', drop = 'missing'),
          function(x, i, j) {
            x@igraph
          })

#' @rdname extract-methods
#' @aliases [<-,nnData,missing,missing,ANY-method [<-,nnData,missing,missing-method
#' @docType methods
#' @section \code{`[<-`} methods:
#'   Assign to \code{igraph} slot in giotto S4
#' @export
setMethod('[<-', signature(x = 'nnData', i = 'missing', j = 'missing', value = 'ANY'),
          function(x, i, j, value) {
            x@igraph = value
            x
          })


# * enrData ####
#' @rdname extract-methods
#' @section \code{`[`} methods:
#'   Return \code{enrData} slot enrichment data.table object from giotto S4
#' @export
setMethod('[', signature(x = 'enrData', i = 'missing', j = 'missing', drop = 'missing'),
          function(x, i, j) {
            x@enrichDT
          })

#' @rdname extract-methods
#' @aliases [<-,enrData,missing,missing,ANY-method [<-,enrData,missing,missing-method
#' @docType methods
#' @section \code{`[<-`} methods:
#'   Assign to \code{enrichDT} slot in giotto S4
#' @export
setMethod('[<-', signature(x = 'enrData', i = 'missing', j = 'missing', value = 'ANY'),
          function(x, i, j, value) {
            x@enrichDT = value
            x
          })

# * spatGridData ####
#' @rdname extract-methods
#' @section \code{`[`} methods:
#'   Return \code{spatGridData} slot data.table object from giotto S4
#' @export
setMethod('[', signature(x = 'spatGridData', i = 'missing', j = 'missing', drop = 'missing'),
          function(x, i, j) {
            x@gridDT
          })

#' @rdname extract-methods
#' @aliases [<-,spatGridData,missing,missing,ANY-method [<-,spatGridData,missing,missing-method
#' @docType methods
#' @section \code{`[<-`} methods:
#'   Assign to \code{gridDT} slot in giotto S4
#' @export
setMethod('[<-', signature(x = 'spatGridData', i = 'missing', j = 'missing', value = 'ANY'),
          function(x, i, j, value) {
            x@gridDT = value
            x
          })

# * giottoPoints ####
#' @rdname extract-methods
#' @section \code{`[`} methods:
#'   Return \code{giottoPoints} spatVector slot
#' @export
setMethod('[', signature(x = 'giottoPoints', i = 'missing', j = 'missing', drop = 'missing'),
          function(x, i, j) {
            x@spatVector
          })

#' @rdname extract-methods
#' @aliases [<-,giottoPoints,missing,missing,ANY-method [<-,giottoPoints,missing,missing-method
#' @docType methods
#' @section \code{`[<-`} methods:
#'   Assign to \code{spatVector} slot in giotto S4
#' @export
setMethod('[<-', signature(x = 'giottoPoints', i = 'missing', j = 'missing', value = 'ANY'),
          function(x, i, j, value) {
            x@spatVector = value
            x
          })

# * giottoPolygon ####
#' @rdname extract-methods
#' @section \code{`[`} methods:
#'   Return \code{giottoPolygon} spatVector slot
#' @export
setMethod('[', signature(x = 'giottoPolygon', i = 'missing', j = 'missing', drop = 'missing'),
          function(x, i, j) {
            x@spatVector
          })

#' @rdname extract-methods
#' @aliases [<-,giottoPolygon,missing,missing,ANY-method [<-,giottoPolygon,missing,missing-method
#' @docType methods
#' @section \code{`[<-`} methods:
#'   Assign to \code{spatVector} slot in giottoPolygon
#' @export
setMethod('[<-', signature(x = 'giottoPolygon', i = 'missing', j = 'missing', value = 'ANY'),
          function(x, i, j, value) {
            x@spatVector = value
            x
          })
