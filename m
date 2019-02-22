From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: Reducing or removing direct map from xen (was Re:
 Ongoing/future speculative mitigation work)
Date: Fri, 22 Feb 2019 05:06:03 -0700
Message-ID: <5C6FE5AB02000078002191B0@prv1-mh.provo.novell.com>
References: <e3219697-0759-39fc-2486-715cdec1ca9e@citrix.com>
 <20190124114455.eyke5dvkqsxhklav@zion.uk.xensource.com>
 <20190220122901.6kvc7ibyjo4uyzke@zion.uk.xensource.com>
 <20190220130052.b22syaca6cswc3pk@Air-de-Roger>
 <20190220130956.tkhsmdojzdf4nc7x@zion.uk.xensource.com>
 <20190220170809.jr6neinf5beescf4@zion.uk.xensource.com>
 <5C6FE1790200007800219178@prv1-mh.provo.novell.com>
 <20190222115033.2jhkceg6fv4bcmkm@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jjk+=Q5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gx9cd-0007em-5y
 for xen-devel@lists.xenproject.org; Fri, 22 Feb 2019 12:08:07 +0000
In-Reply-To: <20190222115033.2jhkceg6fv4bcmkm@zion.uk.xensource.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Martin Pohlack <mpohlack@amazon.de>, Julien Grall <julien.grall@arm.com>, Joao Martins <joao.m.martins@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Mihai Dontu <mdontu@bitdefender.com>, Marek Marczykowski <marmarek@invisiblethingslab.com>, Anthony Liguori <aliguori@amazon.com>, xen-devel <xen-devel@lists.xenproject.org>, uwed@amazon.de, Lars Kurth <lars.kurth@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ross Philipson <ross.philipson@oracle.com>, Dario Faggioli <dfaggioli@suse.com>, Matt Wilson <msw@amazon.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Daniel Kiper <daniel.kiper@oracle.com>, David Woodhouse <dwmw@amazon.co.uk>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIyLjAyLjE5IGF0IDEyOjUwLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gRnJpLCBGZWIgMjIsIDIwMTkgYXQgMDQ6NDg6MDlBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+ID4+PiBPbiAyMC4wMi4xOSBhdCAxODowOCwgPHdlaS5saXUyQGNpdHJpeC5jb20+IHdy
b3RlOgo+PiA+IE9uIFdlZCwgRmViIDIwLCAyMDE5IGF0IDAxOjA5OjU2UE0gKzAwMDAsIFdlaSBM
aXUgd3JvdGU6Cj4+ID4gWy4uLl0KPj4gPj4gSSB0aGluayB1bmRlci1hbGxvY2F0ZS10aGVuLW1h
cCBsb29rcyBwbGF1c2libGUuIHhtYWxsb2Mgd2lsbCBuZWVkCj4+ID4+IHRvIGFsbG9jYXRlIHBh
Z2VzLCBwdXQgdGhlbSBpbnRvIGFuIGFycmF5IGFuZCBjYWxsIF9fdm1hcCBvbiB0aGF0IGFycmF5
Cj4+ID4+IGRpcmVjdGx5Lgo+PiA+IAo+PiA+IFRoZSBiaWdnZXN0IGlzc3VlIHdpdGggdGhpcyBh
cHByb2FjaCBpcyB0aGF0IHdlIG5vdyBuZWVkIGFuIGFycmF5IG9mCj4+ID4gMVVMPDxNQVhfT1JE
RVIgdG8gYWNjb21tb2RhdGUgbWZucy4gQmFjayBvZiBlbnZlbG9wZSBjYWxjdWxhdGlvbjogb24g
eDg2Cj4+ID4gdGhpcyBpcyBnb2luZyB0byBiZSAoMVVMPDwyMCkqOCBieXRlcyBsb25nLiBUaGlz
IGlzIG5vdCBmZWFzaWJsZS4KPj4gCj4+IEFyZSB3ZSByZWFsbHkgY2FsbGluZyB4bWFsbG9jKCkg
d2l0aCBhbnkgbnVtYmVyIG5lYXJseSB0aGlzIGJpZz8KPiAKPiBJbiBwcmFjdGljZSwgSSBkb24n
dCB0aGluayBzby4gV2hhdCBkbyB5b3UgdGhpbmsgaXMgYSBzZW5zaWJsZSBsaW1pdD8KCkknbSBh
ZnJhaWQgeW91IHdvbid0IGxpa2UgdGhlIGFuc3dlcjogV2hhdGV2ZXIgdGhlIGJpZ2dlc3QgY2h1
bmsgaXMKd2UgY3VycmVudGx5IGFsbG9jYXRlIGFueXdoZXJlLiBQZXJoYXBzLCBlLmcuIGlmIHRo
ZXJlJ3MgYSBzaW5nbGUgYmlnCiJ2aW9sYXRvciIsIGNoYW5naW5nIHNvbWUgY29kZSB0byByZWR1
Y2UgdGhlIHVwcGVyIGJvdW5kIG1pZ2h0IGJlCmRlc2lyYWJsZS4KCkluIGdlbmVyYWwgdGhlcmUg
c2hvdWxkbid0IGJlIGFueSBnb2luZyBiZXlvbmQgb25lIHBhZ2Ugb25jZSB3ZSd2ZQpjb21wbGV0
ZWQgYm9vdGluZy4gU2V2ZXJhbCB5ZWFycyBiYWNrIEkgdGhpbmsgSSBoYWQgbWFuYWdlZCB0bwpy
ZXBsYWNlIG1vc3QgKGFsbD8pIGhpZ2hlciBvcmRlciB4bWFsbG9jKCktcy4gU28gYW5vdGhlciBv
cHRpb24gbWlnaHQKYmUgdG8gYWxsb3cgdXAgdG8gTUFYX09SREVSIGJ5IHdheSBvZiBzb21lIGlu
aXQtb25seSBtZWNoYW5pc20sCmFuZCBsYXRlciBhbGxvdyBvbmx5IHVwIHRvIHNpbmdsZSBwYWdl
IGNodW5rcy4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
