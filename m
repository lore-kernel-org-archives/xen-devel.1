Return-Path: <SRS0=/2oJ=GW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9509CC433E0
	for <xen-devel@archiver.kernel.org>; Tue, 19 Jan 2021 15:23:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4843523134
	for <xen-devel@archiver.kernel.org>; Tue, 19 Jan 2021 15:23:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4843523134
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.70514.126583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1sqn-0005lB-1n; Tue, 19 Jan 2021 15:23:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 70514.126583; Tue, 19 Jan 2021 15:23:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1sqm-0005l3-Ux; Tue, 19 Jan 2021 15:23:20 +0000
Received: by outflank-mailman (input) for mailman id 70514;
 Tue, 19 Jan 2021 15:23:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U8Ox=GW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l1sql-0005kg-PL
 for xen-devel@lists.xenproject.org; Tue, 19 Jan 2021 15:23:19 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bc5dc8b1-e56c-4ead-838c-fdc3358dc547;
 Tue, 19 Jan 2021 15:23:18 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D0AE5B28A;
 Tue, 19 Jan 2021 15:23:17 +0000 (UTC)
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
X-Inumbo-ID: bc5dc8b1-e56c-4ead-838c-fdc3358dc547
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611069797; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=01Lt0Kpnz73T941r2hiChhaTrHtArfRyEFTpPDpvP9w=;
	b=U4NSLhUG4fImZYFaS7DYpLfqHl8Vn75/U8pOA/FY5i1uIc8Madkoz7j2TNq+OihoAQtAHv
	s6cjTpykWMOYGcoQ+BKBfOmRIyjychaJ4V9MKYGFUJZiFqfFwklg6UKQBqXqbae0KtDPbx
	BFNtCQRSWuV5Qxn5EsVDusq/5N64hbE=
Subject: Re: [PATCH] xen/decompress: make helper symbols static
To: Ian Jackson <iwj@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <28f15465-bfcd-606b-eb24-42bfb990ae3d@suse.com>
 <24581.45760.653861.613333@mariner.uk.xensource.com>
 <9d77a189-de10-b4e2-c118-580121d797a9@suse.com>
 <24582.62356.361386.407920@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <88f6b446-21d0-ad94-c427-ebe0999b9358@suse.com>
Date: Tue, 19 Jan 2021 16:23:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <24582.62356.361386.407920@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 19.01.2021 15:58, Ian Jackson wrote:
> Jan Beulich writes ("Re: [PATCH] xen/decompress: make helper symbols static"):
>> On 18.01.2021 17:09, Ian Jackson wrote:
>>> AFAICT, this patch
>>>
>>> * was first posted after the last posting date for Xen 4.15.
>>> * is not a bugfix.
>>>
>>> In which case it has missed 4.15.
>>>
>>> Please correct me if you think I am wrong.
>>
>> You aren't, and I don't view this as a big problem - its more of
>> an aid to be sure no bad (unintended) references exist (Arm's
>> unhelpful re-use of xz's CRC32 function triggered the change).
> 
> Ah I see.  Thanks for that explanation.  Well, I might be inclined to
> grant a freeze exception on the basis that the point of this is to
> remove rather than add risk.
> 
> If you think that might be sensible, would you care to provide a frank
> assessment of the risks to 4.15 of taking this patch, vs. the risks to
> 4.15 of postponing it ?

Considering that we've been building fine without this adjustment,
I don't think the risk of not taking the patch is non-negligible.
The added safety is more for future work, to prevent anyone
mistakenly using any of the so far globally available symbols.
(There's actually more to do I think, in a separate patch, further
reducing exposure of the just introduced zstd decompressor
functions. I have this on my list of things to look into.)

Taking the patch has a minimal risk of breaking the build, in
case in some configuration a bad reference actually exists. I
can't see any other risk, as the actual code doesn't get changed
at all.

Jan

