Return-Path: <SRS0=Shbi=DH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C330C4727C
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2020 15:24:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AFEA2071E
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2020 15:24:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="kQ8BZVCh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8AFEA2071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.813.2751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNdxa-0007yl-1K; Wed, 30 Sep 2020 15:24:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813.2751; Wed, 30 Sep 2020 15:24:01 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNdxZ-0007ye-SX; Wed, 30 Sep 2020 15:24:01 +0000
Received: by outflank-mailman (input) for mailman id 813;
 Wed, 30 Sep 2020 15:24:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vfIn=DH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kNdxY-0007yZ-GK
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 15:24:00 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b163bcd2-143b-48a2-91cb-9cf00a62ea21;
 Wed, 30 Sep 2020 15:23:59 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B9F7CAB92;
 Wed, 30 Sep 2020 15:23:58 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=vfIn=DH=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kNdxY-0007yZ-GK
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 15:24:00 +0000
X-Inumbo-ID: b163bcd2-143b-48a2-91cb-9cf00a62ea21
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id b163bcd2-143b-48a2-91cb-9cf00a62ea21;
	Wed, 30 Sep 2020 15:23:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601479438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5rpRKs8RkrcnteWpf6i7rP1QXFINlYWyHZ78MF0D2Rc=;
	b=kQ8BZVChVg3lPxm33J0YRFv6MmsMQCRFoix1A5HLIv1U5FhXCAYBTDPtO6GDqyzAStY9AC
	pkrx4yvThwAsCe4/szohEzeTqc42JOJxVLrKzbeIdisYN8IMCPvMAGyB94W6y/0vMR1L9t
	+df90aQXf7FsPKWVrTeo5tOiaW+39m4=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B9F7CAB92;
	Wed, 30 Sep 2020 15:23:58 +0000 (UTC)
Subject: Re: [PATCH] tools/xenstore: set maximum number of grants needed
To: Wei Liu <wl@xen.org>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>
References: <20200924143648.27861-1-jgross@suse.com>
 <20200930151442.25qnwooqxqu4tm4o@liuwe-devbox-debian-v2>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <95c9ecc7-046b-b1d8-7778-7ca94a60b1e1@suse.com>
Date: Wed, 30 Sep 2020 17:23:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200930151442.25qnwooqxqu4tm4o@liuwe-devbox-debian-v2>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.09.20 17:14, Wei Liu wrote:
> On Thu, Sep 24, 2020 at 04:36:48PM +0200, Juergen Gross wrote:
>> When running as a stubdom Xenstore should set the maximum number of
>> grants needed via a call of xengnttab_set_max_grants(), as otherwise
>> the number of domains which can be supported will be 128 only (the
>> default number of grants supported by Mini-OS).
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> ---
>> This is a backport candidate IMO.
>> ---
>>   tools/xenstore/xenstored_domain.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
>> index 06359503f0..f740aa02f5 100644
>> --- a/tools/xenstore/xenstored_domain.c
>> +++ b/tools/xenstore/xenstored_domain.c
>> @@ -630,6 +630,8 @@ void domain_init(void)
>>   	*xgt_handle = xengnttab_open(NULL, 0);
>>   	if (*xgt_handle == NULL)
>>   		barf_perror("Failed to open connection to gnttab");
>> +	/* Allow max number of domains for mappings. */
>> +	xengnttab_set_max_grants(*xgt_handle, DOMID_FIRST_RESERVED);
> 
> Why DOMID_FIRST_RESERVED as the count argument? Is the expectation here
> xenstored maps one grant per domain?

Yes. This is the theoretical maximum.


Juergen

