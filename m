From: Norbert Manthey <nmanthey@amazon.de>
Subject: Re: [PATCH SpectreV1+L1TF v6 2/9] x86/vioapic: block
 speculative out-of-bound accesses
Date: Thu, 14 Feb 2019 14:16:30 +0100
Message-ID: <66a21963-2579-b957-a1c6-8628d88ba503@amazon.de>
References: <1c2b8322-1b66-ccc6-9ba9-e86eafb0227a@amazon.de>
 <1549633489-12724-1-git-send-email-nmanthey@amazon.de>
 <1549633489-12724-3-git-send-email-nmanthey@amazon.de>
 <5C4ED1D402000078002119E6@prv1-mh.provo.novell.com>
 <9C03B9BA0200004637554D14@prv1-mh.provo.novell.com>
 <00FAA7AF020000F8B1E090C7@prv1-mh.provo.novell.com>
 <0101E7AF020000F8B1E090C7@prv1-mh.provo.novell.com>
 <5C532AC00200007800212EA2@prv1-mh.provo.novell.com>
 <A18FF6C80200006BB1E090C7@prv1-mh.provo.novell.com>
 <01CCAAAF02000039B1E090C7@prv1-mh.provo.novell.com>
 <01CC2AAF02000039B1E090C7@prv1-mh.provo.novell.com>
 <5C62C7360200007800215E87@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tSEH=QV=amazon.de=prvs=9419de174=nmanthey@srs-us1.protection.inumbo.net>)
 id 1guGsi-00042n-Kg
 for xen-devel@lists.xenproject.org; Thu, 14 Feb 2019 13:16:48 +0000
In-Reply-To: <5C62C7360200007800215E87@prv1-mh.provo.novell.com>
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
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, wipawel@amazon.de, Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, "Martin Mazein(amazein)" <amazein@amazon.de>, xen-devel <xen-devel@lists.xenproject.org>, Julian Stecklina <jsteckli@amazon.de>, Bjoern Doebel <doebel@amazon.de>
List-Id: xen-devel@lists.xenproject.org

