From: George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH] x86emul/fuzz: adjust canonicalization in
 sanitize_input()
Date: Fri, 29 Mar 2019 15:42:11 +0000
Message-ID: <F2552738-0569-4DC0-A93D-F0D3191C5D5E@citrix.com>
References: <5C9E30F40200007800222DDC@prv1-mh.provo.novell.com>
 <8B8E72C2-696B-4C0D-8733-78C7B93B9FB0@citrix.com>
 <5C9E38620200007800222F8B@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Mto7=SA=citrix.com=prvs=984564d2a=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1h9thJ-0004lk-8z
 for xen-devel@lists.xenproject.org; Fri, 29 Mar 2019 15:45:37 +0000
In-Reply-To: <5C9E38620200007800222F8B@prv1-mh.provo.novell.com>
Content-Language: en-US
Content-ID: <79C692282BFC914A9D85E96CF53CE7D5@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

DQoNCj4gT24gTWFyIDI5LCAyMDE5LCBhdCAzOjIzIFBNLCBKYW4gQmV1bGljaCA8SkJldWxpY2hA
c3VzZS5jb20+IHdyb3RlOg0KPiANCj4+Pj4gT24gMjkuMDMuMTkgYXQgMTY6MTQsIDxHZW9yZ2Uu
RHVubGFwQGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4+IA0KPj4+IE9uIE1hciAyOSwgMjAxOSwg
YXQgMjo1MSBQTSwgSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCj4+PiAN
Cj4+PiBEcm9wIGl0IGVudGlyZWx5IGZvciAlcmJwIC0gdGhpcyByZWdpc3RlciBpcyBub3Qgc3Bl
Y2lhbCBwdXJwb3NlIGVub3VnaA0KPj4+IHRvIHdhcnJhbnQgc3VjaCBzcGVjaWFsIHRyZWF0bWVu
dC4gQWRkIGEgY29tbWVudCB0byBjbGFyaWZ5IHRoZSBwdXJwb3NlDQo+Pj4gb2YgdGhlIGNhbm9u
aWNhbGl6YXRpb24gb2YgJXJpcCBhbmQgJXJzcC4NCj4+PiANCj4+PiBTaWduZWQtb2ZmLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+PiANCj4+IEZBT0Q6DQo+PiAxLiBJIGRv
buKAmXQgb3Bwb3NlIHRoaXMsIGJ1dA0KPj4gMi4gSSBkb27igJl0IHN1cHBvcnQgaXQgZWl0aGVy
OyBob3dldmVyLA0KPj4gMy4gSSBkb27igJl0IHRoaW5rIG15IEFjayBpcyBuZWNlc3NhcnkuDQo+
IA0KPiBXZWxsLCBwcmVmZXJhYmx5IEkgd291bGQgYWRkcmVzcyB5b3VyIGNvbmNlcm5zIGRlc3Bp
dGUgMy4gU28gY291bGQNCj4geW91IGNsYXJpZnkgd2hhdCB5b3Ugd291bGQgc3VnZ2VzdCBpbnN0
ZWFkPyBLZWVwIHRoaW5ncyBhcyB0aGV5DQo+IGFyZT8gRHJvcCBhbGwgY2Fub25pY2FsaXphdGlv
bj8gSSd2ZSBiYXNpY2FsbHkgdHJpZWQgdG8gZmluZCBhIG1pZGRsZQ0KPiBncm91bmQgYmV0d2Vl
biB0aGUgdHdvIGV4dHJlbWVzLg0KDQpJIGFwcHJlY2lhdGUgdGhhdC4gOi0pIEJ1dCB0aGUgbWFp
biByZWFzb24gSSB3cm90ZSB0aGlzIHdhcyAjMzogSSBkaWRu4oCZdCB3YW50IG15IHNpbGVuY2Ug
aW50ZXJwcmV0ZWQgYXMgYSBuYWNrLg0KDQpJIGRvbuKAmXQgdGhpbmsgaXQgd2lsbCBoZWxwIGZ1
enppbmcgdG8gcmVtb3ZlIGNhbm9uaWNhbGl6YXRpb24gb2YgZWJwOyBpdCBtYXkgaGVscCB0byBo
YXZlIGl0IGluLiAgSW4gZmFjdCBJ4oCZZCBwcmVmZXIgdG8gQ0FOT05JQ0FMSVpFX01BWUJFKCkg
bW9yZSByZWdpc3RlcnMuDQoNCkJ1dCBJIGRvbuKAmXQgdGhpbmsgdGhlIHF1ZXN0aW9uIGlzIHNv
IGNsZWFyLCBvciBzbyBpbXBvcnRhbnQsIHRoYXQgaXTigJlzIHdvcnRoIGhhdmluZyBhIGxvbmcg
ZGlzY3Vzc2lvbiBhYm91dC4gIEFic2VudCBzb21lIHNvcnQgb2Ygcmlnb3JvdXMgdGVzdGluZywg
d2XigJlyZSBhbGwganVzdCBndWVzc2luZyB3aGljaCBpcyBiZXR0ZXI7IHlvdSAmIEFuZHkgYXJl
IGd1ZXNzaW5nIG9uZSB3YXksIEnigJltIGd1ZXNzaW5nIHRoZSBvdGhlciB3YXkuICBUaGlzIHBh
dGNoIGlzIGFib3V0IGFzIGNsb3NlIHRvIG1pZGRsZS1ncm91bmQgYXMgdGhlcmUgaXMuDQoNClBl
YWNlLA0KIC1HZW9yZ2UKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
