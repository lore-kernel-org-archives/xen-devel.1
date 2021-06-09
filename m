Return-Path: <SRS0=5TPE=LD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60919C48BCF
	for <xen-devel@archiver.kernel.org>; Wed,  9 Jun 2021 10:47:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 235EC60FF4
	for <xen-devel@archiver.kernel.org>; Wed,  9 Jun 2021 10:47:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 235EC60FF4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.139190.257443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqvjy-0007K9-6V; Wed, 09 Jun 2021 10:47:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139190.257443; Wed, 09 Jun 2021 10:47:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqvjy-0007K2-3Z; Wed, 09 Jun 2021 10:47:18 +0000
Received: by outflank-mailman (input) for mailman id 139190;
 Wed, 09 Jun 2021 10:47:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lqvjx-0007Jw-74
 for xen-devel@lists.xenproject.org; Wed, 09 Jun 2021 10:47:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lqvjw-0005JT-TG; Wed, 09 Jun 2021 10:47:16 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lqvjw-0002QQ-Hu; Wed, 09 Jun 2021 10:47:16 +0000
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
	bh=JTNXSqGFm09oaNbsntUhAmOSel3ZY+XKE66APWspejc=; b=gk9s33y8YFwLzl9WAfcILUtAW6
	yCUVU2htzUIfDg0HmdnuIekWPnANDto5CkrJkuTj06sYgC42trdQHpot7KfCOKy8RevaYtggSMNgA
	VL+vc/lI3dHsE/J90jUY9Nl2GrIBb0B2FjhGbtU5hSUJ4oDgIyTJMuBJkIbXfmjwWTps=;
Subject: Re: [PATCH 01/10] xen/arm: introduce domain on Static Allocation
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall.oss@gmail.com>, Penny Zheng
 <Penny.Zheng@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Chen <Wei.Chen@arm.com>, nd <nd@arm.com>
References: <20210518052113.725808-1-penny.zheng@arm.com>
 <20210518052113.725808-2-penny.zheng@arm.com>
 <e1b90f06-92d2-11da-c556-4081907124b8@xen.org>
 <VE1PR08MB521519C6F09E92EDB9C9A1AEF72B9@VE1PR08MB5215.eurprd08.prod.outlook.com>
 <66e32065-ea2d-d000-1a70-e5598a182b6a@xen.org>
 <VE1PR08MB5215C1F5041860102BBAD595F72A9@VE1PR08MB5215.eurprd08.prod.outlook.com>
 <14fb6fe4-c293-6994-8cbc-872d3bd8a3ac@xen.org>
 <VE1PR08MB52152792B6771236A6DF37E7F73D9@VE1PR08MB5215.eurprd08.prod.outlook.com>
 <4251e0e2-fb53-b8a3-0323-f4ce892cf21e@xen.org>
 <alpine.DEB.2.21.2106031408320.7272@sstabellini-ThinkPad-T480s>
 <CAJ=z9a234ANQDR7BmtSm4AT0k3jrCn67s4b3zZ+jdkUgBMahbw@mail.gmail.com>
 <alpine.DEB.2.21.2106031625530.7272@sstabellini-ThinkPad-T480s>
 <113937c2-f1a7-c27f-8e2e-79de729ea3ce@xen.org>
 <BAC8BC8D-9CD6-4857-88C0-7DCE9267EF0E@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e3a81b21-fd11-852c-aed7-25e71e4b5539@xen.org>
Date: Wed, 9 Jun 2021 11:47:14 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <BAC8BC8D-9CD6-4857-88C0-7DCE9267EF0E@arm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 09/06/2021 10:56, Bertrand Marquis wrote:
> Hi All,

Hi,

>> On 7 Jun 2021, at 19:09, Julien Grall <julien@xen.org 
>> <mailto:julien@xen.org>> wrote:
>> Feel free to propose one. I suggested to use /reserved-memory because 
>> this is the approach that makes the most sense to me (see my reply above).
>>
>> TBH, even after your explanation, I am still a bit puzzled into why 
>> /reserved-memory cannot be leveraged to exclude domain region from the 
>> hypervisor allocator.
> 
> I really tend to think that the original solution from Penny is for now 
> the easiest and simplest to document.

I can live with Penny's solution so long we don't duplicate the parsing 
and we don't create new datastructure in Xen for the new type of 
reserved memory. However...

> 
> In the long term, using directly memory and giving in it the address 
> range directly is the most natural solution but that would clash with 
> the current usage for it.

... we are already going to have quite some churn to support the system 
device-tree. So I don't want yet another binding to be invented in a few 
months time.

IOW, the new binding should be a long term solution rather than a 
temporary one to fill the gap until we agree on what you call "domain v2".

Cheers,

-- 
Julien Grall

