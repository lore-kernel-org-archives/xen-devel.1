From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH v2 15/23] x86/mm: put HVM only code under
 CONFIG_HVM
Date: Sun, 26 Aug 2018 19:39:40 +0300
Message-ID: <9da14ac2-e8bc-3981-783b-31a4e136f489@bitdefender.com>
References: <cover.65253d1128f698146b48c4ff3bba2198f360c7b1.1535285866.git-series.wei.liu2@citrix.com>
 <1f5209e13cb12be42209f977c97290dd4343d2a8.1535285866.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=3m2n=lj=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1fty4s-0006G0-JK
 for xen-devel@lists.xenproject.org; Sun, 26 Aug 2018 16:39:50 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id 482B3305FFA8
 for <xen-devel@lists.xenproject.org>; Sun, 26 Aug 2018 19:39:48 +0300 (EEST)
Received: from smtp03.buh.bitdefender.org (smtp.bitdefender.biz [10.17.80.77])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id 127DB7FE67
 for <xen-devel@lists.xenproject.org>; Sun, 26 Aug 2018 19:39:48 +0300 (EEST)
In-Reply-To: <1f5209e13cb12be42209f977c97290dd4343d2a8.1535285866.git-series.wei.liu2@citrix.com>
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gOC8yNi8xOCAzOjE5IFBNLCBXZWkgTGl1IHdyb3RlOgo+IEdvaW5nIHRocm91Z2ggdGhlIGNv
ZGUsIEhBUCwgRVBULCBQb0QgYW5kIEFMVFAyTSBkZXBlbmQgb24gSFZNIGNvZGUuCj4gUHV0IHRo
ZXNlIGNvbXBvbmVudHMgdW5kZXIgQ09ORklHX0hWTS4gVGhpcyBmdXJ0aGVyIHJlcXVpcmVzIHB1
dHRpbmcKPiBvbmUgb2YgdGhlIHZtIGV2ZW50IHVuZGVyIENPTkZJR19IVk0uCj4gCj4gQWxzbyBt
YWtlIGhhcF9lbmFibGVkIGV2YWx1YXRlIHRvIGZhbHNlIHdoZW4gIUNPTkZJR19IVk0uIFRoaXMg
aW4gdHVybgo+IHJlcXVpcmVzIG1hcmtpbmcgYSB2YXJpYWJsZSBpbiBwMm1fc2V0X2VudHJ5IGFz
IF9fbWF5YmVfdW51c2VkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNp
dHJpeC5jb20+CgpBY2tlZC1ieTogUmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5k
ZXIuY29tPgoKClRoYW5rcywKUmF6dmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
