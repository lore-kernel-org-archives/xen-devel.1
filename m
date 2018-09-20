From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH v5 3/3] x86/altp2m: Add a hvmop for querying
 the suppress #VE bit
Date: Thu, 20 Sep 2018 10:46:01 +0300
Message-ID: <eb0df7dc-ce09-7611-5b63-8b8583c39b4b@bitdefender.com>
References: <20180903154836.25708-1-apop@bitdefender.com>
 <20180903154836.25708-4-apop@bitdefender.com>
 <20180919144818.7ccf6unelnspdd74@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=tdcx=mc=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1g2tfJ-0004K6-DB
 for xen-devel@lists.xenproject.org; Thu, 20 Sep 2018 07:46:21 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id 2C40F305FFAF
 for <xen-devel@lists.xenproject.org>; Thu, 20 Sep 2018 10:46:19 +0300 (EEST)
Received: from smtp01.buh.bitdefender.com (smtp.bitdefender.biz [10.17.80.75])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id 1C84A7FE69
 for <xen-devel@lists.xenproject.org>; Thu, 20 Sep 2018 10:46:19 +0300 (EEST)
In-Reply-To: <20180919144818.7ccf6unelnspdd74@zion.uk.xensource.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Adrian Pop <apop@bitdefender.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>, Sergej Proskurin <proskurin@sec.in.tum.de>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gOS8xOS8xOCA1OjQ4IFBNLCBXZWkgTGl1IHdyb3RlOgo+IE9uIE1vbiwgU2VwIDAzLCAyMDE4
IGF0IDA2OjQ4OjM2UE0gKzAzMDAsIEFkcmlhbiBQb3Agd3JvdGU6Cj4+IFNpZ25lZC1vZmYtYnk6
IEFkcmlhbiBQb3AgPGFwb3BAYml0ZGVmZW5kZXIuY29tPgo+IAo+IEFja2VkLWJ5OiBXZWkgTGl1
IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+IAo+IEZBT0QgSSdtIGV4cGVjdGluZyB5b3UgdG8gYWRk
cmVzcyBUYW1hcycgY29tbWVudCBpbiBwYXRjaCAxIGFuZCByZXNlbmQuCgpIZWxsbyBXZWksCgpU
aGF0IGhhcyBhbHJlYWR5IGJlZW4gYWRkcmVzc2VkIGluIFY2LCBhbmQgdGhlIHBhdGNoIGlzIGFs
cmVhZHkgaW46CgpodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD14ZW4uZ2l0O2E9Y29t
bWl0ZGlmZjtoPWVlYTRlYzJiNjZkYWQ4N2VjNzQ1Nzc4YWI5ZjAwZTEyZWYwZjI3NjAKCgpUaGFu
a3MsClJhenZhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
