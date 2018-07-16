From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH] x86/HVM: improve a few state load checks
Date: Mon, 16 Jul 2018 14:09:06 +0000
Message-ID: <fe4a878264854927a868b6073338b391@AMSPEX02CL02.citrite.net>
References: <5B4CA48002000078001D470D@prv1-mh.provo.novell.com>
 <25ec81ac057b4143859e1479bfa32d49@AMSPEX02CL02.citrite.net>
 <80d53b0d-e736-8d5e-f89d-9cbcd20fe9f4@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=tukk=ka=citrix.com=prvs=728920bf3=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1ff4Bb-0003JF-Ag
 for xen-devel@lists.xenproject.org; Mon, 16 Jul 2018 14:09:11 +0000
In-Reply-To: <80d53b0d-e736-8d5e-f89d-9cbcd20fe9f4@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, 'Jan Beulich' <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbmRyZXcgQ29vcGVyDQo+IFNl
bnQ6IDE2IEp1bHkgMjAxOCAxNTowOA0KPiBUbzogUGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRA
Y2l0cml4LmNvbT47ICdKYW4gQmV1bGljaCcNCj4gPEpCZXVsaWNoQHN1c2UuY29tPjsgeGVuLWRl
dmVsIDx4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0hdIHg4Ni9IVk06IGltcHJvdmUgYSBmZXcgc3RhdGUgbG9hZCBjaGVja3MNCj4gDQo+IE9uIDE2
LzA3LzE4IDE1OjA1LCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+ID4+IC0tLSBhL3hlbi9hcmNoL3g4
Ni9odm0vaHZtLmMNCj4gPj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9odm0uYw0KPiA+PiBAQCAt
OTc2LDE0ICs5NzYsMTMgQEAgdW5zaWduZWQgbG9uZyBodm1fY3I0X2d1ZXN0X3ZhbGlkX2JpdHMo
Yw0KPiA+Pg0KPiA+PiAgc3RhdGljIGludCBodm1fbG9hZF9jcHVfY3R4dChzdHJ1Y3QgZG9tYWlu
ICpkLCBodm1fZG9tYWluX2NvbnRleHRfdA0KPiAqaCkNCj4gPj4gIHsNCj4gPj4gLSAgICBpbnQg
dmNwdWlkOw0KPiA+PiArICAgIHVuc2lnbmVkIGludCB2Y3B1aWQgPSBodm1fbG9hZF9pbnN0YW5j
ZShoKTsNCj4gPj4gICAgICBzdHJ1Y3QgdmNwdSAqdjsNCj4gPj4gICAgICBzdHJ1Y3QgaHZtX2h3
X2NwdSBjdHh0Ow0KPiA+PiAgICAgIHN0cnVjdCBzZWdtZW50X3JlZ2lzdGVyIHNlZzsNCj4gPj4g
ICAgICBjb25zdCBjaGFyICplcnJzdHI7DQo+ID4+DQo+ID4+ICAgICAgLyogV2hpY2ggdmNwdSBp
cyB0aGlzPyAqLw0KPiA+PiAtICAgIHZjcHVpZCA9IGh2bV9sb2FkX2luc3RhbmNlKGgpOw0KPiA+
PiAgICAgIGlmICggdmNwdWlkID49IGQtPm1heF92Y3B1cyB8fCAodiA9IGQtPnZjcHVbdmNwdWlk
XSkgPT0gTlVMTCApDQo+ID4gVGhpcyBvcGVuIGNvZGVkIHBhdHRlcm46DQo+ID4NCj4gPiB2Y3B1
aWQgPSBodm1fbG9hZF9pbnN0YW5jZShoKTsNCj4gPiBpZiAoIHZjcHVpZCA+PSBkLT5tYXhfdmNw
dXMgfHwgKHYgPSBkLT52Y3B1W3ZjcHVpZF0pID09IE5VTEwgKQ0KPiA+IHsgLi4uDQo+ID4NCj4g
PiBzZWVtcyB0byBiZSByZXBlYXRlZCBhbiBhd2Z1bCBsb3QuIElzIGl0IHRpbWUsIHBlcmhhcHMs
IHRvIGludHJvZHVjZSBhDQo+IGhlbHBlciBmdW5jdGlvbiB0aGF0IGluY29ycG9yYXRlcyB0aGUg
Y2hlY2s/DQo+IA0KPiBJbiBzb21lIGNvcGlvdXMgZnJlZSB0aW1lIHdoZW4gSSBjYW4gcG9zdCB2
MiBvZiBteSAiZml4IG1heF92Y3B1cyINCj4gc2VyaWVzLCBhbGwgb2YgdGhpcyBsb2dpYyAoYW5k
IG11Y2ggbW9yZSkgd2lsbCBiZWNvbWUgcmVkdW5kYW50IGFuZCBnZXQNCj4gY3VsbGVkLg0KPiAN
Cj4gSSByZWFsbHkgd291bGRuJ3Qgd2FzdGUgdGltZSByZS1mYWN0b3JpbmcgaXQgYXQgdGhpcyBw
b2ludC4NCg0KT2suIElmIHRoYXQncyB0aGUgY2FzZSB0aGVuLi4uDQoNClJldmlld2VkLWJ5OiBQ
YXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPg0KDQo+IA0KPiB+QW5kcmV3DQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
