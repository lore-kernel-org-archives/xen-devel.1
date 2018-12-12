From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: Ongoing/future speculative mitigation work
Date: Wed, 12 Dec 2018 01:32:24 -0700
Message-ID: <5C10C7980200007800205563@prv1-mh.provo.novell.com>
References: <20181022145534.afuxnfzyovdi3hya@zion.uk.xensource.com>
 <5BD1D82402000078001F4B60@prv1-mh.provo.novell.com>
 <187f3a6a-e83e-3dc2-0cb7-69fecdacacf1@citrix.com>
 <5BD1DAEC02000078001F4BAE@prv1-mh.provo.novell.com>
 <e1388467-9dc8-9012-f9b8-587617a97a73@citrix.com>
 <5BD2DB5F02000078001F4F31@prv1-mh.provo.novell.com>
 <20181026092820.bernuj2cskqtwqqv@zion.uk.xensource.com>
 <5BD2E4EA02000078001F4F96@prv1-mh.provo.novell.com>
 <fa316114-f031-c17f-3af6-0b6893cba813@citrix.com>
 <5BD2F88F02000078001F5117@prv1-mh.provo.novell.com>
 <20181211180514.wr6lp23yfbov44fx@zion.uk.xensource.com>
 <FB70ABC00200007CA293CED3@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <FB70ABC00200007CA293CED3@prv1-mh.provo.novell.com>
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
Cc: Martin Pohlack <mpohlack@amazon.de>, Julien Grall <julien.grall@arm.com>, Joao Martins <joao.m.martins@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Mihai Dontu <mdontu@bitdefender.com>, Marek Marczykowski <marmarek@invisiblethingslab.com>, Anthony Liguori <aliguori@amazon.com>, uwed@amazon.de, Lars Kurth <lars.kurth@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ross Philipson <ross.philipson@oracle.com>, george.dunlap@citrix.com, Dario Faggioli <dfaggioli@suse.com>, Matt Wilson <msw@amazon.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel List <xen-devel@lists.xen.org>, Daniel Kiper <daniel.kiper@oracle.com>, David Woodhouse <dwmw@amazon.co.uk>, Roger Pau Monne <roger.>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDExLjEyLjE4IGF0IDE5OjA1LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gRnJpLCBPY3QgMjYsIDIwMTggYXQgMDU6MjA6NDdBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+ID4+PiBPbiAyNi4xMC4xOCBhdCAxMjo1MSwgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNv
bT4gd3JvdGU6Cj4+ID4gVGhlIGJhc2ljIHNvbHV0aW9uIGludm9sdmVzIGhhdmluZyBhIHhlbmhl
YXAgdmlydHVhbCBhZGRyZXNzIG1hcHBpbmcKPj4gPiBhcmVhIG5vdCB0aWVkIHRvIHRoZSBwaHlz
aWNhbCBsYXlvdXQgb2YgdGhlIG1lbW9yeS4gIGRvbWhlYXAgYW5kIHhlbmhlYXAKPj4gPiBtZW1v
cnkgd291bGQgaGF2ZSB0byBjb21lIGZyb20gdGhlIHNhbWUgcG9vbCwgYnV0IHhlbmhlYXAgd291
bGQgbmVlZCB0bwo+PiA+IGJlIG1hcHBlZCBpbnRvIHRoZSB4ZW5oZWFwIHZpcnR1YWwgbWVtb3J5
IHJlZ2lvbiBiZWZvcmUgYmVpbmcgcmV0dXJuZWQuCj4+IAo+PiBXb3VsZG4ndCB0aGlzIG1vc3Qg
ZWFzaWx5IGJlIGRvbmUgYnkgbWFraW5nIGFsbG9jX3hlbmhlYXBfcGFnZXMoKQo+PiBjYWxsIGFs
bG9jX2RvbWhlYXBfcGFnZXMoKSBhbmQgdGhlbiB2bWFwKCkgdGhlIHJlc3VsdD8gT2YgY291cnNl
Cj4+IHdlIG1heSBuZWVkIHRvIGdyb3cgdGhlIHZtYXAgYXJlYSBpbiB0aGF0IGNhc2UuCj4gCj4g
VGhlIGV4aXN0aW5nIHZtYXAgYXJlYSBpcyA2NEdCLCBidXQgdGhhdCBzaG91bGQgYmUgYmlnIGVu
b3VnaCBmb3IgWGVuPwoKSW4gdGhlIGNvbW1vbiBjYXNlIHBlcmhhcHMuIEJ1dCB3aGF0IGFib3V0
IGV4dHJlbWUgY2FzZXMsIGxpa2UKdmVyeSBtYW55IFZNcyBvbiBtdWx0aS1UYiBob3N0cz8KCj4g
SWYgdGhhdCdzIG5vdCBiaWcgZW5vdWdoLCB3ZSBuZWVkIHRvIG1vdmUgdGhhdCBhcmVhIHRvIGEg
ZGlmZmVyZW50Cj4gbG9jYXRpb24sIGJlY2F1c2UgaXQgY2FuJ3QgZXhwYW5kIHRvIGVpdGhlciBz
aWRlIG9mIHRoZSBhZGRyZXNzIHNwYWNlLgoKV2hlbiB0aGUgZGlyZWN0bWFwIGdvZXMgYXdheSwg
YW1wbGUgYWRkcmVzcyBzcGFjZSBnZXRzIGZyZWVkCnVwLgoKSmFuCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
