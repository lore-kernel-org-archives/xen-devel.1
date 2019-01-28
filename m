From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH 1/6] x86: stop handling MSR_IA32_BNDCFGS
 save/restore in implementation code
Date: Mon, 28 Jan 2019 02:18:13 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19C914FBC@SHSMSX104.ccr.corp.intel.com>
References: <20190107120258.17897-1-paul.durrant@citrix.com>
 <20190107120258.17897-2-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eaaH=QE=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1gnwVA-0000TQ-Cq
 for xen-devel@lists.xenproject.org; Mon, 28 Jan 2019 02:18:20 +0000
In-Reply-To: <20190107120258.17897-2-paul.durrant@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, "Nakajima, Jun" <jun.nakajima@intel.com>, Jan Beulich <jbeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBQYXVsIER1cnJhbnQgW21haWx0bzpwYXVsLmR1cnJhbnRAY2l0cml4LmNvbV0NCj4g
U2VudDogTW9uZGF5LCBKYW51YXJ5IDcsIDIwMTkgODowMyBQTQ0KPiANCj4gU2F2aW5nIGFuZCBy
ZXN0b3JpbmcgdGhlIHZhbHVlIG9mIHRoaXMgTVNSIGlzIGN1cnJlbnRseSBoYW5kbGVkIGJ5DQo+
IGltcGxlbWVudGF0aW9uLXNwZWNpZmljIGNvZGUgZGVzcGl0ZSBpdCBiZWluZyBhcmNoaXRlY3R1
cmFsLiBUaGlzIHBhdGNoDQo+IG1vdmVzIGhhbmRsaW5nIG9mIGFjY2Vzc2VzIHRvIHRoaXMgTVNS
IGZyb20gaHZtLmMgaW50byB0aGUgbXNyLmMsIHRodXMNCj4gYWxsb3dpbmcgdGhlIGNvbW1vbiBN
U1Igc2F2ZS9yZXN0b3JlIGNvZGUgdG8gaGFuZGxlIGl0Lg0KPiANCj4gVGhpcyBwYXRjaCBhbHNv
IGNoYW5nZXMgaHZtX2dldC9zZXRfZ3Vlc3RfYm5kY2ZncygpIHRvIGNoZWNrIENQVUlEIHBvbGlj
eQ0KPiBmb3IgdGhlIGFwcHJvcHJpYXRlIGZlYXR1cmUsIHJhdGhlciB0aGFuIGhhcmR3YXJlLCBh
bmQgYWxzbyByZS13b3Jrcw0KPiB0aGUgZ2V0L3NldF9ndWVzdF9ibmRjZmdzKCkgaHZtX2Z1bmNz
IHNvIHRoZXkgYXJlIG5vIGxvbmdlciBib29sZWFuLg0KPiBVc2VzDQo+IG9mIHU2NCBhcmUgYWxz
byBjb252ZXJ0ZWQgdG8gdWludDY0X3QuDQo+IA0KPiBOT1RFOiBCZWNhdXNlIHZteF9nZXQvc2V0
X2d1ZXN0X2JuZGNmZ3MoKSBjYWxsIHZteF92bWNzX2VudGVyKCksIHRoZQ0KPiAgICAgICBzdHJ1
Y3QgdmNwdSBwb2ludGVyIHBhc3NlZCBpbiBjYW5ub3QgYmUgY29uc3QuDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPg0KDQpSZXZpZXdl
ZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+DQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
