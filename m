From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH] mm/pgtable: Drop pgtable_t variable from
 pte_fn_t functions
Date: Thu, 2 May 2019 19:32:42 +0530
Message-ID: <03be69c4-9a63-041c-49fc-249b2bf1d58a__43816.0065141105$1556805836$gmane$org@arm.com>
References: <1556803126-26596-1-git-send-email-anshuman.khandual@arm.com>
 <20190502134623.GA18948@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=moq5=TC=arm.com=anshuman.khandual@srs-us1.protection.inumbo.net>)
 id 1hMCIY-0000Mg-0b
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 14:02:54 +0000
In-Reply-To: <20190502134623.GA18948@bombadil.infradead.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: Michal Hocko <mhocko@suse.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, dri-devel@lists.freedesktop.org, linux-mm@kvack.org, linux-efi@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, xen-devel@lists.xenproject.org, intel-gfx@lists.freedesktop.org, jglisse@redhat.com, Mike Rapoport <rppt@linux.vnet.ibm.com>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-kernel@vger.kernel.org, schwidefsky@de.ibm.com, akpm@linux-foundation.org, Logan Gunthorpe <logang@deltatee.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwNS8wMi8yMDE5IDA3OjE2IFBNLCBNYXR0aGV3IFdpbGNveCB3cm90ZToKPiBPbiBUaHUs
IE1heSAwMiwgMjAxOSBhdCAwNjo0ODo0NlBNICswNTMwLCBBbnNodW1hbiBLaGFuZHVhbCB3cm90
ZToKPj4gRHJvcCB0aGUgcGd0YWJsZV90IHZhcmlhYmxlIGZyb20gYWxsIGltcGxlbWVudGF0aW9u
IGZvciBwdGVfZm5fdCBhcyBub25lIG9mCj4+IHRoZW0gdXNlIGl0LiBhcHBseV90b19wdGVfcmFu
Z2UoKSBzaG91bGQgc3RvcCBjb21wdXRpbmcgaXQgYXMgd2VsbC4gU2hvdWxkCj4+IGhlbHAgdXMg
c2F2ZSBzb21lIGN5Y2xlcy4KPiBZb3UgZGlkbid0IGFkZCBNYXJ0aW4gU2Nod2lkZWZza3kgZm9y
IHNvbWUgcmVhc29uLiAgSGUgaW50cm9kdWNlZAoKc2NyaXB0cy9nZXRfbWFpbnRhaW5lci5wbCBk
aWQgbm90IGxpc3QgdGhlIGVtYWlsIGJ1dCBhbnl3YXlzIEkgc2hvdWxkIGhhdmUKYWRkZWQgaXQg
ZnJvbSBnaXQgYmxhbWUuIFRoYW5rcyBmb3IgYWRkaW5nIGhpcyBlbWFpbCB0byB0aGUgdGhyZWFk
LgogCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
