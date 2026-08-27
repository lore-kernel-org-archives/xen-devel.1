Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2429AC61DB9
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 16:12:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401254.1637015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzciH-0008QN-00; Thu, 27 Aug 2026 16:12:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401254.1637015; Thu, 27 Aug 2026 16:12:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzciG-0008QG-Tf; Thu, 27 Aug 2026 16:12:24 +0000
Received: by outflank-mailman (input) for mailman id 1401254;
 Thu, 27 Aug 2026 16:12:22 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzciE-0008QA-R2
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 16:12:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzciD-00FoiI-Kl
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 18:12:21 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a9061da-8faa-0a2a0a5109dd-0a2a4508e412-14
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 18:12:21 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a9061e5-f659-0a2a45080019-d155dd2ea8c2-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 18:12:21 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-47db714766aso894385f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 09:12:21 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482e27a9f0esm10798172f8f.10.2026.08.27.09.12.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2026 09:12:20 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787847141; x=1788451941; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mh8+DjiPJ8UjXmQzaIp8K5Yjet64NmMupumjqZqHfow=;
        b=Ofr0W7KMgetaMvohdj5fqj9ci9x3YYleBg0RGTW1ITsJkOv6mZrXCxBgJQifovWlci
         CnzSKE1FBCHDvv6HT8oU0pQAIh+aw1zJnmdNFpZrXuaE50+BsCb452wDSQIvvC/HAJhM
         NVBxCP/ZGkIP6sm4q7LmVHoaueqd2eG3ygc6ruijPZKI38YTu6J2xu2o1BzdwHrL1Gqa
         PAlkUO1vU6PRV1dtSQdOKIBwRrVui+/nxr2IeR8MhMxGF90Ei4wmSEgsbp3Tvz9hZRL/
         d+F3wBYpfKKnRbV7tsOSiL+zN9uR/CbFybd8AW9DWxvmC6c6g1qJjoH0+zwk4WkF8Vx0
         0Vvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787847141; x=1788451941;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mh8+DjiPJ8UjXmQzaIp8K5Yjet64NmMupumjqZqHfow=;
        b=MQclOgosuIQoBpV83AvWpKz2KDuVLT1J9b+0MdPy5xbzzmYG+tY8z634BGlAQ2pVsL
         7RayMoP73pde97qyvUGHzH6f0VrzPnaBqPI7r6KoO3J+w1JawNn22z60p6ldFst71bq7
         d0joofeUXqHWm7tR08JnUclNQ02ZNzGiYk1kZR7wfZNSnCZSUzVn0Xdl3HlJ1U82lCtd
         S6/yGlhCjSLtM4GOhJifZqd0aPKtbPAUGr/v8oCr6brLpwv02nReSZ6haEJpx+JbcOFR
         7MwL4QSjUg0PQa97CTT1qhuTv+2PdRUeGfaP34TWusTZ3fBuVF1hhziGZw6EHuPc92fv
         k+NA==
X-Forwarded-Encrypted: i=1; AHgh+RrYvCGPgG71p7pLe2GxUwb5wYMWL6zW3wA3fmwvBy8M3tl/JSyoEjHTYwERDnjNoTEHzVbHTQO6ROI=@lists.xenproject.org
X-Gm-Message-State: AFuF++n/PBGImbmJjt9ITmmGRMzXIwUj65wIDovWwhqyHJSvcZB5PpiF
	A2DUCQw4/pGBrFY7ziLW41DzeQBWHx539TPGDEfqgN5yYyBNm4zdA56y
X-Gm-Gg: AR+sD10Z4XZIB1sMn9Vs/OHA4RApdJS89Sfj39yAQ/fV1DiWqaR+ztBEzdunMqn2N8u
	VYUHHjC5uQrV/ItL0ubCU8tBBion9e0DWeUdOuQQbz9l3xQqos/xQ09GugOS+z0PnZlTnWCNe1t
	8xxoGsFFSEKexFYy/nuSgAd2iTodGXQMrcpBFbtk9l67MycXCPx8eTGYAyweevbzUlHSNqJgunf
	Tysx45hv4bcrIt6+OUikk4JYPYc17huhnGX9UdNLgvJ9d/wx7dYXgRB1/5Xz+THAYLv60F7fEPy
	V3ytupoaP1TmDURdVa0BOW2srknJSF5UY7g6+bQ+MwN9Cy5b6nwUVQunIvfvlh7AEiqg6DQGigP
	mEWs9GEqC/Zl1ld8SNBO5dyDqt62FhKomcTtXWF79P1IedL06mJEvN1kta404Bhveh85ghPGdKo
	yzY/+lTOyihRyoYk0oyGjD1fJtB9jKU3wTvZTUYZMiqVNtMFnFSn01s81HL3TG+3DcqWmXtao7k
	CYAgOYFdSI1zzq8aizAeyi4b9JAii+/kFtB/ovQ5Q==
X-Received: by 2002:a05:6000:4903:b0:47f:9158:5924 with SMTP id ffacd0b85a97d-482f75d549emr286783f8f.9.1787847140675;
        Thu, 27 Aug 2026 09:12:20 -0700 (PDT)
Message-ID: <d4169b03-46aa-4bf3-881c-65ea8d970c27@gmail.com>
Date: Thu, 27 Aug 2026 18:12:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] RISC-V: split xen-syms linking rule
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9a78fdea-08ba-4e04-bfa1-ba09730a300b@suse.com>
 <6f4b26ce-2797-4c17-bfdf-8effd2026a6a@suse.com>
 <f0510fd7-32fc-4fbd-834e-68bba14150b9@gmail.com>
 <15abd61a-045f-47d1-94fb-b5febf28711c@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <15abd61a-045f-47d1-94fb-b5febf28711c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1787847141-D755C87B-FBFB5149/10/73395122804
