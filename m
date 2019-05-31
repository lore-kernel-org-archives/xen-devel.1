From: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>
Subject: Re: [PATCH 0/9] Per vcpu vm_event channels
Date: Fri, 31 May 2019 07:07:53 +0000
Message-ID: <8ba4014e1f8afb7391b211dcca8956ae011407d5.camel@bitdefender.com>
References: <cover.1559224640.git.ppircalabu@bitdefender.com>
 <CABfawh=ggx3sVzffdXD==Pr6kKmMH94TOqia2EnYqrXx+r-HFA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1Y3R=T7=bitdefender.com=ppircalabu@srs-us1.protection.inumbo.net>)
 id 1hWbdt-0006s7-Ff
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 07:07:57 +0000
In-Reply-To: <CABfawh=ggx3sVzffdXD==Pr6kKmMH94TOqia2EnYqrXx+r-HFA@mail.gmail.com>
Content-Language: en-US
Content-ID: <57B8887CC4BA8948A0B6218CBC1C92F0@eurprd02.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCAyMDE5LTA1LTMwIGF0IDA4OjI3IC0wNzAwLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6
DQo+IE9uIFRodSwgTWF5IDMwLCAyMDE5IGF0IDc6MTggQU0gUGV0cmUgUGlyY2FsYWJ1DQo+IDxw
cGlyY2FsYWJ1QGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6DQo+ID4gDQo+ID4gVGhpcyBwYXRjaHNl
dCBhZGRzIGEgbmV3IG1lY2hhbmlzbSBvZiBzZW5kaW5nIHN5bmNocm9ub3VzIHZtX2V2ZW50DQo+
ID4gcmVxdWVzdHMgYW5kIGhhbmRsaW5nIHZtX2V2ZW50IHJlc3BvbnNlcyB3aXRob3V0IHVzaW5n
IGEgcmluZy4NCj4gPiBBcyBlYWNoIHN5bmNocm9ub3VzIHJlcXVlc3QgcGF1c2VzIHRoZSB2Y3B1
IHVudGlsIHRoZSBjb3JyZXNwb25kaW5nDQo+ID4gcmVzcG9uc2UgaXMgaGFuZGxlZCwgaXQgY2Fu
IGJlIHN0b3JlZCBpbiBhIHNsb3R0ZWQgbWVtb3J5IGJ1ZmZlcg0KPiA+IChvbmUgcGVyIHZjcHUp
IHNoYXJlZCBiZXR3ZWVuIHRoZSBoeXBlcnZpc29yIGFuZCB0aGUgY29udHJvbGxpbmcNCj4gPiBk
b21haW4uDQo+ID4gDQo+ID4gVGhlIG1haW4gYWR2YW50YWdlcyBvZiB0aGlzIGFwcHJvYWNoIGFy
ZToNCj4gPiAtIHRoZSBhYmlsaXR5IHRvIGR5bmFtaWNhbHkgYWxsb2NhdGUgdGhlIG5lY2Vzc2Fy
eSBtZW1vcnkgdXNlZCB0bw0KPiA+IGhvbGQNCj4gPiB0aGUgcmVxdWVzdHMvcmVzcG9uc2VzICh0
aGUgc2l6ZSBvZg0KPiA+IHZtX2V2ZW50X3JlcXVlc3RfdC92bV9ldmVudF9yZXNwb25zZV90DQo+
ID4gY2FuIGdyb3cgdW5yZXN0cmljdGVkIGJ5IHRoZSByaW5nJ3Mgb25lIHBhZ2UgbGltaXRhdGlv
bikNCj4gPiAtIHRoZSByaW5nJ3Mgd2FpdHF1ZXVlIGxvZ2ljIGlzIHVubmVjZXNzYXJ5IGluIHRo
aXMgY2FzZSBiZWNhdXNlDQo+ID4gdGhlDQo+ID4gdmNwdSBzZW5kaW5nIHRoZSByZXF1ZXN0IGlz
IGJsb2NrZWQgdW50aWwgYSByZXNwb25zZSBpcyByZWNlaXZlZC4NCj4gDQo+IEhpIFBldHJlLA0K
PiBjb3VsZCB5b3UgcHVzaCB0aGlzIHNlcmllcyBhcyBhIGdpdCBicmFuY2ggc29tZXdoZXJlPw0K
PiANCj4gVGhhbmtzLA0KPiBUYW1hcw0KDQpIaSBUYW1hcywNCg0KSSd2ZSBwdXNoZWQgdGhlIGNo
YW5nZXMgdG8gDQpodHRwczovL2dpdGh1Yi5jb20vcGV0cmVwaXJjYWxhYnUveGVuL3RyZWUvdm1f
ZXZlbnRfbmcvZGV2ZWwNCg0KVGhhbmsteW91IHZlcnkgbXVjaCBmb3IgeW91ciBzdXBwb3J0LA0K
UGV0cmUNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
