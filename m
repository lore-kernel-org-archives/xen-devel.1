From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 4/4] x86/iommu: add reserved dom0-iommu
 option to map reserved memory ranges
Date: Wed, 08 Aug 2018 03:55:41 -0600
Message-ID: <5B6ABE1D02000078001DBE57@prv1-mh.provo.novell.com>
References: <20180807140243.11265-1-roger.pau@citrix.com>
 <20180807140243.11265-5-roger.pau@citrix.com>
 <20180808095305.kcp7eg6txyw5ruo4@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=wdim=kx=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fnLBz-0000JK-BZ
 for xen-devel@lists.xenproject.org; Wed, 08 Aug 2018 09:55:47 +0000
In-Reply-To: <20180808095305.kcp7eg6txyw5ruo4@mac>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA4LjA4LjE4IGF0IDExOjUzLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IEkndmUgbG9zdCBhIGNodW5rIGhlcmUgZHVyaW5nIG9uZSBvZiB0aGUgcmViYXNlcywgc28gdGhl
IGZvbGxvd2luZwo+IGRpZmYgc2hvdWxkIGJlIGFkZGVkIHRvIHRoZSBwYXRjaCBpbiBvcmRlciB0
byBjcmVhdGUgbWFwcyBpZiB0aGUgaW9tbXUKPiBwYWdlIHRhYmxlcyBhcmUgc2hhcmVkOgo+IAo+
IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC94ODYvaW9tbXUuYyAKPiBiL3hl
bi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3g4Ni9pb21tdS5jCj4gaW5kZXggNmFlYzQzZWQxYS4uNjI3
MWQ4YjY3MSAxMDA2NDQKPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC94ODYvaW9tbXUu
Ywo+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3g4Ni9pb21tdS5jCj4gQEAgLTIwOSw3
ICsyMDksMTMgQEAgdm9pZCBfX2h3ZG9tX2luaXQgYXJjaF9pb21tdV9od2RvbV9pbml0KHN0cnVj
dCBkb21haW4gKmQpCj4gICAgICAgICAgaWYgKCAhaHdkb21faW9tbXVfbWFwKGQsIHBmbiwgbWF4
X3BmbikgKQo+ICAgICAgICAgICAgICBjb250aW51ZTsKPiAgCj4gLSAgICAgICAgcmMgPSBpb21t
dV9tYXBfcGFnZShkLCBwZm4sIHBmbiwgSU9NTVVGX3JlYWRhYmxlfElPTU1VRl93cml0YWJsZSk7
Cj4gKyAgICAgICAgaWYgKCBpb21tdV91c2VfaGFwX3B0KGQpICkKPiArICAgICAgICB7Cj4gKyAg
ICAgICAgICAgIEFTU0VSVChpc19odm1fZG9tYWluKGQpKTsKPiArICAgICAgICAgICAgcmMgPSBz
ZXRfaWRlbnRpdHlfcDJtX2VudHJ5KGQsIHBmbiwgcDJtX2FjY2Vzc19ydywgMCk7Cj4gKyAgICAg
ICAgfQo+ICsgICAgICAgIGVsc2UKPiArICAgICAgICAgICAgcmMgPSBpb21tdV9tYXBfcGFnZShk
LCBwZm4sIHBmbiwgSU9NTVVGX3JlYWRhYmxlfElPTU1VRl93cml0YWJsZSk7Cj4gICAgICAgICAg
aWYgKCByYyApCj4gICAgICAgICAgICAgIHByaW50ayhYRU5MT0dfV0FSTklORyAiIGQlZDogSU9N
TVUgbWFwcGluZyBmYWlsZWQ6ICVkXG4iLAo+ICAgICAgICAgICAgICAgICAgICAgZC0+ZG9tYWlu
X2lkLCByYyk7Cj4gCj4gSSBjYW4gcmVzZW5kIHRoZSBzZXJpZXMgaW4gb3JkZXIgdG8gZWFzZSBy
ZXZpZXcuCgpUaGlzIHdvdWxkIGluZGVlZCBiZSBuaWNlLCB0aGFua3MuCgpKYW4KCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
