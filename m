From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH for-4.12] arm/p2m: do not invalidate p2m
 root if it is shared with IOMMU
Date: Mon, 28 Jan 2019 18:40:01 +0200
Message-ID: <8cbacbc7-e57c-b0c5-7e0e-ad238f795b5d@gmail.com>
References: <1548689694-30028-1-git-send-email-andrii.anisov@gmail.com>
 <4ab0408f-edf2-5302-17ee-3c181d5d561e@arm.com>
 <eb581cac-7123-e61d-0680-8f409018fa15@gmail.com>
 <0aa633d6-e671-8c22-1b73-fa1d47c5f6c5@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=M9ZJ=QE=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1go9x8-0008BS-MZ
 for xen-devel@lists.xenproject.org; Mon, 28 Jan 2019 16:40:06 +0000
Received: by mail-lf1-x144.google.com with SMTP id z13so12320949lfe.11
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jan 2019 08:40:05 -0800 (PST)
In-Reply-To: <0aa633d6-e671-8c22-1b73-fa1d47c5f6c5@arm.com>
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

CgpPbiAyOC4wMS4xOSAxODozNiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhvbGQgb24sIENBNTcg
YW5kIENBNTMgYXJlIEFSTXY4IGNvcmVzLiBTbyBhcmUgeW91IHVzaW5nIDMyLWJpdCBvciA2NC1i
aXQgZ3Vlc3RzPwo2NC1iaXQgZ3Vlc3RzLgoKPiA2NC1iaXQgZ3Vlc3Qgc2hvdWxkIG5vdCBoYXZl
IGFueSBTZXQvV2F5IG9wZXJhdGlvbnMgdW5sZXNzIHlvdSBhcmUgdXNpbmcgYSB2ZXJ5IHZlcnkg
b2xkIExpbnV4LiBTbyB3aGF0IGlzIHRoZSB2ZXJzaW9uIG9mIGVhY2ggZ3Vlc3Q/CkFsbCBvZiB0
aGVtIGRlcml2ZWQgZnJvbSA0LjE0LjM1LgoKLS0gClNpbmNlcmVseSwKQW5kcmlpIEFuaXNvdi4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
