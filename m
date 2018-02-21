From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 1/2] x86/hvm: introduce cr{0,
 4}_host_mask to store trapped bits of CR accesses
Date: Wed, 21 Feb 2018 08:27:07 +0000
Message-ID: <20180221082707.qhw66eiyo5e3gz2k@MacBook-Pro-de-Roger.local>
References: <20180220085647.25459-1-roger.pau@citrix.com>
 <20180220085647.25459-2-roger.pau@citrix.com>
 <9e4a1ca2-c855-8132-825c-f0efbd66d99a@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=e/wr=fp=citrix.com=prvs=583418c1e=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eoPkE-0003bN-KP
 for xen-devel@lists.xenproject.org; Wed, 21 Feb 2018 08:27:18 +0000
Content-Disposition: inline
In-Reply-To: <9e4a1ca2-c855-8132-825c-f0efbd66d99a@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBGZWIgMjAsIDIwMTggYXQgMDc6MjM6NDRQTSAtMDUwMCwgQm9yaXMgT3N0cm92c2t5
IHdyb3RlOgo+IE9uIDAyLzIwLzIwMTggMDM6NTYgQU0sIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToK
PiA+IEF0IHRoZSBtb21lbnQgdGhpcyBpcyBjdXJyZW50bHkgc2V0IGF0IFZNQ3tTL0J9IGNyZWF0
aW9uIGFuZCBub3QgY2hhbmdlZCwKPiA+IGJ1dCBmdXJ0aGVyIHBhdGNoZXMgYXJlIGdvaW5nIHRv
IGNoYW5nZSB0aGUgQ1I0IG1hc2sgYXQgcnVudGltZS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBS
b2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiA+IC0tLQo+ID4gQ2M6IEJv
cmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+Cj4gPiBDYzogU3VyYXZl
ZSBTdXRoaWt1bHBhbml0IDxzdXJhdmVlLnN1dGhpa3VscGFuaXRAYW1kLmNvbT4KPiA+IENjOiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gPiBDYzogQW5kcmV3IENvb3BlciA8YW5k
cmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiA+IENjOiBKdW4gTmFrYWppbWEgPGp1bi5uYWthamlt
YUBpbnRlbC5jb20+Cj4gPiBDYzogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+Cj4g
PiAtLS0KPiA+IENoYW5nZXMgc2luY2UgdjI6Cj4gPiAgLSBJbnRyb2R1Y2UgbWFza3Mgb25seSBm
b3IgQ1I0IGFuZCBDUjAuCj4gPgo+ID4gQ2hhbmdlcyBzaW5jZSB2MToKPiA+ICAtIE5ldyBpbiB0
aGlzIHZlcnNpb24uCj4gPiAtLS0KPiA+ICB4ZW4vYXJjaC94ODYvaHZtL3N2bS92bWNiLmMgICAg
fCAxICsKPiA+ICB4ZW4vYXJjaC94ODYvaHZtL3ZteC92bWNzLmMgICAgfCAxICsKPiA+ICB4ZW4v
aW5jbHVkZS9hc20teDg2L2h2bS92Y3B1LmggfCA0ICsrKysKPiA+ICAzIGZpbGVzIGNoYW5nZWQs
IDYgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL3N2
bS92bWNiLmMgYi94ZW4vYXJjaC94ODYvaHZtL3N2bS92bWNiLmMKPiA+IGluZGV4IDBlNmNiYTVi
N2IuLmJlZWFmYWQyMzUgMTAwNjQ0Cj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL3N2bS92bWNi
LmMKPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vc3ZtL3ZtY2IuYwo+ID4gQEAgLTE2OSw2ICsx
NjksNyBAQCBzdGF0aWMgaW50IGNvbnN0cnVjdF92bWNiKHN0cnVjdCB2Y3B1ICp2KQo+ID4gICAg
ICB2bWNiLT50ci5iYXNlID0gMDsKPiA+ICAgICAgdm1jYi0+dHIubGltaXQgPSAweGZmOwo+ID4g
IAo+ID4gKyAgICB2LT5hcmNoLmh2bV92Y3B1LmNyMF9ob3N0X21hc2sgPSB2LT5hcmNoLmh2bV92
Y3B1LmNyNF9ob3N0X21hc2sgPSB+MFVMOwo+ID4gICAgICB2LT5hcmNoLmh2bV92Y3B1Lmd1ZXN0
X2NyWzBdID0gWDg2X0NSMF9QRSB8IFg4Nl9DUjBfRVQ7Cj4gPiAgICAgIGh2bV91cGRhdGVfZ3Vl
c3RfY3IodiwgMCk7Cj4gCj4gCj4gSXMgdGhlcmUgYSByZWFzb24gZm9yIHNldHRpbmcgdGhvc2Ug
ZmllbGRzPyBTVk0gd29uJ3QgdXNlIHRoZW0sIHdpbGwgaXQ/CgpObywgU1ZNIHdvbid0IHVzZSB0
aGVtIGJ1dCBJTUhPIGl0J3MgZ29vZCBmb3IgY29oZXJlbmN5IHRvIGFsc28gc2V0CnRoZW0uIFRo
ZSBpbml0aWFsIHBsYW4gd2FzIHRvIGRvIHNvbWV0aGluZyBzaW1pbGFyIGZvciBTVk0sIGJ1dCBJ
CmNvdWxkbid0IGZpbmQgaG93IHRvIGRvIHNlbGVjdGl2ZSBDUjQgdHJhcHBpbmcgZm9yIFNWTS4K
CkkgY291bGQgbW92ZSB0aGlzIGluc2lkZSBvZiBhcmNoX3ZteF9zdHJ1Y3QgaWYgaXQgc2VlbXMg
YmV0dGVyLCBidXQgSQp3YXMgZXhwZWN0aW5nIHRvIGJlIGFibGUgdG8gZG8gc29tZXRoaW5nIHNp
bWlsYXIgZm9yIFNWTSBpbiBvcmRlciB0bwphdm9pZCBuZWVkbGVzc2x5IHRyYXBwaW5nIENSNC4K
ClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
