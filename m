Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF4BC61DD3
	for <xen-devel@archiver.kernel.org>; Fri, 28 Aug 2026 14:11:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1402083.1637492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzxIw-0007nz-QX; Fri, 28 Aug 2026 14:11:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1402083.1637492; Fri, 28 Aug 2026 14:11:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzxIw-0007ns-Np; Fri, 28 Aug 2026 14:11:38 +0000
Received: by outflank-mailman (input) for mailman id 1402083;
 Fri, 28 Aug 2026 14:11:37 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a048b62786000c4f3@swg.vates.tech>)
 id 1wzxIv-0007nk-Of
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 14:11:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzxIu-00Es1L-Oi
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 16:11:36 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a048b62786000c4f3@swg.vates.tech>)
 id 6a9196fe-8faa-0a2a0a5109dd-0a2a4506b868-42
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 16:11:35 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a048b62786000c4f3@swg.vates.tech>)
 id 6a919717-195a-0a2a45060019-b9ff1c128785-3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 16:11:35 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a048b62786000c4f3.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 28 Aug 2026 14:11:32 +0000
Received: from [192.168.1.61] (155.223.66.37.rev.sfr.net [37.66.223.155])
 (Authenticated sender: ngoc-tu.dinh@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 860F68216A;
 Fri, 28 Aug 2026 16:11:31 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=VxmWDfJtlB0dkwWyCQO3L8MJsVB8b2LRUg0zU+QIpR0=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=op9YyOcLbW0TWE5efNR2VbjnxNz3q4981VTx93FGx2CazkjMuXUrSJqF3orc5hLEWHy8kGQye
 jLy30kBet7ZkpGO9zFsxjEfNm4BCG/xg6ojWh4f/oFeJcKng/QI4iZNjAZaedO2LG/c0Hl3Fa5h
 2VN0ZjIJPP79nsXthb7agz71ncGlk7iPaV5zs3Tpg9v7fSQdMbD/9f7o/Ih0bRAtSUQoU8z9MiF
 AXyyyxEVrw4G7RWFT4TBremZQK+P6ElWD5tME4hvaLcETMlrQnCAn5zSBBgBkrg7kgsL83woOtE
 BDthZtJSfhK6ohsxhonPzOsUS71Acc29Rz1ddhnis87A==
X-Zone-Loop: 857b3988dfb4258490c3879eb8e7ee6805148c592df6
x-campaign-type: default
x-transaction-id: 2b57d0b7-c462-4ecc-86e1-2e270c973c9e
x-swg-uid: 01-dfaa2133-006a-45e2-b04f-e1b413a77928
X-Mailer: Sweego
Message-ID:
 <1787926292.8631fc262581453bbf619ec5b2062170.1a048b62786000c4f3@vates.tech>
x-swg-bid: 1787926292.8631fc262581453bbf619ec5b2062170.1a048b62786000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Fri, 28 Aug 2026 16:11:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] x86/viridian: Implement synthetic timer direct
 mode
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
Cc: Paul Durrant <paul@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>
References: <20260828131142.3986110-1-ross.lagerwall@citrix.com>
 <20260828131142.3986110-3-ross.lagerwall@citrix.com>
Content-Language: en-US
From: Tu Dinh <ngoc-tu.dinh@vates.tech>
In-Reply-To: <20260828131142.3986110-3-ross.lagerwall@citrix.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.2ebd.7f5d65a1bc14b01c.1a048b624d1.6e8dfc61ff02ff0b=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1787926291665
X-purgate-ID: tlsNG-16d1c6/1787926295-FD00977B-F04FB893/0/0
X-purgate-type: clean
X-purgate-size: 4732

---=Part.2ebd.7f5d65a1bc14b01c.1a048b624d1.6e8dfc61ff02ff0b=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 28/08/2026 15:14, Ross Lagerwall wrote:
> In direct mode, the timer asserts an interrupt on expiration rather than
> using a SynIC message=2E It is useful to implement this since Windows 11=
's
> Hyper-V can only use synthetic timers in direct mode=2E

Hello, is this new behavior compared to Server 2025? What happens if=20
direct mode is not available, does it fall back to disabling stimer?

