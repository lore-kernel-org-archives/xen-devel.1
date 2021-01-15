Return-Path: <SRS0=GqSC=GS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6E45C433E0
	for <xen-devel@archiver.kernel.org>; Fri, 15 Jan 2021 12:19:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7395B223E0
	for <xen-devel@archiver.kernel.org>; Fri, 15 Jan 2021 12:19:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7395B223E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.68037.121695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0O4D-0003Bo-0O; Fri, 15 Jan 2021 12:19:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68037.121695; Fri, 15 Jan 2021 12:19:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0O4C-0003Bh-Tg; Fri, 15 Jan 2021 12:19:00 +0000
Received: by outflank-mailman (input) for mailman id 68037;
 Fri, 15 Jan 2021 12:18:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l0O4A-0003Bb-PV
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 12:18:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l0O49-000377-NW; Fri, 15 Jan 2021 12:18:57 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l0O49-0004dG-Ht; Fri, 15 Jan 2021 12:18:57 +0000
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
	bh=UwOHP8LO8q1Pyc5D6BsGW4s+vNrDyEQmIYq5YBs1fpY=; b=TviRYjQjre2bSbmTSjvITxrNwO
	nRxoJOHFq0Xw9q2zy42XcQikkRyrt7ZiKoOGkIQnr+2uWpVA7no531ojH+1Wwa2uW8xZ8z+uihhtP
	+CNakHO+G9DxhCjVkcN+OpG1itSAHDQl5Fj3tfsk4ZYmLOC1i9pwu/HhCpcUEa6mAjuk=;
Subject: Re: [PATCH v4 09/11] xen/arm: smmuv3: Use fallthrough pseudo-keyword
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1610115608.git.rahul.singh@arm.com>
 <36f9a1e88eea2f2c4cc413688c7210583a3433fe.1610115608.git.rahul.singh@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <362be46d-863b-f6e4-a40d-932c2db5a41f@xen.org>
Date: Fri, 15 Jan 2021 12:18:56 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <36f9a1e88eea2f2c4cc413688c7210583a3433fe.1610115608.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Rahul,

On 08/01/2021 14:46, Rahul Singh wrote:
> Merge the patch from linux to use fallthrough pseudo-keyword.

Please add more information about the patch you are backporting. Is it a 
clean backport?

> 
> Replace the existing /* fall through */ comments and its variants with
> the new pseudo-keyword macro fallthrough[1]. Also, remove unnecessary
> fall-through markings when it is the case.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
> Changes in V4:
>   - This patch is introduce in this verison.
> ---
>   xen/drivers/passthrough/arm/smmu-v3.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
> index 5ce14850b4..f5f8b4c981 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -932,7 +932,6 @@ static void arm_smmu_cmdq_skip_err(struct arm_smmu_device *smmu)
>   		 */
>   		return;
>   	case CMDQ_ERR_CERROR_ILL_IDX:
> -		/* Fallthrough */
>   	default:
>   		break;
>   	}
> @@ -2488,7 +2487,7 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
>   	switch (FIELD_GET(IDR0_STALL_MODEL, reg)) {
>   	case IDR0_STALL_MODEL_FORCE:
>   		smmu->features |= ARM_SMMU_FEAT_STALL_FORCE;
> -		/* Fallthrough */
> +		fallthrough;
>   	case IDR0_STALL_MODEL_STALL:
>   		smmu->features |= ARM_SMMU_FEAT_STALLS;
>   	}
> @@ -2505,7 +2504,7 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
>   	switch (FIELD_GET(IDR0_TTF, reg)) {
>   	case IDR0_TTF_AARCH32_64:
>   		smmu->ias = 40;
> -		/* Fallthrough */
> +		fallthrough;
>   	case IDR0_TTF_AARCH64:
>   		break;
>   	default:
> @@ -2589,7 +2588,7 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
>   	default:
>   		dev_info(smmu->dev,
>   			"unknown output address size. Truncating to 48-bit\n");
> -		/* Fallthrough */
> +		fallthrough;
>   	case IDR5_OAS_48_BIT:
>   		smmu->oas = 48;
>   	}
> 

-- 
Julien Grall

