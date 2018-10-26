From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: Ongoing/future speculative mitigation work
Date: Fri, 26 Oct 2018 12:43:32 +0100
Message-ID: <1695588d-ef96-376e-e934-df3138ce2141@citrix.com>
References: <e3219697-0759-39fc-2486-715cdec1ca9e@citrix.com>
 <20181022145534.afuxnfzyovdi3hya@zion.uk.xensource.com>
 <5BD1D82402000078001F4B60@prv1-mh.provo.novell.com>
 <187f3a6a-e83e-3dc2-0cb7-69fecdacacf1@citrix.com>
 <5BD1DAEC02000078001F4BAE@prv1-mh.provo.novell.com>
 <e1388467-9dc8-9012-f9b8-587617a97a73@citrix.com>
 <5BD2DB5F02000078001F4F31@prv1-mh.provo.novell.com>
 <20181026092820.bernuj2cskqtwqqv@zion.uk.xensource.com>
 <5BD2E4EA02000078001F4F96@prv1-mh.provo.novell.com>
 <fa316114-f031-c17f-3af6-0b6893cba813@citrix.com>
 <5BD2F88F02000078001F5117@prv1-mh.provo.novell.com>
 <8d76e7ff-6a04-8e20-1b69-9a8c030103c4@citrix.com>
 <5BD2FB8F02000078001F5189@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5BD2FB8F02000078001F5189@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Martin Pohlack <mpohlack@amazon.de>, Julien Grall <julien.grall@arm.com>, Joao Martins <joao.m.martins@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Mihai Dontu <mdontu@bitdefender.com>, Marek Marczykowski <marmarek@invisiblethingslab.com>, Anthony Liguori <aliguori@amazon.com>, uwed@amazon.de, Lars Kurth <lars.kurth@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ross Philipson <ross.philipson@oracle.com>, Dario Faggioli <dfaggioli@suse.com>, Matt Wilson <msw@amazon.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel List <xen-devel@lists.xen.org>, Daniel Kiper <daniel.kiper@oracle.com>, David Woodhouse <dwmw@amazon.co.uk>Roger Pau Monne <r>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMjYvMjAxOCAxMjozMyBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjYuMTAu
MTggYXQgMTM6MjQsIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+IHdyb3RlOgo+PiBPbiAxMC8y
Ni8yMDE4IDEyOjIwIFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IE9uIDI2LjEwLjE4IGF0
IDEyOjUxLCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90ZToKPj4+PiBUaGUgYmFzaWMg
c29sdXRpb24gaW52b2x2ZXMgaGF2aW5nIGEgeGVuaGVhcCB2aXJ0dWFsIGFkZHJlc3MgbWFwcGlu
Zwo+Pj4+IGFyZWEgbm90IHRpZWQgdG8gdGhlIHBoeXNpY2FsIGxheW91dCBvZiB0aGUgbWVtb3J5
LiAgZG9taGVhcCBhbmQgeGVuaGVhcAo+Pj4+IG1lbW9yeSB3b3VsZCBoYXZlIHRvIGNvbWUgZnJv
bSB0aGUgc2FtZSBwb29sLCBidXQgeGVuaGVhcCB3b3VsZCBuZWVkIHRvCj4+Pj4gYmUgbWFwcGVk
IGludG8gdGhlIHhlbmhlYXAgdmlydHVhbCBtZW1vcnkgcmVnaW9uIGJlZm9yZSBiZWluZyByZXR1
cm5lZC4KPj4+Cj4+PiBXb3VsZG4ndCB0aGlzIG1vc3QgZWFzaWx5IGJlIGRvbmUgYnkgbWFraW5n
IGFsbG9jX3hlbmhlYXBfcGFnZXMoKQo+Pj4gY2FsbCBhbGxvY19kb21oZWFwX3BhZ2VzKCkgYW5k
IHRoZW4gdm1hcCgpIHRoZSByZXN1bHQ/IE9mIGNvdXJzZQo+Pj4gd2UgbWF5IG5lZWQgdG8gZ3Jv
dyB0aGUgdm1hcCBhcmVhIGluIHRoYXQgY2FzZS4KPj4KPj4gSSBjb3VsZG4ndCBhbnN3ZXIgdGhh
dCBxdWVzdGlvbiB3aXRob3V0IGEgbG90IG1vcmUgZGlnZ2luZy4gOi0pICBJJ2QKPj4gYWx3YXlz
IGFzc3VtZWQgdGhhdCB0aGUgcmVhc29uIGZvciB0aGUgb3JpZ2luYWwgcmVhc29uIGZvciBoYXZp
bmcgdGhlCj4+IHhlbmhlYXAgZGlyZWN0LW1hcHBlZCBvbiAzMi1iaXQgd2FzIHNvbWV0aGluZyB0
byBkbyB3aXRoIGVhcmx5LWJvb3QKPj4gYWxsb2NhdGlvbjsgaWYgdGhlcmUgaXMgc29tZXRoaW5n
IHRyaWNreSB0aGVyZSwgd2UnZCBuZWVkIHRvCj4+IHNwZWNpYWwtY2FzZSB0aGUgZWFybHktYm9v
dCBhbGxvY2F0aW9uIHNvbWVob3cuCj4gCj4gVGhlIHJlYXNvbiBmb3IgdGhlIHNwbGl0IG9uIDMy
LWJpdCB3YXMgc2ltcGx5IHRoZSBsYWNrIG9mIHN1ZmZpY2llbnQKPiBWQSBzcGFjZS4KClRoYXQg
dGVsbHMgbWUgd2h5IHRoZSBkb21oZWFwIHdhcyAqbm90KiBkaXJlY3QtbWFwcGVkOyBidXQgaXQg
ZG9lc24ndAp0ZWxsIG1lIHdoeSB0aGUgeGVuaGVhcCAqd2FzKi4gIFdhcyBpdCBwZXJoYXBzIGp1
c3Qgc29tZXRoaW5nIHRoYXQKZXZvbHZlZCBmcm9tIHdoYXQgd2UgaW5oZXJpdGVkIGZyb20gTGlu
dXg/CgogLUdlb3JnZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
