From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH] x86/dom0: change align type to int
Date: Fri, 4 Jan 2019 16:14:22 +0100
Message-ID: <20190104151422.38797-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CPMs=PM=citrix.com=prvs=9008e7f41=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gfRBf-0006dq-Sf
 for xen-devel@lists.xenproject.org; Fri, 04 Jan 2019 15:15:03 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlcmUncyBubyByZWFzb24gdG8gdXNlIGxvbmcgdG8gc3RvcmUgdGhlIGFsaWdubWVudCwgc2lu
Y2UgdGhlIGJpZ2dlcgpwYWdlIHNpemUgaXMgMUdCLCBhbmQgdGhlIGFsaWdubWVudCBpcyBzdG9y
ZWQgYXMgYSBmcmFtZSBudW1iZXIuCgpSZXBvcnRlZC1ieTogSmFuIEJldWxpY2ggPEpCZXVsaWNo
QHN1c2UuY29tPgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0
cml4LmNvbT4KLS0tCkNjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNjOiBBbmRy
ZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpDYzogV2VpIExpdSA8d2VpLmxp
dTJAY2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvaHZtL2RvbTBfYnVpbGQuYyB8IDMgKy0t
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEveGVuL2FyY2gveDg2L2h2bS9kb20wX2J1aWxkLmMgYi94ZW4vYXJjaC94ODYvaHZtL2Rv
bTBfYnVpbGQuYwppbmRleCA1YWUzYTMyMDYwLi5iNjk2MTAwMDQzIDEwMDY0NAotLS0gYS94ZW4v
YXJjaC94ODYvaHZtL2RvbTBfYnVpbGQuYworKysgYi94ZW4vYXJjaC94ODYvaHZtL2RvbTBfYnVp
bGQuYwpAQCAtOTIsOCArOTIsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBwdmhfcG9wdWxhdGVfbWVt
b3J5X3JhbmdlKHN0cnVjdCBkb21haW4gKmQsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgbnJfcGFnZXMpCiB7CiAgICAgc3RydWN0IHsK
LSAgICAgICAgdW5zaWduZWQgbG9uZyBhbGlnbjsKLSAgICAgICAgdW5zaWduZWQgaW50IG9yZGVy
OworICAgICAgICB1bnNpZ25lZCBpbnQgYWxpZ24sIG9yZGVyOwogICAgIH0gc3RhdGljIGNvbnN0
IF9faW5pdGNvbnN0IG9yZGVyc1tdID0gewogICAgICAgICAvKiBOQjogbXVzdCBiZSBzb3J0ZWQg
YnkgZGVjcmVhc2luZyBzaXplLiAqLwogICAgICAgICB7IC5hbGlnbiA9IFBGTl9ET1dOKEdCKDEp
KSwgLm9yZGVyID0gUEFHRV9PUkRFUl8xRyB9LAotLSAKMi4xNy4yIChBcHBsZSBHaXQtMTEzKQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
