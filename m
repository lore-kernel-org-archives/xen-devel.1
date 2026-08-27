Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DBE0C61DB9
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:56:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401230.1636981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzcSq-0005cs-Qu; Thu, 27 Aug 2026 15:56:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401230.1636981; Thu, 27 Aug 2026 15:56:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzcSq-0005cl-NB; Thu, 27 Aug 2026 15:56:28 +0000
Received: by outflank-mailman (input) for mailman id 1401230;
 Thu, 27 Aug 2026 15:56:26 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzcSo-0005cd-Qb
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:56:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzcSn-004oWU-Jf
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:56:25 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905e09-8faa-0a2a0a5109dd-0a2a4503c972-42
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:56:25 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905e29-fae8-0a2a45030019-d155dd35e502-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:56:25 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-4815bce4652so1553900f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 08:56:25 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482e28f854dsm10068456f8f.36.2026.08.27.08.56.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2026 08:56:24 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787846185; x=1788450985; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Acg5xlPcpI2IlVuCZmrMC6RuFRWhY/MURDTNlQ5CB7Y=;
        b=s7JuPBg9Ba3doIFCDAFvpbW0RprMwUwdJn+1Maxd7qbQJTrsrwPH5PqkvGhik2hObj
         6ttRFfrvzzFMU9u8QzGGYypxehgqYU3Vd0ewEZ0Qt60TVbCzG9w3Rze36xaLyedaqCNZ
         qo6p6qerS5iDW+woeaofErI5gweKHxv1JuryPEkvnR61z9gYmldVNgOEmgweIQ8Zj1WB
         8dqkTexKVSun/LjQdJX1/Un9gREGw1U5hew8bR3x2nRBq4NPZRlAr4gmjWrnV70iRKrF
         TVqXyZEPhTtvG/IKXLVQpqfcB4RahxMNLkZlo/izz+4g825GMpZYC2qUfOWxvKgtZnI6
         NI8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787846185; x=1788450985;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Acg5xlPcpI2IlVuCZmrMC6RuFRWhY/MURDTNlQ5CB7Y=;
        b=U6dOWzLaT23s5wN2TQICTWipnz7unqJOAvURnysycNIJlL7yNGklORSOJnYjQczymR
         gPCObJYSMPMledwYS3VExPN88v31r0UVcL6EP06Ev1zoYDM49a2l90dlCo5wm5eIRFEs
         0KaSGjjgjUNan53lDmEscjz+fhGYaUoo4Ay44Dxp/fDysdcF6tpaTh1KDRZESxValbEJ
         JkcNEjmxVqFtNjPiDN4I6GkE/RH40wqxCrAfxtJ0Hm3uGQX78N6cYWV5NhwSfhhyAxjW
         1euuEPxNkE7sr5pLRVsf5odxECBROsJ9lUsrzo0Dtmp2zIfh4hJ87JY0BKCrgoXwjsk4
         VNQQ==
X-Forwarded-Encrypted: i=1; AHgh+RqEUkZbFhXXbAge9FiLnKO75K4JetUZ8CUrv0aGg0QYpb87AQpaaUgHg7YBzfgGEd5ywCdgWFcS1r4=@lists.xenproject.org
X-Gm-Message-State: AFuF++nQ8aYsjs5Xdrx4kWPyDIpIyP/lE9EDe132h9kZ6siZKJZ+D7o5
	97Fbs38oz6TlZxvvYs6e0HuIv+kJtG/Gy5ktxsuHsSDcvJXYzLgLPGlH
X-Gm-Gg: AR+sD10G8nVurWoM6QrmzoFUMNCKCm8PTmRVNz6tvLp/8E0KbLGjNxeOUczm/PZ/Nyp
	FsmaPSoBkr8neikghl9OL6dEig6iIUzD6WptxwmRL08ULs6EqhJrNtYBO83G1zeEJ/pLKwtg+2m
	uB4+bjDjtznImFBkiUU1VAYggLtwdJ/M4I85COtyhRUdzFxvv6G9ysb21KeGuDC1D4WXoweI7gA
	eeWguYJFGOq3cV5yNyR91mfpuqjcuPcACxHefo2cHwOmyC8WaBMfLqBAOz4w/y0jp1ZnKEpKgPG
	963YU36tU1MhZrlHd82sBHeFeP0FaUC57//bp4YGD1G5nUOvON62IbzfFcAYfdk1EeMAARaurPx
	tja2l63HxQ6diU7GMTr/oTfMEC7Xfp57b7bcaNMuYBz5C3MPj1mBpE3XqQtsn3rEcryr9YmuijI
	ipwJlsWl/6i5LVa64ayZCyg2786Y1lVrNcEm0JGCSwrzuLgnfNWXPYB8XbTW59vwBxA9bX9xPnh
	tOmbNpdMlx+KhR+hR4cDfGbzwon/ewjUU49svDikkU=
