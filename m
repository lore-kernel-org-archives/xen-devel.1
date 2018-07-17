From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH 05/15] xen/arm: p2m: Limit call to mem
 access code use in get_page_from_gva
Date: Tue, 17 Jul 2018 12:54:41 +0300
Message-ID: <f014d915-4fd3-7601-c0a1-39cf181150ba@bitdefender.com>
References: <20180716172712.20294-1-julien.grall@arm.com>
 <20180716172712.20294-6-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=b6xw=kb=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1ffMh0-0003wI-74
 for xen-devel@lists.xenproject.org; Tue, 17 Jul 2018 09:54:50 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id 3836B305CD3D
 for <xen-devel@lists.xenproject.org>; Tue, 17 Jul 2018 14:11:02 +0300 (EEST)
Received: from smtp03.buh.bitdefender.org (smtp.bitdefender.biz [10.17.80.77])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id A347D7FC03
 for <xen-devel@lists.xenproject.org>; Tue, 17 Jul 2018 12:54:47 +0300 (EEST)
In-Reply-To: <20180716172712.20294-6-julien.grall@arm.com>
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
Cc: sstabellini@kernel.org, Tamas K Lengyel <tamas@tklengyel.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMTYvMjAxOCAwODoyNyBQTSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE1lbSBhY2Nlc3Mg
aGFzIG9ubHkgYW4gaW1wYWN0IG9uIHRoZSBoYXJkd2FyZSB0cmFuc2xhdGlvbiBiZXR3ZWVuIGEK
PiBndWVzdCB2aXJ0dWFsIGFkZHJlc3MgYW5kIHRoZSBtYWNoaW5lIHBoeXNpY2FsIGFkZHJlc3Mu
IFNvIGl0IGlzIG5vdAo+IG5lY2Vzc2FyeSB0byBmYWxsYmFjayB0byBtZW1hY2Nlc3MgZm9yIGFs
bCB0aGUgb3RoZXIgY2FzZSAoZS5nIHdoZW4gaXQKPiBpcyBub3QgcG9zc2libGUgdG8gYWNxdWly
ZSB0aGUgcGFnZSBiZWhpbmQgdGhlIE1GTikuCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdy
YWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCkFja2VkLWJ5OiBSYXp2YW4gQ29qb2NhcnUgPHJj
b2pvY2FydUBiaXRkZWZlbmRlci5jb20+CgoKVGhhbmtzLApSYXp2YW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
