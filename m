Return-Path: <SRS0=C5Y3=JN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E1BEC433ED
	for <xen-devel@archiver.kernel.org>; Fri, 16 Apr 2021 07:44:00 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1BD2610F7
	for <xen-devel@archiver.kernel.org>; Fri, 16 Apr 2021 07:43:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1BD2610F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.111595.213447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXJ8j-0008K1-SD; Fri, 16 Apr 2021 07:43:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111595.213447; Fri, 16 Apr 2021 07:43:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXJ8j-0008Ju-PF; Fri, 16 Apr 2021 07:43:45 +0000
Received: by outflank-mailman (input) for mailman id 111595;
 Fri, 16 Apr 2021 07:43:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vDum=JN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lXJ8i-0008JW-Bd
 for xen-devel@lists.xenproject.org; Fri, 16 Apr 2021 07:43:44 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e93b783f-5f54-4c01-b8b6-1244e27e2afc;
 Fri, 16 Apr 2021 07:43:43 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D20B9AEC6;
 Fri, 16 Apr 2021 07:43:42 +0000 (UTC)
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
X-Inumbo-ID: e93b783f-5f54-4c01-b8b6-1244e27e2afc
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618559022; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hbhUFvMxmVRl+ja1apV7tD9GarBYF9Mcgz2qXZWu/hQ=;
	b=CsDtoHMHqNay1eJXdemleFq889NkmJC6u+oBwg2xXoMd96KNgtuhz+EKygcqo1GIwsKWJ1
	ChW0stULj2UZQaeV8CyqK41QsewUY5v8DJe7ujQOcaMYXh5hGKZLaou/I0AOuUrARIqUyk
	8HK2jo4NtSce58hI0FuXLqOGies5Xpo=
Subject: Re: [PATCH 0/2] x86/shadow: shadow_get_page_from_l1e() adjustments
To: Tim Deegan <tim@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <e410c8e6-351d-bd98-7485-eb57268dc378@suse.com>
 <YHhliTZoR/UxpPn2@deinos.phlegethon.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c5078494-f492-5734-2c34-9410cdb2aed8@suse.com>
Date: Fri, 16 Apr 2021 09:43:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <YHhliTZoR/UxpPn2@deinos.phlegethon.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 15.04.2021 18:10, Tim Deegan wrote:
> At 13:46 +0200 on 12 Apr (1618235218), Jan Beulich wrote:
>> The aspect of the function the second patch here changes has been
>> puzzling me for many years. I finally thought I ought to make an
>> attempt at reducing this to just a single get_page_from_l1e()
>> invocation. The first patch mainly helps readability (of the code
>> in general as well as the second patch).
>>
>> Note that the first patch here takes "VMX: use a single, global APIC
>> access page" as a prereq; it could be re-based ahead of that one.
>>
>> 1: re-use variables in shadow_get_page_from_l1e()
>> 2: streamline shadow_get_page_from_l1e()
> 
> Acked-by: Tim Deegan <tim@xen.org>

Thanks. Any thoughts on the shadow part of the prereq patch mentioned
above?

Jan

