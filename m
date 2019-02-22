From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: Reducing or removing direct map from xen (was Re:
 Ongoing/future speculative mitigation work)
Date: Fri, 22 Feb 2019 05:47:13 -0700
Message-ID: <5C6FEF51020000780021923E@prv1-mh.provo.novell.com>
References: <e3219697-0759-39fc-2486-715cdec1ca9e@citrix.com>
 <20190124114455.eyke5dvkqsxhklav@zion.uk.xensource.com>
 <20190220122901.6kvc7ibyjo4uyzke@zion.uk.xensource.com>
 <20190220130052.b22syaca6cswc3pk@Air-de-Roger>
 <20190220130956.tkhsmdojzdf4nc7x@zion.uk.xensource.com>
 <20190220170809.jr6neinf5beescf4@zion.uk.xensource.com>
 <5C6FE1790200007800219178@prv1-mh.provo.novell.com>
 <20190222115033.2jhkceg6fv4bcmkm@zion.uk.xensource.com>
 <5C6FE5AB02000078002191B0@prv1-mh.provo.novell.com>
 <20190222121145.xkvchgp7yjckokri@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jjk+=Q5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gxAEY-0003GK-Ht
 for xen-devel@lists.xenproject.org; Fri, 22 Feb 2019 12:47:18 +0000
In-Reply-To: <20190222121145.xkvchgp7yjckokri@zion.uk.xensource.com>
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

