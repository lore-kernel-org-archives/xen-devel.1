From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: Ongoing/future speculative mitigation work
Date: Thu, 25 Oct 2018 09:02:04 -0600
Message-ID: <5BD1DAEC02000078001F4BAE@prv1-mh.provo.novell.com>
References: <e3219697-0759-39fc-2486-715cdec1ca9e@citrix.com>
 <20181022145534.afuxnfzyovdi3hya@zion.uk.xensource.com>
 <5BD1D82402000078001F4B60@prv1-mh.provo.novell.com>
 <187f3a6a-e83e-3dc2-0cb7-69fecdacacf1@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <187f3a6a-e83e-3dc2-0cb7-69fecdacacf1@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: george.dunlap@citrix.com
Cc: Martin Pohlack <mpohlack@amazon.de>, Julien Grall <julien.grall@arm.com>, Joao Martins <joao.m.martins@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Mihai Dontu <mdontu@bitdefender.com>, Marek Marczykowski <marmarek@invisiblethingslab.com>, Anthony Liguori <aliguori@amazon.com>, uwed@amazon.de, Lars Kurth <lars.kurth@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ross Philipson <ross.philipson@oracle.com>, Dario Faggioli <dfaggioli@suse.com>, Matt Wilson <msw@amazon.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel List <xen-devel@lists.xen.org>, Daniel Kiper <daniel.kiper@oracle.com>, David Woodhouse <dwmw@amazon.co.uk>Roger Pau Monne <r>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI1LjEwLjE4IGF0IDE2OjU2LCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKPiBPbiAxMC8yNS8yMDE4IDAzOjUwIFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24g
MjIuMTAuMTggYXQgMTY6NTUsIDx3ZWkubGl1MkBjaXRyaXguY29tPiB3cm90ZToKPj4+IE9uIFRo
dSwgT2N0IDE4LCAyMDE4IGF0IDA2OjQ2OjIyUE0gKzAxMDAsIEFuZHJldyBDb29wZXIgd3JvdGU6
Cj4+Pj4gQW4gZWFzeSBmaXJzdCBzdGVwIGhlcmUgaXMgdG8gcmVtb3ZlIFhlbidzIGRpcmVjdG1h
cCwgd2hpY2ggd2lsbCBtZWFuCj4+Pj4gdGhhdCBndWVzdHMgZ2VuZXJhbCBSQU0gaXNuJ3QgbWFw
cGVkIGJ5IGRlZmF1bHQgaW50byBYZW4ncyBhZGRyZXNzCj4+Pj4gc3BhY2UuICBUaGlzIHdpbGwg
Y29tZSB3aXRoIHNvbWUgcGVyZm9ybWFuY2UgaGl0LCBhcyB0aGUKPj4+PiBtYXBfZG9tYWluX3Bh
Z2UoKSBpbmZyYXN0cnVjdHVyZSB3aWxsIG5vdyBoYXZlIHRvIGFjdHVhbGx5Cj4+Pj4gY3JlYXRl
L2Rlc3Ryb3kgbWFwcGluZ3MsIGJ1dCByZW1vdmluZyB0aGUgZGlyZWN0bWFwIHdpbGwgY2F1c2Ug
YW4KPj4+PiBpbXByb3ZlbWVudCBmb3Igbm9uLXNwZWN1bGF0aXZlIHNlY3VyaXR5IGFzIHdlbGwg
KE5vIHBvc3NpYmlsaXR5IG9mCj4+Pj4gcmV0MmRpciBhcyBhbiBleHBsb2l0IHRlY2huaXF1ZSku
Cj4+Pgo+Pj4gSSBoYXZlIGxvb2tlZCBpbnRvIG1ha2luZyB0aGUgInNlcGFyYXRlIHhlbmhlYXAg
ZG9taGVhcCB3aXRoIHBhcnRpYWwKPj4+IGRpcmVjdCBtYXAiIG1vZGUgKHNlZSBjb21tb24vcGFn
ZV9hbGxvYy5jKSB3b3JrIGJ1dCBmb3VuZCBpdCBub3QgYXMKPj4+IHN0cmFpZ2h0IGZvcndhcmQg
YXMgaXQgc2hvdWxkJ3ZlIGJlZW4uCj4+Pgo+Pj4gQmVmb3JlIEkgc3BlbmQgbW9yZSB0aW1lIG9u
IHRoaXMsIEkgd291bGQgbGlrZSBzb21lIG9waW5pb25zIG9uIGlmIHRoZXJlCj4+PiBpcyBvdGhl
ciBhcHByb2FjaCB3aGljaCBtaWdodCBiZSBtb3JlIHVzZWZ1bCB0aGFuIHRoYXQgbW9kZS4KPj4g
Cj4+IEhvdyB3b3VsZCBzdWNoIGEgc3BsaXQgaGVhcCBtb2RlbCBoZWxwIHdpdGggTDFURiwgd2hl
cmUgdGhlCj4+IGd1ZXN0IHNwZWNpZmllcyBob3N0IHBoeXNpY2FsIGFkZHJlc3NlcyBpbiBpdHMg
dnVsbmVyYWJsZSBwYWdlCj4+IHRhYmxlIGVudHJpZXMKPiAKPiBJIGRvbid0IHRoaW5rIGl0IHdv
dWxkLgo+IAo+PiAoYW5kIGhlbmNlIGNvdWxkIHNweSBhdCB4ZW5oZWFwIGJ1dCAtIGR1ZSB0byBu
b3QKPj4gYmVpbmcgbWFwcGVkIC0gbm90IGRvbWhlYXApPwo+IAo+IEVyLCBkaWRuJ3QgZm9sbG93
IHRoaXMgYml0IC0tIGlmIEwxVEYgaXMgcmVsYXRlZCB0byBob3N0IHBoeXNpY2FsCj4gYWRkcmVz
c2VzLCBob3cgZG9lcyBoYXZpbmcgYSB2aXJ0dWFsIG1hcHBpbmcgaW4gWGVuIGFmZmVjdCB0aGlu
Z3MgaW4gYW55Cj4gd2F5PwoKSG1tLCBpbmRlZWQuIFNjcmF0Y2ggdGhhdCBwYXJ0LgoKSmFuCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
