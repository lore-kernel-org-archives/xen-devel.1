From: Paul Semel <semelpaul@gmail.com>
Subject: [PATCH v3 7/7] add sleep,
 msleep and NOW() macros to time manager
Date: Mon,  9 Apr 2018 16:35:43 +0200
Message-ID: <20180409143543.4568-7-semelpaul@gmail.com>
References: <20180409143543.4568-1-semelpaul@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=he/8=g6=gmail.com=semelpaul@srs-us1.protection.inumbo.net>)
 id 1f5XWe-0004sm-No
 for xen-devel@lists.xenproject.org; Mon, 09 Apr 2018 14:12:04 +0000
Received: by mail-wm0-x243.google.com with SMTP id f125so17045189wme.4
 for <xen-devel@lists.xenproject.org>; Mon, 09 Apr 2018 07:12:04 -0700 (PDT)
In-Reply-To: <20180409143543.4568-1-semelpaul@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: wipawel@amazon.de, Paul Semel <phentex@amazon.de>, roger.pau@citrix.com, andrew.cooper3@citrix.com
List-Id: xen-devel@lists.xenproject.org

RnJvbTogUGF1bCBTZW1lbCA8cGhlbnRleEBhbWF6b24uZGU+Cgp0aG9zZSBhcmUgaGVscGZ1bCBt
YWNybyB0byB1c2UgdGhlIHRpbWUgbWFuYWdlciBjb3JyZWN0bHkKClNpZ25lZC1vZmYtYnk6IFBh
dWwgU2VtZWwgPHBoZW50ZXhAYW1hem9uLmRlPgotLS0KIGNvbW1vbi90aW1lLmMgICAgICB8IDEw
ICsrKysrKysrKysKIGluY2x1ZGUveHRmL3RpbWUuaCB8IDEyICsrKysrKysrKysrKwogMiBmaWxl
cyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvY29tbW9uL3RpbWUuYyBi
L2NvbW1vbi90aW1lLmMKaW5kZXggOTY4NTU5MS4uNzE0YWZiOCAxMDA2NDQKLS0tIGEvY29tbW9u
L3RpbWUuYworKysgYi9jb21tb24vdGltZS5jCkBAIC0xNjMsNiArMTYzLDE2IEBAIHN0YXRpYyBp
bmxpbmUgdm9pZCBtc3Bpbl9zbGVlcCh1aW50NjRfdCB0KQogICAgIG5zcGluX3NsZWVwKG5zZWMp
OwogfQogCit2b2lkIHNsZWVwKHVpbnQ2NF90IHQpCit7CisgICAgc3Bpbl9zbGVlcCh0KTsKK30K
Kwordm9pZCBtc2xlZXAodWludDY0X3QgdCkKK3sKKyAgICBtc3Bpbl9zbGVlcCh0KTsKK30KKwog
LyoKICAqIExvY2FsIHZhcmlhYmxlczoKICAqIG1vZGU6IEMKZGlmZiAtLWdpdCBhL2luY2x1ZGUv
eHRmL3RpbWUuaCBiL2luY2x1ZGUveHRmL3RpbWUuaAppbmRleCAxN2ZiNTYxLi5mZjQzMWEyIDEw
MDY0NAotLS0gYS9pbmNsdWRlL3h0Zi90aW1lLmgKKysrIGIvaW5jbHVkZS94dGYvdGltZS5oCkBA
IC0yOCw4ICsyOCwyMCBAQCB1aW50NjRfdCBzaW5jZV9ib290X3RpbWUodm9pZCk7CiAKIHVpbnQ2
NF90IGN1cnJlbnRfdGltZSh2b2lkKTsKIAorLyogVGhpcyBmdW5jdGlvbiB0YWtlcyBzZWNvbmRz
IGluIHBhcmFtZXRlciAqLwordm9pZCBzbGVlcCh1aW50NjRfdCBmKTsKKworLyogQmUgY2FyZWZ1
bCwgdGhpcyBmdW5jdGlvbiB0YWtlcyBtaWxsaXNlY29uZHMgaW4gcGFyYW1ldGVyLAorICogbm90
IG1pY3Jvc2Vjb25kcyAhCisgKi8KK3ZvaWQgbXNsZWVwKHVpbnQ2NF90IGYpOworCiBpbnQgZ2V0
dGltZW9mZGF5KHN0cnVjdCB0aW1ldmFsICp0cCwgdm9pZCAqcmVzdHJpY3QgdHpwKTsKIAorCisv
KiBUaGlzIHJldHVybnMgdGhlIGN1cnJlbnQgZXBvY2ggdGltZSAqLworI2RlZmluZSBOT1coKSBj
dXJyZW50X3RpbWUoKQorCiAjZW5kaWYgLyogWFRGX1RJTUVfSCAqLwogCiAvKgotLSAKMi4xNi4x
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
