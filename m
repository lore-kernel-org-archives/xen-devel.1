Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99EE0C5DF81
	for <xen-devel@archiver.kernel.org>; Thu, 20 Aug 2026 07:58:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1396031.1634119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwxfd-0001qD-6c; Thu, 20 Aug 2026 07:58:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1396031.1634119; Thu, 20 Aug 2026 07:58:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwxfd-0001q6-3k; Thu, 20 Aug 2026 07:58:41 +0000
Received: by outflank-mailman (input) for mailman id 1396031;
 Thu, 20 Aug 2026 07:58:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwxfc-0001q0-7D
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 07:58:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwxfb-00396n-KA
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 09:58:39 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a86b3a9-bab6-0a2a0a5309dd-0a2a45048950-18
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 09:58:39 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a86b3af-b57f-0a2a45040019-d155802ef19c-3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 09:58:39 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-49800c6a846so21201275e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 00:58:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499b20bb2b4sm27973115e9.0.2026.08.20.00.58.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Aug 2026 00:58:38 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787212719; x=1787817519; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DvxJIX5REEgAjoaQUfIh/9VLwd5fuvQExru6eU7BFJo=;
        b=RjSywlCr5xySh1ET36iXt+toyJRHTuSFcH5c25tgWB6/DcLyuXhVaFrq7rLXqWGZks
         SwwvVOcIEXa1Sn+T1wfuIgHD/KXHUe2rbR/jYsKMGeunGVQbNe6yz8MV32mwdgYBxYcC
         VFGKunHGlscOawYHQPPHYvxqRxgCW0GshDhSMn+lha7K+Fb01PnLmKUpYLvsjhhcgT6I
         Hb+z4hMtAYgO69bst2hAbFA81K778cRZ+yTQve96ZiJ6blhO85qElMR7JW+M/ofWmJYM
         CxcXR8hPBkh+gB7deM4GPIQswL0YqnuUjvYnmuNddHls3vqsK+SSN5gGVxlkWTLGr3Xr
         jXYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787212719; x=1787817519;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DvxJIX5REEgAjoaQUfIh/9VLwd5fuvQExru6eU7BFJo=;
        b=T2EqH7cGg6sdZYsfXsc7f7HUGEyVhCJ29bw12x48T93ORrO3si3CF4aCA7M3FODZL0
         UQVBNik8Aq9JdVbv2A9Obc4vUay8Tyz7DgySRe/BDNP+WE4gyGAiXVpXky1sLhjrgqcq
         px2W/7tD+4SSIYIMMB6iI8z3TBBIGbd9Jrk6Zvxk/zWHokjYendRbwUxYTd4MBh/5Rb5
         zVTO2McNGMCIQCND9hgyvs7wwMO+NvYaaP07Fln1JwN9Kwe5eNd4VYN3rRNYZzg40RHT
         MJ6Q6zBwytCVdkz/0J6xNk/Nr54esKwlZ4WYmgJQ3uiv9HLjyOst5yUOw8xLFwRCKV7j
         ZN3Q==
X-Forwarded-Encrypted: i=1; AHgh+Rrg41FvezCVbHgjU+oZlRWBtL2fK7cmCxWpqp5sGwrymlnafb1wOG1z+Snj5Set9AHVHVginbRiryQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw7b64eTl3PbkwZa3tWxoLvRfNcDn8PnQVS09iMgpgPpQe+Udhx
	QltCSjOcRO0UNyVJ87gb7snbgRuwNYXdXDs1CJ0PkUvZjSeGfzPkvVQyk+ps9d2Veg==
