From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH v3 11/16] x86/mm: put HVM only code under
 CONFIG_HVM
Date: Tue, 4 Sep 2018 20:10:54 +0300
Message-ID: <e94880c8-3e6b-dce1-dabf-16f0cf70ba19@bitdefender.com>
References: <20180904161533.11575-1-wei.liu2@citrix.com>
 <20180904161533.11575-12-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=i5qz=ls=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1fxEqw-0001dw-52
 for xen-devel@lists.xenproject.org; Tue, 04 Sep 2018 17:10:58 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id 00F4D305FFAB
 for <xen-devel@lists.xenproject.org>; Tue,  4 Sep 2018 20:10:57 +0300 (EEST)
Received: from smtp02.buh.bitdefender.net (smtp.bitdefender.biz [10.17.80.76])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id 000097FE4F
 for <xen-devel@lists.xenproject.org>; Tue,  4 Sep 2018 20:10:56 +0300 (EEST)
In-Reply-To: <20180904161533.11575-12-wei.liu2@citrix.com>
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

T24gOS80LzE4IDc6MTUgUE0sIFdlaSBMaXUgd3JvdGU6Cj4gR29pbmcgdGhyb3VnaCB0aGUgY29k
ZSwgSEFQLCBFUFQsIFBvRCBhbmQgQUxUUDJNIGRlcGVuZCBvbiBIVk0gY29kZS4KPiBQdXQgdGhl
c2UgY29tcG9uZW50cyB1bmRlciBDT05GSUdfSFZNLiBUaGlzIGZ1cnRoZXIgcmVxdWlyZXMgcHV0
dGluZwo+IG9uZSBvZiB0aGUgdm0gZXZlbnQgdW5kZXIgQ09ORklHX0hWTS4KPiAKPiBBbHRwMm0g
cmVxdWlyZXMgYSBiaXQgbW9yZSBhdHRlbnRpb24gYmVjYXVzZSBpdHMgY29kZSBpcyBlbWJlZGRl
ZCBpbgo+IGdlbmVyaWMgeDg2IHAybSBjb2RlLgo+IAo+IEFsc28gbWFrZSBoYXBfZW5hYmxlZCBl
dmFsdWF0ZSB0byBmYWxzZSB3aGVuICFDT05GSUdfSFZNLiBNYWtlIHN1cmUgaXQKPiBldmFsdWF0
ZSBpdHMgcGFyYW1ldGVyIHRvIGF2b2lkIHVudXNlZCB2YXJpYWJsZSB3YXJuaW5ncyBpbiBpdHMg
dXNlcnMuCj4gCj4gQWxzbyBzb3J0IGl0ZW1zIGluIE1ha2VmaWxlIHdoaWxlIGF0IGl0Lgo+IAo+
IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CgpBY2tlZC1ieTog
UmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPgoKClRoYW5rcywKUmF6
dmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
