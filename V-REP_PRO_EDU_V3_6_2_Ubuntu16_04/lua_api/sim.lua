---@meta

---@class sim
sim = {}

--- Adds a banner to the scene. Banners created in a simulation script will be
--- automatically removed at simulation end. See also sim.removeBanner and
--- sim.addDrawingObject
---@param label string
---@param size number
---@param options number
---@param positionAndEulerAngles? number[]
---@param parentObjectHandle? number
---@param labelColors? number[]
---@param backgroundColors? number[]
---@return number bannerID
function sim.addBanner(label, size, options, positionAndEulerAngles, parentObjectHandle, labelColors, backgroundColors) end

--- Adds a drawing object that will be displayed in the scene. Drawing objects are
--- containers that hold several items of a given type. This can be used for several
--- different applications (simulation of paint, simulation of welding seam, display
--- of 3D objects, etc.). Drawing objects created in a simulation script will be
--- automatically removed at simulation end. See also sim.addDrawingObjectItem,
--- sim.removeDrawingObject and the point cloud functionality.
---@param objectType number
---@param size number
---@param duplicateTolerance number
---@param parentObjectHandle number
---@param maxItemCount number
---@param ambient_diffuse? number[]
---@param _arg6 any
---@param specular? number[]
---@param emission? number[]
---@return number drawingObjectHandle
function sim.addDrawingObject(objectType, size, duplicateTolerance, parentObjectHandle, maxItemCount, ambient_diffuse, _arg6, specular, emission) end

--- Adds an item (or clears all items) to a previously inserted drawing object. See
--- also sim.addDrawingObject and sim.removeDrawingObject
---@param drawingObjectHandle number
---@param itemData table
---@return number result
function sim.addDrawingObjectItem(drawingObjectHandle, itemData) end

--- Adds a non-central force to a shape object that is dynamically enabled. Added
--- forces are cumulative, and are reset to zero after sim.handleDynamics was called
--- (or by using the following flag: sim.handleflag_resetforcetorque). See also
--- sim.addForceAndTorque.
---@param shapeHandle number
---@param position number[]
---@param force number[]
---@return number result
function sim.addForce(shapeHandle, position, force) end

--- Adds a force and/or torque to a shape object that is dynamically enabled.
--- Forces are applied at the center of mass. Added forces and torques are
--- cumulative, and are reset to zero after sim.handleDynamics was called (or by
--- using the following flags: sim.handleflag_resetforce and/or
--- sim.handleflag_resettorque). See also sim.addForce.
---@param shapeHandle number
---@param force number[]
---@param torque number[]
---@return number result
function sim.addForceAndTorque(shapeHandle, force, torque) end

--- Adds a light copy of a shape in its current configuration, as a ghost object.
--- Ghosts have a visual start and end time, and are automatically played back
--- during simulation (i.e. visualized), but they do not influence a simulation
--- otherwise. Ghost are a convenient way to visually compare several simulation
--- runs. Ghosts can be modified or cleared with sim.modifyGhost. Ghosts can also be
--- cleared in the environment properties.
---@param ghostGroup number
---@param objectHandle number
---@param options number
---@param startTime number
---@param endTime number
---@param color? number[]
---@return number ghostId
function sim.addGhost(ghostGroup, objectHandle, options, startTime, endTime, color) end

--- Adds an object (or a group of objects) to a collection. See also
--- sim.emptyCollection, sim.removeCollection, sim.getCollectionHandle,
--- sim.getObjectHandle, sim.getCollectionObjects and sim.createCollection.
---@param collectionHandle number
---@param objectHandle number
---@param what number
---@param options number
---@return number result
function sim.addObjectToCollection(collectionHandle, objectHandle, what, options) end

--- Adds an object to the selection. See also sim.removeObjectFromSelection and
--- sim.getObjectSelection.
---@param what number
---@param objectHandle? number
---@return There are
function sim.addObjectToSelection(what, objectHandle) end

--- Adds a particle object that will be simulated and displayed in the scene.
--- Particle objects are containers that hold several items (particles) of a given
--- type. This can be used for several different applications (e.g. simulation of
--- air/water jets) See also sim.addParticleObjectItem and sim.removeParticleObject
---@param objectType number
---@param size number
---@param density number
---@param parameters table
---@param lifeTime number
---@param maxItemCount number
---@param ambient_diffuse? number[]
---@param _arg7 any
---@param specular? number[]
---@param emission? number[]
---@return number particleObjectHandle
function sim.addParticleObject(objectType, size, density, parameters, lifeTime, maxItemCount, ambient_diffuse, _arg7, specular, emission) end

--- Adds an item (or clears all items) to a previously inserted particle object.
--- See also sim.addParticleObject and sim.removeParticleObject
---@param particleObjectHandle number
---@param itemData table
---@return number result
function sim.addParticleObjectItem(particleObjectHandle, itemData) end

--- Inserts a new script. Use with care when simulation is running. See also
--- sim.associateScriptWithObject.
---@param scriptType number
---@return number scriptHandle
function sim.addScript(scriptType) end

--- Adds a message to the status bar. See also sim.auxiliaryConsoleOpen.
---@param message string
---@return number result
function sim.addStatusbarMessage(message) end

--- Adjusts parameters of a view. See also the sim.floatingViewAdd and
--- sim.cameraFitToView functions.
---@param viewHandleOrIndex number
---@param associatedViewableObjectHandle number
---@param options number
---@param viewLabel? string
---@return number result
function sim.adjustView(viewHandleOrIndex, associatedViewableObjectHandle, options, viewLabel) end

--- Announces a change in the scene. This is required for the undo/redo function to
--- operate properly when performing changes via the API. Only call this function
--- directly after a change was made through a dialog element (e.g. a checkbox was
--- checked/unchecked) and that change was reported to the scene (e.g. with
--- sim.writeCustomDataBlock). What this call will do is following: the whole scene
--- will be serialized (saved) to memory as a "scene image" and compared to a
--- previously memorized "scene image". If both images are same, then the last image
--- is discarded, otherwise only the changes between the two images are memorized. A
--- call to this function has no effect (and doesn't generate any error) when called
--- during simulation or when in edit mode.
---@return number result
function sim.announceSceneContentChange() end

--- Applies changes made during milling operations to a cuttable object (e.g. a
--- shape). This requires some calculation time. Once changes were applied, they
--- cannot be reset anymore. If the milling operation milled away the whole object,
--- then the object is removed from the scene. The calculation structure linked to
--- the object is removed and an updated calculation structure might be calculated
--- (might take some calculation time). See also sim.resetMilling, sim.handleMill
--- and sim.resetMill.
---@param objectHandle number
---@return number result
function sim.applyMilling(objectHandle) end

--- Sets the associated object of a child script. Use with care when simulation is
--- running. See also sim.getObjectAssociatedWithScript, sim.addScript and
--- sim.setScriptText.
---@param scriptHandle number
---@param objectHandle number
---@return number result
function sim.associateScriptWithObject(scriptHandle, objectHandle) end

--- Closes an auxiliary console window. See also sim.auxiliaryConsoleOpen.
---@param consoleHandle number
---@return number result
function sim.auxiliaryConsoleClose(consoleHandle) end

--- Opens an auxiliary console window for text display. This console window is
--- different from the application main console window. Console window handles are
--- shared across all simulator scenes. See also sim.auxiliaryConsolePrint,
--- sim.auxiliaryConsoleClose and sim.addStatusbarMessage.
---@param title string
---@param maxLines number
---@param mode number
---@param position? number[]
---@param size? number[]
---@param textColor? number[]
---@param backgroundColor? number[]
---@return number consoleHandle
function sim.auxiliaryConsoleOpen(title, maxLines, mode, position, size, textColor, backgroundColor) end

--- Prints to an auxiliary console window. See also sim.auxiliaryConsoleOpen.
---@param consoleHandle number
---@param text string
---@return number result
function sim.auxiliaryConsolePrint(consoleHandle, text) end

--- Shows or hides an auxiliary console window. See also sim.auxiliaryConsoleOpen
--- and sim.auxiliaryConsoleClose.
---@param consoleHandle number
---@param showState Boolean
---@return number result
function sim.auxiliaryConsoleShow(consoleHandle, showState) end

--- Performs a 32-bit Boolean AND operation between two numbers. See also
--- sim.boolOr32 and sim.boolXor32.
---@param value1 number first value
---@param value2 number second value
---@return number result
function sim.boolAnd32(value1, value2) end

--- Performs a 32-bit Boolean OR operation between two numbers. See also
--- sim.boolAnd32 and sim.boolXor32.
---@param value1 number first value
---@param value2 number second value
---@return number result
function sim.boolOr32(value1, value2) end

--- Performs a 32-bit Boolean exclusive-OR operation between two numbers. See also
--- sim.boolAnd32 and sim.boolOr32.
---@param value1 number first value
---@param value2 number second value
---@return number result
function sim.boolXor32(value1, value2) end

--- Allows breaking a force sensor during simulation. A broken force sensor will
--- lose its positional and orientational constraints. See also sim.readForceSensor.
---@param objectHandle number
---@return number result
function sim.breakForceSensor(objectHandle) end

--- Builds an identity transformation matrix. See also the other
--- matrix/transformation functions
---@return number[] matrix
function sim.buildIdentityMatrix() end

--- Builds a transformation matrix based on a position vector and Euler angles. See
--- also the other matrix/transformation functions.
---@param position number[] table to 3 numbers representing the position component
---@param eulerAngles number[] table to 3 numbers representing the angular component
---@return number[] matrix
function sim.buildMatrix(position, eulerAngles) end

--- Builds a transformation matrix based on a position vector and a quaternion. See
--- also the other matrix/transformation functions.
---@param position number[] table of 3 numbers representing the position component
---@param quaternion number[] table of 4 numbers representing the orientation quaternion (x,y,z,w)
---@return number[] matrix
function sim.buildMatrixQ(position, quaternion) end

--- Calls a script function (from a plugin, the main client application, or from
--- another script). This represents a callback inside of a script. Call this only:
--- a) from the main thread, or: b) from a thread that originated from a threaded
--- child script. In that case, you cannot call non-threaded child scripts. When
--- calling simulation scripts, then simulation must be running. See also
--- sim.executeScriptString and sim.setScriptVariable.
---@param functionNameAtScriptName string a string representing the function name and script name, e.g
---@param scriptHandleOrType number the handle of the script, otherwise the type of the script:
---@param _arg2 any
---@return any ...
function sim.callScriptFunction(functionNameAtScriptName, scriptHandleOrType, _arg2) end

--- Shifts and adjusts a camera associated with a view to fill the view entirely
--- with the specified objects or models. See also the sim.adjustView and
--- sim.floatingViewAdd functions.
---@param viewHandleOrIndex number
---@param objectHandles? table
---@param options? simInt
---@param scaling? simFloat
---@return number result
function sim.cameraFitToView(viewHandleOrIndex, objectHandles, options, scaling) end

--- Checks whether two entities are colliding. Detection is silent (no visual
--- feedback) compared to sim.handleCollision. Also, the collidable flags of the
--- entities are overridden if the entities are objects. See also sim.readCollision
--- and sim.checkCollisionEx.
---@param entity1Handle number
---@param entity2Handle number
---@return number result
function sim.checkCollision(entity1Handle, entity2Handle) end

--- Checks whether two entities are colliding. This is the extended functionality
--- version of sim.checkCollision, and will return all intersections between the two
--- entities. Detection is silent (no visual feedback) compared to
--- sim.handleCollision. Also, the collidable flags of the entities are overridden
--- if the entities are objects. See also sim.readCollision.
---@param entity1Handle number handle of entity 1 (can be an object handle or a collection handle)
---@param entity2Handle number handle of entity 2 (can be an object handle or a collection handle), or sim.handle_all to check entity1 against all other collidable objects
---@return number result
---@return table intersections
function sim.checkCollisionEx(entity1Handle, entity2Handle) end

--- Checks the minimum distance between two entities. Detection is silent (no
--- visual feedback) compared to sim.handleDistance. Also, the measurable flags of
--- the entities are overridden if the entities are objects. See also
--- sim.readDistance.
---@param entity1Handle number handle of entity 1 (can be an object handle or a collection handle)
---@param entity2Handle number handle of entity 2 (can be an object handle or a collection handle), or sim.handle_all to check entity1 against all other measurable objects
---@param threshold number if distance is bigger than the threshold, the distance is not calculated and result is 0. If threshold is 0 or negative, then no threshold is used
---@return number result
---@return number[] distanceData
function sim.checkDistance(entity1Handle, entity2Handle, threshold) end

--- Solves a registered IK group, but unlike the sim.handleIkGroup function,
--- sim.checkIkGroup will not apply the calculated joint values, but instead return
--- them in an array. See also sim.handleIkGroup, sim.computeJacobian and
--- sim.generateIkPath.
---@param ikGroupHandle number
---@param jointHandles table
---@param jointOptions? table
---@return number ikCalculationResult
---@return table jointValues
function sim.checkIkGroup(ikGroupHandle, jointHandles, jointOptions) end

--- Checks whether the provided points collide with the octree voxels. See also
--- sim.insertVoxelsIntoOctree and the other octree related functions.
---@param octreeHandle number
---@param options number
---@param points table
---@return number result
---@return number tag
---@return number locationLow
---@return number locationHigh
function sim.checkOctreePointOccupancy(octreeHandle, options, points) end

--- Checks whether the proximity sensor detects the indicated entity. Detection is
--- silent (no visual feedback) compared to sim.handleProximitySensor. Also, the
--- detectable flags of the entity are overridden if the entity is an object. See
--- also sim.readProximitySensor and sim.checkProximitySensorEx.
---@param sensorHandle number handle of the proximity sensor object
---@param entityHandle number handle of entity to detect (object or collection), or sim.handle_all to detect all detectable objects
---@return number result
---@return number distance
---@return number[] detectedPoint
function sim.checkProximitySensor(sensorHandle, entityHandle) end

