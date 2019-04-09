From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH RFC 13/55] x86/mm: rewrite virt_to_xen_l3e
Date: Tue, 9 Apr 2019 13:27:18 +0100
Message-ID: <20190409122718.GD30543@zion.uk.xensource.com>
References: <20190207164456.9260-1-wei.liu2@citrix.com>
 <20190207164456.9260-14-wei.liu2@citrix.com>
 <5CAB6F0302000078002257C1@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=piA2=SL=citrix.com=prvs=9957968d6=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hDpqm-0000lV-Ie
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 12:27:40 +0000
Content-Disposition: inline
In-Reply-To: <5CAB6F0302000078002257C1@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBBcHIgMDgsIDIwMTkgYXQgMDk6NTU6NDdBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA3LjAyLjE5IGF0IDE3OjQ0LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBAQCAtNDc2OSw0NSArNDc2OSw3MCBAQCB2b2lkIGZyZWVfeGVuX3BhZ2V0YWJsZV9u
ZXcobWZuX3QgbWZuKQo+ID4gIAo+ID4gIHN0YXRpYyBERUZJTkVfU1BJTkxPQ0sobWFwX3BnZGly
X2xvY2spOwo+ID4gIAo+ID4gKy8qCj4gPiArICogR2l2ZW4gYSB2aXJ0dWFsIGFkZHJlc3MsIHJl
dHVybiBhIHBvaW50ZXIgdG8geGVuJ3MgTDMgZW50cnkuIENhbGxlcgo+ID4gKyAqIG5lZWRzIHRv
IHVubWFwIHRoZSBwb2ludGVyLgo+ID4gKyAqLwo+ID4gIHN0YXRpYyBsM19wZ2VudHJ5X3QgKnZp
cnRfdG9feGVuX2wzZSh1bnNpZ25lZCBsb25nIHYpCj4gPiAgewo+ID4gICAgICBsNF9wZ2VudHJ5
X3QgKnBsNGU7Cj4gPiArICAgIGwzX3BnZW50cnlfdCAqcGwzZSA9IE5VTEw7Cj4gPiAgCj4gPiAg
ICAgIHBsNGUgPSAmaWRsZV9wZ190YWJsZVtsNF90YWJsZV9vZmZzZXQodildOwo+ID4gICAgICBp
ZiAoICEobDRlX2dldF9mbGFncygqcGw0ZSkgJiBfUEFHRV9QUkVTRU5UKSApCj4gPiAgICAgIHsK
PiA+ICAgICAgICAgIGJvb2wgbG9ja2luZyA9IHN5c3RlbV9zdGF0ZSA+IFNZU19TVEFURV9ib290
Owo+ID4gLSAgICAgICAgbDNfcGdlbnRyeV90ICpsM3QgPSBhbGxvY194ZW5fcGFnZXRhYmxlKCk7
Cj4gPiArICAgICAgICBsM19wZ2VudHJ5X3QgKmwzdDsKPiA+ICsgICAgICAgIG1mbl90IG1mbjsK
PiA+ICsKPiA+ICsgICAgICAgIG1mbiA9IGFsbG9jX3hlbl9wYWdldGFibGVfbmV3KCk7Cj4gPiAr
ICAgICAgICBpZiAoIG1mbl9lcShtZm4sIElOVkFMSURfTUZOKSApCj4gPiArICAgICAgICAgICAg
Z290byBvdXQ7Cj4gCj4gQW55IHJlYXNvbiBub3QgdG8gdXNlICJyZXR1cm4gTlVMTCIgaGVyZSwg
YXZvaWRpbmcgdGhlIGdvdG8KPiBhbmQgbGFiZWwgYWx0b2dldGhlciBpbiB0aXMgZnVuY3Rpb24/
CgpUaGlzIGNhbiBiZSBkb25lLCBidXQgSSB3YW50ZWQgdG8gaGF2ZSBhbGwgdmlydF90b194ZW5f
bFhlIGhhdmUgdGhlIHNhbWUKc3RydWN0dXJlLgoKPiAKPiA+ICBzdGF0aWMgbDJfcGdlbnRyeV90
ICp2aXJ0X3RvX3hlbl9sMmUodW5zaWduZWQgbG9uZyB2KQo+ID4gIHsKPiA+ICAgICAgbDNfcGdl
bnRyeV90ICpwbDNlOwo+ID4gKyAgICBsMl9wZ2VudHJ5X3QgKnBsMmUgPSBOVUxMOwo+ID4gIAo+
ID4gICAgICBwbDNlID0gdmlydF90b194ZW5fbDNlKHYpOwo+ID4gICAgICBpZiAoICFwbDNlICkK
PiA+IC0gICAgICAgIHJldHVybiBOVUxMOwo+ID4gKyAgICAgICAgZ290byBvdXQ7Cj4gCj4gV2h5
IG5vdCBrZWVwIHRoaXMgb25lIHRoZSB3YXkgaXQgaXM/CgpCZWNhdXNlIHRoZXJlIHdpbGwgYmUg
YW4gb3V0IGxhYmVsIGFueXdheSwgd2h5IG5vdCB1c2UgaXQgdG8gaGF2ZSBhCnNpbmdsZSBleGl0
IHBhdGg/CgpXZWkuCgo+IAo+IEphbgo+IAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
