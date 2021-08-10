Return-Path: <SRS0=qmCX=NB=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8DE2C4320A
	for <xen-devel@archiver.kernel.org>; Tue, 10 Aug 2021 12:18:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B07C560F41
	for <xen-devel@archiver.kernel.org>; Tue, 10 Aug 2021 12:18:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B07C560F41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.165360.302204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDQhi-0000b1-Kz; Tue, 10 Aug 2021 12:17:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165360.302204; Tue, 10 Aug 2021 12:17:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDQhi-0000au-I6; Tue, 10 Aug 2021 12:17:58 +0000
Received: by outflank-mailman (input) for mailman id 165360;
 Tue, 10 Aug 2021 12:17:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UKY7=NB=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1mDQhg-0000ao-SO
 for xen-devel@lists.xenproject.org; Tue, 10 Aug 2021 12:17:56 +0000
Received: from mail-pj1-x102f.google.com (unknown [2607:f8b0:4864:20::102f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dbd46f69-69ba-4873-90b2-ae658b32a607;
 Tue, 10 Aug 2021 12:17:56 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 pj14-20020a17090b4f4eb029017786cf98f9so5001382pjb.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Aug 2021 05:17:56 -0700 (PDT)
Received: from ?IPv6:2404:f801:0:5:8000::4b1? ([2404:f801:9000:18:efec::4b1])
 by smtp.gmail.com with ESMTPSA id
 ls16sm22103844pjb.49.2021.08.10.05.17.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 05:17:54 -0700 (PDT)
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
X-Inumbo-ID: dbd46f69-69ba-4873-90b2-ae658b32a607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nvD6+M9t7qTrvrmcvKckt/OKOvl8Bvz01WtaH3hiQrw=;
        b=W8VJHgJYz2WQSwNj+l2V4hKZLutN1MT1dVCGeD6amKZrIf5ru9mj7Kr5RPC5btWdWX
         RcBrITr2iOAHNEFyRwZNQK2DWBs/jeslabKlgJrh6HL+/vTklPVAPdNaLnbz89wRnuqp
         vInDusDjinU1k1tXuSrvNl+arW4OUoLjK4+N1kssywggZW7Jvt3yFTBcvkkKO5md3u7e
         bBYY198+1xHTBLt8BAqooipJ4q/UaotaCIigVxqnzz3L1RWNDBQzAY5XUbKRG2hYDfQr
         DyJeQjfUNmnEVrq8buf0/t08+AhEw6uB7PdFS6dLDgmOJUh/gxis1n7pHXyKAOel03W2
         Aoig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nvD6+M9t7qTrvrmcvKckt/OKOvl8Bvz01WtaH3hiQrw=;
        b=mi0z2QHNVzmEAN1Arfi6ZYb44VVjdDGEZEXtPOB62JAkzGNvq8KWAA0bGBEBiK1Q5Y
         DCq1svfMEFnW8Hdyqc6h22zyljIKbdTEuvKJESOSkSXqmNM7ew4sSeDDTrU0j5vVWp2P
         ZsEhHMAohGT+Mfy8+4PLqCgql/qIm9ByiSIFXraxV5RAVfgN+DorD4dQ0qwmEvisNR82
         TI/COc2wqbNoJvgMEe5S3WfVRkYIBbLOmptMUX8YxzhAGbrk4xLkyrST81p/zbrHg1CY
         C770bTc243Os9VyEA+jMS5naO2SrsUBdOdlaKkps/bt2LqqmjDRZgfljirkIB5/5cZdb
         p/Zg==
X-Gm-Message-State: AOAM530H5QPLb0yOlO3vraGqwzFquUCXqOiEsdP16AlSJNZudsJlafS2
	9FelqUhsZmXznU9ucCWGg7w=
X-Google-Smtp-Source: ABdhPJzf0LwxUC1SEDmEJ4+woyBt3uEtabjBKjNM9eN5IQM2eh4nYHReWO5vIVqWyXP8Bs1frIDsoA==
X-Received: by 2002:a63:131f:: with SMTP id i31mr348459pgl.207.1628597875367;
        Tue, 10 Aug 2021 05:17:55 -0700 (PDT)
Subject: Re: [PATCH V3 01/13] x86/HV: Initialize GHCB page in Isolation VM
To: Wei Liu <wei.liu@kernel.org>
Cc: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
 decui@microsoft.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 x86@kernel.org, hpa@zytor.com, dave.hansen@linux.intel.com, luto@kernel.org,
 peterz@infradead.org, konrad.wilk@oracle.com, boris.ostrovsky@oracle.com,
 jgross@suse.com, sstabellini@kernel.org, joro@8bytes.org, will@kernel.org,
 davem@davemloft.net, kuba@kernel.org, jejb@linux.ibm.com,
 martin.petersen@oracle.com, arnd@arndb.de, hch@lst.de,
 m.szyprowski@samsung.com, robin.murphy@arm.com, thomas.lendacky@amd.com,
 brijesh.singh@amd.com, ardb@kernel.org, Tianyu.Lan@microsoft.com,
 pgonda@google.com, martin.b.radev@gmail.com, akpm@linux-foundation.org,
 kirill.shutemov@linux.intel.com, rppt@kernel.org, sfr@canb.auug.org.au,
 saravanand@fb.com, krish.sadhukhan@oracle.com, aneesh.kumar@linux.ibm.com,
 xen-devel@lists.xenproject.org, rientjes@google.com, hannes@cmpxchg.org,
 tj@kernel.org, michael.h.kelley@microsoft.com,
 iommu@lists.linux-foundation.org, linux-arch@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org, netdev@vger.kernel.org, vkuznets@redhat.com,
 parri.andrea@gmail.com, dave.hansen@intel.com
References: <20210809175620.720923-1-ltykernel@gmail.com>
 <20210809175620.720923-2-ltykernel@gmail.com>
 <20210810105609.soi67eg2us5w7yuq@liuwe-devbox-debian-v2>
From: Tianyu Lan <ltykernel@gmail.com>
Message-ID: <93f3b1c6-feec-9c3b-c2d0-6fceffd00ae9@gmail.com>
Date: Tue, 10 Aug 2021 20:17:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210810105609.soi67eg2us5w7yuq@liuwe-devbox-debian-v2>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Wei:
       Thanks for review.

On 8/10/2021 6:56 PM, Wei Liu wrote:
> On Mon, Aug 09, 2021 at 01:56:05PM -0400, Tianyu Lan wrote:
> [...]
>>   static int hv_cpu_init(unsigned int cpu)
>>   {
>>   	union hv_vp_assist_msr_contents msr = { 0 };
>> @@ -85,6 +111,8 @@ static int hv_cpu_init(unsigned int cpu)
>>   		}
>>   	}
>>   
>> +	hyperv_init_ghcb();
>> +
> 
> Why is the return value not checked here? If that's not required, can
> you leave a comment?
> 

The check is necessary here. Will update in the next version.

Thanks.

