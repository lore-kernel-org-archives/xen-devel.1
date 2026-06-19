Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F514CD4F26
	for <xen-devel@archiver.kernel.org>; Fri, 19 Jun 2026 11:52:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1342140.1602395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waXli-0007YX-Ir; Fri, 19 Jun 2026 11:52:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1342140.1602395; Fri, 19 Jun 2026 11:52:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waXli-0007YQ-G5; Fri, 19 Jun 2026 11:52:18 +0000
Received: by outflank-mailman (input) for mailman id 1342140;
 Fri, 19 Jun 2026 11:52:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1waXlh-0007YK-9S
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 11:52:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1waXlh-00HKcZ-0B;
 Fri, 19 Jun 2026 11:52:16 +0000
Received: from [2a02:8012:3a1:0:64fb:259f:710c:56e]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1waXlg-00Em03-0i;
 Fri, 19 Jun 2026 11:52:16 +0000
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
	bh=j0p6tyyJgc6wIZgKcXu50e8Na08BCCbP/s03z8r2tfY=; b=eK7zK35Kjn+1VBFSO3g1ZrD6Rk
	UdYD8yyHppzYmGZWk7sXTJWp1I4Qc5Rx25Yc2wLKVS+ETEZeuL4+X8W9YOiWa4RneE4F+GC3EBxBY
	0HY4pHE349m6378f1P+K0aAcDvLx8N5pzSc5hRh7SvARi987ORXtIm2UngoUYgYjDcmg=;
Message-ID: <5d3dff74-f51d-4bfc-b917-3c84f2094f34@xen.org>
Date: Fri, 19 Jun 2026 12:52:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 v2.5] xen/arm: gic: defer host LPI allocation
 until after ITS init
Content-Language: en-GB
To: "Orzel, Michal" <michal.orzel@amd.com>,
 Mykola Kvach <mykola_kvach@epam.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Luca Fancellu <luca.fancellu@arm.com>, Mykola Kvach
 <xakep.amatop@gmail.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <112419d3ea48ca328849c8f6647909d3eb667b40.1779922874.git.mykola_kvach@epam.com>
 <341edd8de63dcd84ccc6e7b6c03e9e8fc7105184.1781847061.git.mykola_kvach@epam.com>
 <7a0a1867-8316-4e20-971e-fab99c9f4a32@amd.com>
 <e43afc29-cfbb-4978-9324-e8d540040bfa@amd.com>
 <1877ea55-0c8d-4593-a310-259b4c5aef3c@xen.org>
 <b47b9bf3-1aa6-41b6-8c7c-48d64cca1c36@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <b47b9bf3-1aa6-41b6-8c7c-48d64cca1c36@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 19/06/2026 12:34, Orzel, Michal wrote:
> 
> 
> On 19-Jun-26 13:23, Julien Grall wrote:
>> Hi Michal,
>>
>> On 19/06/2026 10:48, Orzel, Michal wrote:
>>> @Oleksii, can we ask for a release ack here?
>>
>> Can you explain the pros/cons of introducing this patch quite late?
> The advantage is that it fixes the broken LPIs on affected hardware.

 > The disadvantage is the reordering risk but I don't think there is 
any issue.

See more below.
>>
>> One of the risk here is that we are now initializing the LPIs *after*
>> the ITSes. I understand this is because we want to know the workaround.
>> However, I vaguely recall that there was a dependency in the
>> configuration. So are we confident the new ordering will not bring other
>> issues? Ideally this should have been explained in the commit message.
> gic-v3-its.c never references host LPI state, so ITS init has no dependency on LPIs.

My concern is at the HW level. The ITS is using LPIs. But we will 
configure the ITS first and then the LPIs.

What probaly saves us is the fact gicv3_lpi_init_host_lpis() only seem 
to allocate memory. This is a bit fragile though.

Cheers,

-- 
Julien Grall


