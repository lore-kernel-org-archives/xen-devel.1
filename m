From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH v4 1/7] xen/pvh: Split CONFIG_XEN_PVH
 into CONFIG_PVH and CONFIG_XEN_PVH
Date: Thu, 1 Mar 2018 16:17:41 +0100
Message-ID: <8cdb96db-0771-f062-e0ea-54b4171d6a98__44721.5331405916$1519917407$gmane$org@redhat.com>
References: <1519842483-8887-1-git-send-email-maran.wilson@oracle.com>
 <1519842483-8887-2-git-send-email-maran.wilson@oracle.com>
 <5be04d96-aa10-a022-2597-f7f40138f8f8@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=tgaz=fx=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1erPxz-00032N-Ek
 for xen-devel@lists.xenproject.org; Thu, 01 Mar 2018 15:17:55 +0000
In-Reply-To: <5be04d96-aa10-a022-2597-f7f40138f8f8@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Maran Wilson <maran.wilson@oracle.com>, jgross@suse.com, roger.pau@citrix.com, andrew.cooper3@citrix.com, hch@infradead.org, JBeulich@suse.com, x86@kernel.org, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Cc: thomas.lendacky@amd.com, linus.walleij@linaro.org, dave.hansen@linux.intel.com, rkrcmar@redhat.com, gregkh@linuxfoundation.org, mchehab@kernel.org, hpa@zytor.com, mingo@redhat.com, rdunlap@infradead.org, luto@kernel.org, jpoimboe@redhat.com, tglx@linutronix.de, bp@suse.de, davem@davemloft.net, kirill.shutemov@linux.intel.com
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMDMvMjAxOCAxNjowMiwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+IE9uIDAyLzI4LzIw
MTggMDE6MjcgUE0sIE1hcmFuIFdpbHNvbiB3cm90ZToKPj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2
L0tjb25maWcgYi9hcmNoL3g4Ni9LY29uZmlnCj4+IGluZGV4IGViN2Y0M2YyMzUyMS4uZmE3Y2Qw
MzA1MTI1IDEwMDY0NAo+PiAtLS0gYS9hcmNoL3g4Ni9LY29uZmlnCj4+ICsrKyBiL2FyY2gveDg2
L0tjb25maWcKPj4gQEAgLTc5MSw2ICs3OTEsMTQgQEAgY29uZmlnIEtWTV9HVUVTVAo+PiAgCSAg
dW5kZXJseWluZyBkZXZpY2UgbW9kZWwsIHRoZSBob3N0IHByb3ZpZGVzIHRoZSBndWVzdCB3aXRo
Cj4+ICAJICB0aW1pbmcgaW5mcmFzdHJ1Y3R1cmUgc3VjaCBhcyB0aW1lIG9mIGRheSwgYW5kIHN5
c3RlbSB0aW1lCj4+ICAKPj4gK2NvbmZpZyBQVkgKPj4gKwlib29sICJTdXBwb3J0IGZvciBydW5u
aW5nIFBWSCBndWVzdHMiCj4+ICsJZGVwZW5kcyBvbiBLVk1fR1VFU1QgfHwgWEVOCj4gCj4gCj4g
Tm90IHN1cmUgYWJvdXQgWEVOIHBhcnQuIFBWSCBpcyBzZWxlY3RlZCBieSBYRU5fUFZIIGZvciBY
ZW4uCj4gCj4gV2hhdCBhYm91dCBpbnRyb2R1Y2luZyBLVk1fR1VFU1RfUFZIIHRoYXQgd2lsbCBz
ZWxlY3QgUFZIIGFuZCB0aGVuIGRyb3AKPiBkZXBlbmRlbmN5IGhlcmU/CgpUaGF0IGlzLCAiY29u
ZmlnIEtWTV9HVUVTVF9QVkgiICJkZXBlbmRzIG9uIEtWTV9HVUVTVCIgInNlbGVjdCBQVkgiLgpT
b3VuZHMgZ29vZCB0byBtZS4KClBhb2xvCgo+IAo+IC1ib3Jpcwo+IAo+PiArCWRlZl9ib29sIG4K
Pj4gKwktLS1oZWxwLS0tCj4+ICsJICBUaGlzIG9wdGlvbiBlbmFibGVzIHRoZSBQVkggZW50cnkg
cG9pbnQgZm9yIGd1ZXN0IHZpcnR1YWwgbWFjaGluZXMKPj4gKwkgIGFzIHNwZWNpZmllZCBpbiB0
aGUgeDg2L0hWTSBkaXJlY3QgYm9vdCBBQkkuCj4+ICsKPj4gIAo+IAo+IAo+PiBkaWZmIC0tZ2l0
IGEvYXJjaC94ODYveGVuL0tjb25maWcgYi9hcmNoL3g4Ni94ZW4vS2NvbmZpZwo+PiBpbmRleCBm
NjA1ODI1YTA0YWIuLjAyMWM4NTkxYzNjMCAxMDA2NDQKPj4gLS0tIGEvYXJjaC94ODYveGVuL0tj
b25maWcKPj4gKysrIGIvYXJjaC94ODYveGVuL0tjb25maWcKPj4gQEAgLTc3LDggKzc3LDkgQEAg
Y29uZmlnIFhFTl9ERUJVR19GUwo+PiAgCSAgRW5hYmxpbmcgdGhpcyBvcHRpb24gbWF5IGluY3Vy
IGEgc2lnbmlmaWNhbnQgcGVyZm9ybWFuY2Ugb3ZlcmhlYWQuCj4+ICAKPj4gIGNvbmZpZyBYRU5f
UFZICj4+IC0JYm9vbCAiU3VwcG9ydCBmb3IgcnVubmluZyBhcyBhIFBWSCBndWVzdCIKPj4gKwli
b29sICJTdXBwb3J0IGZvciBydW5uaW5nIGFzIGEgWGVuIFBWSCBndWVzdCIKPj4gIAlkZXBlbmRz
IG9uIFhFTiAmJiBYRU5fUFZIVk0gJiYgQUNQSQo+PiAgCSMgUHJlLWJ1aWx0IHBhZ2UgdGFibGVz
IGFyZSBub3QgcmVhZHkgdG8gaGFuZGxlIDUtbGV2ZWwgcGFnaW5nLgo+PiAgCWRlcGVuZHMgb24g
IVg4Nl81TEVWRUwKPj4gKwlzZWxlY3QgUFZICj4+ICAJZGVmX2Jvb2wgbgo+IAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
