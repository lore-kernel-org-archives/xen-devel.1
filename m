Return-Path: <SRS0=1OSo=HD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF68CC433DB
	for <xen-devel@archiver.kernel.org>; Mon,  1 Feb 2021 15:25:03 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8532464E9B
	for <xen-devel@archiver.kernel.org>; Mon,  1 Feb 2021 15:25:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8532464E9B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.79971.145957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6b4R-0006xA-B6; Mon, 01 Feb 2021 15:24:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79971.145957; Mon, 01 Feb 2021 15:24:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6b4R-0006x1-4x; Mon, 01 Feb 2021 15:24:55 +0000
Received: by outflank-mailman (input) for mailman id 79971;
 Mon, 01 Feb 2021 15:24:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4N3t=HD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l6b4Q-0006wJ-FJ
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 15:24:54 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 68241d7c-7b3c-4b6c-bb40-8f12f823bd8a;
 Mon, 01 Feb 2021 15:24:53 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A1AF8AB92;
 Mon,  1 Feb 2021 15:24:52 +0000 (UTC)
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
X-Inumbo-ID: 68241d7c-7b3c-4b6c-bb40-8f12f823bd8a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612193092; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N5ty0huTZtI0G0yLVdIqAvLN3l71HCYk3tPLXHwt23w=;
	b=MpxDllO6j2J8RnFOMAiI5I2f0AzULk0kRY5y82McSo2MijflZP4uFOnsdnfjM9LDJDlC5M
	0iPO3QmTJ2AYUrSSSV8rarPnlHSAHe5HlosSG2OnsrCknUbXXxlZJdZD9nFmvLQX9gQffi
	BwGuiL11YAazDW7iHpAuLPzTplJMegg=
Subject: Re: [PATCH] x86/build: correctly record dependencies of asm-offsets.s
 [and 1 more messages]
To: Ian Jackson <iwj@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Julien Grall <julien@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <b3b57f6b-3ed9-18f6-2a87-6af3304c6645@suse.com>
 <0cbbdb3a-5681-10df-aeee-ac185d7033cc@citrix.com>
 <24600.6974.503961.950273@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <aed2dfba-3b1c-7e54-7996-766b100375f9@suse.com>
Date: Mon, 1 Feb 2021 16:24:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <24600.6974.503961.950273@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01.02.2021 16:16, Ian Jackson wrote:
> Andrew Cooper writes ("Re: [PATCH] x86/build: correctly record dependencies of asm-offsets.s"):
>> On 01/02/2021 14:56, Jan Beulich wrote:
>>> Going through an intermediate *.new file requires telling the compiler
>>> what the real target is, so that the inclusion of the resulting .*.d
>>> file will actually be useful.
>>>
>>> Fixes: 7d2d7a43d014 ("x86/build: limit rebuilding of asm-offsets.h")
>>> Reported-by: Julien Grall <julien@xen.org>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>, whatever the
>> outcome of the discussion below.
> 
> This is a bugfix and does not need a release ack, but FTAOD

Oh, this used to be different on prior releases once we were
past the full freeze point. Are to intending to allow bug fixes
without release ack until the actual release (minus commit
moratorium periods, of course), or will this change at some
(un?)predictable point?

> Release-Acked-by: Ian Jackson <iwj@xenproject.org>

Thanks.

Jan

