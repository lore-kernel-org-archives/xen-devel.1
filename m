From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH for-4.12 5/8] xen/arm: p2m: Only use isb()
 when it is necessary
Date: Fri, 21 Dec 2018 14:48:44 +0000
Message-ID: <843230fe-31c5-25b8-3eae-a72de8a15b0d@arm.com>
References: <20181128164939.8329-1-julien.grall@arm.com>
 <20181128164939.8329-6-julien.grall@arm.com>
 <f05481f4-d9c2-15be-ca3f-043ad2a9bb92@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8mGA=O6=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gaM6c-0003R9-N7
 for xen-devel@lists.xenproject.org; Fri, 21 Dec 2018 14:48:50 +0000
In-Reply-To: <f05481f4-d9c2-15be-ca3f-043ad2a9bb92@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
Cc: andre.przywara@arm.com, sstabellini@kernel.org
List-Id: xen-devel@lists.xenproject.org

CgpPbiAyMS8xMi8yMDE4IDE0OjQzLCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IAo+IAo+IE9uIDI4
LjExLjE4IDE4OjQ5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gCj4+IMKgwqDCoMKgwqAgaWYgKCAq
bGFzdF92Y3B1X3JhbiAhPSBJTlZBTElEX1ZDUFVfSUQgJiYgKmxhc3RfdmNwdV9yYW4gIT0gbi0+
dmNwdV9pZCApCj4+ICvCoMKgwqAgewo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZmx1c2hfdGxiX2xv
Y2FsKCk7Cj4+ICvCoMKgwqAgfQo+IEJUVywgbWlzc2VkIG1lbnRpb25pbmcgdGhhdCBjdXJseSBi
cmFjZXMgYWJvdmUgYXJlIG9kZCBieSBjb2Rpbmcgc3R5bGUuCgpJdCBpcyBub3Qgb2RkLCBqdXN0
IHVubmVjZXNzYXJ5LiBJIHdpbGwgZHJvcCB0aGVtLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFs
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
