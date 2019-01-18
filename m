From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: [PATCH v4 10/14] argo: implement the notify op
Date: Fri, 18 Jan 2019 15:59:58 -0800
Message-ID: <CACMJ4GazKQhuKePv5w9WaqzWTgt3BWfJhyB5qVEYaTHRnStmvw@mail.gmail.com>
References: <1547544466-21135-1-git-send-email-christopher.w.clark@gmail.com>
 <1547544466-21135-11-git-send-email-christopher.w.clark@gmail.com>
 <20190115161750.xl6shidfys2vjfx6@mac>
 <CACMJ4GYfVNfjn0c1gNSPyNRnTbvuhenDMWd-aAybkSuupjVzhQ@mail.gmail.com>
 <20190117111210.224ewn3ycdy6fhci@mac>
 <CACMJ4GasXo2BuGCwVA66kbdsh_SVtkZ86OsdKOTky5UYjnOBag@mail.gmail.com>
 <20190118094428.t3izdbe4izthldp7@mac>
 <CACMJ4GbSVDsX8KJeF+-ACNV9zw9Os0_sCUr0h5S=fZ5N1HmApQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/eIs=P3=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1gke3Y-0005RN-Qe
 for xen-devel@lists.xenproject.org; Sat, 19 Jan 2019 00:00:12 +0000
Received: by mail-lf1-x133.google.com with SMTP id a8so11721029lfk.5
 for <xen-devel@lists.xenproject.org>; Fri, 18 Jan 2019 16:00:11 -0800 (PST)
