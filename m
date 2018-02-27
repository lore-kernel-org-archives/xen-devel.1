From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH 1/6] x86/vmx: Simplfy the default cases in
 vmx_msr_{read, write}_intercept()
Date: Tue, 27 Feb 2018 01:25:20 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19101BF59@SHSMSX101.ccr.corp.intel.com>
References: <1519666519-16311-1-git-send-email-andrew.cooper3@citrix.com>
 <1519666519-16311-2-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1519666519-16311-2-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wei.liu2@citrix.com>, "Nakajima, Jun" <jun.nakajima@intel.com>, Jan Beulich <JBeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBBbmRyZXcgQ29vcGVyIFttYWlsdG86YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbV0N
Cj4gU2VudDogVHVlc2RheSwgRmVicnVhcnkgMjcsIDIwMTggMTozNSBBTQ0KPiANCj4gVGhlIGRl
ZmF1bHQgY2FzZSBvZiB2bXhfbXNyX3dyaXRlX2ludGVyY2VwdCgpIGluIHBhcnRpY3VsYXIgaXMg
dmVyeSB0YW5nbGVkLg0KPiANCj4gRmlyc3Qgb2YgYWxsLCBmb2xkIGxvbmdfbW9kZV9kb19tc3Jf
e3JlYWQsd3JpdGV9KCkgaW50byB0aGVpciBjYWxsZXJzLiAgVGhlc2UNCj4gZnVuY3Rpb25zIHdl
cmUgc3BsaXQgb3V0IGluIHRoZSBwYXN0IGJlY2F1c2Ugb2YgdGhlIDMyYml0IGJ1aWxkIG9mIFhl
biwgYnV0IGl0DQo+IGlzIHVuY2xlYXIgd2h5IHRoZSBjYXNlcyB3ZXJlbid0IHNpbXBseSAjaWZk
ZWYnZCBpbiBwbGFjZS4NCj4gDQo+IE5leHQsIGludmVydCB0aGUgdm14X3dyaXRlX2d1ZXN0X21z
cigpL2lzX2xhc3RfYnJhbmNoX21zcigpIGxvZ2ljIHRvIGJyZWFrDQo+IGlmDQo+IHRoZSBjb25k
aXRpb24gaXMgc2F0aXNmaWVkLCByYXRoZXIgdGhhbiBuZXN0aW5nIGlmIGl0IHdhc24ndC4gIFRo
aXMgYWxsb3dzIHRoZQ0KPiB3cm1zcl9oeXBlcnZpc29yX3JlZ3MoKSBjYWxsIHRvIGJlIHVuLW5l
c3RlZCB3aXRoIHJlc3BlY3QgdG8gdGhlIG90aGVyDQo+IGRlZmF1bHQNCj4gbG9naWMuDQo+IA0K
PiBObyBwcmFjdGljYWwgZGlmZmVyZW5jZSBmcm9tIGEgZ3Vlc3RzIHBvaW50IG9mIHZpZXcuDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPg0KDQpBY2tlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+DQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
