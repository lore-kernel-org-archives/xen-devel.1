From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v4 9/9] xen/gntdev: Implement dma-buf import
 functionality
Date: Fri, 15 Jun 2018 17:03:10 -0400
Message-ID: <33f9ab75-4297-d4e0-4ad5-d432cbf3242d__31246.0788795308$1529096535$gmane$org@oracle.com>
References: <20180615062753.9229-1-andr2000@gmail.com>
 <20180615062753.9229-10-andr2000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=if9m=jb=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fTvsb-0006zL-OP
 for xen-devel@lists.xenproject.org; Fri, 15 Jun 2018 21:03:33 +0000
In-Reply-To: <20180615062753.9229-10-andr2000@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, jgross@suse.com, konrad.wilk@oracle.com
Cc: daniel.vetter@intel.com, matthew.d.roper@intel.com, dongwon.kim@intel.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMTUvMjAxOCAwMjoyNyBBTSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4g
RnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVw
YW0uY29tPgo+Cj4gMS4gSW1wb3J0IGEgZG1hLWJ1ZiB3aXRoIHRoZSBmaWxlIGRlc2NyaXB0b3Ig
cHJvdmlkZWQgYW5kIGV4cG9ydAo+ICAgIGdyYW50ZWQgcmVmZXJlbmNlcyB0byB0aGUgcGFnZXMg
b2YgdGhhdCBkbWEtYnVmIGludG8gdGhlIGFycmF5Cj4gICAgb2YgZ3JhbnQgcmVmZXJlbmNlcy4K
Pgo+IDIuIEFkZCBBUEkgdG8gY2xvc2UgYWxsIHJlZmVyZW5jZXMgdG8gYW4gaW1wb3J0ZWQgYnVm
ZmVyLCBzbyBpdCBjYW4gYmUKPiAgICByZWxlYXNlZCBieSB0aGUgb3duZXIuIFRoaXMgaXMgb25s
eSB2YWxpZCBmb3IgYnVmZmVycyBjcmVhdGVkIHdpdGgKPiAgICBJT0NUTF9HTlRERVZfRE1BQlVG
X0lNUF9UT19SRUZTLgo+Cj4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28g
PG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPgoKClJldmlld2VkLWJ5OiBCb3JpcyBP
c3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
