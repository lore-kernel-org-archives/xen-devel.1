From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH v2 9/9] xen/gntdev: Expose gntdev's dma-buf
 API for in-kernel use
Date: Wed, 6 Jun 2018 15:46:58 +0300
Message-ID: <984bcf75-9bea-aceb-3d3a-62e3c65709c7__47309.528469532$1528289156$gmane$org@gmail.com>
References: <20180601114132.22596-1-andr2000@gmail.com>
 <20180601114132.22596-10-andr2000@gmail.com>
 <86f5b340-856c-204f-4ba7-dd51f1e92639@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=yvez=iy=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1fQXqB-0000jH-IJ
 for xen-devel@lists.xenproject.org; Wed, 06 Jun 2018 12:47:03 +0000
Received: by mail-lf0-x244.google.com with SMTP id t134-v6so8902343lff.6
 for <xen-devel@lists.xenproject.org>; Wed, 06 Jun 2018 05:47:02 -0700 (PDT)
In-Reply-To: <86f5b340-856c-204f-4ba7-dd51f1e92639@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, dongwon.kim@intel.com, matthew.d.roper@intel.com
Cc: jgross@suse.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, daniel.vetter@intel.com, xen-devel@lists.xenproject.org, linux-media@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMDUvMjAxOCAwMTozNiBBTSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+IE9uIDA2LzAx
LzIwMTggMDc6NDEgQU0sIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOgo+PiBGcm9tOiBP
bGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+
Cj4+Cj4+IEFsbG93IGNyZWF0aW5nIGdyYW50IGRldmljZSBjb250ZXh0IGZvciB1c2UgYnkga2Vy
bmVsIG1vZHVsZXMgd2hpY2gKPj4gcmVxdWlyZSBmdW5jdGlvbmFsaXR5LCBwcm92aWRlZCBieSBn
bnRkZXYuIEV4cG9ydCBzeW1ib2xzIGZvciBkbWEtYnVmCj4+IEFQSSBwcm92aWRlZCBieSB0aGUg
bW9kdWxlLgo+IENhbiB5b3UgZ2l2ZSBhbiBleGFtcGxlIG9mIHdobydkIGJlIHVzaW5nIHRoZXNl
IGludGVyZmFjZXM/ClRoZXJlIGlzIG5vIHVzZS1jYXNlIGF0IHRoZSBtb21lbnQgSSBjYW4gdGhp
bmsgb2YsIGJ1dCBoeXBlciBkbWEtYnVmIApbMV0sIFsyXQpJIGxldCBJbnRlbCBmb2xrcyAoQ0Nl
ZCkgdG8gZGVmZW5kIHRoaXMgcGF0Y2ggYXMgaXQgd2FzIGRvbmUgcHJpbWFyaWx5IApmb3IgdGhl
bQphbmQgSSBkb24ndCB1c2UgaXQgaW4gYW55IG9mIG15IHVzZS1jYXNlcy4gU28sIGZyb20gdGhp
cyBQT1YgaXQgY2FuIGJlIApkcm9wcGVkLAphdCBsZWFzdCBmcm9tIHRoaXMgc2VyaWVzLgo+Cj4g
LWJvcmlzCj4KWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMzgy
MDcvClsyXSBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvMjA0NDQ3LwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
