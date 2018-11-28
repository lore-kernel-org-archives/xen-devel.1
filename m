From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 5/6] microcode: delete microcode pointer
 and size from microcode_info
Date: Wed, 28 Nov 2018 16:04:30 +0100
Message-ID: <20181128150430.nl2yxsgm2p74pdwf@mac>
References: <1543383256-12371-1-git-send-email-chao.gao@intel.com>
 <1543383256-12371-6-git-send-email-chao.gao@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ir32=OH=citrix.com=prvs=8634c6f68=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gS1Ts-000618-Ug
 for xen-devel@lists.xenproject.org; Wed, 28 Nov 2018 15:10:24 +0000
Content-Disposition: inline
In-Reply-To: <1543383256-12371-6-git-send-email-chao.gao@intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Chao Gao <chao.gao@intel.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBOb3YgMjgsIDIwMTggYXQgMDE6MzQ6MTVQTSArMDgwMCwgQ2hhbyBHYW8gd3JvdGU6
Cj4gTWljcm9jb2RlIHBvaW50ZXIgYW5kIHNpemUgaXMgcGFzc2VkIHRvIG90aGVyIGNwdSB0byBw
YXJzZSBtaWNyb2NvZGUKPiBsb2NhbGx5LiBOb3csIHBhcnNpbmcgbWljcm9jb2RlIGlzIGRvbmUg
b24gb25lIENQVS4gT3RoZXJzIGp1c3QKPiBmaW5kIGEgc3VpdGFibGUgbWljcm9jb2RlIHN0b3Jl
ZCBpbiBtaWNyb2NvZGVfY2FjaGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hhbyBHYW8gPGNoYW8u
Z2FvQGludGVsLmNvbT4KPiAtLS0KPiAgeGVuL2FyY2gveDg2L21pY3JvY29kZS5jIHwgMTMgKysr
KysrLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9u
cygtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbWljcm9jb2RlLmMgYi94ZW4vYXJj
aC94ODYvbWljcm9jb2RlLmMKPiBpbmRleCBjY2E3YjJjLi4wYjQzNWY0IDEwMDY0NAo+IC0tLSBh
L3hlbi9hcmNoL3g4Ni9taWNyb2NvZGUuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGUu
Ywo+IEBAIC0xOTAsOSArMTkwLDcgQEAgREVGSU5FX1BFUl9DUFUoc3RydWN0IHVjb2RlX2NwdV9p
bmZvLCB1Y29kZV9jcHVfaW5mbyk7Cj4gIAo+ICBzdHJ1Y3QgbWljcm9jb2RlX2luZm8gewo+ICAg
ICAgdW5zaWduZWQgaW50IGNwdTsKPiAtICAgIHVpbnQzMl90IGJ1ZmZlcl9zaXplOwo+ICAgICAg
aW50IGVycm9yOwo+IC0gICAgY2hhciBidWZmZXJbMV07Cj4gIH07Cj4gIAo+ICBzdGF0aWMgdm9p
ZCBfX21pY3JvY29kZV9maW5pX2NwdSh1bnNpZ25lZCBpbnQgY3B1KQo+IEBAIC0yNzAsNiArMjY4
LDcgQEAgaW50IG1pY3JvY29kZV91cGRhdGUoWEVOX0dVRVNUX0hBTkRMRV9QQVJBTShjb25zdF92
b2lkKSBidWYsIHVuc2lnbmVkIGxvbmcgbGVuKQo+ICAgICAgc3RydWN0IG1pY3JvY29kZV9pbmZv
ICppbmZvOwo+ICAgICAgdW5zaWduZWQgaW50IGNwdSA9IHNtcF9wcm9jZXNzb3JfaWQoKTsKPiAg
ICAgIHN0cnVjdCB1Y29kZV9jcHVfaW5mbyAqdWNpID0gJnBlcl9jcHUodWNvZGVfY3B1X2luZm8s
IGNwdSk7Cj4gKyAgICB2b2lkICogYnVmZmVyOwo+ICAKPiAgICAgIGlmICggbGVuICE9ICh1aW50
MzJfdClsZW4gKQo+ICAgICAgICAgIHJldHVybiAtRTJCSUc7Cj4gQEAgLTI3NywxMSArMjc2LDEy
IEBAIGludCBtaWNyb2NvZGVfdXBkYXRlKFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0oY29uc3Rfdm9p
ZCkgYnVmLCB1bnNpZ25lZCBsb25nIGxlbikKPiAgICAgIGlmICggbWljcm9jb2RlX29wcyA9PSBO
VUxMICkKPiAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiAgCj4gLSAgICBpbmZvID0geG1hbGxv
Y19ieXRlcyhzaXplb2YoKmluZm8pICsgbGVuKTsKPiAtICAgIGlmICggaW5mbyA9PSBOVUxMICkK
PiArICAgIGluZm8gPSB4bWFsbG9jKHN0cnVjdCBtaWNyb2NvZGVfaW5mbyk7Cj4gKyAgICBidWZm
ZXIgPSB4bWFsbG9jX2J5dGVzKGxlbik7Cj4gKyAgICBpZiAoICFpbmZvIHx8ICFidWZmZXIgKQoK
WW91IGFyZSBhZ2FpbiBsaWtlbHkgdG8gbGVhayBtZW1vcnkgd2l0aCB0aGlzIGNvbnN0cnVjdC4K
ClJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