--- Checks whether the proximity sensor detects the indicated entity. This is the
--- extended functionality version of sim.checkProximitySensor. Detection is silent
--- (no visual feedback) compared to sim.handleProximitySensor. Also, the detectable
--- flags of the entity are overridden if the entity is an object. see also
--- sim.readProximitySensor and sim.checkProximitySensorEx2.
---@param sensorHandle number handle of the proximity sensor object
---@param entityHandle number handle of entity to detect (object or collection), or sim.handle_all to detect all detectable objects
---@param detectionMode number bit coded: bit0 (1) for front face detection, bit1 (2) for back face detection (bit0|bit1 needs to be true), bit2 (4) for fast detection (doesn't search for the closest point, just any point in the detection volume), bit3 (8) for limited angle detection (if set, maxAngle is taken into account)
---@param detectionthreshold number
---@param maxAngle number maximum detection angle (angle between detection ray and normal vector of the surface). Can be (0;pi/2). Only if bit3 of detectionMode is set will this parameter have an effect. Use this to realistically simulate ultrasonic sensors
---@return number result
---@return number distance
---@return number[] detectedPoint
---@return number detectedObjectHandle
---@return number[] surfaceNormalVector
function sim.checkProximitySensorEx(sensorHandle, entityHandle, detectionMode, detectionthreshold, maxAngle) end

--- Checks whether the proximity sensor detects the indicated points, segments or
--- triangles. Detection is silent (no visual feedback). See also
--- sim.readProximitySensor and sim.checkProximitySensorEx.
---@param sensorHandle number handle of the proximity sensor object
---@param vertices table a table containing vertices
---@param itemType number 0 for points, 1 for segments and 2 for triangles
---@param itemCount number the number of items that the 'vertices' table contains
---@param mode number
---@param threshold number
---@param maxAngle number
---@return number result
---@return number distance
---@return number[] detectedPoint
---@return number[] normalVector
function sim.checkProximitySensorEx2(sensorHandle, vertices, itemType, itemCount, mode, threshold, maxAngle) end

--- Checks whether the vision sensor detects the indicated entity. Detection is
--- silent (no visual feedback) compared to sim.handleVisionSensor. Also, the
--- renderable flag of the entity is overridden if the entity is an object. See also
--- sim.readVisionSensor and sim.checkVisionSensorEx.
---@param sensorHandle number handle of the vision sensor object
---@param entityHandle number handle of entity to detect (object or collection), or sim.handle_all to detect all detectable objects
---@return number result
---@return table auxiliaryValuePacket1
---@return table auxiliaryValuePacket2
---@return any etc.
function sim.checkVisionSensor(sensorHandle, entityHandle) end

--- Checks whether the vision sensor detects the indicated entity. This is the
--- extended functionality version of sim.checkVisionSensor. Detection is silent (no
--- visual feedback) compared to sim.handleVisionSensor. Also, the renderable flag
--- of the entity is overridden if the entity is an object. See also
--- sim.readVisionSensor.
---@param sensorHandle number
---@param entityHandle number
---@param returnImage boolean
---@return table buffer
function sim.checkVisionSensorEx(sensorHandle, entityHandle, returnImage) end

--- Clears a double signal (removes it). See also the other signal functions.
---@param signalName string
---@return number result
function sim.clearDoubleSignal(signalName) end

--- Clears an integer signal (removes it). See also the other signal functions.
---@param signalName string
---@return number result
function sim.clearIntegerSignal(signalName) end

--- Clears a string signal (removes it). See also the other signal functions.
---@param signalName string
---@return number result
function sim.clearStringSignal(signalName) end

--- Releases resources reserved with the sim.openModule command. This command can
--- only be called from the main script. Call it from the main script in the last
--- simulation pass (usually with sim.handle_all argument). sim.closeModule is not
--- available in the C-API. Look at the default main script to get an idea about how
--- to use sim.openModule, sim.handleModule and simCloseModule.
---@param sim? number
---@return number result
function sim.closeModule(sim) end

--- Closes current scene, and switches to another open scene. If there is no other
--- open scene, a new scene is then created. Can only be called from an add-on, or
--- from the sanbox script, when called from Lua. See also sim.loadScene and
--- sim.saveScene.
---@return number result
function sim.closeScene() end

--- Combines two RGB images. See also sim.transformImage.
---@param img1 string input image 1, as succession of rgb values
---@param img1Res number[] x/y resolution of image 1
---@param img2 string input image 2, as succession of rgb values
---@param img2Res number[] x/y resolution of image 2
---@param operation number
---@return string outImg
function sim.combineRgbImages(img1, img1Res, img2, img2Res, operation) end

--- Computes the Jacobian of a registered IK group. The result can then be read via
--- sim.getIkGroupMatrix. See also sim.handleIkGroup and sim.checkIkGroup.
---@param ikGroupHandle number
---@param options number
---@return number result
function sim.computeJacobian(ikGroupHandle, options) end

--- Computes and applies the mass and inertia properties for a convex shape (or
--- convex compound shape), based on a density value. If call this function while
--- the simulation is running, you will have to call sim.resetDynamicObject upon the
--- object, for the changes to take effect. See also sim.getShapeMassAndInertia and
--- sim.convexDecompose.
---@param shapeHandle number
---@param density number
---@return number result
function sim.computeMassAndInertia(shapeHandle, density) end

--- Calculates the convex decomposition of a shape using the HACD or V-HACD
--- algorithms. See also sim.getQHull, sim.getDecimatedMesh, sim.ungroupShape and
--- sim.computeMassAndInertia.
---@param shapeHandle number
---@param options number
---@param intParams number[]
---@param floatParams number[]
---@return number shapeHandle
function sim.convexDecompose(shapeHandle, options, intParams, floatParams) end

--- Copies a transformation matrix. See also the other matrix/transformation
--- functions.
---@param matrixIn number[] matrix to be copied
---@return number[] matrixOut
function sim.copyMatrix(matrixIn) end

--- Copies and pastes objects, together with all their associated calculation
--- objects and associated scripts. See also sim.removeObject and sim.removeModel.
---@param objectHandles table
---@param options number
---@return table copiedObjectHandles
function sim.copyPasteObjects(objectHandles, options) end

--- Creates a new collection. See also sim.removeCollection and
--- sim.addObjectToCollection.
---@param collectionName string
---@param options number
---@return number collectionHandle
function sim.createCollection(collectionName, options) end

--- Creates a dummy.
---@param size number
---@param color? number[]
---@return number dummyHandle
function sim.createDummy(size, color) end

--- Creates a force sensor.
---@param options number
---@param intParams number[]
---@param floatParams number[]
---@param color? number[]
---@return number sensorHandle
function sim.createForceSensor(options, intParams, floatParams, color) end

--- Creates a heightfield shape. See also sim.createPureShape, sim.createMeshShape
--- and sim.addParticleObject.
---@param options number
---@param shadingAngle number
---@param xPointCount number
---@param yPointCount number
---@param xSize number
---@param heights table
---@return number objectHandle
function sim.createHeightfieldShape(options, shadingAngle, xPointCount, yPointCount, xSize, heights) end

--- Creates an IK element. See also sim.createIkGroup.
---@param ikGroupHandle number
---@param options number
---@param intParams table
---@param floatParams? table
---@return number result
function sim.createIkElement(ikGroupHandle, options, intParams, floatParams) end

--- Creates an IK group. See also sim.removeIkGroup and sim.createIkElement.
---@param options number
---@param intParams? table
---@param floatParams? table
---@return number ikGroupHandle
function sim.createIkGroup(options, intParams, floatParams) end

--- Creates a joint. See also sim.setJointInterval.
---@param jointType number
---@param jointMode number
---@param options number
---@param sizes? number[]
---@param colorA? number[]
---@param colorB? number[]
---@return number jointHandle
function sim.createJoint(jointType, jointMode, options, sizes, colorA, colorB) end

--- Creates a mesh shape. See also sim.createPureShape, sim.createHeightfieldShape
--- and sim.getShapeMesh, and see sim.importMesh for a usage example.
---@param options number Bit-coded: if bit0 is set (1), backfaces are culled. If bit1 is set (2), edges are visible
---@param shadingAngle number the shading angle
---@param vertices table a table of vertices
---@param indices table a table of indices
---@return number objectHandle
function sim.createMeshShape(options, shadingAngle, vertices, indices) end

--- Creates an empty octree. See also sim.removeObject and the other octree related
--- functions.
---@param voxelSize number
---@param options number
---@param pointSize number
---@return number handle
function sim.createOctree(voxelSize, options, pointSize) end

--- Creates a path object. See also sim.insertPathCtrlPoints and
--- sim.cutPathCtrlPoints.
---@param attributes number
---@param intParams? number[]
---@param floatParams? number[]
---@param color? number[]
---@return number pathHandle
function sim.createPath(attributes, intParams, floatParams, color) end

--- Creates an empty point cloud. See also sim.removeObject,
--- sim.setPointCloudOptions and the other point cloud related functions.
---@param maxVoxelSize number
---@param maxPtCntPerVoxel number
---@param options number
---@param pointSize number
---@return number handle
function sim.createPointCloud(maxVoxelSize, maxPtCntPerVoxel, options, pointSize) end

--- Creates a proximity sensor.
---@param sensorType number
---@param subType number
---@param options number
---@param intParams number[]
---@param floatParams number[]
---@param color? number[]
---@return number sensorHandle
function sim.createProximitySensor(sensorType, subType, options, intParams, floatParams, color) end

--- Creates a pure primitive shape. See also sim.createMeshShape,
--- sim.createHeightfieldShape and sim.addParticleObject.
---@param primitiveType number
---@param options number
---@param sizes number[]
---@param mass number
---@param precision? number[]
---@return number objectHandle
function sim.createPureShape(primitiveType, options, sizes, mass, precision) end

--- Creates a planar shape, that will be textured with a new, or imported texture.
--- See also sim.getTextureId, sim.readTexture, sim.writeTexture and
--- sim.setShapeTexture.
---@param fileName string
---@param options number
---@param planeSizes? number[]
---@param scalingUV? number[]
---@param xy_g? number[]
---@param fixedResolution? number
---@param resolution? number[]
---@return number shapeHandle
---@return number textureId
---@return number[] resolution
function sim.createTexture(fileName, options, planeSizes, scalingUV, xy_g, fixedResolution, resolution) end

--- Creates a vision sensor.
---@param options number
---@param intParams number[]
---@param floatParams number[]
---@param color? number[]
---@return number sensorHandle
function sim.createVisionSensor(options, intParams, floatParams, color) end

--- Removes one or several control points from a path object. See also
--- sim.insertPathCtrlPoints and sim.createPath.
---@param pathHandle number
---@param startIndex number
---@param ptCnt number
---@return number result
function sim.cutPathCtrlPoints(pathHandle, startIndex, ptCnt) end

--- Displays a generic dialog box. Use in conjunction with sim.getDialogResult
--- ,sim.getDialogInput and sim.endDialog. From C, the function will only create
--- non-modal dialogs (non-blocking), from Lua, modal dialogs can be created if
--- called from a child script that runs in a thread. Use custom user interfaces
--- instead if a higher customization level is required. Dialogs displayed from a
--- main script or a child script will automatically close at simulation end. See
--- also sim.msgBox and sim.fileDialog.
---@param titleText string Title bar text
---@param mainText string information text
---@param dialogType number generic dialog style
---@param modalDialog boolean specifies whether the dialog is modal. Modal dialogs are only allowed when not called from the main thread
---@param initialText string Initial text in the edit box if the dialog is of type sim_dlgstyle_input. Can be nil or omitted
---@return number dialogHandle
function sim.displayDialog(titleText, mainText, dialogType, modalDialog, initialText) end

--- Clears a collection from all the objects it contains. An empty collection will
--- not survive, unless you add some objects to it again with
--- sim.addObjectToCollection right after. See also sim.removeCollection.
---@param collectionHandle number
---@return number result
function sim.emptyCollection(collectionHandle) end

--- Closes and releases resource from a previous call to sim.displayDialog. Even if
--- the dialog is not visible anymore, you should release resources by using this
--- function (however at the end of a simulation, all dialog resources allocated
--- from a main script or a child script are automatically released).
---@param genericDialogHandle number
---@return number result
function sim.endDialog(genericDialogHandle) end

--- Executes some Lua code in a specific script (from a plugin, the main client
--- application, or from another script). Call this only: a) from the main thread,
--- or: b) from a thread that originated from a threaded child script. In that case,
--- you cannot call non-threaded child scripts. When calling simulation scripts,
--- then simulation must be running. See also sim.callScriptFunction. Data exchange
--- between a plugin and a script happens via a stack. Reading and writing arguments
--- from/to the stack gives you a maximum of flexibility, and you wil be able to
--- exchange also complex data structures. But it can also be tedious and error
--- prone. Use instead the helper classes located in programming/common/stack and
--- programming/include/stack: they will greatly simplify the task. Have a look at
--- the example plugins v_repExtSkeletonPlugin and v_repExtSkeletonPluginNG.
---@param stringAtScriptName string
---@param scriptHandleOrType number
---@return number result
---@return any executionResult
function sim.executeScriptString(stringAtScriptName, scriptHandleOrType) end

--- Exports the IK content of a scene. The generated file can be used with the
--- external IK, to do IK computations in an external application.
---@param pathAndFilename string
---@return number result
function sim.exportIk(pathAndFilename) end

--- Exports a mesh to a file. See also sim.importMesh and sim.getShapeMesh
---@param fileformat number same as C function
---@param pathAndFilename string same as C function
---@param options number same as C function
---@param scalingFactor number same as C function
---@param vertices table_of_table a table of vertice tables. See the example below
---@param indices table_of_table a table of indice tables. See the example below
---@return number result
function sim.exportMesh(fileformat, pathAndFilename, options, scalingFactor, vertices, indices) end

--- Opens a dialog that allows selecting a file for save or load operations, or a
--- folder. See also sim.msgBox.
---@param mode number
---@param title string
---@param startPath string
---@param initName string
---@param extName string
---@param ext string
---@return string pathAndName
function sim.fileDialog(mode, title, startPath, initName, extName, ext) end

--- Adds a floating view to current page. See also the sim.floatingViewRemove,
--- sim.adjustView and sim.cameraFitToView functions.
---@param posX number
---@param posY number
---@param sizeX number
---@param sizeY number
---@param options number
---@return number floatingViewHandle
function sim.floatingViewAdd(posX, posY, sizeX, sizeY, options) end

--- Removes a floating view previously added with sim.floatingViewAdd.
---@param floatingViewHandle number
---@return number result
function sim.floatingViewRemove(floatingViewHandle) end

--- Moves an object along a path object. This function can only be called from
--- child scripts running in a thread (since this is a blocking operation) and is
--- not available from the C-API. See also sim.rmlPos, sim.rmlVel and
--- sim.moveToObject.
---@param objectHandle number handle of the object to be moved
---@param pathHandle number handle of the path object
---@param positionAndOrOrientation number a value between 1 and 3 (1: only position is modified, 2: only orientation is modified, 3: position and orientation is modified). Can be nil in which case 3 is applied
---@param relativeDistanceOnPath number a value between 0 and 1, where 0 is the beginning of the path, and 1 the end of the path. Make sure you selected the appropriate path length calculation method (refer to the
---@param velocity number movement nominal velocity
---@param accel number the acceleration/deceleration
---@return number deltaTimeLeft
function sim.followPath(objectHandle, pathHandle, positionAndOrOrientation, relativeDistanceOnPath, velocity, accel) end

--- Generates a path that drives a robot from its current configuration to its
--- target dummy in a straight line (i.e. shortest path in Cartesian space). The
--- function returns NULL if the robot is not able to perform the movement with its
--- end-effector, the reasons can be: there are collisions on the way, or some of
--- the points on the line cannot be reached (e.g. out of reach, or due to joint
--- limits)
---@param ikGroupHandle number
---@param jointHandles table
---@param ptCnt number
---@param collisionPairs? table
---@param jointOptions? table
---@return table path
function sim.generateIkPath(ikGroupHandle, jointHandles, ptCnt, collisionPairs, jointOptions) end

--- Retrieves all API functions and variables that match a specific word. Useful
--- for script code auto-completion functionality. See also sim.getApiInfo.
---@param scriptHandleOrType number
---@param apiWord string
---@return table funcsAndVars
function sim.getApiFunc(scriptHandleOrType, apiWord) end

--- Returns the call tip (or info text) for an API function or variable. See also
--- sim.getApiFunc.
---@param scriptHandleOrType number
---@param apiWord string
---@return string info
function sim.getApiInfo(scriptHandleOrType, apiWord) end

--- Retrieves 3 values from an array. See the array parameter identifiers. See also
--- sim.setArrayParameter, sim.getBoolParameter, sim.getInt32Parameter,
--- sim.getFloatParameter and sim.getStringParameter.
---@param parameter number
---@return table parameterValues
function sim.getArrayParameter(parameter) end

--- Retrieves a boolean value. See the Boolean parameter identifiers. See also
--- sim.setBoolParameter, sim.getInt32Parameter, sim.getFloatParameter,
--- sim.getArrayParameter and sim.getStringParameter.
---@param parameter number
---@return boolean boolState
function sim.getBoolParameter(parameter) end

--- Retrieves the intrinsic relative position on a path that is closest to the
--- specified point. The returned value is dependent on the selected path length
--- calculation method for the given path object. See also sim.getPathPosition,
--- sim.getPathLength, sim.getPositionOnPath and sim.getOrientationOnPath.
---@param pathHandle number handle of the path object
---@param relativePosition number[] a table containing a point in relative coordinates (x, y and z)
---@return number positionOnPath
function sim.getClosestPositionOnPath(pathHandle, relativePosition) end

--- Retrieves a collection handle based on its name. The operation of this function
--- depends on the current name suffix settings (see sim.getNameSuffix,
--- sim.setNameSuffix, and the section on accessing general-type objects). See also
--- sim.createCollection, sim.addObjectToCollection, sim.getCollectionObjects and
--- sim.isHandleValid.
---@param collectionName string
---@return number collectionHandle
function sim.getCollectionHandle(collectionName) end

--- Retrieves the name of a collection based on its handle. See also
--- sim.setCollectionName.
---@param collectionHandle number
---@return string collectionName
function sim.getCollectionName(collectionHandle) end

--- Retrieves the object handles that compose a given collection.
---@param collectionHandle number
---@return table objectHandles
function sim.getCollectionObjects(collectionHandle) end

--- Searches for a manipulator configuration that matches a given end-effector
--- position/orientation in space. Search is randomized.
---@param ikGroupHandle number
---@param jointHandles table
---@param distanceThreshold number
---@param maxTimeInMs number
---@param metric? number[]
---@param collisionPairs? table
---@param jointOptions? table
---@param lowLimits? table
---@param ranges? table
---@return table jointPositions
function sim.getConfigForTipPose(ikGroupHandle, jointHandles, distanceThreshold, maxTimeInMs, metric, collisionPairs, jointOptions, lowLimits, ranges) end

--- Retrieves configuration information for a hierarchy tree (object relative
--- positions/orientations, joint/path values). Calling sim.setConfigurationTree at
--- a later time, will restore the object configuration (use this function to
--- temporarily save object positions/orientations/joint/path values)
---@param objectHandle number
---@return number rawBufferHandle
function sim.getConfigurationTree(objectHandle) end

--- Retrieves contact point information of a dynamic simulation pass.
---@param dynamicPass number
---@param objectHandle number
---@param index number
---@return number[] collidingObjects
---@return number[] collisionPoint
---@return number[] reactionForce
---@return number[] normalVector
function sim.getContactInfo(dynamicPass, objectHandle, index) end

--- Retrieves a customization script's handle based on its associated object. See
--- also sim.getObjectAssociatedWithScript and sim.getScriptAssociatedWithObject.
---@param objectHandle number
---@return number scriptHandle
function sim.getCustomizationScriptAssociatedWithObject(objectHandle) end

--- Retrieves interpolated user data along a path object. See also
--- sim.getPositionOnPath, sim.getOrientationOnPath, sim.getPathPosition and
--- sim.getClosestPositionOnPath.
---@param pathHandle number
---@param relativeDistance number
---@return number auxFlags
---@return number[] auxChannels
function sim.getDataOnPath(pathHandle, relativeDistance) end

--- Retrieves a decimated mesh (i.e. a simplified mesh). See also
--- sim.convexDecompose and sim.getQHull.
---@param verticesIn table a table containing the input vertices (succession of x/y/z values)
---@param indicesIn table a table containing the input indices (3 values for each triangle)
---@param decimationPercentage number the percentage of the desired decimation (0.1-0.9)
---@return table verticesOut
---@return table indicesOut
function sim.getDecimatedMesh(verticesIn, indicesIn, decimationPercentage) end

--- Queries the text of the edit box of a generic dialog box of style
--- sim_dlgstyle_input. To be used after sim.displayDialog was called and after
--- sim.getDialogResult returned sim.dlgret_ok
---@param genericDialogHandle number
---@return string input
function sim.getDialogInput(genericDialogHandle) end

--- Queries the result of a dialog box. To be used after sim.displayDialog was
--- called
---@param genericDialogHandle number
---@return number result
function sim.getDialogResult(genericDialogHandle) end

--- Retrieves the handle of a distance object. The operation of this function
--- depends on the current name suffix settings (see sim.getNameSuffix,
--- sim.setNameSuffix, and the section on accessing general-type objects). See also
--- sim.isHandleValid.
---@param distanceObjectName string
---@return number distanceObjectHandle
function sim.getDistanceHandle(distanceObjectName) end

--- Gets the value of a double signal. Signals are cleared at simulation start. See
--- also sim.setDoubleSignal, the other signal functions, and
--- sim.persistentDataRead.
---@param signalName string name of the signal
---@return number signalValue
function sim.getDoubleSignal(signalName) end

--- Retrieves a Boolean value from the physics engine properties. See also the
--- other engine properties setter and getter API functions.
---@param paramId number
---@param objectHandle number
---@return boolean boolParam
function sim.getEngineBoolParameter(paramId, objectHandle) end

--- Retrieves a float value from the physics engine properties. See also the other
--- engine properties setter and getter API functions.
---@param paramId number
---@param objectHandle number
---@return number floatParam
function sim.getEngineFloatParameter(paramId, objectHandle) end

--- Retrieves an int32 value from the physics engine properties. See also the other
--- engine properties setter and getter API functions.
---@param paramId number
---@param objectHandle number
---@return number int32Param
function sim.getEngineInt32Parameter(paramId, objectHandle) end

--- Retrieves the Euler angles from a transformation matrix. See also the other
--- matrix/transformation functions.
---@param matrix number[] table to 12 numbers (the last row of the 4x4 matrix (0,0,0,1) is not needed). Table values in Lua are indexed from 1, not 0!
---@return number[] eulerAngles
function sim.getEulerAnglesFromMatrix(matrix) end

--- Retrieves the explicit handling flags for a general object. See also
--- sim.setExplicitHandling.
---@param generalObjectHandle number
---@return number explicitHandlingFlags
function sim.getExplicitHandling(generalObjectHandle) end

--- Retrieves a string that describes additional environment or object properties,
--- mainly used by extension plugins.
---@param objectHandle number
---@param index number
---@param key? string
---@return string theString
function sim.getExtensionString(objectHandle, index, key) end

--- Retrieves a floating point value. See the floating-point parameter identifiers.
--- See also sim.setFloatParameter, sim.getBoolParameter, sim.getInt32Parameter,
--- sim.getArrayParameter and sim.getStringParameter.
---@param parameter number parameter identifier (sim_floatparam_...)
---@return number parameterValue
function sim.getFloatParameter(parameter) end

--- Retrieves the handle of an IK group. The operation of this function depends on
--- the current name suffix settings (see sim.getNameSuffix, sim.setNameSuffix, and
--- the section on accessing general-type objects). See also sim.isHandleValid.
---@param ikGroupName string
---@return number ikGroupHandle
function sim.getIkGroupHandle(ikGroupName) end

--- Retrieves various information from an IK group, such as the Jacobian. For the
--- result to be valid, the Jacobian must previously have been computed via the
--- sim.computeJacobian, sim.handleIkGroup or sim.checkIkGroup functions. Following
--- situations have to be differentiated: a) If you call sim.computeJacobian just
--- before calling sim.getIkGroupMatrix, then the returned Jacobian will be the one
--- at the current state/configuration of the mechanism. This is the recommended way
--- to retrieve the Jacobian. b) If you call sim.handleIkGroup or sim.checkIkGroup
--- just before calling sim.getIkGroupMatrix, then the returned Jacobian will be the
--- one computed last, while trying to reach the target (since it usually takes at
--- least 2-3 iterations to reach a target because of the linearization), which is
--- not the current state/configuration of the mechanism, unless the target overlaps
--- the tip. See also sim.getIkGroupHandle.
---@param ikGroupHandle number
---@param options number
---@return table matrix
---@return number[] matrixSize
function sim.getIkGroupMatrix(ikGroupHandle, options) end

