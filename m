From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] VMX: fix vmx_{find,del}_msr() build
Date: Wed, 18 Jul 2018 10:40:36 +0100
Message-ID: <20180718094036.bs3qy6jzsvrawkr6@citrix.com>
References: <5B4CCBD302000078001D4907@prv1-mh.provo.novell.com>
 <20180718093635.6xj53gmrpezy5p2t@citrix.com>
 <5B4F0AC802000078001D552B@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ab30=kc=citrix.com=prvs=730fbb136=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ffiwq-0004et-DS
 for xen-devel@lists.xenproject.org; Wed, 18 Jul 2018 09:40:40 +0000
Content-Disposition: inline
In-Reply-To: <5B4F0AC802000078001D552B@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKdWwgMTgsIDIwMTggYXQgMDM6Mzk6MjBBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE4LjA3LjE4IGF0IDExOjM2LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBPbiBNb24sIEp1bCAxNiwgMjAxOCBhdCAxMDo0NjoxMUFNIC0wNjAwLCBKYW4gQmV1
bGljaCB3cm90ZToKPiA+PiBGb3IgYSByZWFzb24gdGhhdCBJIGNhbid0IGV4cGxhaW4sIGl0IGlz
IG9ubHkgdGhlIHNoaW0gYnVpbGQgdGhhdCBmYWlscwo+ID4+IGZvciBtZSB3aXRoIGFuIG9sZGVy
IGdjYyBkdWUgdG8gdGhlIGNvbXBpbGVyIG5vdCByZWNvZ25pemluZyB0aGF0Cj4gPj4gYXBwYXJl
bnRseSB1bmluaXRpYWxpemVkIHZhcmlhYmxlcyBhcmVuJ3QgcmVhbGx5IHVuaW5pdGlhbGl6ZWQu
IFB1bGwgb3V0Cj4gPj4gdGhlIGFzc2lnbm1lbnRzIHVzZWQgYnkgdHdvIG9mIHRoZSB0aHJlZSBj
YXNlIGJsb2NrcyBhbmQgbWFrZSB0aGVtCj4gPj4gaW5pdGlhbGl6ZXJzIG9mIHRoZSB2YXJpYWJs
ZXMsIGFzIEkgdGhpbmsgSSBoYWQgc3VnZ2VzdGVkIGR1cmluZyByZXZpZXcuCj4gPj4gCj4gPj4g
U2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+ID4gCj4gPiBD
b2RlOgo+ID4gCj4gPiBSZXZpZXdlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4K
PiA+IAo+ID4gQnV0IHBsZWFzZSB1cGRhdGUgdGhlIGNvbW1pdCBtZXNzYWdlIHRvIHNheSBpdCBp
cyBjYXVzZWQgYnkgY29tcGlsZXIKPiA+IG9wdGltaXNhdGlvbiBsZXZlbC4KPiAKPiBTdXJlLCBu
b3cgdGhhdCBpdCdzIGNsZWFyIHdoYXQgdGhlIHJlYXNvbiBpcy4gSXQgbm93IHJlYWRzOgo+IAo+
IE9sZGVyIGdjYyBhdCAtTzIgKGFuZCBwZXJoYXBzIGhpZ2hlcikgZG9lcyBub3QgcmVjb2duaXpl
IHRoYXQgYXBwYXJlbnRseQo+IHVuaW5pdGlhbGl6ZWQgdmFyaWFibGVzIGFyZW4ndCByZWFsbHkg
dW5pbml0aWFsaXplZC4gUHVsbCBvdXQgdGhlCj4gYXNzaWdubWVudHMgdXNlZCBieSB0d28gb2Yg
dGhlIHRocmVlIGNhc2UgYmxvY2tzIGFuZCBtYWtlIHRoZW0KPiBpbml0aWFsaXplcnMgb2YgdGhl
IHZhcmlhYmxlcywgYXMgSSB0aGluayBJIGhhZCBzdWdnZXN0ZWQgZHVyaW5nIHJldmlldy4KCkxH
VE0uCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
