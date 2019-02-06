From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v5 00/15] Argo: hypervisor-mediated
 interdomain communication
Date: Wed, 6 Feb 2019 11:36:42 +0100
Message-ID: <20190206103642.vzojdgwftk3hpgco@mac>
References: <1548064795-18160-1-git-send-email-christopher.w.clark@gmail.com>
 <20190122141702.h3oxvr25xjxbhjcl@mac>
 <CACMJ4Gbr4dR2B7o=+i_0aCEPiXTA9nF-w477Btvv8vd_B2+mOw@mail.gmail.com>
 <20190131133931.vincqqgf4acywekz@mac>
 <CACMJ4GZ+85Hr4x8Ydt9u8zJWQLnGcDCxnWoHw3WQdqOZaZJ0gQ@mail.gmail.com>
 <20190204100712.idxj4xpvifv7yy6f@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eoF8=QN=citrix.com=prvs=93319c3d4=roger.pau@srs-us1.protection.inumbo.net>)
 id 1grKdO-00034v-OW
 for xen-devel@lists.xenproject.org; Wed, 06 Feb 2019 10:40:50 +0000
Content-Disposition: inline
In-Reply-To: <20190204100712.idxj4xpvifv7yy6f@mac>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Rich Persaud <persaur@gmail.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, James McKenzie <james@bromium.com>, Eric Chanudet <eric.chanudet@gmail.com>
List-Id: xen-devel@lists.xenproject.org

V3JvbmcgJ1RvOicgZmllbGQgaW4gdGhlIHByZXZpb3VzIGVtYWlsLCBzb3JyeS4KCkdlbnRsZSBw
aW5nIG9uIHRoZSBxdWVzdGlvbnMgYmVsb3cuCgpPbiBNb24sIEZlYiAwNCwgMjAxOSBhdCAxMTow
NzoxMkFNICswMTAwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+IE9uIFN1biwgRmViIDAzLCAy
MDE5IGF0IDEwOjA0OjI5QU0gLTA4MDAsIENocmlzdG9waGVyIENsYXJrIHdyb3RlOgo+ID4gT24g
VGh1LCBKYW4gMzEsIDIwMTkgYXQgNTozOSBBTSBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIFdlZCwgSmFuIDMwLCAyMDE5IGF0IDA4
OjA1OjMwUE0gLTA4MDAsIENocmlzdG9waGVyIENsYXJrIHdyb3RlOgo+ID4gPiA+IE9uIFR1ZSwg
SmFuIDIyLCAyMDE5IGF0IDY6MTkgQU0gUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+IHdyb3RlOgo+ID4gPiA+ID4KPiA+ID4gPiA+IE9uIE1vbiwgSmFuIDIxLCAyMDE5IGF0
IDAxOjU5OjQwQU0gLTA4MDAsIENocmlzdG9waGVyIENsYXJrIHdyb3RlOgo+ID4gPiA+IEFzIGRp
c2N1c3NlZCBvZmZsaW5lOgo+ID4gPiA+Cj4gPiA+ID4gLSBVc2luZyBYZW4ncyBsaXN0IG1hY3Jv
cyB3aWxsIGV4cGVkaXRlIEFyZ28ncyBtZXJnZSBmb3IgWGVuIDQuMTIKPiA+ID4gPiAtIExpc3Qg
bWFjcm9zIGluIFhlbiBsaXN0Lmggb3JpZ2luYXRlZCBpbiBMaW51eCBsaXN0LmggYW5kIGhhdmUg
ZGl2ZXJnZWQKPiA+ID4gPiAtIE9wZW5YVCBoYXMgdXNlIGNhc2VzIGZvciBtZWFzdXJlZCBsYXVu
Y2ggYW5kIG5lc3RlZCB2aXJ0dWFsaXphdGlvbiwKPiA+ID4gPiAgIHdoaWNoIGluZmx1ZW5jZSBk
b3duc3RyZWFtIHBlcmZvcm1hbmNlIGFuZCBzZWN1cml0eSByZXF1aXJlbWVudHMgZm9yCj4gPiA+
ID4gICBBcmdvIGFuZCBYZW4KPiAKPiBGV0lXLCBJIGRvbid0IHNlZSB0aGUgY29ubmVjdGlvbiBi
ZXR3ZWVuIG5lc3RlZCB2aXJ0dWFsaXphdGlvbiBvcgo+IG1lYXN1cmVkIGxhdW5jaCBhbmQgdGhl
IGxpc3QgbWFjcm9zLiBJIHRoaW5rIGEgbGl0dGxlIGJpdCBtb3JlIGNvbnRleHQKPiB3b3VsZCBi
ZSBoZWxwZnVsIGhlcmUgaW4gb3JkZXIgdG8gdW5kZXJzdGFuZCB0aGUgaXNzdWUuCj4gCj4gPiA+
ID4gLSBPcGVuWFQgY2FuIHRlbXBvcmFyaWx5IHBhdGNoIFhlbiA0LjEyIGZvciBkb3duc3RyZWFt
IHVzZQo+IAo+IFBhdGNoaW5nIHRoZSBtYWNyb3MgZm9yIE9wZW5YVCBpcyBwZXJmZWN0bHkgZmlu
ZSwgYnV0IGl0IHdvdWxkIGJlCj4gYmV0dGVyIHRvIHVuZGVyc3RhbmQgYW5kIGZpeCB0aGUgcHJv
YmxlbSB1cHN0cmVhbSBpZiBwb3NzaWJsZS4KPiAKPiBIb3cgYXJlIHlvdSBwYXRjaGluZyB0aGUg
bWFjcm9zPwo+IAo+IFdoYXQgYXJlIHlvdSB0cnlpbmcgdG8gYWNoaWV2ZSBieSBwYXRjaGluZyB0
aGVtPwo+IAo+IFRoYW5rcywgUm9nZXIuCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Cj4gWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
