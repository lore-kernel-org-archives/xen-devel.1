Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80828CDB47F
	for <xen-devel@archiver.kernel.org>; Wed, 24 Jun 2026 08:50:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1344661.1603703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcJJW-00025x-7H; Wed, 24 Jun 2026 08:50:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344661.1603703; Wed, 24 Jun 2026 08:50:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcJJW-00025q-4O; Wed, 24 Jun 2026 08:50:30 +0000
Received: by outflank-mailman (input) for mailman id 1344661;
 Wed, 24 Jun 2026 08:50:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wcJJU-00025j-Gh
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 08:50:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcJJT-00H5MH-69
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 10:50:27 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3b9a4d-e002-0a2a0a5209dd-0a2a4503c0e0-36
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 10:50:27 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3b9a52-a3da-0a2a45030019-d155802dd0f4-3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 10:50:27 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4903d730b1fso8385665e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 01:50:27 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4924944fbbdsm395209215e9.12.2026.06.24.01.50.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 01:50:26 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782291026; x=1782895826; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jfe2qlxyE0D//khTY+X46zQ0GdXyLBbQ/2dax9QnHBA=;
        b=rTuXrntpNoE2K9e0t1WMw4kL+TrDxemxYaG5lSw4VHbuC0m1a/Jr6qntSKbQ26yz9Q
         yxNgI3puFU3vNhyhJgUxrMIoF65EsoKTkQ1afLeXo2EQVFl/L5kOQrqLudd0sI1chwD1
         Olm+3ntTGPckdTLJ+b7Va2eWJqLL7sxhNRM6PYoXcv84fu6vo1kDrvXLrNoK1/Tc2wZN
         1Li3oCH/EPU79CUlFyIKl7Ox4oEpE6nT/AuDjJXID4LAmRnMeIiHvGk9NgbcbbuvwHPZ
         qu+/D1TzGDzxwKX7Q2t29/VDciYcifrCn99plQe6l0evFTSj03/UT8Xz2oIaz1ig/cLP
         n9PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782291026; x=1782895826;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jfe2qlxyE0D//khTY+X46zQ0GdXyLBbQ/2dax9QnHBA=;
        b=LV0FkYnROnk7SpJJMmbeQhCbzdY8K9Xt+8dtMmmc15ArmaEqNd024KZCsL/cs8rX19
         mZjnj9tQTrQWBH1gUryRT/RpoN6FJqD0sUFmBKWbDsOa4Z6Cp13F+v+Z60Pq7VQjQe3R
         5W+tQhLqxKIBajMryetXoWeUhyOxkyLBbcGVV3bKBuNFpitxWZIhhhwgm12IR9O2lRdT
         fZUXip+80v9nAvlxG9dttFvMEcbuiMAz3rhmfAz8bFslsgGfXqv5DyG9y1Tc2+qzx/4/
         1SCg9DNhbtCM+OYb7K4NebM2tWZ/tupRnR0FPv88OcprrcRGsiuwJEoSv3laVO9XAX9L
         O7ng==
X-Forwarded-Encrypted: i=1; AFNElJ+lY/nqZonyhS5/AMrNH7YBfAaUSPq+LW8BRV2sKQLFr1iBfFcadTg6C5LWbydfbRpIoTMNA10VmeE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxDzBsChn+CmmoFKQRJBPidChmxpZPYWloQkpWAuCG2WGog71XP
	6EK8JMU1rZ1YLQGLa2KHzBvg9ZEjcoXHpyjO8ftVBEdhKcD0Mnjx0ub9
X-Gm-Gg: AfdE7cmIJ9nHDkkdOZErUv2JIHB3TDJ7hQRxX2v/0ImkfoBmR4LEhoW9JxVYO7s1TPP
	Lm2t9JrBhYi8hReB7FgbSbI1ID9I8ncHF10QREA7p48pC7aKOo2bsRFz/5vCJiDEoOawEMvCvkN
	tE1aQIHW91Pr1uw+b+7hkFLT6ToFCgw2kyYiu1V8pM6TCU4ufbfa5ImVk9E0NJqHXHoUPtW8Yz6
	SfXINA5BVxyzGohniBib34qmoabq7UUNDswuO9HeH1QoqIDmuFLKpCwNbWLpbPc1lHZ5bfapIE6
	FNzqtUYtQgXN4FbAtOGsJ5CuK2tgmMyzgkm76O8bu/rse6AZX/YXTXCKytvs/jHHkfeShyhhRM2
	03/QnSPRQ0+Ezva1CYox34naEColRCuEcuH8KQhoznFKhPWA/sIuT+b2Zi2Ubz8qkqd6zxW0rl4
	ZZsuxOl/BlYWefA+FrzuA3qlibam46ZjqtCn2Gn9r/03VzPnbE1TcCRxU8alHcO4kVTVo0QJ3nO
	dGgZg==
X-Received: by 2002:a05:600c:4e51:b0:490:e60b:6860 with SMTP id 5b1f17b1804b1-4926084aaabmr30277485e9.7.1782291026321;
        Wed, 24 Jun 2026 01:50:26 -0700 (PDT)
