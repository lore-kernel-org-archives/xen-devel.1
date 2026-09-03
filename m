Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94628C624D4
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 07:27:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1406448.1639729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x21qV-000516-6u; Thu, 03 Sep 2026 07:26:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1406448.1639729; Thu, 03 Sep 2026 07:26:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x21qV-00050z-3J; Thu, 03 Sep 2026 07:26:51 +0000
Received: by outflank-mailman (input) for mailman id 1406448;
 Thu, 03 Sep 2026 07:26:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x21qT-00050t-LN
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 07:26:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x21qS-009SVb-KH
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 09:26:48 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a992133-8faa-0a2a0a5109dd-0a2a4503d1d6-8
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 09:26:48 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a992138-fae8-0a2a45030019-d1558032ec3b-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 09:26:48 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-49b0d8bc2aaso20077715e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 00:26:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cee5e6115sm50534175e9.14.2026.09.03.00.26.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2026 00:26:47 -0700 (PDT)
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
        d=suse.com; s=google; t=1788420408; x=1789025208; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gMgYKh0m7rnTkLfMiw7d299pQwwLFiN2OpMCSWYK+FY=;
        b=WI5MnojJAPQKmHHcTyf9DialP1evyoYO6GhlY/ThWTeNUivvxBTJ6qcAslr2bZuVP7
         1EC+NfdBFETNtat0qxAnLg2jD/583teMDOBWbyujg1skkie6ngoSeLxZIfyeBc9GA9AS
         +etcb7OlSbdQabQqxdhn9ZISelP7t7f5NXHPQ5qBsmRkphLuLcnHIKbZTFUb3hZGB9hZ
         LsnqWqE2reAXIWkKtRYL+9x21/a00VjZOS5gdLhqnRCLi0Y24dSr1yHqinM+3fKBw1hk
         L2UaQCiYL3RbrvcrihPXh2NPRI9t2xKwbr+mKn9H2wWG/WsUjMaDNuKnwh3km7EX/0+J
         7PAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788420408; x=1789025208;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gMgYKh0m7rnTkLfMiw7d299pQwwLFiN2OpMCSWYK+FY=;
        b=IiDzt3vfiCJiO3wFQyc4FPwmpGpYMJ9+MGQSVae0NbnZtMKjyJrbpe+dPrdQv9e7ML
         lY5TPBX3gD+czEoRE1mprRdAa0kVrzXjfYjghSlyek3wDTn2LtQYE9e9vaKVe+pss0JT
         DxmkrRyPIBaB7jzosUCz/Gzs8ZJLaYftzvxxX/NxrvM01VEWoLHmaj6qzRDAWslDZ79K
         Ow8IFJl8DslK5UFb1mxL0rul+we36CTcclzTAAQiL+2oBtdebmLChmcXcdvLvGAAAjtS
         /s74TSSX6g4g5Id96XzJIPfC9s4tsChbTRCIGY8UGuWAsmQ1yzNT+vV98qJaqJ+aykJv
         cXrA==
X-Gm-Message-State: AFuF++m22gIsQXIaHbgTtoK3Tk+rksDeiF62Y13fWZtPmftRL9gMUiJ4
	IPUGWmJFZfR3K+AchHWM/rwduj1nm8lguDcUJ7hDfcgwDqEy6d4Mci9o8zqWZ/xTZA==
X-Gm-Gg: AYBFou1bidHAgOdkjIZexqk9CaGLragsTlcSqAWxbcn4Zk/MFFnb3rbKaca9sak/Stq
	Sufu3UieSrqo/egpqKmixjtUcakzMoFzgPzAKMnVj1wGp9ZOsv4iWY+sLPMS7pG8sFjOMHKqZ07
	RpfCfuEV/E4S3R+YVejl3DHC5iX82f7DOXAVJpGzZel2IIgJ8X6KC1mR3K6kC7SS7Ez8P6GE8tK
	OKfCanrk33pvfTicsgDApxCPHLwMNQWodFnCvTVaztvkMyBUD9+y5SvJB6ZSMvWL5leI51An7Y0
	rogXY0+LXf4MzaG77jRFmKW/oUown7CMbxSSCoJuxl7YFiMqT45gEF2NUjrc95Zchh/YMe8Sx5w
	MW3PKN8zDWFPN7vQyt5QMhrCNEbYti4gB/bh93JhVwCj+aNrwxFaeapaDkeY4x88kihOjaczwwk
	4YTTYFA9ye03ERWeTBmP80pMZ/xEpuB8pacgumf55E1eG25Lvg8C5Pk2ql33oAHcLapmaHH8rPK
	QX1QE6pVcXOrZBiB9mHUxwrtrdXEzGkcpuDDU/pbZutwbEKQ2ha
