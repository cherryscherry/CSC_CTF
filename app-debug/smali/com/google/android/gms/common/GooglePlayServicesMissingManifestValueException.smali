.class public final Lcom/google/android/gms/common/GooglePlayServicesMissingManifestValueException;
.super Lcom/google/android/gms/common/GooglePlayServicesManifestException;
.source "com.google.android.gms:play-services-basement@@17.5.0"


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    const-string v1, "A required meta-data tag in your app\'s AndroidManifest.xml does not exist.  You must have the following declaration within the <application> element:     <meta-data android:name=\"com.google.android.gms.version\" android:value=\"@integer/google_play_services_version\" />"

    invoke-direct {p0, v0, v1}, Lcom/google/android/gms/common/GooglePlayServicesManifestException;-><init>(ILjava/lang/String;)V

    .line 2
    return-void
.end method
