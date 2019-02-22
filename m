From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: Reducing or removing direct map from xen (was Re:
 Ongoing/future speculative mitigation work)
Date: Fri, 22 Feb 2019 11:50:33 +0000
Message-ID: <20190222115033.2jhkceg6fv4bcmkm@zion.uk.xensource.com>
References: <e3219697-0759-39fc-2486-715cdec1ca9e@citrix.com>
 <20190124114455.eyke5dvkqsxhklav@zion.uk.xensource.com>
 <20190220122901.6kvc7ibyjo4uyzke@zion.uk.xensource.com>
 <20190220130052.b22syaca6cswc3pk@Air-de-Roger>
 <20190220130956.tkhsmdojzdf4nc7x@zion.uk.xensource.com>
 <20190220170809.jr6neinf5beescf4@zion.uk.xensource.com>
 <5C6FE1790200007800219178@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kvzH=Q5=citrix.com=prvs=949a6040d=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gx9Ml-0005h7-14
 for xen-devel@lists.xenproject.org; Fri, 22 Feb 2019 11:51:43 +0000
Content-Disposition: inline
In-Reply-To: <5C6FE1790200007800219178@prv1-mh.provo.novell.com>
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

T24gRnJpLCBGZWIgMjIsIDIwMTkgYXQgMDQ6NDg6MDlBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDIwLjAyLjE5IGF0IDE4OjA4LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBPbiBXZWQsIEZlYiAyMCwgMjAxOSBhdCAwMTowOTo1NlBNICswMDAwLCBXZWkgTGl1
IHdyb3RlOgo+ID4gWy4uLl0KPiA+PiBJIHRoaW5rIHVuZGVyLWFsbG9jYXRlLXRoZW4tbWFwIGxv
b2tzIHBsYXVzaWJsZS4geG1hbGxvYyB3aWxsIG5lZWQKPiA+PiB0byBhbGxvY2F0ZSBwYWdlcywg
cHV0IHRoZW0gaW50byBhbiBhcnJheSBhbmQgY2FsbCBfX3ZtYXAgb24gdGhhdCBhcnJheQo+ID4+
IGRpcmVjdGx5Lgo+ID4gCj4gPiBUaGUgYmlnZ2VzdCBpc3N1ZSB3aXRoIHRoaXMgYXBwcm9hY2gg
aXMgdGhhdCB3ZSBub3cgbmVlZCBhbiBhcnJheSBvZgo+ID4gMVVMPDxNQVhfT1JERVIgdG8gYWNj
b21tb2RhdGUgbWZucy4gQmFjayBvZiBlbnZlbG9wZSBjYWxjdWxhdGlvbjogb24geDg2Cj4gPiB0
aGlzIGlzIGdvaW5nIHRvIGJlICgxVUw8PDIwKSo4IGJ5dGVzIGxvbmcuIFRoaXMgaXMgbm90IGZl
YXNpYmxlLgo+IAo+IEFyZSB3ZSByZWFsbHkgY2FsbGluZyB4bWFsbG9jKCkgd2l0aCBhbnkgbnVt
YmVyIG5lYXJseSB0aGlzIGJpZz8KCkluIHByYWN0aWNlLCBJIGRvbid0IHRoaW5rIHNvLiBXaGF0
IGRvIHlvdSB0aGluayBpcyBhIHNlbnNpYmxlIGxpbWl0PwoKV2VpLgoKPiAKPiBKYW4KPiAKPiAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
