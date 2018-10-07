From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: [PATCH] xen/balloon: Support xend-based toolstack
Date: Sun,  7 Oct 2018 16:05:38 -0400
Message-ID: <20181007200538.19320-1-boris.ostrovsky__18719.4985257976$1538942741$gmane$org@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=5dvh=mt=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1g9FJx-0001VJ-2C
 for xen-devel@lists.xenproject.org; Sun, 07 Oct 2018 20:06:33 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: jgross@suse.com, Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

WGVuZC1iYXNlZCB0b29sc3RhY2tzIGRvbid0IGhhdmUgc3RhdGljLW1heCBlbnRyeSBpbiB4ZW5z
dG9yZS4gVGhlCmVxdWl2YWxlbnQgbm9kZSBmb3IgdGhvc2UgdG9vbHN0YWNrcyBpcyBtZW1vcnlf
c3RhdGljX21heC4KCkZpeGVzOiA1MjY2YjhlNDQ0NWMgKHhlbjogZml4IGJvb3RpbmcgYmFsbG9v
bmVkIGRvd24gaHZtIGd1ZXN0KQpTaWduZWQtb2ZmLWJ5OiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlz
Lm9zdHJvdnNreUBvcmFjbGUuY29tPgpDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+ICMgNC4x
MwotLS0KIGRyaXZlcnMveGVuL3hlbi1iYWxsb29uLmMgfCAxMyArKysrKysrKy0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMveGVuL3hlbi1iYWxsb29uLmMgYi9kcml2ZXJzL3hlbi94ZW4tYmFsbG9vbi5jCmlu
ZGV4IDYzYzE0OTRhOGQ3My4uMmFjYmZlMTA0ZTQ2IDEwMDY0NAotLS0gYS9kcml2ZXJzL3hlbi94
ZW4tYmFsbG9vbi5jCisrKyBiL2RyaXZlcnMveGVuL3hlbi1iYWxsb29uLmMKQEAgLTc2LDEyICs3
NiwxNSBAQCBzdGF0aWMgdm9pZCB3YXRjaF90YXJnZXQoc3RydWN0IHhlbmJ1c193YXRjaCAqd2F0
Y2gsCiAKIAlpZiAoIXdhdGNoX2ZpcmVkKSB7CiAJCXdhdGNoX2ZpcmVkID0gdHJ1ZTsKLQkJZXJy
ID0geGVuYnVzX3NjYW5mKFhCVF9OSUwsICJtZW1vcnkiLCAic3RhdGljLW1heCIsICIlbGx1IiwK
LQkJCQkgICAmc3RhdGljX21heCk7Ci0JCWlmIChlcnIgIT0gMSkKLQkJCXN0YXRpY19tYXggPSBu
ZXdfdGFyZ2V0OwotCQllbHNlCisKKwkJaWYgKCh4ZW5idXNfc2NhbmYoWEJUX05JTCwgIm1lbW9y
eSIsICJzdGF0aWMtbWF4IiwKKwkJCQkgICIlbGx1IiwgJnN0YXRpY19tYXgpID09IDEpIHx8CisJ
CSAgICAoeGVuYnVzX3NjYW5mKFhCVF9OSUwsICJtZW1vcnkiLCAibWVtb3J5X3N0YXRpY19tYXgi
LAorCQkJCSAgIiVsbHUiLCAmc3RhdGljX21heCkgPT0gMSkpCiAJCQlzdGF0aWNfbWF4ID4+PSBQ
QUdFX1NISUZUIC0gMTA7CisJCWVsc2UKKwkJCXN0YXRpY19tYXggPSBuZXdfdGFyZ2V0OworCiAJ
CXRhcmdldF9kaWZmID0gKHhlbl9wdl9kb21haW4oKSB8fCB4ZW5faW5pdGlhbF9kb21haW4oKSkg
PyAwCiAJCQkJOiBzdGF0aWNfbWF4IC0gYmFsbG9vbl9zdGF0cy50YXJnZXRfcGFnZXM7CiAJfQot
LSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
