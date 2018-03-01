From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [RFC PATCH v4 1/7] xen/pvh: Split CONFIG_XEN_PVH
 into CONFIG_PVH and CONFIG_XEN_PVH
Date: Thu, 1 Mar 2018 10:02:35 -0500
Message-ID: <5be04d96-aa10-a022-2597-f7f40138f8f8__39887.3611157343$1519916818$gmane$org@oracle.com>
References: <1519842483-8887-1-git-send-email-maran.wilson@oracle.com>
 <1519842483-8887-2-git-send-email-maran.wilson@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=yam0=fx=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1erPoP-0002Eo-EU
 for xen-devel@lists.xenproject.org; Thu, 01 Mar 2018 15:08:01 +0000
In-Reply-To: <1519842483-8887-2-git-send-email-maran.wilson@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Maran Wilson <maran.wilson@oracle.com>, pbonzini@redhat.com, jgross@suse.com, roger.pau@citrix.com, andrew.cooper3@citrix.com, hch@infradead.org, JBeulich@suse.com, x86@kernel.org, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Cc: thomas.lendacky@amd.com, linus.walleij@linaro.org, dave.hansen@linux.intel.com, rkrcmar@redhat.com, gregkh@linuxfoundation.org, mchehab@kernel.org, hpa@zytor.com, mingo@redhat.com, rdunlap@infradead.org, luto@kernel.org, jpoimboe@redhat.com, tglx@linutronix.de, bp@suse.de, davem@davemloft.net, kirill.shutemov@linux.intel.com
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMjgvMjAxOCAwMToyNyBQTSwgTWFyYW4gV2lsc29uIHdyb3RlOgo+IGRpZmYgLS1naXQg
YS9hcmNoL3g4Ni9LY29uZmlnIGIvYXJjaC94ODYvS2NvbmZpZwo+IGluZGV4IGViN2Y0M2YyMzUy
MS4uZmE3Y2QwMzA1MTI1IDEwMDY0NAo+IC0tLSBhL2FyY2gveDg2L0tjb25maWcKPiArKysgYi9h
cmNoL3g4Ni9LY29uZmlnCj4gQEAgLTc5MSw2ICs3OTEsMTQgQEAgY29uZmlnIEtWTV9HVUVTVAo+
ICAJICB1bmRlcmx5aW5nIGRldmljZSBtb2RlbCwgdGhlIGhvc3QgcHJvdmlkZXMgdGhlIGd1ZXN0
IHdpdGgKPiAgCSAgdGltaW5nIGluZnJhc3RydWN0dXJlIHN1Y2ggYXMgdGltZSBvZiBkYXksIGFu
ZCBzeXN0ZW0gdGltZQo+ICAKPiArY29uZmlnIFBWSAo+ICsJYm9vbCAiU3VwcG9ydCBmb3IgcnVu
bmluZyBQVkggZ3Vlc3RzIgo+ICsJZGVwZW5kcyBvbiBLVk1fR1VFU1QgfHwgWEVOCgoKTm90IHN1
cmUgYWJvdXQgWEVOIHBhcnQuIFBWSCBpcyBzZWxlY3RlZCBieSBYRU5fUFZIIGZvciBYZW4uCgpX
aGF0IGFib3V0IGludHJvZHVjaW5nIEtWTV9HVUVTVF9QVkggdGhhdCB3aWxsIHNlbGVjdCBQVkgg
YW5kIHRoZW4gZHJvcApkZXBlbmRlbmN5IGhlcmU/CgoKLWJvcmlzCgo+ICsJZGVmX2Jvb2wgbgo+
ICsJLS0taGVscC0tLQo+ICsJICBUaGlzIG9wdGlvbiBlbmFibGVzIHRoZSBQVkggZW50cnkgcG9p
bnQgZm9yIGd1ZXN0IHZpcnR1YWwgbWFjaGluZXMKPiArCSAgYXMgc3BlY2lmaWVkIGluIHRoZSB4
ODYvSFZNIGRpcmVjdCBib290IEFCSS4KPiArCj4gIAoKCj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2
L3hlbi9LY29uZmlnIGIvYXJjaC94ODYveGVuL0tjb25maWcKPiBpbmRleCBmNjA1ODI1YTA0YWIu
LjAyMWM4NTkxYzNjMCAxMDA2NDQKPiAtLS0gYS9hcmNoL3g4Ni94ZW4vS2NvbmZpZwo+ICsrKyBi
L2FyY2gveDg2L3hlbi9LY29uZmlnCj4gQEAgLTc3LDggKzc3LDkgQEAgY29uZmlnIFhFTl9ERUJV
R19GUwo+ICAJICBFbmFibGluZyB0aGlzIG9wdGlvbiBtYXkgaW5jdXIgYSBzaWduaWZpY2FudCBw
ZXJmb3JtYW5jZSBvdmVyaGVhZC4KPiAgCj4gIGNvbmZpZyBYRU5fUFZICj4gLQlib29sICJTdXBw
b3J0IGZvciBydW5uaW5nIGFzIGEgUFZIIGd1ZXN0Igo+ICsJYm9vbCAiU3VwcG9ydCBmb3IgcnVu
bmluZyBhcyBhIFhlbiBQVkggZ3Vlc3QiCj4gIAlkZXBlbmRzIG9uIFhFTiAmJiBYRU5fUFZIVk0g
JiYgQUNQSQo+ICAJIyBQcmUtYnVpbHQgcGFnZSB0YWJsZXMgYXJlIG5vdCByZWFkeSB0byBoYW5k
bGUgNS1sZXZlbCBwYWdpbmcuCj4gIAlkZXBlbmRzIG9uICFYODZfNUxFVkVMCj4gKwlzZWxlY3Qg
UFZICj4gIAlkZWZfYm9vbCBuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
