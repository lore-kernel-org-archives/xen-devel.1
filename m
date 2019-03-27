From: Lukas Juenger <juenger@ice.rwth-aachen.de>
Subject: [PATCH] arm/dom0: Add check for maximum number of
 supported vGIC IRQs
Date: Wed, 27 Mar 2019 08:19:58 +0100
Message-ID: <50fee047-6463-4524-9449-51555ed59277@rwthex-w1-a.rwth-ad.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+6G/=R6=ice.rwth-aachen.de=lukas.juenger@srs-us1.protection.inumbo.net>)
 id 1h92r4-0008V3-8X
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2019 07:20:10 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Lukas Juenger <juenger@ice.rwth-aachen.de>
List-Id: xen-devel@lists.xenproject.org

WGVuJ3MgdkdJQyBpbXBsZW1lbnRhdGlvbiBzdXBwb3J0cyBhIG1heGltdW0gbnVtYmVyIG9mIDk5
MiBJUlEgbGluZXMuCkdJQ3YyIHNwZWNpZmljYXRpb24gYWxsb3dzIGZvciAxMDIwIElSUSBsaW5l
cy4KVGhpcyBjb21taXQgYWRkcyBhIGNoZWNrIGZvciB0aGlzIGRpc2NyZXBhbmN5LgoKU2lnbmVk
LW9mZi1ieTogTHVrYXMgSnVlbmdlciAoanVlbmdlckBpY2Uucnd0aC1hYWNoZW4uZGUpCi0tLQog
eGVuL2FyY2gvYXJtL3NldHVwLmMgfCA4ICsrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3NldHVw
LmMgYi94ZW4vYXJjaC9hcm0vc2V0dXAuYwppbmRleCA0NDQ4NTdhOTY3Li4zN2IzNjQ4YTE4IDEw
MDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vc2V0dXAuYworKysgYi94ZW4vYXJjaC9hcm0vc2V0dXAu
YwpAQCAtODg4LDcgKzg4OCwxMyBAQCB2b2lkIF9faW5pdCBzdGFydF94ZW4odW5zaWduZWQgbG9u
ZyBib290X3BoeXNfb2Zmc2V0LAogICAgIC8qIENyZWF0ZSBpbml0aWFsIGRvbWFpbiAwLiAqLwog
ICAgIC8qIFRoZSB2R0lDIGZvciBET00wIGlzIGV4YWN0bHkgZW11bGF0aW5nIHRoZSBoYXJkd2Fy
ZSBHSUMgKi8KICAgICBkb20wX2NmZy5hcmNoLmdpY192ZXJzaW9uID0gWEVOX0RPTUNUTF9DT05G
SUdfR0lDX05BVElWRTsKLSAgICBkb20wX2NmZy5hcmNoLm5yX3NwaXMgPSBnaWNfbnVtYmVyX2xp
bmVzKCkgLSAzMjsKKyAgICAvKgorICAgICAqIFhlbiB2R0lDIHN1cHBvcnRzIGEgbWF4aW11bSBv
ZiA5OTIgSVJRIGxpbmVzLgorICAgICAqIDMyIGFyZSBzdWJzdHJhY3RlZCB0byBjb3ZlciBsb2Nh
bCBJUlFzLgorICAgICAqLworICAgIGRvbTBfY2ZnLmFyY2gubnJfc3BpcyA9IG1pbihnaWNfbnVt
YmVyX2xpbmVzKCksICh1bnNpZ25lZCBpbnQpIDk5MikgLSAzMjsKKyAgICBpZiAoIGdpY19udW1i
ZXJfbGluZXMoKSA+IDk5MiApCisgICAgICAgIHByaW50ayhYRU5MT0dfV0FSTklORyAiTWF4aW11
bSBudW1iZXIgb2YgdkdJQyBJUlFzIGV4Y2VlZGVkLlxuIik7CiAgICAgZG9tMF9jZmcubWF4X3Zj
cHVzID0gZG9tMF9tYXhfdmNwdXMoKTsKIAogICAgIGRvbTAgPSBkb21haW5fY3JlYXRlKDAsICZk
b20wX2NmZywgdHJ1ZSk7Ci0tIAoyLjIxLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
