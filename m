From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v2 20/23] xen: connect guest creation with
 CONFIG_{HVM, PV}
Date: Tue, 28 Aug 2018 12:07:24 +0100
Message-ID: <972fcac4-5dbb-09c6-758e-63b10e405c4d@arm.com>
References: <cover.65253d1128f698146b48c4ff3bba2198f360c7b1.1535285866.git-series.wei.liu2@citrix.com>
 <ca3fb129b9e4707d268df561cb32b50cae902982.1535285866.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ec/y=ll=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1fubqL-0003i0-QH
 for xen-devel@lists.xenproject.org; Tue, 28 Aug 2018 11:07:29 +0000
In-Reply-To: <ca3fb129b9e4707d268df561cb32b50cae902982.1535285866.git-series.wei.liu2@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

SGkgV2VpLAoKT24gMjYvMDgvMTggMTM6MTksIFdlaSBMaXUgd3JvdGU6Cj4gU2lnbmVkLW9mZi1i
eTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClRoaXMgcGF0Y2ggaXMgZ29pbmcgdG8g
YnJlYWsgQXJtIHVudGlsIHdlIHN3aXRjaGVkIHRvIFBWSCBpbiB0aGUgdG9vbHN0YWNrLgoKQ2hl
ZXJzLAoKPiAtLS0KPiAgIHhlbi9jb21tb24vZG9tYWluLmMgfCAxNCArKysrKysrKysrKysrKwo+
ICAgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEveGVu
L2NvbW1vbi9kb21haW4uYyBiL3hlbi9jb21tb24vZG9tYWluLmMKPiBpbmRleCAxNzFkMjVlLi43
M2I1NDg1IDEwMDY0NAo+IC0tLSBhL3hlbi9jb21tb24vZG9tYWluLmMKPiArKysgYi94ZW4vY29t
bW9uL2RvbWFpbi5jCj4gQEAgLTMxOCw5ICszMTgsMjMgQEAgc3RydWN0IGRvbWFpbiAqZG9tYWlu
X2NyZWF0ZShkb21pZF90IGRvbWlkLAo+ICAgICAgIGlmICggIWlzX2lkbGVfZG9tYWluKGQpICkK
PiAgICAgICB7Cj4gICAgICAgICAgIGlmICggY29uZmlnLT5mbGFncyAmIFhFTl9ET01DVExfQ0RG
X2h2bV9ndWVzdCApCj4gKyAgICAgICAgewo+ICsjaWZkZWYgQ09ORklHX0hWTQo+ICAgICAgICAg
ICAgICAgZC0+Z3Vlc3RfdHlwZSA9IGd1ZXN0X3R5cGVfaHZtOwo+ICsjZWxzZQo+ICsgICAgICAg
ICAgICBlcnIgPSAtRUlOVkFMOwo+ICsgICAgICAgICAgICBnb3RvIGZhaWw7Cj4gKyNlbmRpZgo+
ICsgICAgICAgIH0KPiAgICAgICAgICAgZWxzZQo+ICsgICAgICAgIHsKPiArI2lmZGVmIENPTkZJ
R19QVgo+ICAgICAgICAgICAgICAgZC0+Z3Vlc3RfdHlwZSA9IGd1ZXN0X3R5cGVfcHY7Cj4gKyNl
bHNlCj4gKyAgICAgICAgICAgIGVyciA9IC1FSU5WQUw7Cj4gKyAgICAgICAgICAgIGdvdG8gZmFp
bDsKPiArI2VuZGlmCj4gKyAgICAgICAgfQo+ICAgCj4gICAgICAgICAgIHdhdGNoZG9nX2RvbWFp
bl9pbml0KGQpOwo+ICAgICAgICAgICBpbml0X3N0YXR1cyB8PSBJTklUX3dhdGNoZG9nOwo+IAoK
LS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
