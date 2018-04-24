From: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] xen-netback: fix xenvif_start_xmit()'s return
 type
Date: Tue, 24 Apr 2018 15:18:12 +0200
Message-ID: <20180424131812.5014-1-luc.vanoostenryck__28920.8267852247$1524575940$gmane$org@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=+4n8=hn=gmail.com=luc.vanoostenryck@srs-us1.protection.inumbo.net>)
 id 1fAxpo-000642-Td
 for xen-devel@lists.xenproject.org; Tue, 24 Apr 2018 13:18:16 +0000
Received: by mail-wm0-x244.google.com with SMTP id t67so915288wmt.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Apr 2018 06:18:14 -0700 (PDT)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-kernel@vger.kernel.org
Cc: xen-devel@lists.xenproject.org, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, netdev@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

VGhlIG1ldGhvZCBuZG9fc3RhcnRfeG1pdCgpIGlzIGRlZmluZWQgYXMgcmV0dXJuaW5nIGFuICdu
ZXRkZXZfdHhfdCcsCndoaWNoIGlzIGEgdHlwZWRlZiBmb3IgYW4gZW51bSB0eXBlLCBidXQgdGhl
IGltcGxlbWVudGF0aW9uIGluIHRoaXMKZHJpdmVyIHJldHVybnMgYW4gJ2ludCcuCgpGaXggdGhp
cyBieSByZXR1cm5pbmcgJ25ldGRldl90eF90JyBpbiB0aGlzIGRyaXZlciB0b28uCgpTaWduZWQt
b2ZmLWJ5OiBMdWMgVmFuIE9vc3RlbnJ5Y2sgPGx1Yy52YW5vb3N0ZW5yeWNrQGdtYWlsLmNvbT4K
LS0tCiBkcml2ZXJzL25ldC94ZW4tbmV0YmFjay9pbnRlcmZhY2UuYyB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbmV0L3hlbi1uZXRiYWNrL2ludGVyZmFjZS5jIGIvZHJpdmVycy9uZXQveGVuLW5ldGJhY2sv
aW50ZXJmYWNlLmMKaW5kZXggNzhlYmU0OTRmLi5iYjk0NGFhMDkgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvbmV0L3hlbi1uZXRiYWNrL2ludGVyZmFjZS5jCisrKyBiL2RyaXZlcnMvbmV0L3hlbi1uZXRi
YWNrL2ludGVyZmFjZS5jCkBAIC0xNjUsNyArMTY1LDcgQEAgc3RhdGljIHUxNiB4ZW52aWZfc2Vs
ZWN0X3F1ZXVlKHN0cnVjdCBuZXRfZGV2aWNlICpkZXYsIHN0cnVjdCBza19idWZmICpza2IsCiAJ
cmV0dXJuIHZpZi0+aGFzaC5tYXBwaW5nW3NrYl9nZXRfaGFzaF9yYXcoc2tiKSAlIHNpemVdOwog
fQogCi1zdGF0aWMgaW50IHhlbnZpZl9zdGFydF94bWl0KHN0cnVjdCBza19idWZmICpza2IsIHN0
cnVjdCBuZXRfZGV2aWNlICpkZXYpCitzdGF0aWMgbmV0ZGV2X3R4X3QgeGVudmlmX3N0YXJ0X3ht
aXQoc3RydWN0IHNrX2J1ZmYgKnNrYiwgc3RydWN0IG5ldF9kZXZpY2UgKmRldikKIHsKIAlzdHJ1
Y3QgeGVudmlmICp2aWYgPSBuZXRkZXZfcHJpdihkZXYpOwogCXN0cnVjdCB4ZW52aWZfcXVldWUg
KnF1ZXVlID0gTlVMTDsKLS0gCjIuMTcuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
