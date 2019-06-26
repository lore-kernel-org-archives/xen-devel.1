Return-Path: <SRS0=QQ86=UZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DEDAC48BD3
	for <xen-devel@archiver.kernel.org>; Wed, 26 Jun 2019 11:23:34 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C4DA2080C
	for <xen-devel@archiver.kernel.org>; Wed, 26 Jun 2019 11:23:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C4DA2080C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hg61K-0003vU-V4; Wed, 26 Jun 2019 11:23:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cvzu=UZ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hg61I-0003vP-S7
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 11:23:20 +0000
X-Inumbo-ID: cbc239e2-9804-11e9-804c-0fcbff8c5366
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id cbc239e2-9804-11e9-804c-0fcbff8c5366;
 Wed, 26 Jun 2019 11:23:17 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6EE67360;
 Wed, 26 Jun 2019 04:23:17 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B1FD53F718;
 Wed, 26 Jun 2019 04:23:16 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190610193215.23704-1-julien.grall@arm.com>
 <20190610193215.23704-12-julien.grall@arm.com>
 <alpine.DEB.2.21.1906251754050.5851@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <bb87eed6-82c0-fc01-f1a4-4e5b1f045d38@arm.com>
Date: Wed, 26 Jun 2019 12:23:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1906251754050.5851@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 11/17] xen/arm64: head: Document enable_mmu()
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
Cc: xen-devel@lists.xenproject.org, Oleksandr_Tyshchenko@epam.com,
 andrii_anisov@epam.com, andre.przywara@arm.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDI2LzA2LzIwMTkgMDI6MDMsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBPbiBNb24sIDEwIEp1biAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IERvY3VtZW50
IHRoZSBiZWhhdmlvciBhbmQgdGhlIG1haW4gcmVnaXN0ZXJzIHVzYWdlIHdpdGhpbiBlbmFibGVf
bW11KCkuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFy
bS5jb20+Cj4+IC0tLQo+PiAgIHhlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMgfCA3ICsrKysrKysK
Pj4gICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS94
ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TIGIveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUwo+PiBp
bmRleCA3YjkyYzFjOGViLi5kNjczZjdjMGQ4IDEwMDY0NAo+PiAtLS0gYS94ZW4vYXJjaC9hcm0v
YXJtNjQvaGVhZC5TCj4+ICsrKyBiL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMKPj4gQEAgLTU4
Myw2ICs1ODMsMTMgQEAgdmlydHBoeXNfY2xhc2g6Cj4+ICAgICAgICAgICByZXQKPj4gICBFTkRQ
Uk9DKGNyZWF0ZV9wYWdlX3RhYmxlcykKPj4gICAKPj4gKy8qCj4+ICsgKiBUdXJuIG9uIHRoZSBE
YXRhIENhY2hlIGFuZCB0aGUgTU1VLiBUaGUgZnVuY3Rpb24gd2lsbCByZXR1cm4gb24gdGhlIElE
Cj4+ICsgKiBtYXBwaW5nLiBJbiBvdGhlciB3b3JkLCB0aGUgY2FsbGVyIGlzIHJlc3BvbnNpYmxl
IHRvIHN3aXRjaCB0byB0aGUgcnVudGltZQo+PiArICogbWFwcGluZy4KPj4gKyAqCj4+ICsgKiBD
bG9iYmVycyB4MCAtIHgxCj4+ICsgKi8KPiAKPiBhcyBpdCBjYWxscyBQUklOVCwgc2hvdWxkbid0
IGl0IGJlIHgwIC0geDM/CgpZb3UgYXJlIHJpZ2h0LiBJIHdpbGwgdXBkYXRlIHRoZSBjb21tZW50
LgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
