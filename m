Return-Path: <SRS0=cMO7=FW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58906C4361B
	for <xen-devel@archiver.kernel.org>; Fri, 18 Dec 2020 09:25:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04BC823A7B
	for <xen-devel@archiver.kernel.org>; Fri, 18 Dec 2020 09:25:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04BC823A7B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.56420.98788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqC0n-0006fS-Sw; Fri, 18 Dec 2020 09:25:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 56420.98788; Fri, 18 Dec 2020 09:25:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqC0n-0006fL-PI; Fri, 18 Dec 2020 09:25:21 +0000
Received: by outflank-mailman (input) for mailman id 56420;
 Fri, 18 Dec 2020 09:25:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kqC0m-0006fG-Bj
 for xen-devel@lists.xenproject.org; Fri, 18 Dec 2020 09:25:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kqC0l-0003yl-ES; Fri, 18 Dec 2020 09:25:19 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kqC0l-0007vK-6z; Fri, 18 Dec 2020 09:25:19 +0000
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
	bh=DVt81aClFe9EK7O999j8rRKiZ5yTI9NNY16mxW2PP5Y=; b=YcUSNjkdtNtljg8AuKH/+TdfX1
	PvAj77fshRFqQrjcaSIYydghDQ/Bn16tY3NlqI83CTWI29UKfiKcRXLrd9Ipu1iHGv2Lt3Dqnwiwq
	6QGVfFrlGcknbuXBwvmcPyTJSqJfOEDFOFka2H3PbmiN92TbEVomLUrGlOrC7KxzFzwY=;
Subject: Re: Ping: Arm: [PATCH v3 2/8] lib: collect library files in an
 archive
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1a6bac6a-7d83-f5b6-c5b9-8b3b39824d40@suse.com>
 <21714b83-8619-5aa9-be5b-3015d05a26a4@suse.com>
 <59c970d6-2be4-3239-6728-b8905b007323@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c3bbaad9-8b1f-d362-899b-aa31fa7feecf@xen.org>
Date: Fri, 18 Dec 2020 09:25:16 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <59c970d6-2be4-3239-6728-b8905b007323@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 18/12/2020 08:02, Jan Beulich wrote:
> On 23.11.2020 16:21, Jan Beulich wrote:
>> In order to (subsequently) drop odd things like CONFIG_NEEDS_LIST_SORT
>> just to avoid bloating binaries when only some arch-es and/or
>> configurations need generic library routines, combine objects under lib/
>> into an archive, which the linker then can pick the necessary objects
>> out of.
>>
>> Note that we can't use thin archives just yet, until we've raised the
>> minimum required binutils version suitably.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>>   xen/Rules.mk          | 29 +++++++++++++++++++++++++----
>>   xen/arch/arm/Makefile |  6 +++---
> 
> For this and patch 3 of the series, may I ask for an Arm side ack
> (or otherwise)?

For the 2 patches:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

