Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 074CDCD4851
	for <xen-devel@archiver.kernel.org>; Tue, 19 May 2026 07:47:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1312512.1582605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPFAi-00008C-L9; Tue, 19 May 2026 07:47:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312512.1582605; Tue, 19 May 2026 07:47:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPFAi-000080-Id; Tue, 19 May 2026 07:47:24 +0000
Received: by outflank-mailman (input) for mailman id 1312512;
 Tue, 19 May 2026 07:47:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1wPFAi-00007s-0D
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 07:47:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wPFAe-00D46j-0p;
 Tue, 19 May 2026 07:47:20 +0000
Received: from [2a02:8012:3a1:0:f5d8:254d:983d:8dea]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wPFAd-00DiS6-32;
 Tue, 19 May 2026 07:47:20 +0000
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
	bh=yh1h2dw5VVpYebt6+Cbjk9VKND33+605S00u7+5X/Yk=; b=xK+9RhjC70r6phNB9wMTq1ySb3
	yrfEchn6VpxutqrgK2fFGFBDPRlZRZuOXGvR5Iu6H4imMBCG1P3acDiWLX4XdKptmb+q9TUk8XQE4
	Ll/ned0c2eFn40nhShmktAKY0rPrvM4hSrPh8p9LCpY2ZS8l8tab8M0MytzDhQnegHmk=;
Message-ID: <3d1001c8-6761-41ba-83df-42c83a453f3e@xen.org>
Date: Tue, 19 May 2026 08:47:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] arm64: Fix strrchr() matching of null terminator
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "Edgar E. Iglesias" <edgar.iglesias@amd.com>
Cc: sstabellini@kernel.org, bertrand.marquis@arm.com, michal.orzel@amd.com,
 Volodymyr_Babchuk@epam.com, xen-devel@lists.xenproject.org
References: <20260518234353.453193-1-edgar.iglesias@amd.com>
 <20260518234353.453193-2-edgar.iglesias@amd.com>
 <9b8ec97f-02ae-4a1a-9abe-59873d574a64@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <9b8ec97f-02ae-4a1a-9abe-59873d574a64@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Edgar and Jan,

On 19/05/2026 07:40, Jan Beulich wrote:
> On 19.05.2026 01:43, Edgar E. Iglesias wrote:
>> The generic Xen strrchr() implementation returns a pointer to the string
>> terminator when searching for '\0', matching the standard C semantics.
 >>>> The ARM64 assembly version stopped as soon as it loaded the 
terminator and
>> returned the previous match pointer instead.  This made strrchr("", '\0')
>> return NULL.
> 
> I wonder though: Why would one pass '\0' to strrchr()? If you want to find
> the end of a string, more efficient (at least in the general case) options
> exist (strchr(), memchr(), strlen()).

+1 I am interested to know the use-case for this change. Is this for 
compliance or real issue? If the latter, can we add some details.

It might also be worth to write a selftest to avoid any regression (in 
particular if we decide to diverge from Linux).

> 
>> Compare the loaded byte against the requested character before deciding
>> whether to stop at the terminator, so the terminator itself can be returned
>> when it is the requested character.
> 
> Nit: "..., so a pointer to the terminator ...".
> 
>> Fixes: 42c4eb6a83 ("xen: arm64: assembly optimised mem* and str*")
>> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> However, the function having come from Linux, imo the patch wants to go to
> Linux (ideally first, but at the very least also).

We are trying to keep the core implementation in lib the same as linux 
(see arch/arm/README.LinuxPrimitives). I would prefer if this is also 
first committed to Linux and then backported.

Cheers,

-- 
Julien Grall


