#!/bin/bash
SAXON="/Applications/NetBeans/NetBeans 7.3.1.app//Contents/Resources/NetBeans/ide/modules/ext/saxon9B.jar"
java -cp "$SAXON" net.sf.saxon.Query mapnik2sld.xq input_doc="$1" layer_name="$2" 
