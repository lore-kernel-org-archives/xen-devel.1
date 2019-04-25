From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH 3/7] xen/arm: tlbflush: Clarify the TLB
 helpers name
Date: Thu, 25 Apr 2019 21:00:56 +0300
Message-ID: <7c176414-4e3c-d2ed-e50d-2cf5992fa2cd@gmail.com>
References: <20190417175815.16905-1-julien.grall@arm.com>
 <20190417175815.16905-4-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+mKo=S3=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hJig8-00066u-Ln
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 18:01:00 +0000
Received: by mail-lj1-x241.google.com with SMTP id h21so415247ljk.13
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2019 11:00:59 -0700 (PDT)
In-Reply-To: <20190417175815.16905-4-julien.grall@arm.com>
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
Cc: Oleksandr_Tyshchenko@epam.com, sstabellini@kernel.org, Andrii_Anisov@epam.com
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxNy4wNC4xOSAyMDo1OCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFRMQiBoZWxwZXJzIGlu
IHRoZSBoZWFkZXJzIHRsYmZsdXNoLmggYXJlIGN1cnJlbnRseSBxdWl0ZSBjb25mdXNpbmcgdG8K
PiB1c2UgdGhlIG5hbWUgbWF5IGxlYWQgdG8gdGhpbmsgdGhleSBhcmUgZGVhbGluZyB3aXRoIGh5
cGVydmlzb3JzIFRMQnMKPiB3aGlsZSB0aGV5IGFjdHVhbGx5IGRlYWwgd2l0aCBndWVzdCBUTEJz
Lgo+IAo+IFJlbmFtZSB0aGVtIHRvIG1ha2UgaXQgY2xlYXJlciB0aGF0IHdlIGFyZSBkZWFsaW5n
IHdpdGggZ3Vlc3QgVExCcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGll
bi5ncmFsbEBhcm0uY29tPgoKUmV2aWV3ZWQtYnk6IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlz
b3ZAZXBhbS5jb20+CgoKCi0tIApTaW5jZXJlbHksCkFuZHJpaSBBbmlzb3YuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
