Return-Path: <SRS0=rTFK=FF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 861F9C64E7A
	for <xen-devel@archiver.kernel.org>; Tue,  1 Dec 2020 09:13:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 037BD2224C
	for <xen-devel@archiver.kernel.org>; Tue,  1 Dec 2020 09:13:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="A1sDDzFJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 037BD2224C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.41784.75222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk1iW-0003nZ-Bz; Tue, 01 Dec 2020 09:13:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41784.75222; Tue, 01 Dec 2020 09:13:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk1iW-0003nS-8x; Tue, 01 Dec 2020 09:13:00 +0000
Received: by outflank-mailman (input) for mailman id 41784;
 Tue, 01 Dec 2020 09:12:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KrUB=FF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kk1iU-0003nN-HS
 for xen-devel@lists.xenproject.org; Tue, 01 Dec 2020 09:12:58 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3e3d97f0-72d4-4259-b98e-1ca2637a6a1b;
 Tue, 01 Dec 2020 09:12:57 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E4E8CAB7F;
 Tue,  1 Dec 2020 09:12:56 +0000 (UTC)
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
X-Inumbo-ID: 3e3d97f0-72d4-4259-b98e-1ca2637a6a1b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606813977; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E7Hs6rKppoF5jfW28heEQsAkU1uHWQukzKmDwMlkejA=;
	b=A1sDDzFJ/FaYBZBpxTvyoXNGxpg2NpLgnQcT2Tc/1/ubygQkoBkyRTb41YSSDJpst2cHVW
	Iqi7jgYEV5LwTGRWO/WuxjZwrGCTzrPdwP328Jly4ih5gjPCk1KUpXDt+575mYcY6CbkFe
	IkdXMIrJKyIrxOlYO+8o9c5FpGYyBZU=
Subject: Re: [PATCH v2 05/17] xen/cpupool: switch cpupool list to normal list
 interface
To: Juergen Gross <jgross@suse.com>
Cc: Dario Faggioli <dfaggioli@suse.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <20201201082128.15239-1-jgross@suse.com>
 <20201201082128.15239-6-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <54301d8c-2d69-3206-6c42-d2638b7e7aa3@suse.com>
Date: Tue, 1 Dec 2020 10:12:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201201082128.15239-6-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01.12.2020 09:21, Juergen Gross wrote:
> @@ -260,23 +257,42 @@ static struct cpupool *cpupool_create(
>  
>      spin_lock(&cpupool_lock);
>  
> -    for_each_cpupool(q)
> +    if ( poolid != CPUPOOLID_NONE )
>      {
> -        last = (*q)->cpupool_id;
> -        if ( (poolid != CPUPOOLID_NONE) && (last >= poolid) )
> -            break;
> +        q = __cpupool_find_by_id(poolid, false);
> +        if ( !q )
> +            list_add_tail(&c->list, &cpupool_list);
> +        else
> +        {
> +            list_add_tail(&c->list, &q->list);
> +            if ( q->cpupool_id == poolid )
> +            {
> +                *perr = -EEXIST;
> +                goto err;
> +            }

You bail _after_ having added the new entry to the list?

> +        }
> +
> +        c->cpupool_id = poolid;
>      }
> -    if ( *q != NULL )
> +    else
>      {
> -        if ( (*q)->cpupool_id == poolid )
> +        /* Cpupool 0 is created with specified id at boot and never removed. */
> +        ASSERT(!list_empty(&cpupool_list));
> +
> +        q = list_last_entry(&cpupool_list, struct cpupool, list);
> +        /* In case of wrap search for first free id. */
> +        if ( q->cpupool_id == CPUPOOLID_NONE - 1 )
>          {
> -            *perr = -EEXIST;
> -            goto err;
> +            list_for_each_entry(q, &cpupool_list, list)
> +                if ( q->cpupool_id + 1 != list_next_entry(q, list)->cpupool_id )
> +                    break;
>          }
> -        c->next = *q;
> +
> +        list_add(&c->list, &q->list);
> +
> +        c->cpupool_id = q->cpupool_id + 1;

What guarantees that you managed to find an unused ID, other
than at current CPU speeds it taking too long to create 4
billion pools? Since you're doing this under lock, wouldn't
it help anyway to have a global helper variable pointing at
the lowest pool followed by an unused ID?

Jan

