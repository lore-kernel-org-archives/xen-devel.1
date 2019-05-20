Return-Path: <SRS0=/voU=TU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B799C04AAC
	for <xen-devel@archiver.kernel.org>; Mon, 20 May 2019 11:03:35 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57007206B6
	for <xen-devel@archiver.kernel.org>; Mon, 20 May 2019 11:03:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57007206B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSg4b-0004bk-V1; Mon, 20 May 2019 11:03:17 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DuAc=TU=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hSg4a-0004bf-Jg
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 11:03:16 +0000
X-Inumbo-ID: dda0a538-7aee-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id dda0a538-7aee-11e9-8980-bc764e045a96;
 Mon, 20 May 2019 11:03:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D8AFD374;
 Mon, 20 May 2019 04:03:14 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1A0373F5AF;
 Mon, 20 May 2019 04:03:13 -0700 (PDT)
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
References: <1556806436-26283-1-git-send-email-olekstysh@gmail.com>
 <1556806436-26283-2-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <ce325872-a19e-2d07-ca88-cd3f0b1bd933@arm.com>
Date: Mon, 20 May 2019 12:03:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1556806436-26283-2-git-send-email-olekstysh@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC PATCH 1/2] xen/device-tree: Add
 dt_count_phandle_with_args helper
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
 sstabellini@kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190520110312.edWYOTjT2psCXAQ-CaY-3LXOjVmXleFGufkaFgwCbUs@z>

SGksCgpPbiAwMi8wNS8yMDE5IDE1OjEzLCBPbGVrc2FuZHIgVHlzaGNoZW5rbyB3cm90ZToKPiBG
cm9tOiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+
Cj4gCj4gUG9ydCBMaW51eCBoZWxwZXIgb2ZfY291bnRfcGhhbmRsZV93aXRoX2FyZ3MgZm9yIGNv
dW50aW5nCj4gbnVtYmVyIG9mIHBoYW5kbGVzIGluIGEgcHJvcGVydHkuCgpMaW51eCA1LjEgdXNl
cyBhIGNvbXBsZXRlbHkgZGlmZmVyZW50IGltcGxlbWVudGF0aW9uIGZvciAKb2ZfY291bnRfcGhh
bmRsZV93aXRoX2FyZ3MuIFNvIHdoaWNoIHZlcnNpb24gb2YgTGludXggZGlkIHlvdSBwb3J0IGZy
b20/CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
