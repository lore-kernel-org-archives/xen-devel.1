From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v4 4/5] amd/iommu: assign iommu devices to Xen
Date: Wed, 14 Nov 2018 12:57:39 +0100
Message-ID: <20181114115740.1050-5-roger.pau@citrix.com>
References: <20181114115740.1050-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zmga=nz=citrix.com=prvs=849b1dda4=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gMto1-0005ZK-IP
 for xen-devel@lists.xenproject.org; Wed, 14 Nov 2018 11:58:01 +0000
In-Reply-To: <20181114115740.1050-1-roger.pau@citrix.com>
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
dXNlIGlzc3VlcyBiZWNhdXNlIHRoZQpJT01NVSBkZXZpY2VzIGFyZSBub3QgYmVoaW5kIGFuIElP
TU1VLCBhbmQgY29uY2VwdHVhbGx5IGl0J3MgYWxzbyB3cm9uZwp0byBnaXZlIHRoZSBoYXJkd2Fy
ZSBkb21haW4gb3duZXJzaGlwIG9mIHRob3NlIGRldmljZXMgc2luY2UgdGhleSBhcmUKaW4gdXNl
IGJ5IFhlbi4KCkZpeCB0aGlzIGJ5IGFzc2lnbmluZyB0aGUgUENJIElPTU1VIGRldmljZXMgdG8g
WGVuLgoKU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5j
b20+Ci0tLQpDYzogU3VyYXZlZSBTdXRoaWt1bHBhbml0IDxzdXJhdmVlLnN1dGhpa3VscGFuaXRA
YW1kLmNvbT4KQ2M6IEJyaWFuIFdvb2RzIDxicmlhbi53b29kc0BhbWQuY29tPgotLS0KIHhlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9pbml0LmMgfCAxMCArKysrKysrKysrCiAxIGZp
bGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bh
c3N0aHJvdWdoL2FtZC9pb21tdV9pbml0LmMgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQv
aW9tbXVfaW5pdC5jCmluZGV4IDE1YzEwYjA5MjkuLmM3NGMxNTY2ZDkgMTAwNjQ0Ci0tLSBhL3hl
bi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9pbml0LmMKKysrIGIveGVuL2RyaXZlcnMv
cGFzc3Rocm91Z2gvYW1kL2lvbW11X2luaXQuYwpAQCAtOTkzLDYgKzk5MywxNiBAQCBzdGF0aWMg
dm9pZCAqIF9faW5pdCBhbGxvY2F0ZV9wcHJfbG9nKHN0cnVjdCBhbWRfaW9tbXUgKmlvbW11KQog
CiBzdGF0aWMgaW50IF9faW5pdCBhbWRfaW9tbXVfaW5pdF9vbmUoc3RydWN0IGFtZF9pb21tdSAq
aW9tbXUpCiB7CisgICAgc3RydWN0IHBjaV9kZXYgKnBkZXY7CisKKyAgICBwY2lkZXZzX2xvY2so
KTsKKyAgICBwZGV2ID0gcGNpX2dldF9wZGV2KGlvbW11LT5zZWcsIFBDSV9CVVMoaW9tbXUtPmJk
ZiksCisgICAgICAgICAgICAgICAgICAgICAgICBQQ0lfREVWRk4yKGlvbW11LT5iZGYpKTsKKyAg
ICBpZiAoIHBkZXYgKQorICAgICAgICAvKiBBc3NpZ24gdGhlIElPTU1VIFBDSSBkZXZpY2UgdG8g
WGVuICAqLworICAgICAgICBwZGV2LT5kb21haW4gPSBkb21feGVuOworICAgIHBjaWRldnNfdW5s
b2NrKCk7CisKICAgICBpZiAoIG1hcF9pb21tdV9tbWlvX3JlZ2lvbihpb21tdSkgIT0gMCApCiAg
ICAgICAgIGdvdG8gZXJyb3Jfb3V0OwogCi0tIAoyLjE5LjEKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
