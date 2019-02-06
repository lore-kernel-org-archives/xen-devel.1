From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH for-4.12] arm/p2m: do not invalidate p2m
 root if it is shared with IOMMU
Date: Wed, 6 Feb 2019 10:49:08 +0200
Message-ID: <5ad82008-8183-b50b-54ce-5a2d87f1180e@gmail.com>
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
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=I7xt=QN=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1grItN-0007Sm-E5
 for xen-devel@lists.xenproject.org; Wed, 06 Feb 2019 08:49:13 +0000
Received: by mail-lj1-x241.google.com with SMTP id g11-v6so5310015ljk.3
 for <xen-devel@lists.xenproject.org>; Wed, 06 Feb 2019 00:49:12 -0800 (PST)
In-Reply-To: <3460048c-f69d-840a-6e8e-cef1e15b76d7@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8gU3RlZmFubywKCk9uIDA1LjAyLjE5IDExOjE3LCBBbmRyaWkgQW5pc292IHdyb3RlOgo+
IFRoYW5rIHlvdS4KPiBJIGFscmVhZHkgcmVmZXJyZWQgdGhpcyB0aHJlYWQgaW4gdGhlIGVtYWls
IHRvIHRoZSB2ZW5kb3IgYXMgdGhlIGZpcnN0IHN0ZXAuCj4gQnV0IGhhdmUgbm8gYW5zd2VyIHll
dCA6KAoKV2UndmUgZ290IGFuIGFuc3dlciBmcm9tIHRoZSB2ZW5kb3IuIFRoZXkgYWdyZWUgd2l0
aCBhcmd1bWVudHMgYW5kIGhhdmUgcHJvdmlkZWQgYSBwYXRjaCB0byBlbGltaW5hdGUgU2V0L1dh
eSB1c2FnZS4KV2UndmUgY2hlY2tlZCBhbmQgaXQgZG9lcyB3aGF0IGlzIG5lZWRlZC4gU28gd2Ug
ZG8gbm90IG5lZWQgdGhpcyBXQSBhbnkgbW9yZS4KCi0tIApTaW5jZXJlbHksCkFuZHJpaSBBbmlz
b3YuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
