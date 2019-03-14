From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH for-next 7/9] xen: Convert is_xen_heap_mfn
 to use typesafe MFN
Date: Thu, 14 Mar 2019 10:12:24 +0000
Message-ID: <f78bf48b-9371-20bf-98cb-9daf3143c39b@arm.com>
References: <20190218113600.9540-1-julien.grall@arm.com>
 <20190218113600.9540-8-julien.grall@arm.com>
 <5C891BFF020000780021E35F@prv1-mh.provo.novell.com>
 <e36aeed3-0d7f-f0e6-4e13-adf4d44db0be@arm.com>
 <5C8A0856020000780021E649@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+3mG=RR=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1h4NLj-0002MB-4k
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2019 10:12:31 +0000
In-Reply-To: <5C8A0856020000780021E649@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGkgSmFuLAoKT24gMy8xNC8xOSA3OjUyIEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAx
My4wMy4xOSBhdCAxODoyNCwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4gT24gMTMv
MDMvMjAxOSAxNTowNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+PiBPbiAxOC4wMi4xOSBhdCAx
MjozNSwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4+PiAtLS0gYS94ZW4vY29tbW9u
L3BhZ2VfYWxsb2MuYwo+Pj4+ICsrKyBiL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jCj4+Pj4gQEAg
LTIxMjEsOSArMjEyMSw5IEBAIHZvaWQgaW5pdF94ZW5oZWFwX3BhZ2VzKHBhZGRyX3QgcHMsIHBh
ZGRyX3QgcGUpCj4+Pj4gICAgICAgICAqIFl1ayEgRW5zdXJlIHRoZXJlIGlzIGEgb25lLXBhZ2Ug
YnVmZmVyIGJldHdlZW4gWGVuIGFuZCBEb20gem9uZXMsIHRvCj4+Pj4gICAgICAgICAqIHByZXZl
bnQgbWVyZ2luZyBvZiBwb3dlci1vZi10d28gYmxvY2tzIGFjcm9zcyB0aGUgem9uZSBib3VuZGFy
eS4KPj4+PiAgICAgICAgICovCj4+Pj4gLSAgICBpZiAoIHBzICYmICFpc194ZW5faGVhcF9tZm4o
cGFkZHJfdG9fcGZuKHBzKS0xKSApCj4+Pj4gKyAgICBpZiAoIHBzICYmICFpc194ZW5faGVhcF9t
Zm4oX21mbihwYWRkcl90b19wZm4ocHMpLTEpKSApCj4+Pj4gICAgICAgICAgICBwcyArPSBQQUdF
X1NJWkU7Cj4+Pj4gLSAgICBpZiAoICFpc194ZW5faGVhcF9tZm4ocGFkZHJfdG9fcGZuKHBlKSkg
KQo+Pj4+ICsgICAgaWYgKCAhaXNfeGVuX2hlYXBfbWZuKG1hZGRyX3RvX21mbihwZSkpICkKPj4+
Cj4+PiBXaHkgbWFkZHJfdG9fbWZuKCkgaGVyZSBidXQgc3RpbGwgcGFkZHJfdG9fcGZuKCkgYWJv
dmU/IE9oLAo+Pj4gd2UgZG9uJ3QgaGF2ZSBhbnkgbWZuX3N1YigpLCBJIHNlZS4KPj4KPj4gWWVz
IHdlIGRvbid0IGhhdmUgbWZuX3N1YigpIChvciBldmVuIGdmbl9zdWIoKSkuIEkgb25seSBmb3Vu
ZCBhIGNvdXBsZSBvZiBwbGFjZXMKPj4gd2hlcmUgc3VjaCBoZWxwZXJzIG1pZ2h0IGJlIHVzZWZ1
bC4gSSBjYW4gaW50cm9kdWNlIHRoZSAyIGhlbHBlcnMgaWYgeW91IHRoaW5rCj4+IGl0IGlzIHdv
cnRoIGl0Lgo+IAo+IFdlbGwsIEkgZ3Vlc3MgaW4gdGhlIGVuZCBJJ20gZmluZSBlaXRoZXIgd2F5
LiBJdCBzaW1wbHkgc3RydWNrIG1lCj4gYXMgb2RkIGF0IHRoZSBmaXJzdCBnbGFuY2UgdGhhdCB5
b3UgdXNlIG1hZGRyX3RvX21mbigpIGluIG9uZQo+IGNhc2UgYnV0IG5vdCB0aGUgb3RoZXIuCgpJ
IHdhbnRlZCB0byBhdm9pZCBhZGRpbmcgbWZuX3goLi4uKSBvbiB0aGUgbGluZToKCl9tZm4obWZu
X3gobWFkZHJfdG9fbWZuKHBzKSkgLSAxKQoKSSB3aWxsIGxvb2sgdG8gaW50cm9kdWNlIG1mbl9z
dWIoKS9nZm5fc3ViKCkuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
