Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C523EB26E9
	for <xen-devel@archiver.kernel.org>; Tue, 10 Feb 2026 16:45:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1226722.1533229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpqrX-0004ay-Di; Tue, 10 Feb 2026 16:45:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226722.1533229; Tue, 10 Feb 2026 16:45:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpqrX-0004ar-Ai; Tue, 10 Feb 2026 16:45:19 +0000
Received: by outflank-mailman (input) for mailman id 1226722;
 Tue, 10 Feb 2026 16:45:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WUYk=AO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vpqrW-0004al-0F
 for xen-devel@lists.xenproject.org; Tue, 10 Feb 2026 16:45:18 +0000
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [2a00:1450:4864:20::341])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0be8805-069f-11f1-b162-2bf370ae4941;
 Tue, 10 Feb 2026 17:45:16 +0100 (CET)
Received: by mail-wm1-x341.google.com with SMTP id
 5b1f17b1804b1-48329eb96a7so20226185e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Feb 2026 08:45:16 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d482480sm82355865e9.0.2026.02.10.08.45.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Feb 2026 08:45:15 -0800 (PST)
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
X-Inumbo-ID: e0be8805-069f-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770741916; x=1771346716; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SWVpA5H1nnjskT/qj0AhX2hWDuW8xmJhqVgcmisDcss=;
        b=lMG8hZ0BpEu6NQTQnNP/JVz/f/9VjPDLuVQyrz3lluXWsf1sj7wR/uedcdMZd87vFm
         NST6q7E/3kHFtX2IRS2FJ5h0jGjB6uOkBJRPamlBbxr9Mt1MtOJjG4Dt1VARrU+Lvb2x
         FzsDeb/WIDrYR/vr7Pm4EZy6vjMHOt+2NP7M7+HS7XuNd9lHJFtilEtjs4aXCw8mEJ8l
         IJZ166sVVb6Iy8eejS1G3sKRliyDDkK5+BAgpEECoW8PEPgFdO7C4Mb/in6PrQgO1oyX
         mQKWxXCA950TKU8i43/mPFuG74vanyeFYSotvgCEPopRh/zjpRWc57AOFNpEqafqU8yZ
         QriQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770741916; x=1771346716;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SWVpA5H1nnjskT/qj0AhX2hWDuW8xmJhqVgcmisDcss=;
        b=WeSw33q+3fDAnMDk9Mfb04axShEQ1L/KUjaRwHDeltObd+rhenBElttw0ScT5kXjJv
         FC+zkZXGMgHKoWDo5jhUjeys4iu7xX8WnPGr00HG2y9P9VSXT0zIUoeMhIBsaSdp0R13
         vd7J1T7qRsoAWa1FhMYh3zVu+DGxU45IBb4vKOrgV5N47sNCvFYMkx4kZkcoLQx7X+7j
         ra8o24WAWq2SU5PJe51eePEONBHCuk27bKkoySGtSjuC4JSl2rjzPWVen9wRaOe+KSG0
         aDwdJyqFiEO1ZnBSINl2spfIYle8JiW3HRrlpG9scWt5N3b2vEBSr5AzJR0LJUY3rbRR
         bHcw==
X-Forwarded-Encrypted: i=1; AJvYcCVf7MQKN6tvS+XdodcBgqHIrGgLKGgggKBnb5nSMoje7Qyc+NHX9t5R5ABu8xcPeGDXZzs5MJzfohI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyM4kui5eYhicXXe2hTmXLFTg4AAYwTvx1rJc+AacEmnSi4NXVZ
	xPQliddJixV2nQFky4XJVvb0IEmTLO8ehplrwpj/Rgj97hS0/GsU1PeT
X-Gm-Gg: AZuq6aKfy4/fgqZWAfvkaM2DPFzTCWOeU6DKr8IPizyYxN4tEXxjaHN5ZMRf2QUmpl1
	IHC5Dxv7XrMJVzjpIthOaP0CpI5ipR3Gd9hwkmrKKrdm+MnH91oFnz6r4/JsoCJCdnH02Vddwt8
	5UG+OZqco2S53lzQQdjvRRmVqA6IMHQSxDnx36BnKjxRz0UdeLOH5BrBFcjRGm4EguwWij1yBKR
	UvR9PUl9aao61wtVmUtoK7CYo2PJvZvKnPt8QKm6HQMvZ2iE9cKzWgEythHC+i6wLocTCQrAvJw
	CSbKrhoQoN21HfWc6s+ISUNFI4ocVxyAeVOKFZYX4kZnjWko/qlipSEEHJ9KIA2JCkOpts1KO/u
	d3tyVUtX8gvqPwr9bHKvhJDW4Y0+GqjPb9G4ubAhi6M8Pcwq63oiCN8DYHFkQTXyWYq79K/nc9D
	SR44pAyf5xmcGIMoJAfX5VV2qiaDQf0RF7Y91CQKxq3/nxJ1wMBWVOyO0zG9iWQwJ68vFujH71v
	2c=
X-Received: by 2002:a05:600c:3e0b:b0:47a:810f:1d06 with SMTP id 5b1f17b1804b1-483209291eamr221370045e9.4.1770741915915;
        Tue, 10 Feb 2026 08:45:15 -0800 (PST)
Message-ID: <a392074e-6003-4429-82ed-78e80fd3448d@gmail.com>
Date: Tue, 10 Feb 2026 17:45:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] non-x86/symbols: check table sizes don't change between
 linking passes 2 and 3
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <b61b7054-b27f-47fc-b268-f1dae3f1980d@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <b61b7054-b27f-47fc-b268-f1dae3f1980d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/2/26 3:45 PM, Jan Beulich wrote:
> Extend commit 1df11ccceb1a ("symbols: check table sizes don't change
> between linking passes 2 and 3") to other ports as well.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -99,6 +99,7 @@ $(TARGET)-syms: $(objtree)/prelink.o $(o
>   		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
>   		> $(dot-target).2.S
>   	$(MAKE) $(build)=$(@D) $(dot-target).2.o
> +	$(call compare-symbol-tables, $(dot-target).1.o, $(dot-target).2.o)
>   	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
>   	    $(dot-target).2.o -o $@
>   	$(NM) -pa --format=sysv $@ \
> --- a/xen/arch/ppc/Makefile
> +++ b/xen/arch/ppc/Makefile
> @@ -26,6 +26,7 @@ $(TARGET)-syms: $(objtree)/prelink.o $(o
>   		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
>   		> $(dot-target).2.S
>   	$(MAKE) $(build)=$(@D) $(dot-target).2.o
> +	$(call compare-symbol-tables, $(dot-target).1.o, $(dot-target).2.o)
>   	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
>   	    $(dot-target).2.o -o $@
>   	$(NM) -pa --format=sysv $@ \
> --- a/xen/arch/riscv/Makefile
> +++ b/xen/arch/riscv/Makefile
> @@ -40,6 +40,7 @@ $(TARGET)-syms: $(objtree)/prelink.o $(o
>   		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
>   		> $(dot-target).2.S
>   	$(MAKE) $(build)=$(@D) $(dot-target).2.o
> +	$(call compare-symbol-tables, $(dot-target).1.o, $(dot-target).2.o)
>   	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
>   	    $(dot-target).2.o -o $@
>   	$(NM) -pa --format=sysv $@ \

Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii


