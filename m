Return-Path: <SRS0=X5bA=LI=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83D28C2B9F4
	for <xen-devel@archiver.kernel.org>; Mon, 14 Jun 2021 13:15:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43AB46124B
	for <xen-devel@archiver.kernel.org>; Mon, 14 Jun 2021 13:15:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43AB46124B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.141468.261298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsmQs-0004cr-6r; Mon, 14 Jun 2021 13:15:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 141468.261298; Mon, 14 Jun 2021 13:15:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsmQs-0004ck-3p; Mon, 14 Jun 2021 13:15:14 +0000
Received: by outflank-mailman (input) for mailman id 141468;
 Mon, 14 Jun 2021 13:15:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lsmQq-0004cd-Ew
 for xen-devel@lists.xenproject.org; Mon, 14 Jun 2021 13:15:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lsmQq-0004pU-9o; Mon, 14 Jun 2021 13:15:12 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lsmQq-0003eV-2n; Mon, 14 Jun 2021 13:15:12 +0000
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
	MIME-Version:Date:Message-ID:References:Cc:To:From:Subject;
	bh=MexwEiLb6DO00HfVmCl9lSsQxuKTdncX1Efn8m1NmVk=; b=g4qV2/w1UFArtw+vrLfR35LzXG
	jqvJOtmrkN+pw0g7uJ7TkoGxjNMGcIQr8Bdj0Aa4X2qCtDVGaT9wMZs0yVL/VCqzhA3vaEcoiL5A/
	YATRPEENTfMN9OSwpLb4+6soeH8Af5/Wq1FE7BgyDKYVVWqrYos8pbYQwdNhCYheoZAc=;
Subject: Re: [PATCH] Arm32: avoid .rodata to be marked as executable
From: Julien Grall <julien@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <25f1b0d2-9270-ba42-d110-2bf14e45b7b8@suse.com>
 <5b819c5e-587b-4eec-b873-73892503c3e2@xen.org>
 <4143bdfd-ca78-d7ce-4ed0-2b6271c48ecf@suse.com>
 <7a57d3df-94d0-5ee6-1ceb-bf4eddec1392@xen.org>
 <666fdb88-94c0-be05-f4d5-d755b0326dad@suse.com>
 <55a201ef-728e-dc59-1f9f-d269e1c5989e@xen.org>
Message-ID: <cb3120de-e06f-7002-d57a-e2b560205b6e@xen.org>
Date: Mon, 14 Jun 2021 15:15:10 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <55a201ef-728e-dc59-1f9f-d269e1c5989e@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 14/06/2021 15:09, Julien Grall wrote:
>> I'm fine with the new commit message, but I'd prefer the title to
>> remain as is, as that aspect is what did trigger me making this > change.
> 
> Sure. I will keep your commit title and update the commit message.

Commited with:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

