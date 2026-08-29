Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E9CC61DBE
	for <xen-devel@archiver.kernel.org>; Sat, 29 Aug 2026 13:22:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1402826.1637637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x0J0c-00072r-Ru; Sat, 29 Aug 2026 13:22:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1402826.1637637; Sat, 29 Aug 2026 13:22:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x0J0c-00072j-Mv; Sat, 29 Aug 2026 13:22:10 +0000
Received: by outflank-mailman (input) for mailman id 1402826;
 Sat, 29 Aug 2026 13:22:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1x0J0b-00072d-EN
 for xen-devel@lists.xenproject.org; Sat, 29 Aug 2026 13:22:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x0J0a-00HGZI-Rf
 for xen-devel@lists.xenproject.org; Sat, 29 Aug 2026 15:22:08 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6a92dca6-2eae-0a2a0a5409dd-0a2a4501d5fc-44
 for <xen-devel@lists.xenproject.org>; Sat, 29 Aug 2026 15:22:08 +0200
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6a92dd00-5984-0a2a45010019-a237832fba20-3
 for <xen-devel@lists.xenproject.org>; Sat, 29 Aug 2026 15:22:08 +0200
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 1EE1F4EE0184;
 Sat, 29 Aug 2026 15:21:57 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1788009727;
	b=TlD1X+b569XEEKufkEihilRCtQtJ6CtiFkxM0qovcXyjfJlwHALBXgPgYJObtHBVpYDm
	 ZHkPct9l8dHWubpkuog75njZvaorl406aRXPIDR1tQLI85B6XqhnXfZ93DoUf8mo2HRcn
	 hV0YIlDuImAkMKYojUS/6PP2czFnLASc/uwSPCLeQZauE67aq8an31AV6r+tEKVBlbarw
	 vuDJsE1j6bxSYFwdwsem5ze6BVKR1YZZnlnQHUq6XBRkBrlcPeVdNX4c7xTb9GEbyy+DZ
	 oDOkzp1coq2YdP8F+RT+GZjTuX3t84G6gVLMm+KUM8ZvedoMDDxLAwhzNO8Sl1g/X7vC+
	 86nno0BotaUDSAkJRte6qrVdXTttEHYrEVIt8+DdWPMSY/pFWjSKDErJrprDERhyaOGg1
	 Y0RCDwfFdRypHBLkxdJcnVXZnVa9O2Gi60VjCgCmEP1tghO4YitSzLbBIi/h8H6zuUyvd
	 u11XEdSgaWNPES1CB9uxR43VMNoRiLuZmoLm8wQzLBQq4/cmtgaJsH4mBY/MvIi+U6omK
	 BYcmieXnALX+C8N6IqEk9wypLyG0bhIQ5yB0JmYvtalEVBYxwzqWHj2e5PaWt3f1fma6u
	 Czq80cTax9lhM8Hmt4bJqt8seVyv4fXzMUHUPZ9Hk0HAleXk3INxY1XYQjh445E=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788009727;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=/pEy/Zm4j9Av9iFeAsk+kZ4vGnZ9eb5eKV48lVGJeZY=;
	b=uZZ8mX1jXHy1I2uwAag5KZicQa/LCxjzqtCiZzfsextJacIcrcfpW5jPe1C0Udk/1Zr4
	 0ACGpdJVpyPLaIYoGvTu921BcRnsbQyPrgSOqyjunwC30q74Vcs9UErIxAzX9sCsCc5Af
	 l8Qu13MBn4G3wy7azUa42/VRfythrc9E+/5IgXqIrHkv9f09yV5kKnxm9jJHZvJEl+dax
	 OQRDxDUTKxTw8HOYyiQc7NZb7QFInGom4sdHrndm9TgWrLqk1fdd52VajZcnK6b7+2wwp
	 GZ3ZY1/vvRPViONETAnxgJ9tAD82D8Z2Fbk6SfW4sMeltlktRDF7ECkCiQIoOVSURvlkU
	 Qg1Mk9aNQer7sZMox8Xf0L8oLXMPJfszbARY2hsp2Fy+Xd6uDhZkBKevB/xGic+r3z0Xj
	 g0TQXtKXQWcC7Hlue/DycLNEasCIiM1r4ERfqtZhnsI4rkIsb71f1oCXs2CD5yq1z5IRC
	 2pEytHJ+642qIosrh+srz5aV4yu08NqTh8ZbVoBaKmX8wohpjQlQjCyHJgtBgH/PaL2UK
	 sqSxb5ACYQwBydhd/gF9TkG2WfpfSFZ7glsNVD4ecJx5WCgeZ5FLRWhzc5Sm3bKI3Q7tV
	 s0YgsM1BE37EVXOCHWVojhU33ptyi18a2MUGCt8yXN6Jl9HjkEhZNH/ii0gWXeE=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Sat, 29 Aug 2026 15:21:57 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Teddy Astie <teddy.astie@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Subject: Re: [PATCH 04/12] x86: add noreturn in a few more places
In-Reply-To: <d0f991de-db67-4f49-aef0-25c590b3889e@suse.com>
References: <90d0e3d6-2e12-43f1-815d-7936ca4c5fc6@suse.com>
 <d0f991de-db67-4f49-aef0-25c590b3889e@suse.com>
Message-ID: <fceca3b7cf0ccc067f89212a30aa3a6e@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1788009728-BFA6E757-BEF4F805/0/0
X-purgate-type: clean
X-purgate-size: 5143

