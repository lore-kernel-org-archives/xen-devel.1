From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v5 5/6] amd/iommu: assign iommu devices to Xen
Date: Tue, 20 Nov 2018 17:01:52 +0100
Message-ID: <20181120160153.45259-6-roger.pau@citrix.com>
References: <20181120160153.45259-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rzwt=n7=citrix.com=prvs=855b39dea=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gP8U1-0006GQ-2o
 for xen-devel@lists.xenproject.org; Tue, 20 Nov 2018 16:02:37 +0000
In-Reply-To: <20181120160153.45259-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QU1EIElPTU1VIGRldmljZXMgYXJlIGV4cG9zZWQgb24gdGhlIFBDSSBidXMsIGFuZCB0aHVzIGFy
ZSBhc3NpZ25lZCBieQpkZWZhdWx0IHRvIHRoZSBoYXJkd2FyZSBkb21haW4uIFRoaXMgY2FuIGNh
dXNlIGlzc3VlcyBiZWNhdXNlIHRoZQpJT01NVSBkZXZpY2VzIHRoZW1zZWx2ZXMgYXJlIG5vdCBi
ZWhpbmQgYW4gSU9NTVUsIHNvIHVwZGF0ZV9wYWdpbmdfbW9kZSB3aWxsCnJldHVybiBhbiBlcnJv
ciBpZiBYZW4gdHJpZXMgdG8gZXhwYW5kIHRoZSBwYWdlIHRhYmxlcyBvZiBhIGRvbWFpbgp0aGF0
IGhhcyBhc3NpZ25lZCBkZXZpY2VzIG5vdCBiZWhpbmQgYW4gSU9NTVUuIHVwZGF0ZV9wYWdpbmdf
bW9kZQpmYWlsaW5nIHdpbGwgY2F1c2UgdGhlIGRvbWFpbiB0byBiZSBkZXN0cm95ZWQuCgpGaXgg
dGhpcyBieSBoaWRpbmcgUENJIElPTU1VIGRldmljZXMsIHNvIHRoZXkgYXJlIG5vdCBhc3NpZ25l
ZCB0byB0aGUKaGFyZHdhcmUgZG9tYWluLgoKU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7D
qSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQpDYzogU3VyYXZlZSBTdXRoaWt1bHBhbml0IDxz
dXJhdmVlLnN1dGhpa3VscGFuaXRAYW1kLmNvbT4KQ2M6IEJyaWFuIFdvb2RzIDxicmlhbi53b29k
c0BhbWQuY29tPgotLS0KQ2hhbmdlcyBzaW5jZSB2NDoKIC0gVXNlIHBjaV9oaWRlX2RldmljZS4K
IC0gRXhwYW5kIGNvbW1pdCBtZXNzYWdlLgotLS0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2Ft
ZC9pb21tdV9pbml0LmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2luaXQuYyBiL3hl
bi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9pbml0LmMKaW5kZXggMTVjMTBiMDkyOS4u
MTdmMzk1NTJhOSAxMDA2NDQKLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11
X2luaXQuYworKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfaW5pdC5jCkBA
IC05OTMsNiArOTkzLDggQEAgc3RhdGljIHZvaWQgKiBfX2luaXQgYWxsb2NhdGVfcHByX2xvZyhz
dHJ1Y3QgYW1kX2lvbW11ICppb21tdSkKIAogc3RhdGljIGludCBfX2luaXQgYW1kX2lvbW11X2lu
aXRfb25lKHN0cnVjdCBhbWRfaW9tbXUgKmlvbW11KQogeworICAgIHBjaV9oaWRlX2RldmljZShp
b21tdS0+c2VnLCBQQ0lfQlVTKGlvbW11LT5iZGYpLCBQQ0lfREVWRk4yKGlvbW11LT5iZGYpKTsK
KwogICAgIGlmICggbWFwX2lvbW11X21taW9fcmVnaW9uKGlvbW11KSAhPSAwICkKICAgICAgICAg
Z290byBlcnJvcl9vdXQ7CiAKLS0gCjIuMTkuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
