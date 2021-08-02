Return-Path: <SRS0=XnGw=MZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED068C4338F
	for <xen-devel@archiver.kernel.org>; Mon,  2 Aug 2021 12:35:43 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD9D06052B
	for <xen-devel@archiver.kernel.org>; Mon,  2 Aug 2021 12:35:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AD9D06052B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.162981.298686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAXAI-0001Mt-Ba; Mon, 02 Aug 2021 12:35:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 162981.298686; Mon, 02 Aug 2021 12:35:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAXAI-0001Mm-7Z; Mon, 02 Aug 2021 12:35:30 +0000
Received: by outflank-mailman (input) for mailman id 162981;
 Mon, 02 Aug 2021 12:35:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SgE8=MZ=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1mAXAH-0001Mg-7z
 for xen-devel@lists.xenproject.org; Mon, 02 Aug 2021 12:35:29 +0000
Received: from mail-pl1-x636.google.com (unknown [2607:f8b0:4864:20::636])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b4c28419-7f4e-48a0-b9c4-0d6296988338;
 Mon, 02 Aug 2021 12:35:28 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id u2so11149282plg.10
 for <xen-devel@lists.xenproject.org>; Mon, 02 Aug 2021 05:35:28 -0700 (PDT)
Received: from ?IPv6:2404:f801:0:5:8000::4b1? ([2404:f801:9000:1a:efea::4b1])
 by smtp.gmail.com with ESMTPSA id
 g11sm10696958pju.13.2021.08.02.05.35.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 05:35:27 -0700 (PDT)
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
X-Inumbo-ID: b4c28419-7f4e-48a0-b9c4-0d6296988338
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=P17ATPCGukDO//xkLZQBZuaX2KkafCVoCkJP2PCc12U=;
        b=uSz1V29fGX6wnfKClfnD5P1rh/6G4ybzLhb6KPWPPb6eZ2HEzfmHStIAm2N43ack5x
         ETcWD1FyNZMQBoyjY4aCEFCx2Wfye33oL5jKcyzFy4TChrGqa8j99tNqb7Peud6qur0g
         HSxbyh/S9VvDFpJm7czUM9e5UouUkzwjmLx3vV4iYXQnMQPDEp/wTYllcK7ITNHn68Dp
         MOnWhBnFiANNaMTFuwQk3MvS8R2grVLz4JqJf+n7xVj3C562MTurnsVUTflJysxfQYhE
         z53shCXQsRsAmcyYsm/NSjWT+vMCIAA2FisxRh/yWsZWWPV20EW7K2BRieMbbucA+e61
         TZ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=P17ATPCGukDO//xkLZQBZuaX2KkafCVoCkJP2PCc12U=;
        b=HmHDwXSFn04xPKnuDxfjnUUsr2O57fWbg7Vke3h7VFoEqOI/l9Kfx2lfL83zEKYAu5
         kNfxRitcduhW8dCxjXnZC4FXKNQVBlkg9afuL4HYRI/qdAnok3Qs5fSI809O6VLmC3Oe
         jfS34itNdF2xw7DW27pjzQueO8UC85TJuh/HVqUOwBbEa7tHRGe8nA+jhEJLcDuTBken
         ta6HgnWpni8Ph3Njs4nLBXlcjUSIsT8yYNlV2F4UleY41nwyuchFs0G9eOGoMxbHICGq
         bC5hE2fD/f7y7sE5T8nlmtQccUPQAbnB2ujXyGF1JfxqC56IVfamvHUE5Rb0XXunpwd7
         V4Zw==
X-Gm-Message-State: AOAM533JqE9sj1xHlaq5OHVnU52ftczQ6A124nr5VQX4EtzV275S8xVz
	/YNsPyub5b0Ns3UKX/KvKWQ=
