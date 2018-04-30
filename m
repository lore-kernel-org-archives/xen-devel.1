From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: [PATCH 2/4] xen/PVH: Use proper CS selector in long mode
Date: Mon, 30 Apr 2018 12:23:37 -0400
Message-ID: <20180430162339.17143-3-boris.ostrovsky__38106.5464615405$1525105227$gmane$org@oracle.com>
References: <20180430162339.17143-1-boris.ostrovsky@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zpnp=ht=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fDBYY-0003S1-LG
 for xen-devel@lists.xenproject.org; Mon, 30 Apr 2018 16:21:38 +0000
In-Reply-To: <20180430162339.17143-1-boris.ostrovsky@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: jgross@suse.com, Boris Ostrovsky <boris.ostrovsky@oracle.com>, stable@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNv
bT4KQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKLS0tCiBhcmNoL3g4Ni94ZW4veGVuLXB2aC5T
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvYXJjaC94ODYveGVuL3hlbi1wdmguUyBiL2FyY2gveDg2L3hlbi94ZW4tcHZo
LlMKaW5kZXggOTM0ZjdkNC4uMzczZmVmMCAxMDA2NDQKLS0tIGEvYXJjaC94ODYveGVuL3hlbi1w
dmguUworKysgYi9hcmNoL3g4Ni94ZW4veGVuLXB2aC5TCkBAIC05Myw3ICs5Myw3IEBAIEVOVFJZ
KHB2aF9zdGFydF94ZW4pCiAJbW92ICVlYXgsICVjcjAKIAogCS8qIEp1bXAgdG8gNjQtYml0IG1v
ZGUuICovCi0JbGptcCAkX19LRVJORUxfQ1MsICRfcGEoMWYpCisJbGptcCAkX19CT09UX0NTLCAk
X3BhKDFmKQogCiAJLyogNjQtYml0IGVudHJ5IHBvaW50LiAqLwogCS5jb2RlNjQKLS0gCjIuOS4z
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
