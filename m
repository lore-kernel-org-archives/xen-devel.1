From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Subject: Re: [PATCH v7] arch/x86: Add registers to vm_event
Date: Fri, 2 Nov 2018 14:06:16 +0000
Message-ID: <797e265b-2b54-e77e-a8e3-75739d8ba2b7@bitdefender.com>
References: <20181102125419.26641-1-aisaila@bitdefender.com>
 <5BDC4A7802000078001F7374@prv1-mh.provo.novell.com>
 <c4997ab4-e95f-8f9a-438e-52fc08d6b18a@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zsq6=nn=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1gIa5d-0002q4-LJ
 for xen-devel@lists.xenproject.org; Fri, 02 Nov 2018 14:06:21 +0000
In-Reply-To: <c4997ab4-e95f-8f9a-438e-52fc08d6b18a@citrix.com>
Content-Language: en-US
Content-ID: <EAE0A1569866024EAAAD28396D6F3A58@eurprd02.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>
List-Id: xen-devel@lists.xenproject.org

DQoNCk9uIDAyLjExLjIwMTggMTY6MDAsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDAyLzEx
LzE4IDEzOjAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+IE9uIDAyLjExLjE4IGF0IDEzOjU0
LCA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOg0KPj4+IEBAIC0xOTEsOSArMTk3LDI2
IEBAIHN0cnVjdCB2bV9ldmVudF9yZWdzX3g4NiB7DQo+Pj4gICAgICAgdWludDY0X3QgbXNyX2Vm
ZXI7DQo+Pj4gICAgICAgdWludDY0X3QgbXNyX3N0YXI7DQo+Pj4gICAgICAgdWludDY0X3QgbXNy
X2xzdGFyOw0KPj4+ICsgICAgdWludDMyX3QgY3NfYmFzZTsNCj4+PiArICAgIHVpbnQzMl90IHNz
X2Jhc2U7DQo+Pj4gKyAgICB1aW50MzJfdCBkc19iYXNlOw0KPj4+ICsgICAgdWludDMyX3QgZXNf
YmFzZTsNCj4+PiAgICAgICB1aW50NjRfdCBmc19iYXNlOw0KPj4+ICAgICAgIHVpbnQ2NF90IGdz
X2Jhc2U7DQo+Pj4gLSAgICB1aW50MzJfdCBjc19hcmJ5dGVzOw0KPj4+ICsgICAgc3RydWN0IHZt
X2V2ZW50X3g4Nl9zZWxlY3Rvcl9yZWcgY3M7DQo+Pj4gKyAgICBzdHJ1Y3Qgdm1fZXZlbnRfeDg2
X3NlbGVjdG9yX3JlZyBzczsNCj4+PiArICAgIHN0cnVjdCB2bV9ldmVudF94ODZfc2VsZWN0b3Jf
cmVnIGRzOw0KPj4+ICsgICAgc3RydWN0IHZtX2V2ZW50X3g4Nl9zZWxlY3Rvcl9yZWcgZXM7DQo+
Pj4gKyAgICBzdHJ1Y3Qgdm1fZXZlbnRfeDg2X3NlbGVjdG9yX3JlZyBmczsNCj4+PiArICAgIHN0
cnVjdCB2bV9ldmVudF94ODZfc2VsZWN0b3JfcmVnIGdzOw0KPj4+ICsgICAgdWludDY0X3Qgc2hh
ZG93X2dzOw0KPj4+ICsgICAgdWludDY0X3QgZHI2Ow0KPj4+ICsgICAgdWludDE2X3QgY3Nfc2Vs
Ow0KPj4+ICsgICAgdWludDE2X3Qgc3Nfc2VsOw0KPj4+ICsgICAgdWludDE2X3QgZHNfc2VsOw0K
Pj4+ICsgICAgdWludDE2X3QgZXNfc2VsOw0KPj4+ICsgICAgdWludDE2X3QgZnNfc2VsOw0KPj4+
ICsgICAgdWludDE2X3QgZ3Nfc2VsOw0KPj4+ICAgICAgIHVpbnQzMl90IF9wYWQ7DQo+Pj4gICB9
Ow0KPj4gRG8gd2UgcmVhbGx5IG5lZWQgZHI2IGJlIDY0IGJpdHMgd2lkZT8NCj4gDQo+IEdpdmVu
IHRoYXQgdGhlIG90aGVyICVjciBhbmQgJWRyIHJlZ2lzdGVycyBhcmUgNjRiaXQsIEknZCBhcmd1
ZSBpbg0KPiBmYXZvdXIgb2YgY29uc2lzdGVuY3kuDQo+IA0KDQpJIHdpbGwga2VlcCBpdCA2NCBi
aXQgYW5kIG1vdmUgaXQgbmV4dCB0byBkcjcuDQoNCn5BbGV4DQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
