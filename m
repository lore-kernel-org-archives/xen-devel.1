From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH RFC 01/55] x86/mm: defer clearing page in
 virt_to_xen_lXe
Date: Tue, 9 Apr 2019 13:21:56 +0100
Message-ID: <20190409122156.GM1986@zion.uk.xensource.com>
References: <20190207164456.9260-1-wei.liu2@citrix.com>
 <20190207164456.9260-2-wei.liu2@citrix.com>
 <5C8BB8EE020000780021F594@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=piA2=SL=citrix.com=prvs=9957968d6=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hDplu-00089C-VA
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 12:22:39 +0000
Content-Disposition: inline
In-Reply-To: <5C8BB8EE020000780021F594@prv1-mh.provo.novell.com>
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

T24gRnJpLCBNYXIgMTUsIDIwMTkgYXQgMDg6Mzg6MzhBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA3LjAyLjE5IGF0IDE3OjQ0LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvbW0uYwo+ID4gKysrIGIveGVuL2FyY2gveDg2L21t
LmMKPiA+IEBAIC00NzUyLDEzICs0NzUyLDEzIEBAIHN0YXRpYyBsM19wZ2VudHJ5X3QgKnZpcnRf
dG9feGVuX2wzZSh1bnNpZ25lZCBsb25nIHYpCj4gPiAgCj4gPiAgICAgICAgICBpZiAoICFwbDNl
ICkKPiA+ICAgICAgICAgICAgICByZXR1cm4gTlVMTDsKPiA+IC0gICAgICAgIGNsZWFyX3BhZ2Uo
cGwzZSk7Cj4gPiAgICAgICAgICBpZiAoIGxvY2tpbmcgKQo+ID4gICAgICAgICAgICAgIHNwaW5f
bG9jaygmbWFwX3BnZGlyX2xvY2spOwo+ID4gICAgICAgICAgaWYgKCAhKGw0ZV9nZXRfZmxhZ3Mo
KnBsNGUpICYgX1BBR0VfUFJFU0VOVCkgKQo+ID4gICAgICAgICAgewo+ID4gICAgICAgICAgICAg
IGw0X3BnZW50cnlfdCBsNGUgPSBsNGVfZnJvbV9wYWRkcihfX3BhKHBsM2UpLCBfX1BBR0VfSFlQ
RVJWSVNPUik7Cj4gPiAgCj4gPiArICAgICAgICAgICAgY2xlYXJfcGFnZShwbDNlKTsKPiAKPiBJ
cyB0aGlzIHJlYWxseSBhbiBvcHRpbWl6YXRpb24/IFlvdSB0cmVhdCBhdm9pZGluZyB0byBjbGVh
ciB0aGUgcGFnZQo+IGluIGEgaG9wZWZ1bGx5IGluZnJlcXVlbnQgY2FzZSBvZiBhIHJhY2UgZm9y
IGhvbGRpbmcgdGhlIHNwaW4gbG9jawo+IGZvciBxdWl0ZSBhIGJpdCBsb25nZXIuCgpJIHdhcyBh
Y3R1YWxseSB0d28gbWluZGVkIHdoaWxlIHdyaXRpbmcgdGhpcyBwYXRjaC4gSXQgaXMgZGlmZmlj
dWx0IHRvCnByb3ZlIG9uZSB3YXkgb3IgdGhlIG90aGVyLiBUbyBhdm9pZCBkaXN0cmFjdGluZyBm
cm9tIHRoZSBtYWluIGlzc3VlIGF0CmhhbmQsIGRyb3BwaW5nIHRoaXMgcGF0Y2ggaXMgdGhlIGJl
c3Qgd2F5IGZvcndhcmQuCgpXZWkuCgo+IAo+IEphbgo+IAo+IAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
