<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <script src="https://cdn.babylonjs.com/babylon.js"></script>
    <script src="https://cdn.babylonjs.com/loaders/babylonjs.loaders.min.js"></script>
    <script src="https://cdn.babylonjs.com/physics/babylon.physics.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/cannon-es@0.24.0/build/cannon-es.min.js"></script> <!-- Cannon.js -->
    
    <style>
        body, #renderCanvas { width: 100%; height: 100%; margin: 0; overflow: hidden; }
    </style>
</head>
<body>
    <canvas id="renderCanvas"></canvas>
<script type="text/javascript">
    const canvas = document.getElementById("renderCanvas");
    const engine = new BABYLON.Engine(canvas, true);
    
    let sceneToRender; // Declare variable for scene

    const createScene = function() {
        const scene = new BABYLON.Scene(engine);
        scene.clearColor = new BABYLON.Color3.Black;

        // Setup physics
        scene.gravity = new BABYLON.Vector3(0, -9.81, 0);
        scene.enablePhysics();
        scene.collisionsEnabled = true; // Enable collisions
        
        // Camera setup
        const alpha = Math.PI / 4;
        const beta = Math.PI / 3;
        const radius = 8;
        const target = new BABYLON.Vector3(0, 0, 0);
        
        const camera = new BABYLON.UniversalCamera("UniversalCamera", new BABYLON.Vector3(5, 8, 10), scene);
        camera.applyGravity = true;
        camera.ellipsoid = new BABYLON.Vector3(1, 4, 1); // Set proper ellipsoid for collisions
        camera.checkCollisions = true;
        camera.attachControl(canvas, true);
        camera.speed = 0.8;
        
      //Controls  WASD

        camera.keysUp.push(87);
        camera.keysDown.push(83);
        camera.keysRight.push(68);
        camera.keysLeft.push(65);
        
        // Light setup
        const light = new BABYLON.HemisphericLight("light", new BABYLON.Vector3(1, 1, 0), scene);
        
        // Load the model
        BABYLON.SceneLoader.ImportMesh("", "/model/", "library.glb", scene, function (meshes) {
            meshes.forEach(function(mesh) {
                mesh.position = new BABYLON.Vector3(0, 0, 0); // Adjust position
                mesh.checkCollisions = true; // Enable collisions for loaded meshes
            });
        });
        
        return scene;
    }
    
    // Create the scene and assign it to sceneToRender
    sceneToRender = createScene();

    // Render loop
    engine.runRenderLoop(function () {
        sceneToRender.render();
    });

    // Resize event
    window.addEventListener("resize", function () {
        engine.resize();
    });
</script>
</body>
</html>
