Return-Path: <SRS0=X21u=WB=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E3E9C433FF
	for <xen-devel@archiver.kernel.org>; Mon,  5 Aug 2019 08:29:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08E982067D
	for <xen-devel@archiver.kernel.org>; Mon,  5 Aug 2019 08:29:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08E982067D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huYMf-0005Nz-4q; Mon, 05 Aug 2019 08:29:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j9cV=WB=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1huYMe-0005Nu-CT
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 08:29:08 +0000
X-Inumbo-ID: 16a7d302-b75b-11e9-a20a-a361d5111f18
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 16a7d302-b75b-11e9-a20a-a361d5111f18;
 Mon, 05 Aug 2019 08:29:06 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D677328;
 Mon,  5 Aug 2019 01:29:05 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 17D4C3F706;
 Mon,  5 Aug 2019 01:29:04 -0700 (PDT)
To: Oleksandr <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
References: <1564763985-20312-1-git-send-email-olekstysh@gmail.com>
 <bee1402c-cdd7-c8fc-c0a1-c19cd74f86bf@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <83eddc05-bef6-6bc7-6605-18d97d7c1296@arm.com>
Date: Mon, 5 Aug 2019 09:29:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <bee1402c-cdd7-c8fc-c0a1-c19cd74f86bf@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V2 0/6] iommu/arm: Add Renesas IPMMU-VMSA
 support + Linux's iommu_fwspec
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, sstabellini@kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUvMDgvMjAxOSAwODo1OCwgT2xla3NhbmRyIHdyb3RlOgo+IAo+IEhlbGxvLCBhbGwuCgpI
aSwKCj4gCj4gRm9yZ290IHRvIG1lbnRpb24gdGhhdCBhbiBhZGRpdGlvbmFsIHBhdGNoIGZyb20g
WGVuIHN0YWdpbmcgaXMgbmVlZGVkLCBvdGhlcndpc2UgCj4gWGVuIG1heSBjcmFzaCBhdCB0aGUg
ZWFybHkgc3RhZ2U6Cj4gZWFkNmI5Zjc4MzU1ZThkMzY2ZTBjODBjNGE3M2ZhN2ZiZDZkMjZjYwo+
ICJ4ZW4vYXJtOiBjcHVlcnJhdGE6IEFsaWduIGEgdmlydHVhbCBhZGRyZXNzIGJlZm9yZSB1bm1h
cCIKClRoaXMgcGF0Y2ggaXMgYWxyZWFkeSBtZXJnZWQgaW4gWGVuIDopLgoKQ2hlZXJzLAoKLS0g
Ckp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
