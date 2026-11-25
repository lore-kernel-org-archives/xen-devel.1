Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4DC606A31E
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 23:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mYNxT840
Received: from list by lists.xenproject.org with outflank-mailman.1502910.1698863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWMbD-0005kU-Jh; Wed, 25 Nov 2026 23:40:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1502910.1698863; Wed, 25 Nov 2026 23:40:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWMbD-0005kM-Gj; Wed, 25 Nov 2026 23:40:27 +0000
Received: by outflank-mailman (input) for mailman id 1502910;
 Wed, 25 Nov 2026 23:40:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1xWMbB-0005jB-T0
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 23:40:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWMbB-00DG1q-1X
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 00:40:25 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6b0771d7-bab6-0a2a0a5309dd-0a2a450bae1c-8
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 00:40:25 +0100
Received: from [209.85.208.180] (helo=mail-lj1-f180.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6b0771e8-b7e8-0a2a450b0019-d155d0b4a9e2-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 00:40:24 +0100
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-3ae0a5c1715so65840801fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 15:40:24 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1795650024; cv=none;
        d=google.com; s=arc-20260327;
        b=DmZpDI+SO7Gbef5V4TXiXMHnO8TGrm153Q7ze3FFJYNovYL4qKMhzy0KRMdBR+KQae
         ZBHd1rZcanxw2F2n/uVV68eX603vgOnGsm8F0GcCvD5IBANWZRwbmdud1mL99sPoA/Cs
         uqfuT0nQdIkHnkUZ/CW80LUucclh53o+nIzBVteFnWiAMPgaTiU+j6Rg49ysjdvyB2Pp
         AmIwKuTJzMoRUXGJPMmBJcmhJP0DAJKgPNqdkKNMg6+3wMUxfQ3ZE+Xs0Ohd1DGTphLl
         m8xabffRr6bF7KwzFUMAKXvYkdOhCAghq8kxfx30CgnAg79VZPHl+21mcOt0JOvUQjKV
         x4Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pttVqjM6IwRkpX6Ilg7/uYkQQAtqqrWRDOkoXNgBO5k=;
        fh=F3RNbjY7HGhv1K80flmiFZpRiz/hLFdWKtGPVcWuod8=;
        b=WhU5bmSDxyCz4xf+H1+YmjSoKj8uEbJ4Qb91ihuoEhl8f6FSr0N7OvYKlhSQcqrUSZ
         JMq18OgaaAZCPAl4XMy1pBMYpGYB/MnO6S4yisiPXESUOyU2xOGZb8ZCLutKpgJW7Znn
         cyGUd8GRtsD0dvC5xee+aotPhUsYA4xQcbyjeo4LJC6M9RlrKxonzIphGTVKmcadSCVR
         qpI7PCF+IeJibLLjeKnm9leJodE0C4URlf9j3np6mLEC9OQvST/TxsIe2rCxjYd6NKHw
         V5JwinMgJNyP5N9QBF48kUYJcaa3L5rOCXlWJJbo13SYOa1+xVpZeeUcZ7IuDR4wZcse
         cN6A==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795650024; x=1796254824; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pttVqjM6IwRkpX6Ilg7/uYkQQAtqqrWRDOkoXNgBO5k=;
        b=mYNxT840UJirjxfpJ44QALN7iR6ACPMvqyjx+TxGbPgA/mlrSzG2O2Vbx2ZfK92q32
         nXIPNM1V6ZJ97B3dFLFfxJF0dDhX3z32+ipTpXbeaBP/U1NqGYc7zoT2nIN8V5QNCjuk
         tYLr/C+Sxz+skfPpv0pzpGaXzUb2bAa90m0afMNCkCvUk5HvzxWdOUVfj3YnVkuzl7ro
         sqmNQ+tccp78d4mZoU0VkBvnXIopRk6I6a4wxGqJz1jtIkjN+rO0a/vmKiQGYp/YjSjv
         hTmv9NA6vBFcb/nDC5VQ9BrNgv5iH38uwVkwNbE+ShIzZATQHE2/jwo/wdUvJxDLmHis
         xZBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795650024; x=1796254824;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pttVqjM6IwRkpX6Ilg7/uYkQQAtqqrWRDOkoXNgBO5k=;
        b=KymDUn5HXs3RJ3RiDbh5DDkYxOAdWbrpGJrzSdi5H/rRQeA4Y6IXdsVrr1Z15yhhDy
         xmMGarSNp83TKjaxSdyiInBWhCQm5niq41ZL7HIgZbiGEFn7FhY5Ny1nDlNjB07yTJyI
         CQUac8i9dccHqlySNXx/u+sdBUcrNbLfYHJV0MzhgAth3VMqHbdLCDOZamJqLe0VIgD5
         U+xaTB+6j0GR15i3gAmuchaq7ybzy0FNCCufhW8uKAgi7qL6cPjzJztkzeb+HBer6xNv
         4zccGlMKCf7GqAYr784UkWRIpJ0uVD5Ig5mgkInJKvg9meVbTOqxcWD0WvX+3mE4VoMM
         BQfA==
X-Gm-Message-State: APuU4Z9iRSMwvIywpJSfRSR/iqXFkqlu1voorb5mjvmU/94958hkIiBN
	8wip6wCQt9mRBGDFbIplH0RJlKV3dAMP06Dqlz0vymrUL/O2spVVzNOr9hVZCUTRL0vzZwaW+Uk
	JQLC0tur6T4JA+u5eMWFvOnfWsPIyyd0=
X-Gm-Gg: AZFdTZcppipH0twMi7hrFNipXzyDSFt9sKIZsftdcUMRI9rxU7Gmauaj/5qn3A2xFCy
	rT94s9o+S0lpyXKhdbbcd3wPHx0vtBPhMdDa17OrQmMX0KD9tMlgr/VgqHNRPnfm13876rLhDt1
	WnUOywMlugk5BwyFtdsY8eZGE7DqtnNVqnHU7rBSdI+7PegOkRRRHdfPr0e/JqRqRZiFCJW7eNS
	hXPnUOHFK+apzL8nvilBru+MNcdROHzeFCBjAM7FiEF5gkNsqZFKWwPtP3rdTmPDXB/9fVO2kEo
	KTcDmxmfSB8x871DyjQ09HsEbV183azS9+S+F3gYlVvdSRD8ov8TJwWd53F5HyMAopdnbrTyCbv
	g6q9FBQGZwu5ZxWfMB+Rsr6eNGj3a08hvJA==
X-Received: by 2002:a05:651c:a32e:b0:3ad:fd26:fd2a with SMTP id
 38308e7fff4ca-3ae7b7b7c75mr52834941fa.7.1795650024110; Wed, 25 Nov 2026
 15:40:24 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1788268510.git.bertrand.marquis@arm.com> <5c332672f58b0f2280d28a1682d53e91f576df17.1788268510.git.bertrand.marquis@arm.com>
In-Reply-To: <5c332672f58b0f2280d28a1682d53e91f576df17.1788268510.git.bertrand.marquis@arm.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 26 Nov 2026 01:40:13 +0200
X-Gm-Features: Aa3M54r9H8EtJ1squydojVr6to0JMhOtOJe0P1bPZEUtv8WU29Ou0dHbBjBj0Fs
Message-ID: <CAGeoDV-roYcPDvMsgjc+zq1aY_OzAWOk+G8poB2gT52mnqWPGA@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] xen/arm: ffa: Fix NPI injection when vcpu0 is offline
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Jens Wiklander <jenswi@kernel.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Michal Orzel <michal.orzel@amd.com>, Jens Wiklander <jens.wiklander@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-42698a/1795650025-1A2C49EA-E3B0470C/0/0
X-purgate-type: clean
X-purgate-size: 3869
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Bertrand,

