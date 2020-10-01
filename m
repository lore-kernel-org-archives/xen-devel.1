Return-Path: <SRS0=IV2x=DI=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32C73C4727C
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2020 15:35:03 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D71532074B
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2020 15:35:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="rBm2fsaH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D71532074B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1347.4469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kO0bT-0003xg-6m; Thu, 01 Oct 2020 15:34:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347.4469; Thu, 01 Oct 2020 15:34:43 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kO0bT-0003xZ-3Z; Thu, 01 Oct 2020 15:34:43 +0000
Received: by outflank-mailman (input) for mailman id 1347;
 Thu, 01 Oct 2020 15:34:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gWzX=DI=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kO0bR-0003xU-3C
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 15:34:41 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 070ba41b-fccf-438a-89ec-5929db84264a;
 Thu, 01 Oct 2020 15:34:40 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kO0bM-0000ul-23; Thu, 01 Oct 2020 15:34:36 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kO0bL-00054I-OW; Thu, 01 Oct 2020 15:34:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gWzX=DI=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kO0bR-0003xU-3C
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 15:34:41 +0000
X-Inumbo-ID: 070ba41b-fccf-438a-89ec-5929db84264a
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 070ba41b-fccf-438a-89ec-5929db84264a;
	Thu, 01 Oct 2020 15:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=IHj7Ual2gVJMYG9+yiC0YLQbptxHutGKeHtZpaT2xRA=; b=rBm2fsaHkw++l9kbtpPtkqaYIK
	sqXGBQOKc0OQOk0NHSTfXDZY7nfv5kH9lSZjzSLyW0j8PPvEOrtPIuQmSoasPkt+Om32MbuL98ieW
	s3IBxUhYHqbPiqdW7VrcxJb2S29twqHgZZZ+ezs2Q1enzFhSOrH72ur0lBMxUKOaUDcc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kO0bM-0000ul-23; Thu, 01 Oct 2020 15:34:36 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kO0bL-00054I-OW; Thu, 01 Oct 2020 15:34:35 +0000
Subject: Re: [PATCH 4/4] xen/arm: Introduce fw_unreserved_regions() and use it
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, alex.bennee@linaro.org,
 masami.hiramatsu@linaro.org, ehem+xen@m5p.com, bertrand.marquis@arm.com,
 andre.przywara@arm.com, Julien Grall <jgrall@amazon.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20200926205542.9261-1-julien@xen.org>
 <20200926205542.9261-5-julien@xen.org>
 <alpine.DEB.2.21.2009301630250.10908@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <32212198-886c-4a44-ab27-8c650777b8d1@xen.org>
Date: Thu, 1 Oct 2020 16:34:33 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2009301630250.10908@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 01/10/2020 00:40, Stefano Stabellini wrote:
> On Sat, 26 Sep 2020, Julien Grall wrote:
> I have a small suggestion for improvement that could be done on commit:
> given that bootinfo is actually used on EFI systems (granted, not
> bootinfo.reserved_mem but bootinfo.mem, see
> xen/arch/arm/efi/efi-boot.h:efi_process_memory_map_bootinfo) so
> technically bootinfo could be in-use with ACPI, maybe we could add a
> comment on top of xen/include/asm-arm/setup.h:bootinfo to say that
> reserved_mem is device tree only?

That's fine with me. I will need to resend the rest of the series, so I 
will update it at the same time.

Cheers,

-- 
Julien Grall