Pj4+IE9uIDIyLjAyLjE5IGF0IDEzOjExLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gRnJpLCBGZWIgMjIsIDIwMTkgYXQgMDU6MDY6MDNBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+ID4+PiBPbiAyMi4wMi4xOSBhdCAxMjo1MCwgPHdlaS5saXUyQGNpdHJpeC5jb20+IHdy
b3RlOgo+PiA+IE9uIEZyaSwgRmViIDIyLCAyMDE5IGF0IDA0OjQ4OjA5QU0gLTA3MDAsIEphbiBC
ZXVsaWNoIHdyb3RlOgo+PiA+PiA+Pj4gT24gMjAuMDIuMTkgYXQgMTg6MDgsIDx3ZWkubGl1MkBj
aXRyaXguY29tPiB3cm90ZToKPj4gPj4gPiBPbiBXZWQsIEZlYiAyMCwgMjAxOSBhdCAwMTowOTo1
NlBNICswMDAwLCBXZWkgTGl1IHdyb3RlOgo+PiA+PiA+IFsuLi5dCj4+ID4+ID4+IEkgdGhpbmsg
dW5kZXItYWxsb2NhdGUtdGhlbi1tYXAgbG9va3MgcGxhdXNpYmxlLiB4bWFsbG9jIHdpbGwgbmVl
ZAo+PiA+PiA+PiB0byBhbGxvY2F0ZSBwYWdlcywgcHV0IHRoZW0gaW50byBhbiBhcnJheSBhbmQg
Y2FsbCBfX3ZtYXAgb24gdGhhdCBhcnJheQo+PiA+PiA+PiBkaXJlY3RseS4KPj4gPj4gPiAKPj4g
Pj4gPiBUaGUgYmlnZ2VzdCBpc3N1ZSB3aXRoIHRoaXMgYXBwcm9hY2ggaXMgdGhhdCB3ZSBub3cg
bmVlZCBhbiBhcnJheSBvZgo+PiA+PiA+IDFVTDw8TUFYX09SREVSIHRvIGFjY29tbW9kYXRlIG1m
bnMuIEJhY2sgb2YgZW52ZWxvcGUgY2FsY3VsYXRpb246IG9uIHg4Ngo+PiA+PiA+IHRoaXMgaXMg
Z29pbmcgdG8gYmUgKDFVTDw8MjApKjggYnl0ZXMgbG9uZy4gVGhpcyBpcyBub3QgZmVhc2libGUu
Cj4+ID4+IAo+PiA+PiBBcmUgd2UgcmVhbGx5IGNhbGxpbmcgeG1hbGxvYygpIHdpdGggYW55IG51
bWJlciBuZWFybHkgdGhpcyBiaWc/Cj4+ID4gCj4+ID4gSW4gcHJhY3RpY2UsIEkgZG9uJ3QgdGhp
bmsgc28uIFdoYXQgZG8geW91IHRoaW5rIGlzIGEgc2Vuc2libGUgbGltaXQ/Cj4+IAo+PiBJJ20g
YWZyYWlkIHlvdSB3b24ndCBsaWtlIHRoZSBhbnN3ZXI6IFdoYXRldmVyIHRoZSBiaWdnZXN0IGNo
dW5rIGlzCj4+IHdlIGN1cnJlbnRseSBhbGxvY2F0ZSBhbnl3aGVyZS4gUGVyaGFwcywgZS5nLiBp
ZiB0aGVyZSdzIGEgc2luZ2xlIGJpZwo+PiAidmlvbGF0b3IiLCBjaGFuZ2luZyBzb21lIGNvZGUg
dG8gcmVkdWNlIHRoZSB1cHBlciBib3VuZCBtaWdodCBiZQo+PiBkZXNpcmFibGUuCj4+IAo+PiBJ
biBnZW5lcmFsIHRoZXJlIHNob3VsZG4ndCBiZSBhbnkgZ29pbmcgYmV5b25kIG9uZSBwYWdlIG9u
Y2Ugd2UndmUKPj4gY29tcGxldGVkIGJvb3RpbmcuIFNldmVyYWwgeWVhcnMgYmFjayBJIHRoaW5r
IEkgaGFkIG1hbmFnZWQgdG8KPj4gcmVwbGFjZSBtb3N0IChhbGw/KSBoaWdoZXIgb3JkZXIgeG1h
bGxvYygpLXMuIFNvIGFub3RoZXIgb3B0aW9uIG1pZ2h0Cj4+IGJlIHRvIGFsbG93IHVwIHRvIE1B
WF9PUkRFUiBieSB3YXkgb2Ygc29tZSBpbml0LW9ubHkgbWVjaGFuaXNtLAo+PiBhbmQgbGF0ZXIg
YWxsb3cgb25seSB1cCB0byBzaW5nbGUgcGFnZSBjaHVua3MuCj4+IAo+IAo+IFRoaW5rIGFib3V0
IGl0LCBpZiB5b3UgaGF2ZSBkb25lIHRoZSB3b3JrIHRvIHJlbW92ZSBoaWdoIG9yZGVyCj4gYWxs
b2NhdGlvbnMsIHJlbW92aW5nIHRoaXMgb3B0aW1pc2F0aW9uIGlzIHRoZSBlYXNpZXN0IHRoaW5n
IHRvIGRvIGFuZAo+IHdvdWxkbid0IG1ha2UgdGhpbmdzIHdvcnNlLCBpc24ndCBpdD8KCk5vdCBz
dXJlIEkgdW5kZXJzdGFuZCB3aGF0IGV4YWN0bHkgeW91IHdhbnQgdG8gcmVtb3ZlLiBBbGxvY2F0
aW5nCjMyIHBhZ2VzIHdoZW4geW91IG5lZWQgMTcgaXMgd2FzdGVmdWwsIGFuZCBoZW5jZSBJJ2Qg
cHJlZmVyIGlmIHdlCmNvdWxkIGNvbnRpbnVlIHRvIG1ha2UgYWN0dWFsIHVzZSBvZiB0aGUgcmVt
YWluaW5nIDE1LiBUaGF0J3MKaW5kZXBlbmRlbnQgb2Ygd2hldGhlciB0aGUgYWxsb2NhdGlvbiBv
Y2N1cnMgYXQgYm9vdCBvciBydW4gdGltZS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
