From: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH] mm/pgtable: Drop pgtable_t variable from
 pte_fn_t functions
Date: Fri, 3 May 2019 06:27:33 -0700
Message-ID: <20190503132733.GA5201__3170.58858215518$1556923624$gmane$org@bombadil.infradead.org>
References: <1556803126-26596-1-git-send-email-anshuman.khandual@arm.com>
 <20190502134623.GA18948@bombadil.infradead.org>
 <20190502161457.1c9dbd94@mschwideX1>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mYVq=TD=infradead.org=willy@srs-us1.protection.inumbo.net>)
 id 1hMYE6-0008G7-VY
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 13:27:47 +0000
Content-Disposition: inline
In-Reply-To: <20190502161457.1c9dbd94@mschwideX1>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Martin Schwidefsky <schwidefsky@de.ibm.com>
Cc: Michal Hocko <mhocko@suse.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, dri-devel@lists.freedesktop.org, linux-mm@kvack.org, linux-efi@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, xen-devel@lists.xenproject.org, Anshuman Khandual <anshuman.khandual@arm.com>, intel-gfx@lists.freedesktop.org, jglisse@redhat.com, Mike Rapoport <rppt@linux.vnet.ibm.com>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-kernel@vger.kernel.org, akpm@linux-foundation.org, Logan Gunthorpe <logang@deltatee.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXkgMDIsIDIwMTkgYXQgMDQ6MTQ6NTdQTSArMDIwMCwgTWFydGluIFNjaHdpZGVm
c2t5IHdyb3RlOgo+IE9uIFRodSwgMiBNYXkgMjAxOSAwNjo0NjoyMyAtMDcwMAo+IE1hdHRoZXcg
V2lsY294IDx3aWxseUBpbmZyYWRlYWQub3JnPiB3cm90ZToKPiAKPiA+IE9uIFRodSwgTWF5IDAy
LCAyMDE5IGF0IDA2OjQ4OjQ2UE0gKzA1MzAsIEFuc2h1bWFuIEtoYW5kdWFsIHdyb3RlOgo+ID4g
PiBEcm9wIHRoZSBwZ3RhYmxlX3QgdmFyaWFibGUgZnJvbSBhbGwgaW1wbGVtZW50YXRpb24gZm9y
IHB0ZV9mbl90IGFzIG5vbmUgb2YKPiA+ID4gdGhlbSB1c2UgaXQuIGFwcGx5X3RvX3B0ZV9yYW5n
ZSgpIHNob3VsZCBzdG9wIGNvbXB1dGluZyBpdCBhcyB3ZWxsLiBTaG91bGQKPiA+ID4gaGVscCB1
cyBzYXZlIHNvbWUgY3ljbGVzLiAgCj4gPiAKPiA+IFlvdSBkaWRuJ3QgYWRkIE1hcnRpbiBTY2h3
aWRlZnNreSBmb3Igc29tZSByZWFzb24uICBIZSBpbnRyb2R1Y2VkCj4gPiBpdCBvcmlnaW5hbGx5
IGZvciBzMzkwIGZvciBzdWItcGFnZSBwYWdlIHRhYmxlcyBiYWNrIGluIDIwMDggKGNvbW1pdAo+
ID4gMmY1NjlhZmQ5YykuICBJIHRoaW5rIGhlIHNob3VsZCBjb25maXJtIHRoYXQgaGUgbm8gbG9u
Z2VyIG5lZWRzIGl0Lgo+IAo+IFdpdGggaXRzIDJLIHB0ZSB0YWJsZXMgczM5MCBjYW4gbm90IGRl
YWwgd2l0aCBhIChzdHJ1Y3QgcGFnZSAqKSBhcyBhIHJlZmVyZW5jZQo+IHRvIGEgcGFnZSB0YWJs
ZS4gQnV0IGlmIHRoZXJlIGFyZSBubyB1c2VyIG9mIHRoZSBhcHBseV90b19wYWdlX3JhbmdlKCkg
QVBJCj4gbGVmdCB3aGljaCBhY3R1YWxseSBtYWtlIHVzZSBvZiB0aGUgdG9rZW4gYXJndW1lbnQg
d2UgY2FuIHNhZmVseSBkcm9wIGl0LgoKSW50ZXJlc3RpbmdseSwgSSBkb24ndCB0aGluayB0aGVy
ZSBldmVyIHdhcyBhIHVzZXIgd2hpY2ggdXNlZCB0aGF0CmFyZ3VtZW50LiAgTG9va2luZyBhdCB5
b3VyIDJmNTYgcGF0Y2gsIHlvdSBvbmx5IGNvbnZlcnRlZCBvbmUgZnVuY3Rpb24KKHByZXN1bWFi
bHkgdGhlcmUgd2FzIG9ubHkgb25lIGNhbGxlciBvZiBhcHBseV90b19wYWdlX3JhbmdlKCkgYXQg
dGhlCnRpbWUpLCBhbmQgaXQgZGlkbid0IHUgc2UgYW55IG9mIHRoZSBhcmd1bWVudHMuICBYZW4g
d2FzIHRoZSBpbml0aWFsIHVzZXIsCmFuZCB0aGUgdHdvIG90aGVyIGZ1bmN0aW9ucyB0aGV5IGFk
ZGVkIGFsc28gZGlkbid0IHVzZSB0aGF0IGFyZ3VtZW50LgoKTG9va2luZyBhdCBhIHF1aWNrIHNh
bXBsZSBvZiB1c2VycyBhZGRlZCBzaW5jZSwgbm9uZSBvZiB0aGVtIGFwcGVhciB0bwpoYXZlIGV2
ZXIgdXNlZCB0aGF0IGFyZ3VtZW50LiAgU28gcmVtb3ZpbmcgaXQgc2VlbXMgYmVzdC4KCkFja2Vk
LWJ5OiBNYXR0aGV3IFdpbGNveCA8d2lsbHlAaW5mcmFkZWFkLm9yZz4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
