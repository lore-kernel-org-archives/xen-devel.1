From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: Ongoing/future speculative mitigation work
Date: Thu, 25 Oct 2018 08:50:12 -0600
Message-ID: <5BD1D82402000078001F4B60@prv1-mh.provo.novell.com>
References: <e3219697-0759-39fc-2486-715cdec1ca9e@citrix.com>
 <20181022145534.afuxnfzyovdi3hya@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20181022145534.afuxnfzyovdi3hya@zion.uk.xensource.com>
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
Cc: Martin Pohlack <mpohlack@amazon.de>, Julien Grall <julien.grall@arm.com>, Joao Martins <joao.m.martins@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Mihai Dontu <mdontu@bitdefender.com>, Marek Marczykowski <marmarek@invisiblethingslab.com>, Anthony Liguori <aliguori@amazon.com>, uwed@amazon.de, Lars Kurth <lars.kurth@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ross Philipson <ross.philipson@oracle.com>, Dario Faggioli <dfaggioli@suse.com>, Matt Wilson <msw@amazon.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel List <xen-devel@lists.xen.org>, Daniel Kiper <daniel.kiper@oracle.com>, David Woodhouse <dwmw@amazon.co.uk>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIyLjEwLjE4IGF0IDE2OjU1LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gVGh1LCBPY3QgMTgsIDIwMTggYXQgMDY6NDY6MjJQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPj4gQW4gZWFzeSBmaXJzdCBzdGVwIGhlcmUgaXMgdG8gcmVtb3ZlIFhlbidzIGRpcmVj
dG1hcCwgd2hpY2ggd2lsbCBtZWFuCj4+IHRoYXQgZ3Vlc3RzIGdlbmVyYWwgUkFNIGlzbid0IG1h
cHBlZCBieSBkZWZhdWx0IGludG8gWGVuJ3MgYWRkcmVzcwo+PiBzcGFjZS4gIFRoaXMgd2lsbCBj
b21lIHdpdGggc29tZSBwZXJmb3JtYW5jZSBoaXQsIGFzIHRoZQo+PiBtYXBfZG9tYWluX3BhZ2Uo
KSBpbmZyYXN0cnVjdHVyZSB3aWxsIG5vdyBoYXZlIHRvIGFjdHVhbGx5Cj4+IGNyZWF0ZS9kZXN0
cm95IG1hcHBpbmdzLCBidXQgcmVtb3ZpbmcgdGhlIGRpcmVjdG1hcCB3aWxsIGNhdXNlIGFuCj4+
IGltcHJvdmVtZW50IGZvciBub24tc3BlY3VsYXRpdmUgc2VjdXJpdHkgYXMgd2VsbCAoTm8gcG9z
c2liaWxpdHkgb2YKPj4gcmV0MmRpciBhcyBhbiBleHBsb2l0IHRlY2huaXF1ZSkuCj4gCj4gSSBo
YXZlIGxvb2tlZCBpbnRvIG1ha2luZyB0aGUgInNlcGFyYXRlIHhlbmhlYXAgZG9taGVhcCB3aXRo
IHBhcnRpYWwKPiBkaXJlY3QgbWFwIiBtb2RlIChzZWUgY29tbW9uL3BhZ2VfYWxsb2MuYykgd29y
ayBidXQgZm91bmQgaXQgbm90IGFzCj4gc3RyYWlnaHQgZm9yd2FyZCBhcyBpdCBzaG91bGQndmUg
YmVlbi4KPiAKPiBCZWZvcmUgSSBzcGVuZCBtb3JlIHRpbWUgb24gdGhpcywgSSB3b3VsZCBsaWtl
IHNvbWUgb3BpbmlvbnMgb24gaWYgdGhlcmUKPiBpcyBvdGhlciBhcHByb2FjaCB3aGljaCBtaWdo
dCBiZSBtb3JlIHVzZWZ1bCB0aGFuIHRoYXQgbW9kZS4KCkhvdyB3b3VsZCBzdWNoIGEgc3BsaXQg
aGVhcCBtb2RlbCBoZWxwIHdpdGggTDFURiwgd2hlcmUgdGhlCmd1ZXN0IHNwZWNpZmllcyBob3N0
IHBoeXNpY2FsIGFkZHJlc3NlcyBpbiBpdHMgdnVsbmVyYWJsZSBwYWdlCnRhYmxlIGVudHJpZXMg
KGFuZCBoZW5jZSBjb3VsZCBzcHkgYXQgeGVuaGVhcCBidXQgLSBkdWUgdG8gbm90CmJlaW5nIG1h
cHBlZCAtIG5vdCBkb21oZWFwKT8KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
