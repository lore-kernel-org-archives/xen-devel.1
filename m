From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH for-4.12] arm/p2m: do not invalidate p2m
 root if it is shared with IOMMU
Date: Tue, 29 Jan 2019 15:36:25 +0200
Message-ID: <33e7eafe-75e2-5bd0-017a-1df887114536@gmail.com>
References: <1548689694-30028-1-git-send-email-andrii.anisov@gmail.com>
 <4ab0408f-edf2-5302-17ee-3c181d5d561e@arm.com>
 <eb581cac-7123-e61d-0680-8f409018fa15@gmail.com>
 <0aa633d6-e671-8c22-1b73-fa1d47c5f6c5@arm.com>
 <8cbacbc7-e57c-b0c5-7e0e-ad238f795b5d@gmail.com>
 <097a2b33-3ede-7949-3fa2-b3dd4058b5c4@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KUKg=QF=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1goTYz-0002iL-W1
 for xen-devel@lists.xenproject.org; Tue, 29 Jan 2019 13:36:30 +0000
Received: by mail-lj1-x243.google.com with SMTP id s5-v6so17442715ljd.12
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jan 2019 05:36:28 -0800 (PST)
In-Reply-To: <097a2b33-3ede-7949-3fa2-b3dd4058b5c4@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8gSnVsaWVuLAoKT24gMjguMDEuMTkgMTg6NTQsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBU
aGVyZSBzaG91bGQgYmUgbm8gU2V0L1dheSBpbiBMaW51eCA0LjE0LiBTbyBJIGFtIGEgYml0IGNv
bmZ1c2VkIGhvdyBjYW4gZXZlbsKgcmVhY2jCoHRoaXPCoGNvZGUuCgpXZWxsLCB0aGF0IGlzIGEg
cHJvcHJpZXRhcnkga2VybmVsIGRyaXZlciBkb2luZyBjYWNoZSBtYWludGVuYW5jZSB1c2luZyBT
ZXQvV2F5IG9wZXJhdGlvbnMuIEFuZCBJJ20gbm90IHN1cmUgaWYgd2UgY2FuIGF2b2lkIHRoYXQg
OigKCi0tIApTaW5jZXJlbHksCkFuZHJpaSBBbmlzb3YuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
