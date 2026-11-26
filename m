Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340B7606A321
	for <xen-devel@archiver.kernel.org>; Thu, 26 Nov 2026 03:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k00u1rNw
Received: from list by lists.xenproject.org with outflank-mailman.1503013.1698907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWPkA-00067p-Ie; Thu, 26 Nov 2026 03:01:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1503013.1698907; Thu, 26 Nov 2026 03:01:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWPkA-00067i-Fa; Thu, 26 Nov 2026 03:01:54 +0000
Received: by outflank-mailman (input) for mailman id 1503013;
 Thu, 26 Nov 2026 03:01:52 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1xWPk8-00067Y-Kn
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 03:01:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWPk7-00Aiif-Ic
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 04:01:51 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6b07a10d-bab6-0a2a0a5309dd-0a2a45049b80-8
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 04:01:51 +0100
Received: from [209.85.208.179] (helo=mail-lj1-f179.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6b07a11f-b57f-0a2a45040019-d155d0b3d007-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 04:01:51 +0100
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-3acd523a802so56496031fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 19:01:51 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1795662111; cv=none;
        d=google.com; s=arc-20260327;
        b=dhDxM8+8OeSwszU9FQp+aTuHtnV09PR+jxcnr6CLIOFfPBJJOAV+Qi/p6N/9xM+m+j
         BdnQhL+2La+mBA/5Ps7l1SFqhpxMaKX58lOYU3BgFgl4i4cL5vyYDrfr32k1DPikZwL+
         /3HVVdEuieBFvkKFwyfGeDIw+HMpbVieizTHgny368jIZLRPKlCyXNstoTG0BISzUUdl
         Oq06jjzdz+GrEg3+92oyP8GC+rSrviCFrOPLtCQTALSerNW9LN5cdtXk43ASQdDdtPwd
         J4pqlcWVzTc9fzlm09Kjkp5+faLzO2anvTfO+pQo1aU8N4t8+CqpUNiF4gWa7EBDEwai
         KPaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jL5TAhIxfCydDUFGUwtSL9jaxs1YribNpw7SOU57PeM=;
        fh=F3RNbjY7HGhv1K80flmiFZpRiz/hLFdWKtGPVcWuod8=;
        b=dkG+CejKFCW+FNljlIOq/D8hlGmvpMtB0kJ8JUAiAvOBQp4imTjygiHcr9SWq0q7jm
         YflquU8gFTch8x69BzVfzy3UbeUUDOhiZzKQPmBH19hCSPZLB+Au/xUHIas4e5cZQ79L
         eLtVIO9iJd2ZhD94Jr32WtfMpBEjURi038F0r14VYgEoajtBy815uO4F+k74XRZEu6Dj
         p1R3Celki6QPAxj0kdXImLyl6iKGNIuUIGR0Hu/xEbAzkLtnriGrEBmg2vTzDQvy2pPn
         je7ISc636DuL0UNaCFXcEWrD/DGLLsRyeaxjyrbXJ4N7uk/QPZ7gqtLpKR1UAqFyIxA4
         584A==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795662111; x=1796266911; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jL5TAhIxfCydDUFGUwtSL9jaxs1YribNpw7SOU57PeM=;
        b=k00u1rNw4Fj1md3iv2zm8gZgF/Yk7Jjh6TgeExPPWaQAxnEXDYKa6EsgXbaDw6sNKK
         fGFIp9INypLP8m0nQUeWPAl/xHF0eflZ9hGQHmOjmX5101TVp5VtV4IIuwVgtagrPE3s
         9RoFZ6QEovXQfxjEg0XvcgKzaDaFxuuZtduT89vp94ULlDIl0KH1D5AYiIwH1cUUfl6X
         Ox6ncxV0QpNnFGfHNsNrY5RePlUNbtr/Th/KVY7VktYxBlVBkohm8kfioDwaYZO7Jqhz
         avwiQzZTrhEfuoClTzGIacGfTMCPHUo1Pr7OH1CTpvHZSOhsiqi61n5Zsrz8rX0Qdztr
         3rEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795662111; x=1796266911;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jL5TAhIxfCydDUFGUwtSL9jaxs1YribNpw7SOU57PeM=;
        b=DBSpQEAzst1si+HJCy+iaYGdMbQWrcbaJwXyoVFzaVZvpj5z3nMupK40oUfqdsFCns
         qmRTupeN7YE9HcA8PJxvMsQFv26xvs5vAmiyb0mGhwwfke7hs6oGIhN8dq1N9YXmnfph
         veC51csTVpdswTxqR8soUeNfB03DpW5LqrScSWFqyXzN4ThnhcGz+kafWkgH2fVdyNhE
         hhslXgrqeafgJfezkU2niPUcJT+nBn3FKA87J4IC8SXyDicMDL4hNDxE3F52aTfe68W8
         t3LJirEAfc0A0swa83pdQw89jM6zaGc+e4dG5WflNJA9N2syDoMLXBd+oJ90znJ0NGSY
         zl1Q==
X-Gm-Message-State: APuU4Z+uZs7osfxMsaIZwt65lwlScklpMulW5JFWggorqZsh6RmHSFjE
	bwmSmqQDgGyxHhhlCu2yWldarYRfrX7oB2USbg0S6X3Q4ldDFB4cIsviKjogQ9Lq/HytLL/t00s
	GAXaxvVWzXsyRW6BOZRZZ5AxuRLD0fxVRM6k4
X-Gm-Gg: AZFdTZe6cH6QHJ5i4Cw8MMP0ZaIIrYMEWLIaGFU+2qn/pZBbLz4bRuf1awcj7RlLgqT
	4U+6jMtIhVa68i4IQWvnagU7zhRf/+Oekcdtp7hyaarLwlUTlINzX0/O0tTOCgTsVvN8+vrEDKI
	fi44Dgvta5THsumTh08RvzW2MLhdf3wITnmaTYn2+qVZ89XYnEWPgG24y1Kd7d5Ef3B+3EsIi+O
	SFh7q8Ipya5NnhsyXuGsHDwNpyoAh+pRRCmhMv1gdho4bcNrFEQWtZSzp/KxRW5W4LtV2u/q00+
	JxCTPjDRzmJJpoeBbaPgn4ODqJfmN9WNHQJqx26arNvUNFikDvQyJl7BVacwokHo2VObawQOxsE
	VuBc1W13qFABSNbG78/bjkK+TiHrRKtXj/jY=
X-Received: by 2002:a05:651c:2103:b0:3ac:e0a2:1438 with SMTP id
 38308e7fff4ca-3ae7fa93b85mr57171801fa.29.1795662110596; Wed, 25 Nov 2026
 19:01:50 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1788268510.git.bertrand.marquis@arm.com> <980875f99fe01ea85f2e453ea447fd14f07c5f5a.1788268510.git.bertrand.marquis@arm.com>
In-Reply-To: <980875f99fe01ea85f2e453ea447fd14f07c5f5a.1788268510.git.bertrand.marquis@arm.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 26 Nov 2026 05:01:39 +0200
X-Gm-Features: Aa3M54pNU0N-vID3clVx4IGjGcD74fnkYWJm4yFvgAfGqhj-aqvUyKkkna_isv4
Message-ID: <CAGeoDV-d0VYQjdMdh25+=GFd0_==n05_-buBCE=7nURmqLQ+JQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] xen/arm: ffa: Tighten notification parameter validation
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Jens Wiklander <jenswi@kernel.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Michal Orzel <michal.orzel@amd.com>, Jens Wiklander <jens.wiklander@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ebf023/1795662111-52CCFB50-481A9E83/0/0
X-purgate-type: clean
X-purgate-size: 7503
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Bertrand,

