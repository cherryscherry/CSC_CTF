.class final Lcom/google/android/gms/internal/base/zag;
.super Landroid/graphics/drawable/Drawable;
.source "com.google.android.gms:play-services-base@@17.5.0"


# static fields
.field private static final zaa:Lcom/google/android/gms/internal/base/zag;

.field private static final zab:Lcom/google/android/gms/internal/base/zaj;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 8
    new-instance v0, Lcom/google/android/gms/internal/base/zag;

    invoke-direct {v0}, Lcom/google/android/gms/internal/base/zag;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/base/zag;->zaa:Lcom/google/android/gms/internal/base/zag;

    .line 9
    new-instance v0, Lcom/google/android/gms/internal/base/zaj;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/base/zaj;-><init>(Lcom/google/android/gms/internal/base/zah;)V

    sput-object v0, Lcom/google/android/gms/internal/base/zag;->zab:Lcom/google/android/gms/internal/base/zaj;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    return-void
.end method

.method static synthetic zaa()Lcom/google/android/gms/internal/base/zag;
    .locals 1

    .line 7
    sget-object v0, Lcom/google/android/gms/internal/base/zag;->zaa:Lcom/google/android/gms/internal/base/zag;

    return-object v0
.end method


# virtual methods
.method public final draw(Landroid/graphics/Canvas;)V
    .locals 0

    .line 2
    return-void
.end method

.method public final getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;
    .locals 1

    .line 6
    sget-object v0, Lcom/google/android/gms/internal/base/zag;->zab:Lcom/google/android/gms/internal/base/zaj;

    return-object v0
.end method

.method public final getOpacity()I
    .locals 1

    .line 5
    const/4 v0, -0x2

    return v0
.end method

.method public final setAlpha(I)V
    .locals 0

    .line 3
    return-void
.end method

.method public final setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0

    .line 4
    return-void
.end method
