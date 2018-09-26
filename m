From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH V5] x86/altp2m: Add a subop for obtaining
 the mem access of a page
Date: Wed, 26 Sep 2018 07:39:00 -0600
Message-ID: <5BAB8BF402000078001EC37E@prv1-mh.provo.novell.com>
References: <1537947263-8469-1-git-send-email-rcojocaru@bitdefender.com>
 <f04e2217-ee7b-6ade-af17-f87952fe72c5@bitdefender.com>
 <1deabccf-a9e9-186a-9595-5a9790de37d2@bitdefender.com>
 <5BAB87B802000078001EC33E@prv1-mh.provo.novell.com>
 <15b0be88-a710-dec2-ad2d-058451f67b2c@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=an3h=mi=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g5A1y-0006gK-C3
 for xen-devel@lists.xenproject.org; Wed, 26 Sep 2018 13:39:06 +0000
In-Reply-To: <15b0be88-a710-dec2-ad2d-058451f67b2c@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Adrian Pop <apop@bitdefender.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjA5LjE4IGF0IDE1OjI3LCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4gT24gOS8yNi8xOCA0OjIwIFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMjYu
MDkuMTggYXQgMTQ6MjYsIDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPiB3cm90ZToKPj4+IFRv
IGNsYXJpZnkgdGhlIHF1ZXN0aW9uLCBJJ2xsIG9mIGNvdXJzZSBkbyB0aGlzOgo+Pj4KPj4+IGRp
ZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0vbWVtX2FjY2Vzcy5jIGIveGVuL2FyY2gveDg2L21t
L21lbV9hY2Nlc3MuYwo+Pj4gaW5kZXggNjdiNGExZC4uMmI1YTYyMSAxMDA2NDQKPj4+IC0tLSBh
L3hlbi9hcmNoL3g4Ni9tbS9tZW1fYWNjZXNzLmMKPj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9t
ZW1fYWNjZXNzLmMKPj4+IEBAIC00ODksMTQgKzQ4OSwxMyBAQCBsb25nIHAybV9zZXRfbWVtX2Fj
Y2Vzc19tdWx0aShzdHJ1Y3QgZG9tYWluICpkLAo+Pj4gIGludCBwMm1fZ2V0X21lbV9hY2Nlc3Mo
c3RydWN0IGRvbWFpbiAqZCwgZ2ZuX3QgZ2ZuLCB4ZW5tZW1fYWNjZXNzX3QKPj4+ICphY2Nlc3Ms
Cj4+PiAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgYWx0cDJtX2lkeCkKPj4+
ICB7Cj4+PiAtICAgIHN0cnVjdCBwMm1fZG9tYWluICpwMm07Cj4+PiArICAgIHN0cnVjdCBwMm1f
ZG9tYWluICpwMm0gPSBwMm1fZ2V0X2hvc3RwMm0oZCk7Cj4+Pgo+Pj4gKyNpZmRlZiBDT05GSUdf
SFZNCj4+PiAgICAgIGlmICggIWFsdHAybV9hY3RpdmUoZCkgKQo+Pj4gICAgICB7Cj4+PiAgICAg
ICAgICBpZiAoIGFsdHAybV9pZHggKQo+Pj4gICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+
Pj4gLQo+Pj4gLSAgICAgICAgcDJtID0gcDJtX2dldF9ob3N0cDJtKGQpOwo+Pj4gICAgICB9Cj4+
PiAgICAgIGVsc2UKPj4+ICAgICAgewo+Pj4gQEAgLTUwNiw2ICs1MDUsOSBAQCBpbnQgcDJtX2dl
dF9tZW1fYWNjZXNzKHN0cnVjdCBkb21haW4gKmQsIGdmbl90IGdmbiwKPj4+IHhlbm1lbV9hY2Nl
c3NfdCAqYWNjZXNzLAo+Pj4KPj4+ICAgICAgICAgIHAybSA9IGQtPmFyY2guYWx0cDJtX3AybVth
bHRwMm1faWR4XTsKPj4+ICAgICAgfQo+Pj4gKyNlbHNlCj4+PiArICAgIEFTU0VSVCghYWx0cDJt
X2lkeCk7Cj4+PiArI2VuZGlmCj4+Pgo+Pj4gICAgICByZXR1cm4gX3AybV9nZXRfbWVtX2FjY2Vz
cyhwMm0sIGdmbiwgYWNjZXNzKTsKPj4+ICB9Cj4+Pgo+Pj4gYnV0IGlzIGl0IE9LIHRoYXQgdGhl
IGh5cGVydmlzb3IgYnVpbGRzIHdpdGggYSBzZXQgb2YgZmxhZ3MgdGhhdAo+Pj4gaW5jbHVkZXMg
Q09ORklHX0hWTSBhbmQgdGhlIGZpcm13YXJlIGNvZGUgd2l0aCBhIHNldCB0aGF0IGRvZXNuJ3Q/
Cj4+IAo+PiBJcyB0aGlzIHBlcmhhcHMgc2ltcGx5IChzbyBmYXIgdW5ub3RpY2VkKSBmYWxsb3V0
IGZyb20gV2VpJ3MgQ09ORklHX0hWTS0KPj4gZGlzYWJsaW5nIHdvcms/IE9yIGluc3VmZmljaWVu
dCByZS1iYXNpbmcgb2YgeW91ciBjaGFuZ2Ugb24gdG9wIG9mIGhpcwo+PiB3b3JrPyBUaGUgc2hp
bSBub3cgYnVpbGRzIHdpdGggSFZNPW4sIHdoaWxlIHRoZSBoeXBlcnZpc29yICh1bmxlc3MKPj4g
eW91J3ZlIG92ZXJyaWRkZW4gdGhlIGRlZmF1bHQpIHVzZXMgSFZNPXkuCj4gCj4gSSBiZWxpZXZl
IEknbSB1cC10by1kYXRlOgo+IAo+ICQgZ2l0IHB1bGwgLS1yZWJhc2Ugb3JpZ2luIHN0YWdpbmcK
PiBGcm9tIGdpdDovL3hlbmJpdHMueGVucHJvamVjdC5vcmcveGVuCj4gICogYnJhbmNoICAgICAg
ICAgICAgc3RhZ2luZyAgICAtPiBGRVRDSF9IRUFECj4gQ3VycmVudCBicmFuY2ggYWx0cDJtLXdv
cmsgaXMgdXAgdG8gZGF0ZS4KPiAKPiBJJ3ZlIGFsc28gcmFuICJtYWtlIGNsZWFuIiwgIm1ha2Ug
ZGlzdGNsZWFuIiwgImNvbmZpZ3VyZSIgLSBhZ2FpbiwgYW5kCj4gIm1ha2UgZGlzdCIgb25lIG1v
cmUgdGltZSwgd2l0aCB0aGUgc2FtZSByZXN1bHRzIChtZW1fYWNjZXNzLmMgd29uJ3QKPiBjb21w
aWxlIGluIHRoZSBzaGltKS4KCkkgZGlkbid0IGltcGx5IHlvdSdyZSBvbiBhbiBvdXRkYXRlZCB0
cmVlLCBidXQgcmF0aGVyIHRoYXQgeW91IG1heSBub3QKaGF2ZSBkb25lIGFsbCBjaGFuZ2VzIG5l
Y2Vzc2FyeSB3aGlsZSByZS1iYXNpbmcgeW91ciBjaGFuZ2Ugb3Zlcgp1cHN0cmVhbSBjb21taXRz
LgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
