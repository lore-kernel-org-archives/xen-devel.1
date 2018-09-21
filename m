From: Alexandru Isaila <aisaila@bitdefender.com>
Subject: [PATCH v2] x86/hvm: Change return error for offline
 vcpus
Date: Fri, 21 Sep 2018 10:30:30 +0300
Message-ID: <20180921073030.32354-1-aisaila@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=kas4=md=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1g3FuL-0005Vx-88
 for xen-devel@lists.xenproject.org; Fri, 21 Sep 2018 07:31:21 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Alexandru Isaila <aisaila@bitdefender.com>, andrew.cooper3@citrix.com, wei.liu2@citrix.com, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

VGhpcyBwYXRjaCBpcyBuZWVkZWQgaW4gb3JkZXIgdG8gaGF2ZSBhIGRpZmZlcmVudCByZXR1cm4g
ZXJyb3IgZm9yIGludmFsaWQgdmNwdQphbmQgb2ZmbGluZSB2Y3B1IG9uIHRoZSBwZXIgdmNwdSBr
aW5nLgoKU2lnbmVkLW9mZi1ieTogQWxleGFuZHJ1IElzYWlsYSA8YWlzYWlsYUBiaXRkZWZlbmRl
ci5jb20+CgotLS0KQ2hhbmdlcyBzaW5jZSBWMToKCS0gQWRkIGNvbmRpdGlvbmFsIHN0YXRlbWVu
dCBpbiBvcmRlciB0byBoYXZlIGEgZGlmZmVyZW5jZSBiZXR3ZWVuCglwZXJfdmNwdSBhbmQgcGVy
X2RvbSByZXR1cm4gZXJyb3IuCi0tLQogeGVuL2FyY2gveDg2L2h2bS9zYXZlLmMgfCAzICsrLQog
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL3g4Ni9odm0vc2F2ZS5jIGIveGVuL2FyY2gveDg2L2h2bS9zYXZlLmMKaW5k
ZXggZDUyMDg5ODg0My4uMTc2NGZiMDkxOCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2h2bS9z
YXZlLmMKKysrIGIveGVuL2FyY2gveDg2L2h2bS9zYXZlLmMKQEAgLTE2NSw3ICsxNjUsOCBAQCBp
bnQgaHZtX3NhdmVfb25lKHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGludCB0eXBlY29kZSwg
dW5zaWduZWQgaW50IGluc3RhbmNlLAogICAgIGlmICggKHJ2ID0gaHZtX3NyX2hhbmRsZXJzW3R5
cGVjb2RlXS5zYXZlKHYsICZjdHh0KSkgIT0gMCApCiAgICAgICAgIHByaW50ayhYRU5MT0dfR19F
UlIgIkhWTSVkIHNhdmU6IGZhaWxlZCB0byBzYXZlIHR5cGUgJSJQUkl1MTYiICglZClcbiIsCiAg
ICAgICAgICAgICAgICBkLT5kb21haW5faWQsIHR5cGVjb2RlLCBydik7Ci0gICAgZWxzZSBpZiAo
IHJ2ID0gLUVOT0VOVCwgY3R4dC5jdXIgPj0gc2l6ZW9mKCpkZXNjKSApCisgICAgZWxzZSBpZiAo
IHJ2ID0gaHZtX3NyX2hhbmRsZXJzW3R5cGVjb2RlXS5raW5kID09IEhWTVNSX1BFUl9WQ1BVID8K
KyAgICAgICAgICAgICAgLUVOT0RBVEEgOiAtRU5PRU5ULCBjdHh0LmN1ciA+PSBzaXplb2YoKmRl
c2MpICkKICAgICB7CiAgICAgICAgIHVpbnQzMl90IG9mZjsKIAotLSAKMi4xNy4xCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
