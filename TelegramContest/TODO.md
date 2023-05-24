!when allowed access to pictures - reload data without going back to the first screen
+!alert when access restricted or denied (can be in service layer?) handle this - go to settings (general)
+navigation: from 2nd screen to 1st screen, from 3rd screen to 2nd screen (no need to remove from subview cause of navigation)
3rdVC canvasView + photoView
containerView.frame in DrawingVC should be = imageForDrawing.image.frame (fix it in viewDidLayoutSubviews)
levels of access for classes
fix frame or constraints for tools on drawingVC

canvasView should be bottomAnchor of toolsView.topAnchor

for toolEditorView need toolView
text view should be on canvas view or separate view not on the view of 3rd vc

WEEK

access allowing maybe the probelm is in navigation (module builder or router)
check navigation - when allow all pics - need to back to first vc, doesn't go to the collection view
done button removes keyboard. something else?
clear all clears canvas view and text view. something else?
+color wheel need transfer the color in chosen tool and chosen tool should show chosen color
selected tool should be = system tool (our tools = system pk tools)
+animation for selected tool?
+?color of text in text view? white?
tapping 2 times on the tool should show tool editor view
tapping 1 time on the tool show animation or tool higher
plus button - choose figure - add figure to the canvas view
+save button - save canvas view with drawing and text and figure to the gallery
enum for tools to connect tool that we chose to the pencil kit tool

today

accidential scrolling of text view remove
segmented control fix (need didset?)

