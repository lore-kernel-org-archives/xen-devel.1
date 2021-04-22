Return-Path: <SRS0=VIWx=JT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B310EC43460
	for <xen-devel@archiver.kernel.org>; Thu, 22 Apr 2021 17:28:05 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 529C26142F
	for <xen-devel@archiver.kernel.org>; Thu, 22 Apr 2021 17:28:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 529C26142F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.115754.220884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZd7C-0007xt-MQ; Thu, 22 Apr 2021 17:27:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115754.220884; Thu, 22 Apr 2021 17:27:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZd7C-0007xm-JE; Thu, 22 Apr 2021 17:27:46 +0000
Received: by outflank-mailman (input) for mailman id 115754;
 Thu, 22 Apr 2021 17:27:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lZd7B-0007xh-00
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 17:27:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lZd78-00037m-Ei; Thu, 22 Apr 2021 17:27:42 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lZd78-0001in-89; Thu, 22 Apr 2021 17:27:42 +0000
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
	bh=h+0ybbERnhMoYAwDxDB3TM1ASJXi7fiuqyuPRbTPa4w=; b=cI0UinpRKJ+gj3Tv65iE3kC0w6
	MYkWb9b5lwVM8zcKpwmQALOAahUtqJvrNpVzEIPzAhAabfZw4Ge81PMrLyQqs0SZ/1UfUgEZ3En68
	jUzXB6ngz+NW2vRgBYTN5z4gj4rtsj/h6aSPBffbUZ2n0l22tU0+q6RCaftneZya1gxw=;
Subject: Re: [PATCH v10 00/13] switch to domheap for Xen page tables
To: Hongyan Xia <hx242@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org
Cc: jgrall@amazon.com, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <cover.1619014052.git.hongyxia@amazon.com>
 <ff54b35e-bcf7-3343-4704-417aeb53865a@citrix.com>
 <8aa8fe1b78a50e69ad1bc4afdd315eb254266162.camel@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <e41859c7-7630-6fb6-a6c4-eb769f06d6f3@xen.org>
Date: Thu, 22 Apr 2021 18:27:40 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <8aa8fe1b78a50e69ad1bc4afdd315eb254266162.camel@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Hongyan,

On 22/04/2021 17:35, Hongyan Xia wrote:
> Please see my reply in 03/13. Can you check this diff and see if you
> can still trigger this issue:

I can reproduced the same issue as Andrew. I have applied the patch and 
confirm this resolves the problem. Can you send a formal patch?

BTW, feel free to add my Tested-by.

Cheers,

-- 
Julien Grall

