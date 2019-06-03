From: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>
Subject: Re: [PATCH 6/9] vm_event: Move struct vm_event_domain
 to vm_event.c
Date: Mon, 3 Jun 2019 11:28:18 +0000
Message-ID: <57270ced911c1882b12347b1102140f581c3dcfc.camel@bitdefender.com>
References: <cover.1559224640.git.ppircalabu@bitdefender.com>
 <d50c5737dcff7f3225fe507322bb10d104a6e6b4.1559224640.git.ppircalabu@bitdefender.com>
 <91ee93af-e42b-064f-1e7e-6f08a40d16c1@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=b4kp=UC=bitdefender.com=ppircalabu@srs-us1.protection.inumbo.net>)
 id 1hXl8X-0005F0-MM
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 11:28:21 +0000
In-Reply-To: <91ee93af-e42b-064f-1e7e-6f08a40d16c1@citrix.com>
Content-Language: en-US
Content-ID: <2DD40D9A9F0CA8469980310D1A1F333A@eurprd02.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCAyMDE5LTA1LTMxIGF0IDE2OjQ0IC0wNzAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0K
PiBPbiAzMC8wNS8yMDE5IDA3OjE4LCBQZXRyZSBQaXJjYWxhYnUgd3JvdGU6DQo+ID4gVGhlIHZt
X2V2ZW50X2RvbWFpbiBtZW1iZXJzIGFyZSBub3QgYWNjZXNzZWQgb3V0c2lkZSB2bV9ldmVudC5j
IHNvDQo+ID4gaXQncw0KPiA+IGJldHRlciB0byBoaWRlIGRlIGltcGxlbWVudGF0aW9uIGRldGFp
bHMuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogUGV0cmUgUGlyY2FsYWJ1IDxwcGlyY2FsYWJ1
QGJpdGRlZmVuZGVyLmNvbT4NCj4gDQo+IEFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPg0KPiANCj4gQXJlIHRoZXJlIGFueSBmaWxlcyB3aGljaCBub3cg
bm8gbG9uZ2VyIG5lZWQgdG8gaW5jbHVkZSBzY2hlZC5oID8gDQo+IChQcm9iYWJseSBub3QsIGJ1
dCBpdCBpcyB3b3J0aCBjaGVja2luZykNCj4gDQo+IF9fX19fX19fX19fX19fX19fX19fX19fXw0K
PiBUaGlzIGVtYWlsIHdhcyBzY2FubmVkIGJ5IEJpdGRlZmVuZGVyDQoNClRoZSAieGVuL3NjaGVk
LmggaGVhZGVyIGNhbiBiZSByZW1vdmVkIGZyb20gdGhlICJ4ZW4vdm1fZXZlbnQuaCINCmluY2x1
ZGUgbGlzdCBieSBmdyBkZWNsYXJpbmcgInN0cnVjdCBkb21haW4iIGFuZCAic3RydWN0DQp2bV9l
dmVudF9kb21haW4iLg0KVGhlIHZtX2V2ZW50IGNsaWVudHMgKG1vbml0b3IsIG1lbV9zaGFyaW5n
LCBtZW1fcGFnaW5nKSBuZWVkIHRvIGluY2x1ZGUNCiJzY2hlZC5oIiBiZWNhdXNlIHRoZXkgbmVl
ZCBhY2Nlc3MgdG8gdGhlICJzdHJ1Y3QgZG9tYWluIiBkZXRhaWxzLg0KDQpNYW55IHRoYW5rcywN
ClBldHJlDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
