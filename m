From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: Reducing or removing direct map from xen (was Re:
 Ongoing/future speculative mitigation work)
Date: Fri, 22 Feb 2019 13:19:50 +0000
Message-ID: <20190222131950.hk6ghta4hkpx5vec@zion.uk.xensource.com>
References: <20190124114455.eyke5dvkqsxhklav@zion.uk.xensource.com>
 <20190220122901.6kvc7ibyjo4uyzke@zion.uk.xensource.com>
 <20190220130052.b22syaca6cswc3pk@Air-de-Roger>
 <20190220130956.tkhsmdojzdf4nc7x@zion.uk.xensource.com>
 <20190220170809.jr6neinf5beescf4@zion.uk.xensource.com>
 <5C6FE1790200007800219178@prv1-mh.provo.novell.com>
 <20190222115033.2jhkceg6fv4bcmkm@zion.uk.xensource.com>
 <5C6FE5AB02000078002191B0@prv1-mh.provo.novell.com>
 <20190222121145.xkvchgp7yjckokri@zion.uk.xensource.com>
 <5C6FEF51020000780021923E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kvzH=Q5=citrix.com=prvs=949a6040d=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gxAl5-0007Lp-Hf
 for xen-devel@lists.xenproject.org; Fri, 22 Feb 2019 13:20:55 +0000
Content-Disposition: inline
In-Reply-To: <5C6FEF51020000780021923E@prv1-mh.provo.novell.com>
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

