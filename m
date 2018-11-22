From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] x86/mwait-idle: Graceful probe failure when
 MWAIT is disabled
Date: Thu, 22 Nov 2018 02:58:03 -0700
Message-ID: <5BF67DAB02000078001FEC32@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kQX2=OB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gPlkO-00036X-8c
 for xen-devel@lists.xenproject.org; Thu, 22 Nov 2018 09:58:08 +0000
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

V2hlbiBNV0FJVCBpcyBkaXNhYmxlZCwgaW50ZWxfaWRsZSByZWZ1c2VzIHRvIHByb2JlLgpCdXQg
aXQgbWF5IG1pcy1sZWFkIHRoZSB1c2VyIGJ5IGJsYW1pbmcgdGhpcyBvbiB0aGUgbW9kZWwgbnVt
YmVyOgoKaW50ZWxfaWRsZTogZG9lcyBub3QgcnVuIG9uIGZhbWlseSA2IG1vZGVzbCA3OQoKU28g
ZGVmZXIgdGhlIGNoZWNrIGZvciBNV0FJVCB1bnRpbCBhZnRlciB0aGUgbW9kZWwjIHdoaXRlLWxp
c3QgY2hlY2sgc3VjY2VlZHMsCmFuZCBpZiB0aGUgTVdBSVQgY2hlY2sgZmFpbHMsIHRlbGwgdGhl
IHVzZXIgaG93IHRvIGZpeCBpdDoKCmludGVsX2lkbGU6IFBsZWFzZSBlbmFibGUgTVdBSVQgaW4g
QklPUyBTRVRVUAoKU2lnbmVkLW9mZi1ieTogTGVuIEJyb3duIDxsZW4uYnJvd25AaW50ZWwuY29t
PgpTaWduZWQtb2ZmLWJ5OiBSYWZhZWwgSi4gV3lzb2NraSA8cmFmYWVsLmoud3lzb2NraUBpbnRl
bC5jb20+CltMaW51eCBjb21taXQ6IGE0YzQ0NzUzM2ExOGVlODZlMDcyMzJkNjM0NGJhMTJiMWY5
YzUwNzddClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0t
LSBhL3hlbi9hcmNoL3g4Ni9jcHUvbXdhaXQtaWRsZS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9jcHUv
bXdhaXQtaWRsZS5jCkBAIC05MTcsOCArOTE3LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBpZGxl
X2NwdSBpZGxlX2NwdV9kbgogfTsKIAogI2RlZmluZSBJQ1BVKG1vZGVsLCBjcHUpIFwKLSAgICB7
IFg4Nl9WRU5ET1JfSU5URUwsIDYsIG1vZGVsLCBYODZfRkVBVFVSRV9NT05JVE9SLCBcCi0gICAg
ICAgICZpZGxlX2NwdV8jI2NwdX0KKwl7IFg4Nl9WRU5ET1JfSU5URUwsIDYsIG1vZGVsLCBYODZf
RkVBVFVSRV9BTFdBWVMsICZpZGxlX2NwdV8jI2NwdX0KIAogc3RhdGljIGNvbnN0IHN0cnVjdCB4
ODZfY3B1X2lkIGludGVsX2lkbGVfaWRzW10gX19pbml0Y29uc3RyZWwgPSB7CiAJSUNQVSgweDFh
LCBuZWhhbGVtKSwKQEAgLTExMjEsNiArMTEyMCwxMSBAQCBzdGF0aWMgaW50IF9faW5pdCBtd2Fp
dF9pZGxlX3Byb2JlKHZvaWQpCiAJCXJldHVybiAtRU5PREVWOwogCX0KIAorCWlmICghYm9vdF9j
cHVfaGFzKFg4Nl9GRUFUVVJFX01PTklUT1IpKSB7CisJCXByX2RlYnVnKFBSRUZJWCAiUGxlYXNl
IGVuYWJsZSBNV0FJVCBpbiBCSU9TIFNFVFVQXG4iKTsKKwkJcmV0dXJuIC1FTk9ERVY7CisJfQor
CiAJaWYgKGJvb3RfY3B1X2RhdGEuY3B1aWRfbGV2ZWwgPCBDUFVJRF9NV0FJVF9MRUFGKQogCQly
ZXR1cm4gLUVOT0RFVjsKIAoKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
