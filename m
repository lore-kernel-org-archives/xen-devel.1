Return-Path: <SRS0=o2nd=EL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3747AC388F7
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2020 23:12:09 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B718A206CB
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2020 23:12:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="aQxLwmij"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B718A206CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.20257.45998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaoQA-0005sc-RD; Thu, 05 Nov 2020 23:11:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20257.45998; Thu, 05 Nov 2020 23:11:58 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaoQA-0005sV-OH; Thu, 05 Nov 2020 23:11:58 +0000
Received: by outflank-mailman (input) for mailman id 20257;
 Thu, 05 Nov 2020 23:11:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tWnR=EL=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kaoQ9-0005sJ-Cq
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 23:11:57 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 149d4174-7ad8-41c6-86dc-b38970065425;
 Thu, 05 Nov 2020 23:11:56 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kaoQ6-0004fD-Oe; Thu, 05 Nov 2020 23:11:54 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kaoQ6-000333-Gb; Thu, 05 Nov 2020 23:11:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=tWnR=EL=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kaoQ9-0005sJ-Cq
	for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 23:11:57 +0000
X-Inumbo-ID: 149d4174-7ad8-41c6-86dc-b38970065425
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 149d4174-7ad8-41c6-86dc-b38970065425;
	Thu, 05 Nov 2020 23:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=RULwjwGxYV2qDZA0JSCa3+689WEGHpw+VitmXQBEN7s=; b=aQxLwmijz2M0Wce+09dqJwjX+X
	XsMCRdf5C66b4x5+s2m5PIwxQpjRgV+Nf5vSmD9oBdSJX7e4QYVrAJa/7kg+HE+RHd7XpjtLI4jPR
	mNqxLnatKXtQqePBx8Z2+cVuBnYODyozXZV2xArWuNZcHU+0ekdQIut0Wk6Z2GuQTgzA=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kaoQ6-0004fD-Oe; Thu, 05 Nov 2020 23:11:54 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234] helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kaoQ6-000333-Gb; Thu, 05 Nov 2020 23:11:54 +0000
Subject: Re: [PATCH] xen/arm: traps: Don't panic when receiving an unknown
 debug trap
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20201105223106.22517-1-julien@xen.org>
 <20201105231023.GA9312@mattapan.m5p.com>
From: Julien Grall <julien@xen.org>
Message-ID: <d0dfc285-9d50-b9d6-41c5-b4e9fb1ea6cb@xen.org>
Date: Thu, 5 Nov 2020 23:11:52 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201105231023.GA9312@mattapan.m5p.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 05/11/2020 23:10, Elliott Mitchell wrote:
> On Thu, Nov 05, 2020 at 10:31:06PM +0000, Julien Grall wrote:
>> Even if debug trap are only meant for debugging purpose, it is quite
>> harsh to crash Xen if one of the trap sent by the guest is not handled.
>>
>> So switch from a panic() to a printk().
> 
> Might this qualify as security due to potential DoS?
This code path only exists with CONFIG_DEBUG=y which is not security 
supported.

Cheers,

-- 
Julien Grall

