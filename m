From: Lukas Juenger <juenger@ice.rwth-aachen.de>
Subject: [PATCH] arm/dom0: Add check for maximum number of
 supported vGIC IRQs
Date: Tue, 26 Mar 2019 16:35:16 +0100
Message-ID: <1553614518-16421-1-git-send-email-juenger@ice.rwth-aachen.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OmWv=R5=ice.rwth-aachen.de=juenger@srs-us1.protection.inumbo.net>)
 id 1h8o6o-0008S0-OM
 for xen-devel@lists.xenproject.org; Tue, 26 Mar 2019 15:35:26 +0000
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
LmMgYi94ZW4vYXJjaC9hcm0vc2V0dXAuYwppbmRleCA0NDQ4NTdhLi4zN2IzNjQ4IDEwMDY0NAot
LS0gYS94ZW4vYXJjaC9hcm0vc2V0dXAuYworKysgYi94ZW4vYXJjaC9hcm0vc2V0dXAuYwpAQCAt
ODg4LDcgKzg4OCwxMyBAQCB2b2lkIF9faW5pdCBzdGFydF94ZW4odW5zaWduZWQgbG9uZyBib290
X3BoeXNfb2Zmc2V0LAogICAgIC8qIENyZWF0ZSBpbml0aWFsIGRvbWFpbiAwLiAqLwogICAgIC8q
IFRoZSB2R0lDIGZvciBET00wIGlzIGV4YWN0bHkgZW11bGF0aW5nIHRoZSBoYXJkd2FyZSBHSUMg
Ki8KICAgICBkb20wX2NmZy5hcmNoLmdpY192ZXJzaW9uID0gWEVOX0RPTUNUTF9DT05GSUdfR0lD
X05BVElWRTsKLSAgICBkb20wX2NmZy5hcmNoLm5yX3NwaXMgPSBnaWNfbnVtYmVyX2xpbmVzKCkg
LSAzMjsKKyAgICAvKgorICAgICAqIFhlbiB2R0lDIHN1cHBvcnRzIGEgbWF4aW11bSBvZiA5OTIg
SVJRIGxpbmVzLgorICAgICAqIDMyIGFyZSBzdWJzdHJhY3RlZCB0byBjb3ZlciBsb2NhbCBJUlFz
LgorICAgICAqLworICAgIGRvbTBfY2ZnLmFyY2gubnJfc3BpcyA9IG1pbihnaWNfbnVtYmVyX2xp
bmVzKCksICh1bnNpZ25lZCBpbnQpIDk5MikgLSAzMjsKKyAgICBpZiAoIGdpY19udW1iZXJfbGlu
ZXMoKSA+IDk5MiApCisgICAgICAgIHByaW50ayhYRU5MT0dfV0FSTklORyAiTWF4aW11bSBudW1i
ZXIgb2YgdkdJQyBJUlFzIGV4Y2VlZGVkLlxuIik7CiAgICAgZG9tMF9jZmcubWF4X3ZjcHVzID0g
ZG9tMF9tYXhfdmNwdXMoKTsKIAogICAgIGRvbTAgPSBkb21haW5fY3JlYXRlKDAsICZkb20wX2Nm
ZywgdHJ1ZSk7Ci0tIAoxLjguMy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
