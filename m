Return-Path: <SRS0=aHxP=YC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37753C47404
	for <xen-devel@archiver.kernel.org>; Wed,  9 Oct 2019 14:57:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BB9E218AC
	for <xen-devel@archiver.kernel.org>; Wed,  9 Oct 2019 14:57:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BB9E218AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIDOd-0002SC-PH; Wed, 09 Oct 2019 14:56:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8w+b=YC=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iIDOb-0002S5-JQ
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 14:56:57 +0000
X-Inumbo-ID: 09956c1a-eaa5-11e9-9bee-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 09956c1a-eaa5-11e9-9bee-bc764e2007e4;
 Wed, 09 Oct 2019 14:56:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06199337;
 Wed,  9 Oct 2019 07:56:56 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 505DE3F68E;
 Wed,  9 Oct 2019 07:56:55 -0700 (PDT)
To: Artem Mygaiev <joculator@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1570628924.git.artem_mygaiev@epam.com>
 <bfa088ac3fc17b90c2ba953e56294e9b26e8f5cc.1570628924.git.artem_mygaiev@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <b3742f94-8b53-81bd-cf60-fa41318ac21c@arm.com>
Date: Wed, 9 Oct 2019 15:56:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <bfa088ac3fc17b90c2ba953e56294e9b26e8f5cc.1570628924.git.artem_mygaiev@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/3] Remove useless ASSERT condition
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
Cc: Artem Mygaiev <artem_mygaiev@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQXJ0ZW0sCgpPbiAwOS8xMC8yMDE5IDE1OjIwLCBBcnRlbSBNeWdhaWV2IHdyb3RlOgo+IGNu
dCBpcyB1bnNpZ25lZCwgc28gYWx3YXlzID49MAo+IAo+IENvdmVyaXR5LUlEOiAxMzgxODQ4Cj4g
U2lnbmVkLW9mZi1ieTogQXJ0ZW0gTXlnYWlldiA8YXJ0ZW1fbXlnYWlldkBlcGFtLmNvbT4KCkFj
a2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKPiAtLS0KPiAgIHhl
bi9kcml2ZXJzL2NoYXIvc2NpZi11YXJ0LmMgfCAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMv
Y2hhci9zY2lmLXVhcnQuYyBiL3hlbi9kcml2ZXJzL2NoYXIvc2NpZi11YXJ0LmMKPiBpbmRleCBm
YTBiODI3NGNhLi45ZDNmNjZiNTViIDEwMDY0NAo+IC0tLSBhL3hlbi9kcml2ZXJzL2NoYXIvc2Np
Zi11YXJ0LmMKPiArKysgYi94ZW4vZHJpdmVycy9jaGFyL3NjaWYtdWFydC5jCj4gQEAgLTIwNSw3
ICsyMDUsNyBAQCBzdGF0aWMgaW50IHNjaWZfdWFydF90eF9yZWFkeShzdHJ1Y3Qgc2VyaWFsX3Bv
cnQgKnBvcnQpCj4gICAKPiAgICAgICAgLyogQ2hlY2sgbnVtYmVyIG9mIGRhdGEgYnl0ZXMgc3Rv
cmVkIGluIFRYIEZJRk8gKi8KPiAgICAgICBjbnQgPSBzY2lmX3JlYWR3KHVhcnQsIFNDSUZfU0NG
RFIpID4+IDg7Cj4gLSAgICBBU1NFUlQoIGNudCA+PSAwICYmIGNudCA8PSBwYXJhbXMtPmZpZm9f
c2l6ZSApOwo+ICsgICAgQVNTRVJUKCBjbnQgPD0gcGFyYW1zLT5maWZvX3NpemUgKTsKPiAgIAo+
ICAgICAgIHJldHVybiAocGFyYW1zLT5maWZvX3NpemUgLSBjbnQpOwo+ICAgfQo+IAoKQ2hlZXJz
LAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
