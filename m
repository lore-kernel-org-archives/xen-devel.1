Return-Path: <SRS0=sPV+=KV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B7C6C47082
	for <xen-devel@archiver.kernel.org>; Wed, 26 May 2021 15:22:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED078613D2
	for <xen-devel@archiver.kernel.org>; Wed, 26 May 2021 15:22:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED078613D2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.132587.247259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llvMQ-00062s-NW; Wed, 26 May 2021 15:22:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132587.247259; Wed, 26 May 2021 15:22:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llvMQ-00062l-Jm; Wed, 26 May 2021 15:22:18 +0000
Received: by outflank-mailman (input) for mailman id 132587;
 Wed, 26 May 2021 15:22:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1llvMP-00062M-Kf
 for xen-devel@lists.xenproject.org; Wed, 26 May 2021 15:22:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1llvML-0003JB-RQ; Wed, 26 May 2021 15:22:13 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1llvML-0007OT-LN; Wed, 26 May 2021 15:22:13 +0000
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
	bh=zoAuU7FmjXI3cpHS6x/57rn0nuIppVk1pzVGGjtL/V0=; b=QtPZ6TOWQQIVeXARZxJpaCXnoq
	OkPUsoH4inb6iEmh0O4SSuKWlWQo6pkLEBi0qApti48QSeYrYg6YVG6I9vEG+NaMGgeR02epDSQCS
	1JS8WJiNrdHI3+4+Wu2mMMTg/PFrGY1LOFgRROENUJUEgzqTgnUJAbj3T4aEOfOnNDT8=;
Subject: Re: [PATCH v2 0/2] Use const whenever we point to literal strings
 (take 1)
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20210518140134.31541-1-julien@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <d6a96741-6b78-882e-4dcf-cb2439846927@xen.org>
Date: Wed, 26 May 2021 16:22:11 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210518140134.31541-1-julien@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 18/05/2021 15:01, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Hi all,
> 
> By default, both Clang and GCC will happily compile C code where
> non-const char * point to literal strings. This means the following
> code will be accepted:
> 
>      char *str = "test";
> 
>      str[0] = 'a';
> 
> Literal strings will reside in rodata, so they are not modifiable.
> This will result to an permission fault at runtime if the permissions
> are enforced in the page-tables (this is the case in Xen).
> 
> I am not aware of code trying to modify literal strings in Xen.
> However, there is a frequent use of non-const char * to point to
> literal strings. Given the size of the codebase, there is a risk
> to involuntarily introduce code that will modify literal strings.
> 
> Therefore it would be better to enforce using const when pointing
> to such strings. Both GCC and Clang provide an option to warn
> for such case (see -Wwrite-strings) and therefore could be used
> by Xen.
> 
> This series doesn't yet make use of -Wwrite-strings because
> the tree is not fully converted. Instead, it contains some easy
> and non-controversial use of const in the code.
> 
> Julien Grall (2):
>    xen/char: console: Use const whenever we point to literal strings
>    tools/console: Use const whenever we point to literal strings

I have committed the two patches.

> 
>   tools/console/client/main.c |  4 ++--
>   tools/console/daemon/io.c   | 15 ++++++++-------
>   xen/drivers/char/console.c  |  7 ++++---
>   3 files changed, 14 insertions(+), 12 deletions(-)
> 

-- 
Julien Grall

