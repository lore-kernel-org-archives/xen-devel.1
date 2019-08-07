Return-Path: <SRS0=NT3h=WD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0D52C32751
	for <xen-devel@archiver.kernel.org>; Wed,  7 Aug 2019 10:36:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CF862086D
	for <xen-devel@archiver.kernel.org>; Wed,  7 Aug 2019 10:36:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CF862086D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvJIS-0005Rs-K0; Wed, 07 Aug 2019 10:35:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WZHT=WD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hvJIR-0005Rm-Mu
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 10:35:55 +0000
X-Inumbo-ID: 22c398a0-b8ff-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 22c398a0-b8ff-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 10:35:55 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C674E15A2;
 Wed,  7 Aug 2019 03:35:54 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC89F3F575;
 Wed,  7 Aug 2019 03:35:53 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1906181618130.2072@sstabellini-ThinkPad-T480s>
 <20190618232019.26425-1-sstabellini@kernel.org>
 <5d5749e2-883d-70f5-b953-7381d9207b0b@arm.com>
 <alpine.DEB.2.21.1908061637390.2451@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <cd8c073a-110f-9db6-26bb-65e78e7a8985@arm.com>
Date: Wed, 7 Aug 2019 11:35:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1908061637390.2451@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 1/5] xen: add a p2mt parameter to
 map_mmio_regions
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
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 JBeulich@suse.com, Stefano Stabellini <stefanos@xilinx.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAwNy8wOC8yMDE5IDAwOjM4LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gT24gV2Vk
LCAxMCBKdWwgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBIaSBTdGVmYW5vLAo+Pgo+PiBU
aGUgQXJtIGNvZGUgbG9va3MgZ29vZCB0byBtZS4gT25lIGNvbW1lbnQgYmVsb3cuCj4gCj4gU2hv
dWxkIEkgdGFrZSBpdCBhcyBhIGFja2VkLWJ5PwoKSSB3aWxsIGhhdmUgYSBsb29rIGF0IHRoZSBu
ZXh0IHZlcnNpb24uCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
