Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE66D715F8
	for <xen-devel@archiver.kernel.org>; Sat, 24 Jan 2026 23:13:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1213026.1523765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjmol-0000Xf-4o; Sat, 24 Jan 2026 23:13:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1213026.1523765; Sat, 24 Jan 2026 23:13:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjmol-0000XY-1I; Sat, 24 Jan 2026 23:13:23 +0000
Received: by outflank-mailman (input) for mailman id 1213026;
 Sat, 24 Jan 2026 23:13:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zWSO=75=bounce.vates.tech=bounce-md_30504962.69755208.v1-eddca7357d1d497c8c71b25ae0da9f21@srs-se1.protection.inumbo.net>)
 id 1vjmoi-0000XS-VN
 for xen-devel@lists.xenproject.org; Sat, 24 Jan 2026 23:13:21 +0000
Received: from mail186-9.suw21.mandrillapp.com
 (mail186-9.suw21.mandrillapp.com [198.2.186.9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 418192cd-f97a-11f0-9ccf-f158ae23cfc8;
 Sun, 25 Jan 2026 00:13:13 +0100 (CET)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-9.suw21.mandrillapp.com (Mailchimp) with ESMTP id 4dz9Zc0trwzK5vgvF
 for <xen-devel@lists.xenproject.org>; Sat, 24 Jan 2026 23:13:12 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 eddca7357d1d497c8c71b25ae0da9f21; Sat, 24 Jan 2026 23:13:12 +0000
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
X-Inumbo-ID: 418192cd-f97a-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1769296392; x=1769566392;
	bh=ireF3WvM8dkpMPE1sLDraNczGCHBvGRF4ghsfmTnaWw=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Fc3s5goBSV52gPJQyqID/0fCej7HzXyNS9aIE6WfDFJ8RptU6bSICtCqhwtm/zF6n
	 QEzy1Va3N4VH1VqLPvebR23974LuJfB4qDvS9kXenFl4EUZWGfDShMObsaropH/0mM
	 c3F90AtKD2c8YyfncGnw7WuUWf1k2MG3WKTOG63D6d0RxOOEX6ine19qyt4/OwmDz8
	 NIPonL/3m+WEWZdgmPrgbIUHZPJsvpqYIZPRb/TRTUFE/wgo5k3GYJI6PsAcS4uZb5
	 6FYlQUebTkNLoNhlg5ylatbdZj+g5BqH8sGPv99u0MraD2zKT4RklB8jCYosZYQaqK
	 9GjHTCC4d5/pA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1769296392; x=1769556892; i=teddy.astie@vates.tech;
	bh=ireF3WvM8dkpMPE1sLDraNczGCHBvGRF4ghsfmTnaWw=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=aBZRzLmDNSuJ98mT3IEz4gtNewaBXLmZvoxnNK/hSFDQph+VN9IrKt90ZJESQuUB7
	 gKLpmxZs1ylPbBvPDEH4oseb4nbEpkNdIpyYPz3xsXwE8T3pCEcti+zlhOpQ6xtz7c
	 CT8pKSWQx1LYQGowrfYHSbmIqC24sKdmnSKgDjSezapIHa4c64lSbT5/1Q45YxC6Cb
	 85SwtqWQrfgxZtbrj4h/O1HeLvqnv/aXaDioXwdRq/DUBEOVwUmE4rMeyvyzETQrM0
	 uSCUJynOKvY75CFQ5qFJIch0q2mUrhpfdePW5GGTOg3wunDaybIp3kcyqVTo2eVQX1
	 p3/7elLW1Rt9g==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v2=2013/16]=20xen/riscv:=20implement=20reprogram=5Ftimer()=20via=20SBI?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1769296390366
Message-Id: <1222e3c6-44c1-434b-974e-04851874c1ca@vates.tech>
To: "Oleksii Kurochko" <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
Cc: "Alistair Francis" <alistair.francis@wdc.com>, "Connor Davis" <connojdavis@gmail.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Romain Caritey" <Romain.Caritey@microchip.com>
References: <cover.1769099883.git.oleksii.kurochko@gmail.com> <732635f43fb80daec332f78d4442b56bf5dfda98.1769099885.git.oleksii.kurochko@gmail.com>
In-Reply-To: <732635f43fb80daec332f78d4442b56bf5dfda98.1769099885.git.oleksii.kurochko@gmail.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.eddca7357d1d497c8c71b25ae0da9f21?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260124:md
Date: Sat, 24 Jan 2026 23:13:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 22/01/2026 =C3=A0 17:49, Oleksii Kurochko a =C3=A9crit=C2=A0:
> Implement reprogram_timer() on RISC-V using the standard SBI timer call.
> 
> The privileged architecture only defines machine-mode timer interrupts
> (using mtime/mtimecmp). Therefore, timer services for S/HS/VS mode must
> be provided by M-mode via SBI calls. SSTC (Supervisor-mode Timer Control)
> is optional and is not supported on the boards available to me, so the
> only viable approach today is to program the timer through SBI.
> 
> reprogram_timer() enables/disables the supervisor timer interrupt and
> programs the next timer deadline using sbi_set_timer(). If the SBI call
> fails, the code panics, because sbi_set_timer() is expected to return
> either 0 or -ENOSUPP (this has been stable from early OpenSBI versions to
> the latest ones). The SBI spec does not define a standard negative error
> code for this call, and without SSTC there is no alternative method to
> program the timer, so the SBI timer call must be available.
> 
> reprogram_timer() currently returns int for compatibility with the
> existing prototype. While it might be cleaner to return bool, keeping the
> existing signature avoids premature changes in case sbi_set_timer() ever
> needs to return other values (based on which we could try to avoid
> panic-ing) in the future.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in v2:
>   - Add TODO comment above sbi_set_timer() call.
>   - Update the commit message.
> ---
>   xen/arch/riscv/stubs.c |  5 -----
>   xen/arch/riscv/time.c  | 43 ++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 43 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
> index 1f0add97b361..cb7546558b8e 100644
> --- a/xen/arch/riscv/stubs.c
> +++ b/xen/arch/riscv/stubs.c
> @@ -21,11 +21,6 @@ nodemask_t __read_mostly node_online_map =3D { { [0] =
=3D 1UL } };
>   
>   /* time.c */
>   
> -int reprogram_timer(s_time_t timeout)
> -{
> -    BUG_ON("unimplemented");
> -}
> -
>   void send_timer_event(struct vcpu *v)
>   {
>       BUG_ON("unimplemented");
> diff --git a/xen/arch/riscv/time.c b/xen/arch/riscv/time.c
> index 2c7af0a5d63b..f021ceab8ec4 100644
> --- a/xen/arch/riscv/time.c
> +++ b/xen/arch/riscv/time.c
> @@ -7,6 +7,9 @@
>   #include <xen/time.h>
>   #include <xen/types.h>
>   
> +#include <asm/csr.h>
> +#include <asm/sbi.h>
> +
>   unsigned long __ro_after_init cpu_khz; /* CPU clock frequency in kHz. *=
/
>   uint64_t __ro_after_init boot_clock_cycles;
>   
> @@ -40,6 +43,46 @@ static void __init preinit_dt_xen_time(void)
>       cpu_khz =3D rate / 1000;
>   }
>   
> +int reprogram_timer(s_time_t timeout)
> +{
> +    uint64_t deadline, now;
> +    int rc;
> +
> +    if ( timeout =3D=3D 0 )
> +    {
> +        /* Disable timers */
> +        csr_clear(CSR_SIE, BIT(IRQ_S_TIMER, UL));
> +
> +        return 1;
> +    }

Do disabling the timers interrupt actually stops the timer or just 
prevents Xen from receiving the timer interrupt ?

If it doesn't "stop the timer", we probably would want to swap "enabling 
the timer interrupt" and "setting the timer through SBI" (to avoid 
potentially receiving a timer interrupt between these 2 operations).

