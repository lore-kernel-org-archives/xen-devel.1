From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 3/8] xen/x86: manually build xen.mb.efi
 binary
Date: Tue, 10 Jul 2018 07:54:51 -0600
Message-ID: <5B44BAAB02000078001D2B4A@prv1-mh.provo.novell.com>
References: <1529418946-30114-1-git-send-email-daniel.kiper@oracle.com>
 <1529418946-30114-4-git-send-email-daniel.kiper@oracle.com>
 <5B310BE702000078001CDA1B@prv1-mh.provo.novell.com>
 <20180704133109.GA26572@olila.local.net-space.pl>
 <5B3CE76F02000078001D1207@prv1-mh.provo.novell.com>
 <20180704163542.GG26572@olila.local.net-space.pl>
 <5B3DD43B02000078001D1527@prv1-mh.provo.novell.com>
 <20180706140248.GK26572@olila.local.net-space.pl>
 <5B3F85ED02000078001D1EA5@prv1-mh.provo.novell.com>
 <20180710104808.GX26572@olila.local.net-space.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=xfjl=j2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fct6V-00080F-SQ
 for xen-devel@lists.xenproject.org; Tue, 10 Jul 2018 13:54:55 +0000
In-Reply-To: <20180710104808.GX26572@olila.local.net-space.pl>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Daniel Kiper <daniel.kiper@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas.k.lengyel@gmail.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEwLjA3LjE4IGF0IDEyOjQ4LCA8ZGFuaWVsLmtpcGVyQG9yYWNsZS5jb20+IHdyb3Rl
Ogo+IE9uIEZyaSwgSnVsIDA2LCAyMDE4IGF0IDA5OjA4OjI5QU0gLTA2MDAsIEphbiBCZXVsaWNo
IHdyb3RlOgo+PiA+Pj4gT24gMDYuMDcuMTggYXQgMTY6MDIsIDxkYW5pZWwua2lwZXJAb3JhY2xl
LmNvbT4gd3JvdGU6Cj4+ID4gT24gVGh1LCBKdWwgMDUsIDIwMTggYXQgMDI6MTg6MDNBTSAtMDYw
MCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+ID4+ID4+PiBPbiAwNC4wNy4xOCBhdCAxODozNSwgPGRh
bmllbC5raXBlckBvcmFjbGUuY29tPiB3cm90ZToKPj4gPj4gPiBPbiBXZWQsIEp1bCAwNCwgMjAx
OCBhdCAwOToyNzo0M0FNIC0wNjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gPj4gPj4gPj4+IE9u
IDA0LjA3LjE4IGF0IDE2OjAxLCA8ZGFuaWVsLmtpcGVyQG9yYWNsZS5jb20+IHdyb3RlOgo+PiA+
PiA+PiA+IE9uIE1vbiwgSnVuIDI1LCAyMDE4IGF0IDA5OjM2OjA3QU0gLTA2MDAsIEphbiBCZXVs
aWNoIHdyb3RlOgo+PiA+PiA+PiA+PiA+Pj4gT24gMTkuMDYuMTggYXQgMTY6MzUsIDxkYW5pZWwu
a2lwZXJAb3JhY2xlLmNvbT4gd3JvdGU6Cj4+ID4+ID4+ID4+ID4gQEAgLTU4Miw2ICs1ODcsMTIg
QEAgc3RhdGljIHZvaWQgX19pbml0IGVmaV9hcmNoX21lbW9yeV9zZXR1cCh2b2lkKQo+PiA+PiA+
PiA+PiA+ICAgICAgaWYgKCAhZWZpX2VuYWJsZWQoRUZJX0xPQURFUikgKQo+PiA+PiA+PiA+PiA+
ICAgICAgICAgIHJldHVybjsKPj4gPj4gPj4gPj4gPgo+PiA+PiA+PiA+PiA+ICsgICAgaWYgKCBl
ZmlfZW5hYmxlZChFRklfTUJfTE9BREVSKSApCj4+ID4+ID4+ID4+ID4gKyAgICAgICAgZm9yICgg
cHRlID0gX19wYWdlX3RhYmxlc19zdGFydDsgcHRlIDwgX19wYWdlX3RhYmxlc19lbmQ7Cj4+ID4+
ID4+ID4+ID4gKyAgICAgICAgICAgICAgcHRlICs9ICggcHRlICE9IChpbnRwdGVfdCAqKWwyX2lk
ZW50bWFwICkgPyAxIDogNCAqIEwyX1BBR0VUQUJMRV9FTlRSSUVTICkKPj4gPj4gPj4gPj4KPj4g
Pj4gPj4gPj4gUGxlYXNlIGF2b2lkIGV4cGxpY2l0IGNhc3RzIC0gJmwyZV9nZXRfaW50cHRlKGwy
X2lkZW50bWFwWzBdKSBvcgo+PiA+PiA+PiA+PiBzb21ldGhpbmcgYWxvbmcgdGhvc2UgbGluZXMg
b3VnaHQgdG8gd29yayBoZXJlLiBTYW1lIGZvcgo+PiA+PiA+PiA+PiA0ICogTDJfUEFHRVRBQkxF
X0VOVFJJRVMgLSB5b3UgbWVhbiBBUlJBWV9TSVpFKCkgdGhlcmUuCj4+ID4+ID4+ID4KPj4gPj4g
Pj4gPiBPSy4KPj4gPj4gPj4gPgo+PiA+PiA+PiA+PiBBbHNvIHRoaXMgd2hvbGUgY29kZSBibG9j
ayBuZWVkcyBhIGNvbW1lbnQsIHRvIGV4cGxhaW4gd2hhdCBpdAo+PiA+PiA+PiA+PiBkb2VzIGFu
ZCBhbHNvIHdoeSBsMl9pZGVudG1hcCBuZWVkcyBza2lwcGluZy4KPj4gPj4gPj4gPj4KPj4gPj4g
Pj4gPj4gRnVydGhlcm1vcmUgLSBpc24ndCB0aGlzIG9mZiBieSBvbmUsIGFuZCB5b3UgcHJvY2Vz
cyBsMl9pZGVudG1hcFswXQo+PiA+PiA+PiA+PiB0aGlzIHdheSwgc2tpcHBpbmcgdGhlIHJlc3Qg
X3BsdXNfIHRoZSBmaXJzdCBmb2xsb3dpbmcgZW50cnk/IEkgdGhpbmsKPj4gPj4gPj4gPgo+PiA+
PiA+PiA+IFRoZSBjb2RlIG1pbWljcyBzaW1pbGFyIGNvZGUgaW4gaGVhZC5TLgo+PiA+PiA+Pgo+
PiA+PiA+PiBJIGNhbid0IHNlZSBhIHNpbWlsYXIgb2ZmLWJ5LTEgaW4gaGVhZC5TLgo+PiA+PiA+
Cj4+ID4+ID4gIDY2MiAgICAgICAgIC8qCj4+ID4+ID4gIDY2MyAgICAgICAgICAqIFVwZGF0ZSBm
cmFtZSBhZGRyZXNzZXMgaW4gcGFnZSB0YWJsZXMgZXhjbHVkaW5nIGwyX2lkZW50bWFwCj4+ID4+
ID4gIDY2NCAgICAgICAgICAqIHdpdGhvdXQgaXRzIGZpcnN0IGVudHJ5IHdoaWNoIHBvaW50cyB0
byBsMV9pZGVudG1hcC4KPj4gPj4gPiAgNjY1ICAgICAgICAgICovCj4+ID4+ID4gIDY2NiAgICAg
ICAgIG1vdiAgICAgJCgoX19wYWdlX3RhYmxlc19lbmQtX19wYWdlX3RhYmxlc19zdGFydCkvOCks
JWVjeAo+PiA+PiA+ICA2NjcgICAgICAgICBtb3YgICAgICQoKChsMl9pZGVudG1hcC1fX3BhZ2Vf
dGFibGVzX3N0YXJ0KS84KSsxKSwlZWR4Cj4+ID4+ID4gIDY2OCAxOiAgICAgIGNtcCAgICAgJCgo
bDJfaWRlbnRtYXArbDJfaWRlbnRtYXBfc2l6ZW9mLV9fcGFnZV90YWJsZXNfc3RhcnQpLzgpLCVl
Y3gKPj4gPj4gPiAgNjY5ICAgICAgICAgY21vdmUgICAlZWR4LCVlY3gKPj4gPj4gPiAgNjcwICAg
ICAgICAgdGVzdGwgICAkX1BBR0VfUFJFU0VOVCxzeW1fZnMoX19wYWdlX3RhYmxlc19zdGFydCkt
OCgsJWVjeCw4KQo+PiA+PiA+ICA2NzEgICAgICAgICBqeiAgICAgIDJmCj4+ID4+ID4gIDY3MiAg
ICAgICAgIGFkZCAgICAgJWVzaSxzeW1fZnMoX19wYWdlX3RhYmxlc19zdGFydCktOCgsJWVjeCw4
KQo+PiA+PiA+ICA2NzMgMjogICAgICBsb29wICAgIDFiCj4+ID4+Cj4+ID4+IFdlbGwgLSB0aGlz
IGlzIHRoZSBjb2RlIGluIHF1ZXN0aW9uLCBidXQgeW91IGZhaWwgdG8gcG9pbnQgb3V0IHdoZXJl
Cj4+ID4+IHRoZSBvZmYtYnktMSBpcy4KPj4gPgo+PiA+IExpbmUgNjY3LCA2NjggYW5kIDY2OS4K
Pj4KPj4gSSBkb24ndCB0aGluayBzbywgbm8uIE5vdGUgdGhlIC04IGluIGxpbmVzIDY3MCBhbmQg
NjcyLgo+IAo+IEhvd2V2ZXIsIHlvdSBhcmUgbWlzc2luZyArMSBpbiBsaW5lIDY2Ny4KCkkgZG9u
J3QgdGhpbmsgSSBhbTogVGhlIGZpcnN0IGVudHJ5IG9mIGwyX2lkZW50bWFwIGFjdHVhbGx5IG5l
ZWRzCnByb2Nlc3NpbmcgYWZhaWNzIChhbmQgYXMgdGhlIGNvbW1lbnQgc2F5cyksIGFzIHRoYXQn
cyB0aGUgb25seSBvbmUKd2l0aCBub24tYWJzb2x1dGUgY29udGVudHMuIElPVyAtIHBhcnQgb2Yg
bXkgb3JpZ2luYWwgY29tbWVudCB3YXMKd3JvbmcsIGJ1dCB0aGUgb3RoZXIgaGFsZiAoeW91IHNr
aXBwaW5nIG9uZSBlbnRyeSkgc3RpbGwgc2VlbXMKYXBwbGljYWJsZSwgYXMgZG9lcyB0aGUgcGFy
dCBjb25jZXJuaW5nIHRoZSBtaXNzaW5nIGNvbW1lbnQuCgpKYW4KCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
