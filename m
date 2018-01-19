From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH v2 3/7] x86/guest: clean up guest/xen.h
Date: Fri, 19 Jan 2018 15:34:54 +0000
Message-ID: <20180119153458.22535-4-wei.liu2@citrix.com>
References: <20180119153458.22535-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=pswu=eo=citrix.com=prvs=5505d9d7e=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ecYh9-00020N-W7
 for xen-devel@lists.xenproject.org; Fri, 19 Jan 2018 15:35:08 +0000
In-Reply-To: <20180119153458.22535-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

UmVtb3ZlIGV4dHJhbmVvdXMgc2VtaWNvbG9uLiBBZGQgYmxhbmsgbGluZXMuIFJlbW92ZSB1bnVz
ZWQgc3RhdGljCmlubGluZSBmdW5jdGlvbnMuCgpTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWku
bGl1MkBjaXRyaXguY29tPgotLS0KQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
Q2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CkNjOiBSb2dlciBQ
YXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCiB4ZW4vaW5jbHVkZS9hc20teDg2
L2d1ZXN0L3hlbi5oIHwgMTUgKysrKy0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20t
eDg2L2d1ZXN0L3hlbi5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC94ZW4uaAppbmRleCAx
MTI0M2ZlNjBkLi5jMGFjZjRjMzZlIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2d1
ZXN0L3hlbi5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QveGVuLmgKQEAgLTQ5LDcg
KzQ5LDggQEAgREVDTEFSRV9QRVJfQ1BVKHN0cnVjdCB2Y3B1X2luZm8gKiwgdmNwdV9pbmZvKTsK
ICNkZWZpbmUgeGVuX2d1ZXN0IDAKICNkZWZpbmUgcHZfY29uc29sZSAwCiAKLXN0YXRpYyBpbmxp
bmUgdm9pZCBwcm9iZV9oeXBlcnZpc29yKHZvaWQpIHt9Oworc3RhdGljIGlubGluZSB2b2lkIHBy
b2JlX2h5cGVydmlzb3Iodm9pZCkge30KKwogc3RhdGljIGlubGluZSB2b2lkIGh5cGVydmlzb3Jf
c2V0dXAodm9pZCkKIHsKICAgICBBU1NFUlRfVU5SRUFDSEFCTEUoKTsKQEAgLTYzLDIwICs2NCwx
MiBAQCBzdGF0aWMgaW5saW5lIHZvaWQgaHlwZXJ2aXNvcl9maXh1cF9lODIwKHN0cnVjdCBlODIw
bWFwICplODIwKQogewogICAgIEFTU0VSVF9VTlJFQUNIQUJMRSgpOwogfQorCiBzdGF0aWMgaW5s
aW5lIGNvbnN0IHVuc2lnbmVkIGxvbmcgKmh5cGVydmlzb3JfcmVzZXJ2ZWRfcGFnZXModW5zaWdu
ZWQgaW50ICpzaXplKQogewogICAgIEFTU0VSVF9VTlJFQUNIQUJMRSgpOwogICAgIHJldHVybiBO
VUxMOwotfTsKLXN0YXRpYyBpbmxpbmUgdWludDMyX3QgaHlwZXJ2aXNvcl9jcHVpZF9iYXNlKHZv
aWQpCi17Ci0gICAgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7Ci0gICAgcmV0dXJuIDA7Ci19Owotc3Rh
dGljIGlubGluZSB2b2lkIGh5cGVydmlzb3JfcmVzdW1lKHZvaWQpCi17Ci0gICAgQVNTRVJUX1VO
UkVBQ0hBQkxFKCk7Ci19OworfQogCiAjZW5kaWYgLyogQ09ORklHX1hFTl9HVUVTVCAqLwogI2Vu
ZGlmIC8qIF9fWDg2X0dVRVNUX1hFTl9IX18gKi8KLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
