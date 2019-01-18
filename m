From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH RFC for next] xen: make grant table
 configurable
Date: Fri, 18 Jan 2019 09:20:41 +0000
Message-ID: <20190118092041.h3mvehnikux7uzz7@zion.uk.xensource.com>
References: <20190117123054.809-1-wei.liu2@citrix.com>
 <5C4184DA020000780020EEA6@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0nkm=P2=citrix.com=prvs=914c507ef=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gkQKg-0008E0-3Q
 for xen-devel@lists.xenproject.org; Fri, 18 Jan 2019 09:20:58 +0000
Content-Disposition: inline
In-Reply-To: <5C4184DA020000780020EEA6@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBKYW4gMTgsIDIwMTkgYXQgMTI6NDg6NDJBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE3LjAxLjE5IGF0IDEzOjMwLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiAtLS0gYS94ZW4vY29tbW9uL0tjb25maWcKPiA+ICsrKyBiL3hlbi9jb21tb24vS2Nv
bmZpZwo+ID4gQEAgLTExLDYgKzExLDE3IEBAIGNvbmZpZyBDT01QQVQKPiA+ICBjb25maWcgQ09S
RV9QQVJLSU5HCj4gPiAgCWJvb2wKPiA+ICAKPiA+ICtjb25maWcgR1JBTlRfVEFCTEUKPiA+ICsJ
Ym9vbCAiR3JhbnQgdGFibGUgc3VwcG9ydCIKPiA+ICsJZGVmYXVsdCB5Cj4gPiArCS0tLWhlbHAt
LS0KPiA+ICsJICBHcmFudCB0YWJsZSBwcm92aWRlcyBhIGdlbmVyaWMgbWVjaGFuaXNtIHRvIG1l
bW9yeSBzaGFyaW5nCj4gPiArCSAgYmV0d2VlbiBkb21haW5zLiBUaGlzIHNoYXJlZCBtZW1vcnkg
aW50ZXJmYWNlIHVuZGVycGlucyB0aGUKPiA+ICsJICBzcGxpdCBkZXZpY2UgZHJpdmVycyBmb3Ig
YmxvY2sgYW5kIG5ldHdvcmsgSU8gaW4gYSBjbGFzc2ljCj4gPiArCSAgWGVuIHNldHVwLgo+IAo+
IEkgY2FuIHNlZSByZWFzb25zIHdoeSBvbmUgbWF5IHdhbnQgdGhpcyAoYWxvbmcgdGhlIGxpbmVz
IG9mIFNJTE8KPiBtb2RlKSwgYnV0IGl0J2xsIHByb2R1Y2UgYW4gZW50aXJlbHkgQUJJLWluY29t
cGF0aWJsZSBoeXBlcnZpc29yLgo+IE1vc3QgZnJvbnQtL2JhY2tlbmQgZHJpdmVyIHBhaXJzIHdv
bid0IHdvcmsgd2l0aG91dCBpdC4gSSdtIG5vdAo+IHN1cmUgdGhlIHRvb2wgc3RhY2sgaXMgcHJl
cGFyZWQgdG8gYWN0IG9uIHN1Y2ggYSBoeXBlcnZpc29yLiBJJ20KPiBwcmV0dHkgc3VyZSBhdCBs
ZWFzdCBYZW5vTGludXggZGVyaXZhdGl2ZXMgQlVHKCkgdXBvbiBlcnJvcgo+IHJldHVybnMgZnJv
bSBjZXJ0YWluIGdudHRhYiBoeXBlcmNhbGxzLgo+IAo+IEFzIHN1Y2ggYXMgd2VsbCBhcyB0byBi
ZSB3aXRoaW4gb3VyIGdlbmVyYWwgbGluZSBvZiB3aGF0IEtjb25maWcKPiBvcHRpb25zIHdlIHBl
cm1pdCwgSSB0aGluayBmb3IgdGhlIHRpbWUgYmVpbmcgdGhlIHByb21wdCBuZWVkcwo+IHRvIGRl
cGVuZCBvbiBFWFBFUlQgPSAieSIuCgpHb29kIHBvaW50LiBJIHdpbGwgZG8gdGhhdC4KCldlaS4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