X-purgate-type: spam
X-purgate-size: 5036



On 8/27/26 6:01 PM, Jan Beulich wrote:
> On 27.08.2026 17:56, Oleksii Kurochko wrote:
>> On 8/26/26 2:01 PM, Jan Beulich wrote:
>>> Doing so, besides (hopefully) adding clarity (not the least by way of
>>> [re-]using pattern rules where possible), also avoids explicit recursive
>>> $(MAKE) invocations.
>>>
>>> By re-using the generic rules introduced when the respective x86 rule was
>>> split,
>>> - the .map file now isn't created after the final binary anymore,
>>> - --strip-debug is passed to $(LD) during early linking passes (for
>>>     consistency the option is also explicitly added to the optional linking
>>>     pass rule),
>>> - CONFIG_{SUPPRESS_DUPLICATE_SYMBOL_WARNINGS,ENFORCE_UNIQUE_SYMBOLS} are
>>>     now properly respected.
>>> Orphan section checking, otoh, is getting suppressed for now, until the
>>> about a dozen warnings which would result have been taken care of.
>>>
>>> While the 4th linking step continues to be avoided when possible, a
>>> redundant invocation of $(NM) and tools/symbols (plus the assembling of
>>> the resulting .S file) is hopefully deemed acceptable.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> --- a/xen/arch/riscv/Makefile
>>> +++ b/xen/arch/riscv/Makefile
>>> @@ -31,40 +31,12 @@ obj-y += vtimer.o
>>>    $(TARGET): $(TARGET)-syms
>>>    	$(OBJCOPY) -O binary -S $< $@
>>>    
>>> -$(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
>>> -	$(objtree)/tools/symbols $(all_symbols) --empty > $(dot-target).0.S
>>> -	$(MAKE) $(build)=$(@D) $(dot-target).0.o
>>> -	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
>>> -	      $(dot-target).0.o -o $(dot-target).0
>>> -	$(NM) -pa --format=sysv $(dot-target).0 \
>>> -		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
>>> -		> $(dot-target).1.S
>>> -	$(MAKE) $(build)=$(@D) $(dot-target).1.o
>>> -	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
>>> -	    $(dot-target).1.o -o $(dot-target).1
>>> -	$(NM) -pa --format=sysv $(dot-target).1 \
>>> -		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
>>> -		> $(dot-target).2.S
>>> -	$(MAKE) $(build)=$(@D) $(dot-target).2.o
>>> -	if ! { $(call compare-symbol-tables, $(dot-target).1.o, $(dot-target).2.o) >/dev/null; }; \
>>> -	then \
>>> -		set -e; \
>>> -		$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
>>> -		    $(dot-target).2.o -o $(dot-target).2; \
>>> -		$(NM) -pa --format=sysv $(dot-target).2 \
>>> -			| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
>>> -			> $(dot-target).3.S; \
>>> -		$(MAKE) $(build)=$(@D) $(dot-target).3.o; \
>>> -		$(call compare-symbol-tables, $(dot-target).2.o, $(dot-target).3.o); \
>>> -	else \
>>> -		ln -sf $(dot-target).2.o $(dot-target).3.o; \
>>> -	fi
>>> -	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
>>> -	    $(dot-target).3.o -o $@
>>> -	$(NM) -pa --format=sysv $@ \
>>> -		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
>>> -		> $@.map
>>> -	rm -f $(dot-target).[0-9]* $(@D)/..$(@F).[0-9]*
>>> +LAST_LINKING_PASS := 3
>>> +
>>> +include scripts/Makefile.link
>>> +
>>> +# Suppress orphan section checking for the time being.
>>> +orphan-handling-y :=
>>
>> This works, but I think it's worth reconsidering the shape of it.
>>
>> It works only by virtue of deferred expansion: $(orphan-handling-y) is
>> referenced solely inside the recipe of the final-pass rule in
>> Makefile.link, so the value that matters is the one in effect when that
>> recipe is expanded, not when the rule was defined. Nothing states that
>> requirement, and nothing enforces it.
>>
>> What makes me uneasy is that the ordering is not merely undocumented,
>> it's inverted with respect to the obvious reading. Makefile.link has
>>
>>     orphan-handling-$(call ld-option,--orphan-handling=warn) :=
>> --orphan-handling=warn
>>
>> i.e. an unconditional := to orphan-handling-y whenever the linker
>> supports the option. So an arch that sets orphan-handling-y *before*
>> the include has its setting silently discarded and ends up with orphan
>> checking enabled after all: no warning, no error, just a dozen new
>> linker diagnostics appearing at some later point. And "before the
>> include" is exactly where one would naturally put it: right next to
>> LAST_LINKING_PASS, which is the one knob the arch Makefile does set up
>> front.
>>
>> I am not insisting on reworking but probably a small comment (in the
>> commit mesage at least?) somewhere about that "+orphan-handling-y :="
>> should go after include will be useful.
> 
> I can add a comment (albeit the ordering looks very obvious to me, and
> not counterintuitive at all), but the better thing would be for all
> arch-es to quickly deal with getting rid of this override again: No
> need for an override, no need for a comment.

Agree, then no need for the comment:

Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii



> 
> Jan


