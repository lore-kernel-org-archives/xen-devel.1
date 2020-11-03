Return-Path: <SRS0=JyiM=EJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43647C2D0A3
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2020 10:04:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE42921D91
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2020 10:04:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="bAgcDmMM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE42921D91
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.18146.42999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZtAh-0007Xu-75; Tue, 03 Nov 2020 10:04:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18146.42999; Tue, 03 Nov 2020 10:04:11 +0000
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
	id 1kZtAh-0007Xn-43; Tue, 03 Nov 2020 10:04:11 +0000
Received: by outflank-mailman (input) for mailman id 18146;
 Tue, 03 Nov 2020 10:04:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xm8A=EJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kZtAf-0007Xi-My
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 10:04:09 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 642a1675-042a-4447-a37c-ae9add388907;
 Tue, 03 Nov 2020 10:04:07 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5655FAC97;
 Tue,  3 Nov 2020 10:04:07 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xm8A=EJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kZtAf-0007Xi-My
	for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 10:04:09 +0000
X-Inumbo-ID: 642a1675-042a-4447-a37c-ae9add388907
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id 642a1675-042a-4447-a37c-ae9add388907;
	Tue, 03 Nov 2020 10:04:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604397847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b0xc2v+PYfbZu2imG7C1mJGgJmyzK+56mOxeutQXxpg=;
	b=bAgcDmMM2g+Emdg5ZIh9wDYEkNdpKnONdXxtT1/9Vgqlf+TEZ3/RvA6lK7edj7OuaZ4wkq
	r3qoN+BiVp7r4YkWR47/Hq/jNm1CIwrgn5HdZJOgYQB25rRKAmrsZfxc76KVq466neom5f
	rSnYazf1dW37cz1y84B4oB6N9NrjwaU=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 5655FAC97;
	Tue,  3 Nov 2020 10:04:07 +0000 (UTC)
Subject: Re: [PATCH v2 2/2] xen/rwlock: add check_lock() handling to rwlocks
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201102131239.14134-1-jgross@suse.com>
 <20201102131239.14134-3-jgross@suse.com>
 <fb3a1a5a-15ea-218f-a6d8-8e9d8d1bc2a7@suse.com>
 <890b6547-ca4f-b195-6b9d-9078ba35c357@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fe41300c-3013-73ae-7ffa-7cd36705d0c2@suse.com>
Date: Tue, 3 Nov 2020 11:04:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <890b6547-ca4f-b195-6b9d-9078ba35c357@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 03.11.2020 10:22, Jürgen Groß wrote:
> On 03.11.20 10:02, Jan Beulich wrote:
>> On 02.11.2020 14:12, Juergen Gross wrote:
>>> --- a/xen/include/xen/rwlock.h
>>> +++ b/xen/include/xen/rwlock.h
>>> @@ -56,6 +56,7 @@ static inline int _read_trylock(rwlock_t *lock)
>>>       u32 cnts;
>>>   
>>>       preempt_disable();
>>> +    check_lock(&lock->lock.debug, true);
>>>       cnts = atomic_read(&lock->cnts);
>>>       if ( likely(_can_read_lock(cnts)) )
>>>       {
>>
>> I'm sorry for being picky, but this still isn't matching
>> _spin_trylock(). Perhaps the difference is really benign, but
>> there the check sits ahead of preempt_disable(). (It has a
>> clear reason to be this way there, but without a clear reason
>> for things to be differently here, I think matching ordering
>> may help, at least to avoid questions.)
> 
> I think this is more an optimization opportunity: I'd rather move the
> preempt_disable() into the first if clause, as there is no need to
> disable preemption in case the first read of the lock already leads
> to failure acquiring the lock.
> 
> If you want I can prepend a patch doing that optimization.

I'd appreciate you doing so, yet I'd like to point out that
then the same question remains for _write_trylock(). Perhaps
a similar transformation is possible there, but it'll at
least be more code churn. Which of course isn't a reason not
to go this route there too.

This said - wouldn't what you suggest be wrong if we had
actual preemption in the hypervisor? Preemption hitting
between e.g. these two lines

    cnts = atomic_read(&lock->cnts);
    if ( likely(_can_read_lock(cnts)) )

would not yield the intended result, would it? (It wouldn't
affect correctness afaics, because the caller has to be
prepared anyway that the attempt fails, but the amount of
effectively false negatives would grow, as would the number
of cases where the slower path is taken for no reason.)

Question therefore is how much we care about keeping code
ready for "real" preemption, when we have ample other places
that would need changing first, before such could be enabled.

Jan

