From: Michael Young <m.a.young@durham.ac.uk>
Subject: [PATCH v2] -xen-attach is needed for pvh boot with
	qemu-xen
Date: Mon, 15 Jan 2018 21:23:20 +0000 (GMT)
Message-ID: <alpine.LFD.2.21.1801152110570.2827@austen3.home>
Mime-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-1003536512-1516051179=:2827"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=8klc=ek=durham.ac.uk=m.a.young@srs-us1.protection.inumbo.net>)
 id 1ebCE9-0001fv-MC
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2018 21:23:34 +0000
Content-ID: <alpine.LFD.2.21.1801152120130.2827@austen3.home>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, =?ISO-8859-15?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1003536512-1516051179=:2827
Content-Type: text/plain; CHARSET=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.LFD.2.21.1801152120131.2827@austen3.home>

Currently the boot of a pvh guest using the qemu-xen device model fails
with the error
xen emulation not implemented (yet)
in the qemu-dm log file. This patch adds the missing -xen-attach
argument.

V2: Use  b_info->type != LIBXL_DOMAIN_TYPE_HVM    instead of
 	(b_info->type == LIBXL_DOMAIN_TYPE_PV) ||
 	(b_info->type == LIBXL_DOMAIN_TYPE_PVH)
as recommended by Roger Pau Monné.

Signed-off-by: Michael Young <m.a.young@durham.ac.uk>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

---
  tools/libxl/libxl_dm.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libxl/libxl_dm.c b/tools/libxl/libxl_dm.c
index a2ea95a9be..a3cddce8b7 100644
--- a/tools/libxl/libxl_dm.c
+++ b/tools/libxl/libxl_dm.c
@@ -1021,7 +1021,7 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
       */
      flexarray_append(dm_args, "-no-user-config");

-    if (b_info->type == LIBXL_DOMAIN_TYPE_PV) {
+    if (b_info->type != LIBXL_DOMAIN_TYPE_HVM) {
          flexarray_append(dm_args, "-xen-attach");
      }

-- 
2.14.3
--8323328-1003536512-1516051179=:2827
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323328-1003536512-1516051179=:2827--
