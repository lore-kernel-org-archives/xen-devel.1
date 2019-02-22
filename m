From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: Reducing or removing direct map from xen (was Re:
 Ongoing/future speculative mitigation work)
Date: Fri, 22 Feb 2019 12:11:45 +0000
Message-ID: <20190222121145.xkvchgp7yjckokri@zion.uk.xensource.com>
References: <e3219697-0759-39fc-2486-715cdec1ca9e@citrix.com>
 <20190124114455.eyke5dvkqsxhklav@zion.uk.xensource.com>
 <20190220122901.6kvc7ibyjo4uyzke@zion.uk.xensource.com>
 <20190220130052.b22syaca6cswc3pk@Air-de-Roger>
 <20190220130956.tkhsmdojzdf4nc7x@zion.uk.xensource.com>
 <20190220170809.jr6neinf5beescf4@zion.uk.xensource.com>
 <5C6FE1790200007800219178@prv1-mh.provo.novell.com>
 <20190222115033.2jhkceg6fv4bcmkm@zion.uk.xensource.com>
 <5C6FE5AB02000078002191B0@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kvzH=Q5=citrix.com=prvs=949a6040d=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gx9gJ-0008KV-MY
 for xen-devel@lists.xenproject.org; Fri, 22 Feb 2019 12:11:55 +0000
Content-Disposition: inline
In-Reply-To: <5C6FE5AB02000078002191B0@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Martin Pohlack <mpohlack@amazon.de>, Julien Grall <julien.grall@arm.com>, Joao Martins <joao.m.martins@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Mihai Dontu <mdontu@bitdefender.com>, Marek Marczykowski <marmarek@invisiblethingslab.com>, Anthony Liguori <aliguori@amazon.com>, xen-devel <xen-devel@lists.xenproject.org>, uwed@amazon.de, Lars Kurth <lars.kurth@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ross Philipson <ross.philipson@oracle.com>, Dario Faggioli <dfaggioli@suse.com>, Matt Wilson <msw@amazon.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Daniel Kiper <daniel.kiper@oracle.com>, David Woodhouse <dwmw@amazon.co.uk>, Roger
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBGZWIgMjIsIDIwMTkgYXQgMDU6MDY6MDNBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDIyLjAyLjE5IGF0IDEyOjUwLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBPbiBGcmksIEZlYiAyMiwgMjAxOSBhdCAwNDo0ODowOUFNIC0wNzAwLCBKYW4gQmV1
bGljaCB3cm90ZToKPiA+PiA+Pj4gT24gMjAuMDIuMTkgYXQgMTg6MDgsIDx3ZWkubGl1MkBjaXRy
aXguY29tPiB3cm90ZToKPiA+PiA+IE9uIFdlZCwgRmViIDIwLCAyMDE5IGF0IDAxOjA5OjU2UE0g
KzAwMDAsIFdlaSBMaXUgd3JvdGU6Cj4gPj4gPiBbLi4uXQo+ID4+ID4+IEkgdGhpbmsgdW5kZXIt
YWxsb2NhdGUtdGhlbi1tYXAgbG9va3MgcGxhdXNpYmxlLiB4bWFsbG9jIHdpbGwgbmVlZAo+ID4+
ID4+IHRvIGFsbG9jYXRlIHBhZ2VzLCBwdXQgdGhlbSBpbnRvIGFuIGFycmF5IGFuZCBjYWxsIF9f
dm1hcCBvbiB0aGF0IGFycmF5Cj4gPj4gPj4gZGlyZWN0bHkuCj4gPj4gPiAKPiA+PiA+IFRoZSBi
aWdnZXN0IGlzc3VlIHdpdGggdGhpcyBhcHByb2FjaCBpcyB0aGF0IHdlIG5vdyBuZWVkIGFuIGFy
cmF5IG9mCj4gPj4gPiAxVUw8PE1BWF9PUkRFUiB0byBhY2NvbW1vZGF0ZSBtZm5zLiBCYWNrIG9m
IGVudmVsb3BlIGNhbGN1bGF0aW9uOiBvbiB4ODYKPiA+PiA+IHRoaXMgaXMgZ29pbmcgdG8gYmUg
KDFVTDw8MjApKjggYnl0ZXMgbG9uZy4gVGhpcyBpcyBub3QgZmVhc2libGUuCj4gPj4gCj4gPj4g
QXJlIHdlIHJlYWxseSBjYWxsaW5nIHhtYWxsb2MoKSB3aXRoIGFueSBudW1iZXIgbmVhcmx5IHRo
aXMgYmlnPwo+ID4gCj4gPiBJbiBwcmFjdGljZSwgSSBkb24ndCB0aGluayBzby4gV2hhdCBkbyB5
b3UgdGhpbmsgaXMgYSBzZW5zaWJsZSBsaW1pdD8KPiAKPiBJJ20gYWZyYWlkIHlvdSB3b24ndCBs
aWtlIHRoZSBhbnN3ZXI6IFdoYXRldmVyIHRoZSBiaWdnZXN0IGNodW5rIGlzCj4gd2UgY3VycmVu
dGx5IGFsbG9jYXRlIGFueXdoZXJlLiBQZXJoYXBzLCBlLmcuIGlmIHRoZXJlJ3MgYSBzaW5nbGUg
YmlnCj4gInZpb2xhdG9yIiwgY2hhbmdpbmcgc29tZSBjb2RlIHRvIHJlZHVjZSB0aGUgdXBwZXIg
Ym91bmQgbWlnaHQgYmUKPiBkZXNpcmFibGUuCj4gCj4gSW4gZ2VuZXJhbCB0aGVyZSBzaG91bGRu
J3QgYmUgYW55IGdvaW5nIGJleW9uZCBvbmUgcGFnZSBvbmNlIHdlJ3ZlCj4gY29tcGxldGVkIGJv
b3RpbmcuIFNldmVyYWwgeWVhcnMgYmFjayBJIHRoaW5rIEkgaGFkIG1hbmFnZWQgdG8KPiByZXBs
YWNlIG1vc3QgKGFsbD8pIGhpZ2hlciBvcmRlciB4bWFsbG9jKCktcy4gU28gYW5vdGhlciBvcHRp
b24gbWlnaHQKPiBiZSB0byBhbGxvdyB1cCB0byBNQVhfT1JERVIgYnkgd2F5IG9mIHNvbWUgaW5p
dC1vbmx5IG1lY2hhbmlzbSwKPiBhbmQgbGF0ZXIgYWxsb3cgb25seSB1cCB0byBzaW5nbGUgcGFn
ZSBjaHVua3MuCj4gCgpUaGluayBhYm91dCBpdCwgaWYgeW91IGhhdmUgZG9uZSB0aGUgd29yayB0
byByZW1vdmUgaGlnaCBvcmRlcgphbGxvY2F0aW9ucywgcmVtb3ZpbmcgdGhpcyBvcHRpbWlzYXRp
b24gaXMgdGhlIGVhc2llc3QgdGhpbmcgdG8gZG8gYW5kCndvdWxkbid0IG1ha2UgdGhpbmdzIHdv
cnNlLCBpc24ndCBpdD8KCldlaS4KCj4gSmFuCj4gCj4gCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
