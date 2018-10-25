From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: Ongoing/future speculative mitigation work
Date: Thu, 25 Oct 2018 15:56:50 +0100
Message-ID: <187f3a6a-e83e-3dc2-0cb7-69fecdacacf1@citrix.com>
References: <e3219697-0759-39fc-2486-715cdec1ca9e@citrix.com>
 <20181022145534.afuxnfzyovdi3hya@zion.uk.xensource.com>
 <5BD1D82402000078001F4B60@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5BD1D82402000078001F4B60@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Wei Liu <wei.liu2@citrix.com>
Cc: Martin Pohlack <mpohlack@amazon.de>, Julien Grall <julien.grall@arm.com>, Joao Martins <joao.m.martins@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Mihai Dontu <mdontu@bitdefender.com>, Marek Marczykowski <marmarek@invisiblethingslab.com>, Anthony Liguori <aliguori@amazon.com>, uwed@amazon.de, Lars Kurth <lars.kurth@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ross Philipson <ross.philipson@oracle.com>, Dario Faggioli <dfaggioli@suse.com>, Matt Wilson <msw@amazon.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel List <xen-devel@lists.xen.org>, Daniel Kiper <daniel.kiper@oracle.com>, David Woodhouse <dwmw@amazon.co.uk>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMjUvMjAxOCAwMzo1MCBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjIuMTAu
MTggYXQgMTY6NTUsIDx3ZWkubGl1MkBjaXRyaXguY29tPiB3cm90ZToKPj4gT24gVGh1LCBPY3Qg
MTgsIDIwMTggYXQgMDY6NDY6MjJQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4+IEFu
IGVhc3kgZmlyc3Qgc3RlcCBoZXJlIGlzIHRvIHJlbW92ZSBYZW4ncyBkaXJlY3RtYXAsIHdoaWNo
IHdpbGwgbWVhbgo+Pj4gdGhhdCBndWVzdHMgZ2VuZXJhbCBSQU0gaXNuJ3QgbWFwcGVkIGJ5IGRl
ZmF1bHQgaW50byBYZW4ncyBhZGRyZXNzCj4+PiBzcGFjZS4gIFRoaXMgd2lsbCBjb21lIHdpdGgg
c29tZSBwZXJmb3JtYW5jZSBoaXQsIGFzIHRoZQo+Pj4gbWFwX2RvbWFpbl9wYWdlKCkgaW5mcmFz
dHJ1Y3R1cmUgd2lsbCBub3cgaGF2ZSB0byBhY3R1YWxseQo+Pj4gY3JlYXRlL2Rlc3Ryb3kgbWFw
cGluZ3MsIGJ1dCByZW1vdmluZyB0aGUgZGlyZWN0bWFwIHdpbGwgY2F1c2UgYW4KPj4+IGltcHJv
dmVtZW50IGZvciBub24tc3BlY3VsYXRpdmUgc2VjdXJpdHkgYXMgd2VsbCAoTm8gcG9zc2liaWxp
dHkgb2YKPj4+IHJldDJkaXIgYXMgYW4gZXhwbG9pdCB0ZWNobmlxdWUpLgo+Pgo+PiBJIGhhdmUg
bG9va2VkIGludG8gbWFraW5nIHRoZSAic2VwYXJhdGUgeGVuaGVhcCBkb21oZWFwIHdpdGggcGFy
dGlhbAo+PiBkaXJlY3QgbWFwIiBtb2RlIChzZWUgY29tbW9uL3BhZ2VfYWxsb2MuYykgd29yayBi
dXQgZm91bmQgaXQgbm90IGFzCj4+IHN0cmFpZ2h0IGZvcndhcmQgYXMgaXQgc2hvdWxkJ3ZlIGJl
ZW4uCj4+Cj4+IEJlZm9yZSBJIHNwZW5kIG1vcmUgdGltZSBvbiB0aGlzLCBJIHdvdWxkIGxpa2Ug
c29tZSBvcGluaW9ucyBvbiBpZiB0aGVyZQo+PiBpcyBvdGhlciBhcHByb2FjaCB3aGljaCBtaWdo
dCBiZSBtb3JlIHVzZWZ1bCB0aGFuIHRoYXQgbW9kZS4KPiAKPiBIb3cgd291bGQgc3VjaCBhIHNw
bGl0IGhlYXAgbW9kZWwgaGVscCB3aXRoIEwxVEYsIHdoZXJlIHRoZQo+IGd1ZXN0IHNwZWNpZmll
cyBob3N0IHBoeXNpY2FsIGFkZHJlc3NlcyBpbiBpdHMgdnVsbmVyYWJsZSBwYWdlCj4gdGFibGUg
ZW50cmllcwoKSSBkb24ndCB0aGluayBpdCB3b3VsZC4KCj4gKGFuZCBoZW5jZSBjb3VsZCBzcHkg
YXQgeGVuaGVhcCBidXQgLSBkdWUgdG8gbm90Cj4gYmVpbmcgbWFwcGVkIC0gbm90IGRvbWhlYXAp
PwoKRXIsIGRpZG4ndCBmb2xsb3cgdGhpcyBiaXQgLS0gaWYgTDFURiBpcyByZWxhdGVkIHRvIGhv
c3QgcGh5c2ljYWwKYWRkcmVzc2VzLCBob3cgZG9lcyBoYXZpbmcgYSB2aXJ0dWFsIG1hcHBpbmcg
aW4gWGVuIGFmZmVjdCB0aGluZ3MgaW4gYW55CndheT8KCiAtR2VvcmdlCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