On 2026-08-28 09:01, Jan Beulich wrote:
> start_secondary(), do_double_fault(), play_dead(), and tboot_s3_error()
> never return, so would better be annotated anyway. The 
> do_double_fault()
> change needs accompanying by adjustments to entry_from_{pv,xen}(), as
> Eclair then deems the "return" there as unreachable.
> 
> context_switch() and continue_running() are odd: We can't
> (unconditionally) add noreturn to their declarations, as Arm's variants 
> do
> return. Put the attribute on x86'es definitions instead (the use of
> unreachable() in reset_stack_and_call_ind() allows the compiler to 
> figure
> that out itself, but Eclair wants the annotation in addition).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

> ---
> entry_from_pv() wants the annotation only when PV=n, yet once added gcc
> then warns about "return" being used in a "noreturn" function. Is there
> any other approach to address this besides adding #ifdef inside the
> function (i.e. replacing the !IS_ENABLED(CONFIG_PV) check that's 
> there)?
> 

Besides GCC's warning, this would violate MISRA C's Rule 17.9 ("A 
function declared with a _Noreturn function specifier shall not return 
to its caller")
which is not (yet) adopted by Xen, as it comes with MISRA C:2012 
Amendment 3, whereas as you know Xen is based on MISRA C:2012 Amendment 
2 rules.
Besides this, perhaps an alternative could be something like this 
(untested):

#define __noreturn_0
#define __noreturn_1 __attribute__((noreturn))

#define __noreturn_select(x) __noreturn_select_(x)
#define __noreturn_select_(x) __noreturn_ ## x

#define noreturn(cond) __noreturn_select(cond)

assuming use sites such as noreturn(IS_ENABLED(CONFIG_FOO))

> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -2163,7 +2163,7 @@ static void __context_switch(void)
>      per_cpu(curr_vcpu, cpu) = n;
>  }
> 
> -void context_switch(struct vcpu *prev, struct vcpu *next)
> +void noreturn context_switch(struct vcpu *prev, struct vcpu *next)
>  {
>      unsigned int cpu = smp_processor_id();
>      struct cpu_info *info = get_cpu_info();
> @@ -2240,7 +2240,7 @@ void context_switch(struct vcpu *prev, s
>      reset_stack_and_call_ind(nextd->arch.ctxt_switch->tail);
>  }
> 
> -void continue_running(struct vcpu *same)
> +void noreturn continue_running(struct vcpu *same)
>  {
>      reset_stack_and_call_ind(same->domain->arch.ctxt_switch->tail);
>  }
> --- a/xen/arch/x86/include/asm/cpuidle.h
> +++ b/xen/arch/x86/include/asm/cpuidle.h
> @@ -26,7 +26,7 @@ static inline int mwait_idle_init(struct
>  int cpuidle_init_cpu(unsigned int cpu);
>  void cf_check default_dead_idle(void);
>  void cf_check acpi_dead_idle(void);
> -void play_dead(void);
> +void noreturn play_dead(void);
>  void trace_exit_reason(u32 *irq_traced);
>  void update_idle_stats(struct acpi_processor_power *power,
>                         struct acpi_processor_cx *cx,
> --- a/xen/arch/x86/include/asm/tboot.h
> +++ b/xen/arch/x86/include/asm/tboot.h
> @@ -126,7 +126,7 @@ int tboot_in_measured_env(void);
>  int tboot_protect_mem_regions(void);
>  int cf_check tboot_parse_dmar_table(acpi_table_handler dmar_handler);
>  int tboot_s3_resume(void);
> -void tboot_s3_error(int error);
> +void noreturn tboot_s3_error(int error);
>  int tboot_wake_ap(int apicid, unsigned long sipi_vec);
>  #else
>  static inline void tboot_probe(void) {}
> --- a/xen/arch/x86/smpboot.c
> +++ b/xen/arch/x86/smpboot.c
> @@ -326,7 +326,7 @@ static void set_cpu_sibling_map(unsigned
>      }
>  }
> 
> -void asmlinkage start_secondary(void)
> +void asmlinkage noreturn start_secondary(void)
>  {
>      struct cpu_info *info = get_cpu_info();
>      unsigned int cpu = smp_processor_id();
> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -1080,7 +1080,7 @@ const char *vector_name(unsigned int vec
>      return (vec < ARRAY_SIZE(names) && names[vec][0]) ? names[vec] : 
> "???";
>  }
> 
> -void asmlinkage do_double_fault(struct cpu_user_regs *regs)
> +void asmlinkage noreturn do_double_fault(struct cpu_user_regs *regs)
>  {
>      unsigned int cpu;
>      struct extra_state state;
> @@ -2304,7 +2304,7 @@ void asmlinkage entry_from_pv(struct cpu
>      case X86_ET_HW_EXC:
>          switch ( vec )
>          {
> -        case X86_EXC_DF: return do_double_fault(regs);
> +        case X86_EXC_DF: do_double_fault(regs); /* noreturn */
>          case X86_EXC_MC: return do_machine_check(regs);
>          }
>          break;
> @@ -2615,7 +2615,7 @@ void asmlinkage entry_from_xen(struct cp
>      case X86_ET_HW_EXC:
>          switch ( regs->fred_ss.vector )
>          {
> -        case X86_EXC_DF: return do_double_fault(regs);
> +        case X86_EXC_DF: do_double_fault(regs); /* noreturn */
>          case X86_EXC_MC: return do_machine_check(regs);
>          }
>          break;

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

