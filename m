Return-Path: <SRS0=uqgo=JD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18884C433B4
	for <xen-devel@archiver.kernel.org>; Tue,  6 Apr 2021 08:19:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5BF9613C0
	for <xen-devel@archiver.kernel.org>; Tue,  6 Apr 2021 08:19:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5BF9613C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.105691.202142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTgva-0004og-7o; Tue, 06 Apr 2021 08:19:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105691.202142; Tue, 06 Apr 2021 08:19:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTgva-0004oZ-4e; Tue, 06 Apr 2021 08:19:14 +0000
Received: by outflank-mailman (input) for mailman id 105691;
 Tue, 06 Apr 2021 08:19:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vt1H=JD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lTgvZ-0004oU-AQ
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 08:19:13 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3ff048b1-9b51-45e9-b074-3db47ea43af8;
 Tue, 06 Apr 2021 08:19:12 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7178FB0B7;
 Tue,  6 Apr 2021 08:19:11 +0000 (UTC)
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
X-Inumbo-ID: 3ff048b1-9b51-45e9-b074-3db47ea43af8
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617697151; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O1MsyF6f/jXjbaMOsUf7g78jDGOjiDV17R4ULgvuVgo=;
	b=qqSlZHT3ojYZSOToLD/KiNxLV0dEkyVaJfnl7/76QrrjPgDj3UgNVo/z/6MWv/Ytas6f46
	mZfqkoQMxGQzv/RBklgw+6XU8jX6KQndTGCrjqL7VTlD2k1TWMRqwNfihF9NO7ACbZuxx4
	+0rSe/zoB/QhTCWL9C2QxQYVlN/HBv4=
Subject: Re: multiboot2 and module2 boot issues via GRUB2
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Roman Shaposhnik <roman@zededa.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, grub-devel@gnu.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <CAMmSBy8Wpwgj3V0U8OhsZCgyAxOjTeHDMt-Vw+om1koopmxTsg@mail.gmail.com>
 <23baec07-a3ae-949a-a1fb-09100efd53e5@citrix.com>
 <CAMmSBy96=FwR0zZy199e0YhFefgZj_PFOMiaB2nKjqdQvKufow@mail.gmail.com>
 <b5ed3a53-5152-aba1-820d-ccab72a82c61@suse.com>
 <YGWH89ubVe104Tnl@Air-de-Roger>
 <a8c7fb60-7a95-1a99-4005-b04bcac4c2be@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f800ac60-7d49-fa08-ca8d-1c75408dd2de@suse.com>
Date: Tue, 6 Apr 2021 10:19:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <a8c7fb60-7a95-1a99-4005-b04bcac4c2be@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 01.04.2021 21:43, Andrew Cooper wrote:
> On 01/04/2021 09:44, Roger Pau Monné wrote:
>> On Thu, Apr 01, 2021 at 09:31:07AM +0200, Jan Beulich wrote:
>>> On 01.04.2021 03:06, Roman Shaposhnik wrote:
>>>> And the obvious next question: is my EVE usecase esoteric enough that
>>>> I should just go ahead and do a custom GRUB patch or is there a more
>>>> general interest in this?
>>> Not sure if it ought to be a grub patch - the issue could as well
>>> be dealt with in Xen, by concatenating modules to form a monolithic
>>> initrd.
>> I would rather have it done in the loader than Xen, mostly because
>> it's a Linux boot specific format, and hence I don't think Xen should
>> have any knowledge about it.
>>
>> If it turns out to be impossible to implement on the loader side we
>> should consider doing it in Xen, but that's not my first option.
> 
> Concatenating random things which may or may not be initrds is
> absolutely not something Xen should do.  We don't have enough context to
> do it safely/sensibly.

Well, I wasn't suggesting anywhere to concatenate random things.
Instead I was envisioning a command line option giving us the
context we need (e.g. "initrd=3+5").

Jan

