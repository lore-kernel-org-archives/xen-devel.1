From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: Ongoing/future speculative mitigation work
Date: Fri, 26 Oct 2018 03:56:58 -0600
Message-ID: <5BD2E4EA02000078001F4F96@prv1-mh.provo.novell.com>
References: <e3219697-0759-39fc-2486-715cdec1ca9e@citrix.com>
 <20181022145534.afuxnfzyovdi3hya@zion.uk.xensource.com>
 <5BD1D82402000078001F4B60@prv1-mh.provo.novell.com>
 <187f3a6a-e83e-3dc2-0cb7-69fecdacacf1@citrix.com>
 <5BD1DAEC02000078001F4BAE@prv1-mh.provo.novell.com>
 <e1388467-9dc8-9012-f9b8-587617a97a73@citrix.com>
 <5BD2DB5F02000078001F4F31@prv1-mh.provo.novell.com>
 <20181026092820.bernuj2cskqtwqqv@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20181026092820.bernuj2cskqtwqqv@zion.uk.xensource.com>
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

Pj4+IE9uIDI2LjEwLjE4IGF0IDExOjI4LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gRnJpLCBPY3QgMjYsIDIwMTggYXQgMDM6MTY6MTVBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+ID4+PiBPbiAyNS4xMC4xOCBhdCAxODoyOSwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+IHdyb3RlOgo+PiA+IEEgc3BsaXQgeGVuaGVhcCBtb2RlbCBtZWFucyB0aGF0IGRhdGEgcGVy
dGFpbmluZyB0byBvdGhlciBndWVzdHMgaXNuJ3QKPj4gPiBtYXBwZWQgaW4gdGhlIGNvbnRleHQg
b2YgdGhpcyB2Y3B1LCBzbyBjYW5ub3QgYmUgYnJvdWdodCBpbnRvIHRoZSBjYWNoZS4KPj4gCj4+
IEl0IHdhcyBub3QgY2xlYXIgdG8gbWUgZnJvbSBXZWkncyBvcmlnaW5hbCBtYWlsIHRoYXQgdGFs
ayBoZXJlIGlzCj4+IGFib3V0ICJzcGxpdCIgaW4gYSBzZW5zZSBvZiAicGVyLWRvbWFpbiI7IEkg
d2FzIGFzc3VtaW5nIHRoZQo+PiBDT05GSUdfU0VQQVJBVEVfWEVOSEVBUCBtb2RlIGluc3RlYWQu
Cj4gCj4gVGhlIHNwbGl0IGhlYXAgd2FzIGluZGVlZCByZWZlcnJpbmcgdG8gQ09ORklHX1NFUEFS
QVRFX1hFTkhFQVAgbW9kZSwgeWV0Cj4gSSB3aGF0IEkgd2FudGVkIG1vc3QgaXMgdGhlIHBhcnRp
YWwgZGlyZWN0IG1hcCB3aGljaCByZWR1Y2VzIHRoZSBhbW91bnQKPiBvZiBkYXRhIG1hcHBlZCBp
bnNpZGUgWGVuIGNvbnRleHQgLS0gdGhlIG9yaWdpbmFsIGlkZWEgd2FzIHJlbW92aW5nCj4gZGly
ZWN0IG1hcCBkaXNjdXNzZWQgZHVyaW5nIG9uZSBvZiB0aGUgY2FsbHMgSUlSQy4gSSB0aG91Z2h0
IG1ha2luZyB0aGUKPiBwYXJ0aWFsIGRpcmVjdCBtYXAgbW9kZSB3b3JrIGFuZCBtYWtlIGl0IGFz
IHNtYWxsIGFzIHBvc3NpYmxlIHdpbGwgZ2V0Cj4gdXMgOTAlIHRoZXJlLgo+IAo+IFRoZSAicGVy
LWRvbWFpbiIgaGVhcCBpcyBhIGRpZmZlcmVudCB3b3JrIGl0ZW0uCgpCdXQgaWYgd2UgbWVhbiB0
byBnbyB0aGF0IHJvdXRlLCBnb2luZyAoYmFjaykgdG8gdGhlIHNlcGFyYXRlClhlbiBoZWFwIG1v
ZGVsIHNlZW1zIGp1c3QgbGlrZSBhbiBleHRyYSBjb21wbGljYXRpb24gdG8gbWUuCllldCBJIGFn
cmVlIHRoYXQgdGhpcyB3b3VsZCByZW1vdmUgdGhlIG5lZWQgZm9yIGEgZmFpciBjaHVuayBvZgp0
aGUgZGlyZWN0IG1hcC4gT3RvaCBhIHN0YXRpY2FsbHkgcGFydGl0aW9uZWQgWGVuIGhlYXAgd291
bGQKYnJpbmcgYmFjayBzY2FsYWJpbGl0eSBpc3N1ZXMgd2hpY2ggd2UgaGFkIHNwZWNpZmljYWxs
eSBtZWFudCB0bwpnZXQgcmlkIG9mIGJ5IG1vdmluZyBhd2F5IGZyb20gdGhhdCBtb2RlbC4KCkph
bgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