--- Retrieves an integer value. See the integer parameter identifiers. See also
--- sim.setInt32Parameter, sim.getBoolParameter, sim.getFloatParameter,
--- sim.getArrayParameter and sim.getStringParameter.
---@param parameter number parameter identifier (sim_intparam_...)
---@return number parameterValue
function sim.getInt32Parameter(parameter) end

--- Gets the value of an integer signal. Signals are cleared at simulation start.
--- See also sim.setIntegerSignal, the other signal functions, and
--- sim.persistentDataRead.
---@param signalName string name of the signal
---@return number signalValue
function sim.getIntegerSignal(signalName) end

--- Retrieves the force or torque applied to a joint along/about its active axis.
--- This function retrieves meaningful information only if the joint is prismatic or
--- revolute, and is dynamically enabled. With the Bullet engine, this function
--- returns the force or torque applied to the joint motor (torques from joint
--- limits are not taken into account). With the ODE and Vortex engine, this
--- function returns the total force or torque applied to a joint along/about its
--- z-axis. See also sim.setJointForce and sim.readForceSensor.
---@param jointHandle number
---@return number forceOrTorque
function sim.getJointForce(jointHandle) end

--- Retrieves the interval parameters of a joint. See also sim.setJointInterval.
---@param objectHandle number handle of the joint
---@return boolean cyclic
---@return number[] interval
function sim.getJointInterval(objectHandle) end

--- Retrieves the intrinsic transformation matrix of a joint (the transformation
--- caused by the joint movement). See also sim.setSphericalJointMatrix.
---@param objectHandle number handle of the joint
---@return number[] matrix
function sim.getJointMatrix(objectHandle) end

--- Retrieves the operation mode of a joint. See also sim.setJointMode.
---@param jointHandle number
---@return number jointMode
---@return number options
function sim.getJointMode(jointHandle) end

--- Retrieves the intrinsic position of a joint. This function cannot be used with
--- spherical joints (use sim.getJointMatrix instead). See also
--- sim.setJointPosition.
---@param objectHandle number handle of the joint
---@return number position
function sim.getJointPosition(objectHandle) end

--- Retrieves the target position of a joint. See also sim.setJointTargetPosition.
---@param objectHandle number
---@return number targetPosition
function sim.getJointTargetPosition(objectHandle) end

--- Retrieves the intrinsic target velocity of a non-spherical joint. See also
--- sim.setJointTargetVelocity.
---@param objectHandle number
---@return number targetVelocity
function sim.getJointTargetVelocity(objectHandle) end

--- Retrieves the type of a joint
---@param objectHandle number
---@return number jointType
function sim.getJointType(objectHandle) end

--- Retrieves the last generated error message for the calling thread and/or
--- script. By calling this function, the last error message is reset and a
--- subsequent call to this function returns NULL. Errors are memorized on a thread-
--- and/or script basis (e.g. each script have each an individual error handler, so
--- does the C API functions (when the simulation thread and the GUI thread are
--- differentiated)). See also simSetLastError, sim.getStackTraceback, the
--- sim.intparam_error_report_mode and the error report modes.
---@return string lastError
function sim.getLastError() end

--- Retrieves various parameters of a light object. See also
--- sim.setLightParameters.
---@param objectHandle number handle of the light
---@return number state
---@return number[] zero
---@return number[] diffusePart
---@return number[] specularPart
function sim.getLightParameters(objectHandle) end

--- Retrieves the object handle of the dummy linked to this one. See also
--- sim.setLinkDummy.
---@param dummyHandle number
---@return number linkedDummyHandle
function sim.getLinkDummy(dummyHandle) end

--- Retrieves persistent data block tags that match a specific pattern. See also
--- sim.getPersistentDataTags
---@param pattern string the pattern to match. e.g. "LuaCommander\.options\.s"
---@return table tags
function sim.getMatchingPersistentDataTags(pattern) end

--- Retrieves the properties of a model. See also sim.setModelProperty,
--- sim.getObjectProperty and sim.getObjectSpecialProperty.
---@param objectHandle number
---@return number property
function sim.getModelProperty(objectHandle) end

--- Returns auxiliary information about a loaded plugin. See also simSetModuleInfo
--- and sim.getModuleName.
---@param moduleName string
---@param infoType number
---@return any string/number info
function sim.getModuleInfo(moduleName, infoType) end

--- Retrieves a plugin name that was previously registered with sim.loadModule. The
--- simulator normally automatically loads and registers plugins present in the
--- application directory. Users can use the sim.getModuleName to verify if a
--- specific module is present
---@param index number index to a module. To list-up all module names, start with index=0 and increment index until return value is nil
---@return string moduleName
---@return number moduleVersion
function sim.getModuleName(index) end

--- Retrieves the navigation and selection mode for the mouse. See also
--- sim.setNavigationMode.
---@return number navigationMode
function sim.getNavigationMode() end

--- Retrives the handle of the object the script is attached to. See also
--- sim.getScriptAssociatedWithObject,
--- sim.getCustomizationScriptAssociatedWithObject and
--- sim.associateScriptWithObject.
---@param scriptHandle number handle of the script, or sim.handle_self for the handle of the current script
---@return number objectHandle
function sim.getObjectAssociatedWithScript(scriptHandle) end

--- Retrieves the handle of an object's child object. See also sim.getObjectParent
--- and sim.getObjectsInTree.
---@param objectHandle number
---@param index number
---@return number childHandle
function sim.getObjectChild(objectHandle, index) end

--- Retrieves configuration information for an object (object relative
--- position/orientation, joint/path value). See also sim.setObjectConfiguration and
--- sim.getConfigurationTree.
---@param objectHandle number
---@return number rawBufferHandle
function sim.getObjectConfiguration(objectHandle) end

--- Retrieves a floating-point parameter of a scene object or calculation object.
--- See also sim.setObjectFloatParameter, sim.getObjectInt32Parameter and
--- sim.getObjectStringParameter
---@param objectHandle number
---@param parameterID number
---@return number result
---@return number parameter
function sim.getObjectFloatParameter(objectHandle, parameterID) end

--- Retrieves an object handle based on its name. The operation of this function
--- depends on the current name suffix settings (see sim.getNameSuffix,
--- sim.setNameSuffix, and the section on accessing general-type objects). See also
--- sim.isHandleValid and sim.getObjectUniqueIdentifier.
---@param objectName string
---@return number objectHandle
function sim.getObjectHandle(objectName) end

--- Retrieves an int32 parameter of a scene object or calculation object. See also
--- sim.setObjectInt32Parameter, sim.getObjectFloatParameter and
--- sim.getObjectStringParameter
---@param objectHandle number
---@param parameterID number
---@return number result
---@return number parameter
function sim.getObjectInt32Parameter(objectHandle, parameterID) end

--- Retrieves the transformation matrix of an object. See also sim.setObjectMatrix,
--- sim.getObjectPosition, sim.getObjectOrientation and the other
--- matrix/transformation functions.
---@param objectHandle number handle of the object
---@param relativeToObjectHandle number indicates relative to which reference frame we want the matrix. Specify -1 to retrieve the absolute transformation matrix, sim.handle_parent to retrieve the transformation matrix relative to the object's parent, or an object handle relative to whose reference frame we want the transformation matrix
---@return number[] matrix
function sim.getObjectMatrix(objectHandle, relativeToObjectHandle) end

--- Retrieves the name of an object based on its handle. See also
--- sim.setObjectName.
---@param objectHandle number
---@return string objectName
function sim.getObjectName(objectHandle) end

--- Retrieves the orientation (Euler angles) of an object. See also
--- sim.getObjectQuaternion, sim.setObjectOrientation, sim.getObjectPosition,
--- sim.getObjectMatrix and the other matrix/transformation functions.
---@param objectHandle number
---@param relativeToObjectHandle number
---@return number[] eulerAngles
function sim.getObjectOrientation(objectHandle, relativeToObjectHandle) end

--- Retrieves the handle of an object's parent object. See also sim.setObjectParent
--- and sim.getObjectChild.
---@param objectHandle number
---@return number parentHandle
function sim.getObjectParent(objectHandle) end

--- Retrieves the position of an object. See also sim.setObjectPosition,
--- sim.getObjectOrientation, sim.getObjectMatrix and the other
--- matrix/transformation functions.
---@param objectHandle number
---@param relativeToObjectHandle number
---@return number[] position
function sim.getObjectPosition(objectHandle, relativeToObjectHandle) end

--- Retrieves the main properties of a scene object. See also
--- sim.setObjectProperty, sim.getObjectSpecialProperty and sim.getModelProperty.
---@param objectHandle number
---@return number property
function sim.getObjectProperty(objectHandle) end

--- Retrieves the quaternion (x,y,z,w) of an object. See also
--- sim.getObjectOrientation, sim.getObjectMatrix and the other
--- matrix/transformation functions.
---@param objectHandle number
---@param relativeToObjectHandle number
---@return number[] quaternion
function sim.getObjectQuaternion(objectHandle, relativeToObjectHandle) end

--- Retrieves all selected object's handles. See also simGetObjectSelectionSize,
--- sim.addObjectToSelection and sim.removeObjectFromSelection.
---@return table selectedObjectHandles
function sim.getObjectSelection() end

--- Retrieves the size factor of a scene object. The size factor is different from
--- the real object size. Use this to be able to react to scaling operations. See
--- also sim.getObjectSizeValues.
---@param objectHandle number
---@return number sizeFactor
function sim.getObjectSizeFactor(objectHandle) end

--- Retrieves the x, y and z size values of a scene object. The size values are
--- different from the real object sizes. Use this to be able to react to scaling
--- operations. See also sim.setObjectSizeValues and sim.getObjectSizeFactor.
---@param objectHandle number
---@return number[] sizeValues
function sim.getObjectSizeValues(objectHandle) end

--- Retrieves the special properties of a scene object. See also
--- sim.setObjectSpecialProperty, sim.getObjectProperty and sim.getModelProperty.
---@param objectHandle number
---@return number property
function sim.getObjectSpecialProperty(objectHandle) end

--- Retrieves a string parameter of a scene object or calculation object. See also
--- sim.setObjectStringParameter, sim.getObjectInt32Parameter and
--- sim.getObjectFloatParameter
---@param objectHandle number
---@param parameterID number
---@return string parameter
function sim.getObjectStringParameter(objectHandle, parameterID) end

--- Retrieves the type of an object
---@param objectHandle number
---@return number objectType
function sim.getObjectType(objectHandle) end

--- Retrieves an object's unique identifier (an object handle is unique, but not
--- across opened scenes. Additionally, if a huge amount of objects are
--- created/destroyed (>2000000), then handles of destroyed objects will be reused.
--- This is not the case with unique identifiers).
---@param objectHandle? number
---@return any (1) number uniqueId
function sim.getObjectUniqueIdentifier(objectHandle) end

--- Retrieves the linear and/or angular velocity of an object, in absolute
--- coordinates. The velocity is a measured velocity (i.e. from one simulation step
--- to the next), and is available for all objects in the scene. See also
--- sim.getVelocity.
---@param shapeHandle number
---@return number[] linearVelocity
---@return number[] angularVelocity
function sim.getObjectVelocity(shapeHandle) end

--- Retrieves object handles. Use this in a loop where index starts at 0 and is
--- incremented to get all object handles in the scene. See also
--- sim.getObjectsInTree.
---@param index number
---@param objectType number
---@return number objectHandle
function sim.getObjects(index, objectType) end

--- Retrieves object handles in a given hierarchy tree. See also sim.getObjects.
---@param treeBaseHandle number
---@param objectType? number
---@param options? number
---@return table objects
function sim.getObjectsInTree(treeBaseHandle, objectType, options) end

--- Retrieves voxel positions from an octree. See also the other octree related
--- functions.
---@param octreeHandle number
---@return table voxels
function sim.getOctreeVoxels(octreeHandle) end

--- Retrieves the absolute interpolated orientation of a point along a path object.
--- See also sim.getPositionOnPath, sim.getPathPosition and
--- sim.getClosestPositionOnPath.
---@param pathHandle number handle of the path object
---@param relativeDistance number a value between 0 and 1, where 0 is the beginning of the path, and 1 the end of the path. Make sure you selected the appropriate
---@return number[] eulerAngles
function sim.getOrientationOnPath(pathHandle, relativeDistance) end

--- Retrieves the current page index (view). See also sim.setPage.
---@return number pageIndex
function sim.getPage() end

--- Retrieves the length of a path object. The length is given in meters, but the
--- actual returned length is dependent on the selected path length calculation
--- method for the given path object. See also sim.getPathPosition and
--- sim.setPathPosition.
---@param objectHandle number handle of the path object
---@return number length
function sim.getPathLength(objectHandle) end

--- Retrieves the intrinsic position of a path object (a distance along the path).
--- The position is given in meters, but the actual returned position is dependent
--- on the selected path length calculation method for the given path object. See
--- also sim.setPathPosition, sim.getPathLength, sim.getPositionOnPath and
--- sim.getClosestPositionOnPath.
---@param objectHandle number handle of the path object
---@return number position
function sim.getPathPosition(objectHandle) end

--- Retrieves all persistent data block tags or names. See also
--- sim.getMatchingPersistentDataTags and sim.persistentDataRead
---@return table tags
function sim.getPersistentDataTags() end

--- Gets various properties of a point cloud. See also sim.setPointCloudOptions and
--- the other point cloud related functions.
---@param pointCloudHandle number
---@return number maxVoxelSize
---@return number maxPtCntPerVoxel
---@return number options
---@return number pointSize
function sim.getPointCloudOptions(pointCloudHandle) end

--- Retrieves point positions from a point cloud. See also the other point cloud
--- related functions.
---@param pointCloudHandle number
---@return table points
function sim.getPointCloudPoints(pointCloudHandle) end

--- Retrieves the absolute interpolated position of a point along a path object.
--- See also sim.getOrientationOnPath, sim.getDataOnPath, sim.getPathPosition and
--- sim.getClosestPositionOnPath.
---@param pathHandle number handle of the path object
---@param relativeDistance number a value between 0 and 1, where 0 is the beginning of the path, and 1 the end of the path. Make sure you selected the appropriate
---@return number[] position
function sim.getPositionOnPath(pathHandle, relativeDistance) end

--- Retrieves the convex hull mesh from the specified vertices. See also
--- sim.convexDecompose and sim.getDecimatedMesh.
---@param verticesIn table a table containing the input vertices (succession of x/y/z values)
---@return table verticesOut
---@return table indicesOut
function sim.getQHull(verticesIn) end

--- Retrieves the quaternion from a transformation matrix. See also
--- sim.getEulerAnglesFromMatrix and the other matrix/transformation functions.
---@param matrix number[] table to 12 numbers (the last row of the 4x4 matrix (0,0,0,1) is not needed). Table values in Lua are indexed from 1, not 0!
---@return number[] quaternion
function sim.getQuaternionFromMatrix(matrix) end

