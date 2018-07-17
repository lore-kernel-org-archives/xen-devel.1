From: Oleksandr Grytsov <al1img@gmail.com>
Subject: [PATCH v3 7/7] libxl: add LIBXL_HAVE_EXTENDED_VKB define
Date: Tue, 17 Jul 2018 19:07:40 +0300
Message-ID: <20180717160740.26845-8-al1img@gmail.com>
References: <20180717160740.26845-1-al1img@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=pfxt=kb=gmail.com=al1img@srs-us1.protection.inumbo.net>)
 id 1ffSW9-000309-Nz
 for xen-devel@lists.xenproject.org; Tue, 17 Jul 2018 16:08:01 +0000
Received: by mail-lf0-x242.google.com with SMTP id m13-v6so1235556lfb.12
 for <xen-devel@lists.xenproject.org>; Tue, 17 Jul 2018 09:08:00 -0700 (PDT)
In-Reply-To: <20180717160740.26845-1-al1img@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: ian.jackson@eu.citrix.com, wei.liu2@citrix.com, Oleksandr Grytsov <oleksandr_grytsov@epam.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogT2xla3NhbmRyIEdyeXRzb3YgPG9sZWtzYW5kcl9ncnl0c292QGVwYW0uY29tPgoKTElC
WExfSEFWRV9FWFRFTkRFRF9WS0IgZGVmaW5lIGluZGljYXRlcyB0aGF0IGxpYnhsX2RldmljZV92
a2Igc3RydWN0dXJlIGhhcwpleHRlbmRlZCBmaWVsZHMuCgpTaWduZWQtb2ZmLWJ5OiBPbGVrc2Fu
ZHIgR3J5dHNvdiA8b2xla3NhbmRyX2dyeXRzb3ZAZXBhbS5jb20+Ci0tLQogdG9vbHMvbGlieGwv
bGlieGwuaCB8IDE2ICsrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGwuaCBiL3Rvb2xzL2xpYnhsL2xp
YnhsLmgKaW5kZXggOTE5ZjY2MGM1MS4uYWUyZDYzZGYwYyAxMDA2NDQKLS0tIGEvdG9vbHMvbGli
eGwvbGlieGwuaAorKysgYi90b29scy9saWJ4bC9saWJ4bC5oCkBAIC0zNTQsNiArMzU0LDIyIEBA
CiAjZGVmaW5lIExJQlhMX0hBVkVfQlVJTERJTkZPX0JPT1RMT0FERVIgMQogI2RlZmluZSBMSUJY
TF9IQVZFX0JVSUxESU5GT19CT09UTE9BREVSX0FSR1MgMQogCisvKgorICogTElCWExfSEFWRV9F
WFRFTkRFRF9WS0IgaW5kaWNhdGVzIHRoYXQgbGlieGxfZGV2aWNlX3ZrYiBoYXMgZXh0ZW5kZWQg
ZmllbGRzOgorICogIC0gdW5pcXVlX2lkOworICogIC0gZmVhdHVyZV9kaXNhYmxlX2tleWJvYXJk
OworICogIC0gZmVhdHVyZV9kaXNhYmxlX3BvaW50ZXI7CisgKiAgLSBmZWF0dXJlX2Fic19wb2lu
dGVyOworICogIC0gZmVhdHVyZV9yYXdfcG9pbnRlcjsKKyAqICAtIGZlYXR1cmVfbXVsdGlfdG91
Y2g7CisgKiAgLSB3aWR0aDsKKyAqICAtIGhlaWdodDsKKyAqICAtIG11bHRpX3RvdWNoX3dpZHRo
OworICogIC0gbXVsdGlfdG91Y2hfaGVpZ2h0OworICogIC0gbXVsdGlfdG91Y2hfbnVtX2NvbnRh
Y3RzLgorICovCisjZGVmaW5lIExJQlhMX0hBVkVfRVhURU5ERURfVktCIDEKKwogLyoKICAqIGxp
YnhsIEFCSSBjb21wYXRpYmlsaXR5CiAgKgotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
