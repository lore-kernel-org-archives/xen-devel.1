From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH 5/9] x86/vmx: Fix handing of MSR_DEBUGCTL on
 VMExit
Date: Sun, 27 May 2018 03:56:50 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D191193100@SHSMSX101.ccr.corp.intel.com>
References: <1526988046-22948-1-git-send-email-andrew.cooper3@citrix.com>
 <1526988046-22948-6-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1526988046-22948-6-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Wei Liu <wei.liu2@citrix.com>, "Nakajima, Jun" <jun.nakajima@intel.com>, Jan Beulich <JBeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBBbmRyZXcgQ29vcGVyIFttYWlsdG86YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbV0N
Cj4gU2VudDogVHVlc2RheSwgTWF5IDIyLCAyMDE4IDc6MjEgUE0NCj4gDQo+IEN1cnJlbnRseSwg
d2hlbmV2ZXIgdGhlIGd1ZXN0IHdyaXRlcyBhIG5vbnplcm8gdmFsdWUgdG8gTVNSX0RFQlVHQ1RM
LA0KPiBYZW4NCj4gdXBkYXRlcyBhIGhvc3QgTVNSIGxvYWQgbGlzdCBlbnRyeSB3aXRoIHRoZSBj
dXJyZW50IGhhcmR3YXJlIHZhbHVlIG9mDQo+IE1TUl9ERUJVR0NUTC4gIFRoaXMgaXMgd3Jvbmcu
DQo+IA0KPiBPbiBWTUV4aXQsIGhhcmR3YXJlIGF1dG9tYXRpY2FsbHkgcmVzZXRzIE1TUl9ERUJV
R0NUTCB0byAwLiAgVGhlIG9ubHkNCj4gY2FzZQ0KPiB3aGVyZSBkaWZmZXJlbnQgYmVoYXZpb3Vy
IGlzIG5lZWRlZCBpcyBpZiBYZW4gaXMgZGVidWdnaW5nIGl0c2VsZiwgYW5kIHRoaXMNCj4gbmVl
ZHMgc2V0dGluZyB1cCB1bmNvbmRpdGlvbmFsbHkgZm9yIHRoZSBsaWZldGltZSBvZiB0aGUgVk0u
DQo+IA0KPiBUaGUgYGxlcmAgY29tbWFuZCBsaW5lIGJvb2xlYW4gaXMgdGhlIG9ubHkgd2F5IHRv
IGNvbmZpZ3VyZSBhbnkgdXNlIG9mDQo+IE1TUl9ERUJVR0NUTCBmb3IgWGVuLCBzbyB0aWUgdGhl
IGhvc3QgbG9hZCBsaXN0IGVudHJ5IHRvIHRoaXMgc2V0dGluZyBpbg0KPiBjb25zdHJ1Y3Rfdm1j
cygpLiAgQW55IHJ1bnRpbWUgdXBkYXRlIG9mIFhlbidzIE1TUl9ERUJVR0NUTCBzZXR0aW5nDQo+
IHJlcXVpcmVzDQo+IG1vcmUgY29tcGxpY2F0ZWQgc3luY2hyb25pc2F0aW9uIGFjcm9zcyBhbGwg
dGhlIHJ1bm5pbmcgVk1zLg0KPiANCj4gSW4gdGhlIGV4Y2VlZGluZ2x5IGNvbW1vbiBjYXNlLCB0
aGlzIGF2b2lkcyB0aGUgdW5uZWNlc3Nhcnkgb3ZlcmhlYWQgb2YNCj4gaGF2aW5nDQo+IGEgaG9z
dCBsb2FkIGVudHJ5IHBlcmZvcm1pbmcgdGhlIHNhbWUgemVyb2luZyBvcGVyYXRpb24gdGhhdCBo
YXJkd2FyZQ0KPiBoYXMNCj4gYWxyZWFkeSBwZXJmb3JtZWQgYXMgcGFydCBvZiB0aGUgVk1FeGl0
Lg0KDQpJIGRpZG4ndCBnZXQgInVubmVjZXNzYXJ5IG92ZXJoZWFkIiBwYXJ0LiBpZiAibGVyJyBp
cyBkaXNhYmxlZCwgYXMgeW91DQpzYWlkIGVhcmxpZXIgaXQncyBhIGJ1ZyB0byBzYXZlL3Jlc3Rv
cmUgdGh1cyBvdmVyaGVhZCBkb2Vzbid0IG1hdHRlci4NCklmICJsZXIiIGlzIGVuYWJsZWQsIHRo
ZW4gc2F2ZS9yZXN0b3JlIGlzIGFueXdheSByZXF1aXJlZCB0aGVuIHdoZXJlDQppcyBzYXZlZCBv
dmVyaGVhZCBjb21pbmcgZnJvbT8NCg0KVGhhbmtzDQpLZXZpbg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
