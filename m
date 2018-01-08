From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 16/22] vixen: pass grant table operations
 through to the outer Xen
Date: Mon, 8 Jan 2018 10:05:59 +0000
Message-ID: <20180108100559.3rcc23rpvrfqac2e@MacBook-Pro-de-Roger.local>
References: <1515279277-16301-1-git-send-email-aliguori@amzn.com>
 <1515279277-16301-17-git-send-email-aliguori@amzn.com>
 <20180107083624.mkus5osckvpastzh@MacBook-Pro-de-Roger.local>
 <CA+aC4kt-_vQO76O5Q_tgrssdvO7MwPf6ndjbnwnVZOhSx9sXdg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=q3al=ed=citrix.com=prvs=539ca8c7b=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eYUJm-0005Ii-TE
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2018 10:06:10 +0000
Content-Disposition: inline
In-Reply-To: <CA+aC4kt-_vQO76O5Q_tgrssdvO7MwPf6ndjbnwnVZOhSx9sXdg@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony Liguori <anthony@codemonkey.ws>
Cc: Anthony Liguori <aliguori@amzn.com>, Wei Liu <wei.liu2@citrix.com>, Matt Wilson <msw@amazon.com>, KarimAllah Ahmed <karahmed@amazon.de>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan =?iso-8859-1?Q?H=2E_Sch=F6nherr?= <jschoenh@amazon.de>, Anthony Liguori <aliguori@amazon.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gU3VuLCBKYW4gMDcsIDIwMTggYXQgMDc6NDI6NTVBTSAtMDgwMCwgQW50aG9ueSBMaWd1b3Jp
IHdyb3RlOgo+IE9uIFN1biwgSmFuIDcsIDIwMTggYXQgMTI6MzYgQU0sIFJvZ2VyIFBhdSBNb25u
w6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToKPiA+IE9uIFNhdCwgSmFuIDA2LCAyMDE4
IGF0IDAyOjU0OjMxUE0gLTA4MDAsIEFudGhvbnkgTGlndW9yaSB3cm90ZToKPiA+PiBkaWZmIC0t
Z2l0IGEveGVuL2NvbW1vbi9ncmFudF90YWJsZS5jIGIveGVuL2NvbW1vbi9ncmFudF90YWJsZS5j
Cj4gPj4gaW5kZXggMjUwNDUwYi4uYjMwMmZkMCAxMDA2NDQKPiA+PiAtLS0gYS94ZW4vY29tbW9u
L2dyYW50X3RhYmxlLmMKPiA+PiArKysgYi94ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMKPiA+PiAg
c3RhdGljIGxvbmcKPiA+PiArdml4ZW5fZ250dGFiX3NldHVwX3RhYmxlKAo+ID4+ICsgICAgWEVO
X0dVRVNUX0hBTkRMRV9QQVJBTShnbnR0YWJfc2V0dXBfdGFibGVfdCkgdW9wLCB1bnNpZ25lZCBp
bnQgY291bnQpCj4gPj4gK3sKPiA+PiArICAgIGxvbmcgcmM7Cj4gPj4gKwo+ID4+ICsgICAgc3Ry
dWN0IGdudHRhYl9zZXR1cF90YWJsZSBvcDsKPiA+PiArICAgIHhlbl9wZm5fdCAqZnJhbWVfbGlz
dCA9IE5VTEw7Cj4gPj4gKyAgICBzdGF0aWMgdm9pZCAqZ3JhbnRfdGFibGU7Cj4gPj4gKyAgICBY
RU5fR1VFU1RfSEFORExFKHhlbl9wZm5fdCkgb2xkX2ZyYW1lX2xpc3Q7Cj4gPj4gKwo+ID4+ICsg
ICAgaWYgKCBjb3VudCAhPSAxICkKPiA+PiArICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+PiAr
Cj4gPj4gKyAgICBpZiAoIHVubGlrZWx5KGNvcHlfZnJvbV9ndWVzdCgmb3AsIHVvcCwgMSkgIT0g
MCkgKQo+ID4+ICsgICAgewo+ID4+ICsgICAgICAgIGdkcHJpbnRrKFhFTkxPR19JTkZPLCAiRmF1
bHQgd2hpbGUgcmVhZGluZyBnbnR0YWJfc2V0dXBfdGFibGVfdC5cbiIpOwo+ID4+ICsgICAgICAg
IHJldHVybiAtRUZBVUxUOwo+ID4+ICsgICAgfQo+ID4+ICsKPiA+PiArICAgIGlmICggZ3JhbnRf
dGFibGUgPT0gTlVMTCApIHsKPiA+PiArICAgICAgICBzdHJ1Y3QgeGVuX2FkZF90b19waHlzbWFw
IHhhdHA7Cj4gPj4gKyAgICAgICAgc3RydWN0IGRvbWFpbiAqZDsKPiA+PiArICAgICAgICBpbnQg
aTsKPiA+PiArCj4gPj4gKyAgICAgICAgZm9yICggaSA9IDA7IGkgPCBtYXhfZ3JhbnRfZnJhbWVz
OyBpKysgKQo+ID4+ICsgICAgICAgIHsKPiA+PiArICAgICAgICAgICAgIGdyYW50X3RhYmxlID0g
YWxsb2NfeGVuaGVhcF9wYWdlKCk7Cj4gPgo+ID4gVGhpcyBpcyB3YXN0aW5nIG9uZSBtZW1vcnkg
cGFnZSwgZ3JhbnQgdGFibGUgZnJhbWVzIGRvbid0IG5lZWQgdG8gYmUKPiA+IHBvcHVsYXRlZC4K
PiAKPiBXZWxsIHRoZXkgaGF2ZSB0byBoYXZlIGEgdmFsaWQgc3RydWN0IHBhZ2VfaW5mbyBpbiBv
cmRlciBmb3IgdGhlIGd1ZXN0Cj4gdG8gbWFwIGl0IHdpdGhpbiBpdHMgYWRkcmVzcyBzcGFjZS4K
PiAKPiBPciBkaWQgeW91IGhhdmUgc29tZXRoaW5nIGVsc2UgaW4gbWluZD8KCllvdSBjYW4gbWFw
IGl0IGluIHNvbWUgdW5wb3B1bGF0ZWQgbWVtb3J5IHJlZ2lvbiBhbmQgdGhlbiBhZGQgaXQgdG8K
dGhlIGxpc3Qgb2YgaW9tZW0gcmVnaW9ucyBmb3IgdGhlIGd1ZXN0IChpb21lbV9wZXJtaXRfYWNj
ZXNzKS4gR3JhbnQKdGFibGUgZnJhbWVzIEFGQUlDVCBkb24ndCByZXF1aXJlIGEgc3RydWN0IHBh
Z2UuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
