From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: Reducing or removing direct map from xen (was Re:
 Ongoing/future speculative mitigation work)
Date: Thu, 21 Feb 2019 17:51:00 +0000
Message-ID: <20190221175100.tbfmagdo74vaal5f@zion.uk.xensource.com>
References: <e3219697-0759-39fc-2486-715cdec1ca9e@citrix.com>
 <20190124114455.eyke5dvkqsxhklav@zion.uk.xensource.com>
 <20190220122901.6kvc7ibyjo4uyzke@zion.uk.xensource.com>
 <20190220130052.b22syaca6cswc3pk@Air-de-Roger>
 <20190220130956.tkhsmdojzdf4nc7x@zion.uk.xensource.com>
 <20190220170809.jr6neinf5beescf4@zion.uk.xensource.com>
 <20190221095941.6ssrgwiugcr7vtb3@Air-de-Roger>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=y0vM=Q4=citrix.com=prvs=948a3d738=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gwsV3-0004ba-RR
 for xen-devel@lists.xenproject.org; Thu, 21 Feb 2019 17:51:09 +0000
Content-Disposition: inline
In-Reply-To: <20190221095941.6ssrgwiugcr7vtb3@Air-de-Roger>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Martin Pohlack <mpohlack@amazon.de>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, Joao Martins <joao.m.martins@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Daniel Kiper <daniel.kiper@oracle.com>, Marek Marczykowski <marmarek@invisiblethingslab.com>, Anthony Liguori <aliguori@amazon.com>, Xen-devel <xen-devel@lists.xenproject.org>, "Dannowski, Uwe" <uwed@amazon.de>, Lars Kurth <lars.kurth@citrix.com>, Konrad Wilk <konrad.wilk@oracle.com>, Ross Philipson <ross.philipson@oracle.com>, Dario Faggioli <dfaggioli@suse.com>, Matt Wilson <msw@amazon.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <JGross@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Mihai =?utf-8?B?RG9uyJt1?= <mdontu@bitdefender.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBGZWIgMjEsIDIwMTkgYXQgMTA6NTk6NDFBTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBXZWQsIEZlYiAyMCwgMjAxOSBhdCAwNTowODowOVBNICswMDAwLCBXZWkg
TGl1IHdyb3RlOgo+ID4gT24gV2VkLCBGZWIgMjAsIDIwMTkgYXQgMDE6MDk6NTZQTSArMDAwMCwg
V2VpIExpdSB3cm90ZToKPiA+IFsuLi5dCj4gPiA+IEkgdGhpbmsgdW5kZXItYWxsb2NhdGUtdGhl
bi1tYXAgbG9va3MgcGxhdXNpYmxlLiB4bWFsbG9jIHdpbGwgbmVlZAo+ID4gPiB0byBhbGxvY2F0
ZSBwYWdlcywgcHV0IHRoZW0gaW50byBhbiBhcnJheSBhbmQgY2FsbCBfX3ZtYXAgb24gdGhhdCBh
cnJheQo+ID4gPiBkaXJlY3RseS4KPiA+IAo+ID4gVGhlIGJpZ2dlc3QgaXNzdWUgd2l0aCB0aGlz
IGFwcHJvYWNoIGlzIHRoYXQgd2Ugbm93IG5lZWQgYW4gYXJyYXkgb2YKPiA+IDFVTDw8TUFYX09S
REVSIHRvIGFjY29tbW9kYXRlIG1mbnMuIEJhY2sgb2YgZW52ZWxvcGUgY2FsY3VsYXRpb246IG9u
IHg4Ngo+ID4gdGhpcyBpcyBnb2luZyB0byBiZSAoMVVMPDwyMCkqOCBieXRlcyBsb25nLiBUaGlz
IGlzIG5vdCBmZWFzaWJsZS4KPiAKPiBSaWdodC4gSSBndWVzcyB0aGUgb25seSByZW1haW5pbmcg
b3B0aW9uIGlzIHRvIGFsbG9jYXRlIGEgdmlydHVhbAo+IGFkZHJlc3Mgc3BhY2UgYW5kIHBvcHVs
YXRlIGl0IHVzaW5nIG11bHRpcGxlIHBhZ2VzPwoKSSBwcm9iYWJseSB3YXMgbm90IGNsZWFyIGVu
b3VnaCAtLSB0aGUgYWZvcmVtZW50aW9uZWQgYXJyYXkgd2FzIG5lZWRlZApmb3IgdGhpcyBtZXRo
b2QsIHNvIEkgZG9uJ3QgdGhpbmsgdGhpcyBpcyBmZWFzaWJsZS4KCj4gCj4gVGhhdCB3b3VsZCBs
aWtlbHkgcmVxdWlyZSB0byBzcGxpdCBzb21lIGZ1bmN0aW9ucyBpbnRvIHNtYWxsZXIgaGVscGVy
cwo+IHNvIHlvdSBjYW4gY2FsbCB0aGVtIGFuZCBwcm92aWRlIHRoZSB2aXJ0dWFsIGFkZHJlc3Mg
d2hlcmUgYSBwYWdlCj4gc2hvdWxkIGJlIG1hcHBlZD8KPiAKCk5vdCBmZWFzaWJsZSBhcyBvZiBu
b3cuIFRoZSBmdW5kYW1lbnRhbCBpc3N1ZSBpcyB0aGF0IHZtYXAgaXMgbWFuYWdlZCBieQphIGJp
dG1hcCB3aGljaCBoYXMgMToxIG1hcHBpbmcgZm9yIHBhZ2UgYW5kIGFkZHJlc3Mgc3BhY2UsIGFu
ZCBpdAptYW5kYXRlcyBhIGd1YXJkIHBhZ2UgZm9yIGVhY2ggYWxsb2NhdGlvbi4KClRvIG1ha2Ug
dGhpcyB3b3JrIHdlIG5lZWQgdG8gcmVtb3ZlIHRoZSBtYW5kYXRvcnkgZ3VhcmQgcGFnZS4gSW52
ZW50aW5nCm1vcmUgY29tcGxleCB0cmFja2luZyBzdHJ1Y3R1cmUgaXMgcHJvYmFibHkgbm90IHdv
cnRoIGl0LgoKV2VpLgoKPiBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
