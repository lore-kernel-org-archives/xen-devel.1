From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH 2/7] xen/arm: Remove
 flush_xen_text_tlb_local()
Date: Fri, 26 Apr 2019 18:08:40 +0300
Message-ID: <0bce7c0c-12cd-d532-0441-21d6448db73f@gmail.com>
References: <20190417175815.16905-1-julien.grall@arm.com>
 <20190417175815.16905-3-julien.grall@arm.com>
 <3fa56715-823e-985b-384c-dc8342d77364@gmail.com>
 <fb22f2a1-f3a6-a962-a9ba-54c22e5c7d2a@arm.com>
 <4e365b84-122d-e613-ceaa-e2df8c865262@gmail.com>
 <eb656a28-7910-c65a-bf50-1c62494f5acd@gmail.com>
 <7c231a06-bac3-1a76-2fc8-73042a900953@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TPdi=S4=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hK2T1-0007Ws-7O
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 15:08:47 +0000
Received: by mail-lf1-x141.google.com with SMTP id i68so2600988lfi.10
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2019 08:08:45 -0700 (PDT)
In-Reply-To: <7c231a06-bac3-1a76-2fc8-73042a900953@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "Oleksandr_Tyshchenko@epam.com" <Oleksandr_Tyshchenko@epam.com>, nd <nd@arm.com>, "Andrii_Anisov@epam.com" <Andrii_Anisov@epam.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAyNi4wNC4xOSAxNzozMSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhvd2V2ZXIsIHNwZWFr
aW5nIHdpdGggTWFyayBSdXRsYW5kLCBpdCB3b3VsZCBiZSBiZXN0IHRvIGtlZXAgdGhlIHNlcXVl
bmNlIHN1Z2dlc3QgaW4gdGhpcyBwYXRjaC4gU28gU0NUTFJfRUwyLldYTiBpcyB2aXNpYmxlIGJl
Zm9yZSB0aGUgZmx1c2ggYW5kIHRoZSBmbHVzaCB3aWxsIGVuc3VyZSBhbGwgY3VycmVudCBlbnRy
aWVzIGFyZSByZW1vdmVkLiBTbyBub25lIG9mIHRoZSBlbnRyaWVzIHNob3VsZCBoYXZlIFdYTiBj
bGVhcmVkLgo+IAo+IFNvIEkgd2lsbCBrZWVwIHRoaXMgcGF0Y2ggYXMgaXMuCgpBbmQgaXQgaXMg
cmlnaHQgZnJvbSBteSBwb2ludCBvZiB2aWV3LgoKLS0gClNpbmNlcmVseSwKQW5kcmlpIEFuaXNv
di4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
