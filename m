From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH 1/4] x86/vvmx: Unconditionally initialise
 vmxon_region_pa during vcpu construction
Date: Tue, 30 Oct 2018 07:11:08 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19BE2BB6D@SHSMSX101.ccr.corp.intel.com>
References: <1540481802-20037-1-git-send-email-andrew.cooper3@citrix.com>
 <1540481802-20037-2-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1540481802-20037-2-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wei.liu2@citrix.com>, "Nakajima, Jun" <jun.nakajima@intel.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBBbmRyZXcgQ29vcGVyIFttYWlsdG86YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbV0K
PiBTZW50OiBUaHVyc2RheSwgT2N0b2JlciAyNSwgMjAxOCAxMTozNyBQTQo+IAo+IFRoaXMgaXMg
YSBzdG9wZ2FwIHNvbHV0aW9uIHVudGlsIHRoZSB0b29sc3RhY2sgc2lkZSBvZiBpbml0aWFsaXNh
dGlvbiBjYW4gYmUKPiBzb3J0ZWQgb3V0LCBidXQgaXQgZG9lcyByZXN1bHQgaW4gdGhlIG52bXhf
dmNwdV9pbl92bXgoKSBwcmVkaWNhdGUgd29ya2luZwo+IGNvcnJlY3RseSBldmVuIHdoZW4gbmVz
dGVkIHZpcnQgaGFzbid0IGJlZW4gZW5hYmxlZCBmb3IgdGhlIGRvbWFpbi4KPiAKPiBVcGRhdGUg
bnZteF9oYW5kbGVfdm14X2luc24oKSB0byBpbmNsdWRlIHRoZSBpbi12bXggbW9kZSBjaGVjayAo
Zm9yIGFsbAo+IGluc3RydWN0aW9ucyBvdGhlciB0aGFuIFZNWE9OKSB0byBjb21wbGV0ZSB0aGUg
c2V0IG9mICNVRCBjaGVja3MuCj4gCj4gSW4gYWRkaXRpb24sIHNhbml0eSBjaGVjayB0aGF0IHRo
ZSBuZXN0ZWQgdm1leGl0IGhhbmRsZXIgaGFzIHdvcmtlZAo+IGNvcnJlY3RseSwKPiBhbmQgdGhh
dCB3ZSBhcmUgb25seSBwcm92aWRpbmcgZW11bGF0aW9uIG9mIHRoZSBWVC14IGluc3RydWN0aW9u
cyB0byBMMQo+IGd1ZXN0cy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPgoKQWNrZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRpYW5A
aW50ZWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
