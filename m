Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90612F531E3
	for <xen-devel@archiver.kernel.org>; Tue, 14 Apr 2026 02:10:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1281401.1564313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCTEe-00006N-D7; Tue, 14 Apr 2026 02:10:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1281401.1564313; Tue, 14 Apr 2026 02:10:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCTEe-00006G-9M; Tue, 14 Apr 2026 02:10:40 +0000
Received: by outflank-mailman (input) for mailman id 1281401;
 Tue, 14 Apr 2026 02:10:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1wCTEd-00006A-HX
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 02:10:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wCTEd-001RdR-0p;
 Tue, 14 Apr 2026 02:10:39 +0000
Received: from [116.84.110.196] (helo=[10.158.125.74])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wCTEc-001VmT-30;
 Tue, 14 Apr 2026 02:10:39 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=bhrcCn6V/kPpvu1fA3POfrorI1qX0VaIDSvPlAcKewI=; b=cKAl92WWPcY+Y6kasF5Qv+bL2N
	tA2R5REsSc5Wg5nIbuIC6egP+ZVBIAXXKLwHac0B2zWuiQEeqnQncF6D/xxOR3XLZ+VvrJK6W2ALE
	Bj0WmMoWyKJbAszo2SQd6iMAHy/JZfRADXjiGLOKgvOOa+MePOlMA26l2UV0vj2hHXNo=;
Message-ID: <56478969-509d-4527-b136-4498840606e2@xen.org>
Date: Tue, 14 Apr 2026 11:10:35 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen: gic-v3: Introduce CONFIG_GICV3_NR_LRS
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20260318140900.3795710-1-ayan.kumar.halder@amd.com>
 <D28202A5-EA01-4AE7-816C-FE3B703605F6@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <D28202A5-EA01-4AE7-816C-FE3B703605F6@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 08/04/2026 23:24, Luca Fancellu wrote:
>> @@ -203,6 +209,10 @@ static uint64_t gicv3_ich_read_lr(int lr)
>>
>> static void gicv3_ich_write_lr(int lr, uint64_t val)
>> {
>> +    /* WI for unsupported LR */
>> +    if ( lr >= LRS )
>> +        return;
>> +
>>      switch ( lr )
>>      {
>>      case 0:
> 
> Now, since we are using CONFIG_GICV3_NR_LRS or gicv3_info.nr_lrs in gicv3_save_lrs/gicv3_restore_lrs,
> there are other part of the codebase using nr_lrs (gic_get_nr_lrs() is one of them), but all the callers of that
> function will use the HW nr_lrs and not the CONFIG_GICV3_NR_LRS, so I think some work needs to be done
> to align them or there will be mismatches at runtime with possible loss of information.

+1. We need a consistent view for the number of LRs. I could also see a 
use case where the integrator wants to support less LRs than what the HW 
supports (this doesn't seem to be prevented with this patch).

Note, during Xen boot, we may need to zero the LRs which are unused as 
they may potentially contain active interrupts.

Cheers,

-- 
Julien Grall


