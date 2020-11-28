Return-Path: <SRS0=f3nK=FC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7917C63697
	for <xen-devel@archiver.kernel.org>; Sat, 28 Nov 2020 11:26:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41F8622263
	for <xen-devel@archiver.kernel.org>; Sat, 28 Nov 2020 11:26:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="LzO/J6ch"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41F8622263
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.39940.72976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiyMU-0000Un-NL; Sat, 28 Nov 2020 11:25:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39940.72976; Sat, 28 Nov 2020 11:25:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiyMU-0000Ug-KP; Sat, 28 Nov 2020 11:25:54 +0000
Received: by outflank-mailman (input) for mailman id 39940;
 Sat, 28 Nov 2020 11:25:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kiyMT-0000Ub-Jg
 for xen-devel@lists.xenproject.org; Sat, 28 Nov 2020 11:25:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kiyMQ-0004wh-JZ; Sat, 28 Nov 2020 11:25:50 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kiyMQ-0004hC-7l; Sat, 28 Nov 2020 11:25:50 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=bqQj0aZdYZhq4LkThwBUQPjV3CoIyckZ/6Zjdg3jPZ0=; b=LzO/J6chHjtKz9GNErOQQp1FMJ
	8UWCeb+MMYe2PbFG8bPdILYTm3u1Mgcz4tlmD1hBCwTi+mhg6Z2SQfeVLQw1imRTQhynyT+KYZLo8
	TGkRcSO+67C8evykBHcvyd3+nUA6Cr8IIkEQVsoomBHZdtedBcaLQYK05w9HnpS6HlMg=;
Subject: Re: [PATCH] xen/irq: Propagate the error from init_one_desc_irq() in
 init_irq_data()
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20201119145434.28065-1-julien@xen.org>
 <alpine.DEB.2.21.2011191542200.7979@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <499a56f6-9a66-4fb8-0687-b9fb221fdc52@xen.org>
Date: Sat, 28 Nov 2020 11:25:48 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2011191542200.7979@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 19/11/2020 23:44, Stefano Stabellini wrote:
> On Thu, 19 Nov 2020, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> init_one_desc_irq() can return an error if it is unable to allocate
>> memory. While this is unlikely to happen during boot (called from
>> init_irq_data()), it is better to harden the code by propagting the
>> return value.
>>
>> Spotted by coverity.
>>
>> CID: 106529
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Hi Julien,

Hi Stefano,

> Thanks for the patch. I was about to commit it when I realized there is
> one more caller: xen/arch/arm/irq.c:init_local_irq_data
> 
> Should we change that too to check for the return error?

We should change too. I will send a new version.

Cheers,

-- 
Julien Grall

