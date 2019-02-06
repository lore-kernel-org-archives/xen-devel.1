From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH for-4.12] arm/p2m: do not invalidate p2m
 root if it is shared with IOMMU
Date: Wed, 6 Feb 2019 11:17:40 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1902061117040.2723@sstabellini-ThinkPad-X260>
References: <1548689694-30028-1-git-send-email-andrii.anisov@gmail.com>
 <4ab0408f-edf2-5302-17ee-3c181d5d561e@arm.com>
 <eb581cac-7123-e61d-0680-8f409018fa15@gmail.com>
 <0aa633d6-e671-8c22-1b73-fa1d47c5f6c5@arm.com>
 <8cbacbc7-e57c-b0c5-7e0e-ad238f795b5d@gmail.com>
 <097a2b33-3ede-7949-3fa2-b3dd4058b5c4@arm.com>
 <33e7eafe-75e2-5bd0-017a-1df887114536@gmail.com>
 <1eaf158a-427f-a89d-5132-eed5bf6e95fc@arm.com>
 <3bd93c19-9264-4494-52ce-3e2672c1e573@gmail.com>
 <325628f3-9fc9-d021-fefc-5d06c82dfff5@arm.com>
 <b84c9e8a-e551-2c88-d275-14665835fde8@gmail.com>
 <alpine.DEB.2.10.1902041705520.22962@sstabellini-ThinkPad-X260>
 <3460048c-f69d-840a-6e8e-cef1e15b76d7@gmail.com>
 <5ad82008-8183-b50b-54ce-5a2d87f1180e@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+4Jx=QN=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1grShd-0000s9-Sn
 for xen-devel@lists.xenproject.org; Wed, 06 Feb 2019 19:17:45 +0000
In-Reply-To: <5ad82008-8183-b50b-54ce-5a2d87f1180e@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCA2IEZlYiAyMDE5LCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IEhlbGxvIFN0ZWZhbm8s
Cj4gCj4gT24gMDUuMDIuMTkgMTE6MTcsIEFuZHJpaSBBbmlzb3Ygd3JvdGU6Cj4gPiBUaGFuayB5
b3UuCj4gPiBJIGFscmVhZHkgcmVmZXJyZWQgdGhpcyB0aHJlYWQgaW4gdGhlIGVtYWlsIHRvIHRo
ZSB2ZW5kb3IgYXMgdGhlIGZpcnN0IHN0ZXAuCj4gPiBCdXQgaGF2ZSBubyBhbnN3ZXIgeWV0IDoo
Cj4gCj4gV2UndmUgZ290IGFuIGFuc3dlciBmcm9tIHRoZSB2ZW5kb3IuIFRoZXkgYWdyZWUgd2l0
aCBhcmd1bWVudHMgYW5kIGhhdmUKPiBwcm92aWRlZCBhIHBhdGNoIHRvIGVsaW1pbmF0ZSBTZXQv
V2F5IHVzYWdlLgo+IFdlJ3ZlIGNoZWNrZWQgYW5kIGl0IGRvZXMgd2hhdCBpcyBuZWVkZWQuIFNv
IHdlIGRvIG5vdCBuZWVkIHRoaXMgV0EgYW55IG1vcmUuCgpHcmVhdCwgYmVzdCBmb3IgZXZlcnli
b2R5IQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