Thank you for the patch.

On Thu, Sep 3, 2026 at 5:44=E2=80=AFPM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> The notification handlers still validate overlapping subsets of their
> inputs. BIND, UNBIND, and SET each decode caller and destination IDs
> locally, GET still accepts a non-zero receiver vCPU ID and reserved flag
> bits, and SET still accepts non-zero NS-virtual flags. BIND also treats
> unsupported non-zero flag encodings as a supported-feature failure
> instead of as malformed input.
>
> Add ffa_notif_validate_params() and use it to centralize the common
> caller/destination and non-zero bitmap checks for BIND, UNBIND, and SET.
> Also reject malformed GET and SET requests locally before touching
> cached state or forwarding anything to the SPMC. Keep BIND limited to
> global notifications and reject unsupported non-zero flag encodings with
> INVALID_PARAMETERS.
>
> - add a shared parameter validator for notification caller/destination
>   checks
> - wire BIND and UNBIND through the shared helper and reject unsupported
>   bind flag encodings with INVALID_PARAMETERS
> - reject non-zero receiver vCPU and reserved flag bits in
>   FFA_NOTIFICATION_GET
> - reject non-zero flags in the NS-virtual FFA_NOTIFICATION_SET path
>
> Functional impact: malformed notification requests are rejected
> consistently earlier in the mediator.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
> Changes since v2:
> - none
> Changes since v1:
> - rename helper to ffa_notif_validate_params()
> - add R-b from Jens
> ---
>  xen/arch/arm/tee/ffa_notif.c | 61 +++++++++++++++++++++++++++++-------
>  1 file changed, 50 insertions(+), 11 deletions(-)
>
> diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
> index a631481e3815..1260f98a77e9 100644
> --- a/xen/arch/arm/tee/ffa_notif.c
> +++ b/xen/arch/arm/tee/ffa_notif.c
> @@ -44,21 +44,40 @@ static bool inject_notif_pending(struct domain *d)
>      return false;
>  }
>
> +static int32_t ffa_notif_validate_params(uint16_t dom_id, uint16_t calle=
r_id,
> +                                         uint16_t dest_id, uint32_t bitm=
ap_lo,
> +                                         uint32_t bitmap_hi)
> +{
> +    if ( caller_id !=3D dom_id || dest_id =3D=3D dom_id || !dest_id )
> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    if ( !bitmap_lo && !bitmap_hi )
> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    return FFA_RET_OK;
> +}
> +
>  int32_t ffa_handle_notification_bind(struct cpu_user_regs *regs)
>  {
>      struct domain *d =3D current->domain;
> +    struct ffa_ctx *ctx =3D d->arch.tee;
> +    int32_t ret;
>      uint32_t src_dst =3D get_user_reg(regs, 1);
>      uint32_t flags =3D get_user_reg(regs, 2);
>      uint32_t bitmap_lo =3D get_user_reg(regs, 3);
>      uint32_t bitmap_hi =3D get_user_reg(regs, 4);
> +    uint16_t caller_id =3D src_dst & GENMASK(15, 0);
> +    uint16_t dest_id =3D src_dst >> 16;
>
> -    if ( (src_dst & GENMASK(15, 0)) !=3D ffa_get_vm_id(d) )
> +    if ( flags )    /* Only global notifications are supported */
>          return FFA_RET_INVALID_PARAMETERS;
>
> -    if ( flags )    /* Only global notifications are supported */
> -        return FFA_RET_DENIED;
> +    ret =3D ffa_notif_validate_params(ctx->ffa_id, caller_id, dest_id,
> +                                    bitmap_lo, bitmap_hi);
> +    if ( ret )
> +        return ret;
>
> -    if ( FFA_ID_IS_SECURE(src_dst >> 16) && fw_notif_enabled )
> +    if ( FFA_ID_IS_SECURE(dest_id) && fw_notif_enabled )
>          return ffa_simple_call(FFA_NOTIFICATION_BIND, src_dst, flags,
>                                 bitmap_lo, bitmap_hi);
>
> @@ -68,16 +87,22 @@ int32_t ffa_handle_notification_bind(struct cpu_user_=
regs *regs)
>  int32_t ffa_handle_notification_unbind(struct cpu_user_regs *regs)
>  {
>      struct domain *d =3D current->domain;
> +    struct ffa_ctx *ctx =3D d->arch.tee;
> +    int32_t ret;
>      uint32_t src_dst =3D get_user_reg(regs, 1);
>      uint32_t bitmap_lo =3D get_user_reg(regs, 3);
>      uint32_t bitmap_hi =3D get_user_reg(regs, 4);
> +    uint16_t caller_id =3D src_dst & GENMASK(15, 0);
> +    uint16_t dest_id =3D src_dst >> 16;
>
> -    if ( (src_dst & GENMASK(15, 0)) !=3D ffa_get_vm_id(d) )
> -        return FFA_RET_INVALID_PARAMETERS;
> +    ret =3D ffa_notif_validate_params(ctx->ffa_id, caller_id, dest_id,
> +                                    bitmap_lo, bitmap_hi);
> +    if ( ret )
> +        return ret;
>
> -    if ( FFA_ID_IS_SECURE(src_dst >> 16) && fw_notif_enabled )
> -        return  ffa_simple_call(FFA_NOTIFICATION_UNBIND, src_dst, 0, bit=
map_lo,
> -                                bitmap_hi);
> +    if ( FFA_ID_IS_SECURE(dest_id) && fw_notif_enabled )
> +        return ffa_simple_call(FFA_NOTIFICATION_UNBIND, src_dst, 0, bitm=
ap_lo,
> +                               bitmap_hi);
>
>      return FFA_RET_NOT_SUPPORTED;
>  }
> @@ -144,6 +169,12 @@ void ffa_handle_notification_get(struct cpu_user_reg=
s *regs)
>          return;
>      }
>
> +    if ( recv >> 16 || (flags & GENMASK(31, 4)) )

