Return-Path: <SRS0=FMYz=GX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F11B2C433DB
	for <xen-devel@archiver.kernel.org>; Wed, 20 Jan 2021 09:34:41 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A458D21D79
	for <xen-devel@archiver.kernel.org>; Wed, 20 Jan 2021 09:34:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A458D21D79
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.71298.127575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l29sk-0000RB-4W; Wed, 20 Jan 2021 09:34:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71298.127575; Wed, 20 Jan 2021 09:34:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l29sk-0000R4-1K; Wed, 20 Jan 2021 09:34:30 +0000
Received: by outflank-mailman (input) for mailman id 71298;
 Wed, 20 Jan 2021 09:34:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l29si-0000Qz-93
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 09:34:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l29si-0005RJ-71; Wed, 20 Jan 2021 09:34:28 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l29si-0002yR-11; Wed, 20 Jan 2021 09:34:28 +0000
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
	bh=1o2vgQfOG9FbaAlJMcFEVXSPn6Uj+KG3keu+Lurtw8U=; b=04UvYdbpo1UQRdjxhb2LzoviY9
	e6vVQ95pj4ssf1GnkrbvrzGChGHhok62ZEsk7UC8Bawr2ng37qSxMD8IhWWbKI1syx0nn/9Kva19o
	L5o1JHgGzc7wMMp0nPmXk4SgJKyHeRzY7qnSe64Lc4si8AfOT1hYjRHifSkMc5srk8vY=;
Subject: Re: minimum gcc version for Arm64
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f9872f1e-56ea-1f01-1141-0096e520e9d8@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <0c7156aa-c093-fdc3-a902-bd631c3791e6@xen.org>
Date: Wed, 20 Jan 2021 09:34:26 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <f9872f1e-56ea-1f01-1141-0096e520e9d8@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 20/01/2021 09:25, Jan Beulich wrote:
> Hello,

Hi Jan,

> 
> by way of monitoring the stable Linux kernel logs I've become
> aware of Linux commit dca5244d2f5b raising the minimum version
> to 5.1. For Arm we currently document 4.8 - should this be
> adjusted (and perhaps split for Arm32 and Arm64)?

Yes, I am already aware of this commit. It is in my todo list for 4.15.

Cheers,

-- 
Julien Grall

