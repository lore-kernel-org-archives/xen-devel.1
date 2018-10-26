From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: Ongoing/future speculative mitigation work
Date: Fri, 26 Oct 2018 05:45:49 -0600
Message-ID: <5BD2FE6D02000078001F51F1@prv1-mh.provo.novell.com>
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
 <1695588d-ef96-376e-e934-df3138ce2141@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1695588d-ef96-376e-e934-df3138ce2141@citrix.com>
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

Pj4+IE9uIDI2LjEwLjE4IGF0IDEzOjQzLCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKPiBPbiAxMC8yNi8yMDE4IDEyOjMzIFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24g
MjYuMTAuMTggYXQgMTM6MjQsIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4g
T24gMTAvMjYvMjAxOCAxMjoyMCBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+Pj4gT24gMjYu
MTAuMTggYXQgMTI6NTEsIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4+PiBU
aGUgYmFzaWMgc29sdXRpb24gaW52b2x2ZXMgaGF2aW5nIGEgeGVuaGVhcCB2aXJ0dWFsIGFkZHJl
c3MgbWFwcGluZwo+Pj4+PiBhcmVhIG5vdCB0aWVkIHRvIHRoZSBwaHlzaWNhbCBsYXlvdXQgb2Yg
dGhlIG1lbW9yeS4gIGRvbWhlYXAgYW5kIHhlbmhlYXAKPj4+Pj4gbWVtb3J5IHdvdWxkIGhhdmUg
dG8gY29tZSBmcm9tIHRoZSBzYW1lIHBvb2wsIGJ1dCB4ZW5oZWFwIHdvdWxkIG5lZWQgdG8KPj4+
Pj4gYmUgbWFwcGVkIGludG8gdGhlIHhlbmhlYXAgdmlydHVhbCBtZW1vcnkgcmVnaW9uIGJlZm9y
ZSBiZWluZyByZXR1cm5lZC4KPj4+Pgo+Pj4+IFdvdWxkbid0IHRoaXMgbW9zdCBlYXNpbHkgYmUg
ZG9uZSBieSBtYWtpbmcgYWxsb2NfeGVuaGVhcF9wYWdlcygpCj4+Pj4gY2FsbCBhbGxvY19kb21o
ZWFwX3BhZ2VzKCkgYW5kIHRoZW4gdm1hcCgpIHRoZSByZXN1bHQ/IE9mIGNvdXJzZQo+Pj4+IHdl
IG1heSBuZWVkIHRvIGdyb3cgdGhlIHZtYXAgYXJlYSBpbiB0aGF0IGNhc2UuCj4+Pgo+Pj4gSSBj
b3VsZG4ndCBhbnN3ZXIgdGhhdCBxdWVzdGlvbiB3aXRob3V0IGEgbG90IG1vcmUgZGlnZ2luZy4g
Oi0pICBJJ2QKPj4+IGFsd2F5cyBhc3N1bWVkIHRoYXQgdGhlIHJlYXNvbiBmb3IgdGhlIG9yaWdp
bmFsIHJlYXNvbiBmb3IgaGF2aW5nIHRoZQo+Pj4geGVuaGVhcCBkaXJlY3QtbWFwcGVkIG9uIDMy
LWJpdCB3YXMgc29tZXRoaW5nIHRvIGRvIHdpdGggZWFybHktYm9vdAo+Pj4gYWxsb2NhdGlvbjsg
aWYgdGhlcmUgaXMgc29tZXRoaW5nIHRyaWNreSB0aGVyZSwgd2UnZCBuZWVkIHRvCj4+PiBzcGVj
aWFsLWNhc2UgdGhlIGVhcmx5LWJvb3QgYWxsb2NhdGlvbiBzb21laG93Lgo+PiAKPj4gVGhlIHJl
YXNvbiBmb3IgdGhlIHNwbGl0IG9uIDMyLWJpdCB3YXMgc2ltcGx5IHRoZSBsYWNrIG9mIHN1ZmZp
Y2llbnQKPj4gVkEgc3BhY2UuCj4gCj4gVGhhdCB0ZWxscyBtZSB3aHkgdGhlIGRvbWhlYXAgd2Fz
ICpub3QqIGRpcmVjdC1tYXBwZWQ7IGJ1dCBpdCBkb2Vzbid0Cj4gdGVsbCBtZSB3aHkgdGhlIHhl
bmhlYXAgKndhcyouICBXYXMgaXQgcGVyaGFwcyBqdXN0IHNvbWV0aGluZyB0aGF0Cj4gZXZvbHZl
ZCBmcm9tIHdoYXQgd2UgaW5oZXJpdGVkIGZyb20gTGludXg/CgpQcmVzdW1hYmx5LCBidXQgdGhl
cmUgSSdtIHJlYWxseSB0aGUgd3Jvbmcgb25lIHRvIGFzay4gV2hlbiBJIGpvaW5lZCwKdGhpbmdz
IGhhZCBsb25nIGJlZW4gdGhhdCB3YXkuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
