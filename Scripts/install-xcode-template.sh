#!/bin/zsh

# Configuration
CUSTOM_TEMPLATE_DIR_NAME='Screen'
XCODE_TEMPLATE_DIR=$HOME'/Library/Developer/Xcode/Templates/File Templates/'$CUSTOM_TEMPLATE_DIR_NAME
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/Scripts/templates"

createTemplate () {
	echo "==> Creating Xcode file templates..."
	echo "==> $SCRIPT_DIR"

	if [ -d "$XCODE_TEMPLATE_DIR" ]; then
    	rm -R "$XCODE_TEMPLATE_DIR"
  	fi
  	mkdir -p "$XCODE_TEMPLATE_DIR"

  	cp -R $SCRIPT_DIR/*.xctemplate "$XCODE_TEMPLATE_DIR"
  	
    cp -R $SCRIPT_DIR/$CUSTOM_TEMPLATE_DIR_NAME.xctemplate/ownsView/* "$XCODE_TEMPLATE_DIR/$CUSTOM_TEMPLATE_DIR_NAME.xctemplate/ownsViewwithXIB/"
  	cp -R $SCRIPT_DIR/$CUSTOM_TEMPLATE_DIR_NAME.xctemplate/ownsView/* "$XCODE_TEMPLATE_DIR/$CUSTOM_TEMPLATE_DIR_NAME.xctemplate/ownsViewwithStoryboard/"	

    cp -R $SCRIPT_DIR/Domain.xctemplate/domain/* "$XCODE_TEMPLATE_DIR/Domain.xctemplate/domainWithProtocol/"
    cp -R $SCRIPT_DIR/Domain.xctemplate/domain/* "$XCODE_TEMPLATE_DIR/Domain.xctemplate/domainWithDatasource/"
}

createTemplate

echo "==> ... success!"
echo "==> Template have been set up. In Xcode, select 'New File...' to use Custom templates."
