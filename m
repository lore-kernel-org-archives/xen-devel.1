From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] ALSA: xen-front: fix a loop timeout
Date: Thu, 31 May 2018 09:25:07 +0300
Message-ID: <20180531062507.ajgs4splaboukp2v__11519.4678692662$1527747862$gmane$org@kili.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=f4tr=is=oracle.com=dan.carpenter@srs-us1.protection.inumbo.net>)
 id 1fOH1c-0003mG-Uc
 for xen-devel@lists.xenproject.org; Thu, 31 May 2018 06:25:29 +0000
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Cc: xen-devel@lists.xenproject.org, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
List-Id: xen-devel@lists.xenproject.org

V2Ugd2FudCB0aGUgbG9vcCB0byBleGl0IHdoZW4gInRvIiBpcyBzZXQgdG8gemVybywgYnV0IGlu
IHRoZSBjdXJyZW50CmNvZGUgaXQncyBzZXQgdG8gLTEuICBBbHNvIEkgdHdlYWtlZCB0aGUgaW5k
ZW50aW5nIHNvIGl0IGRvZXNuJ3QgbG9vawpsaWtlIHdlJ3JlIHBhc3NpbmcgIi0tdG8iIHRvIHhl
bmJ1c19yZWFkX3Vuc2lnbmVkKCkuCgpGaXhlczogY2MzMTk2YWUxOTdjICgiQUxTQTogeGVuLWZy
b250OiBJbnRyb2R1Y2UgWGVuIHBhcmEtdmlydHVhbGl6ZWQgc291bmQgZnJvbnRlbmQgZHJpdmVy
IikKU2lnbmVkLW9mZi1ieTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29t
PgoKZGlmZiAtLWdpdCBhL3NvdW5kL3hlbi94ZW5fc25kX2Zyb250LmMgYi9zb3VuZC94ZW4veGVu
X3NuZF9mcm9udC5jCmluZGV4IGMxODk3M2E5YmM5Yi4uYjA4OWIxM2I1MTYwIDEwMDY0NAotLS0g
YS9zb3VuZC94ZW4veGVuX3NuZF9mcm9udC5jCisrKyBiL3NvdW5kL3hlbi94ZW5fc25kX2Zyb250
LmMKQEAgLTMzNCw3ICszMzQsNyBAQCBzdGF0aWMgaW50IHhlbl9kcnZfcmVtb3ZlKHN0cnVjdCB4
ZW5idXNfZGV2aWNlICpkZXYpCiAJICovCiAJd2hpbGUgKCh4ZW5idXNfcmVhZF91bnNpZ25lZChm
cm9udF9pbmZvLT54Yl9kZXYtPm90aGVyZW5kLCAic3RhdGUiLAogCQkJCSAgICAgWGVuYnVzU3Rh
dGVVbmtub3duKSAhPSBYZW5idXNTdGF0ZUluaXRXYWl0KSAmJgotCQkJCSAgICAgdG8tLSkKKwkg
ICAgICAgLS10bykKIAkJbXNsZWVwKDEwKTsKIAogCWlmICghdG8pIHsKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
