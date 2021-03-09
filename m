Return-Path: <SRS0=FTcr=IH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D708C433DB
	for <xen-devel@archiver.kernel.org>; Tue,  9 Mar 2021 14:26:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12B2B6520F
	for <xen-devel@archiver.kernel.org>; Tue,  9 Mar 2021 14:26:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12B2B6520F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.95489.180292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJdJM-00010a-At; Tue, 09 Mar 2021 14:26:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95489.180292; Tue, 09 Mar 2021 14:26:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJdJM-00010T-7r; Tue, 09 Mar 2021 14:26:12 +0000
Received: by outflank-mailman (input) for mailman id 95489;
 Tue, 09 Mar 2021 14:26:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Bv84=IH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lJdJK-00010O-HB
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 14:26:10 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 23d1705d-e7f6-443c-99dd-88014623a5bd;
 Tue, 09 Mar 2021 14:26:09 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id ABD65AC17;
 Tue,  9 Mar 2021 14:26:08 +0000 (UTC)
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
X-Inumbo-ID: 23d1705d-e7f6-443c-99dd-88014623a5bd
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615299968; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=56p7MiJSbaJf5fIy8fOA/tm5Y3KDcQA+btAd5tWgcMc=;
	b=obpEupJ3M2EAeCS6ZjOfKJy3BNwgsdbONJe48QZKzdeabIpTa1klPsDVa6oGU6JOWUvaMZ
	xHbZMDToMt0Gz7B3+cN1KNAxqQJVQhEUnZk+U/+5MRwvOKPM/Z4TTu2gdzPkUl3IYUn0zI
	XYCDI2t8n9uWlcfg1z+Mnh2IT01Iako=
Subject: Re: [PATCH v3 for-4.15] x86/msr: introduce an option for compatible
 MSR behavior selection
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org
References: <20210309105634.7200-1-roger.pau@citrix.com>
 <37e82170-8097-1eda-95d9-23d235075a67@suse.com>
 <YEd98T104rrsmn2S@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <feebc3bc-ae1b-5cf3-8482-422997d810fc@suse.com>
Date: Tue, 9 Mar 2021 15:26:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YEd98T104rrsmn2S@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 09.03.2021 14:53, Roger Pau Monné wrote:
> On Tue, Mar 09, 2021 at 12:36:39PM +0100, Jan Beulich wrote:
>> On 09.03.2021 11:56, Roger Pau Monne wrote:
>>> Changes since v2:
>>>  - Apply the option to both HVM and PV guest.
>>>  - Handle both reads and writes.
>>
>> I take it that it's intentional that you didn't allow separate read
>> and write control?
> 
> Yes, I don't have a strong opinion, but I think just having a single
> option is better: guests requiring the read side bodge are also likely
> to require the same adjustment on the write side.

I'm not convinced of this - there are many MSRs which merely
need reading to discover a certain piece of (configuration)
information. Note in e.g. how the problem I did run into was
affecting RDMSR only.

> It's also better
> from a user perspective, as it's likely people would enable them in
> tandem anyway.

This part I agree with; in fact I did mention this earlier on.

>>> --- a/xen/arch/x86/pv/emul-priv-op.c
>>> +++ b/xen/arch/x86/pv/emul-priv-op.c
>>> @@ -875,6 +875,7 @@ static int read_msr(unsigned int reg, uint64_t *val,
>>>      const struct domain *currd = curr->domain;
>>>      const struct cpuid_policy *cp = currd->arch.cpuid;
>>>      bool vpmu_msr = false;
>>> +    uint64_t tmp;
>>>      int ret;
>>>  
>>>      if ( (ret = guest_rdmsr(curr, reg, val)) != X86EMUL_UNHANDLEABLE )
>>> @@ -986,6 +987,12 @@ static int read_msr(unsigned int reg, uint64_t *val,
>>>          }
>>>          /* fall through */
>>>      default:
>>> +        if ( currd->arch.msr_relaxed && !rdmsr_safe(reg, tmp) )
>>> +        {
>>> +            *val = 0;
>>> +            return X86EMUL_OKAY;
>>> +        }
>>> +
>>>          gdprintk(XENLOG_WARNING, "RDMSR 0x%08x unimplemented\n", reg);
>>>          break;
>>>  
>>> @@ -1148,6 +1155,9 @@ static int write_msr(unsigned int reg, uint64_t val,
>>>          }
>>>          /* fall through */
>>>      default:
>>> +        if ( currd->arch.msr_relaxed && !rdmsr_safe(reg, val) )
>>> +            return X86EMUL_OKAY;
>>> +
>>>          gdprintk(XENLOG_WARNING,
>>>                   "WRMSR 0x%08x val 0x%016"PRIx64" unimplemented\n",
>>>                   reg, val);
>>
>> So what are your thoughts wrt my change to this file? Drop it
>> altogether and require people to use this new option? Or do you
>> see both coexist?
> 
> I wouldn't be opposed to have both changes co-exist, as long as the PV
> one is made part of the PV ABI, that is have it properly described in
> the public headers as part of the PV behavior. I've replied with some
> details along those lines in your patch.
> 
>> In the latter case, since you had suggested
>> that I drop the write side of my change - does your changing of
>> the write path indicate you've changed your mind?
> 
> Yes, I think we need to provide an option to allow users to revert
> back to an MSR behavior as close as possible to the previous one for
> compatibility reasons, and that should include the write side even if
> we don't know any users requiring it right now.
> 
> We would be in a bad position if that use-case gets discovered after
> the release, so it's IMO best to provide an option that covers both
> read and write side straight away.

Well, for your change it's indeed "an option". For my change it's
not optional behavior (and we also don't mean it to be). Hence I'm
not sure what I should read out of your reply.

Jan

