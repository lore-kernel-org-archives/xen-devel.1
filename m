From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] x86/HVM: avoid memory_type_changed()
 invocations when possible
Date: Mon, 16 Jul 2018 10:45:41 -0600
Message-ID: <5B4CCBB502000078001D4904@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=6083=ka=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ff6dA-0002dL-0f
 for xen-devel@lists.xenproject.org; Mon, 16 Jul 2018 16:45:48 +0000
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhleSdyZSBleHBlbnNpdmUsIGFuZCBub3RoaW5nIGNoYW5nZXMgaWYgTVRSUnMgYXJlIGRpc2Fi
bGVkIGFuZCBhbnkgb2YKdGhlIHJhbmdlcyBnZXRzIGNoYW5nZWQsIG9yIGlmIGZpeGVkIHJhbmdl
IE1UUlJzIGFyZSBkaXNhYmxlZCBhbmQgYW55IG9mCnRoZW0gZ2V0cyBjaGFuZ2VkLgoKU2lnbmVk
LW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0tIGEveGVuL2FyY2gv
eDg2L2h2bS9tdHJyLmMKKysrIGIveGVuL2FyY2gveDg2L2h2bS9tdHJyLmMKQEAgLTQ3Miw3ICs0
NzIsOSBAQCBib29sX3QgbXRycl9maXhfcmFuZ2VfbXNyX3NldChzdHJ1Y3QgZG9tCiAgICAgICAg
ICAgICAgICAgcmV0dXJuIDA7CiAKICAgICAgICAgZml4ZWRfcmFuZ2VfYmFzZVtyb3ddID0gbXNy
X2NvbnRlbnQ7Ci0gICAgICAgIG1lbW9yeV90eXBlX2NoYW5nZWQoZCk7CisKKyAgICAgICAgaWYg
KCBtLT5lbmFibGVkICYmIG0tPmZpeGVkX2VuYWJsZWQgKQorICAgICAgICAgICAgbWVtb3J5X3R5
cGVfY2hhbmdlZChkKTsKICAgICB9CiAKICAgICByZXR1cm4gMTsKQEAgLTUxNSw3ICs1MTcsOCBA
QCBib29sX3QgbXRycl92YXJfcmFuZ2VfbXNyX3NldCgKIAogICAgIG0tPm92ZXJsYXBwZWQgPSBp
c192YXJfbXRycl9vdmVybGFwcGVkKG0pOwogCi0gICAgbWVtb3J5X3R5cGVfY2hhbmdlZChkKTsK
KyAgICBpZiAoIG0tPmVuYWJsZWQgKQorICAgICAgICBtZW1vcnlfdHlwZV9jaGFuZ2VkKGQpOwog
CiAgICAgcmV0dXJuIDE7CiB9CgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