X-Gm-Gg: AR+sD131jOtp/AQjmCZ7jIrjDJKY272Vm/7VyqubwyzZQS/16uc5+LJXrDrt8Nf6QZh
	YJ56v0nTujl2HzZwdg6upbJimuzGP4fTa3jHlwjOGR4KuP5WGoCv1TS2BiSL4p0KOG89BpN+txK
	bsVuFS+MDSd6On2b4xZ/GE+Z8wZEmV8k8TpKCkDYQUulTpaJBo4AlbXLGtS/269P6JNHF9GWr3I
	U/nzgpAic8jClY33h9gVQUTuNulMyaFAzE0TjQfHjSIOvOvCneI1DkHXuZFAouXX1b1O5Ki0z37
	WBiXziABRHkb8V7jwerXHzVgkkLoQPYGP5y7Eo+xRzWqkPrHu0tn2pVyXu1NfDjaJjlET+sJ6Th
	1PaDe2DQSmj/V41DOqV2y1WeZaY+PpNtZRVSuJRnYXMC3vvQLp3ouk3p2vg8uXRijPeJ9a0Xmcb
	rd8UpisnA2YsP2y4UMxDHElSTwMeLBVLOz+wphdVsIWv0XUBmjVhN1sOrAhOIOljOsX7PrqjHcI
	NsXi1kaYexARhRavksfb2q1Lun/GgYqOF+eC2YGaRhXUNFCraCw
X-Received: by 2002:a05:600c:468c:b0:499:48bb:417e with SMTP id 5b1f17b1804b1-499aa14a72dmr160304885e9.2.1787212718889;
        Thu, 20 Aug 2026 00:58:38 -0700 (PDT)
Message-ID: <b05a3553-398d-4ed0-bbf1-6e93cf385fe2@suse.com>
Date: Thu, 20 Aug 2026 09:58:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tools/hvmloader: implement Intel IGD extended VBT
 support
To: Chuck Zmudzinski <brchuckz@aol.com>
Cc: qemu-devel@nongnu.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, Tomita Moeko <tomitamoeko@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <20260802050824.10554-1-brchuckz.ref@aol.com>
 <67579eba-e222-41dd-84bf-8440d2eaf2a9@netscape.net>
 <da2200cd-def7-4cce-a6c2-9f9ac9e202ce@suse.com>
 <de56c8bd-f0e8-4fe9-8cf5-f6807698176c@aol.com>
 <02a7dc18-4184-4e86-84cb-121769187f71@suse.com>
 <1858e8e6-73fa-4017-93e2-c733fbf0ec8d@aol.com>
 <d6e603bf-8dc5-4ac7-842f-ff9d1f67b98f@suse.com>
 <fdec0b6b-eddf-4a36-a755-c67963daa9ea@aol.com>
 <6ecf80ef-2f0e-44fb-beab-dbcf065a4431@suse.com>
 <bb44067c-6739-4e83-a0fd-cc7ea797048f@aol.com>
 <4c58bda6-e9ed-438d-b96e-feda74a6c4c7@suse.com>
 <31a5870f-2a4d-4dc0-af9c-f0567e0f6fb3@aol.com>
 <db8fd04d-bbc7-41c7-8473-b821d7f77d5f@aol.com>
 <302ed12f-40ca-405c-80ca-ac4f2785d754@suse.com>
 <cdae1785-4d9a-4aab-929e-de55c26b7b94@aol.com>
 <10cd9f6b-678b-407b-a51e-70e9ed7a35fd@aol.com>
 <131b1252-b108-4b4c-8457-673ff0d20d5e@suse.com>
 <682975cc-4857-42b2-badf-b638869f3268@aol.com>
 <7ab98288-0c5e-472d-87dd-5586e60027bb@aol.com>
 <f0ffe015-1bc5-4091-8dbe-2b4eee9cec2d@aol.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <f0ffe015-1bc5-4091-8dbe-2b4eee9cec2d@aol.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1787212719-C1AD0B50-22B320E3/0/0
X-purgate-type: clean
X-purgate-size: 5133

