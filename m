From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH for-4.12 v3 4/8] xen/arm: Make
 get_page_from_gfn working with DOMID_XEN
Date: Fri, 21 Dec 2018 19:26:31 +0200
Message-ID: <a96fbf44-77e6-fd15-740e-8d1ede2b8694@gmail.com>
References: <20181221162650.11515-1-julien.grall@arm.com>
 <20181221162650.11515-5-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/5Gq=O6=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gaOZH-0005j5-QB
 for xen-devel@lists.xenproject.org; Fri, 21 Dec 2018 17:26:35 +0000
Received: by mail-lj1-x244.google.com with SMTP id s5-v6so5393031ljd.12
 for <xen-devel@lists.xenproject.org>; Fri, 21 Dec 2018 09:26:34 -0800 (PST)
In-Reply-To: <20181221162650.11515-5-julien.grall@arm.com>
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
Cc: sstabellini@kernel.org
List-Id: xen-devel@lists.xenproject.org

CgpPbiAyMS4xMi4xOCAxODoyNiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IERPTUlEX1hFTiBpcyB1
c2VkIHRvIHNoYXJlIHBhZ2VzIGJlbG9naW5nIHRvIHRoZSBoeXBlcnZpc29yCj4gKGUuZyB0cmFj
ZSBidWZmZXJzKS4gVW5saWtlIG90aGVyIGRvbWFpbnMsIERPTUlEX1hFTiBpcyBhIG5vbi1hdXRv
Cj4gdHJhbnNsYXRlZCBkb21haW4gYW5kIHRoZXJlZm9yZSBkb2VzIG5vdCBoYXZlIGEgUDJNLgo+
IAo+IFRoaXMgcGF0Y2ggYWRkcyBhIHNwZWNpYWwgY2FzZSBmb3IgRE9NSURfWEVOIGluIGdldF9w
YWdlX2Zyb21fZ2ZuLiBXZQo+IG1heSB3YW50IHRvIHByb3ZpZGUgIm5vbi1hdXRvIHRyYW5zbGF0
ZWQgaGVscGVycyIgaW4gdGhlIGZ1dHVyZSBpZiB3ZQo+IHNlZSBtb3JlIGNhc2UuCj4gCj4gU2ln
bmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCkFuZHJpaSBB
bmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+CgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5p
c292LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