In-Reply-To: <CACMJ4GbSVDsX8KJeF+-ACNV9zw9Os0_sCUr0h5S=fZ5N1HmApQ@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, James McKenzie <james@bromium.com>, Eric Chanudet <eric.chanudet@gmail.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBKYW4gMTgsIDIwMTkgYXQgMzo1NCBQTSBDaHJpc3RvcGhlciBDbGFyawo8Y2hyaXN0
b3BoZXIudy5jbGFya0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBKYW4gMTgsIDIwMTkg
YXQgMTo0NCBBTSBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6
Cj4gPgo+ID4gT24gVGh1LCBKYW4gMTcsIDIwMTkgYXQgMDE6NDQ6MzJQTSAtMDgwMCwgQ2hyaXN0
b3BoZXIgQ2xhcmsgd3JvdGU6Cj4gPiA+IE9uIFRodSwgSmFuIDE3LCAyMDE5IGF0IDM6MTIgQU0g
Um9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+ID4gPiA+Cj4g
PiA+ID4gT24gV2VkLCBKYW4gMTYsIDIwMTkgYXQgMTA6NTQ6NDhQTSAtMDgwMCwgQ2hyaXN0b3Bo
ZXIgQ2xhcmsgd3JvdGU6Cj4gPiA+ID4gPiBPbiBUdWUsIEphbiAxNSwgMjAxOSBhdCA4OjE5IEFN
IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToKPiA+ID4gPiA+
ID4KPiA+ID4gPiA+ID4gT24gVHVlLCBKYW4gMTUsIDIwMTkgYXQgMDE6Mjc6NDJBTSAtMDgwMCwg
Q2hyaXN0b3BoZXIgQ2xhcmsgd3JvdGU6Cgo+IE5ldyBTaXR1YXRpb24gNCBpczoKPgo+IDQuIE1l
c3NhZ2UgZG9lc24ndCBmaXQgYmFzZWQgb24gdGhlIGN1cnJlbnQgYXZhaWxhYmxlIHNwYWNlIG9u
IHRoZSByaW5nLAo+IGJ1dCBYZW4gY2FuJ3QgcXVldWUgdXAgYSBWSVJRIGZvciBsYXRlciBiZWNh
dXNlIG1lbW9yeSBhbGxvY2F0aW9uIHRvCj4gYWRkIGFuIGVudHJ5IGZvciB0aGF0IGZhaWxlZC4g
RG9uJ3Qgc2V0IE5PVElGWS4KCkkgc2hvdWxkIGFkZDogdGhlcmUncyBhbiBhZGRpdGlvbmFsIGVy
cm9yIGNvbmRpdGlvbiBmb3IgU2l0dWF0aW9uIDQgYmVzaWRlcwptZW1vcnkgYWxsb2NhdGlvbiBm
YWlsdXJlOiB0aGUgcmluZyBjb3VsZCBoYXZlIHJlYWNoZWQgdGhlIG1heGltdW0KbnVtYmVyIG9m
IHBlbmRpbmcgc3BhY2VfYXZhaWxhYmxlIHNpZ25hbHMgaW4gaXRzIGxpc3QsIHdoaWNoIHdvdWxk
IGNhdXNlCkVOT1NQQyBhcyBhbm90aGVyIHBvc3NpYmxlIGVycm9yIHZhbHVlIHJldHVybmVkIHRo
ZXJlLgoKPgo+IFdlIG91Z2h0IHRvIGVuYWJsZSB0aGUgZ3Vlc3QgdG8gZGlzdGluZ3Vpc2ggU2l0
dWF0aW9uIDIgZnJvbSBTaXR1YXRpb24gNAo+IC0tIHdoaWNoIEkgdGhpbmsgcG9pbnRzIHRvIGtl
ZXBpbmcgdGhlIHNlcGFyYXRlIGZsYWdzLgo+Cj4gPiBTbyB0aGF0IHdvdWxkIGxlYXZlIHRoZSBm
b2xsb3dpbmcgc2V0IG9mIGZsYWdzOgo+ID4KPiA+IC8qIFJpbmcgaXMgZW1wdHkuICovCj4gPiAj
ZGVmaW5lIFhFTl9BUkdPX1JJTkdfRU1QVFkgICAgICAgKDFVIDw8IDApCj4gPiAvKiBSaW5nIGV4
aXN0cy4gKi8KPiA+ICNkZWZpbmUgWEVOX0FSR09fUklOR19FWElTVFMgICAgICAoMVUgPDwgMSkK
PiA+IC8qCj4gPiAgKiBOb3QgZW5vdWdoIHJpbmcgc3BhY2UgYXZhaWxhYmxlIGZvciB0aGUgcmVx
dWVzdGVkIHNpemUsIGNhbGxlciBzZXQKPiA+ICAqIHRvIHJlY2VpdmUgYSBub3RpZmljYXRpb24g
dmlhIFZJUlFfQVJHTyB3aGVuIGVub3VnaCBmcmVlIHNwYWNlCj4gPiAgKiBtaWdodCBiZSBhdmFp
bGFibGUuCj4gPiAgKi8KPiA+ICNkZWZpbmUgWEVOX0FSR09fUklOR19OT1RJRlkgICAgICAoMVUg
PDwgMikKPiA+IC8qIFJlcXVlc3RlZCBzaXplIGV4Y2VlZHMgbWF4aW11bSByaW5nIG1lc3NhZ2Ug
c2l6ZS4gKi8KPiA+ICNkZWZpbmUgWEVOX0FSR09fUklOR19FTVNHU0laRSAgICAoMVUgPDwgMykK
PiA+IC8qIFJpbmcgaXMgc2hhcmVkLCBub3QgdW5pY2FzdC4gKi8KPiA+ICNkZWZpbmUgWEVOX0FS
R09fUklOR19TSEFSRUQgICAgICAoMVUgPDwgNCkKPiA+Cj4gPiBOb3RlIHRoYXQgSSd2ZSBhbHNv
IHJlbW92ZWQgdGhlIF9EQVRBX0ZfLCBJIHRoaW5rIGl0J3Mgbm90IHNwZWNpYWxseQo+ID4gaGVs
cGZ1bCwgYW5kIHNob3J0ZXIgbmFtZXMgYXJlIGVhc2llciB0byByZWFkLgo+Cj4gQWNrIC0gZG9u
ZS4KPgo+ID4KPiA+IEkgdGhpbmsgdGhlIGFib3ZlIGlzIGNsZWFyZXIgYW5kIHNob3VsZCBiZSBh
YmxlIHRvIGNvbnZleSB0aGUKPiA+IHNhbWUgc2V0IG9mIGluZm9ybWF0aW9uIHVzaW5nIG9uZSBm
bGFnIGxlc3MsIHdoaWNoIGlzIGFsd2F5cyBiZXR0ZXIKPiA+IElNTy4gVGhhdCBiZWluZyBzZXQg
SSBkb24ndCBrbm93IHRoZSB1c2VycyBvZiB0aGlzIGludGVyZmFjZSBhbnl3YXksCj4gPiBzbyBp
ZiB5b3UgdGhpbmsgdGhlIG9yaWdpbmFsIHByb3Bvc2FsIGlzIGJldHRlciBJJ20gbm90IGdvaW5n
IHRvCj4gPiBvcHBvc2UuCj4KPiBvayAtLSBsZXQgbWUga25vdyB5b3VyIHZpZXcgZ2l2ZW4gdGhl
IGRlc2NyaXB0aW9uIG9mIFNpdHVhdGlvbiA0IGFib3ZlLgo+IEkndmUga2VwdCBpdCB1bmNoYW5n
ZWQgZm9yIHRoZSB0aW1lIGJlaW5nLgo+Cj4gQ2hyaXN0b3BoZXIKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