Message-ID: <f41b600c-04a3-4ff8-adfd-f101c18f853b@gmail.com>
Date: Wed, 24 Jun 2026 10:50:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] xen: introduce CONFIG_HAS_SHARED_INFO for archs
 without a shared page
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1780494838.git.oleksii.kurochko@gmail.com>
 <7ed7b888e203b7cc6c3a3a82b3bcc89d90b3fb48.1780494838.git.oleksii.kurochko@gmail.com>
 <d63a3877-286a-43fe-97fa-301985c3a0ac@suse.com>
 <5ca82079-4f94-4f2c-87ea-0ba54236ff72@gmail.com>
 <f561a2ad-83aa-4692-9e96-148e688c806b@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <f561a2ad-83aa-4692-9e96-148e688c806b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1782291027-641F5D84-4373F23D/10/73395122804
X-purgate-type: spam
X-purgate-size: 3879



On 6/17/26 4:24 PM, Jan Beulich wrote:
> On 17.06.2026 16:02, Oleksii Kurochko wrote:
>> On 6/17/26 3:26 PM, Jan Beulich wrote:
>>> On 03.06.2026 16:25, Oleksii Kurochko wrote:
>>>> --- a/xen/common/domain.c
>>>> +++ b/xen/common/domain.c
>>>> @@ -320,9 +320,9 @@ void vcpu_info_reset(struct vcpu *v)
>>>>        struct domain *d = v->domain;
>>>>    
>>>>        v->vcpu_info_area.map =
>>>> -        ((v->vcpu_id < XEN_LEGACY_MAX_VCPUS)
>>>> -         ? (vcpu_info_t *)&shared_info(d, vcpu_info[v->vcpu_id])
>>>> -         : &dummy_vcpu_info);
>>>> +        IS_ENABLED(CONFIG_HAS_SHARED_INFO) && v->vcpu_id < XEN_LEGACY_MAX_VCPUS
>>>> +        ? (vcpu_info_t *)&shared_info(d, vcpu_info[v->vcpu_id])
>>>> +        : &dummy_vcpu_info;
>>>>    }
>>>
>>> While the change here is likely okay, it points at possible further omissions.
>>> You've dealt with all uses of shared_info(), but you've left alone all uses of
>>> vcpu_info() (and __vcpu_info()). Reads are presumably okay, but writes to
>>> dummy_vcpu_info open a side channel for possible info leaks. Looking over uses
>>> in common code, no code changes may be needed; extending the description may
>>> be all that's wanted here.
>>
>> Isn't there already a side channel that could allow leaks, even without
>> this change?
> 
> There are multiple aspects here. First, for PV secondary vCPU-s cannot be
> launched when their vcpu-info still points at dummy_vcpu_info. HVM vCPU-s
> make very limited use of vcpu-info fields. Writes look to be limited to
> the evtchn_upcall_{mask,pending} fields, which isn't really an info leak.
> 
> My main point here is: None of this goes without making clear that the
> necessary auditing was properly done.
> 
>> The change here just made it worsen because now info leak
>> will happen for all vCPUs when  CONFIG_HAS_SHARED_INFO=n.
>>
>> I will add to the description the following:
>> ```
>> With CONFIG_HAS_SHARED_INFO=n all vCPUs fall back to the global
>> dummy_vcpu_info, so writes through vcpu_info() could leak data between
>> vCPUs.  Reviewing the write paths in common code: the write in
>> map_guest_area() stores the constant ~0 so nothing serious will happen
>> if it will be leaked; the event_2l.c paths are unreachable because the
>> preceding shared_info() call would trap first; the write in
>> vcpu_info_populate() targets the new mapping buffer, not
>> dummy_vcpu_info; all remaining writes are x86 PV-specific for which
>> CONFIG_HAS_SHARED_INFO=y.  No code changes are needed.
>> ```
> 
> As you start with "common code", how come the "x86 PV-specific" part is
> still there (i.e. relevant)? Isn't all PV stuff in x86-specific code?

Good point. The "x86 PV-specific" part is not part of the review of 
common code. I mentioned it separately to complete the audit of all 
write paths reachable through vcpu_info(). The intent was:

* the writes discussed before the semicolon are the common-code paths;
* the writes after the semicolon are outside common code and are x86 
PV-specific, where CONFIG_HAS_SHARED_INFO=y anyway.

To avoid the ambiguity, I can reword the sentence to make that 
separation explicit:
```
With CONFIG_HAS_SHARED_INFO=n all vCPUs fall back to the global
dummy_vcpu_info, so writes through vcpu_info() could leak data between
vCPUs. Reviewing the write paths in common code: the write in
map_guest_area() stores the constant ~0 so nothing serious would happen
if it were leaked; the event_2l.c paths are unreachable because the
preceding shared_info() call would trap first; the write in
vcpu_info_populate() targets the new mapping buffer, not
dummy_vcpu_info.

Outside common code, the remaining writes are x86 PV-specific, for which
CONFIG_HAS_SHARED_INFO=y. No code changes are needed.
```

Would that wording work for you?

Thanks.

~ Oleksii


