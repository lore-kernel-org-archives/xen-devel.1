From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH V3] x86/altp2m: add
 altp2m_vcpu_disable_notify
Date: Mon, 24 Dec 2018 10:56:13 +0000
Message-ID: <0858fe0f-ede5-bfa8-32cf-0a78f53ab0ed@citrix.com>
References: <1545145904-6066-1-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=n6E3=PB=citrix.com=prvs=889790211=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gbNuD-0000tO-1P
 for xen-devel@lists.xenproject.org; Mon, 24 Dec 2018 10:56:17 +0000
In-Reply-To: <1545145904-6066-1-git-send-email-rcojocaru@bitdefender.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, wei.liu2@citrix.com, konrad.wilk@oracle.com, George.Dunlap@eu.citrix.com, tim@xen.org, ian.jackson@eu.citrix.com, julien.grall@arm.com, jbeulich@suse.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMTgvMTIvMjAxOCAxNToxMSwgUmF6dmFuIENvam9jYXJ1IHdyb3RlOgo+IEFsbG93IGFsdHAy
bSB1c2VycyB0byBkaXNhYmxlICNWRS9WTUZVTkMgYWxvbmUuIEN1cnJlbnRseSBpdCBpcwo+IG9u
bHkgcG9zc2libGUgdG8gZGlzYWJsZSB0aGlzIGZ1bmN0aW9uYWxpdHkgd2hlbiB3ZSBkaXNhYmxl
IGFsdHAybQo+IGNvbXBsZXRlbHk7ICNWRS9WTUZVTkMgY2FuIG9ubHkgYmUgZW5hYmxlZCBvbmNl
IHBlciBhbHRwMm0gc2Vzc2lvbi4KPgo+IEluIGFkZGl0aW9uIHRvIG1ha2luZyB0aGluZ3MgY29t
cGxldGUsIGRpc2FibGluZyAjVkUgaXMgYWxzbyBhCj4gd29ya2Fyb3VuZCBmb3IgQ0ZXMTE2ICgi
V2hlbiBWaXJ0dWFsaXphdGlvbiBFeGNlcHRpb25zIGFyZSBFbmFibGVkLAo+IEVQVCBWaW9sYXRp
b25zIE1heSBHZW5lcmF0ZSBFcnJvbmVvdXMgVmlydHVhbGl6YXRpb24gRXhjZXB0aW9ucyIpCj4g
b24gWGVvbiBFLTIxMDAgQ1BVcy4KPgo+IFNpZ25lZC1vZmYtYnk6IFJhenZhbiBDb2pvY2FydSA8
cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4KClJldmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
