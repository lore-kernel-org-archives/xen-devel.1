From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 2/8] x86: distinguish CPU offlining from CPU
 removal
Date: Fri, 13 Jul 2018 09:39:14 +0100
Message-ID: <20180713083914.ymuhlxazyryzjw4l@citrix.com>
References: <5B45F01B02000078001D30FF@prv1-mh.provo.novell.com>
 <5B45F2AC02000078001D3133@prv1-mh.provo.novell.com>
 <20180712105357.voao6og5ol6idfp5@citrix.com>
 <5B47401802000078001D376A@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pubn=j5=citrix.com=prvs=725ad1d35=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fdtbj-0001jT-6u
 for xen-devel@lists.xenproject.org; Fri, 13 Jul 2018 08:39:19 +0000
Content-Disposition: inline
In-Reply-To: <5B47401802000078001D376A@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKdWwgMTIsIDIwMTggYXQgMDU6NDg6NDBBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDEyLjA3LjE4IGF0IDEyOjUzLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBPbiBXZWQsIEp1bCAxMSwgMjAxOCBhdCAwNjowNjowNEFNIC0wNjAwLCBKYW4gQmV1
bGljaCB3cm90ZToKPiA+IFsuLi5dCj4gPj4gLS0tIGEveGVuL2FyY2gveDg2L3NtcGJvb3QuYwo+
ID4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9zbXBib290LmMKPiA+PiBAQCAtNjMsNiArNjMsOCBAQCBz
dGF0aWMgY3B1bWFza190IHNjcmF0Y2hfY3B1MG1hc2s7Cj4gPj4gIGNwdW1hc2tfdCBjcHVfb25s
aW5lX21hcCBfX3JlYWRfbW9zdGx5Owo+ID4+ICBFWFBPUlRfU1lNQk9MKGNwdV9vbmxpbmVfbWFw
KTsKPiA+PiAgCj4gPj4gK2Jvb2wgX19yZWFkX21vc3RseSBwYXJrX29mZmxpbmVfY3B1czsKPiA+
PiArCj4gPj4gIHVuc2lnbmVkIGludCBfX3JlYWRfbW9zdGx5IG5yX3NvY2tldHM7Cj4gPj4gIGNw
dW1hc2tfdCAqKl9fcmVhZF9tb3N0bHkgc29ja2V0X2NwdW1hc2s7Cj4gPj4gIHN0YXRpYyBjcHVt
YXNrX3QgKnNlY29uZGFyeV9zb2NrZXRfY3B1bWFzazsKPiA+PiBAQCAtODg3LDcgKzg4OSw3IEBA
IHN0YXRpYyB2b2lkIGNsZWFudXBfY3B1X3Jvb3RfcGd0KHVuc2lnbmUKPiA+PiAgICAgIH0KPiA+
PiAgfQo+ID4+ICAKPiA+PiAtc3RhdGljIHZvaWQgY3B1X3NtcGJvb3RfZnJlZSh1bnNpZ25lZCBp
bnQgY3B1KQo+ID4+ICtzdGF0aWMgdm9pZCBjcHVfc21wYm9vdF9mcmVlKHVuc2lnbmVkIGludCBj
cHUsIGJvb2wgYWxsKQo+ID4gCj4gPiBJIHRoaW5rICJhbGwiIGlzIHRvbyB2YWd1ZS4gSXQgZG9l
c24ndCBjb252ZXkgdGhlIGlkZWEgd2hhdCBjb25zdGl0dXRlcwo+ID4gInBhcnRpYWwiLiBCdXQg
SSBkb24ndCBoYXZlIGFueSBiZXR0ZXIgc3VnZ2VzdGlvbiBlaXRoZXIuCj4gCj4gSW5kZWVkIEkn
dmUgYmVlbiB0cnlpbmcgdG8gY29tZSB1cCB3aXRoIGEgYmV0dGVyIG5hbWUgYmVmb3JlCj4gcG9z
dGluZywgYnV0IGNvdWxkbid0LiBPbmUgdGhpbmcgdGhvdWdoIC0gSSBkb24ndCB0aGluayB0aGUg
bmFtZQo+IHNob3VsZCBpbiBhbnl3YXkgYmUgcmVxdWlyZWQgdG8gZXhwcmVzcyB3aGF0ICJwYXJ0
aWFsIiBtZWFucy4KPiAKCkEgc2VudGVuY2Ugb3IgdHdvIHRvIGRlc2NyaWJlIHdoYXQgIWFsbCBp
cyBmb3Igd291bGQgYmUgaGVscGZ1bC4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
