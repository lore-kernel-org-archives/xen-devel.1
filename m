From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH RFC] x86/altp2m: fix display frozen when
 switching to a new view early
Date: Wed, 19 Sep 2018 16:05:44 +0300
Message-ID: <63805374-8d0c-950a-d564-635d34e44dbe@bitdefender.com>
References: <1535963136-31751-1-git-send-email-rcojocaru@bitdefender.com>
 <a44355eb-79ab-30ee-26d1-4d611dc8eeb7@citrix.com>
 <4344eb54-0513-02a3-5c60-2640b1139e17@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pw+p=mb=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1g2cBB-0004Ua-Lm
 for xen-devel@lists.xenproject.org; Wed, 19 Sep 2018 13:06:05 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id 20C7E305FFA8
 for <xen-devel@lists.xenproject.org>; Wed, 19 Sep 2018 16:06:03 +0300 (EEST)
Received: from smtp03.buh.bitdefender.org (smtp.bitdefender.biz [10.17.80.77])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id 0D0387FC39
 for <xen-devel@lists.xenproject.org>; Wed, 19 Sep 2018 16:06:03 +0300 (EEST)
In-Reply-To: <4344eb54-0513-02a3-5c60-2640b1139e17@bitdefender.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org, george.dunlap@eu.citrix.com
Cc: andrew.cooper3@citrix.com, kevin.tian@intel.com, wei.liu2@citrix.com, jbeulich@suse.com, jun.nakajima@intel.com
List-Id: xen-devel@lists.xenproject.org

PiBCdXQgYWN0dWFsbHkgdGhlIHNlcXVlbmNlIEknbSB3b3JyaWVkIGFib3V0IGlzOgo+IAo+IDEu
IE1pc2NvbmZpZ3VyZSBob3N0cDJtCj4gMi4gQ3JlYXRlIGFsdHAybQo+IDMuIEVuYWJsZSBhbHRw
Mm0KPiA0LiBTd2l0Y2ggdG8gYWx0cDJtIDEKPiA1LiBBIHdvdWxkLWJlLWZhdWx0IGluIHRoZSBo
b3N0cDJtIG5vIGxvbmdlciBvY2N1cnMKPiAKPiBQbGVhc2Ugbm90ZSB0aGUgYWRkaXRpb25hbCBz
dGVwIDIuIEF0IHRoaXMgcG9pbnQsIHRoZSBob3N0cDJtIGhhcyBiZWVuCj4gbWlzY29uZmlndXJl
ZCwgYnV0IHRoZSBjcmVhdGlvbiBvZiBhbHRwMm0gY2FtZSB0b28gbGF0ZSAtIHNvIHRoZQo+IG1p
c2NvbmZpZ3VyYXRpb24gb2YgdGhlIGhvc3RwMm0gY291bGQgbm90IGhhdmUgcHJvcGFnYXRlZCB0
byBhbHRwMm0gMSwKPiBzaW5jZSBpdCBkaWRuJ3QgeWV0IGV4aXN0IHdoZW4gaXQgd2FzIG1pc2Nv
bmZpZ3VyZWQuCj4gCj4gRG9lcyBub3Qgc3dpdGNoaW5nIHRvIGFsdHAybSAxIHRoZW4gbG9zZSB0
aGUgRVBUIG1pc2NvbmZpZ3VyYXRpb24/CgpTb3JyeSwgcGxlYXNlIHN3aXRjaCBzdGVwcyAyIGFu
ZCAzIC0gY2xlYXJseSB3ZSBuZWVkIHRvIGZpcnN0IGVuYWJsZQphbHRwMm0gdG8gYmUgYWJsZSB0
byBjcmVhdGUgYSBuZXcgYWx0cDJtLiA6KSBBZnRlciB0aGUgZmlyc3QgdHlwbyB0aGUKdGV4dCBi
ZWNhbWUgYSBiaXQgZGlzdG9ydGVkIGFzIHdlbGwuCgoKVGhhbmtzLApSYXp2YW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
