Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30DCDC5B56C
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 13:32:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387478.1628744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtQ7O-0005L1-3T; Mon, 10 Aug 2026 13:32:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387478.1628744; Mon, 10 Aug 2026 13:32:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtQ7N-0005Ku-W0; Mon, 10 Aug 2026 13:32:42 +0000
Received: by outflank-mailman (input) for mailman id 1387478;
 Mon, 10 Aug 2026 13:32:40 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wtQ7M-0005Jj-Ff
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 13:32:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtQ7L-003Xnu-CF
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 15:32:39 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19febdfed5f000e099@swg.vates.tech>)
 id 6a79d2e5-e002-0a2a0a5209dd-0a2a450b9eba-46
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 15:32:39 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19febdfed5f000e099@swg.vates.tech>)
 id 6a79d2f6-b7e8-0a2a450b0019-b9ff1c239bd9-3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 15:32:39 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19febdfed5f000e099.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 10 Aug 2026 13:32:28 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 47F0E83637;
 Mon, 10 Aug 2026 15:32:28 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=B8XqmmZKLgCncAIlKFa+leieV2tUIHyhNz/C3/qNJGs=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=pZNYPkxfV70VJUsy+ECFCpciVklxEExPfYLKixHgVUjfeRUC/QKIz3ACOEwprpUx7GOYrlamD
 QdmhiKDvI8B07IPeVCrxXQkwaM0iaC3KX/6vTbFaC+0AJxXSTZa+I1ONeiq1IqchO2q/Y+rTF+s
 o6vs5A2jac+2RGZm/8hNsc/+DXCPxoYd05taZSloj4NI8Sx1rDWSQfWmUpRFIx7yhnVexVH4+IE
 /wpMFZ5UiClhr2B6/XeQrKmMPE5SB13JOA7Kp9EAhdcuSP5pKty++1shRekW63n4hdbeCt9GARQ
 QJzlYHdNikGORlS5ayOVqO6PIcMl48v2QstXzKM5fq9g==
X-Zone-Loop: fe21c313ec40f27de269a635cf4985c6e5078b28f485
x-campaign-type: default
x-transaction-id: b1f5b066-9d13-4ffc-abea-aac0c1b45edc
x-swg-uid: 01-550e9b3e-0583-468c-bdd3-090d8980b5bd
X-Mailer: Sweego
Message-ID:
 <1786368748.8631fc262581453bbf619ec5b2062170.19febdfed5f000e099@vates.tech>
x-swg-bid: 1786368748.8631fc262581453bbf619ec5b2062170.19febdfed5f000e099
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Subject: Re: [PATCH v1 02/17] xen/riscv: add basic VGEIN management for AIA
 guests
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, 
 Romain Caritey <Romain.Caritey@microchip.com>, 
 Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <b141b8d976719bb9b76147cacfd5842fb7aac74e.1784560663.git.oleksii.kurochko@gmail.com>
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <b141b8d976719bb9b76147cacfd5842fb7aac74e.1784560663.git.oleksii.kurochko@gmail.com>
Date: Mon, 10 Aug 2026 15:32:21 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786368747; l=8037;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=/suDN280+hL3fCZDTTxmVx1ex2fURVPekHgQ4TonBYQ=;
 b=LxrofuYjYUYpV9+IlCKbegOA9u3AzG9yWlEYI6U54VAfbZCs+ZBSihrthJCDn1VYKRkD2bnZq
 CJtnANvazd5BVdBY3hEyWhxTI5pZRy60WU5QqicxkHzQwCF2Bc4mPYv
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.2011.76c267eae0dd40.19febdfebbd.80b0a5b8f4d6725b=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1786368748477
X-purgate-ID: tlsNG-42698a/1786368759-1BCD79EA-D9CAAED3/10/73395122804
X-purgate-type: spam
X-purgate-size: 8646

---=Part.2011.76c267eae0dd40.19febdfebbd.80b0a5b8f4d6725b=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

