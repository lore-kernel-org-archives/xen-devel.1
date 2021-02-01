Return-Path: <SRS0=1OSo=HD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16EFEC433DB
	for <xen-devel@archiver.kernel.org>; Mon,  1 Feb 2021 09:37:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A571064EAB
	for <xen-devel@archiver.kernel.org>; Mon,  1 Feb 2021 09:37:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A571064EAB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.79628.144991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6Ve6-0006MR-0y; Mon, 01 Feb 2021 09:37:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79628.144991; Mon, 01 Feb 2021 09:37:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6Ve5-0006MK-U9; Mon, 01 Feb 2021 09:37:21 +0000
Received: by outflank-mailman (input) for mailman id 79628;
 Mon, 01 Feb 2021 09:37:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4N3t=HD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l6Ve5-0006MF-9A
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 09:37:21 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 328f6949-9202-4d8a-92f9-41c1fb6c9c0d;
 Mon, 01 Feb 2021 09:37:20 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 78510AE63;
 Mon,  1 Feb 2021 09:37:19 +0000 (UTC)
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
X-Inumbo-ID: 328f6949-9202-4d8a-92f9-41c1fb6c9c0d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612172239; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0TUqV3nK4hzpGWbVQxZaKAW4ccsDU8ScO6Q58BIGzOA=;
	b=XRGPfFwt5LvjIwxy7K5megpnnDKvfg/JEx/dnt+vYl9jKpHCDtGVv8a1+p7Tm/Gfew05Bi
	YQef0NdL9gk3sfY2hCO+9yhqqpLAEmO4ao5BiTqFQTalkaaOIBJ74ZPjNUZ7K3V5N7i6me
	M/wNLWpC6uOVwqkV+ygGAC48/2SKBP0=
Subject: Re: [PATCH] x86/debug: fix page-overflow bug in dbg_rw_guest_mem
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <caba05850df644814d75d5de0574c62ce90e8789.1611971959.git.tamas@tklengyel.com>
 <74f3263a-fe12-d365-ad45-e5556b575539@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <044823b7-1bbd-6405-7371-2b06e49cc147@suse.com>
Date: Mon, 1 Feb 2021 10:37:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <74f3263a-fe12-d365-ad45-e5556b575539@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.01.2021 03:59, Andrew Cooper wrote:
> On 30/01/2021 01:59, Tamas K Lengyel wrote:
>> When using gdbsx dbg_rw_guest_mem is used to read/write guest memory. When the
>> buffer being accessed is on a page-boundary, the next page needs to be grabbed
>> to access the correct memory for the buffer's overflown parts. While
>> dbg_rw_guest_mem has logic to handle that, it broke with 229492e210a. Instead
>> of grabbing the next page the code right now is looping back to the
>> start of the first page. This results in errors like the following while trying
>> to use gdb with Linux' lx-dmesg:
>>
>> [    0.114457] PM: hibernation: Registered nosave memory: [mem
>> 0xfdfff000-0xffffffff]
>> [    0.114460] [mem 0x90000000-0xfbffffff] available for PCI demem 0
>> [    0.114462] f]f]
>> Python Exception <class 'ValueError'> embedded null character:
>> Error occurred in Python: embedded null character
>>
>> Fixing this bug by taking the variable assignment outside the loop.
>>
>> Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

I have to admit that I'm irritated: On January 14th I did submit
a patch ('x86/gdbsx: convert "user" to "guest" accesses') fixing this
as a side effect. I understand that one was taking care of more
issues here, but shouldn't that be preferred? Re-basing isn't going
to be overly difficult, but anyway.

Jan

