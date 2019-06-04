From: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>
Subject: Re: [PATCH 2/9] vm_event: Define VM_EVENT type
Date: Tue, 4 Jun 2019 10:12:02 +0000
Message-ID: <be318d96d9c237942fa40c313e5e43509d49f066.camel@bitdefender.com>
References: <cover.1559224640.git.ppircalabu@bitdefender.com>
 <9cde4926b56fa05afffee270e5e28a3b9bd830d9.1559224640.git.ppircalabu@bitdefender.com>
 <9616b56c-7acf-1abf-1c63-8a1009744dac@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tugb=UD=bitdefender.com=ppircalabu@srs-us1.protection.inumbo.net>)
 id 1hY6QM-0004Zd-2W
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 10:12:10 +0000
In-Reply-To: <9616b56c-7acf-1abf-1c63-8a1009744dac@citrix.com>
Content-Language: en-US
Content-ID: <549A3DD44BE97E43B94D068B9825AF28@eurprd02.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCAyMDE5LTA1LTMxIGF0IDE2OjI2IC0wNzAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0K
PiBPbiAzMC8wNS8yMDE5IDA3OjE4LCBQZXRyZSBQaXJjYWxhYnUgd3JvdGU6DQo+ID4gDQo+IA0K
PiBUaGlzIGlzIGFuIGludGVybmFsIGhlbHBlciwgc28gY2FuIHJlYXNvbmFibHkgYmUgZXhwZWN0
ZWQgdG8gbm90IGJlDQo+IGNhbGxlZCB3aXRoIGp1bmssIGFuZCBjYW4gZG8gYXdheSB3aXRoIHRo
ZSBwYXJhbSBwb2ludGVyLg0KPiANCj4gU29tZXRoaW5nIGxpa2UNCj4gDQo+IHN0YXRpYyBpbnQg
eGNfdm1fZXZlbnRfcmluZ19wZm5fcGFyYW0odW5zaWduZWQgaW50IHR5cGUpDQo+IHsNCj4gICAg
IHN3aXRjaCAoIHR5cGUgKQ0KPiAgICAgew0KPiAgICAgICAgIGNhc2UgWEVOX1ZNX0VWRU5UX1RZ
UEVfUEFHSU5HOg0KPiAgICAgICAgICAgICByZXR1cm4gSFZNX1BBUkFNX1BBR0lOR19SSU5HX1BG
TjsNCj4gLi4uDQo+ICAgICAgICAgZGVmYXVsdDoNCj4gICAgICAgICAgICAgcmV0dXJuIC1FSU5W
QUw7DQo+ICAgICB9DQo+IH0NCj4gDQo+IHdpbGwgd29yayBmaW5lIGJlY2F1c2UgSFZNX1BBUkFN
XyogYXJlIGFsbCB0aW55IHVuc2lnbmVkIGludGVnZXJzIGluDQo+IHByYWN0aWNlLiAgSXQgYWxz
byBoYXMgYSBtb3JlIHNlbnNpYmxlIEFQSSBmb3IgdGhlIGNhbGxlci4NCg0KSSB0aGluayBpbiB0
aGUgZW5kIGl0J3MgYmVzdCBqdXN0IHRvIG1vdmUgdGhlIGhlbHBlciB0bw0KeGNfdm1fZXZlbnRf
ZW5hYmxlIChpbmxpbmUgdGhlIHN3aXRjaCkgYXMgaXQgaXMgbm90IHVzZSBvdXRzaWRlIGl0Lg0K
DQo+IA0KPiA+IGluZGV4IDE5NDg2ZDUuLjE5MjgxZmEgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2lu
Y2x1ZGUvcHVibGljL2RvbWN0bC5oDQo+ID4gKysrIGIveGVuL2luY2x1ZGUvcHVibGljL2RvbWN0
bC5oDQo+ID4gQEAgLTc2OSw4MCArNzY5LDE4IEBAIHN0cnVjdCB4ZW5fZG9tY3RsX2dkYnN4X2Rv
bXN0YXR1cyB7DQo+ID4gICAqIFZNIGV2ZW50IG9wZXJhdGlvbnMNCj4gPiAgICovDQo+ID4gIA0K
PiA+IA0KPiA+IC0NCj4gPiAtLyogVXNlIGZvciB0ZWFyZG93bi9zZXR1cCBvZiBoZWxwZXI8LT5o
eXBlcnZpc29yIGludGVyZmFjZSBmb3INCj4gPiBwYWdpbmcsDQo+ID4gLSAqIGFjY2VzcyBhbmQg
c2hhcmluZy4qLw0KPiA+ICBzdHJ1Y3QgeGVuX2RvbWN0bF92bV9ldmVudF9vcCB7DQo+ID4gLSAg
ICB1aW50MzJfdCAgICAgICBvcDsgICAgICAgICAgIC8qIFhFTl9WTV9FVkVOVF8qICovDQo+ID4g
LSAgICB1aW50MzJfdCAgICAgICBtb2RlOyAgICAgICAgIC8qIFhFTl9ET01DVExfVk1fRVZFTlRf
T1BfKiAqLw0KPiA+ICsgICAgdWludDMyX3QgICAgICAgIG9wOyAgICAgICAgICAgLyogWEVOX1ZN
X0VWRU5UXyogKi8NCj4gPiArICAgIHVpbnQzMl90ICAgICAgICB0eXBlOyAgICAgICAgIC8qIFhF
Tl9WTV9FVkVOVF9UWVBFXyogKi8NCj4gDQo+IFdoeSBkaWQgdGhlIHZlcnRpY2FsIGFsaWdubWVu
dCBjaGFuZ2U/DQoNClRoZSBpbml0aWFsIHZlcnRpY2FsIGFsaWdubWVudCB3YXMgbm90IDQgc3Bh
Y2VzIChJIHdpbGwgcmV2ZXJ0IGl0IGJhY2sNCnRvIHRoZSB3YXkgaXQgd2FzIGluIG9yZGVyIHRv
IHNpbXBsaWZ5IHRoZSByZXZpZXcgICkNCj4gDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