>=20
> Signed-off-by: Ross Lagerwall <ross=2Elagerwall@citrix=2Ecom>
> ---
>=20
> Should this use a new Viridian feature bit or is it OK to use the
> existing stimer bit?
>=20
>   xen/arch/x86/hvm/viridian/time=2Ec     | 25 +++++++++++++++++++------
>   xen/arch/x86/hvm/viridian/viridian=2Ec |  3 +++
>   2 files changed, 22 insertions(+), 6 deletions(-)
>=20
> diff --git a/xen/arch/x86/hvm/viridian/time=2Ec b/xen/arch/x86/hvm/virid=
ian/time=2Ec
> index 082528dc9416=2E=2E2b0ac3eac963 100644
> --- a/xen/arch/x86/hvm/viridian/time=2Ec
> +++ b/xen/arch/x86/hvm/viridian/time=2Ec
> @@ -223,6 +223,14 @@ static void start_stimer(struct viridian_stimer *vs=
)
>       set_timer(&vs->timer, timeout + NOW());
>   }
>  =20
> +static void stimer_deliver_direct(struct vcpu *v, struct viridian_stime=
r *vs)
> +{
> +    struct vlapic *vlapic =3D vcpu_vlapic(v);
> +
> +    if ( vlapic_enabled(vlapic) )
> +        vlapic_set_irq(vcpu_vlapic(v), vs->config=2Eapic_vector, 0);
> +}
> +
>   static void poll_stimer(struct vcpu *v, unsigned int stimerx)
>   {
>       struct viridian_vcpu *vv =3D v->arch=2Ehvm=2Eviridian;
> @@ -242,9 +250,11 @@ static void poll_stimer(struct vcpu *v, unsigned in=
t stimerx)
>       if ( !test_bit(stimerx, &vv->stimer_pending) )
>           return;
>  =20
> -    if ( !viridian_synic_deliver_timer_msg(v, vs->config=2Esintx,
> -                                           stimerx, vs->expiration,
> -                                           time_ref_count(v->domain)) )
> +    if ( vs->config=2Edirect_mode )
> +        stimer_deliver_direct(v, vs);
> +    else if ( !viridian_synic_deliver_timer_msg(v, vs->config=2Esintx,
> +                                                stimerx, vs->expiration=
,
> +                                                time_ref_count(v->domai=
n)) )
>           return;
>  =20
>       clear_bit(stimerx, &vv->stimer_pending);
> @@ -372,7 +382,7 @@ int viridian_time_wrmsr(struct vcpu *v, uint32_t idx=
, uint64_t val)
>  =20
>           vs->config=2Eas_uint64 =3D val;
>  =20
> -        if ( !vs->config=2Esintx || !vs->count )
> +        if ( (!vs->config=2Edirect_mode && !vs->config=2Esintx) || !vs-=
>count )
>               vs->config=2Eenable =3D 0;
>  =20
>           if ( vs->config=2Eenable )
> @@ -583,8 +593,11 @@ void viridian_time_load_vcpu_ctxt(
>  =20
>           vs->config=2Eas_uint64 =3D ctxt->stimer_config_msr[i];
>           vs->count =3D ctxt->stimer_count_msr[i];
> -        if ( !vs->config=2Esintx || !vs->count )
> -            /* Reject enabling with a zero sintx or count fields=2E */
> +        if ( (!vs->config=2Edirect_mode && !vs->config=2Esintx) || !vs-=
>count )
> +            /*
> +             * Reject enabling with a zero sintx (if not using direct m=
ode) or
> +             * zero count field=2E
> +             */
>               vs->config=2Eenable =3D 0;
>       }
>   }
> diff --git a/xen/arch/x86/hvm/viridian/viridian=2Ec b/xen/arch/x86/hvm/v=
iridian/viridian=2Ec
> index 90e749ceb581=2E=2E99192e8d077d 100644
> --- a/xen/arch/x86/hvm/viridian/viridian=2Ec
> +++ b/xen/arch/x86/hvm/viridian/viridian=2Ec
> @@ -78,6 +78,7 @@ typedef union _HV_CRASH_CTL_REG_CONTENTS
>   #define CPUID3D_CPU_DYNAMIC_PARTITIONING (1 << 3)
>   #define CPUID3D_CRASH_MSRS (1 << 10)
>   #define CPUID3D_SINT_POLLING (1 << 17)
> +#define CPUID3D_STIMER_DIRECT_MODE (1 << 19)
>  =20
>   /* Viridian CPUID leaf 4: Implementation Recommendations=2E */
>   #define CPUID4A_HCALL_REMOTE_TLB_FLUSH (1 << 2)
> @@ -185,6 +186,8 @@ void cpuid_viridian_leaves(const struct vcpu *v, uin=
t32_t leaf,
>               res->d |=3D CPUID3D_CRASH_MSRS;
>           if ( viridian_feature_mask(d) & HVMPV_synic )
>               res->d |=3D CPUID3D_SINT_POLLING;
> +        if ( viridian_feature_mask(d) & HVMPV_stimer )
> +            res->d |=3D CPUID3D_STIMER_DIRECT_MODE;
>  =20
>           break;
>       }



-- 
Ngoc Tu Dinh | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates =
solutions

web: https://vates=2Etech
---=Part.2ebd.7f5d65a1bc14b01c.1a048b624d1.6e8dfc61ff02ff0b=---

