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
imageForDrawing size 
enum for text and drawing and adding text view when choosing text segment (method doesnt work in drawing vc)
access allowing maybe the probelm is in navigation (module builder or router)
