From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v2 5/5] x86: Reorganise and rename debug
 register fields in struct vcpu
Date: Tue, 30 Oct 2018 07:32:08 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19BE2BC42@SHSMSX101.ccr.corp.intel.com>
References: <1539599780-14549-1-git-send-email-andrew.cooper3@citrix.com>
 <1539599780-14549-6-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1539599780-14549-6-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Wei Liu <wei.liu2@citrix.com>, "Nakajima, Jun" <jun.nakajima@intel.com>, Jan Beulich <JBeulich@suse.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBBbmRyZXcgQ29vcGVyIFttYWlsdG86YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbV0N
Cj4gU2VudDogTW9uZGF5LCBPY3RvYmVyIDE1LCAyMDE4IDY6MzYgUE0NCj4gDQo+IFJldXNpbmcg
ZGVidWdyZWdbNV0gZm9yIHRoZSBQViBlbXVsYXRlZCBJTyBicmVha3BvaW50IGluZm9ybWF0aW9u
IGlzDQo+IGNvbmZ1c2luZw0KPiB0byByZWFkLiAgSW5zdGVhZCwgaW50cm9kdWNlIGEgZHI3X2Vt
dWwgZmllbGQgaW4gcHZfdmNwdSBmb3IgdGhlIHB1cG9zZS4NCj4gDQo+IFdpdGggdGhlIFBWIGVt
dWxhdGlvbiBvdXQgb2YgdGhlIHdheSwgZGVidWdyZWdbNCw1XSBhcmUgZW50aXJlbHkgdW51c2Vk
DQo+IGFuZA0KPiBkb24ndCBuZWVkIHRvIGJlIHN0b3JlZC4NCj4gDQo+IFJlbmFtZSBkZWJ1Z3Jl
Z1swLi4zXSB0byBkclswLi4zXSB0byByZWR1Y2UgY29kZSB2b2x1bWUsIGJ1dCBrZWVwIHRoZW0N
Cj4gYXMgYW4NCj4gYXJyYXkgYmVjYXVzZSB0aGVpciBiZWhhdmlvdXIgaXMgaWRlbnRpY2FsIGFu
ZCB0aGlzIGhlbHBzIHNpbXBsZnkgc29tZSBvZg0KPiB0aGUNCj4gUFYgaGFuZGxpbmcuICBJbnRy
b2R1Y2UgZHI2IGFuZCBkcjcgZmllbGRzIHRvIHJlcGxhY2UgZGVidWdyZWdbNiw3XSB3aGljaA0K
PiByZW1vdmVzIHRoZSBzdG9yYWdlIGZvciBkZWJ1Z3JlZ1s0LDVdLg0KPiANCj4gSW4gYXJjaF9n
ZXRfaW5mb19ndWVzdCgpLCBoYW5kbGUgdGhlIG1lcmdpbmcgb2YgZW11bGF0ZWQgZHI3IHN0YXRl
DQo+IGFsb25nc2lkZQ0KPiBhbGwgb3RoZXIgZHIgaGFuZGxpbmcsIHJhdGhlciB0aGFuIG11Y2gg
bGF0ZXIuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPg0KDQpSZXZpZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRl
bC5jb20+DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
