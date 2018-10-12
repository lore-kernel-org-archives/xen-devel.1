From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 12/17] x86: connect guest creation with
 CONFIG_PV
Date: Fri, 12 Oct 2018 09:09:28 -0600
Message-ID: <5BC0B92802000078001F112D@prv1-mh.provo.novell.com>
References: <cover.9120eb87824b754ecdc7b1a5b95ea216404877a3.1538667753.git-series.wei.liu2@citrix.com>
 <634275404c9298c745b46553cea911cc4b29f853.1538667753.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=tlq1=my=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gAz4G-0000Tf-HF
 for xen-devel@lists.xenproject.org; Fri, 12 Oct 2018 15:09:32 +0000
In-Reply-To: <634275404c9298c745b46553cea911cc4b29f853.1538667753.git-series.wei.liu2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjEwLjE4IGF0IDE3OjQzLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
LS0tIGEveGVuL2NvbW1vbi9kb21haW4uYwo+ICsrKyBiL3hlbi9jb21tb24vZG9tYWluLmMKPiBA
QCAtMzIyLDE3ICszMjIsMzQgQEAgc3RydWN0IGRvbWFpbiAqZG9tYWluX2NyZWF0ZShkb21pZF90
IGRvbWlkLAo+ICAgICAgfQo+ICAKPiAgICAgIC8qIFNvcnQgb3V0IG91ciBpZGVhIG9mIGlzX3tw
dixodm19X2RvbWFpbigpLiAqLwo+IC0gICAgaWYgKCBjb25maWcgJiYgKGNvbmZpZy0+ZmxhZ3Mg
JiBYRU5fRE9NQ1RMX0NERl9odm1fZ3Vlc3QpICkKPiArICAgIGlmICggY29uZmlnICkKPiAgICAg
IHsKPiArICAgICAgICBBU1NFUlQoIWlzX3N5c3RlbV9kb21haW4oZCkpOwoKVGhpcyBhbmQgdGhl
IG90aGVyIEFTU0VSVCgpIGFyZSByZWR1bmRhbnQgd2l0aCB3aGF0J3MgZWFybGllciBpbgp0aGUg
ZnVuY3Rpb24uIERvIHdlIHJlYWxseSBuZWVkIHRoZW0/Cgo+ICsgICAgICAgIGlmICggY29uZmln
LT5mbGFncyAmIFhFTl9ET01DVExfQ0RGX2h2bV9ndWVzdCkKPiArICAgICAgICB7Cj4gICNpZmRl
ZiBDT05GSUdfSFZNCj4gLSAgICAgICAgZC0+Z3Vlc3RfdHlwZSA9IGd1ZXN0X3R5cGVfaHZtOwo+
ICsgICAgICAgICAgICBkLT5ndWVzdF90eXBlID0gZ3Vlc3RfdHlwZV9odm07Cj4gKyNlbHNlCj4g
KyAgICAgICAgICAgIGVyciA9IC1FSU5WQUw7Cj4gKyAgICAgICAgICAgIGdvdG8gZmFpbDsKPiAr
I2VuZGlmCj4gKyAgICAgICAgfQo+ICsgICAgICAgIGVsc2UKPiArICAgICAgICB7Cj4gKyNpZmRl
ZiBDT05GSUdfUFYKPiArICAgICAgICBkLT5ndWVzdF90eXBlID0gZ3Vlc3RfdHlwZV9wdjsKPiAg
I2Vsc2UKPiAgICAgICAgICBlcnIgPSAtRUlOVkFMOwo+ICAgICAgICAgIGdvdG8gZmFpbDsKPiAg
I2VuZGlmCj4gKyAgICAgICAgfQo+ICAgICAgfQo+ICAgICAgZWxzZQo+ICsgICAgewo+ICsgICAg
ICAgIC8qIFRoZSB0eXBlIG9mIHN5c3RlbSBkb21haW4gc2hvdWxkbid0IG1hdHRlci4gKi8KPiAr
ICAgICAgICBBU1NFUlQoaXNfc3lzdGVtX2RvbWFpbihkKSk7Cj4gICAgICAgICAgZC0+Z3Vlc3Rf
dHlwZSA9IGd1ZXN0X3R5cGVfcHY7Cj4gKyAgICB9CgpJJ20gYWZyYWlkIHRoaXMgY29tbWVudCBt
YXkgY2F1c2UgYW1iaWd1aXR5LiBJIHRoaW5rIHdlIGhhZCAoYW5kCnBlcmhhcHMgc3RpbGwgaGF2
ZSkgYSBudW1iZXIgb2YgcGxhY2VzIHdoZXJlIHdlIGFzc3VtZSB0aGF0IGluCnBhcnRpY3VsYXIg
dGhlIGlkbGUgZG9tYWluIGlzIGEgUFYgb25lLiBTbyBJJ2QgbGlrZSB0byBhc2sgdG8gZWl0aHIK
ZXh0ZW5kIHRoZSBjb21tZW50IHRvIGV4cGxhaW4gcmVhbGl0eSwgb3IgdG8gZHJvcCBpdC4KCkph
bgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
