Return-Path: <SRS0=+ia2=JK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A168CC433ED
	for <xen-devel@archiver.kernel.org>; Tue, 13 Apr 2021 17:59:10 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 540B5613B6
	for <xen-devel@archiver.kernel.org>; Tue, 13 Apr 2021 17:59:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 540B5613B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.110063.210066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWNJR-0005gC-KP; Tue, 13 Apr 2021 17:58:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110063.210066; Tue, 13 Apr 2021 17:58:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWNJR-0005g5-Gt; Tue, 13 Apr 2021 17:58:57 +0000
Received: by outflank-mailman (input) for mailman id 110063;
 Tue, 13 Apr 2021 17:58:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lWNJQ-0005g0-B5
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 17:58:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lWNJO-0000hl-Tv; Tue, 13 Apr 2021 17:58:54 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lWNJO-0001sR-Lx; Tue, 13 Apr 2021 17:58:54 +0000
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
	bh=uraZtCIEPhYLj2MqBtUg/XPqVnfYvBnV2LZ70VN7og0=; b=bR2Wa00gkIMH5nCsyHF1VEXsOg
	Cb42HwsIi9DGgsdgfHmlYRCxjpDk+lw1lqnGo3begnoGHAU5CodekxmY1lfkdAH4lvnGDILQ10lG3
	rWic8nu9+TpwWytNBfJxa671cAZzeH4cgPrb8G7DMpIyC4eOrMfzKtozjmjy0nsTC1kU=;
Subject: Re: [PATCH v2] xen/iommu: smmu: Silence clang in
 arm_smmu_device_dt_probe()
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
 Julien Grall <jgrall@amazon.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20210402155106.15486-1-julien@xen.org>
 <alpine.DEB.2.21.2104061502010.31460@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <022a088a-b4ed-2d37-97bf-edd580b4389f@xen.org>
Date: Tue, 13 Apr 2021 18:58:53 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2104061502010.31460@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 06/04/2021 23:02, Stefano Stabellini wrote:
> On Fri, 2 Apr 2021, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Clang 11 will throw the following error:
>>
>> smmu.c:2284:18: error: cast to smaller integer type 'enum arm_smmu_arch_version' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]
>>          smmu->version = (enum arm_smmu_arch_version)of_id->data;
>>                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>
>> The error can be prevented by initially casting to (uintptr_t) and then
>> enum.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>

Thanks! I have committed the patch.

Cheers,

-- 
Julien Grall

