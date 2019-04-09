Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0F16C282CE
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 12:09:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AAB220883
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 12:09:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AAB220883
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDpZ8-0006Qx-Lp; Tue, 09 Apr 2019 12:09:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zDjF=SL=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hDpZ7-0006Qk-0K
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 12:09:25 +0000
X-Inumbo-ID: 500220f3-5ac0-11e9-92d7-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 500220f3-5ac0-11e9-92d7-bc764e045a96;
 Tue, 09 Apr 2019 12:09:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DBFF1A78;
 Tue,  9 Apr 2019 05:09:22 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C91643F59C;
 Tue,  9 Apr 2019 05:09:21 -0700 (PDT)
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20190327184531.30986-1-julien.grall@arm.com>
 <20190327184531.30986-11-julien.grall@arm.com>
 <eadcbf5c-6a94-0dd7-a9fa-744ff367276a@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <f1eda839-5ab6-712d-71a6-0b259cb8057c@arm.com>
Date: Tue, 9 Apr 2019 13:09:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <eadcbf5c-6a94-0dd7-a9fa-744ff367276a@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 10/12] xen/arm: mm: Mark
 check_memory_layout_alignment_constraints as unused
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
Cc: Artem_Mygaiev@epam.com, Oleksandr_Tyshchenko@epam.com,
 sstabellini@kernel.org, Andrii_Anisov@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190409120920.-fNACsDQy_nNSp7SbuxfWMxd7Mr5P86ul2BZWcWqhYU@z>

SGkgQW5kcmV3LAoKT24gMjcvMDMvMjAxOSAxOToxMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBP
biAyNy8wMy8yMDE5IDE4OjQ1LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IENsYW5nIHdpbGwgdGhy
b3cgYW4gZXJyb3IgaWYgYSBmdW5jdGlvbiBpcyB1bnVzZWQgdW5sZXNzIHlvdSB0ZWxsCj4+IHRv
IGlnbm9yZSBpdC4gVGhpcyBjYW4gYmUgZG9uZSB1c2luZyBfX21heWJlX3VudXNlZC4KPj4KPj4g
U2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPj4gLS0t
Cj4+ICAgeGVuL2FyY2gvYXJtL21tLmMgfCAzICsrLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2Fy
bS9tbS5jIGIveGVuL2FyY2gvYXJtL21tLmMKPj4gaW5kZXggMDFhZTJjY2NjMC4uZDM3OTI1MDUx
YSAxMDA2NDQKPj4gLS0tIGEveGVuL2FyY2gvYXJtL21tLmMKPj4gKysrIGIveGVuL2FyY2gvYXJt
L21tLmMKPj4gQEAgLTE2MCw3ICsxNjAsOCBAQCB1bnNpZ25lZCBsb25nIHRvdGFsX3BhZ2VzOwo+
PiAgIGV4dGVybiBjaGFyIF9faW5pdF9iZWdpbltdLCBfX2luaXRfZW5kW107Cj4+ICAgCj4+ICAg
LyogQ2hlY2tpbmcgVkEgbWVtb3J5IGxheW91dCBhbGlnbm1lbnQuICovCj4+IC1zdGF0aWMgaW5s
aW5lIHZvaWQgY2hlY2tfbWVtb3J5X2xheW91dF9hbGlnbm1lbnRfY29uc3RyYWludHModm9pZCkg
ewo+PiArc3RhdGljIF9fbWF5YmVfdW51c2VkIHZvaWQgY2hlY2tfbWVtb3J5X2xheW91dF9hbGln
bm1lbnRfY29uc3RyYWludHModm9pZCkKPiAKPiBBcyB5b3UncmUgYWxyZWFkeSBjaGFuZ2luZyB0
aGlzLi4uCj4gCj4gVGhlIHN0eWxlIHVzZWQgZWxzZXdoZXJlIGlzCj4gCj4gc3RhdGljIHZvaWQg
X19pbml0IF9fbWF5YmVfdW51c2VkIGJ1aWxkX2Fzc2VydGlvbnModm9pZCkKPiAKPiB3aGljaCBo
YXMgdGhlIGFkZGVkIGFkdmFudGFnZSB0aGF0IGl0IG1vcmUgb2J2aW91cyB0byBmdXR1cmUgZGV2
ZWxvcGVycwo+IHRoYXQgdHJ5aW5nIHRvIHB1dCBjb2RlIG90aGVyIHRoYW4gQlVJTERfQlVHX09O
KCkgaW4gaXQgaXMgYSBiYWQgaWRlYS4KCkdvb2QgcG9pbnQuIEkgd2lsbCB1cGRhdGUgdGhpcyBw
YXRjaCAoYW5kIHRoZSBmb2xsb3dpbmcgb25lKSB0byByZW5hbWUgdGhlIApmdW5jdGlvbiBhcyB3
ZWxsLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
