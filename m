Return-Path: <SRS0=IFNi=NS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3445C432BE
	for <xen-devel@archiver.kernel.org>; Fri, 27 Aug 2021 14:14:24 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAA4060F44
	for <xen-devel@archiver.kernel.org>; Fri, 27 Aug 2021 14:14:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BAA4060F44
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.173712.316920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJccU-0003Rs-Av; Fri, 27 Aug 2021 14:14:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173712.316920; Fri, 27 Aug 2021 14:14:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJccU-0003Rl-80; Fri, 27 Aug 2021 14:14:10 +0000
Received: by outflank-mailman (input) for mailman id 173712;
 Fri, 27 Aug 2021 14:14:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mJccS-0003Rc-GZ
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 14:14:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mJccR-0006wM-J4; Fri, 27 Aug 2021 14:14:07 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mJccR-0001ZH-CV; Fri, 27 Aug 2021 14:14:07 +0000
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
	bh=u0c4ICl/OPOQor78GnqaFIdTriEi9joPV9dRSKE/5RI=; b=xn++tygcWRZ/YEeEMu7BGAUKpN
	LYvnIVzJadzIJEd9cqHI2PcmCvzl+ioKqwW3ol+t/gj2r4KCgi9qnrtLcy1wCvIrYiy0Kv5QNr+lM
	g8tJJUT5XqDwG/bkaedTAOyWJu0O2OrmRBS+fE29aYA51lXUjuSk6M4be/rthPdC+uqI=;
Subject: Re: [XEN RFC PATCH 34/40] xen: move numa_scan_nodes from x86 to
 common
To: Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, jbeulich@suse.com
Cc: Bertrand.Marquis@arm.com
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-35-wei.chen@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <b58424cc-cce9-58d5-5f22-6d8234fa38ad@xen.org>
Date: Fri, 27 Aug 2021 15:14:05 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210811102423.28908-35-wei.chen@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Wei,

On 11/08/2021 11:24, Wei Chen wrote:
> diff --git a/xen/include/asm-x86/acpi.h b/xen/include/asm-x86/acpi.h
> index 33b71dfb3b..2140461ff3 100644
> --- a/xen/include/asm-x86/acpi.h
> +++ b/xen/include/asm-x86/acpi.h
> @@ -101,9 +101,6 @@ extern unsigned long acpi_wakeup_address;
>   
>   #define ARCH_HAS_POWER_INIT	1
>   
> -extern s8 acpi_numa;
> -extern int numa_scan_nodes(u64 start, u64 end);
> -
>   extern struct acpi_sleep_info acpi_sinfo;
>   #define acpi_video_flags bootsym(video_flags)
>   struct xenpf_enter_acpi_sleep;
> diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
> index 490381bd13..b9b5d1ad88 100644
> --- a/xen/include/xen/numa.h
> +++ b/xen/include/xen/numa.h
> @@ -81,8 +81,10 @@ extern void bad_srat(void);
>   extern void numa_init_array(void);
>   extern void numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn);
>   extern void numa_set_node(int cpu, nodeid_t node);
> +extern int numa_scan_nodes(u64 start, u64 end);

AFAICT, by the end of the series, the function is only called by the 
common code. So this should be static.

Cheers,

-- 
Julien Grall

