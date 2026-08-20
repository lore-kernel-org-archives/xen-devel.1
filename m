Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6583FC5DF88
	for <xen-devel@archiver.kernel.org>; Thu, 20 Aug 2026 13:15:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1396553.1634366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wx2bk-00030m-FE; Thu, 20 Aug 2026 13:15:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1396553.1634366; Thu, 20 Aug 2026 13:15:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wx2bk-00030f-CO; Thu, 20 Aug 2026 13:15:00 +0000
Received: by outflank-mailman (input) for mailman id 1396553;
 Thu, 20 Aug 2026 13:14:59 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sergii.dmytruk@3mdeb.com>) id 1wx2bi-00030Z-Ol
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 13:14:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wx2bh-0029Sz-9M
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 15:14:57 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a86fdd0-8faa-0a2a0a5109dd-0a2a45059ff4-2
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 15:14:56 +0200
Received: from [46.105.44.175] (helo=3.mo561.mail-out.ovh.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a86fdd0-4cb1-0a2a45050019-2e692cafae9f-3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 15:14:56 +0200
Received: from director5.ghost.mail-out.ovh.net (unknown [10.110.0.68])
 by mo561.mail-out.ovh.net (Postfix) with ESMTP id 4hQkSH5rPKz69wD
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 13:14:55 +0000 (UTC)
Received: from ghost-submission-c7b579475-vmddb (unknown [10.110.188.21])
 by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 17BBE1000F3;
 Thu, 20 Aug 2026 13:14:55 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.98])
 by ghost-submission-c7b579475-vmddb with ESMTPSA
 id nh3nN879hmqx5QkABF4ZfQ
 (envelope-from <sergii.dmytruk@3mdeb.com>); Thu, 20 Aug 2026 13:14:55 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ovhmo3617313-selector1 header.d=3mdeb.com header.i="@3mdeb.com" header.h=From
Authentication-Results:garm.ovh; auth=pass (GARM-98R0021f96c00e-7dc3-48e6-9e0d-1216f252883e,
                    D706B0B4A4E5C2B84ADA60A922A966C43F440F90) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.181.215
Date: Thu, 20 Aug 2026 16:14:45 +0300
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	trenchboot-devel@googlegroups.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 02/23] x86/cpu: report SMX, TXT and SKINIT capabilities
Message-ID: <aob9xUZF12IJhLRz@MjU3Nj>
References: <cover.1785668458.git.sergii.dmytruk@3mdeb.com>
 <be993e757550b69a6f94f89476ba71131b434741.1785668458.git.sergii.dmytruk@3mdeb.com>
 <7489d730-6e91-4d6f-a355-4eaa62698c4c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7489d730-6e91-4d6f-a355-4eaa62698c4c@suse.com>
x-ovh-tracer-id: 18288836615552378332
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTEHja+aRFeNV2ixbeGtjyIMzgB3lg12I9m1uVhB0heuMO+Fzr7REfISj4T8fiDELlRrHvjokHQ0bfgn1CgpXbH73b1YFELft3wll7N3F3tumF3FWLMSVWez8FsU+T8NmQv8K/HIN/EEdznaWa3YmKiwCb6wH4pJaMTbozwSb8KojblEQnoIpOI5bY2Cjq9dJm/r+HZn1WnAzGEm36Ctq1gFV/1NETPPz1n8WCsfGYn1D8OerJOYYwMiAQy3YiM+Sk/cSfF03OC+FDq3mBP8r4pVveTU4Wq7oN+9Gohy0BIk/SoKsSNvy0r+zN8XWmPqh/IB1soU5m2ntLlULfq0jgF2QhM4CdN8F4FC3vq8ZDHsM43HTO1l9Zo7L0bOFvHE3181qrRgk2Ili7uG4zcbjP8qbR8gYt5cbX0lxD5wMOyAV9wQMFIiL1Tz8yoZr/Glf2BWg/7Rvb/4rt1geaatcKGBP2Q+eJ10XjhkITryodNP4/QVNG92zY+3JJAgYexDrdJ0+/S0VoUijJDr/8AQvSiZPnphQAF4fWCamoN2s9cIIGo4VVq1sNgiOPh6wFXyQmqZYpOwNRahnebmVjZW7Rzcmk39vxo4r8nqqFIGGlVmTqwEZSZL2IifATIoAo0h10VqnqoReElZktZkjPCzP1dKTTPFXy1khb0sz49gV4IwmA
DKIM-Signature: a=rsa-sha256; bh=i199ftMT32oqzrbAktF9xI3Y2+Viq/+CBtxR6F9DISQ=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1787231695; v=1;
 b=MjQ3d7bdR/RUNl72DSI2OaoetRaIvb7N7VK1KoMPcH16//lxRwC38hfKwL58X8XpaNphe/Cb
 43OFemYTMp97sXb50hWF9MJd3wJ6Zy4gRGvkOZB/GOraea6hh0JLa3FteKrAAPI8loQ23N3HpTh
 ZHwGn9XHttL3WSslmT3vP4ebUG5lZiAvr1WRXWbXQ2zFtPpVXIEr3BZqasKsbiSRSjTLpz8bXTk
 4NIwwEPcn/4uj0utgswUk5JEM97xFUqiO1S67B15iKWsHf/0olnJbgI+rY4bydpkzcAn53Mialu
 VW5DSxMhG3kIjlX0s1aGzO45F9NQrjVgKM+romhkZpQWw==
X-purgate-ID: tlsNG-c201ff/1787231696-734BC2A1-32F65332/0/0
X-purgate-type: clean
X-purgate-size: 5164

