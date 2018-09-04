From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH v3 07/16] x86/p2m/pod: make it build with
 !CONFIG_HVM
Date: Tue, 4 Sep 2018 20:08:00 +0300
Message-ID: <8fb4fa98-b965-c59f-231c-562989695b9c@bitdefender.com>
References: <20180904161533.11575-1-wei.liu2@citrix.com>
 <20180904161533.11575-8-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=i5qz=ls=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1fxEo9-0000ut-UR
 for xen-devel@lists.xenproject.org; Tue, 04 Sep 2018 17:08:05 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id A9A4E305FFB1
 for <xen-devel@lists.xenproject.org>; Tue,  4 Sep 2018 20:08:03 +0300 (EEST)
Received: from smtp02.buh.bitdefender.net (smtp.bitdefender.biz [10.17.80.76])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id 98E3A7FE6C
 for <xen-devel@lists.xenproject.org>; Tue,  4 Sep 2018 20:08:03 +0300 (EEST)
In-Reply-To: <20180904161533.11575-8-wei.liu2@citrix.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gOS80LzE4IDc6MTUgUE0sIFdlaSBMaXUgd3JvdGU6Cj4gUG9wdWxhdGUtb24tZGVtYW5kIGlz
IEhWTSBvbmx5Lgo+IAo+IFByb3ZpZGUgYSBidW5jaCBvZiBzdHVicyBmb3IgY29tbW9uIHAybSBj
b2RlIGFuZCBndWFyZCBvbmUgaW52b2NhdGlvbgo+IG9mIGd1ZXN0X3BoeXNtYXBfbWFya19wb3B1
bGF0ZV9vbl9kZW1hbmQgd2l0aCBpc19odm1fZG9tYWluLgo+IAo+IFB1dCByZWxldmFudCBmaWVs
ZHMgaW4gcDJtX2RvbWFpbiBhbmQgY29kZSB3aGljaCB0b3VjaGVzIHRob3NlIGZpZWxkcwo+IHVu
ZGVyIENPTkZJR19IVk0uCj4gCj4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0
cml4LmNvbT4KClNpZ25lZC1vZmYtYnk6IFJhenZhbiBDb2pvY2FydSA8cmNvam9jYXJ1QGJpdGRl
ZmVuZGVyLmNvbT4KCgpUaGFua3MsClJhenZhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
