Return-Path: <SRS0=mBg9=KX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEA96C2B9F7
	for <xen-devel@archiver.kernel.org>; Fri, 28 May 2021 13:39:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AECB161284
	for <xen-devel@archiver.kernel.org>; Fri, 28 May 2021 13:39:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AECB161284
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.133930.249435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmciA-0004QB-TZ; Fri, 28 May 2021 13:39:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133930.249435; Fri, 28 May 2021 13:39:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmciA-0004Q4-QY; Fri, 28 May 2021 13:39:38 +0000
Received: by outflank-mailman (input) for mailman id 133930;
 Fri, 28 May 2021 13:39:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wdiM=KX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lmci9-0004Py-Qs
 for xen-devel@lists.xenproject.org; Fri, 28 May 2021 13:39:37 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a24a8389-3945-40f7-8023-7bcaac39cd9e;
 Fri, 28 May 2021 13:39:36 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AA231218B3;
 Fri, 28 May 2021 13:39:35 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 6E74111A98;
 Fri, 28 May 2021 13:39:35 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id zf8BGZfysGD9TwAALh3uQQ
 (envelope-from <jbeulich@suse.com>); Fri, 28 May 2021 13:39:35 +0000
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
X-Inumbo-ID: a24a8389-3945-40f7-8023-7bcaac39cd9e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622209175; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OisGe7vQXFfJ9DLT33XiqJ9GPBCWqd7AwYgymIyC5hQ=;
	b=qYsW0UxG8hs5yKQtAB6r5e8Toa9nj0zJwaPqH8bgJw8F8fZzP6Y+/UQnZIaKz12kBeSAe8
	kWzLbAghzIMy+frjKkj2XZ50EMEAAGSJylATOj8orrYvZdYc4WEGLRa6kPlTwWP9dm9WEy
	YUz8bFrPiPE5AlEiQwRhYt7PrK9foKI=
Subject: Re: [PATCH 06/13] cpufreq: Export HWP parameters to userspace
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <20210503192810.36084-1-jandryuk@gmail.com>
 <20210503192810.36084-7-jandryuk@gmail.com>
 <e54c3aef-4c44-4302-f7f4-4f4733e33780@suse.com>
 <CAKf6xptN13CW78XajgyE0G8t2NjFVka8tzNO2oofjcw7tT7n8g@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f267ad7b-f2e7-665c-d989-45759cf18a02@suse.com>
Date: Fri, 28 May 2021 15:39:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <CAKf6xptN13CW78XajgyE0G8t2NjFVka8tzNO2oofjcw7tT7n8g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 28.05.2021 15:19, Jason Andryuk wrote:
> On Thu, May 27, 2021 at 4:03 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 03.05.2021 21:28, Jason Andryuk wrote:
>>> --- a/xen/drivers/acpi/pmstat.c
>>> +++ b/xen/drivers/acpi/pmstat.c
>>> @@ -290,6 +290,12 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
>>>              &op->u.get_para.u.ondemand.sampling_rate,
>>>              &op->u.get_para.u.ondemand.up_threshold);
>>>      }
>>> +
>>> +    if ( !strncasecmp(op->u.get_para.scaling_governor,
>>> +                      "hwp-internal", CPUFREQ_NAME_LEN) )
>>> +    {
>>> +        ret = get_hwp_para(policy, &op->u.get_para.u.hwp_para);
>>> +    }
>>>      op->u.get_para.turbo_enabled = cpufreq_get_turbo_status(op->cpuid);
>>
>> Nit: Unnecessary parentheses again, and with the leading blank line
>> you also want a trailing one. (As an aside I'm also not overly happy
>> to see the call keyed to the governor name. Is there really no other
>> indication that hwp is in use?)
> 
> This is preceded by similar checks for "userspace" and "ondemand", so
> it is following existing code.  Unlike other governors, hwp-internal
> is static.  It could be exported if you want to switch to comparing
> with cpufreq_driver.

Hmm, well, then feel free to keep the logic as you have it, except
please don't take presence of unnecessary braces as excuse to add
more.

>>> +    uint8_t hw_feature; /* bit flags for features */
>>> +    uint8_t hw_lowest;
>>> +    uint8_t hw_most_efficient;
>>> +    uint8_t hw_guaranteed;
>>> +    uint8_t hw_highest;
>>
>> Any particular reason for the recurring hw_ prefixes?
> 
> The idea was to differentiate values provided by CPU hardware from
> user-configured values.

I think that follows from their names already without the prefix.
I'd prefer if you dropped them, but I'll try to not insist (I may
comment on this again in later versions, in case I forgot by then).

Jan

