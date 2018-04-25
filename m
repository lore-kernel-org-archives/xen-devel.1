From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: bogus wrap check in xen-netback
Date: Wed, 25 Apr 2018 11:31:25 +0100
Message-ID: <20180425103125.kllxadyujbqbiamq@citrix.com>
References: <20180425091956.7e4c98bc.olaf@aepfle.de>
 <ec157759-b859-32e3-dc90-75fd8dce669d@suse.com>
 <20180425093924.13c56296.olaf@aepfle.de>
 <20180425085923.k6bxc5j4nhoadhzl@citrix.com>
 <20180425110426.1427b6ab.olaf@aepfle.de>
 <20180425100653.64qclgt6i6cgculn@citrix.com>
 <5AE057BE02000078001BE50B@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=bryb=ho=citrix.com=prvs=64605ddc1=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fBHiB-0007Vm-CR
 for xen-devel@lists.xenproject.org; Wed, 25 Apr 2018 10:31:43 +0000
Content-Disposition: inline
In-Reply-To: <5AE057BE02000078001BE50B@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Olaf Hering <olaf@aepfle.de>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBBcHIgMjUsIDIwMTggYXQgMDQ6MjY6MDZBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDI1LjA0LjE4IGF0IDEyOjA2LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBPbiBXZWQsIEFwciAyNSwgMjAxOCBhdCAxMTowNDoyNkFNICswMjAwLCBPbGFmIEhl
cmluZyB3cm90ZToKPiA+PiBBbSBXZWQsIDI1IEFwciAyMDE4IDA5OjU5OjIzICswMTAwCj4gPj4g
c2NocmllYiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPjoKPiA+PiAKPiA+PiA+IERvIHlv
dSBoYXZlIHRoZSBmdWxsIGRpZmYgb2YgeW91ciBjaGFuZ2VzPyAKPiA+PiAKPiA+PiBOb3Qgcmln
aHQgbm93LiBCdXQgd2l0aG91dCAndmFsJywgb3IgdmFsIGJlaW5nIHVpbnQsIHRoZSBzYW1lIGVy
cm9yIGhhcHBlbnMgCj4gPiBpbiBmKCk6Cj4gPj4gCj4gPj4gI2luY2x1ZGUgPHN0ZGlvLmg+Cj4g
Pj4gdm9pZCBmKHZvaWQpCj4gPj4gewo+ID4+ICAgICAgICAgdW5zaWduZWQgc2hvcnQgcmVxX3By
b2QgPSAwLCByZXFfY29ucyA9IDY1NDAwOwo+ID4+ICAgICAgICAgdW5zaWduZWQgc2hvcnQgdmFs
Owo+ID4+ICAgICAgICAgdmFsID0gcmVxX3Byb2QgLSByZXFfY29uczsKPiA+PiAgICAgICAgIHBy
aW50ZigicmVxX3Byb2QgLSByZXFfY29ucyAldVxuIiwgdmFsKTsKPiA+PiAgICAgICAgIHByaW50
ZigicmVxX3Byb2QgLSByZXFfY29ucyAleFxuIiwgdmFsKTsKPiA+PiB9Cj4gPiAKPiA+IFdoYXQg
SmFuIHNhaWQuCj4gPiAKPiA+IEludGVnZXIgcHJvbW90aW9uIG1ha2VzIHVuc2lnbmVkIHNob3J0
IGludG8gdW5zaWduZWQgaW50IGZpcnN0IHRoZW4gZG8KPiA+IHRoZSBjYWxjdWxhdGlvbi4KPiAK
PiBOb3QgZXhhY3RseSAtIGl0IHByb21vdGVzIHRvIHBsYWluIChpLmUuIHNpZ25lZCkgaW50LgoK
TXkgYmFkLiBZZXMsIHRoZXkgYXJlIGNvbnZlcnRlZCB0byBpbnQsIG5vdCB1bnNpZ25lZCBpbnQu
CgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