On Tue, Aug 18, 2026 at 02:08:48PM +0200, Jan Beulich wrote:
> On 02.08.2026 15:09, Sergii Dmytruk wrote:
> > From: Michał Żygowski <michal.zygowski@3mdeb.com>
> >
> > Report TXT capabilities so that dom0 can query the Intel TXT or AMD
> > SKINIT support information using xl dmesg.
>
> Hmm. I first meant to ask: In how far is this extra logging useful,
> especially as long as we don't use the features just yet? And only then
> I noticed that I must have paid too little attention here already in v3.
> Querying through "xl dmesg" is entirely unreliable. Sooner or later the
> boot messages will scroll off of the ring buffer. Making this a
> query-able interface also would mean we can't alter any of the messages,
> should the want/need arise.
>
> For AMD the situation is easy: It's part of the featureset / CPU policy
> exposed via sysctl. The same is true for SMX on Intel, but the further
> GETSEC output requires some other means to communicate. I wonder whether
> making this part of the CPU policy would make sense, or whether to
> introduce a Dom0-only hypervisor-CPUID bit for it, or whether yet
> something else would be best here. Likely Andrew will have had thoughts
> on this long before ...

I'm not aware of anything relying on this output.  It's just for making
this information more accessible to users that may be wondering if DRTM
has a chance of working (e.g., if hardware supports it and firmware is
properly configured).  The wording may be unfortunate (and needs a fix
anyway), I can change it to

    Report DRTM-related capabilities to enable checking for them in dom0
    using `xl dmesg`.  This targets debug and diagnostic use cases.

if that helps.

> > --- a/xen/arch/x86/cpu/amd.c
> > +++ b/xen/arch/x86/cpu/amd.c
> > @@ -617,6 +617,21 @@ void amd_process_freq(const struct cpuinfo_x86 *c,
> >  		*low_mhz = amd_parse_freq(c->family, lo);
> >  }
> >
> > +void amd_log_skinit(const struct cpuinfo_x86 *c)
> > +{
> > +    /*
> > +     * Run only on BSP and not during resume to report the capability only once.
> > +     */
> > +    if ( system_state == SYS_STATE_resume || smp_processor_id() )
> > +        return;
>
> If this is BSP-on-boot only, the function really wants to be __init. For that,
> ...
>
> > +    printk("CPU: SKINIT capability ");
> > +    if ( !test_bit(X86_FEATURE_SKINIT, &boot_cpu_data.x86_capability) )
> > +        printk("not supported\n");
> > +    else
> > +        printk("supported\n");
> > +}
> > +
> >  void cf_check early_init_amd(struct cpuinfo_x86 *c)
> >  {
> >  	if (c == &boot_cpu_data)
>
> ... use this condition ...
>
> > @@ -1325,6 +1340,7 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
> >  		setup_force_cpu_cap(X86_FEATURE_XEN_REP_MOVSB);
> >
> >  	amd_log_freq(c);
> > +	amd_log_skinit(c);
>
> ... at the call site (and of course also the other one). Same for the Intel
> code, obviously.

OK, thanks.

> > @@ -620,6 +625,49 @@ static void init_intel_perf(struct cpuinfo_x86 *c)
> >      }
> >  }
> >
> > +/*
> > + * Print out the SMX and TXT capabilties, so that dom0 can determine if the
> > + * system is DRTM-capable.
> > + */
> > +static void intel_log_smx_txt(void)
> > +{
> > +    unsigned long cr4_val, getsec_caps;
> > +
> > +    /*
> > +     * Run only on BSP and not during resume to report the capability only once.
> > +     */
> > +    if ( system_state == SYS_STATE_resume || smp_processor_id() )
> > +        return;
> > +
> > +    printk("CPU: SMX capability ");
> > +    if ( !test_bit(X86_FEATURE_SMX, &boot_cpu_data.x86_capability) )
> > +    {
> > +        printk("not supported\n");
> > +        return;
> > +    }
> > +    printk("supported\n");
> > +
> > +    /* Can't run GETSEC without VMX and SMX */
> > +    if ( !test_bit(X86_FEATURE_VMX, &boot_cpu_data.x86_capability) )
> > +        return;
> > +
> > +    cr4_val = read_cr4();
> > +    if ( !(cr4_val & X86_CR4_SMXE) )
> > +        write_cr4(cr4_val | X86_CR4_SMXE);
> > +
> > +    asm volatile ("getsec\n"
> > +        : "=a" (getsec_caps)
> > +        : "a" (GETSEC_CAPABILITIES), "b" (0) :);
>
> Nit (style): Bad indentation, missing blanks, unnecessary \n, and stray colon.
> Overall:
>
>     asm volatile ( "getsec"
>                    : "=a" (getsec_caps)
>                    : "a" (GETSEC_CAPABILITIES), "b" (0) );
>
> I further question the need for volatile here. (Like for we have for CPUID, we
> anyway may want to gain a getsec() wrapper for GETSEC.)

I think `volatile` was added just because it doesn't hurt, rather than
because it's necessary, so it can be dropped.  Can add a wrapper, but
there is only one use so far and a generic wrapper will have to use
64-bit parameters (`GETSEC[EXITAC]` sets RBX).

> > +    if ( !(cr4_val & X86_CR4_SMXE) )
> > +        write_cr4(cr4_val & ~X86_CR4_SMXE);
>
> The clearing of SMXE here is pointless, as the if() already guarantees the bit
> to be clear.

This statement restores the value stored in `cr4_val` (see above).
Maybe should name the variable `old_cr4_val` or `orig_cr4_val`.

Regards