--- Generates a random value in the range between 0 and 1. The value is generated
--- from an individual generator attach to the calling script (i.e. scripts do not
--- share a common generator as is the case with Lua's math.random function).
--- sim.getRandom has however also been wrapped inside of two new Lua functions, in
--- order to mimic Lua's math.random and math.randomseed: function
--- math.random2(lower,upper) local r=sim.getRandom() if lower then local b=1 local
--- d if upper then b=lower d=upper-b else d=lower-b end local e=d/(d+1)
--- r=b+math.floor(r*d/e) end return r end function math.randomseed2(seed)
--- sim.getRandom(seed) end
---@param seed? number an optional number that can be used to seed/reseed the random number generator. Leave empty or set to nil if the generator should not be reseeded
---@return number randomValue
function sim.getRandom(seed) end

--- Indicates whether the simulation is real-time. See also
--- simIsRealTimeSimulationStepNeeded and simAdjustRealTimeTimer.
---@return number result
function sim.getRealTimeSimulation() end

--- Retrieves a list of custom handles, linking a given object to other objects.
--- See also sim.setReferencedHandles.
---@param objectHandle number
---@return table referencedHandles
function sim.getReferencedHandles(objectHandle) end

--- Retrieves an axis and rotation angle that brings one transformation matrix onto
--- another one. The translation part of the transformation matrices is ignored.
--- This function, when used in combination with sim.rotateAroundAxis, can be used
--- to build interpolations between transformation matrices. See also
--- sim.getObjectMatrix, sim.setObjectMatrix and the other matrix/transformation
--- functions.
---@param matrixStart number[]
---@param matrixGoal number[]
---@return number[] axis
---@return number angle
function sim.getRotationAxis(matrixStart, matrixGoal) end

--- Generates a scaled-up or scaled down version of the input image. See also
--- sim.transformImage, sim.loadImage, sim.saveImage and
--- sim.setVisionSensorCharImage.
---@param imageIn string
---@param resolutionIn number[]
---@param desiredResolutionOut number[]
---@param options number
---@return string imageOut
---@return number[] effectiveRolutionOut
function sim.getScaledImage(imageIn, resolutionIn, desiredResolutionOut, options) end

--- Retrieves a child script's handle based on its associated object. See also
--- sim.getObjectAssociatedWithScript,
--- sim.getCustomizationScriptAssociatedWithObject and
--- sim.associateScriptWithObject.
---@param objectHandle number
---@return number scriptHandle
function sim.getScriptAssociatedWithObject(objectHandle) end

--- Reads various script attributes or properties. See also sim.setScriptAttribute.
---@param scriptHandle number
---@param attributeID number
---@return any number/boolean attribute
function sim.getScriptAttribute(scriptHandle, attributeID) end

--- Retrieves the number of times the current script was called and returned. See
--- also sim.getSimulationState.
---@return number executionCount
function sim.getScriptExecutionCount() end

--- Retrieves the handle of a script. The operation of this function depends on the
--- current name suffix settings (see sim.getNameSuffix, sim.setNameSuffix, and the
--- section on accessing general-type objects). A script doesn't directly have a
--- name assigned, however the script inherits the name of its associated object, if
--- it has one. See also sim.isHandleValid.
---@param scriptName string
---@return number scriptHandle
function sim.getScriptHandle(scriptName) end

--- Retrieves a script's name based on its handle. A script doesn't have a name
--- assigned, however if the script is a child script and associated with a scene
--- object, then this function will retrieve the name of the associated scene
--- object. If the script is not a child script or is not associated with a scene
--- object, then the returned value is NULL
---@param scriptHandle number handle of the script, or sim.handle_self for the handle of the current script
---@return string scriptName
function sim.getScriptName(scriptHandle) end

--- Retrieves a main script's or child script's parameter from its simulation
--- parameter list. Useful for simple interaction with the user, or for simple
--- parameter exchange with other scripts. See also
--- sim.setScriptSimulationParameter, and the data packing/unpacking functions.
---@param scriptHandle number handle of the script, or sim.handle_main_script or sim_handle_self
---@param parameterName string name of the parameter to retrieve
---@param forceStringReturn? boolean forces the return of a string (i.e. raw value). False by default. If false, then the returned string will be converted to nil, false, true, a number or a string as appropriate (and in that order)
---@return any (1) boolean/number/string parameterValue
function sim.getScriptSimulationParameter(scriptHandle, parameterName, forceStringReturn) end

--- Retrieves the color of a shapes. See also sim.setShapeColor.
---@param shapeHandle number
---@param colorName string
---@param colorComponent number
---@return number result
---@return number[] rgbData
function sim.getShapeColor(shapeHandle, colorName, colorComponent) end

--- Retrieves geometric information related to a shape. See also sim.getShapeMesh.
---@param shapeHandle number handle of the shape. See also
---@return number result
---@return number pureType
---@return number[] dimensions
function sim.getShapeGeomInfo(shapeHandle) end

--- Retrieves mass and inertia information from a shape. See also
--- sim.setShapeMassAndInertia, sim.getObjectMatrix, sim.buildMatrix and
--- sim.computeMassAndInertia.
---@param shapeHandle number
---@param transformation? number[]
---@return number mass
---@return number[] inertiaMatrix
---@return number[] centerOfMass
function sim.getShapeMassAndInertia(shapeHandle, transformation) end

--- Retrieves a shape's mesh information. See also sim.getShapeViz,
--- sim.createMeshShape and sim.exportMesh for a usage example.
---@param shapeHandle number handle of the shape. See
---@return table vertices
---@return table indices
---@return table normals
function sim.getShapeMesh(shapeHandle) end

--- Retrieves the texture ID of a texture that is applied to a specific shape. See
--- also sim.getTextureId and sim.setShapeTexture.
---@param shapeHandle number
---@return number textureId
function sim.getShapeTextureId(shapeHandle) end

--- Retrieves a shape's visual information.
---@param shapeHandle number handle of the shape
---@param index number 0-based index of the shape element to retrieve (compound shapes contain more than one shape element)
---@return map data
function sim.getShapeViz(shapeHandle, index) end

--- Returns the signal name at the given index. Use this function in a loop until
--- return is NULL to read all set signals. Signals are values that are global to a
--- given simulator scene and cleared at simulation start. See also the other signal
--- functions.
---@param signalIndex number
---@param signalType number
---@return string signalName
function sim.getSignalName(signalIndex, signalType) end

--- Retrieves current simulation state. See also the simulation state diagram.
---@return number simulationState
function sim.getSimulationState() end

--- Retrieves and removes the next message in the C/C++ or Lua message queues. Use
--- this in a while-loop until all messages have been extracted. While the C/C++
--- interface has one single message queue, each Lua script has its own message
--- queue. The C/C++ version of this function should only be called from the V-REP
--- client application. A given message queue cannot hold more than 64 messages,
--- unread messages will be discarded.
---@return number message
---@return number[] auxiliaryData
---@return table auxiliaryData2
function sim.getSimulatorMessage() end

--- Retrieves and clears the last generated stack traceback for the calling script.
--- See also sim.getLastError.
---@return string stackTraceback
function sim.getStackTraceback() end

--- Retrieves a named string or buffer value. See also sim.setStringNamedParam.
---@param paramName string
---@return string stringParam
function sim.getStringNamedParam(paramName) end

--- Retrieves a string value. See the string parameter identifiers. See also
--- sim.getBoolParameter, sim.getInt32Parameter, sim.getArrayParameter and
--- sim.getFloatParameter.
---@param parameter number
---@return string parameterValue
function sim.getStringParameter(parameter) end

--- Gets the value of a string signal. Signals are cleared at simulation start. See
--- also sim.setStringSignal, the other signal functions, the data packing/unpacking
--- functions and sim.persistentDataRead.
---@param signalName string name of the signal
---@return string signalValue
function sim.getStringSignal(signalName) end

--- Retrieves the system time. The system time is the time is seconds that elapsed
--- since Windows or V-REP was started, depending on the system. See also
--- sim.getSystemTimeInMs.
---@return number systemTime
function sim.getSystemTime() end

--- Retrieves a time in milliseconds.
---@param previousTime number
---@return number systemTimeOrTimeDiff
function sim.getSystemTimeInMs(previousTime) end

--- Retrieves the texture ID of a specific texture. See also sim.readTexture,
--- sim.writeTexture and sim.createTexture.
---@param textureName string
---@return number textureId
---@return number[] resolution
function sim.getTextureId(textureName) end

--- Queries whether the current thread will eventually automatically switch to
--- another thread. If the current script doesn't run in a thread (i.e. if it runs
--- in the application main thread), this function always return false. See also
--- sim.setThreadAutomaticSwitch.
---@return boolean result
function sim.getThreadAutomaticSwitch() end

--- Returns a thread id. See also simLockResources and simUnlockResources.
---@return number threadId
function sim.getThreadId() end

--- Returns global variables that were allocated just after the script internal
--- state got initialized and all default functions/variables were registered.
---@return table variables
function sim.getUserVariables() end

--- Retrieves the linear and/or angular velocity of the center of mass of a
--- non-static shape object. See also sim.getObjectVelocity.
---@param shapeHandle number handle of a dynamically enabled shape
---@return number[] linearVelocity
---@return number[] angularVelocity
function sim.getVelocity(shapeHandle) end

--- Retrieves the rgb-image (or rgba, or a portion of it) of a vision sensor. The
--- returned data doesn't make sense if sim.handleVisionSensor wasn't called
--- previously (sim.handleVisionSensor is called by default in the main script if
--- the vision sensor is not tagged as explicit handling). See also
--- sim.getVisionSensorImage, sim.setVisionSensorCharImage and sim.saveImage.
---@param sensorHandle number handle of the vision sensor. Can be combined with
---@param posX? number position of the image portion to retrieve. Zero by default
---@param posY? number position of the image portion to retrieve. Zero by default
---@param sizeX? number size of the image portion to retrieve. Zero by default, which means that the full image should be retrieved
---@param sizeY? number size of the image portion to retrieve. Zero by default, which means that the full image should be retrieved
---@param rgbaCutOff? number when different from zero, then an RGBA image is returned, where the alpha component will be 255 for all depth values below
---@return string imageBuffer
---@return number resolutionX
---@return number resolutionY
function sim.getVisionSensorCharImage(sensorHandle, posX, posY, sizeX, sizeY, rgbaCutOff) end

--- Retrieves the depth buffer (or a portion of it) of a vision sensor. Use
--- sim.getVisionSensorResolution to know the resolution of the full depth buffer.
--- The returned data doesn't make sense if sim.handleVisionSensor wasn't called
--- previously (sim.handleVisionSensor is called by default in the main script if
--- the vision sensor is not tagged as explicit handling).
---@param sensorHandle number same as for the C function. Additionally, can also be combined with
---@param posX? number position of the depth buffer portion to retrieve. Zero by default
---@param posY? number position of the depth buffer portion to retrieve. Zero by default
---@param sizeX? number size of the depth buffer portion to retrieve. Zero by default, which means that the full depth buffer should be retrieved
---@param sizeY? number size of the depth buffer portion to retrieve. Zero by default, which means that the full depth buffer should be retrieved
---@return table depthBuffer
function sim.getVisionSensorDepthBuffer(sensorHandle, posX, posY, sizeX, sizeY) end

--- Retrieves the parameters and settings of a specific filter component of a
--- vision sensor. See also sim.setVisionSensorFilter and the other vision sensor
--- related API functions.
---@param sensorHandle number
---@param filterIndex number
---@return number filterType
---@return number options
---@return table byteVals
---@return table intVals
---@return table floatVals
---@return string customBuffer
function sim.getVisionSensorFilter(sensorHandle, filterIndex) end

--- Retrieves the rgb-image (or a portion of it) of a vision sensor. Use
--- sim.getVisionSensorResolution to know the resolution of the full image. The
--- returned data doesn't make sense if sim.handleVisionSensor wasn't called
--- previously (sim.handleVisionSensor is called by default in the main script if
--- the vision sensor is not tagged as explicit handling). See also
--- sim.getVisionSensorCharImage and sim.setVisionSensorImage.
---@param sensorHandle number handle of the vision sensor. Can be combined with
---@param posX? number position of the image portion to retrieve. Zero by default
---@param posY? number position of the image portion to retrieve. Zero by default
---@param sizeX? number size of the image portion to retrieve. Zero by default, which means that the full image should be retrieved
---@param sizeY? number size of the image portion to retrieve. Zero by default, which means that the full image should be retrieved
---@param returnType? number the type of the returned buffer. 0 returns a table filled with rgb values in the range 0-1, 1 returns a string filled with rgb values in the range 0-255
---@return any table/string imageBuffer
function sim.getVisionSensorImage(sensorHandle, posX, posY, sizeX, sizeY, returnType) end

--- Retrieves the resolution at which the given vision sensor operates (this might
--- be different from what is indicated in the vision sensor dialog: should your
--- graphic card model be rather old, then only resolutions a 2n will be supported).
--- Useful in combination with
--- sim.getVisionSensorImage/sim.getVisionSensorDepthBuffer
---@param sensorHandle number handle of the vision sensor
---@return number[] resolution
function sim.getVisionSensorResolution(sensorHandle) end

--- Groups (or merges) several shapes into a compound shape (or simple shape). See
--- also sim.ungroupShape.
---@param shapeHandles table
---@return number shapeHandle
function sim.groupShapes(shapeHandles) end