T24gRnJpLCBGZWIgMjIsIDIwMTkgYXQgMDU6NDc6MTNBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDIyLjAyLjE5IGF0IDEzOjExLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBPbiBGcmksIEZlYiAyMiwgMjAxOSBhdCAwNTowNjowM0FNIC0wNzAwLCBKYW4gQmV1
bGljaCB3cm90ZToKPiA+PiA+Pj4gT24gMjIuMDIuMTkgYXQgMTI6NTAsIDx3ZWkubGl1MkBjaXRy
aXguY29tPiB3cm90ZToKPiA+PiA+IE9uIEZyaSwgRmViIDIyLCAyMDE5IGF0IDA0OjQ4OjA5QU0g
LTA3MDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4+ID4+ID4+PiBPbiAyMC4wMi4xOSBhdCAxODow
OCwgPHdlaS5saXUyQGNpdHJpeC5jb20+IHdyb3RlOgo+ID4+ID4+ID4gT24gV2VkLCBGZWIgMjAs
IDIwMTkgYXQgMDE6MDk6NTZQTSArMDAwMCwgV2VpIExpdSB3cm90ZToKPiA+PiA+PiA+IFsuLi5d
Cj4gPj4gPj4gPj4gSSB0aGluayB1bmRlci1hbGxvY2F0ZS10aGVuLW1hcCBsb29rcyBwbGF1c2li
bGUuIHhtYWxsb2Mgd2lsbCBuZWVkCj4gPj4gPj4gPj4gdG8gYWxsb2NhdGUgcGFnZXMsIHB1dCB0
aGVtIGludG8gYW4gYXJyYXkgYW5kIGNhbGwgX192bWFwIG9uIHRoYXQgYXJyYXkKPiA+PiA+PiA+
PiBkaXJlY3RseS4KPiA+PiA+PiA+IAo+ID4+ID4+ID4gVGhlIGJpZ2dlc3QgaXNzdWUgd2l0aCB0
aGlzIGFwcHJvYWNoIGlzIHRoYXQgd2Ugbm93IG5lZWQgYW4gYXJyYXkgb2YKPiA+PiA+PiA+IDFV
TDw8TUFYX09SREVSIHRvIGFjY29tbW9kYXRlIG1mbnMuIEJhY2sgb2YgZW52ZWxvcGUgY2FsY3Vs
YXRpb246IG9uIHg4Ngo+ID4+ID4+ID4gdGhpcyBpcyBnb2luZyB0byBiZSAoMVVMPDwyMCkqOCBi
eXRlcyBsb25nLiBUaGlzIGlzIG5vdCBmZWFzaWJsZS4KPiA+PiA+PiAKPiA+PiA+PiBBcmUgd2Ug
cmVhbGx5IGNhbGxpbmcgeG1hbGxvYygpIHdpdGggYW55IG51bWJlciBuZWFybHkgdGhpcyBiaWc/
Cj4gPj4gPiAKPiA+PiA+IEluIHByYWN0aWNlLCBJIGRvbid0IHRoaW5rIHNvLiBXaGF0IGRvIHlv
dSB0aGluayBpcyBhIHNlbnNpYmxlIGxpbWl0Pwo+ID4+IAo+ID4+IEknbSBhZnJhaWQgeW91IHdv
bid0IGxpa2UgdGhlIGFuc3dlcjogV2hhdGV2ZXIgdGhlIGJpZ2dlc3QgY2h1bmsgaXMKPiA+PiB3
ZSBjdXJyZW50bHkgYWxsb2NhdGUgYW55d2hlcmUuIFBlcmhhcHMsIGUuZy4gaWYgdGhlcmUncyBh
IHNpbmdsZSBiaWcKPiA+PiAidmlvbGF0b3IiLCBjaGFuZ2luZyBzb21lIGNvZGUgdG8gcmVkdWNl
IHRoZSB1cHBlciBib3VuZCBtaWdodCBiZQo+ID4+IGRlc2lyYWJsZS4KPiA+PiAKPiA+PiBJbiBn
ZW5lcmFsIHRoZXJlIHNob3VsZG4ndCBiZSBhbnkgZ29pbmcgYmV5b25kIG9uZSBwYWdlIG9uY2Ug
d2UndmUKPiA+PiBjb21wbGV0ZWQgYm9vdGluZy4gU2V2ZXJhbCB5ZWFycyBiYWNrIEkgdGhpbmsg
SSBoYWQgbWFuYWdlZCB0bwo+ID4+IHJlcGxhY2UgbW9zdCAoYWxsPykgaGlnaGVyIG9yZGVyIHht
YWxsb2MoKS1zLiBTbyBhbm90aGVyIG9wdGlvbiBtaWdodAo+ID4+IGJlIHRvIGFsbG93IHVwIHRv
IE1BWF9PUkRFUiBieSB3YXkgb2Ygc29tZSBpbml0LW9ubHkgbWVjaGFuaXNtLAo+ID4+IGFuZCBs
YXRlciBhbGxvdyBvbmx5IHVwIHRvIHNpbmdsZSBwYWdlIGNodW5rcy4KPiA+PiAKPiA+IAo+ID4g
VGhpbmsgYWJvdXQgaXQsIGlmIHlvdSBoYXZlIGRvbmUgdGhlIHdvcmsgdG8gcmVtb3ZlIGhpZ2gg
b3JkZXIKPiA+IGFsbG9jYXRpb25zLCByZW1vdmluZyB0aGlzIG9wdGltaXNhdGlvbiBpcyB0aGUg
ZWFzaWVzdCB0aGluZyB0byBkbyBhbmQKPiA+IHdvdWxkbid0IG1ha2UgdGhpbmdzIHdvcnNlLCBp
c24ndCBpdD8KPiAKPiBOb3Qgc3VyZSBJIHVuZGVyc3RhbmQgd2hhdCBleGFjdGx5IHlvdSB3YW50
IHRvIHJlbW92ZS4gQWxsb2NhdGluZwoKUmVtb3ZlIHRoZSBjb2RlIHRoYXQgcmV0dXJucyB0aG9z
ZSAxNyBwYWdlcy4KCj4gMzIgcGFnZXMgd2hlbiB5b3UgbmVlZCAxNyBpcyB3YXN0ZWZ1bCwgYW5k
IGhlbmNlIEknZCBwcmVmZXIgaWYgd2UKPiBjb3VsZCBjb250aW51ZSB0byBtYWtlIGFjdHVhbCB1
c2Ugb2YgdGhlIHJlbWFpbmluZyAxNS4gVGhhdCdzCj4gaW5kZXBlbmRlbnQgb2Ygd2hldGhlciB0
aGUgYWxsb2NhdGlvbiBvY2N1cnMgYXQgYm9vdCBvciBydW4gdGltZS4KPiAKClN1cmUuIEJ1dCBp
biBteSBvcGluaW9uIHRoZXJlIHdpbGwgb25seSBiZSBvbmUgc3VjaCB3YXN0YWdlIGluIHRoZSBs
aWZlCnRpbWUgb2Ygc3lzdGVtIHRoZW4gb3B0aW5nIGZvciBzaW1wbGVyIGNvZGUgaXMgYSBmYXIg
YmV0dGVyIGFwcHJvYWNoCih3aXRoIGFwcHJvcHJpYXRlIGNoZWNrcyBpbiBwbGFjZSkuIE9uIHRo
ZSBvdGhlciBoYW5kLCBpZiBub3QgcmV0dXJuaW5nCnBhZ2VzIHJlc3VsdHMgaW4gd2FzdGluZyBh
bG1vc3QgaGFsZiBvZiBlYWNoIGFsbG9jYXRpb24sIHdlIHdpbGwgbmVlZCB0bwp0aGluayBvZiBh
IGNsZXZlciB3YXkuIFlvdXIgcmVwbHkgbWFkZSBtZSB0aGluayBvZiB0aGUgZm9ybWVyLgoKSSBo
YXZlIG9ubHkgcmVhbGlzZWQgdGhpcyB0b2RheTogZXNzZW50aWFsbHkgd2Ugd2lsbCBlbmQgdXAg
aW1wbGVtZW50aW5nCnhtYWxsb2Mgd2l0aCB2bWFsbG9jLCB3aGljaCBhdCB0aGUgbW9tZW50IGRl
cGVuZHMgb24geG1hbGxvYyB0byBhbGxvY2F0ZQp0aGUgYXJyYXkgb2YgbWZucy4KCldlaS4KCj4g
SmFuCj4gCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
