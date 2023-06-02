class AIntroductionActor : AActor
{
    UPROPERTY()
    float CountdownDuration = 5.0;

    float CurrentTimer = 0.0;
    bool bCountdownActive = false;
    
    UPROPERTY(DefaultComponent, RootComponent)
    USceneComponent SceneRoot;

    UPROPERTY(DefaultComponent, Attach = SceneRoot)
    UStaticMeshComponent Mesh;

    UPROPERTY(DefaultComponent, Attach = SceneRoot)
    UBillboardComponent Billboard;

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        // Start the countdown on beginplay with the configured duration
        CurrentTimer = CountdownDuration;
        bCountdownActive = true;
        Print("You're a real bitch");
    }

    UFUNCTION(BlueprintOverride)
    void Tick(float DeltaSeconds)
    {
        if (bCountdownActive)
        {
            // Count down the timer, and 
            CurrentTimer -= DeltaSeconds;

            if (CurrentTimer <= 0.0)
            {
                // The countdown was complete!
                // Print a message to the screen
                Print("Countdown was completed!");
                bCountdownActive = false;
            }
        }
    }
}