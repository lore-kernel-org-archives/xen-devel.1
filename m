From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [Qemu-devel] [PATCH 0/2] xen-hvm: use new resource
 mapping API
Date: Thu, 10 May 2018 08:29:22 +0000
Message-ID: <a789514577864e9b92d954f7944795bc__49728.8893828683$1525940906$gmane$org@AMSPEX02CL03.citrite.net>
References: <20180509154604.25530-1-paul.durrant@citrix.com>
 <152588171396.2703.471985236583323449@71c20359a636>
 <82906d30c1854e13bd7986af99eb1d98@AMSPEX02CL03.citrite.net>
 <0c96c8b0-4736-d1fe-8145-bf14d2a24a97@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=t9kk=h5=citrix.com=prvs=66179fe3f=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1fGgx4-00038y-5h
 for xen-devel@lists.xenproject.org; Thu, 10 May 2018 08:29:26 +0000
In-Reply-To: <0c96c8b0-4736-d1fe-8145-bf14d2a24a97@redhat.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Eric Blake' <eblake@redhat.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "famz@redhat.com" <famz@redhat.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBFcmljIEJsYWtlIFttYWlsdG86
ZWJsYWtlQHJlZGhhdC5jb21dDQo+IFNlbnQ6IDA5IE1heSAyMDE4IDE4OjI2DQo+IFRvOiBQYXVs
IER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPjsgcWVtdS1kZXZlbEBub25nbnUub3Jn
DQo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IGZhbXpAcmVkaGF0LmNvbQ0K
PiBTdWJqZWN0OiBSZTogW1FlbXUtZGV2ZWxdIFtQQVRDSCAwLzJdIHhlbi1odm06IHVzZSBuZXcg
cmVzb3VyY2UgbWFwcGluZw0KPiBBUEkNCj4gDQo+IE9uIDA1LzA5LzIwMTggMTE6MDUgQU0sIFBh
dWwgRHVycmFudCB3cm90ZToNCj4gDQo+ID4+IHhlbmZvcmVpZ25tZW1vcnlfbWFwX3Jlc291cmNl
KCkgdG8gbWFwIGlvcmVxIHBhZ2VzLi4uDQo+ID4+IEVSUk9SOiBzcGFjZXMgcmVxdWlyZWQgYXJv
dW5kIHRoYXQgJyonIChjdHg6V3hWKQ0KPiA+PiAjMTY0OiBGSUxFOiBpbmNsdWRlL2h3L3hlbi94
ZW5fY29tbW9uLmg6MTI4Og0KPiA+PiArICAgIHhlbmZvcmVpZ25tZW1vcnlfaGFuZGxlICpmbWVt
LCBkb21pZF90IGRvbWlkLCB1bnNpZ25lZCBpbnQNCj4gdHlwZSwNCj4gPj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXg0KPiA+Pg0KPiA+PiB0b3RhbDogMSBlcnJvcnMsIDAgd2Fybmlu
Z3MsIDEzOCBsaW5lcyBjaGVja2VkDQo+ID4+DQo+ID4+IFlvdXIgcGF0Y2ggaGFzIHN0eWxlIHBy
b2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycw0KPiA+PiBhcmUg
ZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUNCj4gPj4g
Q0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4NCj4gPg0KPiA+IFRoaXMgc3R5bGUgd2FybmluZyBh
cHBlYXJzIHRvIGJlIHNwdXJpb3VzLg0KPiANCj4gWWVwLCBhbmQgaXQncyBiZWNhdXNlIHhlbmZv
cmVpZ25tZW1vcnlfaGFuZGxlIGRvZXNuJ3QgZm9sbG93IG91ciB1c3VhbA0KPiBjb252ZW50aW9u
cyBmb3IgYSB0eXBlIG5hbWUuICBTZWUgY29tbWl0IDVhYzA2N2EgaWYgeW91IHdhbnQgdG8gYWRk
IGl0DQo+IHRvIHRoZSBsaXN0IG9mIHdoaXRlbGlzdGVkIGV4Y2VwdGlvbiB0eXBlIG5hbWVzLCB0
byBzaWxlbmNlIG1lc3NhZ2VzDQo+IGxpa2UgdGhpcy4NCg0KVGhhbmtzIEVyaWMuIEknbGwgc2Vu
ZCBhIHYyIHNlcmllcyB3aXRoIGEgc3VpdGFibGUgYWRkaXRpb25hbCBwYXRjaC4NCg0KICBDaGVl
cnMsDQoNCiAgICBQYXVsDQoNCj4gDQo+IC0tDQo+IEVyaWMgQmxha2UsIFByaW5jaXBhbCBTb2Z0
d2FyZSBFbmdpbmVlcg0KPiBSZWQgSGF0LCBJbmMuICAgICAgICAgICArMS05MTktMzAxLTMyNjYN
Cj4gVmlydHVhbGl6YXRpb246ICBxZW11Lm9yZyB8IGxpYnZpcnQub3JnDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