> It was decided to add support for IMSIC from the start instead of having =
APLIC
> operate in direct delivery mode, as it requires a trap-and-emulation app=
roach,
> which is not optimal from a performance standpoint=2E
>=20
> AIA provides a hardware-accelerated mechanism for delivering external
> interrupts to domains via "guest interrupt files" located in IMSIC=2E
> A single physical hart can implement multiple such files (up to GEILEN),
> allowing several virtual harts to receive interrupts directly from hardw=
are=2E
>=20
> Introduce per-CPU tracking of guest interrupt file identifiers (VGEIN)
> for systems implementing AIA specification=2E Each CPU maintains
> a bitmap describing which guest interrupt files are currently in use=2E
>=20
> Add helpers to initialize the bitmap based on the number of available
> guest interrupt files (GEILEN), assign a VGEIN to a vCPU, and release it
> when no longer needed=2E When assigning a VGEIN, the corresponding value
> is written to the VGEIN field of the guest hstatus register so that
> VS-level external interrupts are delivered from the selected interrupt
> file=2E
>=20
> Signed-off-by: Oleksii Kurochko <oleksii=2Ekurochko@gmail=2Ecom>
>
> diff --git a/xen/arch/riscv/aia=2Ec b/xen/arch/riscv/aia=2Ec
> index e31c9c2d24=2E=2E4f7f46f58f 100644
> --- a/xen/arch/riscv/aia=2Ec
> +++ b/xen/arch/riscv/aia=2Ec
> @@ -1,11 +1,33 @@
>  /* SPDX-License-Identifier: GPL-2=2E0-only */
> =20
> +#include <xen/bitmap=2Eh>
> +#include <xen/cpu=2Eh>
>  #include <xen/errno=2Eh>
>  #include <xen/init=2Eh>

Add a #include <xen/percpu=2Eh> here instead of in aia=2Eh=2E

>  #include <xen/sections=2Eh>
> +#include <xen/sched=2Eh>
> +#include <xen/spinlock=2Eh>
>  #include <xen/types=2Eh>
> +#include <xen/xvmalloc=2Eh>
> =20
> +#include <asm/aia=2Eh>
>  #include <asm/cpufeature=2Eh>
> +#include <asm/csr=2Eh>
> +#include <asm/current=2Eh>
> +
> +struct vgein_ctrl {
> +    unsigned long bmp;
> +    spinlock_t lock;
> +    struct vcpu **owners;
> +    /* The least-significant bits are implemented first, apart from bit=
 0 */
> +    unsigned int geilen;
> +};
> +
> +/*
> + * VGEIN control structure for each physical CPU to track which VS (gue=
st)
> + * interrupt file IDs are in use=2E
> + */
> +static DEFINE_PER_CPU(struct vgein_ctrl, vgein);
> =20
>  static bool __ro_after_init _aia_usable;
> =20
> @@ -14,10 +36,133 @@ bool aia_usable(void)
>      return _aia_usable;
>  }
> =20
> +static int vgein_init(unsigned int cpu)

