.class public final Lcom/google/android/gms/internal/tasks/zzb;
.super Landroid/os/Handler;
.source "com.google.android.gms:play-services-tasks@@17.2.0"


# static fields
.field private static zza:Lcom/google/android/gms/internal/tasks/zza;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 5
    const/4 v0, 0x0

    sput-object v0, Lcom/google/android/gms/internal/tasks/zzb;->zza:Lcom/google/android/gms/internal/tasks/zza;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 2
    return-void
.end method

.method public constructor <init>(Landroid/os/Looper;)V
    .locals 0

    .line 3
    invoke-direct {p0, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 4
    return-void
.end method
