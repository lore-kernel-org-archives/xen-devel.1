From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2 5/6] xen: Add only
 xen-sysdev to dynamic sysbus device list
Date: Fri, 22 Dec 2017 14:36:40 +0100
Message-ID: <CAJ+F1CLrWG-h8ciO0rvLYnTidff7Ba0ixr1cmBYV82gYUfctXQ@mail.gmail.com>
References: <20171125151610.20547-1-ehabkost@redhat.com>
 <20171125151610.20547-6-ehabkost@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=0a18=ds=gmail.com=marcandre.lureau@srs-us1.protection.inumbo.net>)
 id 1eSNVD-000372-49
 for xen-devel@lists.xenproject.org; Fri, 22 Dec 2017 13:36:43 +0000
Received: by mail-wm0-x241.google.com with SMTP id b199so22005846wme.1
 for <xen-devel@lists.xenproject.org>; Fri, 22 Dec 2017 05:36:41 -0800 (PST)
In-Reply-To: <20171125151610.20547-6-ehabkost@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Eduardo Habkost <ehabkost@redhat.com>
Cc: jgross@suse.com, Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, QEMU <qemu-devel@nongnu.org>, Marcel Apfelbaum <marcel@redhat.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Laszlo Ersek <lersek@redhat.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiBTYXQsIE5vdiAyNSwgMjAxNyBhdCA0OjE2IFBNLCBFZHVhcmRvIEhhYmtvc3QgPGVo
YWJrb3N0QHJlZGhhdC5jb20+IHdyb3RlOgo+IFRoZXJlJ3Mgbm8gbmVlZCB0byBtYWtlIHRoZSBt
YWNoaW5lIGFsbG93IGV2ZXJ5IHBvc3NpYmxlIHN5c2J1cwo+IGRldmljZS4gIFdlIGNhbiBub3cg
anVzdCBhZGQgeGVuLXN5c2RldiB0byB0aGUgYWxsb3dlZCBsaXN0Lgo+Cj4gQ2M6IFN0ZWZhbm8g
U3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KPiBDYzogQW50aG9ueSBQZXJhcmQg
PGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Cj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwo+IENjOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gU2lnbmVkLW9m
Zi1ieTogRWR1YXJkbyBIYWJrb3N0IDxlaGFia29zdEByZWRoYXQuY29tPgo+IC0tLQo+IENoYW5n
ZXMgc2VyaWVzIHYxIC0+IHYyOgo+ICogTmV3IHBhdGNoIGFkZGVkIHRvIHNlcmllcwo+IC0tLQo+
ICBody94ZW4veGVuX2JhY2tlbmQuYyB8IDcgKy0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDYgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvaHcveGVuL3hlbl9i
YWNrZW5kLmMgYi9ody94ZW4veGVuX2JhY2tlbmQuYwo+IGluZGV4IDgyMzgwZWE5ZWUuLjc0NDVi
NTA2YWMgMTAwNjQ0Cj4gLS0tIGEvaHcveGVuL3hlbl9iYWNrZW5kLmMKPiArKysgYi9ody94ZW4v
eGVuX2JhY2tlbmQuYwo+IEBAIC01NjQsMTIgKzU2NCw3IEBAIHN0YXRpYyB2b2lkIHhlbl9zZXRf
ZHluYW1pY19zeXNidXModm9pZCkKPiAgICAgIE9iamVjdENsYXNzICpvYyA9IG9iamVjdF9nZXRf
Y2xhc3MobWFjaGluZSk7Cj4gICAgICBNYWNoaW5lQ2xhc3MgKm1jID0gTUFDSElORV9DTEFTUyhv
Yyk7Cj4KPiAtICAgIC8qCj4gLSAgICAgKiBFbXVsYXRlIG9sZCBtYy0+aGFzX2R5bmFtaWNfc3lz
YnVzPXRydWUgYXNzaWdubWVudAo+IC0gICAgICoKPiAtICAgICAqVE9ETzogYWRkIG9ubHkgWGVu
IGRldmljZXMgdG8gdGhlIGxpc3QKPiAtICAgICAqLwo+IC0gICAgbWFjaGluZV9jbGFzc19hbGxv
d19keW5hbWljX3N5c2J1c19kZXYobWMsIFRZUEVfU1lTX0JVU19ERVZJQ0UpOwo+ICsgICAgbWFj
aGluZV9jbGFzc19hbGxvd19keW5hbWljX3N5c2J1c19kZXYobWMsIFRZUEVfWEVOU1lTREVWKTsK
Ckl0IGxvb2tzIGxpa2UgaXQncyB0aGUgbGFzdCBwYXRjaCBpbiB0aGUgc2VyaWVzIHdpdGhvdXQg
cmV2aWV3LiBJdAp3b3VsZCBiZSBuaWNlIGlmIGEgWGVuIG1haW50YWluZXIgY291bGQgbG9vayBh
dCBpdCwgb3IgdGVzdCBpdCwgYXMgSQpkb250IGtub3cgaG93IHRvIHRlc3QgaXQgdGJoLgoKUmV2
aWV3ZWQtYnk6IE1hcmMtQW5kcsOpIEx1cmVhdSA8bWFyY2FuZHJlLmx1cmVhdUByZWRoYXQuY29t
PgoKCj4gIH0KPgo+ICBpbnQgeGVuX2JlX3JlZ2lzdGVyKGNvbnN0IGNoYXIgKnR5cGUsIHN0cnVj
dCBYZW5EZXZPcHMgKm9wcykKPiAtLQo+IDIuMTMuNgo+Cj4KCgoKLS0gCk1hcmMtQW5kcsOpIEx1
cmVhdQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