--- Calls a specific function in add-ons. sim.handleAddOnScripts should only be
--- called from the main script.
---@param callType number the desired system call type (e.g
---@return number count
function sim.handleAddOnScripts(callType) end

--- Calls a specific function in non-threaded child scripts. Child scripts will be
--- executed in a precise order. sim.handleChildScripts should only be called from
--- the main script.
---@param callType number the desired system call type (e.g
---@return number scriptCount
function sim.handleChildScripts(callType) end

--- Handles (check for collision, etc.) a registered collision object. Collision
--- objects can be registered while editing a scene. See also sim.readCollision,
--- sim.resetCollision, sim.checkCollision and sim.checkCollisionEx.
---@param collisionObjectHandle number
---@return number collisionCount
---@return number[] collidingObjectHandles
function sim.handleCollision(collisionObjectHandle) end

--- Calls a specific function in customization scripts. Customization scripts will
--- be executed in a precise order. sim.handleCustomizationScripts should only be
--- called from the main script.
---@param callType number the desired system call type (e.g
---@return number count
function sim.handleCustomizationScripts(callType) end

--- Handles (measures distances, etc.) a registered distance object. Distance
--- objects can be registered while editing a scene. See also sim.readDistance,
--- sim.resetDistance and sim.checkDistance.
---@param distanceObjectHandle number
---@return number result
---@return number smallestDistance
function sim.handleDistance(distanceObjectHandle) end

--- Handles the dynamics functionality in a scene. This function is not available
--- to add-ons.
---@param deltaTime number
---@return number result
function sim.handleDynamics(deltaTime) end

--- Handles a graph object (i.e. records current values of registered data
--- streams). Graphs and data streams can be added/registered while editing a scene.
--- See also sim.resetGraph.
---@param graphHandle number
---@param simulationTime number
---@return number result
function sim.handleGraph(graphHandle, simulationTime) end

--- Handles (solves) a registered IK group. IK groups can be registered while
--- editing a scene. See also sim.checkIkGroup, sim.computeJacobian and
--- sim.generateIkPath.
---@param ikGroupHandle number
---@return number calculationCountOrResult
function sim.handleIkGroup(ikGroupHandle) end

--- Handles a mechanism registered with the geometric constraint solver
--- functionality. Mechanisms can be registered while editing a scene.
---@param mechanismHandle number
---@return number result
function sim.handleMechanism(mechanismHandle) end

--- Handles (performs cutting) a registered mill object. See also sim.resetMill.
---@param millHandle number
---@return number cutCount
---@return number[] removedSurfaceAndVolume
function sim.handleMill(millHandle) end

--- Handles a plugin. This function is only available from the Lua API. Plugins,
--- next to their registered custom Lua functions, might need to perform operations
--- on a regular basis and not when called from a threaded script (e.g. for
--- synchronization purposes). They can do it when sim.handleModule is called
--- (sim.openModule should however have been called previously). Refer to the
--- messages relayed to plugins for more details. sim.handleModule can only be
--- called from the main script and is not available in the C-API. Look at the
--- default main script to get an idea about how to use sim.openModule,
--- sim.handleModule and sim.closeModule.
---@param sim number
---@param calledInSensingPart? boolean set to false when called in the "actuation part". Set to true when called in the "sensing part"
---@param calledInSensingPart boolean set to false when called in the "actuation part". Set to true when called in the "sensing part"
---@return any (1) number result
function sim.handleModule(sim, calledInSensingPart, calledInSensingPart) end

--- Handles (performs sensing, etc. of) a registered proximity sensor object. See
--- also sim.readProximitySensor, sim.checkProximitySensor,
--- sim.checkProximitySensorEx and sim.resetProximitySensor.
---@param sensorHandle number handle of a proximity sensor object or sim.handle_all or sim_handle_all_except_explicit. (sim.handle_all will handle all proximity sensor objects, while sim.handle_all_except_explicit will only handle those that are not marked as "explicit handling")
---@return number result
---@return number distance
---@return number[] detectedPoint
---@return number detectedObjectHandle
---@return number[] detectedSurfaceNormalVector
function sim.handleProximitySensor(sensorHandle) end

--- Calls a specific function in the sandbox script. sim.handleSandboxScript should
--- only be called from the main script.
---@param callType number the desired system call type (e.g
function sim.handleSandboxScript(callType) end

--- Handles various functionality (e.g. camera tracking during simulation, object
--- velocity calculation, etc.). Should only be called from the main script, as the
--- first instruction in the sensing section. See also sim.handleSimulationStart.
---@return number result
function sim.handleSensingStart() end

--- Initializes various functionality (e.g. camera tracking during simulation,
--- object velocity calculation, etc.). Should only be called from the main script,
--- as the first instruction in the initialization section. See also
--- sim.handleSensingStart.
---@return number result
function sim.handleSimulationStart() end

--- Handles (performs sensing, etc. of) a registered vision sensor object. It will
--- (1) clear previous computer filter data, (2) read an image and (3) compute
--- filter data on the new image (if the vision sensor is using an external input
--- only (1) will be performed).See also sim.readVisionSensor,
--- sim.checkVisionSensor, sim.checkVisionSensorEx and sim.resetVisionSensor.
---@param visionSensorHandle number
---@return number detectionCount
---@return table auxiliaryValuePacket1
---@return table auxiliaryValuePacket2
---@return any etc.
function sim.handleVisionSensor(visionSensorHandle) end

--- Imports a mesh from a file. See also sim.exportMesh, sim.importShape and
--- sim.createMeshShape
---@param fileformat number
---@param pathAndFilename string
---@param options number
---@param identicalVerticeTolerance number
---@param scalingFactor number
---@return table_of_table vertices
---@return table_of_table indices
function sim.importMesh(fileformat, pathAndFilename, options, identicalVerticeTolerance, scalingFactor) end

--- Imports a shape from a file (first imports meshes, then groups/merges them into
--- a shape). See also sim.importMesh.
---@param fileformat number
---@param pathAndFilename string
---@param options number
---@param identicalVerticeTolerance number
---@param scalingFactor number
---@return number shapeHandle
function sim.importShape(fileformat, pathAndFilename, options, identicalVerticeTolerance, scalingFactor) end

--- Inserts an object into an octree, as voxels. Each voxel will store a color and
--- a tag value. See also sim.subtractObjectFromOctree, sim.insertVoxelsIntoOctree
--- and the other octree related functions.
---@param octreeHandle number
---@param objectHandle number
---@param options number
---@param color? table
---@param tag? number
---@return number totalVoxelCnt
function sim.insertObjectIntoOctree(octreeHandle, objectHandle, options, color, tag) end

--- Inserts an object into a point cloud, as points. See also
--- sim.insertPointsIntoPointCloud and the other point cloud related functions.
---@param pointCloudHandle number
---@param objectHandle number
---@param options number
---@param gridSize number
---@param color? table
---@param duplicateTolerance? number
---@return number totalPointCnt
function sim.insertObjectIntoPointCloud(pointCloudHandle, objectHandle, options, gridSize, color, duplicateTolerance) end

--- Inserts one or several control points into a path object. See also
--- sim.cutPathCtrlPoints and sim.createPath.
---@param pathHandle number
---@param options number
---@param startIndex number
---@param ptCnt number
---@param ptData table
---@return number result
function sim.insertPathCtrlPoints(pathHandle, options, startIndex, ptCnt, ptData) end

--- Inserts points into a point cloud. See also sim.removePointsFromPointCloud and
--- the other point cloud related functions.
---@param pointCloudHandle number
---@param options number
---@param points table
---@param color? table
---@param duplicateTolerance? number
---@return number totalPointCnt
function sim.insertPointsIntoPointCloud(pointCloudHandle, options, points, color, duplicateTolerance) end

--- Inserts voxels into an octree. Each voxel will store a color and a tag value.
--- See also sim.removeVoxelsFromOctree and the other octree related functions.
---@param octreeHandle number
---@param options number
---@param points table
---@param color? table
---@param tag? table
---@return number totalVoxelCnt
function sim.insertVoxelsIntoOctree(octreeHandle, options, points, color, tag) end

--- Computes the interpolated transformation matrix between matrixIn1 and
--- matrixIn2. Quaternions are used internally. See also the other
--- matrix/transformation functions.
---@param matrixIn1 number[] the first input matrix (a table containing 12 values (the last row (0,0,0,1) is not required))
---@param matrixIn2 number[] the second input matrix (a table containing 12 values (the last row (0,0,0,1) is not required))
---@param interpolFactor number the interpolation factor, a value between 0.0 and 1.0 (0.0--> resultMatrix=matrixIn1, 1.0--> resultMatrix=matrixIn2)
---@return number[] resultMatrix
function sim.interpolateMatrices(matrixIn1, matrixIn2, interpolFactor) end

--- Removes points from a point cloud, that do not intersect with the provided
--- points (i.e. the result in the point cloud will be the intersection between the
--- two sets of points). When a point cloud doesn't use an octree calculation
--- structure, then this operation cannot be performed. See also
--- sim.insertPointsIntoPointCloud, sim.setPointCloudOptions and the other point
--- cloud related functions.
---@param pointCloudHandle number
---@param options number
---@param points table
---@param tolerance number
---@return number totalPointCnt
function sim.intersectPointsWithPointCloud(pointCloudHandle, options, points, tolerance) end

--- Inverts a transformation matrix. See also the other matrix/transformation
--- functions.
---@param matrix number[]
---@return number result
function sim.invertMatrix(matrix) end

--- Checks whether a general object handle is still valid. When a general object is
--- destroyed (e.g. programmatically or via the user interface), then its related
--- handle is not valid anymore and will trigger an error when used. Use this
--- function to avoid triggering an error. See also sim.getObjectHandle,
--- sim.getCollectionHandle, sim.getCollisionHandle, sim.getDistanceHandle,
--- sim.getIkGroupHandle, sim.getScriptHandle and sim.getObjectUniqueIdentifier.
---@param generalObjectHandle number
---@param generalObjectType? number
---@return number result
function sim.isHandleValid(generalObjectHandle, generalObjectType) end

--- Checks whether an object is selected. See also sim.getObjectSelection,
--- sim.removeObjectFromSelection and sim.addObjectToSelection.
---@param objectHandle number
---@return number selectionState
function sim.isObjectInSelection(objectHandle) end

--- Checks whether the current script runs threaded
---@return number result
function sim.isScriptExecutionThreaded() end

--- Launches an executable. Similar to os.execute or io.popen, but is system
--- independent.
---@param filename string file name of the executable. If the filename starts with '@', then it will be considered as a system command, otherwise the current directory might be automatically prepended to the filename if it makes sense
---@param parameters? string optional input arguments
---@param showStatus? number 0 to hide the application's window, 1 to show it. Works only with Windows OS
---@return number result
function sim.launchExecutable(filename, parameters, showStatus) end

--- Starts or restarts (if appropriately flagged) all threaded child scripts. This
--- command should only be called from the main script. Refer also to following
--- related functions: sim.switchThread, sim.setThreadSwitchTiming,
--- sim.setThreadAutomaticSwitch, sim.setThreadIsFree, sim.setThreadResumeLocation
--- and sim.resumeThreads.
---@return number launchCount
function sim.launchThreadedChildScripts() end

--- Loads an image from file or memory. See also sim.saveImage, sim.getScaledImage,
--- sim.transformImage and sim.setVisionSensorCharImage.
---@param options number
---@param filenameOrBuffer string
---@return string image
---@return number[] resolution
function sim.loadImage(options, filenameOrBuffer) end

--- Loads a previously saved model, and selects it. See also sim.saveModel,
--- sim.loadScene, and sim.setBoolParameter with
--- sim.boolparam_scene_and_model_load_messages.
---@param filename? string model filename. The filename extension is required ("ttm"). An optional "@copy" can be appended to the filename, in which case the model's objects will be named/renamed as if an associated script was attached to the model
---@return any a) number objectHandle
function sim.loadModel(filename) end

--- Loads a V-REP plugin. This should usually be done in the main client
--- application, just after simRunSimulator was called. Alternatively, you can also
--- dynamically load/unload a plugin, but depending on the plugin function, this
--- might not work/lead to a crash. In case the dynamically loaded plugin registers
--- custom Lua functions, those functions cannot be used in scripts that were
--- already initialized (except for the script that called sim.loadModule).
--- Normally, all plugins of type v_repExtXXX.dll (or libv_repExtXXX.so or
--- libv_repExtXXX.dylib) in the V-REP directory are loaded at application start.
--- Plugins that are meant to be dynamically loaded should use a different name, or
--- a different directory. See also simSendModuleMessage and sim.unloadModule.
---@param filenameAndPath string
---@param pluginName string
---@return number pluginHandle
function sim.loadModule(filenameAndPath, pluginName) end

--- Loads a previously saved scene.See also sim.saveScene, sim.loadModel,
--- simCloseScene and sim.setBoolParameter with
--- sim.boolparam_scene_and_model_load_messages.
---@param filename string
---@return number result
function sim.loadScene(filename) end

--- Modifies or removes a ghost object previously added with sim.addGhost.
---@param ghostGroup number
---@param ghostId number
---@param operation number
---@param floatValue number
---@param options? number
---@param optionsMask? number
---@param colorOrTransformation? table
---@return number result
function sim.modifyGhost(ghostGroup, ghostId, operation, floatValue, options, optionsMask, colorOrTransformation) end

--- Moves an object to the position/orientation of another moving object (target
--- object) by performing interpolations (i.e. the object will effectiviely follow
--- the target object). If the target object is a path, a position on the path can
--- be specified. If the target object is not moving, use rather
--- sim.getObjectPosition, sim.getObjectOrientation or sim.getPositionOnPath,
--- sim.getOrientationOnPath in conjunction with sim.rmlMoveToPosition. This
--- function can only be called from child scripts running in a thread (since this
--- is a blocking operation) and is not available from the C-API. See also
--- sim.followPath.
---@param objectHandle number handle of the object to be moved
---@param targetObjectHandle number handle of the object to be followed
---@param positionAndOrOrientation number a value between 1 and 3 (1: only position is modified, 2: only orientation is modified, 3: position and orientation is modified). Can be nil in which case 3 is applied
---@param relativeDistanceOnPath number a value between 0 and 1, where 0 is the beginning of the path, and 1 the end of the path. Make sure you selected the appropriate
---@param velocity number movement velocity expressed in 1/s (i.e. the inverse of the velocity indicates the time that will be taken to reach the target object)
---@param acceleration number the acceleration/deceleration expressed in 1/s^2. Can be nil in which case an infinite acceleration is applied
---@return number deltaTimeLeft
function sim.moveToObject(objectHandle, targetObjectHandle, positionAndOrOrientation, relativeDistanceOnPath, velocity, acceleration) end

--- Opens a modal message box for interaction with the user. See also
--- sim.fileDialog and sim.displayDialog
---@param dlgType number
---@param buttons number
---@param title string
---@param message string
---@return number returnValue
function sim.msgBox(dlgType, buttons, title, message) end

--- Multiplies two transformation matrices. See also the other
--- matrix/transformation functions.
---@param matrixIn1 number[]
---@param matrixIn2 number[]
---@return number[] resultMatrix
function sim.multiplyMatrices(matrixIn1, matrixIn2) end

--- Multiplies a vector with a transformation matrix (v=m*v). See also the other
--- matrix/transformation functions.
---@param matrix number[] the transformation matrix (a table containing 12 values (the last row (0,0,0,1) is not required))
---@param vector number[] the original vector (a table containing 3 values (the last element (1) of the homogeneous coordinates is not required)
---@return number[] resultVector
function sim.multiplyVector(matrix, vector) end

--- "Opens" a plugin (allowing it to reserve resources at the start of a
--- simulation). This command can only be called from the main script. Call it from
--- the main script in the first simulation pass (usually with sim.handle_all
--- argument). sim.openModule is not available in the C-API. Look at the default
--- main script to get an idea about how to use sim.openModule, sim.handleModule and
--- sim.closeModule.
---@param sim? number
---@return any (1) number result
function sim.openModule(sim) end

--- Packs a table of double floating-point numbers into a string. See also
--- sim.unpackDoubleTable and the other packing/unpacking functions.
---@param doubleNumbers table a table containing double floating-point numbers. Non-numbers will be packed as zero values
---@param startDoubleIndex? number the zero-based index from which on data should be packed. Can be omitted in which case 0 is used
---@param doubleCount? number the amount of doubles that should be packed. Can be omitted in which case 0 is used (which indicates that the maximum available doubles should be packed from the indicated startDoubleIndex)
---@return string data
function sim.packDoubleTable(doubleNumbers, startDoubleIndex, doubleCount) end

--- Packs a table of floating-point numbers into a string. See also
--- sim.unpackFloatTable and the other packing/unpacking functions.
---@param floatingNumbers table a table containing floating-point numbers. Non-numbers will be packed as zero values
---@param startFloatIndex? number the zero-based index from which on data should be packed. Can be omitted in which case 0 is used
---@param floatCount? number the amount of floats that should be packed. Can be omitted in which case 0 is used (which indicates that the maximum available floats should be packed from the indicated startFloatIndex)
---@return string data
function sim.packFloatTable(floatingNumbers, startFloatIndex, floatCount) end

--- Packs a table of int32 numbers into a string. See also sim.unpackInt32Table and
--- the other packing/unpacking functions.
---@param int32Numbers table a table containing int32 numbers. Non-numbers will be packed as zero values
---@param startInt32Index? number the zero-based index from which on data should be packed. Can be omitted in which case 0 is used
---@param int32Count? number the amount of int32s that should be packed. Can be omitted in which case 0 is used (which indicates that the maximum available int32s should be packed from the indicated startInt32Index)
---@return string data
function sim.packInt32Table(int32Numbers, startInt32Index, int32Count) end

--- Packs a table into a buffer. The table may contain other nested tables, nil,
--- boolean, number or string values. All other types (e.g. functions) will be
--- considered as string or nil values. You can also use sim.packTable to quickly
--- compare two tables or to perform a deep copy of a table. See also
--- sim.unpackTable, the other stack functions and the other packing/unpacking
--- functions.
---@param aTable table a script table
---@return string buffer
function sim.packTable(aTable) end

--- Packs a table of uint16 numbers into a string. See also sim.unpackUInt16Table
--- and the other packing/unpacking functions.
---@param uint16Numbers table a table containing uint16 numbers. Invalid uint16 numbers will be packed in an undefined manner
---@param startUint16Index? number the zero-based index from which on data should be packed. Can be omitted in which case 0 is used
---@param uint16Count? number the amount of uint16s that should be packed. Can be omitted in which case 0 is used (which indicates that the maximum available uint16s should be packed from the indicated startUint16Index)
---@return string data
function sim.packUInt16Table(uint16Numbers, startUint16Index, uint16Count) end

--- Packs a table of uint32 numbers into a string. See also sim.unpackUInt32Table
--- and the other packing/unpacking functions.
---@param uint32Numbers table a table containing uint32 numbers. Non-numbers will be packed as zero values
---@param startUint32Index? number the zero-based index from which on data should be packed. Can be omitted in which case 0 is used
---@param uint32Count? number the amount of uint32s that should be packed. Can be omitted in which case 0 is used (which indicates that the maximum available uint32s should be packed from the indicated startUint32Index)
---@return string data
function sim.packUInt32Table(uint32Numbers, startUint32Index, uint32Count) end

--- Packs a table of uint8 numbers into a string. See also sim.unpackUInt8Table and
--- the other packing/unpacking functions.
---@param uint8Numbers table a table containing uint8 numbers. Invalid byte number will be packed in an undefined manner
---@param startUint8Index? number the zero-based index from which on data should be packed. Can be omitted in which case 0 is used
---@param uint8count? number the amount of uint8s that should be packed. Can be omitted in which case 0 is used (which indicates that the maximum available uint8s should be packed from the indicated startUint8Index)
---@return string data
function sim.packUInt8Table(uint8Numbers, startUint8Index, uint8count) end

--- Requests a pause of a simulation. See also sim.startSimulation,
--- sim.stopSimulation and sim.getSimulationState. See also the simulation state
--- diagram.
---@return number result
function sim.pauseSimulation() end

--- Reads a block of persistent data. See also sim.persistentDataWrite,
--- sim.getPersistentDataTags, sim.getStringSignal, sim.getIntegerSignal,
--- sim.getDoubleSignal and sim.readCustomDataBlock.
---@param dataTag string name of the data block
---@return string dataValue
function sim.persistentDataRead(dataTag) end

--- Writes a persistent data block. Persistent data, valid across all opened
--- simulator scenes, remains until the simulator ends, or until it is cleared by
--- writing an empty data block. If the options flag is set appropriately, then
--- persistent data can also be stored on file, and be automatically reloaded next
--- time V-REP starts. See also sim.persistentDataRead, sim.setStringSignal,
--- sim.setIntegerSignal, sim.setDoubleSignal and sim.writeCustomDataBlock.
---@param dataTag string
---@param dataValue string
---@param options? number
---@return number result
function sim.persistentDataWrite(dataTag, dataValue, options) end

--- Triggers a quit signal that will eventually quits the application. See also
--- simRunSimulator.
---@param doNotDisplayMessages boolean
function sim.quitSimulator(doNotDisplayMessages) end

--- Moves (actuates) several joints at the same time using the Reflexxes Motion
--- Library type II or IV. This function can only be called from child scripts
--- running in a thread (since this is a blocking operation) and is not available
--- from the C-API. See also sim.rmlMoveToPosition, and sim.rmlPos.
---@param jointHandles table handles of the joints to actuate
---@param flags number
---@param currentVel table the current velocity of the joints. Can be nil in which case a velocity vector of 0 is used
---@param currentAccel table the current acceleration of the joints. Can be nil in which case an acceleration vector of 0 is used
---@param maxVel table the maximum allowed velocity of the joints
---@param maxAccel table the maximum allowed acceleration of the joints
---@param maxJerk table the maximum allowed jerk of the joints. With the RML type II plugin, the max. jerk will however always be infinite
---@param targetPos table the desired target positions of the joints
---@param targetVel table the desired velocity of the joints at the target. Can be nil in which case a velocity vector of 0 is used
---@param direction table the desired rotation direction for cyclic revolute joints: 0 for the shortest distance, -x for a movement towards negative values, +x for a movement towards positive values (n=(x-1) represents the number of additional turns). Can be nil or omitted, in which case a value of 0 is used for all joints
---@return number result
---@return table newPos
---@return table newVel
---@return table newAccel
---@return number timeLeft
function sim.rmlMoveToJointPositions(jointHandles, flags, currentVel, currentAccel, maxVel, maxAccel, maxJerk, targetPos, targetVel, direction) end

--- Moves an object to a given position and/or orientation using the Reflexxes
--- Motion Library type II or IV. This function can only be called from child
--- scripts running in a thread (since this is a blocking operation) and is not
--- available from the C-API. See also sim.rmlMoveToJointPositions, sim.rmlPos,
--- sim.moveToObject and sim.followPath.
---@param objectHandle number handle of the object to be moved
---@param relativeToObjectHandle number indicates relative to which reference frame the movement data is specified. Specify -1 for a movement relative to the absolute reference frame, sim.handle_parent for a movement relative to the object's parent frame, or an object handle relative to whose reference frame the movement should be performed
---@param flags number
---@param currentVel number[] the current velocity of the object (velX, velY, velZ, velAngle). Can be nil in which case a velocity vector of 0 is used
---@param currentAccel number[] the current acceleration of the object (accelX, accelY, accelZ, accelAngle). Can be nil in which case an acceleration vector of 0 is used
---@param maxVel number[] the maximum allowed velocity of the object (maxVelX, maxVelY, maxVelZ, maxVelAngle)
---@param maxAccel number[] the maximum allowed acceleration of the object (maxAccelX, maxAccelY, maxAccelZ, maxAccelAngle)
---@param maxJerk number[] the maximum allowed jerk of the object (maxJerkX, maxJerkY, maxJerkZ, maxJerkAngle). With the RML type II plugin, the max. jerk will however always be infinite
---@param targetPosition number[] the desired target position of the object (expressed relative to
---@param targetQuaternion number[] the desired target orientation of the object (expressed relative to
---@param targetVel number[] the desired velocity of the object at the target (targetVelX, targetVelY, targetVelZ, targetVelAngle). Can be nil in which case a velocity vector of 0 is used
---@return number result
---@return number[] newPos
---@return number[] newQuaternion
---@return number[] newVel
---@return number[] newAccel
---@return number timeLeft
function sim.rmlMoveToPosition(objectHandle, relativeToObjectHandle, flags, currentVel, currentAccel, maxVel, maxAccel, maxJerk, targetPosition, targetQuaternion, targetVel) end

--- Removes an object previously created via sim.rmlPos or sim.rmlVel.
---@param handle number
---@return number result
function sim.rmlRemove(handle) end

--- Executes a call to the Reflexxes Motion Library type II or IV. The Reflexxes
--- Motion Library provides instantaneous trajectory generation capabilities for
--- motion control systems. This function prepares a velocity-based trajectory
--- generation object, that can then be calculated with sim.rmlStep. When this
--- object is not needed anymore, remove it with sim.rmlRemove. See also sim.rmlPos.
---@param dofs number
---@param smallestTimeStep number
---@param flags number
---@param currentPosVelAccel table
---@param maxAccelJerk table
---@param selection table
---@param targetVel table
---@return number handle
function sim.rmlVel(dofs, smallestTimeStep, flags, currentPosVelAccel, maxAccelJerk, selection, targetVel) end

--- Reads the collision state of a registered collision object. This function
--- doesn't perform collision detection, it merely reads the result from a previous
--- call to sim.handleCollision (sim.handleCollision is called in the default main
--- script). See also sim.resetCollision, sim.checkCollision and
--- sim.checkCollisionEx.
---@param collisionObjectHandle number
---@return number collisionState
---@return number[] collidingObjectHandles
function sim.readCollision(collisionObjectHandle) end

--- Reads custom data that is stored inside of an object, a script or a scene (i.e.
--- the data is part of the object, the script or the scene). Reads also custom data
--- for the application's currrent session. See also sim.writeCustomDataBlock,
--- sim.readCustomDataBlockTags and the data packing/unpacking functions.
---@param objectHandle number argument, if your target is the current script
---@param tagName string
---@return string customDataBlock
function sim.readCustomDataBlock(objectHandle, tagName) end

--- Reads the tags of all custom data that is stored inside of an object, a script
--- or a scene (i.e. the data is part of the object, the script or the scene). Reads
--- also all custom data that is stored inside of the application's current session.
--- See also sim.readCustomDataBlock.
---@param objectHandle number argument, if your target is the current script
---@return table tags
function sim.readCustomDataBlockTags(objectHandle) end

--- Reads the distance of a registered distance object. This function doesn't
--- perform distance measurement, it merely reads the result from a previous call to
--- sim.handleDistance (sim.handleDistance is called in the default main script).
--- See also sim.resetDistance and sim.checkDistance.
---@param distanceObjectHandle number
---@return number result
---@return number smallestDistance
function sim.readDistance(distanceObjectHandle) end

--- Reads the force and torque applied to a force sensor (filtered values are
--- read), and its current state ('unbroken' or 'broken'). See also
--- sim.breakForceSensor and sim.getJointForce.
---@param objectHandle number
---@return number result
---@return number[] forceVector
---@return number[] torqueVector
function sim.readForceSensor(objectHandle) end

--- Reads the state of a proximity sensor. This function doesn't perform detection,
--- it merely reads the result from a previous call to sim.handleProximitySensor
--- (sim.handleProximitySensor is called in the default main script). See also
--- sim.checkProximitySensor, sim.checkProximitySensorEx and
--- sim.resetProximitySensor.
---@param sensorHandle number
---@return number result
---@return number distance
---@return number[] detectedPoint
---@return number detectedObjectHandle
---@return number[] detectedSurfaceNormalVector
function sim.readProximitySensor(sensorHandle) end

--- Retrieves the RGB data (or a portion of it) related to a specific texture. See
--- also sim.getTextureId, sim.writeTexture and sim.createTexture.
---@param textureId number
---@param options number
---@param posX? number
---@param posY? number
---@param sizeX? number
---@param sizeY? number
---@return string textureData
function sim.readTexture(textureId, options, posX, posY, sizeX, sizeY) end

--- Reads the state of a vision sensor. This function doesn't perform detection, it
--- merely reads the result from a previous call to sim.handleVisionSensor
--- (sim.handleVisionSensor is called in the default main script). See also
--- sim.checkVisionSensor, sim.checkVisionSensorEx and sim.resetVisionSensor.
---@param visionSensorHandle number handle of a vision sensor object
---@return number result
---@return table auxiliaryValuePacket1
---@return table auxiliaryValuePacket2
---@return any etc.
function sim.readVisionSensor(visionSensorHandle) end

--- Receives wireless data (in a simulation). See also sim.sendData and
--- sim.tubeOpen. Cannot be called from add-ons. Wireless receptions can be
--- visualized globally via the environment dialog, or individually as in following
--- example: sim.setBoolParameter(sim.boolparam_force_show_wireless_reception,true)
--- data=sim.receiveData(...)
--- sim.setBoolParameter(sim.boolparam_force_show_wireless_reception,false)
---@param dataHeader? number number indicating who "designed" the communication message. Can also be -1, in which case messages with any dataHeader will be retrieved (not recommended, unless index is different from -1). This value can be omitted (-1 will be used)
---@param dataName? string name indicating the type of message. Can be nil, in which case messages with any dataName will be retrieved (not recommended, unless index is different from -1). This value can be omitted (nill will be used)
---@param antennaHandle? number handle of the scene object that should operate as the antenna for this reception. If sim.handle_default is specified, a reception antenna at (0,0,0) is simulated. If sim.handle_self is specified, the object associated with the current child script is used as the antenna. This value can be omitted (sim.handle_self will be used)
---@param index? number zero-based index of the message to read. If -1 is indicated, the first message that matches the dataHeader and dataName is read and removed. Otherwise messages are just read. This value can be omitted (-1 will be used)
---@return string data
---@return number senderID
---@return number dataHeader
---@return string dataName
function sim.receiveData(dataHeader, dataName, antennaHandle, index) end

--- Refreshes V-REP's internal dialogs. Calling sim.refreshDialogs will not trigger
--- a sim_message_eventcallback_refreshdialogs message
---@param refreshDegree number
---@return number result
function sim.refreshDialogs(refreshDegree) end

--- Registers a script function for auto-completion, syntax highlighting and
--- call-tip display (in the V-REP internal code editor). Useful for script function
--- definitions inside of a Lua file, loaded by a plugin.
---@param funcNameAtPluginName string
---@param callTips string call tips: string (or several strings separated by '@') that indicates the input/output argument type/size. Call tips appear in the script editor when the function was typed followed by "("
---@return number result
function sim.registerScriptFunction(funcNameAtPluginName, callTips) end

--- Registers a script variable. Each time a script is run for the first time,
--- registered variables will be set. Can also be used for more complex operations
--- as in following example:
--- simRegisterScriptVariable("simUi","require('customUi')",0); which is equivalent
--- with an implicit simUi=require('customUi') command in the initialization phase
--- of every script. The Lua counterpart is just used for syntax highlighting and
--- auto-completion purpose in the V-REP internal code editor. See also
--- simRegisterScriptCallbackFunction and sim.setScriptVariable.
---@param varNameAtPluginName string name of the variable, combined with the plugin name: variableName@pluginName. Avoid using too simple variable names, otherwise they might clash with other plugins. Also, always use the
---@return number result
function sim.registerScriptVariable(varNameAtPluginName) end

--- Removes a previously added banner. See also sim.addBanner
---@param bannerID number handle of a previously added banner. sim.handle_all removes all banners from the scene, that were created in a script (banners created from the C interface are not removed)
---@return number result
function sim.removeBanner(bannerID) end

--- Removes a collection from the scene, including the objects it contains. If you
--- just want to remove the collection, but not the objects it contains, call
--- sim.emptyCollection beforehand. See also sim.createCollection and
--- sim.addObjectToCollection.
---@param collectionHandle number
---@return number result
function sim.removeCollection(collectionHandle) end

--- Removes a previously added drawing object. See also sim.addDrawingObject and
--- sim.addDrawingObjectItem
---@param objectHandle number handle of a previously added drawing object. sim.handle_all removes all drawing objects from the scene, that were created in a script (drawing objects created from the C interface are not removed)
---@return number result
function sim.removeDrawingObject(objectHandle) end

--- Removes an IK group. See also sim.getIkGroupHandle and sim.createIkGroup.
---@param ikGroupHandle number
---@return number result
function sim.removeIkGroup(ikGroupHandle) end

--- Removes a model from the scene. See also sim.removeObject. Threaded child
--- scripts can only destroy models that do not contain other scripts attached than
--- itself. Object destruction always tries to destroy attached scripts before
--- destroying the object itself. If a script tries to destroy the object it is
--- attached to, then the object will first be destroyed, and the script destruction
--- will be delayed.
---@param objectHandle number
---@return number removedCnt
function sim.removeModel(objectHandle) end

--- Removes an object from the scene. See also sim.removeModel. Threaded child
--- scripts can only destroy objects that do not contain other scripts attached than
--- itself. Object destruction always tries to destroy attached scripts before
--- destroying the object itself. If a script tries to destroy the object it is
--- attached to, then the object will first be destroyed, and the script destruction
--- will be delayed.
---@param objectHandle number
---@return number result
function sim.removeObject(objectHandle) end

--- Removes an object from the selection. See also sim.addObjectToSelection,
--- sim.isObjectInSelection and sim.getObjectSelection.
---@param what number
---@param objectHandle? number
---@return any (1) number result
function sim.removeObjectFromSelection(what, objectHandle) end

--- Removes a previously added particle object. See also sim.addParticleObject and
--- sim.addParticleObjectItem
---@param objectHandle number
---@return number result
function sim.removeParticleObject(objectHandle) end

--- Removes points from a point cloud. When a point cloud doesn't use an octree
--- calculation structure, then individual points cannot be removed, only all points
--- can be removed in that case. See also sim.insertPointsIntoPointCloud,
--- sim.setPointCloudOptions and the other point cloud related functions.
---@param pointCloudHandle number
---@param options number
---@param points table
---@param tolerance number
---@return number totalPointCnt
function sim.removePointsFromPointCloud(pointCloudHandle, options, points, tolerance) end

--- Removes a script. Not all script types can be removed, and it will also depend
--- on whether simulation is running or not. See also sim.addScript.
---@param scriptHandle number
---@return number result
function sim.removeScript(scriptHandle) end

--- Removes voxels from an octree. See also sim.insertVoxelsIntoOctree and the
--- other octree related functions.
---@param octreeHandle number
---@param options number
---@param points table
---@return number totalVoxelCnt
function sim.removeVoxelsFromOctree(octreeHandle, options, points) end

--- Reorients the bounding box of a shape.
---@param shapeHandle number
---@param relativeToHandle number
---@return number result
function sim.reorientShapeBoundingBox(shapeHandle, relativeToHandle) end

--- Clears the collision state, colors, intersections, etc. for a registered
--- collision object. See also sim.handleCollision.
---@param collisionObjectHandle number
---@return number result
function sim.resetCollision(collisionObjectHandle) end

--- Clears the distance state, the distance segment, etc. for a registered distance
--- object. See also sim.handleDistance.
---@param distanceObjectHandle number
---@return number result
function sim.resetDistance(distanceObjectHandle) end

--- Dynamically resets an object that is dynamically simulated. This means that the
--- object representation in the dynamics engine is removed, and added again. This
--- can be useful when the set-up of a dynamically simulated chain needs to be
--- modified during simulation (e.g. joint or shape attachement position/orientation
--- changed). It should be noted that calling this on a dynamically simulated object
--- might slightly change its position/orientation relative to its parent (since the
--- object will be disconnected from the dynamics world in its current
--- position/orientation), so the user is in charge of rectifying for that.
---@param objectHandle number
---@return number result
function sim.resetDynamicObject(objectHandle) end

--- Clears a graph object (resets all its data streams). See also sim.handleGraph.
---@param graphHandle number
---@return number result
function sim.resetGraph(graphHandle) end

--- Clears all previously set mill calculation results (list of cut objects,
--- surface and volume that were cut). See also sim.handleMill.
---@param millHandle number
---@return number result
function sim.resetMill(millHandle) end

--- Resets a cuttable object (e.g. a shape) to its initial shape (before it was
--- milled), thus cancelling milling changes. The calculation structure linked to
--- the object is removed and an updated calculation structure might be calculated
--- (might take some calculation time). See also sim.applyMilling, sim.handleMill
--- and sim.resetMill.
---@param objectHandle number
---@return number result
function sim.resetMilling(objectHandle) end

--- Clears the detection state, detection color, detection segments, etc. of a
--- proximity sensor object. See also sim.handleProximitySensor.
---@param sensorHandle number
---@return number result
function sim.resetProximitySensor(sensorHandle) end

--- Clears the detection state, etc. of a proximity sensor object. See also
--- sim.handleVisionSensor.
---@param sensorHandle number
---@return number result
function sim.resetVisionSensor(sensorHandle) end

--- In conjunction with sim.setThreadResumeLocation, sim.resumeThreads allows
--- specifying when and in which order threads are resumed. By default, V-REP
--- doesn't use "regular" threads, but something similar to hybrid threads (which
--- behave like coroutines, but can also behave like regular threads). This allows
--- much more flexibility and execution control of the threads. Once a thread
--- switched to another thread, it will resume execution at the beginning of next
--- simulation pass by default. In order to also have full synchronization control
--- between threads, you can assign a resume location and order to each thread. When
--- sim.resumeThreads(x) is called, all threads that were assigned a resume location
--- of x will be resumed. See also sim.setThreadResumeLocation,
--- sim.setThreadSwitchTiming, sim.switchThread and sim.setThreadIsFree. This
--- function can only be called in the main script.
---@param location number indicates a location value associated with threads (through the
---@return number count
function sim.resumeThreads(location) end

--- Rotates a transformation matrix around a random axis in space. This function,
--- when used in combination with sim.getRotationAxis, can be used to build
--- interpolations between transformation matrices. See also sim.getObjectMatrix,
--- sim.setObjectMatrix and the other matrix/transformation functions.
---@param matrixIn number[]
---@param axis number[]
---@param axisPos number[]
---@param angle number
---@return number[] matrixOut
function sim.rotateAroundAxis(matrixIn, axis, axisPos, angle) end

--- Saves an image to file or to memory. See also sim.loadImage, sim.getScaledImage
--- and sim.getVisionSensorCharImage.
---@param image string a pointer to rgb or rgba values
---@param resolution number[] the x/y resolution of the provided image
---@param options number bit-coded. If bit0 is set (1), then the provided image is rgba, otherwise it is rgb
---@param filename string the name of the file to write. The file extension indicates the format. If the filename only contains '.xxx', where xxx represents the file format, then the image will be saved to memory
---@param quality? number the quality of the written image: 0 for best compression, 100 for largest file. Use -1 for default behaviour
---@return any 1) number result
function sim.saveImage(image, resolution, options, filename, quality) end

--- Saves a model (an object marked as "Object is model base" and all other objects
--- in its hierarchy tree). Any existing file with same name will be overwritten.
--- See also sim.loadModel, and sim.saveScene.
---@param baseOfModelHandle number handle of an object marked as "Object is model base"
---@param filename? string model filename. The filename extension is required ("ttm"). If this argument is omitted, then the model will be saved to a buffer which will be returned
---@return any a) number result
function sim.saveModel(baseOfModelHandle, filename) end

--- Saves a scene. Any existing file with same name will be overwritten. See also
--- sim.loadScene, simCloseScene, and sim.saveModel.
---@param filename string
---@return number result
function sim.saveScene(filename) end

--- Scales specified objects in a non-isometric fashion, if possible (i.e. some
--- objects can be fully isometrically scaled, others have 2 or all 3 axes linked).
--- See also sim.scaleObjects for isometric scaling.
---@param objectHandle number
---@param xScale number
---@param yScale number
---@param zScale number
---@param options? number
---@return number result
function sim.scaleObject(objectHandle, xScale, yScale, zScale, options) end

--- Scales (in dimensions) specified objects. All related values are automatically
--- scaled appropriately (e.g. masses, forces, etc.). See also sim.scaleObject for
--- non-isometric scaling.
---@param objectHandles table
---@param scalingFactor number
---@param scalePositionsToo boolean
---@return number result
function sim.scaleObjects(objectHandles, scalingFactor, scalePositionsToo) end

--- Sends (or broadcasts) wireless data (in a simulation). See also sim.receiveData
--- and sim.tubeOpen. Cannot be called from add-ons. Wireless emissions can be
--- visualized globally via the environment dialog, or individually as in following
--- example: sim.setBoolParameter(sim.boolparam_force_show_wireless_emission,true)
--- sim.sendData(...)
--- sim.setBoolParameter(sim.boolparam_force_show_wireless_emission,false)
---@param targetID number indicates what receivers will receive the message. Can be sim.handle_all, sim.handle_tree, sim.handle_chain, or the handle of a script. If sim.handle_tree is specified, then only child scripts built on top of current script's hierarchy will be able to receive the message. If sim.handle_chain is specified, then only child scripts parented with current script (or the main script) will be able to receive the message
---@param dataHeader number number indicating who "designed" the communication message. Always use the same header (because only you will know the meaning of the message) and stick to it. The best is to use the serial number of your V-REP copy (check the "Help" menu, in the "About" item for the serial number). Otherwise, you risk collision with other developer's messages which might use the same header as yours
---@param dataName string name indicating the type of message. dataHeader and dataName will be used to filter out all unwanted messages when trying to receive a specific message (see
---@param data string data to transmit (each character can have values between 0 and 255). See also the
---@param antennaHandle? number handle of the scene object that should operate as the antenna for this transmission. Use sim.handle_default to simulate an antenna coinciding with the world reference frame, or sim.handle_self to use the object associated with the child script as antenna. Can be omitted (in that case, sim.handle_self is used)
---@param actionRadius? number same as C-function. Can be omitted (in that case 100 is used)
---@param emissionAngle1? number same as C-function. Can be omitted (in that case, pi is used)
---@param emissionAngle2? number same as C-function. Can be omitted (in that case, 2pi is used)
---@param persistence? number same as C-function. Can be omitted (in that case, 0.0 is used)
---@return number result
function sim.sendData(targetID, dataHeader, dataName, data, antennaHandle, actionRadius, emissionAngle1, emissionAngle2, persistence) end

--- Reads how many bytes are waiting to be read on a serial port (RS-232). See also
--- sim.serialRead.
---@param portHandle number
---@return number result
function sim.serialCheck(portHandle) end

--- Closes a serial port (RS-232). See also sim.serialOpen.
---@param portHandle number
---@return number result
function sim.serialClose(portHandle) end

--- Opens a serial port (RS-232) for communication. When called from a script, the
--- function can only be called when the simulation is running (and in that case the
--- port is automatically closed at simulation stop). See also sim.serialClose,
--- sim.serialSend, sim.serialCheck and sim.serialRead.
---@param portString string
---@param baudRate number
---@return number result
function sim.serialOpen(portString, baudRate) end

--- Reads from a previously opened serial port (RS-232). The C version of the
--- function cannot be blocking. See also sim.serialCheck and sim.serialSend.
---@param portHandle number the handle returned by the
---@param dataLengthToRead number the maximum data length that should be read
---@param blockingOperation Boolean if true and the calling script is running in a thread, then the function only returns when the desired data length was read (or if the closingString was met, or if there was a timeout (see next arguments)
---@param closingString? string a string (containing any byte value) can be specified, that will break from the blocking operation if a match was found in the incoming data. Useful when you know that a data packet is always ended with a given signature. Can be an empty string for default operation
---@param timeout? number duration after which the blocking operation will be aborted, or 0 if the timeout is infinite
---@return string data
function sim.serialRead(portHandle, dataLengthToRead, blockingOperation, closingString, timeout) end

--- Writes data to a previously opened serial port (RS-232). See also
--- sim.serialRead.
---@param portHandle number
---@param data string
---@return number charsSent
function sim.serialSend(portHandle, data) end

--- Sets 3 values of an array parameter. See also sim.getArrayParameter,
--- sim.setBoolParameter, sim.setInt32Parameter and sim.setFloatParameter.
---@param parameter number
---@param parameterValues table
---@return number result
function sim.setArrayParameter(parameter, parameterValues) end

--- Sets a boolean parameter. See also sim.getBoolParameter, sim.setInt32Parameter,
--- sim.setArrayParameter and sim.setFloatParameter.
---@param parameter number
---@param boolState boolean
---@return number result
function sim.setBoolParameter(parameter, boolState) end

--- Sets the name of a collection based on its handle. See also
--- sim.getCollectionName.
---@param collectionHandle number
---@param collectionName string
---@return number result
function sim.setCollectionName(collectionHandle, collectionName) end

--- Restores configuration information previously retrieved with
--- sim.getConfigurationTree (object relative positions/orientations, joint/path
--- values). Dynamically simulated objects will implicitely be reset before the
--- command is applied (i.e. similar to calling sim.resetDynamicObject just before)
---@param rawBufferHandle number handle to a block of memory previously returned by
---@return number result
function sim.setConfigurationTree(rawBufferHandle) end

--- Allows to watch specific variables when a script is in a debug mode that
--- displays variable changes.
---@param listOfVariables table the list of variables to watch (e.g. {"x","arr[3]","model.handle"}), or nil to watch all variables
function sim.setDebugWatchList(listOfVariables) end

--- Sets the value of a double signal. If that signal is not yet present, it is
--- added. Signals created in the main script or in a child script are automatically
--- cleared at simulation end. See also sim.getDoubleSignal, the other signal
--- functions, and sim.persistentDataWrite.
---@param signalName string
---@param signalValue number
---@return number result
function sim.setDoubleSignal(signalName, signalValue) end

--- Sets a bool-type physics engine property. You might have to call
--- sim.resetDynamicObject for changes to take effect. See also the other engine
--- properties setter and getter API functions.
---@param paramId number
---@param objectHandle number
---@param boolParam boolean
---@return number result
function sim.setEngineBoolParameter(paramId, objectHandle, boolParam) end

--- Sets a float-type physics engine property. You might have to call
--- sim.resetDynamicObject for changes to take effect. See also the other engine
--- properties setter and getter API functions.
---@param paramId number
---@param objectHandle number
---@param floatParam number
---@return number result
function sim.setEngineFloatParameter(paramId, objectHandle, floatParam) end

--- Sets an int32-type physics engine property. You might have to call
--- sim.resetDynamicObject for changes to take effect. See also the other engine
--- properties setter and getter API functions.
---@param paramId number
---@param objectHandle number
---@param int32Param number
---@return number result
function sim.setEngineInt32Parameter(paramId, objectHandle, int32Param) end

--- Sets the explicit handling flags for a general object. See also
--- sim.getExplicitHandling.
---@param generalObjectHandle number
---@param explicitFlags number
---@return number result
function sim.setExplicitHandling(generalObjectHandle, explicitFlags) end

--- Sets a floating point parameter. See also sim.getFloatParameter,
--- sim.setBoolParameter, sim.setArrayParameter and sim.setInt32Parameter.
---@param parameter number
---@param floatState number
---@return number result
function sim.setFloatParameter(parameter, floatState) end

--- Sets one value in a user-defined graph data stream. See also sim.resetGraph and
--- sim.handleGraph.
---@param graphHandle number
---@param dataStreamName string
---@param data number
---@return number result
function sim.setGraphUserData(graphHandle, dataStreamName, data) end

--- Sets properties of an inverse kinematics group (IK group). See also
--- sim.setIkElementProperties and sim.getIkGroupHandle.
---@param ikGroupHandle number
---@param resolutionMethod number
---@param maxIterations number
---@param damping number
---@return number result
function sim.setIkGroupProperties(ikGroupHandle, resolutionMethod, maxIterations, damping) end

--- Sets an integer parameter. See also sim.getInt32Parameter,
--- sim.setBoolParameter, sim.setArrayParameter and sim.setFloatParameter.
---@param parameter number
---@param intState number
---@return number result
function sim.setInt32Parameter(parameter, intState) end

--- Sets the value of an integer signal. If that signal is not yet present, it is
--- added. Signals created in the main script or in a child script are automatically
--- cleared at simulation end. See also sim.getIntegerSignal, the other signal
--- functions, and sim.persistentDataWrite.
---@param signalName string
---@param signalValue number
---@return number result
function sim.setIntegerSignal(signalName, signalValue) end

--- Sets a joint dependent of another joint. The dependent joint should first be
--- set into dependent mode via sim.setJointMode.
---@param jointHandle number
---@param masterJointHandle number
---@param offset number
---@param coeff number
---@return number result
function sim.setJointDependency(jointHandle, masterJointHandle, offset, coeff) end

--- Sets the maximum force or torque that a joint can exert. The joint will apply
--- that force/torque until the joint target velocity has been reached. To apply a
--- negative force/torque, set a negative target velocity. This function has no
--- effect when the joint is not dynamically enabled, or when it is a spherical
--- joint. See also sim.getJointForce. and sim.setJointTargetVelocity.
---@param objectHandle number
---@param forceOrTorque number
---@return number result
function sim.setJointForce(objectHandle, forceOrTorque) end

--- Sets the interval parameters of a joint (i.e. range values). The attributes or
--- interval parameters might have no effect, depending on the joint-type. See also
--- sim.getJointInterval.
---@param objectHandle number
---@param cyclic boolean
---@param interval number[]
---@return number result
function sim.setJointInterval(objectHandle, cyclic, interval) end

--- Sets the operation mode of a joint. Might have as side-effect the change of
--- additional properties of the joint. See also sim.getJointMode and
--- sim.setJointDependency.
---@param jointHandle number
---@param jointMode number
---@param options number
---@return number result
function sim.setJointMode(jointHandle, jointMode, options) end

--- Sets the intrinsic position of a joint. May have no effect depending on the
--- joint mode. This function cannot be used with spherical joints (use
--- sim.setSphericalJointMatrix instead). See also sim.getJointPosition and
--- sim.setJointTargetPosition.
---@param objectHandle number
---@param position number
---@return number result
function sim.setJointPosition(objectHandle, position) end

--- Sets the target position of a joint if the joint is in torque/force mode (also
--- make sure that the joint's motor and position control are enabled). See also
--- sim.getJointTargetPosition and sim.setJointPosition.
---@param objectHandle number
---@param targetPosition number
---@return number result
function sim.setJointTargetPosition(objectHandle, targetPosition) end

--- Sets the intrinsic target velocity of a non-spherical joint. This command makes
--- only sense when the joint mode is torque/force mode: the dynamics functionality
--- and the joint motor have to be enabled (position control should however be
--- disabled). See also sim.getJointTargetVelocity.
---@param objectHandle number
---@param targetVelocity number
---@return number result
function sim.setJointTargetVelocity(objectHandle, targetVelocity) end

--- Sets various parameters of a light object. See also sim.getLightParameters.
---@param objectHandle number
---@param state number
---@param _arg2 any
---@param diffusePart number[]
---@param specularPart number[]
---@return number result
function sim.setLightParameters(objectHandle, state, _arg2, diffusePart, specularPart) end

--- Defines (or breaks) a dummy-dummy link pair. Useful to create dynamic loop
--- closure constraints on the fly (among others). See also sim.getLinkDummy.
---@param dummyHandle number
---@param linkedDummyHandle number
---@return number result
function sim.getLinkDummy(dummyHandle, linkedDummyHandle) end

--- Sets the properties of a model. See also sim.getModelProperty,
--- sim.setObjectProperty and sim.setObjectSpecialProperty.
---@param objectHandle number
---@param prop number
---@return number result
function sim.setModelProperty(objectHandle, prop) end

--- Sets the name suffix adjustment number (for detailed information on this, read
--- also the section on accessing general-type objects). In V-REP, all objects are
--- identified by a name and a handle. When an object (scene object or general-type
--- object) is copied at the same time as a child script, the newly created object's
--- name will become "oldName#0", should the same object be pasted another time, the
--- next name will be "oldName#1", etc. From within a child script, retrieving
--- object handles is performed by automatically appending a name suffix to the
--- object name (each script gets initialized with the name suffix number of the
--- object it is attached to). This allows to copy-paste objects and scripts without
--- having to manually adjust the scripts (the scripts will automatically know which
--- object they have to access based on the set name suffix). From within a script,
--- most of the time you won't need to set the name suffix, but in some special
--- cases you might want to temporarily disable it (e.g. "myChildScript#42" (which
--- has its name suffix automatically set to 42) copied itself together with its
--- attached robot ("myRobot#42") and now from within "myChildScript#42" you want to
--- shift "myRobot#43" to avoid collision. In that case set the name suffix to 43,
--- shift "myRobot" (retrieve its handle with sim.getObjectHandle("myRobot") then
--- set the suffix back to 42). From within a script, the sim.setNameSuffix command
--- is influencing only current script. When accessing the API from outside of a
--- script however, the name adjustment mechanism needs to be adjusted manually
--- (make sure you reset the name suffix to its initial state after you are done
--- retrieving handles). Imagine you have one robot in your scene that is named
--- "robot". You can access the robot from a C/C++ application with
--- sim.getObjectHandle("robot"). If the robot is duplicated, the second robot's
--- name will be "robot#0", the third will be "robot#1", etc. From within you C/C++
--- application you can now access all robots with the same code, you just need to
--- adjust the name suffix number. E.g. sim.setNameSuffix(42), then
--- sim.getObjectHandle("robot") will retrieve the handle of "robot#42". Once you
--- are done accessing objects, reset the name suffix number to -1
--- (sim.setNameSuffix(-1)). Setting the name suffix to -1 disables the name
--- adjustment mechanism (default when accessing the API from outside of a script)
--- See also the sim.getNameSuffix function.
---@param nameSuffixNumber number
function sim.setNameSuffix(nameSuffixNumber) end

--- Sets the navigation and selection mode for the mouse. See also
--- sim.getNavigationMode.
---@param navigationMode number
---@return number result
function sim.setNavigationMode(navigationMode) end

--- Sets configuration information for an object (object relative
--- position/orientation, joint/path value). Dynamically simulated objects will
--- implicitely be reset before the command is applied (i.e. similar to calling
--- sim.resetDynamicObject just before). See also sim.getObjectConfiguration and
--- sim.setConfigurationTree.
---@param rawBufferHandle number handle to a raw data buffer (value returned by a previous call to
---@return number result
function sim.setObjectConfiguration(rawBufferHandle) end

--- Sets a floating-point parameter of a scene object or calculation object. See
--- also sim.getObjectFloatParameter, sim.setObjectInt32Parameter and
--- sim.setObjectStringParameter
---@param objectHandle number
---@param parameterID number
---@param parameter number
---@return number result
function sim.setObjectFloatParameter(objectHandle, parameterID, parameter) end

--- Sets an int32 parameter of a scene object or calculation object. See also
--- sim.getObjectInt32Parameter, sim.setObjectFloatParameter and
--- sim.setObjectStringParameter
---@param objectHandle number
---@param parameterID number
---@param parameter number
---@return number result
function sim.setObjectInt32Parameter(objectHandle, parameterID, parameter) end

--- Sets the transformation matrix of an object. Dynamically simulated objects will
--- implicitely be reset before the command is applied (i.e. similar to calling
--- sim.resetDynamicObject just before). See also sim.getObjectMatrix,
--- sim.setObjectPosition, sim.setObjectOrientation and the other
--- matrix/transformation functions.
---@param objectHandle number
---@param relativeToObjectHandle number
---@param matrix number[]
---@return number result
function sim.setObjectMatrix(objectHandle, relativeToObjectHandle, matrix) end

--- Sets the name of an object based on its handle. See also sim.getObjectName.
---@param objectHandle number
---@param objectName string
---@return number result
function sim.setObjectName(objectHandle, objectName) end

--- Sets the orientation (Euler angles) of an object. Dynamically simulated objects
--- will implicitely be reset before the command is applied (i.e. similar to calling
--- sim.resetDynamicObject just before). See also sim.setObjectQuaternion,
--- sim.getObjectOrientation, sim.setObjectPosition, sim.setObjectMatrix and the
--- other matrix/transformation functions.
---@param objectHandle number
---@param relativeToObjectHandle number
---@param eulerAngles number[]
---@return number result
function sim.setObjectOrientation(objectHandle, relativeToObjectHandle, eulerAngles) end

--- Sets an object's parent object. See also sim.getObjectParent.
---@param objectHandle number
---@param parentObjectHandle number
---@param keepInPlace boolean
---@return number result
function sim.setObjectParent(objectHandle, parentObjectHandle, keepInPlace) end

--- Sets the position (x, y and z-coordinates) of an object. Dynamically simulated
--- objects will implicitely be reset before the command is applied (i.e. similar to
--- calling sim.resetDynamicObject just before). See also sim.getObjectPosition,
--- sim.setObjectOrientation, sim.setObjectMatrix and the other
--- matrix/transformation functions.
---@param objectHandle number
---@param relativeToObjectHandle number
---@param position number[]
---@return number result
function sim.setObjectPosition(objectHandle, relativeToObjectHandle, position) end

--- Sets the properties of a scene object. See also sim.getObjectProperty,
--- sim.setObjectSpecialProperty and sim.setModelProperty.
---@param objectHandle number
---@param prop number
---@return number result
function sim.setObjectProperty(objectHandle, prop) end

--- Sets the quaternion (x,y,z,w) of an object. Be very careful to set only valid
--- value (i.e. normalized), otherwise you will experience strange effects.
--- Dynamically simulated objects will implicitely be reset before the command is
--- applied (i.e. similar to calling sim.resetDynamicObject just before). See also
--- sim.setObjectOrientation and the other matrix/transformation functions.
---@param objectHandle number
---@param relativeToObjectHandle number
---@param quaternion number[]
---@return number result
function sim.setObjectQuaternion(objectHandle, relativeToObjectHandle, quaternion) end

--- Sets the x, y and z size values of a scene object. The size values are
--- different from the real object sizes. Use this to be able to react to scaling
--- operations. See also sim.getObjectSizeValues.
---@param objectHandle number
---@param sizeValues number[]
---@return number result
function sim.setObjectSizeValues(objectHandle, sizeValues) end

--- Sets the special properties of a scene object. See also
--- sim.getObjectSpecialProperty, sim.setObjectProperty and sim.setModelProperty.
---@param objectHandle number
---@param prop number
---@return number result
function sim.setObjectSpecialProperty(objectHandle, prop) end

--- Sets a string parameter of a scene object or calculation object. See also
--- sim.getObjectStringParameter, sim.setObjectInt32Parameter and
--- sim.setObjectFloatParameter
---@param objectHandle number
---@param parameterID number
---@param parameter string
---@return number result
function sim.setObjectStringParameter(objectHandle, parameterID, parameter) end

--- Switches between pages (main scene views). See also sim.getPage.
---@param index number
---@return number result
function sim.setPage(index) end

--- Sets the intrinsic position of a path object (i.e. the position along the
--- path). The position is given in meters, but the actual position is dependent on
--- the selected path length calculation method for the given path object.This
--- function is the equivalent of sim.setJointPosition, but for a path object. See
--- also sim.getPathPosition.
---@param objectHandle number
---@param position number
---@return number result
function sim.setPathPosition(objectHandle, position) end

--- Sets various properties of a point cloud. See also sim.getPointCloudOptions and
--- the other point cloud related functions.
---@param pointCloudHandle number
---@param maxVoxelSize number
---@param maxPtCntPerVoxel number
---@param options number
---@param pointSize number
---@return number result
function sim.setPointCloudOptions(pointCloudHandle, maxVoxelSize, maxPtCntPerVoxel, options, pointSize) end

--- Attaches a list of custom handles to a given scene object. Those custom handles
--- are handles of other objects, that are linked to the given scene object (for
--- whatever purpose). The advantage of storing references to other objects with
--- this function is that V-REP will take care of correctly adjusting the references
--- if needed: For instance, imagine objectA storing the handle of objectB via this
--- function. If objectB is deleted, then the stored handle will become -1. If
--- objectA and objectB are duplicated at the same time, then the duplicate of
--- objectA will store the handle of the duplicate of objectB. Optionally, if
--- sim.handleflag_keeporiginal is specified, then linking to original objects is
--- guaranteed, e.g. in above example, after a duplication of objectA, the duplicate
--- of objectA will store the handle of the original objectB (if objectB still
--- exists). See also sim.getReferencedHandles.
---@param objectHandle number
---@param referencedHandles table
---@return number result
function sim.setReferencedHandles(objectHandle, referencedHandles) end

--- Sets various script attributes or properties. See also sim.getScriptAttribute.
---@param scriptHandle number
---@param attributeID number
---@param _arg2 any
---@return number result
function sim.setScriptAttribute(scriptHandle, attributeID, _arg2) end

--- Sets a main script's or child script's parameter in its simulation parameter
--- list. Useful for simple interaction with the user or for simple parameter
--- exchange with other scripts. See also sim.getScriptSimulationParameter and the
--- data packing/unpacking functions.
---@param scriptHandle number handle of the script, or sim.handle_main_script, sim.handle_all, sim.handle_tree, sim.handle_chain or sim.handle_self
---@param parameterName string Same as C-function
---@param _arg2 any
---@return number setCount
function sim.setScriptSimulationParameter(scriptHandle, parameterName, _arg2) end

--- Sets a new content for a script (i.e. attaches a new Lua code). During a
--- simulation, the new script content might not be taken into consideration if a
--- previous code was already executed at least once. See also simGetScriptText,
--- sim.addScript and sim.associateScriptWithObject.
---@param scriptHandle number
---@param scriptText string
---@return number result
function sim.setScriptText(scriptHandle, scriptText) end

--- Sets or clears a script variable (i.e. a Lua variable). Call this only: a) from
--- the main thread, or: b) from a thread that originated from a threaded child
--- script. In that case, you cannot set a variable in a non-threaded child script.
--- See also sim.callScriptFunction.
---@param variableNameAtScriptName string
---@param scriptHandleOrType number
---@param variable any
---@return number result
function sim.setScriptVariable(variableNameAtScriptName, scriptHandleOrType, variable) end

--- Sets the color (or transforms it) of one or several shapes. See also
--- sim.getShapeColor.
---@param shapeHandle number
---@param colorName string
---@param colorComponent number
---@param rgbData number[]
---@return number result
function sim.setShapeColor(shapeHandle, colorName, colorComponent, rgbData) end

--- Applies mass and inertia information to a shape. If simulation is running, the
--- shape will be dynamically reset (similar to calling sim.resetDynamicObject right
--- after). See also sim.getShapeMassAndInertia, sim.getObjectMatrix and
--- sim.buildMatrix.
---@param shapeHandle number
---@param mass number
---@param inertiaMatrix number[]
---@param centerOfMass number[]
---@param transformation? number[]
---@return number result
function sim.setShapeMassAndInertia(shapeHandle, mass, inertiaMatrix, centerOfMass, transformation) end

--- Sets the material (used by the physics engines) of a specific shape. You might
--- have to also call sim.resetDynamicObject for changes to take effect.
---@param shapeHandle number
---@param materialIdOrShapeHandle number
---@return number result
function sim.setShapeMaterial(shapeHandle, materialIdOrShapeHandle) end

--- Applies (or removes) a texture to a shape. See also sim.getTextureId,
--- sim.getShapeTextureId, sim.createTexture and simApplyTexture.
---@param shapeHandle number
---@param textureId number
---@param mappingMode number
---@param options number
---@param uvScaling number[]
---@param position? number[]
---@param orientation? number[]
---@return number result
function sim.setShapeTexture(shapeHandle, textureId, mappingMode, options, uvScaling, position, orientation) end

--- Sets the intrinsic orientation matrix of a spherical joint object. This
--- function cannot be used with non-spherical joints (use sim.setJointPosition
--- instead). See also sim.getJointMatrix.
---@param objectHandle number
---@param matrix number[]
---@return number result
function sim.setSphericalJointMatrix(objectHandle, matrix) end

--- Sets a named string or buffer value. See also sim.getStringNamedParam.
---@param paramName string
---@param stringParam string
---@return number result
function sim.setStringNamedParam(paramName, stringParam) end

--- Sets a string parameter. See also sim.getStringParameter, sim.setBoolParameter,
--- sim.setArrayParameter, sim.setFloatParameter and sim.setInt32Parameter.
---@param parameter number
---@param stringState string
---@return number result
function sim.setStringParameter(parameter, stringState) end

--- Sets the value of a string signal. If that signal is not yet present, it is
--- added. Signals created in the main script or in a child script are automatically
--- cleared at simulation end. See also sim.getStringSignal, the other signal
--- functions, the data packing/unpacking functions and sim.persistentDataWrite.
---@param signalName string
---@param signalValue string
---@return number result
function sim.setStringSignal(signalName, signalValue) end

--- Allows to temporarily forbid thread switches. If the current script doesn't run
--- in a thread (i.e. if it runs in the application main thread), this function has
--- no effect. By default, V-REP doesn't use "regular" threads, but something
--- similar to hybrid threads (which behave like coroutines, but can also behave
--- like regular threads). This allows much more flexibility and execution control
--- of the threads. For complete control over the switching moment, see also
--- sim.getThreadAutomaticSwitch, sim.setThreadSwitchTiming, sim.switchThread,
--- sim.setThreadIsFree and sim.setThreadResumeLocation.
---@param switchIsAutomatic Boolean if true, the thread will be able to automatically switch to another thread, otherwise the switching is temporarily disabled
---@return number result
function sim.setThreadAutomaticSwitch(switchIsAutomatic) end

--- Threads created by V-REP are never running concurrently, they rather behave
--- like coroutines. This allows achieving same results as with "pure threads",
--- except when an external command is blocking (e.g. commands not directly
--- supported by V-REP). Those can be lengthly image processing routines, or socket
--- communication routines for example. When such external blocking commands are
--- called, V-REP appears frozen until the external commands return. To avoid such a
--- situation, you can declare a non-blocking section with the sim.setThreadIsFree
--- command: sim.setThreadIsFree(true) starts a non-blocking section, and
--- sim.setThreadIsFree(false) closes it. Try to avoid using V-REP commands when in
--- a non-blocking section (bad synchronization), and never forget to close a
--- non-blocking section, otherwise V-REP will hang indefinitely. Use
--- sim.setThreadIsFree with extra care when calling it from C. A thread running in
--- a non-blocking section cannot be paused nor stopped. This command has no effect
--- when called from the main thread or a non-threaded script.
---@param freeMode Boolean specify true to start a non-blocking section. Specify false to end a non-blocking section
---@return number result
function sim.setThreadIsFree(freeMode) end

--- Allows specifying when and in which order child script threads are resumed. If
--- the current script doesn't run in a thread (i.e. if it runs in the application
--- main thread), this function has no effect. By default, V-REP doesn't use regular
--- threads, but something similar to hybrid threads (which behave like coroutines,
--- but can also behave like regular threads). This allows much more flexibility and
--- execution control of the threads. Once a thread switched to another thread, it
--- will resume execution when the main script calls sim.resumeThreads with the
--- corresponding argument, which represents a child script thread resume location.
--- In order to also have full synchronization control between threads, you can
--- assign a resume location and order to each thread with this function. See also
--- sim.setThreadSwitchTiming, sim.setThreadAutomaticSwitch, sim.switchThread and
--- sim.setThreadIsFree.
---@param location number a
---@param priority number a
---@return number result
function sim.setThreadResumeLocation(location, priority) end

--- Allows specifying a switching time for the thread in which the current script
--- runs. If the current script doesn't run in a thread (i.e. if it runs in the
--- application main thread), this function has no effect. By default, V-REP doesn't
--- use "regular" threads, but something similar to hybrid threads (which behave
--- like coroutines, but can also behave like regular threads). This allows much
--- more flexibility and execution control of the threads: each thread (except for
--- the main or application thread) has a switch timing associated, which specifies
--- how long the thread will run before switching to other threads (the execution
--- duration per calculation pass). By default this value is 2 millisecond, but this
--- function allows changing that value (on a thread-basis). Acceptable values are
--- between 0 and 200. For complete control over the switching moment, see also
--- sim.setThreadAutomaticSwitch, sim.switchThread, sim.setThreadIsFree and
--- sim.setThreadResumeLocation.
---@param deltaTimeInMilliseconds number desired non-stop execution time before a switching occurs. A value of x will let the thread execute for x-1 to x milliseconds before switching to another thread
---@return number result
function sim.setThreadSwitchTiming(deltaTimeInMilliseconds) end

--- Sets the rgb-image of a vision sensor (and applies any image processing filter
--- if specified in the vision sensor dialog). Make sure the vision sensor is
--- flagged as external input. Use sim.getVisionSensorResolution to know the size of
--- the image buffer that you need to provide (buffer size=resolutionX
--- *resolutionY*3). The "regular" use of this function is to first read the data
--- from a vision sensor with sim.getVisionSensorCharImage, do some custom
--- filtering, then write the modified image back. The alternate use of this
--- function is to display textures, video images, etc. by using a vision sensor
--- object (without however making use of the vision sensor functionality), since a
--- vision sensor can be "looked through" like camera objects. See also
--- sim.setVisionSensorImage.
---@param sensorHandle number
---@param image string
---@return number result
function sim.setVisionSensorCharImage(sensorHandle, image) end

--- Sets the parameters and settings of a specific filter component of a vision
--- sensor. See also sim.getVisionSensorFilter and the other vision sensor related
--- API functions.
---@param sensorHandle number
---@param filterIndex number
---@param options number
---@param byteVals table
---@param intVals table
---@param floatVals table
---@param customBuffer string
---@return number filterType
function sim.setVisionSensorFilter(sensorHandle, filterIndex, options, byteVals, intVals, floatVals, customBuffer) end

--- Sets the rgb-image of a vision sensor (and applies any image processing filter
--- if specified in the vision sensor dialog). Make sure the vision sensor is
--- flagged as external input. Use sim.getVisionSensorResolution to know the size of
--- the image buffer that you need to provide (buffer size=resolutionX
--- *resolutionY*3). The "regular" use of this function is to first read the data
--- from a vision sensor with sim.getVisionSensorImage, do some custom filtering,
--- then write the modified image back. The alternate use of this function is to
--- display textures, video images, etc. by using a vision sensor object (without
--- however making use of the vision sensor functionality), since a vision sensor
--- can be "looked through" like camera objects. See also
--- sim.setVisionSensorCharImage.
---@param sensorHandle number handle of the vision sensor object. Can be combined with
---@param image? table
---@param image string
---@return any (1) number result
function sim.setVisionSensorImage(sensorHandle, image, image) end

--- Requests a start of a simulation (or a resume of a paused simulation). See also
--- sim.pauseSimulation, sim.stopSimulation and sim.getSimulationState. See also the
--- simulation state diagram.
---@return number result
function sim.startSimulation() end

--- Requests a stop of the running simulation. See also sim.startSimulation,
--- sim.pauseSimulation and sim.getSimulationState. See also the simulation state
--- diagram.
---@return number result
function sim.stopSimulation() end

--- Removes an object from an octree, as voxel subtractions. See also
--- sim.insertObjectIntoOctree, sim.removeVoxelsFromOctree and the other octree
--- related functions.
---@param octreeHandle number
---@param objectHandle number
---@param options number
---@return number totalVoxelCnt
function sim.subtractObjectFromOctree(octreeHandle, objectHandle, options) end

--- Removes an object from a point cloud, as a subtraction. See also
--- sim.insertPointsIntoPointCloud, sim.insertObjectIntoPointCloud,
--- sim.removePointsFromPointCloud and the other point cloud related functions.
---@param pointCloudHandle number
---@param objectHandle number
---@param options number
---@param tolerance number
---@return number totalPointCnt
function sim.subtractObjectFromPointCloud(pointCloudHandle, objectHandle, options, tolerance) end

--- Allows specifying the exact moment at which the current thread should switch to
--- another thread. If the current script doesn't run in a thread (i.e. if it runs
--- in the application main thread), this function has no effect. By default, V-REP
--- doesn't use "regular" threads, but something similar to hybrid threads (which
--- behave like coroutines, but can also behave like regular threads). This allows
--- much more flexibility and execution control of the threads: each thread (except
--- for the main or application thread) has a switch timing associated, which
--- specifies how long the thread will run before switching to other threads. By
--- default this value is 2 millisecond, but can be modified with
--- sim.setThreadSwitchTiming. That timing can be shortened with sim.switchThread.
--- Use with care when calling this function from a plugin. See also the
--- sim.setThreadAutomaticSwitch, sim.setThreadResumeLocation and
--- sim.setThreadIsFree functions.
---@return number result
function sim.switchThread() end

--- Closes a text edition window previously opened with sim.textEditorOpen.
---@param handle number the handle of the text editor window
---@return string text
---@return number[] pos
---@return number[] size
function sim.textEditorClose(handle) end

--- Retieves information from a text edition window previously opened with
--- sim.textEditorOpen.
---@param handle number the handle of the text editor window
---@return string text
---@return number[] pos
---@return number[] size
---@return boolean visible
function sim.textEditorGetInfo(handle) end

--- Opens a text edition window. See simOpenTextEditor for the C version of this
--- function. See also sim.textEditorClose, sim.textEditorShow and
--- sim.textEditorGetInfo.
---@param initText string the initial text to be displayed
---@param properties string
---@return number handle
function sim.textEditorOpen(initText, properties) end

--- Shows or hides a text edition window previously opened with sim.textEditorOpen.
---@param handle number the handle of the text editor window
---@param showState boolean the desired show state of the text editor window
---@return number res
function sim.textEditorShow(handle, showState) end

--- Modified a buffer than contains packed data. See also the data
--- packing/unpacking functions.
---@param inBuffer string the input buffer that contains packed data
---@param inFormat number a
---@param multiplier number a multiplier value. We have out=offset+multiplier*in
---@param offset number an offset or split size value. We have out=offset+multiplier*in
---@param outFormat? number the desired
---@return any 1) string outBuffer
function sim.transformBuffer(inBuffer, inFormat, multiplier, offset, outFormat) end

--- Transforms an image in various ways. See also sim.loadImage,
--- sim.getScaledImage, sim.transformBuffer and sim.combineRgbImages.
---@param image string
---@param resolution number[]
---@param options number
---@return number result
function sim.transformImage(image, resolution, options) end

--- Closes a communication tube previously opened with sim.tubeOpen. Data written
--- with sim.tubeWrite and that hasn't been read yet on the other side of the tube
--- will persist.
---@param tubeHandle number
---@return number result
function sim.tubeClose(tubeHandle) end

--- Opens a tube for communication within V-REP. A tube is similar to a
--- bidirectional communication pipe. Messages written on one side can be read on
--- the other side in the same order as they were written. Tubes opened via a script
--- will automatically close upon simulation end. A scene switch will close all
--- communication tubes and tube handles will not be valid anymore. See also
--- sim.tubeClose, sim.tubeWrite, sim.tubeRead, sim.tubeStatus, sim.sendData and
--- sim.receiveData.
---@param dataHeader number
---@param dataName string
---@param readBufferSize number
---@return number tubeHandle
function sim.tubeOpen(dataHeader, dataName, readBufferSize) end

--- Receives a data packet from a communication tube previously opened with
--- sim.tubeOpen. The tube needs to be connected (see sim.tubeStatus).
---@param tubeHandle number Same as C-function
---@param blockingOperation? boolean if true, then the call will block until something can be read or until an error occurred. The script should be threaded in that case. Default value is false
---@return string data
function sim.tubeRead(tubeHandle, blockingOperation) end

--- Checks the status of a communication tube previously opened with sim.tubeOpen.
---@param tubeHandle number
---@return number status
---@return number readPacketsCount
---@return number writePacketsCount
function sim.tubeStatus(tubeHandle) end

--- Sends a data packet into a communication tube previously opened with
--- sim.tubeOpen. The tube needs to be connected (see sim.tubeStatus).
---@param tubeHandle number Same as C-function
---@param data string string representing a data packet (each character can have values between 0 and 255). See also the
---@return number result
function sim.tubeWrite(tubeHandle, data) end

--- Ungroups a compound shape into several simple shapes. See also sim.groupShapes,
--- sim.convexDecompose, sim.getQHull and sim.getDecimatedMesh.
---@param shapeHandle number
---@return table simpleShapeHandles
function sim.ungroupShape(shapeHandle) end

--- Unloads a V-REP plugin. This should usually be done just before ending the
--- simulator. Alternatively, you can also unload a plugin that was dynamically
--- loaded at any time. This can however lead to a crash if the plugin registered
--- custom Lua functions via simRegisterCustomLuaFunction (deprecated) without
--- specifying a function name as functionName@pluginName. See also
--- simSendModuleMessage and sim.loadModule.
---@param pluginHandle number
---@return number result
function sim.unloadModule(pluginHandle) end

--- Unpacks a string (or part of it) into a table of double floating-point numbers.
--- See also sim.packDoubleTable and the other packing/unpacking functions.
---@param data string a string (values between 0 and 255) that contains packed floating-point numbers
---@param startDoubleIndex? number the zero-based index from which on data should be unpacked (from data[8*startDoubleIndex+1+additionalByteOffset]). Can be omitted in which case 0 is used
---@param doubleCount? number the amount of doubles that should be unpacked. Can be omitted in which case 0 is used (which indicates that the maximum of doubles should be unpacked from the indicated startIndex)
---@param additionalByteOffset? number a byte offset that will be added before reading the doubles. Can be omitted, in which case 0 is used
---@return table doubleNumbers
function sim.unpackDoubleTable(data, startDoubleIndex, doubleCount, additionalByteOffset) end

--- Unpacks a string (or part of it) into a table of floating-point numbers. See
--- also sim.packFloatTable and the other packing/unpacking functions.
---@param data string a string (values between 0 and 255) that contains packed floating-point numbers
---@param startFloatIndex? number the zero-based index from which on data should be unpacked (from data[4*startFloatIndex+1+additionalByteOffset]). Can be omitted in which case 0 is used
---@param floatCount? number the amount of floats that should be unpacked. Can be omitted in which case 0 is used (which indicates that the maximum of floats should be unpacked from the indicated startFloatIndex)
---@param additionalByteOffset? number a byte offset that will be added before reading the floats. Can be omitted, in which case 0 is used
---@return table floatingNumbers
function sim.unpackFloatTable(data, startFloatIndex, floatCount, additionalByteOffset) end

--- Unpacks a string (or part of it) into a table of int32 numbers. See also
--- sim.packInt32Table and the other packing/unpacking functions.
---@param data string a string (values between 0 and 255) that contains packed int32 numbers
---@param startInt32Index? number the zero-based index from which on data should be unpacked (from data[4*startInt32Index+1+additionalByteOffset]). Can be omitted in which case 0 is used
---@param int32Count? number the amount of int32s that should be unpacked. Can be omitted in which case 0 is used (which indicates that the maximum of int32s should be unpacked from the indicated startInt32Index)
---@param additionalByteOffset? number a byte offset that will be added before reading the int32s. Can be omitted, in which case 0 is used
---@return table int32Numbers
function sim.unpackInt32Table(data, startInt32Index, int32Count, additionalByteOffset) end

--- Unpacks a buffer into a table. See also sim.packTable, the other stack
--- functions and the other packing/unpacking functions.
---@param buffer string a string buffer
---@return table aTable
function sim.unpackTable(buffer) end

--- Unpacks a string (or part of it) into a table of uint16 numbers. See also
--- sim.packUInt16Table and the other packing/unpacking functions.
---@param data string a string (values between 0 and 255) that contains packed uint16 numbers
---@param starUint16Index? number the zero-based index from which on data should be unpacked (from data[2*starUint16Index+1+additionalByteOffset]). Can be omitted in which case 0 is used
---@param uint16Count? number the amount of uint16s that should be unpacked. Can be omitted in which case 0 is used (which indicates that the maximum of uint16s should be unpacked from the indicated starUint16Index)
---@param additionalByteOffset number a byte offset that will be added before reading the uint16s. Can be omitted, in which case 0 is used
---@return table uint16Numbers
function sim.unpackUInt16Table(data, starUint16Index, uint16Count, additionalByteOffset) end

--- Unpacks a string (or part of it) into a table of uint32 numbers. See also
--- sim.packUInt32Table and the other packing/unpacking functions.
---@param data string a string (values between 0 and 255) that contains packed uint32 numbers
---@param startUint32Index? number the zero-based index from which on data should be unpacked (from data[4*startUint32Index+1+additionalByteOffset]). Can be omitted in which case 0 is used
---@param uint32Count? number the amount of uint32s that should be unpacked. Can be omitted in which case 0 is used (which indicates that the maximum of uint32s should be unpacked from the indicated startUint32Index)
---@param additionalByteOffset? number a byte offset that will be added before reading the uint32s. Can be omitted, in which case 0 is used
---@return table uint32Numbers
function sim.unpackUInt32Table(data, startUint32Index, uint32Count, additionalByteOffset) end

--- Unpacks a string (or part of it) into a table of uint8 numbers. See also
--- sim.packUInt8Table and the other packing/unpacking functions.
---@param data string a string (values between 0 and 255) that contains uint8 numbers
---@param startUint8Index? number the zero-based index from which on data should be unpacked (from data[startUint8Index]). Can be omitted in which case 0 is used
---@param uint8Count? number the amount of uint8s that should be unpacked. Can be omitted in which case 0 is used (which indicates that the maximum of uint8s should be unpacked from the indicated startUint8Index)
---@return table uint8Numbers
function sim.unpackUInt8Table(data, startUint8Index, uint8Count) end

--- Waits for a certain amount of time. This function can only be called from child
--- scripts running in a thread (since this is a blocking operation) and is not
--- available from the C-API. See also sim.waitForSignal.
---@param deltaTime number the minimum time duration to wait. If the function was called at simulation time X (or real-time X), then the function will return when simulation time>=X+deltaTime (or when real-time>=X+deltaTime)
---@param simulationTime Boolean indicates whether we want to wait in terms of simulation- or real-time. Can be omitted (is true by default)
---@return number deltaTimeLeft
function sim.wait(deltaTime, simulationTime) end

--- Adds or removes custom data to be stored and saved together with an object, a
--- script or a scene (i.e. the data will be part of the object, the script or the
--- scene). If the tag name starts with the string "@tmp", then the data will not be
--- saved during a scene or model save operation. The data can also be saved
--- globally for the application (for the current V-REP session). See also
--- sim.readCustomDataBlock and the data packing/unpacking functions. If you wish to
--- store a reference to another object, have a look at sim.setReferencedHandles.
---@param objectHandle number argument, if your target is the current script
---@param tagName string
---@param data string
---@return number result
function sim.writeCustomDataBlock(objectHandle, tagName, data) end

--- Overwrites a specific texture (or a portion of it) with RGB data. See also
--- sim.getTextureId, sim.readTexture and sim.createTexture.
---@param textureId number
---@param options number
---@param textureData string
---@param posX? number
---@param posY? number
---@param sizeX? number
---@param sizeY? number
---@return number result
function sim.writeTexture(textureId, options, textureData, posX, posY, sizeX, sizeY) end

--- Called once when the simulation starts.
function sysCall_init() end

--- Called every step, after the physics update.
function sysCall_actuation() end

--- Called every step, before the physics update.
function sysCall_sensing() end

--- Called when the simulation ends.
function sysCall_cleanup() end