On 19.08.2026 21:09, Chuck Zmudzinski wrote:
> On 8/19/2026 1:49 PM, Chuck Zmudzinski wrote:
>> On 8/19/2026 11:47 AM, Chuck Zmudzinski wrote:
>>> On 8/19/2026 9:51 AM, Jan Beulich wrote:
>>>> On 19.08.2026 14:36, Chuck Zmudzinski wrote:
>>>>> On 8/19/2026 8:16 AM, Chuck Zmudzinski wrote:
>>>>>> Yes, I agree that v3 of the patch to hvmloader should presume that the DM can get
>>>>>> a copy of the OpRegion and read its contents so most of this can be done in the
>>>>>> DM instead of in hvmloader. So from hvmloader's perspective, the patch will be more
>>>>>> about avoiding the layering violation than anything else.
>>>>>
>>>>> However, there is one advantage, from the viewpoint of the Xen virtualization platform
>>>>> as a whole, to do the patching of the OpRegion in hvmloader instead of in the DM.
>>>>>
>>>>> If we patch the OpRegion in hvmloader as v2 of this patch does, we provide a common
>>>>> solution for extended VBT support for Intel IGD devices that would be compatible with
>>>>> all DM implementations, not just with Qemu. So why not do the patching of the OpRegion
>>>>> in hvmloader?
>>>>
>>>> As indicated before: If the OpRegion holds data that is needed to drive the
>>>> device, and if the OpRegion is exposed writable to guests, then guest can
>>>> screw up that data such that subsequent guests won't work anymore. Hence
>>>> exposing to guests (which includes hvmloader) needs to be stopped, or at
>>>> least be limited to r/o. That, in fact, includes exposing to any privilege-
>>>> restricted DM as well.
>>>>
>>>> Exposing r/o may be entirely okay (i.e. may not be a layering violation),
>>>> depending how exactly an OpRegion surfaces for a device (on the host). Aiui
>>>> it's not addressed by any of the BARs, yet it looks like it needs similar
>>>> treatment. Earlier on we also talked about the region not necessarily being
>>>> page-aligned. That poses, even with r/o exposure, the question of other
>>>> data on the same (leading / trailing) pages. This may imply that the
>>>> copying needs to be done strictly in Dom0, for both DM and guest to only
>>>> ever act on copies (which may then as well be r/w).
>>>
>>> Yes, I am thinking the DM should make a copy host OpRegion and never expose
>>> the host OpRegion to the guest but only a copy of it.
>>>
>>> The reason we need a patch like this is that with the introduction of the
>>> rvda/rvds fields into the OpRegion, the OpRegion is not always position-independent
>>> so its contents might be unsuitable in the guest address space, so in those cases
>>> we need to patch the copy of the OpRegion that will be exposed to the guest.
>>> If there is an extended VBT the DM will also get a copy of it, make a copy of
>>> it, and expose it to the guest by appending it contiguous with the OpRegion.
>>> Since in this scenario we are assuming the DM knows the contents of the OpRegion,
>>> then it can find the host VBT and make a copy of it without needing hvmloader
>>> to send the rvda and rvds values to it.
>>>
>>> Then, the remaining question is which component (DM or hvmloader) will patch it
>>> if it needs to be patched to make the guest's copy of it compatible with the guest
>>> address space.
>>
>> As I noted earlier, it think it would be advantageous for the Xen platform as whole
>> for the patching to be done in hvmloader. That way, support for extended VBT is
>> automatically added for all implementations of the DM, not just for Qemu. But the
>> downside is that for hvmloader to do the patching, it needs to know the host OpRegion
>> address, which one could argue it should not need to know. This is the only reason I
>> can think of to do the patching of the OpRegion in the DM instead of in hvmloader: to
>> avoid disclosing the host OpRegion address to the guest.
> 
> Correction: Actually, with this new scenario, we need not disclose any confidential
> host addresses to hvmloader if the DM removes such information from the copy of
> the OpRegion that it exposes to hvmloader. Then, all hvmloader needs to know to
> ensure the OpRegion is compatible with the guest's address space is the guest
> address of the OpRegion. It need not know either the host OpRegion address or the
> host VBT address.
> 
> So the guidance I need from you to do v3 of the patch is simply to answer these
> two questions.
> 
> 1. Should I write v3 of the patch not only assuming the DM will never expose the
> host OpRegion to hvmloader, but also assuming that the DM is responsible for
> patching the OpRegion to ensure it is compatible with guest address space?
> 
> Or
> 
> 2. Should I write v3 of the patch assuming that hvmloader is responsible for
> patching the OpRegion so it is compatible with the guest address space?

My tentative response is to use option 1, not the least because a mid to long term
plan is to see about removing hvmloader altogether. However, a more firm response
here depends on an answer to the question raised in
<92022f85-9a53-4db8-b489-fc91c86b413c@suse.com> (sorry, the list archive hasn't
caught up yet).

Jan

