From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH v5 0/1] drm/xen-front: Add support for Xen
 PV display frontend
Date: Thu, 29 Mar 2018 12:24:33 +0300
Message-ID: <7d9511c8-c3ed-b834-3f23-9664281d4468__7152.11724532327$1522315403$gmane$org@gmail.com>
References: <20180329092247.23905-1-andr2000@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------B0F36CF2C88CD34800597A42"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=crdi=gt=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1f1TnS-0000Wl-Jx
 for xen-devel@lists.xenproject.org; Thu, 29 Mar 2018 09:24:38 +0000
Received: by mail-lf0-x229.google.com with SMTP id m200-v6so1689997lfm.4
 for <xen-devel@lists.xenproject.org>; Thu, 29 Mar 2018 02:24:37 -0700 (PDT)
In-Reply-To: <20180329092247.23905-1-andr2000@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, airlied@linux.ie, daniel.vetter@intel.com, seanpaul@chromium.org, gustavo@padovan.org, jgross@suse.com, boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

This is a multi-part message in MIME format.
--------------B0F36CF2C88CD34800597A42
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/29/2018 12:22 PM, Oleksandr Andrushchenko wrote:
> Changes since v4:
For your convenience I am attaching diff between v4..v5

--------------B0F36CF2C88CD34800597A42
Content-Type: text/x-patch;
 name="v4_v5.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="v4_v5.diff"

diff --git a/Documentation/gpu/xen-front.rst b/Documentation/gpu/xen-front.rst
index 8188e03c9d23..009d942386c5 100644
--- a/Documentation/gpu/xen-front.rst
+++ b/Documentation/gpu/xen-front.rst
@@ -1,6 +1,6 @@
-====================================
-Xen para-virtualized frontend driver
-====================================
+====================================================
+ drm/xen-front Xen para-virtualized frontend driver
+====================================================
 
 This frontend driver implements Xen para-virtualized display
 according to the display protocol described at
diff --git a/drivers/gpu/drm/xen/xen_drm_front_evtchnl.c b/drivers/gpu/drm/xen/xen_drm_front_evtchnl.c
index e521785fd22b..02b6f3d9fe4c 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_evtchnl.c
+++ b/drivers/gpu/drm/xen/xen_drm_front_evtchnl.c
@@ -186,8 +186,10 @@ static int evtchnl_alloc(struct xen_drm_front_info *front_info, int index,
 				sring, XEN_PAGE_SIZE);
 
 		ret = xenbus_grant_ring(xb_dev, sring, 1, &gref);
-		if (ret < 0)
+		if (ret < 0) {
+			free_page(page);
 			goto fail;
+		}
 
 		handler = evtchnl_interrupt_ctrl;
 	} else {
@@ -195,8 +197,10 @@ static int evtchnl_alloc(struct xen_drm_front_info *front_info, int index,
 
 		ret = gnttab_grant_foreign_access(xb_dev->otherend_id,
 				virt_to_gfn((void *)page), 0);
-		if (ret < 0)
+		if (ret < 0) {
+			free_page(page);
 			goto fail;
+		}
 
 		gref = ret;
 		handler = evtchnl_interrupt_evt;
diff --git a/drivers/gpu/drm/xen/xen_drm_front_kms.c b/drivers/gpu/drm/xen/xen_drm_front_kms.c
index 545049dfaf0a..f3ef9dfb4dfb 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_kms.c
+++ b/drivers/gpu/drm/xen/xen_drm_front_kms.c
@@ -107,12 +107,13 @@ static void send_pending_event(struct xen_drm_front_drm_pipeline *pipeline)
 }
 
 static void display_enable(struct drm_simple_display_pipe *pipe,
-		struct drm_crtc_state *crtc_state)
+		struct drm_crtc_state *crtc_state,
+		struct drm_plane_state *plane_state)
 {
 	struct xen_drm_front_drm_pipeline *pipeline =
 			to_xen_drm_pipeline(pipe);
 	struct drm_crtc *crtc = &pipe->crtc;
-	struct drm_framebuffer *fb = pipe->plane.state->fb;
+	struct drm_framebuffer *fb = plane_state->fb;
 	int ret, idx;
 
 	if (!drm_dev_enter(pipe->crtc.dev, &idx))
@@ -273,7 +274,7 @@ static void display_update(struct drm_simple_display_pipe *pipe,
 	drm_dev_exit(idx);
 }
 
-enum drm_mode_status display_mode_valid(struct drm_crtc *crtc,
+static enum drm_mode_status display_mode_valid(struct drm_crtc *crtc,
 		const struct drm_display_mode *mode)
 {
 	struct xen_drm_front_drm_pipeline *pipeline =

--------------B0F36CF2C88CD34800597A42
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------B0F36CF2C88CD34800597A42--
