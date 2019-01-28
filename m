From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH for-4.12] x86/p2m: Drop erroneous
 #VE-enabled check in ept_set_entry()
Date: Mon, 28 Jan 2019 01:41:12 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19C914F19@SHSMSX104.ccr.corp.intel.com>
References: <1548354483-5021-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1548354483-5021-1-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Juergen Gross <jgross@suse.com>, Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, "Nakajima, Jun" <jun.nakajima@intel.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Jan Beulich <JBeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBBbmRyZXcgQ29vcGVyIFttYWlsdG86YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbV0N
Cj4gU2VudDogRnJpZGF5LCBKYW51YXJ5IDI1LCAyMDE5IDI6MjggQU0NCj4gDQo+IENvZGUgY2xl
YXJpbmcgdGhlICJTdXBwcmVzcyBWRSIgYml0IGluIGFuIEVQVCBlbnRyeSBpc24ndCBuZWNlY3Nz
ZXJpbHkNCj4gcnVubmluZw0KPiBpbiBjdXJyZW50IGNvbnRleHQuICBJbiBBTFRQMk1fZXh0ZXJu
YWwgbW9kZSwgaXQgZGVmaW5pdGVseSBpcyBub3QsIGFuZCBpbiBQVg0KPiBjb250ZXh0LCB2Y3B1
X2FsdHAybShjdXJyZW50KSBhY3RzIHVwb24gdGhlIEhWTSB1bmlvbi4NCj4gDQo+IEV2ZW4gaWYg
d2UgY291bGQgc2Vuc2libHkgcmVzb2x2ZSB0aGUgdGFyZ2V0IHZDUFUsIGl0IG1heSBsZWdpdGlt
YXRlbHkgbm90IGJlDQo+IGZ1bGx5IHNldCB1cCBhdCB0aGlzIHBvaW50LCBzbyByZWplY3Rpbmcg
dGhlIEVQVCBtb2RpZmljYXRpb24gd291bGQgYmUgYnVnZ3kuDQo+IA0KPiBUaGVyZSBpcyBhIHBh
dGggaW4gaHZtX2hhcF9uZXN0ZWRfcGFnZV9mYXVsdCgpIHdoaWNoIGV4cGxpY2l0bHkgZW11bGF0
ZXMNCj4gI1ZFDQo+IGluIHRoZSBjcHVfaGFzX3ZteF92aXJ0X2V4Y2VwdGlvbnMgY2FzZSwgc28g
dGhlIC1FT1BOT1RTVVBQIHBhcnQgb2YgdGhpcw0KPiBjb25kaXRpb24gaXMgYWxzbyB3cm9uZy4N
Cj4gDQo+IERyb3AgdGhlICFzdmUgY2hlY2sgZW50aXJlbHkuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KDQpSZXZpZXdlZC1i
eTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+DQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
