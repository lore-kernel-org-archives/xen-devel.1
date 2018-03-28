From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH v4 2/2] drm/xen-front: Add support for Xen
 PV display frontend
Date: Wed, 28 Mar 2018 13:29:46 +0300
Message-ID: <32481355-27f6-695b-c6c1-8113ea268a33__19710.328061092$1522232932$gmane$org@gmail.com>
References: <1522219661-26827-1-git-send-email-andr2000@gmail.com>
 <1522219661-26827-3-git-send-email-andr2000@gmail.com>
 <20180328074251.GE14155@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------6AD22DBA8A9729784F0E8A7D"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=3iov=gs=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1f18L2-0007we-6D
 for xen-devel@lists.xenproject.org; Wed, 28 Mar 2018 10:29:52 +0000
Received: by mail-lf0-x233.google.com with SMTP id o102-v6so2724937lfg.8
 for <xen-devel@lists.xenproject.org>; Wed, 28 Mar 2018 03:29:50 -0700 (PDT)
In-Reply-To: <20180328074251.GE14155@phenom.ffwll.local>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: daniel.vetter@intel.com
Cc: jgross@suse.com, airlied@linux.ie, gustavo@padovan.org, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, seanpaul@chromium.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

This is a multi-part message in MIME format.
--------------6AD22DBA8A9729784F0E8A7D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Daniel!

I just noticed I have missed one change in the patch:
the below must be static.

On 03/28/2018 10:42 AM, Daniel Vetter wrote:
> +enum drm_mode_status display_mode_valid(struct drm_crtc *crtc,
> +		const struct drm_display_mode *mode)
> +{
> +	struct xen_drm_front_drm_pipeline *pipeline =
> +			container_of(crtc,
Could you please amend the patch in attachment
when merging, so I don't resend?

Thank you in advance,
Oleksandr

--------------6AD22DBA8A9729784F0E8A7D
Content-Type: text/x-patch;
 name="0001-drm-xen-front-Make-display_mode_valid-static.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-drm-xen-front-Make-display_mode_valid-static.patch"

>From 3a82d76bd3d954056b760e5d1d09e2f96a2786ef Mon Sep 17 00:00:00 2001
From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Date: Wed, 28 Mar 2018 13:24:04 +0300
Subject: [PATCH] drm/xen-front: Make display_mode_valid static

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
 drivers/gpu/drm/xen/xen_drm_front_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xen/xen_drm_front_kms.c b/drivers/gpu/drm/xen/xen_drm_front_kms.c
index 545049dfaf0a..bd676be5a0db 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_kms.c
+++ b/drivers/gpu/drm/xen/xen_drm_front_kms.c
@@ -273,7 +273,7 @@ static void display_update(struct drm_simple_display_pipe *pipe,
 	drm_dev_exit(idx);
 }
 
-enum drm_mode_status display_mode_valid(struct drm_crtc *crtc,
+static enum drm_mode_status display_mode_valid(struct drm_crtc *crtc,
 		const struct drm_display_mode *mode)
 {
 	struct xen_drm_front_drm_pipeline *pipeline =
-- 
2.7.4


--------------6AD22DBA8A9729784F0E8A7D
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------6AD22DBA8A9729784F0E8A7D--
