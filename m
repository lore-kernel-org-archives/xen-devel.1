Return-Path: <SRS0=UuSr=GI=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E368C433DB
	for <xen-devel@archiver.kernel.org>; Tue,  5 Jan 2021 11:04:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7456229EF
	for <xen-devel@archiver.kernel.org>; Tue,  5 Jan 2021 11:04:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7456229EF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.61804.108896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwk8u-0002hw-TU; Tue, 05 Jan 2021 11:04:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61804.108896; Tue, 05 Jan 2021 11:04:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwk8u-0002hp-PZ; Tue, 05 Jan 2021 11:04:48 +0000
Received: by outflank-mailman (input) for mailman id 61804;
 Tue, 05 Jan 2021 11:04:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kwk8t-0002hV-TT
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 11:04:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kwk8t-0007EQ-Pa; Tue, 05 Jan 2021 11:04:47 +0000
Received: from [54.239.6.177] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kwk8t-0007jr-Iw; Tue, 05 Jan 2021 11:04:47 +0000
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
	bh=t4hQRMZAEsZ25ZkJph3Nxx2uOcDspugKlPp14dcLzdQ=; b=XRUov/9JZACt4DoooM/3SDdbS6
	+qPEoObzFubnT5D83gy8+x9dJ/ygZwppH1K9Rr/t8XK+1WdlZ6Ma3F2ITMzFTuE/jbHB6qWeyubhJ
	ESYVFOFvnpGMGv3a5jqUJNBp7Q/mBtEJi5kYxSRpY6fAm2lQ2ZtO+6DMIP+JCvIt56Ak=;
Subject: Re: [PATCH 1/2] xen/arm: Correct the coding style of get_cycles
To: Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Penny.Zheng@arm.com, Jiamei.Xie@arm.com,
 nd@arm.com
References: <20210105071946.1971229-1-wei.chen@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <f0f72417-cded-f0f6-3cfe-63cbfe94b69b@xen.org>
Date: Tue, 5 Jan 2021 11:04:45 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210105071946.1971229-1-wei.chen@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Wei,

On 05/01/2021 07:19, Wei Chen wrote:
> It seems the arm inline function get_cycles has used 8 spaces for
> line indent since 2012. This patch correct them to 4 spaces and
> remove extra space between function name and bracket.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

> ---
>   xen/include/asm-arm/time.h | 40 +++++++++++++++++++-------------------
>   1 file changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/xen/include/asm-arm/time.h b/xen/include/asm-arm/time.h
> index 1b2c13614b..5c4529ebb5 100644
> --- a/xen/include/asm-arm/time.h
> +++ b/xen/include/asm-arm/time.h
> @@ -11,29 +11,29 @@
>   
>   typedef uint64_t cycles_t;
>   
> -static inline cycles_t get_cycles (void)
> +static inline cycles_t get_cycles(void)
>   {
> -        isb();
> +    isb();
> +    /*
> +     * ARM_WORKAROUND_858921: Cortex-A73 (all versions) counter read
> +     * can return a wrong value when the counter crosses a 32bit boundary.
> +     */
> +    if ( !check_workaround_858921() )
> +        return READ_SYSREG64(CNTPCT_EL0);
> +    else
> +    {
>           /*
> -         * ARM_WORKAROUND_858921: Cortex-A73 (all versions) counter read
> -         * can return a wrong value when the counter crosses a 32bit boundary.
> +         * A recommended workaround for erratum 858921 is to:
> +         *  1- Read twice CNTPCT.
> +         *  2- Compare bit[32] of the two read values.
> +         *      - If bit[32] is different, keep the old value.
> +         *      - If bit[32] is the same, keep the new value.
>            */
> -        if ( !check_workaround_858921() )
> -            return READ_SYSREG64(CNTPCT_EL0);
> -        else
> -        {
> -            /*
> -             * A recommended workaround for erratum 858921 is to:
> -             *  1- Read twice CNTPCT.
> -             *  2- Compare bit[32] of the two read values.
> -             *      - If bit[32] is different, keep the old value.
> -             *      - If bit[32] is the same, keep the new value.
> -             */
> -            cycles_t old, new;
> -            old = READ_SYSREG64(CNTPCT_EL0);
> -            new = READ_SYSREG64(CNTPCT_EL0);
> -            return (((old ^ new) >> 32) & 1) ? old : new;
> -        }
> +        cycles_t old, new;
> +        old = READ_SYSREG64(CNTPCT_EL0);
> +        new = READ_SYSREG64(CNTPCT_EL0);
> +        return (((old ^ new) >> 32) & 1) ? old : new;
> +    }
>   }
>   
>   /* List of timer's IRQ */
> 

-- 
Julien Grall