Though, it's unclear in SBI specification if the sbi_set_timer touches 
the timer interrupt masking or not (at least it does if you set a timer 
too far in the future).

> +
> +    deadline =3D ns_to_ticks(timeout) + boot_clock_cycles;
> +    now =3D get_cycles();
> +    if ( deadline <=3D now )
> +        return 0;
> +
> +    /* Enable timer */
> +    csr_set(CSR_SIE, BIT(IRQ_S_TIMER, UL));
> +
> +    /*
> +     * TODO: When the SSTC extension is supported, it would be preferabl=
e to
> +     *       use the supervisor timer registers directly here for better
> +     *       performance, since an SBI call and context switch would no =
longer
> +     *       be required.
> +     *
> +     *       This would also reduce reliance on a specific SBI implement=
ation.
> +     *       For example, it is not ideal to panic() if sbi_set_timer() =
returns
> +     *       a non-zero value. Currently it can return 0 or -ENOSUPP, an=
d
> +     *       without SSTC we still need an implementation because only t=
he
> +     *       M-mode timer is available, and it can only be programmed in
> +     *       M-mode.
> +     */
> +    if ( (rc =3D sbi_set_timer(deadline)) )
> +        panic("%s: timer wasn't set because: %d\n", __func__, rc);
> +> +    return 1;
> +}
> +
>   void __init preinit_xen_time(void)
>   {
>       if ( acpi_disabled )



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



