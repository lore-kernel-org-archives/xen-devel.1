Return-Path: <SRS0=b7qU=UP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 771C7C31E50
	for <xen-devel@archiver.kernel.org>; Sun, 16 Jun 2019 20:24:01 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CE8F2084D
	for <xen-devel@archiver.kernel.org>; Sun, 16 Jun 2019 20:24:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CE8F2084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hcbgh-0005yH-Io; Sun, 16 Jun 2019 20:23:39 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5YfY=UP=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hcbgg-0005yC-NY
 for xen-devel@lists.xenproject.org; Sun, 16 Jun 2019 20:23:38 +0000
X-Inumbo-ID: 9f22dd3d-9074-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 9f22dd3d-9074-11e9-8980-bc764e045a96;
 Sun, 16 Jun 2019 20:23:37 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A183344;
 Sun, 16 Jun 2019 13:23:37 -0700 (PDT)
Received: from [10.37.12.2] (unknown [10.37.12.2])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E65E3F738;
 Sun, 16 Jun 2019 13:23:35 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190614175144.20046-1-julien.grall@arm.com>
 <20190614175144.20046-7-julien.grall@arm.com>
 <alpine.DEB.2.21.1906141400060.2072@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <5b96da0c-58aa-bfcb-be44-85a0f6e2f5f8@arm.com>
Date: Sun, 16 Jun 2019 21:23:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1906141400060.2072@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH MM-PART3 v3 6/9] xen/arm: mm: Use {,
 un}map_domain_page() to map/unmap Xen page-tables
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Andrii Anisov <Andrii_Anisov@epam.com>,
 Oleksandr_Tyshchenko@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDYvMTQvMTkgMTA6MDAgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBPbiBGcmksIDE0IEp1biAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEN1cnJlbnRs
eSwgdGhlIHZpcnR1YWwgYWRkcmVzcyBvZiB0aGUgM3JkIGxldmVsIHBhZ2UtdGFibGVzIGlzIG9i
dGFpbmVkCj4+IHVzaW5nIG1mbl90b192aXJ0KCkuCj4+Cj4+IE9uIEFybTMyLCBtZm5fdG9fdmly
dCBjYW4gb25seSB3b3JrIG9uIHhlbmhlYXAgcGFnZS4gV2hpbGUgaW4gdGhlb3J5Cj4+IGFsbCB0
aGUgcGFnZS10YWJsZXMgdXBkYXRlZCB3aWxsIHJlc2lkZSBpbiB4ZW5oZWFwLCBpbiBwcmFjdGlj
ZSB0aGUKPj4gcGFnZS10YWJsZXMgY292ZXJpbmcgWGVuIG1lbW9yeSAoZS5nIHhlbl9tYXBwaW5n
KSBpcyBwYXJ0IG9mIFhlbiBiaW5hcnkuCj4+Cj4+IEZ1cnRoZXJtb3JlLCBhIGZvbGxvdy11cCBj
aGFuZ2Ugd2lsbCB1cGRhdGUgeGVuX3B0X3VwZGF0ZV9lbnRyeSgpIHRvCj4+IHdhbGsgYWxsIHRo
ZSBsZXZlbHMgYW5kIHRoZXJlZm9yZSBiZSBtb3JlIGdlbmVyaWMuIFNvbWUgb2YgdGhlCj4+IHBh
Z2UtdGFibGVzIHdpbGwgYWxzbyBwYXJ0IG9mIFhlbiBtZW1vcnkgYW5kIHRoZXJlZm9yZSB3aWxs
IG5vdCBiZQo+PiByZWFjaGFibGUgdXNpbmcgbWZuX3RvX3ZpcnQoKS4KPj4KPj4gVGhlIGVhc2ll
c3Qgd2F5IHRvIHJlYWNoIHRob3NlIHBhZ2VzIGlzIHRvIHVzZSB7LCB1bn1tYXBfZG9tYWluX3Bh
Z2UoKS4KPj4gV2hpbGUgb24gYXJtMzIgdGhpcyBtZWFucyBhbiBleHRyYSBtYXBwaW5nIGluIHRo
ZSBub3JtYWwgY2FzZXMsIHRoaXMgaXMgbm90Cj4+IHZlcnkgaW1wb3J0YW50IGFzIHhlbiBwYWdl
LXRhYmxlcyBhcmUgbm90IHVwZGF0ZWQgb2Z0ZW4uCj4+Cj4+IEluIG9yZGVyIHRvIGFsbG93IGZ1
dHVyZSBjaGFuZ2UgaW4gdGhlIHdheSBYZW4gcGFnZS10YWJsZXMgYXJlIG1hcHBlZCwKPj4gdHdv
IG5ldyBoZWxwZXJzIGFyZSBpbnRyb2R1Y2VkIHRvIG1hcC91bm1hcCB0aGUgcGFnZS10YWJsZXMu
Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+
Cj4+IFJldmlld2VkLWJ5OiBBbmRyaWkgQW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgo+
Pgo+PiAtLS0KPj4gICAgICBDaGFuZ2VzIGluIHYzOgo+PiAgICAgICAgICAtIEZpeCB0eXBvIGlu
IHRoZSBjb21taXQgbWVzc2FnZQo+PiAgICAgICAgICAtIEFkZCBTdGVmYW5vJ3MgYWNrZWQtYnkK
PiAKPiBJdCBkaWRuJ3Qgc3RpY2ssIHNvOgo+IAo+IEFja2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxp
bmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cj4gCj4gOi0pCgpXaG9vcHMgeWVzLiBUaGFua2Z1
bGx5IEkgZGlkbid0IGFkZCBhbiBhY2sgYnkgbWlzdGFrZSB0aGlzIHRpbWUgOikuCgpDaGVlcnMs
CgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
