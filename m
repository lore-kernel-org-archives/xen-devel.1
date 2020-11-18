Return-Path: <SRS0=TkWG=EY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 935F2C63697
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2020 08:23:43 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A12F221F1
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2020 08:23:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="FQOWAjvo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A12F221F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.29402.58763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfIjv-0004E9-Tl; Wed, 18 Nov 2020 08:22:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29402.58763; Wed, 18 Nov 2020 08:22:55 +0000
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
	id 1kfIjv-0004E2-Qj; Wed, 18 Nov 2020 08:22:55 +0000
Received: by outflank-mailman (input) for mailman id 29402;
 Wed, 18 Nov 2020 08:22:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=763w=EY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kfIju-0004Dx-Oq
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 08:22:54 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1ac2549a-b2b4-4cb7-b5e9-f314a49687a5;
 Wed, 18 Nov 2020 08:22:53 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E4C6EAD0B;
 Wed, 18 Nov 2020 08:22:52 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=763w=EY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kfIju-0004Dx-Oq
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 08:22:54 +0000
X-Inumbo-ID: 1ac2549a-b2b4-4cb7-b5e9-f314a49687a5
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 1ac2549a-b2b4-4cb7-b5e9-f314a49687a5;
	Wed, 18 Nov 2020 08:22:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605687773; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xkeVCKf9SSikvb345dSGfK17HF+2zTH1z30Ye44BN/0=;
	b=FQOWAjvolwWMmglmULAN21aN2qVgyRa2NiogiVBZxi65Iqq5Jvb0yhHqUnsNqhpIxEH+5J
	i0vN5sqgNZ1i3hc7JuXCFAFLkbYFoaLrGAUS9wB+3Of5Pb4NYDbVBfpiP7QQXQGUxZT0Yu
	RmeXvao7ORBesgMtsft2Twj7y6M3BBY=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id E4C6EAD0B;
	Wed, 18 Nov 2020 08:22:52 +0000 (UTC)
Subject: Re: [PATCH v6 0/3] XSA-343 followup patches
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "committers@xenproject.org" <committers@xenproject.org>,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
References: <20201109163826.13035-1-jgross@suse.com>
 <aaa3c26f-4bfa-d881-8e72-112e3108f4b5@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1b54d0bb-deab-f4bd-b773-67a716a1fde1@suse.com>
Date: Wed, 18 Nov 2020 09:22:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <aaa3c26f-4bfa-d881-8e72-112e3108f4b5@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 17.11.2020 19:13, Julien Grall wrote:
> On 09/11/2020 16:38, Juergen Gross wrote:
>> Juergen Gross (3):
>>    xen/events: access last_priority and last_vcpu_id together
>>    xen/evtchn: rework per event channel lock
>>    xen/evtchn: revert 52e1fc47abc3a0123
> 
> While looking at the list of commits, I noticed that the first patch 
> hasn't been committed. They were all acked/reviewed, so I am a bit 
> puzzled why this was omitted...
> 
> I have nearly missed as I was expecting the 3 patches to be committed 
> together. May I suggest that in the future we reply to the cover letter 
> and mention which patches are (or not) committed?
> 
> Regarding patch #1, I will commit it tomorrow unless there are strong 
> objections against.

Without a clear outline of what would break with the present logic,
I had previously indicated I'm not convinced of the change. This
isn't a strong objection, no, but I still wouldn't want to see my
name associated with it in such a case. Furthermore I clearly view
this as not a backporting candidate, while the other two are (as I
did previously indicate). Hence the latter two patches wanted
re-basing ahead of the first one anyway, to ease the backports.

While I will accept there are different views possible here, I also
don't think sending mail in such a case is a good use of resources.
The information what was or was not committed is readily available.
Personally I view such mails as at least very close to spam.

Irrespective of the above I'm sorry for any inconvenience caused.

Jan

