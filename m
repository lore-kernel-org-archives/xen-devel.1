From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] xen: Remove domain_crash_synchronous()
 completely
Date: Wed, 1 Aug 2018 15:50:28 +0200
Message-ID: <20180801135028.ktdlefdnbykrqnbv@mac>
References: <1533130175-15541-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1533130175-15541-1-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBBdWcgMDEsIDIwMTggYXQgMDI6Mjk6MzVQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBkb21haW5fY3Jhc2hfc3luY2hyb25vdXMoKSBpcyB1bnNhZmUgdG8gdXNlIGluIGdl
bmVyYWwgYXMgaXQgbWF5IGxlYXZlCj4gc3BpbmxvY2tzIGhlbGQsIHRlbXBvcmFyeSBtZW1vcnkg
YWxsb2NhdGVkLCBldGMuCj4gCj4gV2l0aCBkb21haW5fY3Jhc2hfc3luY2hyb25vdXMoKSByZW1v
dmVkIGZyb20gdGhlIEFSTSBjb2RlIGluIDQuMTEsIHRha2UgdGhlCj4gb3Bwb3J0dW5pdHkgdG8g
cmVtb3ZlIHRoZSBpbmZyYXN0cnVjdHVyZSBjb21wbGV0ZWx5IGJ5IG9wZW5jb2RpbmcgdGhlIHNv
ZnRpcnEKPiBsb29wIGluIHRoZSByZW1haW5pbmcgY2FsbHNpdGVzLCBhbGwgb2Ygd2hpY2ggYXJl
IGRlc3RpbmVkIGZvciBkZWxldGlvbi4KPiAKPiBOb25lIG9mIHRoZXNlIHNpdGVzIGFyZSBhdCBy
aXNrIG9mIGhhdmluZyBhIHBlbmRpbmcgaW9yZXEgdG8gcWVtdSwgd2hpY2ggbWVhbnMKPiB0aGF0
IHRoZSB2Y3B1X2VuZF9zaHV0ZG93bl9kZWZlcnJhbCgpIGlzbid0IG5lY2Vzc2FyeS4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoK
UmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKVGhp
cyBob3dldmVyIHJlbW92ZXMgdGhlIHByaW50ayB3aXRoIHRoZSBmaWxlIGFuIGxpbmUgbnVtYmVy
IGZyb20Kd2hlcmUgdGhlIGRvbWFpbl9jcmFzaCB3YXMgY2FsbGVkLiBJIGRvbid0IHRoaW5rIGl0
J3MgYSBiaWcgaXNzdWUKYmVjYXVzZSBlYWNoIGNhbGwgc2l0ZSBhbHJlYWR5IGhhcyBhIG1lc3Nh
Z2UuCgpSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
