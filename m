From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v2 4/5] x86/msr: Handle MSR_TSC_AUX
 consistently for PV and HVM guests
Date: Sun, 2 Dec 2018 08:47:28 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19BE86A11@SHSMSX101.ccr.corp.intel.com>
References: <1542724622-14321-1-git-send-email-andrew.cooper3@citrix.com>
 <1542724622-14321-5-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1542724622-14321-5-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBBbmRyZXcgQ29vcGVyIFttYWlsdG86YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbV0N
Cj4gU2VudDogVHVlc2RheSwgTm92ZW1iZXIgMjAsIDIwMTggMTA6MzcgUE0NCj4gDQo+IFdpdGgg
UFZSRFRTQ1AgbW9kZSByZW1vdmVkLCBoYW5kbGluZyBvZiBNU1JfVFNDX0FVWCBjYW4gbW92ZSBp
bnRvDQo+IHRoZSBjb21tb24NCj4gY29kZS4gIE1vdmUgaXRzIHN0b3JhZ2UgaW50byBzdHJ1Y3Qg
dmNwdV9tc3JzIChkcm9wcGluZyB0aGUgSFZNLXNwZWNpZmljDQo+IG1zcl90c2NfYXV4KSwgYW5k
IGFkZCBhbiBSRFBJRCBmZWF0dXJlIGNoZWNrIGFzIHRoaXMgYml0IGFsc28gZW51bWVyYXRlcw0K
PiB0aGUNCj4gcHJlc2VuY2Ugb2YgdGhlIE1TUi4NCj4gDQo+IEludHJvZHVjZSBjcHVfaGFzX3Jk
cGlkIGFsb25nIHdpdGggdGhlIHN5bnRoZXNpemVkIGNwdV9oYXNfbXNyX3RzY19hdXgNCj4gdG8N
Cj4gY29ycmVjdCB0aGUgY29udGV4dCBzd2l0Y2ggcGF0aHMsIGFzIE1TUl9UU0NfQVVYIGlzIGVu
dW1lcmF0ZWQgYnkgZWl0aGVyDQo+IFJEVFNDUCBvciBSRFBJRC4NCj4gDQo+IERyb3AgaHZtX21z
cl90c2NfYXV4KCkgZW50aXJlbHksIGFuZCB1c2Ugdi0+YXJjaC5tc3JzLT50c2NfYXV4IGRpcmVj
dGx5Lg0KPiBVcGRhdGUgaHZtX2xvYWRfY3B1X2N0eHQoKSB0byBjaGVjayB0aGF0IHRoZSBpbmNv
bWluZyBjdHh0Lm1zcl90c2NfYXV4DQo+IGlzbid0DQo+IG91dCBvZiByYW5nZS4gIEluIHByYWN0
aWNlLCBubyBwcmV2aW91cyB2ZXJzaW9uIG9mIFhlbiBldmVyIHdyb3RlIGFuDQo+IG91dC1vZi1y
YW5nZSB2YWx1ZS4gIEFkZCBNU1JfVFNDX0FVWCB0byB0aGUgbGlzdCBvZiBNU1JzIG1pZ3JhdGVk
IGZvciBQVg0KPiBndWVzdHMsIGJ1dCBsZWF2ZSB0aGUgSFZNIHBhdGggdXNpbmcgdGhlIGV4aXN0
aW5nIHNwYWNlIGluIGh2bV9od19jcHUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29v
cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KDQpSZXZpZXdlZC1ieTogS2V2aW4gVGlh
biA8a2V2aW4udGlhbkBpbnRlbC5jb20+DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
