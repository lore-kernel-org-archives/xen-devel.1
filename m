Return-Path: <SRS0=6BBm=J2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79BD4C433B4
	for <xen-devel@archiver.kernel.org>; Thu, 29 Apr 2021 13:11:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1365561057
	for <xen-devel@archiver.kernel.org>; Thu, 29 Apr 2021 13:11:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1365561057
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.119991.226871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc6Rg-0001D6-Uz; Thu, 29 Apr 2021 13:11:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119991.226871; Thu, 29 Apr 2021 13:11:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc6Rg-0001Cz-Rz; Thu, 29 Apr 2021 13:11:08 +0000
Received: by outflank-mailman (input) for mailman id 119991;
 Thu, 29 Apr 2021 13:11:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xfjL=J2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lc6Rf-0001Cq-7W
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 13:11:07 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1ec80139-08ed-4b19-83ef-ce175221c69f;
 Thu, 29 Apr 2021 13:11:03 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4DF40B156;
 Thu, 29 Apr 2021 13:11:02 +0000 (UTC)
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
X-Inumbo-ID: 1ec80139-08ed-4b19-83ef-ce175221c69f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619701862; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=22pQnCVeFanA9VjLo2fhHSQH5l3LKKD+EW3AOqi0V0E=;
	b=fKT8HdmLaAiD0Hc5+awYuCrJE28Jz/cFkOg48m0A886aBkglSTvP9nsi/dk4FTUGf1D+Ga
	8Y5U4W5BL3BSjeM6V7DLroe+/M+a7+TKna+4WAQYJjrWJWmwze7s4wM3zTZoyBrRsXQ5+g
	W2Eu1KeUFWDy31f5Y/JBRP4YhePuk0U=
Subject: Re: [PATCH v3 3/3] docs/doxygen: doxygen documentation for
 grant_table.h
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210426153741.26904-1-luca.fancellu@arm.com>
 <20210426153741.26904-4-luca.fancellu@arm.com>
 <eae12602-0616-9363-c8c6-ef6bbd78673c@suse.com>
 <E47AFE69-CA75-468D-868D-182F78C6992C@arm.com>
 <d50b05f7-f644-0123-9994-d31668bd5b5f@suse.com>
 <38004B72-8F91-4B4E-843E-B80911DC48B3@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <843b7489-bf08-7313-767c-9c9f1c719736@suse.com>
Date: Thu, 29 Apr 2021 15:11:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <38004B72-8F91-4B4E-843E-B80911DC48B3@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 29.04.2021 11:50, Luca Fancellu wrote:
>> On 29 Apr 2021, at 10:04, Jan Beulich <jbeulich@suse.com> wrote:
>> On 28.04.2021 16:59, Luca Fancellu wrote:
>>>> On 27 Apr 2021, at 14:57, Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 26.04.2021 17:37, Luca Fancellu wrote:
>>>>> @@ -120,24 +132,26 @@ typedef uint32_t grant_ref_t;
>>>>> * [GST]: This field is written by the guest and read by Xen.
>>>>> */
>>>>>
>>>>> -/*
>>>>> - * Version 1 of the grant table entry structure is maintained purely
>>>>> - * for backwards compatibility.  New guests should use version 2.
>>>>> - */
>>>>> #if __XEN_INTERFACE_VERSION__ < 0x0003020a
>>>>> #define grant_entry_v1 grant_entry
>>>>> #define grant_entry_v1_t grant_entry_t
>>>>> #endif
>>>>> +/**
>>>>> + * Version 1 of the grant table entry structure is maintained purely
>>>>> + * for backwards compatibility.  New guests should use version 2.
>>>>> + */
>>>>
>>>> In case I didn't say so already before - I think this would be a good
>>>> opportunity to drop the comment pointing at v2. With v2 optionally
>>>> unavailable altogether, this can't possibly be a generally valid
>>>> course of action.
>>>
>>> Could you explain me better that? Do you want to get rid of this comment?
>>
>> Especially the second sentence is misleading. If new code used v2, it
>> would not work on Xen with v2 support turned off.
> 
> Can you suggest what to write here? I’m not very familiar with this xen
> Interface

I've sent a patch myself just a few seconds ago.

Jan

