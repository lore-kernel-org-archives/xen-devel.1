From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 20/23] xen: connect guest creation with
 CONFIG_{HVM, PV}
Date: Tue, 28 Aug 2018 14:13:48 +0100
Message-ID: <20180828131347.obdla7p7dorwmai6@citrix.com>
References: <cover.65253d1128f698146b48c4ff3bba2198f360c7b1.1535285866.git-series.wei.liu2@citrix.com>
 <ca3fb129b9e4707d268df561cb32b50cae902982.1535285866.git-series.wei.liu2@citrix.com>
 <972fcac4-5dbb-09c6-758e-63b10e405c4d@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ardv=ll=citrix.com=prvs=7715574d5=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fudof-0006gs-Ei
 for xen-devel@lists.xenproject.org; Tue, 28 Aug 2018 13:13:53 +0000
Content-Disposition: inline
In-Reply-To: <972fcac4-5dbb-09c6-758e-63b10e405c4d@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBBdWcgMjgsIDIwMTggYXQgMTI6MDc6MjRQTSArMDEwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IEhpIFdlaSwKPiAKPiBPbiAyNi8wOC8xOCAxMzoxOSwgV2VpIExpdSB3cm90ZToKPiA+
IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gCj4gVGhpcyBw
YXRjaCBpcyBnb2luZyB0byBicmVhayBBcm0gdW50aWwgd2Ugc3dpdGNoZWQgdG8gUFZIIGluIHRo
ZSB0b29sc3RhY2suCj4gCj4gQ2hlZXJzLAo+IAo+ID4gLS0tCj4gPiAgIHhlbi9jb21tb24vZG9t
YWluLmMgfCAxNCArKysrKysrKysrKysrKwo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0
aW9ucygrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9kb21haW4uYyBiL3hlbi9j
b21tb24vZG9tYWluLmMKPiA+IGluZGV4IDE3MWQyNWUuLjczYjU0ODUgMTAwNjQ0Cj4gPiAtLS0g
YS94ZW4vY29tbW9uL2RvbWFpbi5jCj4gPiArKysgYi94ZW4vY29tbW9uL2RvbWFpbi5jCj4gPiBA
QCAtMzE4LDkgKzMxOCwyMyBAQCBzdHJ1Y3QgZG9tYWluICpkb21haW5fY3JlYXRlKGRvbWlkX3Qg
ZG9taWQsCj4gPiAgICAgICBpZiAoICFpc19pZGxlX2RvbWFpbihkKSApCj4gPiAgICAgICB7Cj4g
PiAgICAgICAgICAgaWYgKCBjb25maWctPmZsYWdzICYgWEVOX0RPTUNUTF9DREZfaHZtX2d1ZXN0
ICkKPiA+ICsgICAgICAgIHsKPiA+ICsjaWZkZWYgQ09ORklHX0hWTQo+ID4gICAgICAgICAgICAg
ICBkLT5ndWVzdF90eXBlID0gZ3Vlc3RfdHlwZV9odm07Cj4gPiArI2Vsc2UKPiA+ICsgICAgICAg
ICAgICBlcnIgPSAtRUlOVkFMOwo+ID4gKyAgICAgICAgICAgIGdvdG8gZmFpbDsKPiA+ICsjZW5k
aWYKPiA+ICsgICAgICAgIH0KPiA+ICAgICAgICAgICBlbHNlCj4gPiArICAgICAgICB7Cj4gPiAr
I2lmZGVmIENPTkZJR19QVgoKT2gsIHllcywgdGhpcyBzaG91bGQgaGF2ZSBiZWVuCgovKiBDdXJy
ZW50bHkgdG9vbHN0YWNrIHRyZWF0cyBBUk0gZ3Vlc3RzIGFzIFBWLCBib2RnZSBpdCBmb3Igbm93
IHVudGlsCiAqIEFSTSBzd2l0Y2hlcyB0byBQVkguCiAqLwoKI2lmIGRlZmluZWQoQ09ORklHX1BW
KSB8fCBkZWZpbmVkKENPTkZJR19BUk0pCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
