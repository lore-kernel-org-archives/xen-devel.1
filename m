From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH RFC v1 56/74] xen/pvshim: add grant table
 operations
Date: Wed, 10 Jan 2018 08:01:51 +0000
Message-ID: <20180110080151.dhtaamur67byb7jc@MacBook-Pro-de-Roger.local>
References: <20180104130625.28605-1-wei.liu2@citrix.com>
 <20180104130625.28605-57-wei.liu2@citrix.com>
 <5A53B63B020000780019C5EC@prv-mh.provo.novell.com>
 <20180109183403.jfehrfhvkd7a2ya5@MacBook-Pro-de-Roger.local>
 <5A55CEAB020000780019D12A@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=8asd=ef=citrix.com=prvs=541767f32=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eZBKt-00061b-IS
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2018 08:02:11 +0000
Content-Disposition: inline
In-Reply-To: <5A55CEAB020000780019D12A@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, wei.liu2@citrix.com, Anthony Liguori <aliguori@amazon.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKYW4gMTAsIDIwMTggYXQgMTI6Mjg6MjdBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA5LjAxLjE4IGF0IDE5OjM0LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gT24gTW9uLCBKYW4gMDgsIDIwMTggYXQgMTA6MTk6MzlBTSAtMDcwMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4gPj4gPj4+IE9uIDA0LjAxLjE4IGF0IDE0OjA2LCA8d2VpLmxpdTJAY2l0
cml4LmNvbT4gd3JvdGU6Cj4gPj4gPiArICAgIHsKPiA+PiA+ICsgICAgICAgIHN0cnVjdCBnbnR0
YWJfcXVlcnlfc2l6ZSBvcDsKPiA+PiA+ICsgICAgICAgIGludCByYzsKPiA+PiA+ICsKPiA+PiA+
ICsgICAgICAgIGlmICggdW5saWtlbHkoY29weV9mcm9tX2d1ZXN0KCZvcCwgdW9wLCAxKSkgKQo+
ID4+ID4gKyAgICAgICAgewo+ID4+ID4gKyAgICAgICAgICAgIHJjID0gLUVGQVVMVDsKPiA+PiA+
ICsgICAgICAgICAgICBicmVhazsKPiA+PiA+ICsgICAgICAgIH0KPiA+PiA+ICsKPiA+PiA+ICsg
ICAgICAgIHJjID0geGVuX2h5cGVyY2FsbF9ncmFudF90YWJsZV9vcChHTlRUQUJPUF9xdWVyeV9z
aXplLCAmb3AsIGNvdW50KTsKPiA+PiA+ICsgICAgICAgIGlmICggcmMgKQo+ID4+ID4gKyAgICAg
ICAgICAgIGJyZWFrOwo+ID4+ID4gKwo+ID4+ID4gKyAgICAgICAgaWYgKCBjb3B5X3RvX2d1ZXN0
KHVvcCwgJm9wLCAxKSApCj4gPj4gCj4gPj4gX19jb3B5X3RvX2d1ZXN0KCkgKGFzc3VtaW5nIHRo
aXMgY29waW5nIGluIGFuZCBvdXQgaXMgbmVjZXNzYXJ5Cj4gPj4gaW4gdGhlIGZpcnN0IHBsYWNl
KS4KPiA+IAo+ID4gSSBndWVzcyB0aGlzIGNvdWxkIGJlIGJ5cGFzc2VkIGJ5IGp1c3QgdXNpbmcg
dW9wIGluc3RlYWQgb2Ygb3AgaW4gdGhlCj4gPiBoeXBlcmNhbGw/Cj4gCj4gVGhhdCdzIG15IGlt
cHJlc3Npb24sIGJ1dCB5b3UgZG9pbmcgdGhlIGNvcHlpbmcgbWFkZSBtZSBhc3N1bWUKPiB5b3Ug
bWlnaHQgaGF2ZSBmb3VuZCBhIGNhc2Ugd2hlcmUgdGhpbmdzIGRvbid0IHdvcmsgd2l0aG91dAo+
IGNvcHlpbmcuCgpObywganVzdCBkaWRuJ3QgcmVhbGl6ZSBJIGNvdWxkIGRvIGl0IHRoYXQgd2F5
LiBnbnR0YWJfcXVlcnlfc2l6ZQpkb2Vzbid0IHJlcXVpcmUgYW55IGNvbXBhdCBjb2RlIEFGQUlD
VCwgc28gaXQgc2hvdWxkIHdvcmsgZmluZS4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
