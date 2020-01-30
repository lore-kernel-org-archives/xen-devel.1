Return-Path: <SRS0=pEfl=3T=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B06A1C33C9E
	for <xen-devel@archiver.kernel.org>; Thu, 30 Jan 2020 11:37:41 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84F4D206D5
	for <xen-devel@archiver.kernel.org>; Thu, 30 Jan 2020 11:37:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84F4D206D5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ix88M-000130-8J; Thu, 30 Jan 2020 11:37:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=suiz=3T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ix88L-00012v-Ac
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 11:37:17 +0000
X-Inumbo-ID: dd99ec0e-4354-11ea-ad98-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dd99ec0e-4354-11ea-ad98-bc764e2007e4;
 Thu, 30 Jan 2020 11:37:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C3EF8AC9A;
 Thu, 30 Jan 2020 11:37:15 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200117105358.607910-1-anthony.perard@citrix.com>
 <20200121135916.1140483-1-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <69ed5eba-e6ea-5b1e-20cc-d8f5a00d2cf3@suse.com>
Date: Thu, 30 Jan 2020 12:37:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200121135916.1140483-1-anthony.perard@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH v2.1 13/12] Makefile: Fix install-tests
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMDEuMjAyMCAxNDo1OSwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gVGhlIHRvcC1sZXZl
bCBtYWtlZmlsZSBtYWtlIHVzZXMgb2YgaW50ZXJuYWwgaW1wbGVtZW50YXRpb24gZGV0YWlsIG9m
Cj4gdGhlIHhlbiBidWlsZCBzeXN0ZW0uIEF2b2lkIHRoYXQgYnkgY3JlYXRpbmcgYSBuZXcgdGFy
Z2V0Cj4gImluc3RhbGwtdGVzdHMiIGluIHhlbi9NYWtlZmlsZSwgYW5kIGJ5IGZpeGluZyB0aGUg
dG9wLWxldmVsIE1ha2VmaWxlCj4gdG8gbm90IGNhbGwgeGVuL1J1bGVzLm1rIGFueW1vcmUuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5j
b20+CgpUaGlzIGluIHByaW5jaXBsZSBjb3VsZCBoYXZlIG15IFItYiwgYnV0IC4uLgoKPiAtLS0g
YS94ZW4vTWFrZWZpbGUKPiArKysgYi94ZW4vTWFrZWZpbGUKPiBAQCAtOTAsNiArOTAsOSBAQCBf
aW5zdGFsbDogJChUQVJHRVQpJChDT05GSUdfWEVOX0lOU1RBTExfU1VGRklYKQo+ICAuUEhPTlk6
IF90ZXN0cwo+ICBfdGVzdHM6Cj4gIAkkKE1BS0UpIC1mICQoQkFTRURJUikvUnVsZXMubWsgLUMg
dGVzdCB0ZXN0cwo+ICsuUEhPTlk6IGluc3RhbGwtdGVzdHMKPiAraW5zdGFsbC10ZXN0czoKPiAr
CSQoTUFLRSkgLWYgJChCQVNFRElSKS9SdWxlcy5tayAtQyB0ZXN0IGluc3RhbGwKCi4uLiBJJ20g
aXJyaXRhdGVkIGJ5IHRoZSBwYXRjaCBjb250ZXh0IGhlcmU6IFBhdGNoIDggY2hhbmdlZApfdGVz
dHMgdG8gdGVzdHMsIGFuZCBieSB0aGUgbnVtYmVyaW5nIHRoaXMgcGF0Y2ggZ29lcyBvbiB0b3AK
b2YgcGF0Y2ggOC4gQ291bGQgeW91IGNsYXJpZnkgd2hhdCdzIGdvaW5nIG9uIGhlcmUsIHBsZWFz
ZT8KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
