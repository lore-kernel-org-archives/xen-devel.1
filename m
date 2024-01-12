Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F2AC4706C
	for <xen-devel@archiver.kernel.org>; Fri, 12 Jan 2024 11:05:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.666812.1037702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOFLz-0005Qt-RL; Fri, 12 Jan 2024 11:05:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666812.1037702; Fri, 12 Jan 2024 11:05:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOFLz-0005Qm-OT; Fri, 12 Jan 2024 11:05:35 +0000
Received: by outflank-mailman (input) for mailman id 666812;
 Fri, 12 Jan 2024 11:05:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rOFLy-0005QL-I5
 for xen-devel@lists.xenproject.org; Fri, 12 Jan 2024 11:05:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rOFLy-0007Ga-17; Fri, 12 Jan 2024 11:05:34 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rOFLx-0007OC-SO; Fri, 12 Jan 2024 11:05:33 +0000
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
	bh=LdRAXqyKlIxX6ztq316dIx8ul6QQBxSvOYeooF+/5PY=; b=iXmpdCa4cNk9cHgnsApbbwyUT+
	Nh8xQcxVC94vapUCWn9HhebJlIUDktWSW/G9sdGFUqSEtQ938ink5ys206nhKRXRkWpt6SBZhIARF
	LQ20b8KZGEZBxNQHklIufLbuLt3lZx79lgbWhK7q7sUK6mzUrWSRv/JlDcbbYuCHEKeo=;
Message-ID: <31997e9d-35f7-4916-b6d7-de38b2697ef7@xen.org>
Date: Fri, 12 Jan 2024 11:05:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/arm: bootfdt: Harden handling of malformed mem
 reserve map
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240111232422.2610495-1-sanastasio@raptorengineering.com>
 <62bb1962-6668-4243-b41d-5aca5d3b7ecd@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <62bb1962-6668-4243-b41d-5aca5d3b7ecd@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 12/01/2024 08:56, Michal Orzel wrote:
> 
> 
> On 12/01/2024 00:24, Shawn Anastasio wrote:
>>
>>
>> The early_print_info routine in bootfdt.c incorrectly stores the result
>> of a call to fdt_num_mem_rsv() in an unsigned int, which results in the
>> negative error code being interpreted incorrectly in a subsequent loop
>> in the case where the device tree is malformed. Fix this by properly
>> checking the return code for an error and calling panic().
>>
>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Committed.

Cheers,

-- 
Julien Grall