Could we call this function with a different cpu arg than the current
one running? If yes, we would read hgeie of not the cpu we wanted=2E
> +{
> +    struct vgein_ctrl *vgein =3D &per_cpu(vgein, cpu);
> +
> +    csr_write(CSR_HGEIE, -1UL);
> +    vgein->geilen =3D flsl(csr_read(CSR_HGEIE) >> 1);
> +    csr_write(CSR_HGEIE, 0);
> +
> +    printk("cpu%u=2Egeilen=3D%u\n", cpu, vgein->geilen);

> +
> +    if ( !vgein->geilen )
> +        return -EOPNOTSUPP;
> +
> +    vgein->owners =3D xvzalloc_array(struct vcpu *, vgein->geilen);
> +    if ( !vgein->owners )
> +        return -ENOMEM;
> +
> +    spin_lock_init(&vgein->lock);
> +
> +    return 0;
> +}
> +
> +static int cf_check cpu_callback(struct notifier_block *nfb, unsigned l=
ong action,
> +                        void *hcpu)
> +{
> +    unsigned int cpu =3D (unsigned long)hcpu;
> +    int rc =3D 0;
> +
> +    switch ( action )
> +    {
> +    case CPU_STARTING:
> +        rc =3D vgein_init(cpu);
> +        if ( rc )
> +            printk("AIA: failed to init vgein for CPU%u\n", cpu);
> +        break;
> +    }
> +
> +    return notifier_from_errno(rc);
> +}
> +
> +static struct notifier_block cpu_nfb =3D {
> +    =2Enotifier_call =3D cpu_callback,
> +};
> +
>  void __init aia_init(void)
>  {
> +    int rc;
> +
>      if ( !riscv_isa_extension_available(NULL, RISCV_ISA_EXT_ssaia) )
> +    {
> +        dprintk(XENLOG_WARNING, "SSAIA isn't present in riscv,isa\n");
>          return;
> +    }
> +
> +    if ( (rc =3D vgein_init(0)) )

Why `0` rather than smp_processor_id()? As described above vgein_init() re=
ads CSR_HGEIE
of the current hart but stores the result into per_cpu(vgein, cpu), so the=
 two
must agree=2E

> +    {
> +        dprintk(XENLOG_ERR, "vgein_init() failed: %d\n", rc);
> +        return;
> +    }
> =20
>      _aia_usable =3D true;
> +
> +    register_cpu_notifier(&cpu_nfb);
> +}
> +
> +unsigned int vgein_assign(struct vcpu *v)
> +{
> +    unsigned int vgein_id;
> +    struct vgein_ctrl *vgein =3D &per_cpu(vgein, v->processor);

What happens if v->processor change between vgein_assign() and
vgein_release? Because it seems in such case the release will hit a
different pCPU's bitmap: the original bit will leak and an unrelated
CPU's bit will be cleared under another vCPU's feet=2E

> +    unsigned long *bmp =3D &vgein->bmp;
> +    unsigned long flags;
> +
> +    if ( !vgein->geilen )
> +        return 0;
> +
> +    spin_lock_irqsave(&vgein->lock, flags);
> +    /*
> +     * The vgein_id shouldn't be zero, as it will indicate that no gues=
t
> +     * external interrupt source is selected for VS-level external inte=
rrupts
> +     * according to RISC-V privileged spec:
> +     *   Hypervisor Status Register (hstatus) in RISC-V privileged spec=
:
> +     *
> +     *   The VGEIN (Virtual Guest External Interrupt Number) field sele=
cts
> +     *   a guest external interrupt source for VS-level external interr=
upts=2E
> +     *   VGEIN is a WLRL field that must be able to hold values between=
 zero
> +     *   and the maximum guest external interrupt number (known as GEIL=
EN),
> +     *   inclusive=2E
> +     *   When VGEIN=3D0, no guest external interrupt source is selected=
 for
> +     *   VS-level external interrupts=2E
> +     *
> +     * So start to search from bit number 1=2E
> +     */
> +    vgein_id =3D find_next_zero_bit(bmp, vgein->geilen + 1, 1);
> +
> +    if ( vgein_id > vgein->geilen )
> +        vgein_id =3D 0;
> +    else
> +    {

Potential index error, because above you did:

    vgein->owners =3D xvzalloc_array(struct vcpu*, vgein->geilen)

so valid index are 0=2E=2E=2E(vgein->geilen-1)=2E Adopt either
one of those two options:
    1=2E vgein->owners[vgein_id-1] =3D v
    2=2E vgein->owners =3D xvzalloc_array(struct vcpu *, vgein->geilen+1) =
in
       vgein_init()

I think `2` could be better to have vgein->owners replicated hgeie CSR but
it would left the first entry read-only=2E

> +        __set_bit(vgein_id, bmp);
> +        vgein->owners[vgein_id] =3D v;
> +    }
> +
> +    spin_unlock_irqrestore(&vgein->lock, flags);
> +
> +#ifdef VGEIN_DEBUG

VGEIN_DEBUG is not defined anywhere in the patch, please use
gdprintk(XENLOG_DEBUG, =2E=2E=2E) directly, or drop this branch=2E

> +    gprintk(XENLOG_DEBUG, "%s: %pv: vgein_id(%u), xen_cpu%u_bmp=3D%#lx\=
n",
> +           __func__, v, vgein_id, v->processor, *bmp);
> +#endif
> +
> +    return vgein_id;
> +}
> +
> +void vgein_release(struct vcpu *v, unsigned int vgein_id)
> +{
> +    unsigned long flags;
> +    struct vgein_ctrl *vgein =3D &per_cpu(vgein, v->processor);
> +
> +    if ( !vgein_id )
> +        return;
> +
> +    spin_lock_irqsave(&vgein->lock, flags);
> +    __clear_bit(vgein_id, &vgein->bmp);
> +    vgein->owners[vgein_id] =3D NULL;
> +    spin_unlock_irqrestore(&vgein->lock, flags);
> +
> +#ifdef VGEIN_DEBUG
> +    gprintk(XENLOG_DEBUG, "%s: vgein_id(%u), xen_cpu%u_bmp=3D%#lx\n",
> +           __func__, vgein_id, v->processor, vgein->bmp);
> +#endif
>  }
> diff --git a/xen/arch/riscv/include/asm/aia=2Eh b/xen/arch/riscv/include=
/asm/aia=2Eh
> index aaa4bf91fc=2E=2Ec67be0069a 100644
> --- a/xen/arch/riscv/include/asm/aia=2Eh
> +++ b/xen/arch/riscv/include/asm/aia=2Eh
> @@ -3,8 +3,16 @@
>  #ifndef RISCV_AIA_H
>  #define RISCV_AIA_H
> =20
> +#include <xen/percpu=2Eh>

asm/aia=2Eh needs neither <xen/percpu=2Eh> nor <xen/spinlock=2Eh> as struc=
t
vgein_ctrl and the per-CPU variable both live in aia=2Ec=2E Please drop th=
em
and add <xen/percpu=2Eh> in aia=2Ec

--=20
Baptiste Le Duc <baptiste=2Ele-duc@vates=2Etech>


-- 
Baptiste Le Duc | Vates XCP-ng Intern

XCP-ng & Xen Orchestra - Vates =
solutions

web: https://vates=2Etech
---=Part.2011.76c267eae0dd40.19febdfebbd.80b0a5b8f4d6725b=---