T24gMi8xMi8xOSAxNDoxNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDguMDIuMTkgYXQg
MTQ6NDQsIDxubWFudGhleUBhbWF6b24uZGU+IHdyb3RlOgo+PiBXaGVuIGludGVyYWN0aW5nIHdp
dGggaW8gYXBpYywgYSBndWVzdCBjYW4gc3BlY2lmeSB2YWx1ZXMgdGhhdCBhcmUgdXNlZAo+PiBh
cyBpbmRleCB0byBzdHJ1Y3R1cmVzLCBhbmQgd2hvc2UgdmFsdWVzIGFyZSBub3QgY29tcGFyZWQg
YWdhaW5zdAo+PiB1cHBlciBib3VuZHMgdG8gcHJldmVudCBzcGVjdWxhdGl2ZSBvdXQtb2YtYm91
bmQgYWNjZXNzZXMuIFRoaXMgY2hhbmdlCj4+IHByZXZlbnRzIHRoZXNlIHNwZWN1bGF0aXZlIGFj
Y2Vzc2VzLgo+Pgo+PiBGdXJ0aGVybW9yZSwgdmFyaWFibGVzIGFyZSBpbml0aWFsaXplZCBhbmQg
dGhlIGNvbXBpbGVyIGlzIGFza2VkIHRvIG5vdAo+PiBvcHRpbWl6ZWQgdGhlc2UgaW5pdGlhbGl6
YXRpb25zLCBhcyB0aGUgdW5pbml0aWFsaXplZCwgcG90ZW50aWFsbHkgZ3Vlc3QKPj4gY29udHJv
bGxlZCwgdmFyaWFibGVzIG1pZ2h0IGJlIHVzZWQgaW4gYSBzcGVjdWxhdGl2ZSBvdXQtb2YtYm91
bmQgYWNjZXNzLgo+IFVuaW5pdGlhbGl6ZWQgdmFyaWFibGVzIGNhbid0IGJlIGd1ZXN0IGNvbnRy
b2xsZWQsIG5vdCBldmVuIHBvdGVudGlhbGx5Lgo+IFdoYXQgd2Ugd2FudCB0byBhdm9pZCBoZXJl
IGlzIHNwZWN1bGF0aW9uIHdpdGggdW5pbml0aWFsaXplZCB2YWx1ZXMKPiAob3IgcmVhbGx5IHN0
YWxlIGRhdGEgc3RpbGwgb24gdGhlIHN0YWNrIGZyb20gdXNlIGJ5IG90aGVyIGNvZGUpLAo+IHJl
Z2FyZGxlc3Mgb2YgZGlyZWN0IGd1ZXN0IGNvbnRyb2wuCkkgd2lsbCBkcm9wIHRoZSBwYXJ0ICJw
b3RlbnRpYWxseSBndWVzdCBjb250cm9sbGVkIi4KPgo+PiBPdXQgb2YgdGhlIGZvdXIgaW5pdGlh
bGl6ZWQgdmFyaWFibGVzLCB0d28gYXJlIHBvdGVudGlhbGx5IHByb2JsZW1hdGljLAo+PiBuYW1l
bHkgb25lcyBpbiB0aGUgZnVuY3Rpb25zIHZpb2FwaWNfaXJxX3Bvc2l0aXZlX2VkZ2UgYW5kCj4+
IHZpb2FwaWNfZ2V0X3RyaWdnZXJfbW9kZS4KPj4KPj4gQXMgdGhlIHR3byBwcm9ibGVtYXRpYyB2
YXJpYWJsZXMgYXJlIGJvdGggdXNlZCBpbiB0aGUgY29tbW9uIGZ1bmN0aW9uCj4+IGdzaV92aW9h
cGljLCB0aGUgbWl0aWdhdGlvbiBpcyBpbXBsZW1lbnRlZCB0aGVyZS4gQXMgdGhlIGFjY2VzcyBw
YXR0ZXJuCj4+IG9mIHRoZSBjdXJyZW50bHkgbm9uLWd1ZXN0LWNvbnRyb2xsZWQgZnVuY3Rpb25z
IG1pZ2h0IGNoYW5nZSBpbiB0aGUKPj4gZnV0dXJlIGFzIHdlbGwsIHRoZSBvdGhlciB2YXJpYWJs
ZXMgYXJlIGluaXRpYWxpemVkIGFzIHdlbGwuCj4+Cj4+IFRoaXMgY29tbWl0IGlzIHBhcnQgb2Yg
dGhlIFNwZWN0cmVWMStMMVRGIG1pdGlnYXRpb24gcGF0Y2ggc2VyaWVzLgo+IE9oLCBJIGRpZG4n
dCBwYXkgYXR0ZW50aW9uIGluIHBhdGNoIDE6IFlvdSBoYWQgbWVhbnQgdG8gY2hhbmdlIHRoaXMK
PiB3b3JkaW5nIHRvIHNvbWV0aGluZyBpbmNsdWRpbmcgInNwZWN1bGF0aXZlIGhhcmRlbmluZyIg
KHRocm91Z2hvdXQKPiB0aGUgc2VyaWVzKS4KVGhhdCBzbGlwcGVkIHRocm91Z2ggYXMgSSBkaWQg
bm90IGFkZCB0aGF0IHJpZ2h0IGFmdGVyIHRoZSBkaXNjdXNzaW9uLiBJCmFkZGVkIHRoaXMgdG8g
dGhlIHdob2xlIHNlcmllcyBub3cuCj4KPj4gQEAgLTIxMiw3ICsyMjAsMTUgQEAgc3RhdGljIHZv
aWQgdmlvYXBpY193cml0ZV9yZWRpcmVudCgKPj4gICAgICBzdHJ1Y3QgaHZtX2lycSAqaHZtX2ly
cSA9IGh2bV9kb21haW5faXJxKGQpOwo+PiAgICAgIHVuaW9uIHZpb2FwaWNfcmVkaXJfZW50cnkg
KnBlbnQsIGVudDsKPj4gICAgICBpbnQgdW5tYXNrZWQgPSAwOwo+PiAtICAgIHVuc2lnbmVkIGlu
dCBnc2kgPSB2aW9hcGljLT5iYXNlX2dzaSArIGlkeDsKPj4gKyAgICB1bnNpZ25lZCBpbnQgZ3Np
Owo+PiArCj4+ICsgICAgLyogQ2FsbGVycyBvZiB0aGlzIGZ1bmN0aW9uIHNob3VsZCBtYWtlIHN1
cmUgaWR4IGlzIGJvdW5kZWQgYXBwcm9wcmlhdGVseSAqLwo+PiArICAgIEFTU0VSVChpZHggPCB2
aW9hcGljLT5ucl9waW5zKTsKPj4gKwo+PiArICAgIC8qIE1ha2Ugc3VyZSBubyBvdXQtb2YtYm91
bmQgdmFsdWUgZm9yIGlkeCBjYW4gYmUgdXNlZCAqLwo+IG91dC1vZi1ib3VuZHMKCldpbGwgZml4
LgoKQmVzdCwKTm9yYmVydAoKPgo+IEknbSBmaW5lIG5vdyB3aXRoIGFsbCB0aGUgY29kZSBjaGFu
Z2VzIGhlcmUuCj4KPiBKYW4KPgo+CgoKCkFtYXpvbiBEZXZlbG9wbWVudCBDZW50ZXIgR2VybWFu
eSBHbWJICktyYXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJlcjogQ2hy
aXN0aWFuIFNjaGxhZWdlciwgUmFsZiBIZXJicmljaApVc3QtSUQ6IERFIDI4OSAyMzcgODc5CkVp
bmdldHJhZ2VuIGFtIEFtdHNnZXJpY2h0IENoYXJsb3R0ZW5idXJnIEhSQiAxNDkxNzMgQgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
