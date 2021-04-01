Return-Path: <SRS0=WHN/=I6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0871C433ED
	for <xen-devel@archiver.kernel.org>; Thu,  1 Apr 2021 08:09:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8504960FDC
	for <xen-devel@archiver.kernel.org>; Thu,  1 Apr 2021 08:09:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8504960FDC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.104135.198806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRsNl-0001oO-SN; Thu, 01 Apr 2021 08:08:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104135.198806; Thu, 01 Apr 2021 08:08:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRsNl-0001oH-PE; Thu, 01 Apr 2021 08:08:49 +0000
Received: by outflank-mailman (input) for mailman id 104135;
 Thu, 01 Apr 2021 08:08:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRsNj-0001oC-V8
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 08:08:47 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fccfb449-61ac-41b7-8c55-206b68946616;
 Thu, 01 Apr 2021 08:08:47 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 49277B06A;
 Thu,  1 Apr 2021 08:08:46 +0000 (UTC)
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
X-Inumbo-ID: fccfb449-61ac-41b7-8c55-206b68946616
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617264526; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lxipyp9rt3pRxcGI+J9L6VZB7lZCIV/pDMRlARWLStQ=;
	b=A7KGEJUKSoKxX/JVRTQeIWWzA9m2aWowhXYJqxAefA8kAFHgjlDD7+nbWsxi7c9xslJGE7
	Hm4CiHGogrTY0N2SdLgM78xm6yuqVO4Yq/iM3A/6Ea+483GljePWKq9yiKfm3b36pG9bh0
	If+51CXjfonExerjZjB92G2IeL/1qpc=
Subject: Ping: [PATCH] libxg: don't use max policy in xc_cpuid_xend_policy()
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <4fa05759-24ac-5ff3-3db9-94537f6be95d@suse.com>
 <20201106155839.vnhdqcptbpkbzfly@liuwe-devbox-debian-v2>
 <bab94d0a-89e8-18d8-9098-e30781c3a2e9@suse.com>
Message-ID: <44e9cf2e-e90a-12bd-59bf-3c8389ac0862@suse.com>
Date: Thu, 1 Apr 2021 10:08:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <bab94d0a-89e8-18d8-9098-e30781c3a2e9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 23.11.2020 14:58, Jan Beulich wrote:
> On 06.11.2020 16:58, Wei Liu wrote:
>> On Thu, Nov 05, 2020 at 04:56:53PM +0100, Jan Beulich wrote:
>>> Using max undermines the separation between default and max. For example,
>>> turning off AVX512F on an MPX-capable system silently turns on MPX,
>>> despite this not being part of the default policy anymore. Since the
>>> information is used only for determining what to convert 'x' to (but not
>>> to e.g. validate '1' settings), the effect of this change is identical
>>> for guests with (suitable) "cpuid=" settings to that of the changes
>>> separating default from max and then converting (e.g.) MPX from being
>>> part of default to only being part of max for guests without (affected)
>>> "cpuid=" settings.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> I will defer this to Andrew.
> 
> Andrew?

Yet another one (here having been pending for nearly 5 months), and hence
same thing (despite again not feeling well, albeit iirc at the time we
discussed this on irc and you looked to be basically agreeing): I intend
to commit this once the tree is fully open again, unless I hear otherwise.

Jan