X-Received: by 2002:a5d:64c2:0:b0:482:e10e:58df with SMTP id ffacd0b85a97d-482e26d51e8mr22927647f8f.21.1787846184911;
        Thu, 27 Aug 2026 08:56:24 -0700 (PDT)
Message-ID: <f0510fd7-32fc-4fbd-834e-68bba14150b9@gmail.com>
Date: Thu, 27 Aug 2026 17:56:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] RISC-V: split xen-syms linking rule
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <9a78fdea-08ba-4e04-bfa1-ba09730a300b@suse.com>
 <6f4b26ce-2797-4c17-bfdf-8effd2026a6a@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <6f4b26ce-2797-4c17-bfdf-8effd2026a6a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1787846185-776F34E9-EA55D124/10/73395122804
X-purgate-type: spam
X-purgate-size: 4361



On 8/26/26 2:01 PM, Jan Beulich wrote:
> Doing so, besides (hopefully) adding clarity (not the least by way of
> [re-]using pattern rules where possible), also avoids explicit recursive
> $(MAKE) invocations.
> 
> By re-using the generic rules introduced when the respective x86 rule was
> split,
> - the .map file now isn't created after the final binary anymore,
> - --strip-debug is passed to $(LD) during early linking passes (for
>    consistency the option is also explicitly added to the optional linking
>    pass rule),
> - CONFIG_{SUPPRESS_DUPLICATE_SYMBOL_WARNINGS,ENFORCE_UNIQUE_SYMBOLS} are
>    now properly respected.
> Orphan section checking, otoh, is getting suppressed for now, until the
> about a dozen warnings which would result have been taken care of.
> 
> While the 4th linking step continues to be avoided when possible, a
> redundant invocation of $(NM) and tools/symbols (plus the assembling of
> the resulting .S file) is hopefully deemed acceptable.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/riscv/Makefile
> +++ b/xen/arch/riscv/Makefile
> @@ -31,40 +31,12 @@ obj-y += vtimer.o
>   $(TARGET): $(TARGET)-syms
>   	$(OBJCOPY) -O binary -S $< $@
>   
> -$(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
> -	$(objtree)/tools/symbols $(all_symbols) --empty > $(dot-target).0.S
> -	$(MAKE) $(build)=$(@D) $(dot-target).0.o
> -	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
> -	      $(dot-target).0.o -o $(dot-target).0
> -	$(NM) -pa --format=sysv $(dot-target).0 \
> -		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
> -		> $(dot-target).1.S
> -	$(MAKE) $(build)=$(@D) $(dot-target).1.o
> -	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
> -	    $(dot-target).1.o -o $(dot-target).1
> -	$(NM) -pa --format=sysv $(dot-target).1 \
> -		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
> -		> $(dot-target).2.S
> -	$(MAKE) $(build)=$(@D) $(dot-target).2.o
> -	if ! { $(call compare-symbol-tables, $(dot-target).1.o, $(dot-target).2.o) >/dev/null; }; \
> -	then \
> -		set -e; \
> -		$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
> -		    $(dot-target).2.o -o $(dot-target).2; \
> -		$(NM) -pa --format=sysv $(dot-target).2 \
> -			| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
> -			> $(dot-target).3.S; \
> -		$(MAKE) $(build)=$(@D) $(dot-target).3.o; \
> -		$(call compare-symbol-tables, $(dot-target).2.o, $(dot-target).3.o); \
> -	else \
> -		ln -sf $(dot-target).2.o $(dot-target).3.o; \
> -	fi
> -	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
> -	    $(dot-target).3.o -o $@
> -	$(NM) -pa --format=sysv $@ \
> -		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
> -		> $@.map
> -	rm -f $(dot-target).[0-9]* $(@D)/..$(@F).[0-9]*
> +LAST_LINKING_PASS := 3
> +
> +include scripts/Makefile.link
> +
> +# Suppress orphan section checking for the time being.
> +orphan-handling-y :=

This works, but I think it's worth reconsidering the shape of it.

It works only by virtue of deferred expansion: $(orphan-handling-y) is
referenced solely inside the recipe of the final-pass rule in 
Makefile.link, so the value that matters is the one in effect when that
recipe is expanded, not when the rule was defined. Nothing states that
requirement, and nothing enforces it.

What makes me uneasy is that the ordering is not merely undocumented,
it's inverted with respect to the obvious reading. Makefile.link has

   orphan-handling-$(call ld-option,--orphan-handling=warn) := 
--orphan-handling=warn

i.e. an unconditional := to orphan-handling-y whenever the linker
supports the option. So an arch that sets orphan-handling-y *before*
the include has its setting silently discarded and ends up with orphan
checking enabled after all: no warning, no error, just a dozen new
linker diagnostics appearing at some later point. And "before the
include" is exactly where one would naturally put it: right next to
LAST_LINKING_PASS, which is the one knob the arch Makefile does set up
front.

I am not insisting on reworking but probably a small comment (in the 
commit mesage at least?) somewhere about that "+orphan-handling-y :=" 
should go after include will be useful.


Thanks.

~ Oleksii

