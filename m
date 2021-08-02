Return-Path: <SRS0=XnGw=MZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1ED9C4338F
	for <xen-devel@archiver.kernel.org>; Mon,  2 Aug 2021 14:09:10 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B56896023B
	for <xen-devel@archiver.kernel.org>; Mon,  2 Aug 2021 14:09:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B56896023B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.163116.298884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAYco-0001yZ-GG; Mon, 02 Aug 2021 14:09:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163116.298884; Mon, 02 Aug 2021 14:09:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAYco-0001yS-Cr; Mon, 02 Aug 2021 14:09:02 +0000
Received: by outflank-mailman (input) for mailman id 163116;
 Mon, 02 Aug 2021 14:09:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SgE8=MZ=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1mAYcn-0001yK-7c
 for xen-devel@lists.xenproject.org; Mon, 02 Aug 2021 14:09:01 +0000
Received: from mail-pl1-x629.google.com (unknown [2607:f8b0:4864:20::629])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2ddd4fca-7292-4dd4-ba46-dc72c5c56ef4;
 Mon, 02 Aug 2021 14:09:00 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id j3so4635028plx.4
 for <xen-devel@lists.xenproject.org>; Mon, 02 Aug 2021 07:09:00 -0700 (PDT)
Received: from ?IPv6:2404:f801:0:5:8000::4b1? ([2404:f801:9000:18:efec::4b1])
 by smtp.gmail.com with ESMTPSA id
 fz10sm11071046pjb.40.2021.08.02.07.08.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 07:08:59 -0700 (PDT)
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
X-Inumbo-ID: 2ddd4fca-7292-4dd4-ba46-dc72c5c56ef4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/cdM8HpdDM3Yh7GGE7exLVKVMbD9iA/9tyiszM+STgg=;
        b=EyGzIbCm/4WfGRl2TIpRtI8exR5hEZdzfziWgkyJF2rPPiSQ75H+98IAopMmYevfFk
         Ov/fJ43JIQnILsE3s/0qzNMc0nrf6uUXE2j26BExy5g7B3BpTmvtolJxygg5zsp4OzjQ
         /7pE2ruUo+gM4LDOxH4S0QCLE3cZn8HjYiXLd7zaPCzN5tcqN75mDO2ycYHk5nf3h82W
         fzBmyU3qV/42PwBr8KexEQmrjqnx6SCVYEPtgGSjDXNVb1Uffuv26Hb9ID8hcdFyzcOI
         2ZeoAyGM+UdW1S66kVSqZMjoR5QEIes/nzm112DtVAisubEuzui0RUvnkB/UUMAP1zyE
         JLjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/cdM8HpdDM3Yh7GGE7exLVKVMbD9iA/9tyiszM+STgg=;
        b=d1Zv5lNq7nxY54viwEgJpX5ag+70nsOLVYeI1KxsCodboGEqUX6zDMSVweZAoOhK8m
         AlKeXtPE4E0xkSEGSTt2e8L8Yxbzm4bNfi1SCNtN6vl3+YbiXriDWKF3ZbfgZ0SQXBBG
         CLB252ns4UBiZnRGpJFBtHex0Gg975Q6pY3mQn/E/uEcqENdrWGvX5fYkw/1LaSgR3Rx
         jt6II6x9K+11yLopolMpIGyPBEEwVNLqKUxTUW+ZPJweBepUvLM5rVJDp2dpgtl9Xeap
         k8UnsppNh7KZKVRlA7sgkyFYEdDCzRW3HC8PlkVPFrSPW/AsZOpqW/I3C8hIdkIxf5i/
         1x0Q==
X-Gm-Message-State: AOAM531JJkP3/cPvWf2e487FuOYb2a1ICWGstUbYHzLivhdjQ9XAyOcX
	XXsVBKkKsCWa70rUCgcbSpM=
X-Google-Smtp-Source: ABdhPJz9/oIt1d6cc74gFPmQ4IHl6g1R2CxfQ4Ko9VZ15V7BmdIE77nzkycqmmDE/JgZuYIJykKPEQ==
X-Received: by 2002:aa7:8148:0:b029:31b:10b4:f391 with SMTP id d8-20020aa781480000b029031b10b4f391mr16506898pfn.69.1627913339735;
        Mon, 02 Aug 2021 07:08:59 -0700 (PDT)
Subject: Re: [PATCH 13/13] HV/Storvsc: Add Isolation VM support for storvsc
 driver
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
 <20210728145232.285861-14-ltykernel@gmail.com> <YQfxA/AYfOqyqNh0@8bytes.org>
From: Tianyu Lan <ltykernel@gmail.com>
Message-ID: <eaeb75b7-7e98-ad2d-0e2c-0565b9db79dd@gmail.com>
Date: Mon, 2 Aug 2021 22:08:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YQfxA/AYfOqyqNh0@8bytes.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/2/2021 9:20 PM, Joerg Roedel wrote:
> On Wed, Jul 28, 2021 at 10:52:28AM -0400, Tianyu Lan wrote:
>> In Isolation VM, all shared memory with host needs to mark visible
>> to host via hvcall. vmbus_establish_gpadl() has already done it for
>> storvsc rx/tx ring buffer. The page buffer used by vmbus_sendpacket_
>> mpb_desc() still need to handle. Use DMA API to map/umap these
>> memory during sending/receiving packet and Hyper-V DMA ops callback
>> will use swiotlb function to allocate bounce buffer and copy data
>> from/to bounce buffer.
> 
> I am wondering why you dont't use DMA-API unconditionally? It provides
> enough abstraction to do the right thing for isolated and legacy VMs.
> 

In VMbus, there is already a similar bounce buffer design and so there 
is no need to call DMA-API for such buffer. Calling DMA-API is to use
swiotlb bounce buffer for those buffer which hasn't been covered. This
is why need to conditionally call DMA API.

