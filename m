From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH 2/2] x86/hvm: Corrections to RDTSCP
 intercept handling
Date: Mon, 3 Dec 2018 11:23:56 +0000
Message-ID: <caa6a889d7f04d8fa51dd0cb184db4d2@AMSPEX02CL03.citrite.net>
References: <1543597640-28870-1-git-send-email-andrew.cooper3@citrix.com>
 <1543597640-28870-3-git-send-email-andrew.cooper3@citrix.com>
 <2b5424fdc1be4a73b4ede017f4a9f34f@AMSPEX02CL03.citrite.net>
 <cd7fe068-e127-6ac2-bd23-2b0dba47ec36@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <cd7fe068-e127-6ac2-bd23-2b0dba47ec36@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Jun Nakajima <jun.nakajima@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbmRyZXcgQ29vcGVyDQo+IFNl
bnQ6IDAzIERlY2VtYmVyIDIwMTggMTE6MTQNCj4gVG86IFBhdWwgRHVycmFudCA8UGF1bC5EdXJy
YW50QGNpdHJpeC5jb20+OyBYZW4tZGV2ZWwgPHhlbi0NCj4gZGV2ZWxAbGlzdHMueGVuLm9yZz4N
Cj4gQ2M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT47IFdlaSBMaXUgPHdlaS5saXUy
QGNpdHJpeC5jb20+OyBSb2dlcg0KPiBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsg
SnVuIE5ha2FqaW1hIDxqdW4ubmFrYWppbWFAaW50ZWwuY29tPjsNCj4gS2V2aW4gVGlhbiA8a2V2
aW4udGlhbkBpbnRlbC5jb20+OyBCb3JpcyBPc3Ryb3Zza3kNCj4gPGJvcmlzLm9zdHJvdnNreUBv
cmFjbGUuY29tPjsgU3VyYXZlZSBTdXRoaWt1bHBhbml0DQo+IDxzdXJhdmVlLnN1dGhpa3VscGFu
aXRAYW1kLmNvbT47IEJyaWFuIFdvb2RzIDxicmlhbi53b29kc0BhbWQuY29tPjsNCj4gSnVlcmdl
biBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDIvMl0geDg2
L2h2bTogQ29ycmVjdGlvbnMgdG8gUkRUU0NQIGludGVyY2VwdCBoYW5kbGluZw0KPiANCj4gT24g
MDMvMTIvMjAxOCAwOToxNywgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiA+PiBkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYw0K
PiA+PiBpbmRleCAzNjVlZWIyLi5hOWY5YjliIDEwMDY0NA0KPiA+PiAtLS0gYS94ZW4vYXJjaC94
ODYvaHZtL3ZteC92bXguYw0KPiA+PiArKysgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYw0K
PiA+PiBAQCAtMzU4OSw2ICszNTg5LDcgQEAgdm9pZCB2bXhfdm1leGl0X2hhbmRsZXIoc3RydWN0
IGNwdV91c2VyX3JlZ3MNCj4gKnJlZ3MpDQo+ID4+ICAgICAgdW5zaWduZWQgbG9uZyBleGl0X3F1
YWxpZmljYXRpb24sIGV4aXRfcmVhc29uLCBpZHR2X2luZm8sDQo+IGludHJfaW5mbyA9DQo+ID4+
IDA7DQo+ID4+ICAgICAgdW5zaWduZWQgaW50IHZlY3RvciA9IDAsIG1vZGU7DQo+ID4+ICAgICAg
c3RydWN0IHZjcHUgKnYgPSBjdXJyZW50Ow0KPiA+PiArICAgIHN0cnVjdCBkb21haW4gKmN1cnJk
ID0gdi0+ZG9tYWluOw0KPiA+IC4uLiBmb2xsb3dpbmcgdGhlIHVzdWFsIHJ1bGVzLCB5b3Ugc2hv
dWxkIG5vdyBjb252ZXJ0IGFsbCB1c2VzIG9mIHYtDQo+ID5kb21haW4gaW4gdGhpcyBmdW5jdGlv
biB0byB1c2UgY3VycmQuDQo+IA0KPiBJZiB0aGlzIHdlcmUgbmV3IGRldmVsb3BtZW50IHdvcmsg
dGhlbiBwZXJoYXBzIChhbHRob3VnaCBpdCB3b3VsZCB0YWtlIGENCj4gc2VyaWVzIHRvIGNsZWFu
IHZteF92bWV4aXRfaGFuZGxlcigpIHVwIHRvIHN0eWxlKS4NCj4gDQo+IEluIHRoaXMgY2FzZSBo
b3dldmVyLCB0aGUgcGF0Y2ggbmVlZHMgYmFja3BvcnRpbmcgdG8gYWxsIHRoZSBzdGFibGUNCj4g
dHJlZXMsIGF0IHdoaWNoIHBvaW50IG1pbmltdW0gcGVydHVyYmFuY2UgaXMgdGhlIG1vc3QgaW1w
b3J0YW50IGFzcGVjdC4NCg0KRmFpciBlbm91Z2guDQoNCiAgUGF1bA0KDQo+IA0KPiB+QW5kcmV3
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