X-Google-Smtp-Source: ABdhPJzYaozKahVEd/Y/yLXvnuEsqWmP1RjZTZHrtR9OGLLZiEzcQgoWz5sbNZrtoNXJm1QhUBxNOw==
X-Received: by 2002:a17:90b:4a90:: with SMTP id lp16mr16910701pjb.74.1627907727675;
        Mon, 02 Aug 2021 05:35:27 -0700 (PDT)
Subject: Re: [PATCH 01/13] x86/HV: Initialize GHCB page in Isolation VM
To: Joerg Roedel <joro@8bytes.org>
Cc: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
 wei.liu@kernel.org, decui@microsoft.com, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
 dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
 konrad.wilk@oracle.com, boris.ostrovsky@oracle.com, jgross@suse.com,
 sstabellini@kernel.org, will@kernel.org, davem@davemloft.net,
 kuba@kernel.org, jejb@linux.ibm.com, martin.petersen@oracle.com,
 arnd@arndb.de, hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com,
 thomas.lendacky@amd.com, brijesh.singh@amd.com, ardb@kernel.org,
 Tianyu.Lan@microsoft.com, rientjes@google.com, martin.b.radev@gmail.com,
 akpm@linux-foundation.org, rppt@kernel.org, kirill.shutemov@linux.intel.com,
 aneesh.kumar@linux.ibm.com, krish.sadhukhan@oracle.com, saravanand@fb.com,
 xen-devel@lists.xenproject.org, pgonda@google.com, david@redhat.com,
 keescook@chromium.org, hannes@cmpxchg.org, sfr@canb.auug.org.au,
 michael.h.kelley@microsoft.com, iommu@lists.linux-foundation.org,
 linux-arch@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
 netdev@vger.kernel.org, vkuznets@redhat.com, anparri@microsoft.com
References: <20210728145232.285861-1-ltykernel@gmail.com>
 <20210728145232.285861-2-ltykernel@gmail.com> <YQfctjRm16IP0qZy@8bytes.org>
From: Tianyu Lan <ltykernel@gmail.com>
Message-ID: <e8918379-5c59-c718-3cec-27da931660e9@gmail.com>
Date: Mon, 2 Aug 2021 20:35:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YQfctjRm16IP0qZy@8bytes.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Joerg:
      Thanks for your review.


On 8/2/2021 7:53 PM, Joerg Roedel wrote:
> On Wed, Jul 28, 2021 at 10:52:16AM -0400, Tianyu Lan wrote:
>> +static int hyperv_init_ghcb(void)
>> +{
>> +	u64 ghcb_gpa;
>> +	void *ghcb_va;
>> +	void **ghcb_base;
>> +
>> +	if (!ms_hyperv.ghcb_base)
>> +		return -EINVAL;
>> +
>> +	rdmsrl(MSR_AMD64_SEV_ES_GHCB, ghcb_gpa);
>> +	ghcb_va = memremap(ghcb_gpa, HV_HYP_PAGE_SIZE, MEMREMAP_WB);
> 
> This deserves a comment. As I understand it, the GHCB pa is set by
> Hyper-V or the paravisor, so the page does not need to be allocated by
> Linux.
> And it is not mapped unencrypted because the GHCB page is allocated
> above the VTOM boundary?

You are right. The ghdb page is allocated by paravisor and its physical 
address is above VTOM boundary. Will add a comment to describe this.
Thanks for suggestion.

> 
>> @@ -167,6 +190,31 @@ static int hv_cpu_die(unsigned int cpu)
>>   {
>>   	struct hv_reenlightenment_control re_ctrl;
>>   	unsigned int new_cpu;
>> +	unsigned long flags;
>> +	void **input_arg;
>> +	void *pg;
>> +	void **ghcb_va = NULL;
>> +
>> +	local_irq_save(flags);
>> +	input_arg = (void **)this_cpu_ptr(hyperv_pcpu_input_arg);
>> +	pg = *input_arg;
> 
> Pg is never used later on, why is it set?

Sorry for noise. This should be removed during rebase and will fix in 
the next version.

