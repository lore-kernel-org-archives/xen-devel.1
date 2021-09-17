Return-Path: <SRS0=v0KR=OH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22E4CC433EF
	for <xen-devel@archiver.kernel.org>; Fri, 17 Sep 2021 15:53:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D251D611C8
	for <xen-devel@archiver.kernel.org>; Fri, 17 Sep 2021 15:53:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D251D611C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.189541.339318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRGAh-0003Th-5h; Fri, 17 Sep 2021 15:53:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189541.339318; Fri, 17 Sep 2021 15:53:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRGAh-0003Ta-1f; Fri, 17 Sep 2021 15:53:03 +0000
Received: by outflank-mailman (input) for mailman id 189541;
 Fri, 17 Sep 2021 15:53:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mRGAf-0003TU-KF
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 15:53:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mRGAd-0001Qu-L7; Fri, 17 Sep 2021 15:52:59 +0000
Received: from [202.153.84.92] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mRGAd-0003Sx-Ah; Fri, 17 Sep 2021 15:52:59 +0000
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
	bh=0xA5ARbzT7zqy34RdeBkN5rAk75b7CzxrS79b8ftDgo=; b=PRNtL20ZUluTHgwrsQQ11JAvGa
	nGzq1hfgmbYmsGmcFZk4uZbYFOkMx3Wm2T30Wl8cznV19oSiYnALRCyCnNbAxo/KUt/hnzIcbuZkC
	oL6yTyu538eiVTZIkyjmsAX51Pj45aObMfT0y78g+VaCzsEPf3dSJ34mBJPXs+ybB9io=;
Subject: Re: [PATCH V2 2/3] xen/arm: Add handling of extended regions for Dom0
To: Oleksandr <olekstysh@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Henry Wang <Henry.Wang@arm.com>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
References: <1631297924-8658-1-git-send-email-olekstysh@gmail.com>
 <1631297924-8658-3-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2109131726420.10523@sstabellini-ThinkPad-T480s>
 <c3fd1198-15bf-6c05-fe5d-ea29255f1dfe@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e832477f-4ed7-4f12-90aa-ebc1843cdc36@xen.org>
Date: Fri, 17 Sep 2021 20:52:52 +0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <c3fd1198-15bf-6c05-fe5d-ea29255f1dfe@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 16/09/2021 00:10, Oleksandr wrote:
>>> + * The extended regions will be prevalidated by the memory hotplug path
>>> + * in Linux which requires for any added address range to be within 
>>> maximum
>>> + * possible addressable physical memory range for which the linear 
>>> mapping
>>> + * could be created.
>>> + * For 48-bit VA space size the maximum addressable range are:
>>> + * 0x40000000 - 0x80003fffffff
>> Please don't make Linux-specific comments in Xen code for interfaces
>> that are supposed to be OS-agnostic.
> 
> You are right. I just wanted to describe where these magic numbers come 
> from.
> Someone might question why, for example, "0 ... max_gpaddr" can't be 
> used. I will move
> that Linux-specific comments to the commit message to keep some 
> justification of these numbers.

Please keep some rationale in the code. This is a lot easier to 
understand the code without having to play the git blame game.

Cheers,

-- 
Julien Grall