Thank you for the patch.

On Thu, Sep 3, 2026 at 5:43=E2=80=AFPM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> RX-buffer-full notifications currently inject the notification pending
> interrupt through vcpu0 only. Secure notification delivery already walks
> the domain's online vCPUs, but the RX-buffer-full path does not. When
> vcpu0 is offline, the notification remains pending and the guest never
> receives it.
>
> Extract the common notification injection path and reuse it from
> ffa_raise_rx_buffer_full(). The shared helper delivers the global
> notification to the first online vCPU and keeps the existing ratelimited
> debug message when none are online.
>
> Functional impact: RX-buffer-full notifications are delivered even when
> vcpu0 is offline.
>
> Fixes: 3935c705688e ("xen/arm: ffa: Add buffer full notification support"=
)
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Acked-by: Mykola Kvach <mykola_kvach@epam.com>

Best regards,
Mykola

> ---
> Changes since v2:
> - none
> Changes since v1:
> - add R-b from Jens
> ---
>  xen/arch/arm/tee/ffa_notif.c | 45 ++++++++++++++++++++----------------
>  1 file changed, 25 insertions(+), 20 deletions(-)
>
> diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
> index 186e72641237..07bc5cb3a430 100644
> --- a/xen/arch/arm/tee/ffa_notif.c
> +++ b/xen/arch/arm/tee/ffa_notif.c
> @@ -19,6 +19,29 @@
>  static bool __ro_after_init fw_notif_enabled;
>  static unsigned int __ro_after_init notif_sri_irq;
>
> +static void inject_notif_pending(struct domain *d)
> +{
> +    struct vcpu *v;
> +
> +    /*
> +     * Since we're only delivering global notification, always
> +     * deliver to the first online vCPU. It doesn't matter
> +     * which we chose, as long as it's available.
> +     */
> +    for_each_vcpu(d, v)
> +    {
> +        if ( is_vcpu_online(v) )
> +        {
> +            vgic_inject_irq(d, v, GUEST_FFA_NOTIF_PEND_INTR_ID, true);
> +            return;
> +        }
> +    }
> +
> +    if ( printk_ratelimit() )
> +        printk(XENLOG_G_DEBUG "%pd: ffa: can't inject NPI, all vCPUs off=
line\n",
> +               d);
> +}
> +
>  int32_t ffa_handle_notification_bind(struct cpu_user_regs *regs)
>  {
>      struct domain *d =3D current->domain;
> @@ -190,7 +213,7 @@ void ffa_raise_rx_buffer_full(struct domain *d)
>
>      ACCESS_ONCE(ctx->notif.buff_full_pending) =3D true;
>      if ( !test_and_set_bool(ctx->notif.vm_pending) )
> -        vgic_inject_irq(d, d->vcpu[0], GUEST_FFA_NOTIF_PEND_INTR_ID, tru=
e);
> +        inject_notif_pending(d);
>  }
>  #endif
>
> @@ -238,7 +261,6 @@ static void notif_vm_pend_intr(uint16_t vm_id)
>  {
>      struct ffa_ctx *ctx;
>      struct domain *d;
> -    struct vcpu *v;
>
>      /*
>       * vm_id =3D=3D 0 means a notifications pending for Xen itself, but
> @@ -277,24 +299,7 @@ static void notif_vm_pend_intr(uint16_t vm_id)
>       * it.
>       */
>      ACCESS_ONCE(ctx->notif.secure_pending) =3D true;
> -
> -    /*
> -     * Since we're only delivering global notification, always
> -     * deliver to the first online vCPU. It doesn't matter
> -     * which we chose, as long as it's available.
> -     */
> -    for_each_vcpu(d, v)
> -    {
> -        if ( is_vcpu_online(v) )
> -        {
> -            vgic_inject_irq(d, v, GUEST_FFA_NOTIF_PEND_INTR_ID,
> -                            true);
> -            break;
> -        }
> -    }
> -    if ( !v && printk_ratelimit() )
> -        printk(XENLOG_G_DEBUG "%pd: ffa: can't inject NPI, all vCPUs off=
line\n",
> -               d);
> +    inject_notif_pending(d);
>
>  out_unlock:
>      rcu_unlock_domain(d);
> --
> 2.53.0
>
>

