.class public final Lcom/google/android/gms/common/util/CrashUtils;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-basement@@17.5.0"


# static fields
.field private static final zza:[Ljava/lang/String;

.field private static zzb:Landroid/os/DropBoxManager;

.field private static zzc:Z

.field private static zzd:I

.field private static zze:I

.field private static zzf:I


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 9
    const-string v0, "android."

    const-string v1, "com.android."

    const-string v2, "dalvik."

    const-string v3, "java."

    const-string v4, "javax."

    filled-new-array {v0, v1, v2, v3, v4}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/common/util/CrashUtils;->zza:[Ljava/lang/String;

    .line 10
    const/4 v0, 0x0

    sput-object v0, Lcom/google/android/gms/common/util/CrashUtils;->zzb:Landroid/os/DropBoxManager;

    .line 11
    const/4 v0, 0x0

    sput-boolean v0, Lcom/google/android/gms/common/util/CrashUtils;->zzc:Z

    .line 12
    const/4 v1, -0x1

    sput v1, Lcom/google/android/gms/common/util/CrashUtils;->zzd:I

    .line 13
    sput v0, Lcom/google/android/gms/common/util/CrashUtils;->zze:I

    .line 14
    sput v0, Lcom/google/android/gms/common/util/CrashUtils;->zzf:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addDynamiteErrorToDropBox(Landroid/content/Context;Ljava/lang/Throwable;)Z
    .locals 1

    .line 2
    const/high16 v0, 0x20000000

    invoke-static {p0, p1, v0}, Lcom/google/android/gms/common/util/CrashUtils;->zza(Landroid/content/Context;Ljava/lang/Throwable;I)Z

    move-result p0

    return p0
.end method

.method private static zza(Landroid/content/Context;Ljava/lang/Throwable;I)Z
    .locals 1

    .line 3
    const/4 p2, 0x0

    :try_start_0
    invoke-static {p0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    return p2

    .line 6
    :catch_0
    move-exception p0

    .line 7
    const-string p1, "CrashUtils"

    const-string v0, "Error adding exception to DropBox!"

    invoke-static {p1, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 8
    return p2
.end method
