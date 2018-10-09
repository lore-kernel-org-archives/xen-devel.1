From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH] x86/vtd: fix IOMMU share PT destruction path
Date: Tue, 9 Oct 2018 11:42:17 +0100
Message-ID: <20181009104217.24098-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=+8ch=mv=citrix.com=prvs=8135aa832=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g9pT3-0003ib-GZ
 for xen-devel@lists.xenproject.org; Tue, 09 Oct 2018 10:42:21 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Kevin Tian <kevin.tian@intel.com>, Paul Durrant <Paul.Durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Q29tbWl0IDI5MTY5NTFjMSAoIm1tIC8gaW9tbXU6IGluY2x1ZGUgbmVlZF9pb21tdSgpIHRlc3Qg
aW4KaW9tbXVfdXNlX2hhcF9wdCgpIikgaW5jbHVkZWQgbmVlZF9pb21tdSgpIGluIGlvbW11X3Vz
ZV9oYXBfcHQgYW5kCjkxZDRlY2E3YWRkICgiIG1tIC8gaW9tbXU6IHNwbGl0IG5lZWRfaW9tbXUo
KSBpbnRvIGhhc19pb21tdV9wdCgpIGFuZApuZWVkX2lvbW11X3B0X3N5bmMoKSIpIG1hZGUgdGhp
bmdzIGZpbmVyIGdyYWluIGJ5IHNwbGl0aW5nIG5lZWRfaW9tbXUKaW50byB0aHJlZSBzdGF0ZXMu
CgpUaGUgZGVzdHJ1Y3Rpb24gcGF0aCBjYW4ndCB1c2UgaW9tbXVfdXNlX2hhcF9wdCBiZWNhdXNl
IGF0IHRoZSBwb2ludApwbGF0Zm9ybSBvcCBpcyBjYWxsZWQsIElPTU1VIGlzIGFscmVhZHkgc3dp
dGNoZWQgdG8gZGlzYWJsZWQgc3RhdGUgYW5kCnRoZSBzaGFyZWQgUFQgdGVzdCB3b3VsZCBhbHdh
eXMgYmUgZmFsc2UuCgpTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29t
PgotLS0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jIHwgOCArKysrKysrLQog
MSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jIGIveGVuL2RyaXZlcnMvcGFz
c3Rocm91Z2gvdnRkL2lvbW11LmMKaW5kZXggZjk0YjUyMmM3My4uZDY2ZDllOGFkMCAxMDA2NDQK
LS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMKKysrIGIveGVuL2RyaXZl
cnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMKQEAgLTE3NTIsNyArMTc1MiwxMyBAQCBzdGF0aWMg
dm9pZCBpb21tdV9kb21haW5fdGVhcmRvd24oc3RydWN0IGRvbWFpbiAqZCkKICAgICAgICAgeGZy
ZWUobXJtcnIpOwogICAgIH0KIAotICAgIGlmICggaW9tbXVfdXNlX2hhcF9wdChkKSApCisgICAg
QVNTRVJUKGhhcF9lbmFibGVkKGQpKTsKKworICAgIC8qCisgICAgICogV2UgY2FuJ3QgdXNlIGlv
bW11X3VzZV9oYXBfcHQgaGVyZSBiZWNhdXNlIHRoZSBJT01NVSBzdGF0ZSBpcyBhbHJlYWR5Cisg
ICAgICogY2hhbmdlZCB0byBJT01NVV9TVEFUVVNfZGlzYWJsZWQgYXQgdGhpcyBwb2ludC4KKyAg
ICAgKi8KKyAgICBpZiAoIGlvbW11X2hhcF9wdF9zaGFyZSApCiAgICAgICAgIHJldHVybjsKIAog
ICAgIHNwaW5fbG9jaygmaGQtPmFyY2gubWFwcGluZ19sb2NrKTsKLS0gCjIuMTEuMAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
