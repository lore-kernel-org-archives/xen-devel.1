From: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH 2/6] xen: Move xenstore initialization to
 common location
Date: Wed, 13 Mar 2019 14:11:36 -0400
Message-ID: <CAKf6xpubx6HATUuYXPsY4mxQf09Bx33+TV9cxstkJgnJhoamUQ@mail.gmail.com>
References: <20190311180216.18811-1-jandryuk@gmail.com>
 <20190311180216.18811-3-jandryuk@gmail.com>
 <1e50388c07d246f68f5ac591f449091c@AMSPEX02CL02.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IdTH=RQ=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1h48M3-0003xt-5a
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2019 18:11:51 +0000
Received: by mail-lj1-x242.google.com with SMTP id x13so2450181ljj.5
 for <xen-devel@lists.xenproject.org>; Wed, 13 Mar 2019 11:11:49 -0700 (PDT)
In-Reply-To: <1e50388c07d246f68f5ac591f449091c@AMSPEX02CL02.citrite.net>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, Anthony Perard <anthony.perard@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Richard Henderson <rth@twiddle.net>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBNYXIgMTMsIDIwMTkgYXQgMTE6MDEgQU0gUGF1bCBEdXJyYW50IDxQYXVsLkR1cnJh
bnRAY2l0cml4LmNvbT4gd3JvdGU6Cj4KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4g
PiBGcm9tOiBKYXNvbiBBbmRyeXVrIFttYWlsdG86amFuZHJ5dWtAZ21haWwuY29tXQo+ID4gU2Vu
dDogMTEgTWFyY2ggMjAxOSAxODowMgo+ID4gVG86IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZwo+ID4g
Q2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgbWFybWFyZWtAaW52aXNpYmxldGhp
bmdzbGFiLmNvbTsgSmFzb24gQW5kcnl1awo+ID4gPGphbmRyeXVrQGdtYWlsLmNvbT47IFN0ZWZh
bm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IEFudGhvbnkgUGVyYXJkCj4g
PiA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT47IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50
QGNpdHJpeC5jb20+OyBQYW9sbyBCb256aW5pCj4gPiA8cGJvbnppbmlAcmVkaGF0LmNvbT47IFJp
Y2hhcmQgSGVuZGVyc29uIDxydGhAdHdpZGRsZS5uZXQ+OyBFZHVhcmRvIEhhYmtvc3QgPGVoYWJr
b3N0QHJlZGhhdC5jb20+Owo+ID4gTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT47
IE1hcmNlbCBBcGZlbGJhdW0gPG1hcmNlbC5hcGZlbGJhdW1AZ21haWwuY29tPgo+ID4gU3ViamVj
dDogW1BBVENIIDIvNl0geGVuOiBNb3ZlIHhlbnN0b3JlIGluaXRpYWxpemF0aW9uIHRvIGNvbW1v
biBsb2NhdGlvbgo+ID4KPiA+IEZvciB0aGUgeGVuIHN0dWJkb20gY2FzZSwgd2UnbGwgd2FudCB4
ZW5zdG9yZSBpbml0aWFsaXplZCwgYnV0IHdlJ2xsCj4gPiB3YW50IHRvIHNraXAgdGhlIHJlc3Qg
b2YgeGVuX2JlX2luaXQuICBNb3ZlIHRoZSBpbml0aWFsaXphdGlvbiB0bwo+ID4geGVuX2h2bV9p
bml0IHNvIHdlIGNhbiBjb25kaXRpb25hbGl6ZSBjYWxsaW5nIHhlbl9iZV9pbml0Lgo+ID4KPiA+
IHhzX2RvbWFpbl9vcGVuKCkgaXMgZGVwcmVjYXRlZCBmb3IgeHNfb3BlbigwKSwgc28gbWFrZSB0
aGUgcmVwbGFjZW1lbnQKPiA+IGFzIHdlbGwuCj4KPiBDYW4geW91IGVsYWJvcmF0ZSBhcyB0byB3
aHkgeW91IG5lZWQgdG8gZG8gdGhpcyB3aGVuIHRoZSBjb2RlIGF0IHRoZSB0b3Agb2YgeGVuX2h2
bV9pbml0KCkgYWxyZWFkeSBvcGVucyB4ZW5zdG9yZSBmb3IgaXRzIG93biBwdXJwb3NlcywgYW5k
IEFGQUlDVCB4ZW5zdG9yZV91cGRhdGUoKSBpcyBvbmx5IG5lZWRlZCBpZiBRRU1VIGlzIGltcGxl
bWVudGluZyBhIFBWIGJhY2tlbmQ/Cj4KPgoKSGksIFBhdWwuICBUaGFua3MgZm9yIHJldmlld2lu
Zy4KCkkgdGhpbmsgeW91IGFyZSByaWdodCwgdGhhdCB0aGlzIGJhc2ljYWxseSBzaG91bGRuJ3Qg
YmUgbmVlZGVkIGlmIFBWCmJhY2tlbmRzIGFyZSBkaXNhYmxlZC4gIFRoaXMgcGF0Y2ggY2FtZSBv
dXQgb2YgT3BlblhULCB3aGVyZSBpdCBpcwpuZWVkZWQgZm9yIHNvbWUgb3V0LW9mLXRyZWUgcGF0
Y2hlcy4gIEJ1dCB0aGF0IGRvZXNuJ3QgbWFrZSBpdApzdWl0YWJsZSBmb3IgdXBzdHJlYW1pbmcu
CgpIb3dldmVyLCB3aGlsZSByZXZpZXdpbmcsIGl0IGxvb2tzIGxpa2UgdGhlIHhlbiBhY2NlbGVy
YXRvciBpbgpody94ZW4veGVuLWNvbW1vbi5jOnhlbl9pbml0KCkgcmVnaXN0ZXJzIHhlbl9jaGFu
Z2Vfc3RhdGVfaGFuZGxlcigpLgp4ZW5fY2hhbmdlX3N0YXRlX2hhbmRsZXIoKSB1c2VzIHRoZSBn
bG9iYWwgeGVuc3RvcmUgaGFuZGxlIGFuZCB3aWxsCmV4aXQoMSkgaWYgTlVMTC4gIEknbSBub3Qg
c3VyZSBob3cgdG8gZ2V0IHRoZSBYZW5JT1N0YXRlIHhlbnN0b3JlCmhhbmRsZSBvdmVyIHRvIHRo
ZSBhY2NlbGVyYXRvcidzIHhlbl9pbml0LiAgT3V0c2lkZSBvZiB0aGF0LCBJIHRoaW5rCnlvdSBh
cmUgY29ycmVjdCB0aGF0IHhlbnN0b3JlX3VwZGF0ZSBkb2Vzbid0IG5lZWQgdG8gYmUgcnVuIHdo
ZW4gUFYKYmFja2VuZHMgYXJlIGRpc2FibGVkLgoKVGhhbmtzLApKYXNvbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
