From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [BUG] kernel bug encountered at
 drivers/net/xen-netback/netback.c:430!
Date: Mon, 8 Jan 2018 09:35:48 +0000
Message-ID: <6f58d8db2c3a40248c447ff8f7f57067@AMSPEX02CL03.citrite.net>
References: <5a3ca8ee.4426620a.b956d.1799@mx.google.com>
 <352b0317-cfc5-1ef4-fbd0-2b2879f9712e@suse.com>
 <5a3d6c93.886f620a.2522d.c2fb@mx.google.com>
 <23eb0f3f-590d-f03a-f971-65e86c52fbe4@ark-net.org>
 <5a4546b1.55da620a.5c435.4b4b@mx.google.com>
 <3f860d32831940e7aa40d97979155b6e@AMSPEX02CL03.citrite.net>
 <20180103203337.GA79570@elch.exwg.net>
 <3104994914c94a26baed6195f486c03f@AMSPEX02CL03.citrite.net>
 <20180107221904.GA78680@elch.exwg.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=d1vm=ed=citrix.com=prvs=539a6d6bf=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1eYTqW-0002Oa-Dm
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2018 09:35:56 +0000
In-Reply-To: <20180107221904.GA78680@elch.exwg.net>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Christoph Moench-Tegeder' <cmt@burggraben.net>
Cc: 'Michael Collins' <mike@ark-net.org>, 'Juergen Gross' <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>, 'Alex Braunegg' <alex.braunegg@gmail.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiAnQ2hyaXN0b3BoIE1vZW5jaC1U
ZWdlZGVyJyBbbWFpbHRvOmNtdEBidXJnZ3JhYmVuLm5ldF0NCj4gU2VudDogMDcgSmFudWFyeSAy
MDE4IDIyOjE5DQo+IFRvOiBQYXVsIER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPg0K
PiBDYzogJ01pY2hhZWwgQ29sbGlucycgPG1pa2VAYXJrLW5ldC5vcmc+OyAnSnVlcmdlbiBHcm9z
cycNCj4gPGpncm9zc0BzdXNlLmNvbT47IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+OyAn
QWxleCBCcmF1bmVnZycNCj4gPGFsZXguYnJhdW5lZ2dAZ21haWwuY29tPjsgeGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBbQlVHXSBrZXJu
ZWwgYnVnIGVuY291bnRlcmVkIGF0IGRyaXZlcnMvbmV0L3hlbi0NCj4gbmV0YmFjay9uZXRiYWNr
LmM6NDMwIQ0KPiANCj4gIyMgUGF1bCBEdXJyYW50IChQYXVsLkR1cnJhbnRAY2l0cml4LmNvbSk6
DQo+IA0KPiA+ID4gSSBjb3VsZCB0cnkgYSBuZXcga2VybmVsIChLUFRJLCB5YXkhKSB3aXRoIHRo
YXQgIm1pbGRseSBzdXNwaWNpb3VzIiBjb21taXQNCj4gPiA+IGNjODczN2E1ZmU5MDUxYjdmYTA1
MmIwOGM1N2RkYjlmNTM5YzM4OWEgcmV2ZXJ0ZWQgb24gdGhlIHdlZWtlbmQNCj4gYW5kDQo+ID4g
PiByZXBvcnQgYmFjayAoanVzdCB0byBydWxlIHRoYXQgb3V0IC0gbGlrZSB5b3UsIEkgZG9uJ3Qg
cmVhbGx5IGJlbGlldmUNCj4gPiA+IHRoYXQgdGhpcyBpcyB0aGUgY2F1c2UpLg0KPiA+ID4gRm9y
IHRoZSByZWNvcmQsIEknbSBzdGlsbCBydW5uaW5nIDQuMTMuMTYgb24gdGhlIERvbTAgKHRoYXQn
cyB0aGUgbGFzdA0KPiA+ID4gd29ya2luZyBEb20wIGtlcm5lbCkuDQo+ID4NCj4gPiBUaGFua3Mu
IFdlbGwsIHRoYXQncyB0aGUgb25seSBuZXRiYWNrIGNvbW1pdCB0aGF0J3MgaW4gbWFzdGVyIGJ1
dCBub3QgaW4NCj4gPiA0LjEzLjE2IHNvIGl0IHdvdWxkIGJlIHVzZWZ1bCB0byBjb25jbHVzaXZl
bHkgcnVsZSB0aGF0IG91dCBhcyBhIGNhdXNlLg0KPiANCj4gRnVubnkgdGhpbmc6IHdpdGggdGhh
dCBjb21taXQgcmV2ZXJ0ZWQsIEknbSBydW5uaW5nIDQuMTQuMTIgb24gbXkgRG9tMC4NCj4gVGhh
dCdzIGhvbGRpbmcgbXVjaCBsb25nZXIgdGhhbiBhbnkgNC40IGtlcm5lbCBvbiB0aGF0IGhvc3Qg
YmVmb3JlLg0KPiBUaGF0J3MgaW50ZXJlc2luZywgYXMgdGhlIGNyYXNoaW5nIGNvZGUgbG9va3Mg
bW9yZSBjb3JyZWN0IChhdCBsZWFzdA0KPiBmb3IgbWUgYW5kIHNvbWUgY29tcGlsZXIuLi4pLCBh
bmQgdGhlIGNoYW5nZSBpcyByYXRoZXIgc21hbGwuDQo+IA0KDQpZZXMsIHRoYXQgaXMgdmVyeSBz
dHJhbmdlLiBUaGFua3MgZm9yIHRoZSBpbmZvLg0KDQpDaGVlcnMsDQoNCiAgUGF1bA0KDQo+IFJl
Z2FyZHMsDQo+IENocmlzdG9waA0KPiANCj4gLS0NCj4gU3BhcmUgU3BhY2UNCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
