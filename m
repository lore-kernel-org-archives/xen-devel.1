Return-Path: <SRS0=UuSr=GI=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0DE3C433DB
	for <xen-devel@archiver.kernel.org>; Tue,  5 Jan 2021 11:17:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75B09229C5
	for <xen-devel@archiver.kernel.org>; Tue,  5 Jan 2021 11:17:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75B09229C5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.61811.108908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwkKv-0003pG-3z; Tue, 05 Jan 2021 11:17:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61811.108908; Tue, 05 Jan 2021 11:17:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwkKv-0003p9-0I; Tue, 05 Jan 2021 11:17:13 +0000
Received: by outflank-mailman (input) for mailman id 61811;
 Tue, 05 Jan 2021 11:17:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kwkKt-0003p4-KT
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 11:17:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kwkKt-0007S1-9n; Tue, 05 Jan 2021 11:17:11 +0000
Received: from [54.239.6.177] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kwkKt-0000Dr-0m; Tue, 05 Jan 2021 11:17:11 +0000
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
	bh=LsI0Avom9OlbDvrvvI8tC+YgPSjieqm8KrJhTuFkFt8=; b=DmB7zqClto/9ZHYpWq/zo00vme
	vQRcFVet0hUtDsNXWD6eCQE4Ok9KzWok5xhfZZuPoKy8tRHajkZ61UtKmEE+ygLwVHLwQUiuW2xS+
	/DOFnT0Q01yYNjG+VkmYbKhK2xbxr1cWKBhknhwb6BtVW8smdtm1ucrFeODtfpyGr7w4=;
Subject: Re: [PATCH 2/2] xen/arm: Add defensive barrier in get_cycles for
 Arm64
To: Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Penny.Zheng@arm.com, Jiamei.Xie@arm.com,
 nd@arm.com
References: <20210105071946.1971229-1-wei.chen@arm.com>
 <20210105071946.1971229-2-wei.chen@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <522b798d-5f89-648e-bfe2-6fe36cc7a571@xen.org>
Date: Tue, 5 Jan 2021 11:17:09 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210105071946.1971229-2-wei.chen@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Wei,

On 05/01/2021 07:19, Wei Chen wrote:
> As the dicsussion [1] in mailing list. We'd better to have

I would say "Per the discussion [1] on the ...". I would also suggest to 
replace the "." with ",".

> a barrier after reading CNTPCT in get_cycles. If there is
> not any barrier there. When get_cycles being used in some
> seqlock critical context in the future, the seqlock can be
> speculated potentially.

This comment seems a little off because we don't have seqlock on Xen. I 
think it would be best if you re-use the Linux commit as it would be 
clear that this is a backport.

Something like:

"Import commit .... from Linux:

<entire commit message indented by one>

While we are not aware of such use in Xen, it would be best to add the 
barrier to avoid any suprise."
"

> 
> In order to reduce the impact of new barrier, we perfer to
> use enforce order instead of ISB [2].
> 
> Currently, enforce order is not applied to arm32 as this is
> not done in Linux at the date of this patch. If this is done
> in Linux it will need to be also done in Xen.
> 
> [1] https://lists.xenproject.org/archives/html/xen-devel/2020-12/msg00181.html
> [2] https://lkml.org/lkml/2020/3/13/645
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>   xen/include/asm-arm/time.h | 43 ++++++++++++++++++++++++++++++++++++--
>   1 file changed, 41 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/include/asm-arm/time.h b/xen/include/asm-arm/time.h
> index 5c4529ebb5..3ef4e7cd3d 100644
> --- a/xen/include/asm-arm/time.h
> +++ b/xen/include/asm-arm/time.h
> @@ -11,9 +11,26 @@
>   
>   typedef uint64_t cycles_t;
>   
> -static inline cycles_t get_cycles(void)
> +/*
> + * Ensure that reads of the counter are treated the same as memory reads
> + * for the purposes of ordering by subsequent memory barriers.
> + */

The comment is before the #ifdef which suggests the ordering is required 
for Arm as well. I would suggest to either mention that oddity or move 
the comment after the #ifdef.

> +#if defined(CONFIG_ARM_64)
> +#define read_cntpct_enforce_ordering(val) do { \
> +    u64 tmp, _val = (val);                     \

Please use uint64_t here.

> +                                               \
> +    asm volatile(                              \
> +    "eor %0, %1, %1\n"                         \
> +    "add %0, sp, %0\n"                         \
> +    "ldr xzr, [%0]"                            \
> +    : "=r" (tmp) : "r" (_val));                \
> +} while (0)
> +#else
> +#define read_cntpct_enforce_ordering(val) do {} while (0)
> +#endif
> +
> +static inline cycles_t read_cntpct_stable(void)
>   {
> -    isb();
>       /*
>        * ARM_WORKAROUND_858921: Cortex-A73 (all versions) counter read
>        * can return a wrong value when the counter crosses a 32bit boundary.
> @@ -36,6 +53,28 @@ static inline cycles_t get_cycles(void)
>       }
>   }
>   
> +static inline cycles_t get_cycles(void)
> +{
> +    cycles_t cnt;
> +
> +    isb();
> +    cnt = read_cntpct_stable();
> +
> +    /*
> +     * If there is not any barrier here. When get_cycles being used in
> +     * some seqlock critical context in the future, the seqlock can be
> +     * speculated potentially.
> +     *
> +     * To prevent seqlock from being speculated silently, we add a barrier
> +     * here defensively. Normally, we just need an ISB here is enough, but
> +     * considering the minimum performance cost. We prefer to use enforce
> +     * order here.
> +     */

We don't use seqlock in Xen, so this comment looks quite confusing.. I 
think the comment on top of reach_cntpct_enforce_ordering() is 
sufficient, so I would drop this one. The alternative is to find a way 
to make the comment more Xen focused.

Although, I don't have a good suggestion so far.

> +    read_cntpct_enforce_ordering(cnt);
> +
> +    return cnt;
> +}
> +
>   /* List of timer's IRQ */
>   enum timer_ppi
>   {
> 

Cheers,

-- 
Julien Grall

