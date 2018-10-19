From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH v2 08/16] x86: connect guest creation with
 CONFIG_PV
Date: Fri, 19 Oct 2018 15:28:34 +0100
Message-ID: <6decb60cac4bc1d76da4f50a8998f93efc764ace.1539959287.git-series.wei.liu2@citrix.com>
References: <cover.a9d086fddeb7425fc8cbb3d907dbe8d99a55b46c.1539959287.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jk7c=m7=citrix.com=prvs=8230e4c9f=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gDVlg-0002dI-46
 for xen-devel@lists.xenproject.org; Fri, 19 Oct 2018 14:28:48 +0000
In-Reply-To: <cover.a9d086fddeb7425fc8cbb3d907dbe8d99a55b46c.1539959287.git-series.wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBpcyBhIGJpdCBtb3JlIGNvbXBsaWNhdGVkIHRoYW4gdGhlIEhWTSBjYXNlIGJlY2F1c2Ug
c3lzdGVtCmRvbWFpbnMgaGF2ZSBQViBndWVzdCB0eXBlLiBMZWF2ZSB0aGVtIGxpa2UgdGhhdC4K
ClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQp2MjoKMS4g
UmVtb3ZlIHVzZWxlc3MgQVNTRVJUcy4KMi4gUmV3cml0ZSBjb21tZW50LgotLS0KIHhlbi9jb21t
b24vZG9tYWluLmMgfCAyMyArKysrKysrKysrKysrKysrKysrKystLQogMSBmaWxlIGNoYW5nZWQs
IDIxIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1v
bi9kb21haW4uYyBiL3hlbi9jb21tb24vZG9tYWluLmMKaW5kZXggNjUxNTFlMi4uZmMwOTA4OCAx
MDA2NDQKLS0tIGEveGVuL2NvbW1vbi9kb21haW4uYworKysgYi94ZW4vY29tbW9uL2RvbWFpbi5j
CkBAIC0zMjIsMTcgKzMyMiwzNiBAQCBzdHJ1Y3QgZG9tYWluICpkb21haW5fY3JlYXRlKGRvbWlk
X3QgZG9taWQsCiAgICAgfQogCiAgICAgLyogU29ydCBvdXQgb3VyIGlkZWEgb2YgaXNfe3B2LGh2
bX1fZG9tYWluKCkuICovCi0gICAgaWYgKCBjb25maWcgJiYgKGNvbmZpZy0+ZmxhZ3MgJiBYRU5f
RE9NQ1RMX0NERl9odm1fZ3Vlc3QpICkKKyAgICBpZiAoIGNvbmZpZyApCiAgICAgeworICAgICAg
ICBpZiAoIGNvbmZpZy0+ZmxhZ3MgJiBYRU5fRE9NQ1RMX0NERl9odm1fZ3Vlc3QpCisgICAgICAg
IHsKICNpZmRlZiBDT05GSUdfSFZNCi0gICAgICAgIGQtPmd1ZXN0X3R5cGUgPSBndWVzdF90eXBl
X2h2bTsKKyAgICAgICAgICAgIGQtPmd1ZXN0X3R5cGUgPSBndWVzdF90eXBlX2h2bTsKKyNlbHNl
CisgICAgICAgICAgICBlcnIgPSAtRUlOVkFMOworICAgICAgICAgICAgZ290byBmYWlsOworI2Vu
ZGlmCisgICAgICAgIH0KKyAgICAgICAgZWxzZQorICAgICAgICB7CisjaWZkZWYgQ09ORklHX1BW
CisgICAgICAgIGQtPmd1ZXN0X3R5cGUgPSBndWVzdF90eXBlX3B2OwogI2Vsc2UKICAgICAgICAg
ZXJyID0gLUVJTlZBTDsKICAgICAgICAgZ290byBmYWlsOwogI2VuZGlmCisgICAgICAgIH0KICAg
ICB9CiAgICAgZWxzZQorICAgIHsKKyAgICAgICAgLyoKKyAgICAgICAgICogQXQgbGVhc3QgdGhl
IGlkbGUgZG9tYWluIHNob3VsZCBiZSB0cmVhdGVkIGFzIFBWIGRvbWFpbgorICAgICAgICAgKiBi
ZWNhdXNlIGl0IHVzZXMgUFYgY29udGV4dCBzd2l0Y2ggZnVuY3Rpb25zLiBUbyBlcnIgb24gdGhl
CisgICAgICAgICAqIHNhZmUgc2lkZSwgbGVhdmUgYWxsIHN5c3RlbSBkb21haW5zIHRvIGJlIGd1
ZXN0X3R5cGVfcHYuCisgICAgICAgICAqLwogICAgICAgICBkLT5ndWVzdF90eXBlID0gZ3Vlc3Rf
dHlwZV9wdjsKKyAgICB9CiAKICAgICBUUkFDRV8xRChUUkNfRE9NMF9ET01fQURELCBkLT5kb21h
aW5faWQpOwogCi0tIApnaXQtc2VyaWVzIDAuOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
