Return-Path: <SRS0=FDQh=L6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D49D6C07E96
	for <xen-devel@archiver.kernel.org>; Tue,  6 Jul 2021 15:16:03 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9296F61A0F
	for <xen-devel@archiver.kernel.org>; Tue,  6 Jul 2021 15:16:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9296F61A0F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.151461.279914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0mng-00057Q-2V; Tue, 06 Jul 2021 15:15:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151461.279914; Tue, 06 Jul 2021 15:15:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0mnf-00057J-Vq; Tue, 06 Jul 2021 15:15:51 +0000
Received: by outflank-mailman (input) for mailman id 151461;
 Tue, 06 Jul 2021 15:15:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m0mnf-00057D-33
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 15:15:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m0mnb-0003qT-7f; Tue, 06 Jul 2021 15:15:47 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m0mnb-0003ju-0h; Tue, 06 Jul 2021 15:15:47 +0000
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
	bh=H7ORhudI49hLq7R/416H0Z63lBZM1TRv32Z8JU0g7R0=; b=iksRNjpMWlp86vL9ceSQxjYkuY
	I0ZOTDuc2su8HiUMyh50PkfHvHgF+I6FL3eGjikLv5grAUxJ4cygxzgL9QjzgKBQq6VbYcAnrN6LH
	YMcPw5RgkgHzLF+MfFiE7oWF2wzdrB99IAMadwwHKX8o50rw+2Gwg6An5zHkqMm7pbSI=;
Subject: Re: [PATCH] tools: Fix CPSR/SPSR print size
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
Cc: jgrall@amazon.com, michal.orzel@arm.com, olaf@aepfle.de,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>
References: <f28690afd8c4f36351fcdb1e95704cc5240b193a.1625583993.git.bertrand.marquis@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <d79b4ff3-cc61-a1a7-ed5d-e0ea627bbab8@xen.org>
Date: Tue, 6 Jul 2021 16:15:44 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <f28690afd8c4f36351fcdb1e95704cc5240b193a.1625583993.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Bertrand,

Thanks for the fix. I forgot to check the full tools build when sending 
the first fix :(.

On 06/07/2021 16:09, Bertrand Marquis wrote:
> With the changes of register size introduced in
> 918b8842a852e0e7446286f546724b1c63c56c66, CPSR and SPSR are now stored
> as 64bit values.
> 
> Fix the print size to use 64bit type.
> 

Can you add a fixes tag? This makes easier to find bug fix in the tree.

For this patch it would be:

Fixes: 918b8842a852 ("arm64: Change type of hsr, cpsr, spsr_el1 to 
uint64_t")

> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Just to confirm, with this patch and mine the tools build successfully 
on 32-bit and 64-bit?

Cheers,

-- 
Julien Grall

