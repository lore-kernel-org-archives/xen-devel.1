Return-Path: <SRS0=qW8Y=ME=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6E01C07E99
	for <xen-devel@archiver.kernel.org>; Mon, 12 Jul 2021 18:53:43 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AC4C61242
	for <xen-devel@archiver.kernel.org>; Mon, 12 Jul 2021 18:53:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8AC4C61242
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.154693.285796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m313b-00063N-9U; Mon, 12 Jul 2021 18:53:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 154693.285796; Mon, 12 Jul 2021 18:53:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m313b-00063G-6W; Mon, 12 Jul 2021 18:53:31 +0000
Received: by outflank-mailman (input) for mailman id 154693;
 Mon, 12 Jul 2021 18:53:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m313Z-00063A-RM
 for xen-devel@lists.xenproject.org; Mon, 12 Jul 2021 18:53:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m313W-0003zb-3c; Mon, 12 Jul 2021 18:53:26 +0000
Received: from [54.239.6.189] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m313V-0003dC-T3; Mon, 12 Jul 2021 18:53:26 +0000
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
	bh=hdPBhBGzLry2pnYqzisz3UPJUplMRXnaUuOJh3m7cOc=; b=yTvY2BRXFp+toOr/aEXygTtPt+
	qIL2gVzNiP8HTYBbpRbdFqAacPRDN16RJ0+4E5k/9QVu/63mkD/PCMBP1bNbVStDvKyV8iqZ+qdwM
	98j7BNKbr3dW9aE6OsCY/0ADWwVOmGO+kYYwCpY3uKYj3Zzhued1Vjpu54moFOC1nMEM=;
Subject: Re: [RFC PATCH 3/4] xen/arm: Sanitize cpuinfo ID registers fields
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <cover.1624974370.git.bertrand.marquis@arm.com>
 <b9c86a28df2bddca095ae02511ced09585dce164.1624974370.git.bertrand.marquis@arm.com>
 <4014ca20-b3b6-cd39-9b26-d1dd8e9b568c@xen.org>
 <EE203ED0-5FB9-4597-878B-7261C989763F@arm.com>
 <08d7e35e-6785-9ce9-2e8b-1bbf65e4b47f@xen.org>
 <D4992248-BED1-4766-8872-1BFEB04068FE@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <fa6b7a04-0408-e9c4-216f-33af3295d8cf@xen.org>
Date: Mon, 12 Jul 2021 19:53:23 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <D4992248-BED1-4766-8872-1BFEB04068FE@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 12/07/2021 17:29, Bertrand Marquis wrote:
>> On 12 Jul 2021, at 12:13, Julien Grall <julien@xen.org> wrote:
>>
>>
>>
>> On 12/07/2021 12:03, Bertrand Marquis wrote:
>>> Hi Julien,
>>
>> Hi Bertrand,
>>
>>>> On 12 Jul 2021, at 11:16, Julien Grall <julien@xen.org> wrote:
>>>>
>>>> Hi Bertrand,
>>>>
>>>> On 29/06/2021 18:08, Bertrand Marquis wrote:
>>>>> Define a sanitize_cpu function to be called on secondary cores to
>>>>> sanitize the cpuinfo structure from the boot CPU.
>>>>> The safest value is taken when possible and the system is marked tainted
>>>>> if we encounter values which are incompatible with each other.
>>>>> Call the sanitize_cpu function on all secondary cores and remove the
>>>>> code disabling secondary cores if they are not the same as the boot core
>>>>> as we are now able to handle this use case.
>>>>> This is only supported on arm64 so cpu_sanitize is an empty static
>>>>> inline on arm32.
>>>>> This patch also removes the code imported from Linux that will not be
>>>>> used by Xen.
>>>>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>>>> ---
>>>>>   xen/arch/arm/arm64/cpusanitize.c | 236 ++++++++++++++++++++++++-------
>>>>>   xen/arch/arm/smpboot.c           |   5 +-
>>>>>   xen/include/asm-arm/cpufeature.h |   9 ++
>>>>>   xen/include/xen/lib.h            |   1 +
>>>>>   4 files changed, 199 insertions(+), 52 deletions(-)
>>>>> diff --git a/xen/arch/arm/arm64/cpusanitize.c b/xen/arch/arm/arm64/cpusanitize.c
>>>>> index 4cc8378c14..744006ca7c 100644
>>>>> --- a/xen/arch/arm/arm64/cpusanitize.c
>>>>> +++ b/xen/arch/arm/arm64/cpusanitize.c
>>>>> @@ -97,10 +97,6 @@ struct arm64_ftr_bits {
>>>>>   		.width = 0,				\
>>>>>   	}
>>>>>   -static void cpu_enable_cnp(struct arm64_cpu_capabilities const *cap);
>>>>> -
>>>>> -static bool __system_matches_cap(unsigned int n);
>>>>> -
>>>>>   /*
>>>>>    * NOTE: Any changes to the visibility of features should be kept in
>>>>>    * sync with the documentation of the CPU feature register ABI.
>>>>> @@ -277,31 +273,6 @@ static const struct arm64_ftr_bits ftr_id_aa64mmfr2[] = {
>>>>>   	ARM64_FTR_END,
>>>>>   };
>>>>>   -static const struct arm64_ftr_bits ftr_ctr[] = {
>>>>> -	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_EXACT, 31, 1, 1), /* RES1 */
>>>>> -	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, CTR_DIC_SHIFT, 1, 1),
>>>>> -	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, CTR_IDC_SHIFT, 1, 1),
>>>>> -	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_HIGHER_OR_ZERO_SAFE, CTR_CWG_SHIFT, 4, 0),
>>>>> -	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_HIGHER_OR_ZERO_SAFE, CTR_ERG_SHIFT, 4, 0),
>>>>> -	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, CTR_DMINLINE_SHIFT, 4, 1),
>>>>> -	/*
>>>>> -	 * Linux can handle differing I-cache policies. Userspace JITs will
>>>>> -	 * make use of *minLine.
>>>>> -	 * If we have differing I-cache policies, report it as the weakest - VIPT.
>>>>> -	 */
>>>>> -	ARM64_FTR_BITS(FTR_VISIBLE, FTR_NONSTRICT, FTR_EXACT, CTR_L1IP_SHIFT, 2, ICACHE_POLICY_VIPT),	/* L1Ip */
>>>>> -	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, CTR_IMINLINE_SHIFT, 4, 0),
>>>>> -	ARM64_FTR_END,
>>>>> -};
>>>>
>>>> I don't think this is should be dropped. Xen will need to know the safest cacheline size that can be used for cache maintenance instructions.
>>> I will surround those entries by #if 0 instead
>>
>> But, why can't this just be sanitized as the other registers? If this is just a matter of missing structure in Xen, then we should add one.
>>
>> The same goes for the other 2 below.
> 
> The point of the RFC was to validate the way to go and do the base.

Right... I was commenting on your suggestion to switch to #if 0 for the 
next version. I assume this will be a non-RFC and...

> Those require changes out of the cpuinfo and are on my todo list to
... it wasn't clear to me that the change on the cpuinfo was on your 
TODO list for the next version.

So I prefer to ask before you spend time working on a change that I may 
disagree with ;).

Cheers,

-- 
Julien Grall

