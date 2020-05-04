Return-Path: <SRS0=jOUd=6S=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFCE2C3A5A9
	for <xen-devel@archiver.kernel.org>; Mon,  4 May 2020 13:53:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8C552078E
	for <xen-devel@archiver.kernel.org>; Mon,  4 May 2020 13:53:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8C552078E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVbWt-0007hb-Ap; Mon, 04 May 2020 13:53:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NHsq=6S=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jVbWs-0007hW-PB
 for xen-devel@lists.xenproject.org; Mon, 04 May 2020 13:53:06 +0000
X-Inumbo-ID: 942213f8-8e0e-11ea-9d23-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 942213f8-8e0e-11ea-9d23-12813bfff9fa;
 Mon, 04 May 2020 13:53:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7F55BAD2C;
 Mon,  4 May 2020 13:53:06 +0000 (UTC)
Subject: Re: [PATCH 05/16] x86/shstk: Introduce Supervisor Shadow Stack support
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>
References: <20200501225838.9866-1-andrew.cooper3@citrix.com>
 <20200501225838.9866-6-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d0347fec-3ccb-daa7-5c4d-f0e74b5fb247@suse.com>
Date: Mon, 4 May 2020 15:52:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200501225838.9866-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 02.05.2020 00:58, Andrew Cooper wrote:
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -34,6 +34,9 @@ config ARCH_DEFCONFIG
>  config INDIRECT_THUNK
>  	def_bool $(cc-option,-mindirect-branch-register)
>  
> +config HAS_AS_CET
> +	def_bool $(as-instr,wrssq %rax$(comma)0;setssbsy;endbr64)

I see you add as-instr here as a side effect. Until the other
similar checks get converted, I think for the time being we should
use the old model, to have all such checks in one place. I realize
this means you can't have a Kconfig dependency then.

Also why do you check multiple insns, when just one (like we do
elsewhere) would suffice?

The crucial insns to check are those which got changed pretty
close before the release of 2.29 (in the cover letter you
mention 2.32): One of incssp{d,q}, setssbsy, or saveprevssp.
There weren't official binutils releases with the original
insns, but distros may still have picked up intermediate
snapshots.

> @@ -97,6 +100,20 @@ config HVM
>  
>  	  If unsure, say Y.
>  
> +config XEN_SHSTK
> +	bool "Supervisor Shadow Stacks"
> +	depends on HAS_AS_CET && EXPERT = "y"
> +	default y
> +        ---help---
> +          Control-flow Enforcement Technology (CET) is a set of features in
> +          hardware designed to combat Return-oriented Programming (ROP, also
> +          call/jump COP/JOP) attacks.  Shadow Stacks are one CET feature
> +          designed to provide return address protection.
> +
> +          This option arranges for Xen to use CET-SS for its own protection.
> +          When CET-SS is active, 32bit PV guests cannot be used.  Backwards
> +          compatiblity can be provided vai the PV Shim mechanism.

Indentation looks odd here - the whole help section should
start with hard tabs, I think.

> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -95,6 +95,36 @@ unsigned long __initdata highmem_start;
>  size_param("highmem-start", highmem_start);
>  #endif
>  
> +static bool __initdata opt_xen_shstk = true;
> +
> +static int parse_xen(const char *s)
> +{
> +    const char *ss;
> +    int val, rc = 0;
> +
> +    do {
> +        ss = strchr(s, ',');
> +        if ( !ss )
> +            ss = strchr(s, '\0');
> +
> +        if ( (val = parse_boolean("shstk", s, ss)) >= 0 )
> +        {
> +#ifdef CONFIG_XEN_SHSTK
> +            opt_xen_shstk = val;
> +#else
> +            no_config_param("XEN_SHSTK", "xen", s, ss);
> +#endif
> +        }
> +        else
> +            rc = -EINVAL;
> +
> +        s = ss + 1;
> +    } while ( *ss );
> +
> +    return rc;
> +}
> +custom_param("xen", parse_xen);

What's the idea here going forward, i.e. why the new top level
"xen" option? Almost all options are for Xen itself, after all.
Did you perhaps mean this to be "cet"?

Also you surely meant to document this new option?

> --- a/xen/scripts/Kconfig.include
> +++ b/xen/scripts/Kconfig.include
> @@ -31,6 +31,10 @@ cc-option = $(success,$(CC) -Werror $(CLANG_FLAGS) $(1) -E -x c /dev/null -o /de
>  # Return y if the linker supports <flag>, n otherwise
>  ld-option = $(success,$(LD) -v $(1))
>  
> +# $(as-instr,<instr>)
> +# Return y if the assembler supports <instr>, n otherwise
> +as-instr = $(success,printf "%b\n" "$(1)" | $(CC) $(CLANG_FLAGS) -c -x assembler -o /dev/null -)

CLANG_FLAGS caught my eye here, then noticing that cc-option
also uses it. Anthony - what's the deal with this? It doesn't
look to get defined anywhere, and I also don't see what clang-
specific about these constructs.

Jan

