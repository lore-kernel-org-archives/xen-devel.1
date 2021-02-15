Return-Path: <SRS0=65yj=HR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAEEAC433DB
	for <xen-devel@archiver.kernel.org>; Mon, 15 Feb 2021 11:34:49 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85E9F64DDA
	for <xen-devel@archiver.kernel.org>; Mon, 15 Feb 2021 11:34:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85E9F64DDA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.85193.159743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBc9A-0007P7-MO; Mon, 15 Feb 2021 11:34:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85193.159743; Mon, 15 Feb 2021 11:34:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBc9A-0007P0-JE; Mon, 15 Feb 2021 11:34:32 +0000
Received: by outflank-mailman (input) for mailman id 85193;
 Mon, 15 Feb 2021 11:34:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lBc99-0007Ov-8C
 for xen-devel@lists.xenproject.org; Mon, 15 Feb 2021 11:34:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lBc98-0004oU-2k; Mon, 15 Feb 2021 11:34:30 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lBc97-0005kE-Se; Mon, 15 Feb 2021 11:34:30 +0000
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
	bh=zTO4fwO09MK8vZivCZ95NSeaukYvebOxV5ual5fKQ2g=; b=1JockMy1ZTRbntXg0v55DyVQ+N
	yAcuIzi/Cv4PRGpSwmMYlRLCx/7/4lrqL0WQAGHGoDAvw9yfFeyHbNuV8SrYizvhJZK6aickKWvCx
	DCBzoBk271zbC3pI36lfDJnBFPuYllGN0pdsKTUK0I5tdFIucuXteQjDZUPZCYLF4a1E=;
Subject: Re: [PATCH v2] xen/arm: fix gnttab_need_iommu_mapping
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "lucmiccio@gmail.com" <lucmiccio@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <20210208184932.23468-1-sstabellini@kernel.org>
 <B96B5E21-0600-4664-899D-D38A18DE7A8C@arm.com>
 <alpine.DEB.2.21.2102091226560.8948@sstabellini-ThinkPad-T480s>
 <EFFD35EA-378B-4C5C-8485-7EA5265E89E4@arm.com>
 <4e4f7d25-6f5f-1016-b1c9-7aa902d637b8@xen.org>
 <ECC82E19-3504-4E0E-B3EA-D0E46DD842C6@arm.com>
 <c573b3a0-186d-626e-6670-f8fc28285e3d@xen.org>
 <BFC5858A-3631-48E1-AB87-40EECF95FA66@arm.com>
 <489c1b89-67f0-5d47-d527-3ea580b7cc43@xen.org>
 <DC7F1705-54B3-4543-8222-E7BCF1A501F7@arm.com>
 <acbcdd06-83b1-28ff-ea7e-2ce1ba681ac1@xen.org>
 <8A85CE97-A38D-4580-BBDD-38DD0542A3F8@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <aeb8fe57-b2c8-b87f-d80e-ea2dae12315e@xen.org>
Date: Mon, 15 Feb 2021 11:34:28 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <8A85CE97-A38D-4580-BBDD-38DD0542A3F8@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Rahul,

On 15/02/2021 09:12, Rahul Singh wrote:
>> Thanks for the testing. I noticed that my patch doesn't build because arm_iommu_unmap_page() doesn't have a parameter mfn. Can you confirm whether you had to replace mfn with _mfn(dfn_x(dfn))?
> 
> Yes I have to replace the mfn with _mfn(dfn_x(dfn)) to test the patch.

Thanks.

In the future, I would suggest to mention such things in your testing.

This will be easier to figure out how one managed to test it and whether 
the fix was the same.

Cheers,

-- 
Julien Grall

