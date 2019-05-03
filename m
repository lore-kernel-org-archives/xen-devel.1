Return-Path: <SRS0=JVlm=TD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1105C43219
	for <xen-devel@archiver.kernel.org>; Fri,  3 May 2019 17:09:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B3ED20651
	for <xen-devel@archiver.kernel.org>; Fri,  3 May 2019 17:09:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B3ED20651
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMbgM-0001LX-Hs; Fri, 03 May 2019 17:09:10 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Vigr=TD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hMbgL-0001LS-T7
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 17:09:09 +0000
X-Inumbo-ID: 2a053d53-6dc6-11e9-843c-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 2a053d53-6dc6-11e9-843c-bc764e045a96;
 Fri, 03 May 2019 17:09:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A12CF15A2;
 Fri,  3 May 2019 10:09:08 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A74AF3F557;
 Fri,  3 May 2019 10:09:07 -0700 (PDT)
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
References: <20190422164937.21350-1-julien.grall@arm.com>
 <20190422164937.21350-16-julien.grall@arm.com>
 <3cbd6b72-b1ec-4bf0-9ab1-48ec40c2acb0@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <60d4ba1e-9bbe-04af-8050-02ddda48e7a3@arm.com>
Date: Fri, 3 May 2019 18:09:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <3cbd6b72-b1ec-4bf0-9ab1-48ec40c2acb0@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 15/20] xen/arm: mm: Use the shorter version
 __aligned(PAGE_SIZE) to align page-tables
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
Cc: Oleksandr_Tyshchenko@epam.com, sstabellini@kernel.org,
 Andrii_Anisov@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190503170906.-i-1hwtAWbP8cJZE5-rcD0-DT59vfWv3Mg8V0rKP3vI@z>

CgpPbiAwMy8wNS8yMDE5IDE2OjU4LCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IAo+IAo+IE9uIDIy
LjA0LjE5IDE5OjQ5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IFdlIGN1cnJlbnRseSB1c2UgdGhl
IHZlcnkgbG9uZyB2ZXJzaW9uIF9fYXR0cmlidXRlX18oKF9fYWxpZ25lZCg0MDk2KSkpCj4+IHRv
IGFsaWduIHBhZ2UtdGFibGVzLiBUaGFua2Z1bGx5IHRoZXJlIGlzIGEgc2hvcnRlciB2ZXJzaW9u
IHRvIG1ha2UKPiAKPiBJTU8gaXQgaXMgYmV0dGVyIHRvIGNoYW5nZSBgdmVyc2lvbmAgdG8gYG1h
Y3JvYC4gSW4gb3JkZXIgdG8gc3BlY2lmeSBpdCBpcyBub3QgYSAKPiBjb21waWxlciBzcGVjaWZp
YyBidXQgc3BlY2lmaWMgdG8gWEVOLgoKSSB3aWxsIHJld29yZCB0byAiVGhhbmtmdWxseSBYZW4g
cHJvdmlkZXMgYW4gaGFuZHkgbWFjcm8gdGhhdCB3aWxsIG1ha2UgdGhlIGNvZGUgCm1vcmUgcmVh
ZGFibGUiLgoKPiAKPj4gdGhlIGNvZGUgbW9yZSByZWFkYWJsZS4KPj4KPj4gV2hpbGUgbW9kaWZ5
aW5nIHRoZSBhdHRyaWJ1dGU6Cj4+IMKgwqDCoMKgIDEpIE1vdmUgaXQgYmVmb3JlIHRoZSB2YXJp
YWJsZSBuYW1lIGFzIHdlIGRvIGluIG90aGVyIHBhcnQgb2YgWGVuCj4+IMKgwqDCoMKgIDIpIFN3
aXRjaCB0byBQQUdFX1NJWkUgaW5zdGVhZCBvZiA0MDk2IHRvIG1ha2UgbW9yZSBmdXR1cmUtcHJv
b2YKPj4gwqDCoMKgwqAgMykgTWFyayBzdGF0aWMgcGFnZS10YWJsZXMgbm90IHVzZWQgb3V0c2lk
ZSB0aGUgZmlsZSAoaS5lIGFueQo+PiDCoMKgwqDCoMKgwqDCoCBwYWdlLXRhYmxlcyBvdGhlciB0
aGFuIGJvb3RfKiBhbmQgeGVuX2ZpeG1hcCkuCj4+Cj4+IExhc3RseSwgc29tZSBvZiB0aGUgdmFy
aWFibGVzIHVzZSBfX2F0dHJpYnV0ZV9fKF9fYWxpZ25lZChYICogNDA5NikpLgo+PiBIb3dldmVy
IHRoaXMgaXMgbm90IG5lY2Vzc2FyeSBhcyBwYWdlLXRhYmxlcyBhcmUgb25seSByZXF1aXJlZCB0
byBiZQo+PiB0byBiZSBhbGlnbmVkIHRvIGEgcGFnZS1zaXplLiBTbyB1c2UgX19hbGlnbmVkKFBB
R0VfU0laRSkuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxs
QGFybS5jb20+Cj4gVGhvdWdoOgo+IAo+IFJldmlld2VkLWJ5OiBBbmRyaWkgQW5pc292IDxhbmRy
aWlfYW5pc292QGVwYW0uY29tPgo+IAoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
