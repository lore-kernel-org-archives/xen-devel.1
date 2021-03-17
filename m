Return-Path: <SRS0=alo8=IP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4BCCC433DB
	for <xen-devel@archiver.kernel.org>; Wed, 17 Mar 2021 12:06:43 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EC5064F07
	for <xen-devel@archiver.kernel.org>; Wed, 17 Mar 2021 12:06:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EC5064F07
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.98680.187292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMUwR-0006mQ-Hw; Wed, 17 Mar 2021 12:06:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98680.187292; Wed, 17 Mar 2021 12:06:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMUwR-0006mJ-Ek; Wed, 17 Mar 2021 12:06:23 +0000
Received: by outflank-mailman (input) for mailman id 98680;
 Wed, 17 Mar 2021 12:06:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lMUwQ-0006mE-3p
 for xen-devel@lists.xenproject.org; Wed, 17 Mar 2021 12:06:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lMUwN-0005TC-3V; Wed, 17 Mar 2021 12:06:19 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lMUwM-0002BB-NN; Wed, 17 Mar 2021 12:06:18 +0000
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
	bh=ttAf8WMCxXbBRdwDCROIRSb6uIR+TP6/CkTxboqus1w=; b=r4u6AXsrqaHNpxcnMgDnGcb03k
	m4E8ZPjNU15pm7yXLZKd+6Wbe7/pX3mUpdOKbv0L5v3TeuwbMfKP53Y+XGjJiid1E47rCicMA9QkQ
	VkJYFhNDbMfa4FihKgfTlry6TQ4Tut+Q9uPvScTblYX2/AohCM3G/eeo3sw26eWiyxns=;
Subject: Re: [PATCH for-4.15 v2] SUPPORT.MD: Mark LiveUpdate of C XenStored
 daemon as Tech Preview
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>, George Dunlap
 <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>
References: <20210317112745.15207-1-julien@xen.org>
 <cc98f580-9d92-79d4-49e7-342dc8d6a803@citrix.com>
 <87fff120-5ed8-4775-2340-3852ee7475e8@xen.org>
 <89c5a560-4d71-64b7-ac1d-07fc86ab3fc3@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <487a6677-168c-1270-cdfb-ae4678b0d2d5@xen.org>
Date: Wed, 17 Mar 2021 12:06:16 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <89c5a560-4d71-64b7-ac1d-07fc86ab3fc3@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Andrew,

On 17/03/2021 11:59, Andrew Cooper wrote:
> On 17/03/2021 11:54, Julien Grall wrote:
>> On 17/03/2021 11:49, Andrew Cooper wrote:
>>> On 17/03/2021 11:27, Julien Grall wrote:
>>>> From: Julien Grall <jgrall@amazon.com>
>>>>
>>>> Support to liveupdate C XenStored daemon was added during the 4.15
>>>> development cycle. Add a section in SUPPORT.MD to explain what is the
>>>> support state.
>>>>
>>>> For now, it is a tech preview.
>>>>
>>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>>
>>> What about oxenstored ?
>>
>> Oh, I read your answer as there is no support. I can resend a patch
>> with the following title:
>>
>> "LiveUpdate of C/Ocaml XenStored daemon"
> 
> I'd put it at tech preview, just like Cxenstored.  In particular, it has
> the same issues concerning outstanding transactions.

I have some work planned for C XenStored to mitigate that as Paul 
recently discovered that some Windows PV drivers may leak transactions 
(see [1]).

> It might however be worth having separate line items in SUPPORT.md to
> start with, just in case the different implementations progress to
> supported at different times.  (More likely, as there isn't an embargo
> adding urgency the work now.)

Sure. Let me respin the patch.

Cheers,


[1] 
https://xenbits.xen.org/gitweb/?p=pvdrivers/win/xenbus.git;a=commit;h=4d3c233a51aef91d464db4d295a1d76ef774a27d

-- 
Julien Grall

