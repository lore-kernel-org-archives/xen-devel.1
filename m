From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] x86/mwait-idle: add Gemini Lake support
Date: Tue, 06 Mar 2018 09:53:14 -0700
Message-ID: <5A9ED58A02000078001AF1D8@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=c2h8=f4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1etFq9-0007mL-JB
 for xen-devel@lists.xenproject.org; Tue, 06 Mar 2018 16:53:25 +0000
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

RnJvbTogRGF2aWQgRS4gQm94IDxkYXZpZC5lLmJveEBsaW51eC5pbnRlbC5jb20+CgpHZW1pbmkg
TGFrZSB1c2VzIHRoZSBzYW1lIEMtc3RhdGVzIGFzIEJyb3h0b24gYW5kIGFsc28gdXNlcyB0aGUK
SVJUTCBNU1IncyB0byBkZXRlcm1pbmUgbWF4aW11bSBDLXN0YXRlIGxhdGVuY3kuCgpTaWduZWQt
b2ZmLWJ5OiBEYXZpZCBFLiBCb3ggPGRhdmlkLmUuYm94QGxpbnV4LmludGVsLmNvbT4KQWNrZWQt
Ynk6IExlbiBCcm93biA8bGVuLmJyb3duQGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogUmFmYWVs
IEouIFd5c29ja2kgPHJhZmFlbC5qLnd5c29ja2lAaW50ZWwuY29tPgpbTGludXggY29tbWl0IDFi
MmU4NzY4N2QzZjk1MWE2NjkwMGNhYjZmMTU4M2Q5NDA5OWQyZjddClNpZ25lZC1vZmYtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0tLSBhL3hlbi9hcmNoL3g4Ni9jcHUvbXdh
aXQtaWRsZS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9jcHUvbXdhaXQtaWRsZS5jCkBAIC05NTcsNiAr
OTU3LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB4ODZfY3B1X2lkIGludGVsX2lkbAogCUlDUFUo
MHg1Nywga25sKSwKIAlJQ1BVKDB4ODUsIGtubCksCiAJSUNQVSgweDVjLCBieHQpLAorCUlDUFUo
MHg3YSwgYnh0KSwKIAlJQ1BVKDB4NWYsIGRudiksCiAJe30KIH07CkBAIC0xMTAyLDYgKzExMDMs
NyBAQCBzdGF0aWMgdm9pZCBfX2luaXQgbXdhaXRfaWRsZV9zdGF0ZV90YWJsCiAJCWl2dF9pZGxl
X3N0YXRlX3RhYmxlX3VwZGF0ZSgpOwogCQlicmVhazsKIAljYXNlIDB4NWM6IC8qIEJYVCAqLwor
CWNhc2UgMHg3YToKIAkJYnh0X2lkbGVfc3RhdGVfdGFibGVfdXBkYXRlKCk7CiAJCWJyZWFrOwog
CWNhc2UgMHg1ZTogLyogU0tMLUggKi8KCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