w1 bits [31:16] are the receiver vCPU ID (DEN0077A 1.2, Table 16.23).
Linux always puts smp_processor_id() in this field
(ffa_notification_get() in drivers/firmware/arm_ffa/driver.c), even for
a VM that only has global bindings.

For example, vCPU0 is offline and inject_notif_pending() sends the NPI
to vCPU1. Linux handles the NPI on vCPU1 and calls GET from there, so
the vCPU ID in w1 is non-zero. This check returns
FFA_RET_INVALID_PARAMETERS before the guest can read any bitmap. Patch
1/6 delivers the RX-buffer-full NPI to vCPU1 in exactly this case, and
that notification lives in Xen's local hyp_pending bitmap, so GET has
to work there too.

Can we check the reserved bits in flags separately and accept
a non-zero receiver vCPU ID (or at most reject values >=3D d->max_vcpus)?

When forwarding to the SPMC I would mask the field to vCPU0, since Xen
only tracks global notifications.

Best regards,
Mykola

> +    {
> +        ffa_set_regs_error(regs, FFA_RET_INVALID_PARAMETERS);
> +        return;
> +    }
> +
>      if ( fw_notif_enabled && (flags & ( FFA_NOTIF_FLAG_BITMAP_SP |
>                                          FFA_NOTIF_FLAG_BITMAP_SPM )) )
>      {
> @@ -208,11 +239,19 @@ int32_t ffa_handle_notification_set(struct cpu_user=
_regs *regs)
>      uint32_t flags =3D get_user_reg(regs, 2);
>      uint32_t bitmap_lo =3D get_user_reg(regs, 3);
>      uint32_t bitmap_hi =3D get_user_reg(regs, 4);
> +    uint16_t caller_id =3D src_dst >> 16;
> +    uint16_t dest_id =3D src_dst & GENMASK(15, 0);
> +    int32_t ret;
> +
> +    ret =3D ffa_notif_validate_params(ffa_get_vm_id(d), caller_id, dest_=
id,
> +                                    bitmap_lo, bitmap_hi);
> +    if ( ret )
> +        return ret;
>
> -    if ( (src_dst >> 16) !=3D ffa_get_vm_id(d) )
> +    if ( flags )
>          return FFA_RET_INVALID_PARAMETERS;
>
> -    if ( FFA_ID_IS_SECURE(src_dst & GENMASK(15, 0)) && fw_notif_enabled =
)
> +    if ( FFA_ID_IS_SECURE(dest_id) && fw_notif_enabled )
>          return ffa_simple_call(FFA_NOTIFICATION_SET, src_dst, flags, bit=
map_lo,
>                                 bitmap_hi);
>
> --
> 2.53.0
>
>

