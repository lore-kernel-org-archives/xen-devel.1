From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 3/9] x86/guest: clean up guest/xen.h
Date: Thu, 18 Jan 2018 18:16:46 +0000
Message-ID: <20180118181652.26397-4-wei.liu2@citrix.com>
References: <20180118181652.26397-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=w6dq=en=citrix.com=prvs=5494ca295=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ecEkI-0004VY-1o
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2018 18:17:02 +0000
In-Reply-To: <20180118181652.26397-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

UmVtb3ZlIGV4dHJhbmVvdXMgc2VtaWNvbG9uLiBBZGQgYmxhbmsgbGluZXMuCgpTaWduZWQtb2Zm
LWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgotLS0KQ2M6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+Ci0tLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC94ZW4uaCB8IDEyICsrKysrKysr
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L3hlbi5oIGIveGVuL2luY2x1ZGUv
YXNtLXg4Ni9ndWVzdC94ZW4uaAppbmRleCAxMTI0M2ZlNjBkLi4zMTMyNjQ0MmY3IDEwMDY0NAot
LS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L3hlbi5oCisrKyBiL3hlbi9pbmNsdWRlL2Fz
bS14ODYvZ3Vlc3QveGVuLmgKQEAgLTQ5LDcgKzQ5LDggQEAgREVDTEFSRV9QRVJfQ1BVKHN0cnVj
dCB2Y3B1X2luZm8gKiwgdmNwdV9pbmZvKTsKICNkZWZpbmUgeGVuX2d1ZXN0IDAKICNkZWZpbmUg
cHZfY29uc29sZSAwCiAKLXN0YXRpYyBpbmxpbmUgdm9pZCBwcm9iZV9oeXBlcnZpc29yKHZvaWQp
IHt9Oworc3RhdGljIGlubGluZSB2b2lkIHByb2JlX2h5cGVydmlzb3Iodm9pZCkge30KKwogc3Rh
dGljIGlubGluZSB2b2lkIGh5cGVydmlzb3Jfc2V0dXAodm9pZCkKIHsKICAgICBBU1NFUlRfVU5S
RUFDSEFCTEUoKTsKQEAgLTYzLDIwICs2NCwyMyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgaHlwZXJ2
aXNvcl9maXh1cF9lODIwKHN0cnVjdCBlODIwbWFwICplODIwKQogewogICAgIEFTU0VSVF9VTlJF
QUNIQUJMRSgpOwogfQorCiBzdGF0aWMgaW5saW5lIGNvbnN0IHVuc2lnbmVkIGxvbmcgKmh5cGVy
dmlzb3JfcmVzZXJ2ZWRfcGFnZXModW5zaWduZWQgaW50ICpzaXplKQogewogICAgIEFTU0VSVF9V
TlJFQUNIQUJMRSgpOwogICAgIHJldHVybiBOVUxMOwotfTsKK30KKwogc3RhdGljIGlubGluZSB1
aW50MzJfdCBoeXBlcnZpc29yX2NwdWlkX2Jhc2Uodm9pZCkKIHsKICAgICBBU1NFUlRfVU5SRUFD
SEFCTEUoKTsKICAgICByZXR1cm4gMDsKLX07Cit9CisKIHN0YXRpYyBpbmxpbmUgdm9pZCBoeXBl
cnZpc29yX3Jlc3VtZSh2b2lkKQogewogICAgIEFTU0VSVF9VTlJFQUNIQUJMRSgpOwotfTsKK30K
IAogI2VuZGlmIC8qIENPTkZJR19YRU5fR1VFU1QgKi8KICNlbmRpZiAvKiBfX1g4Nl9HVUVTVF9Y
RU5fSF9fICovCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
