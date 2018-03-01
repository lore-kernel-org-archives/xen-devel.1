From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [RFC PATCH v4 4/7] xen/pvh: Move Xen specific PVH
 VM initialization out of common code
Date: Thu, 1 Mar 2018 11:05:25 -0500
Message-ID: <d9b1e5ef-af73-d2cb-0f3d-f41cdc8f35cd__44311.5538837903$1519920226$gmane$org@oracle.com>
References: <1519842483-8887-1-git-send-email-maran.wilson@oracle.com>
 <1519842483-8887-5-git-send-email-maran.wilson@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=yam0=fx=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1erQhQ-0007wN-3g
 for xen-devel@lists.xenproject.org; Thu, 01 Mar 2018 16:04:52 +0000
In-Reply-To: <1519842483-8887-5-git-send-email-maran.wilson@oracle.com>
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

T24gMDIvMjgvMjAxOCAwMToyOCBQTSwgTWFyYW4gV2lsc29uIHdyb3RlOgo+IFdlIG5lZWQgdG8g
cmVmYWN0b3IgUFZIIGVudHJ5IGNvZGUgc28gdGhhdCBzdXBwb3J0IGZvciBvdGhlciBoeXBlcnZp
c29ycwo+IGxpa2UgUWVtdS9LVk0gY2FuIGJlIGFkZGVkIG1vcmUgZWFzaWx5Lgo+Cj4gVGhpcyBw
YXRjaCBtb3ZlcyB0aGUgc21hbGwgYmxvY2sgb2YgY29kZSB1c2VkIGZvciBpbml0aWFsaXppbmcg
WGVuIFBWSAo+IHZpcnR1YWwgbWFjaGluZXMgaW50byB0aGUgWGVuIHNwZWNpZmljIGZpbGUuIFRo
aXMgaW5pdGlhbGl6YXRpb24gaXMgbm90Cj4gZ29pbmcgdG8gYmUgbmVlZGVkIGZvciBRZW11L0tW
TSBndWVzdHMuIE1vdmluZyBpdCBvdXQgb2YgdGhlIGNvbW1vbiBmaWxlCj4gaXMgZ29pbmcgdG8g
YWxsb3cgdXMgdG8gY29tcGlsZSBrZXJuZWxzIGluIHRoZSBmdXR1cmUgd2l0aG91dCBDT05GSUdf
WEVOCj4gdGhhdCBhcmUgc3RpbGwgY2FwYWJsZSBvZiBiZWluZyBib290ZWQgYXMgYSBRZW11L0tW
TSBndWVzdCB2aWEgdGhlIFBWSAo+IGVudHJ5IHBvaW50Lgo+Cj4gU2lnbmVkLW9mZi1ieTogTWFy
YW4gV2lsc29uIDxtYXJhbi53aWxzb25Ab3JhY2xlLmNvbT4KPiAtLS0KPiAgYXJjaC94ODYvcHZo
LmMgICAgICAgICAgICAgICB8IDI4ICsrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0KPiAgYXJj
aC94ODYveGVuL2VubGlnaHRlbl9wdmguYyB8IDE4ICsrKysrKysrKysrKysrKysrLQo+ICAyIGZp
bGVzIGNoYW5nZWQsIDM3IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0t
Z2l0IGEvYXJjaC94ODYvcHZoLmMgYi9hcmNoL3g4Ni9wdmguYwo+IGluZGV4IGI1NmNiNWU3ZDZh
Yy4uMmQ3YTdmNDk1OGNiIDEwMDY0NAo+IC0tLSBhL2FyY2gveDg2L3B2aC5jCj4gKysrIGIvYXJj
aC94ODYvcHZoLmMKPiBAQCAtNzIsMjYgKzcyLDM4IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBpbml0
X3B2aF9ib290cGFyYW1zKHZvaWQpCj4gIAlwdmhfYm9vdHBhcmFtcy5oZHIudHlwZV9vZl9sb2Fk
ZXIgPSAoOSA8PCA0KSB8IDA7IC8qIFhlbiBsb2FkZXIgKi8KPiAgfQo+ICAKPiArLyoKPiArICog
SWYgd2UgYXJlIHRyeWluZyB0byBib290IGEgWGVuIFBWSCBndWVzdCwgaXQgaXMgZXhwZWN0ZWQg
dGhhdCB0aGUga2VybmVsCj4gKyAqIHdpbGwgaGF2ZSBiZWVuIGNvbmZpZ3VyZWQgdG8gcHJvdmlk
ZSB0aGUgcmVxdWlyZWQgb3ZlcnJpZGUgZm9yIHRoaXMgcm91dGluZS4KPiArICovCj4gK3ZvaWQg
X19pbml0IF9fd2VhayB4ZW5fcHZoX2luaXQodm9pZCkKPiArewo+ICsJeGVuX3Jhd19wcmludGso
IkVycm9yOiBNaXNzaW5nIHhlbiBQVkggaW5pdGlhbGl6YXRpb25cbiIpOwoKSSB0aGluayB0aGlz
IHNob3VsZCBiZSBwcmludGsgKG9yLCBtb3JlIHByZWNpc2VseSwgdGhpcyBzaG91bGQgbm90IGJl
Cnhlbl9yYXdfcHJpbnRrKCkpOiB3ZSBhcmUgaGVyZSBiZWNhdXNlIHdlIGFyZSAqbm90KiBhIFhl
biBndWVzdCBhbmQgc28KWGVuLXNwZWNpZmljIHByaW50ayB3aWxsIG5vdCB3b3JrLiAoYW5kIHRo
ZSBzYW1lIGlzIHRydWUgZm9yIHRoZSBuZXh0CnBhdGNoIHdoZXJlIHdlYWsgbWVtX21hcF92aWFf
aGNhbGwoKSBpcyBhZGRlZCkuCgotYm9yaXMKCgo+ICsJQlVHKCk7Cj4gK30KPgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