X-Received: by 2002:a05:600c:354b:b0:499:51f0:a9b2 with SMTP id 5b1f17b1804b1-49ce55f051dmr143628385e9.1.1788420407728;
        Thu, 03 Sep 2026 00:26:47 -0700 (PDT)
Message-ID: <4f99f95c-dadd-4f6e-b444-67f2eaa3fe47@suse.com>
Date: Thu, 3 Sep 2026 09:26:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] x86: split xen-syms/xen.efi linking rules
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>
References: <9a78fdea-08ba-4e04-bfa1-ba09730a300b@suse.com>
 <8e1b4212-ddb6-424a-91cf-ed80d985825c@suse.com>
 <1788360748.8631fc262581453bbf619ec5b2062170.1a0629b6e88000c4f3@vates.tech>
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
In-Reply-To: <1788360748.8631fc262581453bbf619ec5b2062170.1a0629b6e88000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1788420408-6D0D94E9-57072FCB/0/0
X-purgate-type: clean
X-purgate-size: 6586

On 02.09.2026 16:52, Anthony PERARD wrote:
> On Wed, Aug 26, 2026 at 02:00:22PM +0200, Jan Beulich wrote:
>> Doing so, besides (hopefully) adding clarity (not the least by way of
>> using pattern rules where possible), also avoids explicit recursive
>> $(MAKE) invocations. For xen-syms move re-usable helper rules to a new
>> scripts/Makefile.link.
>>
>> While doing so, re-order .map file creation (which can in principle fail)
>> and check-endbr.sh invocation ahead of putting in place the final image
>> (which is now the result of a simple rename).
>>
>> Also drop --source-name= from the tools/symbols invocation which has
>> --empty passed, for being meaningless there.
>>
>> Note that the original "rm" at the end of the rule needs limiting:
>> Removing intermediate files (which $(MAKE) doesn't itself remove) would
>> cause re-linking even when installing as root (when common/version.o is
>> left unaltered, and hence an incremental build should do nothing as long
>> as nothing else changed in the source tree).
> 
> But as far as I can tell, both `rm` command are still the same,
> unaltered. And both command do removes file mark as intermediate via
> .INTERMEDIATE, before make would do so. Without the `rm` commands, make
> would leave alone ".xen*.*.o.sym" and "..xen*.*.o.d".

Oh, I'm sorry - this paragraph is stale from v1. I've now dropped it.

>> --- a/xen/arch/x86/Makefile
>> +++ b/xen/arch/x86/Makefile
>> @@ -102,12 +102,6 @@ notes_phdrs = --notes
>> +LAST_LINKING_PASS := 2
>> +
>> +final-image-check-$(CONFIG_XEN_IBT) = $(SHELL) $(srctree)/tools/check-endbr.sh $<
> 
> How about removing $< from this macro, and letting the users of
> $(final-image-check-y) decide which argument to use?

I did consider doing so, but decided against: The placement of the argument
within the command may (in principle) matter. Now that you also mention this,
I think I'll switch to

final-image-check-$(CONFIG_XEN_IBT) = $(SHELL) $(srctree)/tools/check-endbr.sh $(1)

using

	$(call final-image-check-y, $<)

at the use sites.

>> @@ -191,51 +165,69 @@ note_file_option ?= $(note_file)
>>  
>>  extra-$(XEN_BUILD_PE) += efi.lds
>>  ifeq ($(XEN_BUILD_PE),y)
>> -$(TARGET).efi: $(obj)/efi/relocs-dummy.o $(obj)/efi/relocs-empty.o $(obj)/efi/mkreloc
>> -$(TARGET).efi: $(objtree)/prelink.o $(note_file) $(obj)/efi.lds
>> +
>> +.INTERMEDIATE: $(addprefix .$(TARGET).efi., \
>> +                           $(foreach n, 0 1 2, \
>> +                                     $(n) alt.$(n) $(n)r.o $(n)s.o $(n)r.S $(n)s.S))
>> +
>> +.$(TARGET).efi.%.o: .$(TARGET).efi.%.S FORCE
> 
> Left over "FORCE" from v1. Without if_changed we should let make decide
> to execute the recipe or not.

Oh, indeed. The adjustments to the xen.efi machinery were done merely
to mirror the xen-syms ones; they weren't strictly necessary to do
(and hence this went unnoticed).

>> +	$(call cmd,cc_o_S)
>> +
>> +.$(TARGET).efi.1r.S: .$(TARGET).efi.0 $(if $(relocs-dummy),.$(TARGET).efi.alt.0)
>> +.$(TARGET).efi.2r.S: .$(TARGET).efi.1 $(if $(relocs-dummy),.$(TARGET).efi.alt.1)
>> +
>> +.$(TARGET).efi.0r.o: $(obj)/efi/relocs-dummy.o $(obj)/efi/mkreloc
>> +	ln -sf $< $@
> 
> Why mkreloc is a prerequisite of this rule? It's not use here.
> 
> It could be move to the next rule, where it is actually used, and we
> could use order-only prerequisite, so $^ won't be altered. I've check,
> order-only prereq where introduced in make 3.80 according to the
> changelog of 3.81. And they are not part of the $^ variable.
> 
> But the target won't get rebuilt if mkreloc is changed. So order-only
> might not be the right type of prerequisite.

Indeed, it wants to be a real prereq. And rather than ...

>> +.$(TARGET).efi.%r.S:
>> +	$(MKRELOC) $^ > $@

... filtering it out of $^ I think it's easier the way it is. I can add a
comment, unless you think I need to move it here and do the filtering.

But wait - it really needs to move here, as the tool having been rebuilt
needs to cause rebuilding of these .S files (while .$(TARGET).efi.0r.o
wouldn't change at all).

>> +.$(TARGET).efi.0s.S:
>> +	$(objtree)/tools/symbols $(all_symbols) --empty > $@
>> +
>> +.$(TARGET).efi.1s.S: .$(TARGET).efi.0
>> +.$(TARGET).efi.2s.S: .$(TARGET).efi.1
>> +
>> +.$(TARGET).efi.%s.S:
>> +	$(NM) -pa --format=sysv $< \
>> +	  | $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
>> + 	    --source-name=$(TARGET).efi.S \
>> +	  > $@
>> +
>> +# See above for why $(note_file) needs removing here.
>> +efi-objs = $(filter-out $(note_file),$(filter %.o,$^))
>> +
>> +.$(TARGET).efi.%: $(objtree)/prelink.o .$(TARGET).efi.%r.o \
>> +                  .$(TARGET).efi.%s.o $(note_file) $(obj)/efi.lds
>> +	$(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi.lds $(efi-objs) \
>> +	      --strip-debug $(note_file_option) -o $@
> 
> This command have changed compared to what we have currently, for the
> step ".xen.efi.0". In the case where $(relocs-dummy) is empty, this
> command doesn't have relocs-dummy.o on the command line. With this patch,
> the object is added, via .xen.efi.1r.o. Is this fine?

For .xen.efi.0 it's .xen.efi.0r.o, and the rule for the latter is making
a symlink to relocs-dummy.o.

>> --- /dev/null
>> +++ b/xen/scripts/Makefile.link
>> @@ -0,0 +1,51 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +# ==========================================================================
>> +# Helper rules for linking xen-syms
>> +# ==========================================================================
>> +
>> +syms-warn-dup-y := --warn-dup
>> +syms-warn-dup-$(CONFIG_SUPPRESS_DUPLICATE_SYMBOL_WARNINGS) :=
>> +syms-warn-dup-$(CONFIG_ENFORCE_UNIQUE_SYMBOLS) := --error-dup
>> +
>> +orphan-handling-$(call ld-option,--orphan-handling=warn) := --orphan-handling=warn
>> +
>> +final-image-check-y ?= true
>> +
>> +.INTERMEDIATE: $(addprefix .$(TARGET)-syms.,$(foreach n,0 1 2 3,$(n) $(n).o $(n).S))
>> +
>> +.$(TARGET)-syms.%.o: .$(TARGET)-syms.%.S
>> +	$(call cmd,cc_o_S)
> 
> That recipe change slight we what's currently in tree, there's now
> "-DXEN_BUILD_EFI -DBUILD_ID_EFI", but that's probably fine, CFLAGS-y
> from xen/arch/x86/Makefile are now taken into account. (That's
> likely the case also for .xen.efi.%.o but I haven't checked.)

Yes, the same applies there, and yes, the two extra -D are entirely
benign (and strictly speaking more correct, if either would matter for
these .S files; right now xen.lds.S is their only consumer).

Jan

