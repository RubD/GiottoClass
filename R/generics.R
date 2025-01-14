
#' @include package_imports.R
#' @include classes.R
NULL


# Giotto Object Settings ####
# Methods and documentations found in methods-IDs.R
setGeneric('spatIDs', function(x, spat_unit, ...) standardGeneric('spatIDs'))
setGeneric('featIDs', function(x, feat_type, ...) standardGeneric('featIDs'))

## instructions ####
# Methods and documentations found in methods-instructions.R
setGeneric('instructions', function(gobject, param, ...) standardGeneric('instructions'))
setGeneric('instructions<-', function(gobject, param, initialize, ..., value) standardGeneric('instructions<-'))

## set defaults ####
# Methods and documentations found in methods-instructions.R
setGeneric('activeSpatUnit', function(gobject, ...) standardGeneric('activeSpatUnit'))
setGeneric('activeSpatUnit<-', function(gobject, ..., value) standardGeneric('activeSpatUnit<-'))


# Methods and documentations found in methods-spatShift.R
setGeneric('spatShift', function(x, ...) standardGeneric('spatShift'))

# Methods and documentations found in methods-overlaps.R
setGeneric('overlaps', function(x, ...) standardGeneric('overlaps'))


# Object Characteristics ####

## nrow() S4 generic ####
if(!isGeneric('nrow')) setOldClass('nrow')
if(!isGeneric('ncol')) setOldClass('ncol')
if(!isGeneric('dim')) setOldClass('dim')
# if(!isGeneric('t')) setOldClass('t', where = as.environment("package:Giotto"))

## colnames and rownames generics ####
if(!isGeneric('colnames')) setOldClass('colnames')
if(!isGeneric('rownames')) setOldClass('rownames')


# copy() S4 generic ####
setGeneric('copy', function(x) standardGeneric('copy'), useAsDefault = data.table::copy)


# Giotto subnesting ####
# All methods and documentations found in methods-nesting.R

## prov() S4 generic ####
setGeneric('prov', function(x) standardGeneric('prov'))
setGeneric('prov<-', function(x, value) standardGeneric('prov<-'))

## spatUnit() S4 generic ####
setGeneric('spatUnit', function(x) standardGeneric('spatUnit'))
setGeneric('spatUnit<-', function(x, value) standardGeneric('spatUnit<-'))

## featType() S4 generic ####
setGeneric('featType', function(x) standardGeneric('featType'))
setGeneric('featType<-', function(x, value) standardGeneric('featType<-'))

## objName() generic ####
setGeneric('objName', function(x) standardGeneric('objName'))
setGeneric('objName<-', function(x, value) standardGeneric('objName<-'))




# coerce ####
setGeneric('as.sf', function(x, ...) standardGeneric('as.sf'))

