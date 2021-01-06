Return-Path: <SRS0=pLaW=GJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36A8EC433E0
	for <xen-devel@archiver.kernel.org>; Wed,  6 Jan 2021 18:03:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDA32216C4
	for <xen-devel@archiver.kernel.org>; Wed,  6 Jan 2021 18:03:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DDA32216C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.62632.111002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxD92-00048V-9N; Wed, 06 Jan 2021 18:02:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62632.111002; Wed, 06 Jan 2021 18:02:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxD92-00048O-6X; Wed, 06 Jan 2021 18:02:52 +0000
Received: by outflank-mailman (input) for mailman id 62632;
 Wed, 06 Jan 2021 18:02:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kxD90-00048J-V7
 for xen-devel@lists.xenproject.org; Wed, 06 Jan 2021 18:02:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kxD90-0006A9-Jo; Wed, 06 Jan 2021 18:02:50 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kxD90-0004cp-Bm; Wed, 06 Jan 2021 18:02:50 +0000
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
	bh=3rjeRoE/Ve3OE7g/Uo/6qLY6F42ETX+GrBAE3xN5mGI=; b=Idhp0qn4o05pkbIkS73jCzaDyG
	YVMQi9GzKB9LDgMeQZaFC9bnB8cixE37cnNQaWlZgCb0jdX7ECnZmWQt5xFe4HU71Z/kBXo7o7hO1
	0wbLHoEqf298G447M+Eg5eJ1Xl9jYirG/49eaEM0KL5T/dbRgODyF7LWWm2ZCQPPanV0=;
Subject: Re: [PATCH v1] arm/optee: Use only least 32 bits for SMC type arg
 according to SMCCC
To: Roman Skakun <roman_skakun@epam.com>, xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <123c27ed53ab50ca6f605a96002dcc7e1b7d3e6e.1609931750.git.rm.skakun@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <48f8e967-2454-7d4b-8e86-0b1baddef52e@xen.org>
Date: Wed, 6 Jan 2021 18:02:48 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <123c27ed53ab50ca6f605a96002dcc7e1b7d3e6e.1609931750.git.rm.skakun@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Roman,

On 06/01/2021 11:26, Roman Skakun wrote:
> This patch added additional sanity and increases an understanding for
> getting proper value from the first argument for SMC call on aarch64
> according to SMCC Convention.

I would suggest the following commit message:

"xen/arm: optee: The function identifier is always 32-bit

Per the SMCCC specification (see section 3.1 in ARM DEN 0028D), the 
function identifier is only stored in the least significant 32-bits. The 
most significant 32-bits should be ignored.

The function optee_handle_call() is now updated to ignore the most 
significant 32-bits.

"

Note that I used the version D rather than B because the latter has 
buggy wording (it seems to suggest that the least significants bits 
should be ignored).

Furthermore, I checked vsmc.c (the layer that dispatch the SMC) and it 
was already handled properly thanks to commit 7f4217cc6057 "xen/arm: 
vsmc: The function identifier is always 32-bit".

> [0] ARM DEN0028B, page 12
> 
> Signed-off-by: Roman Skakun <roman_skakun@epam.com>
> ---
>   xen/arch/arm/tee/optee.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/tee/optee.c b/xen/arch/arm/tee/optee.c
> index ee85359742..87060b52b8 100644
> --- a/xen/arch/arm/tee/optee.c
> +++ b/xen/arch/arm/tee/optee.c
> @@ -1643,7 +1643,8 @@ static bool optee_handle_call(struct cpu_user_regs *regs)
>       if ( !ctx )
>           return false;
>   
> -    switch ( get_user_reg(regs, 0) )
> +    /* Only least 32 bits are significant (see ARM DEN 0028B, page 12) */

I would suggest:

/* The function identifier is always stored in the least significant 
32-bit (see section ARM DEN 0028D) */

I can update it while committing, if both Volodymyr and you are happy 
with changes.

Cheers,

> +    switch ( (uint32_t)get_user_reg(regs, 0) )
>       {
>       case OPTEE_SMC_CALLS_COUNT:
>           set_user_reg(regs, 0, OPTEE_MEDIATOR_SMC_COUNT);
> 

-- 
Julien Grall

