Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9CF606A31E
	for <xen-devel@archiver.kernel.org>; Thu, 26 Nov 2026 00:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i2MigzQG
Received: from list by lists.xenproject.org with outflank-mailman.1502929.1698880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWNMZ-0005bl-VH; Thu, 26 Nov 2026 00:29:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1502929.1698880; Thu, 26 Nov 2026 00:29:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWNMZ-0005bd-Re; Thu, 26 Nov 2026 00:29:23 +0000
Received: by outflank-mailman (input) for mailman id 1502929;
 Thu, 26 Nov 2026 00:29:23 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1xWNMY-0005bX-SU
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 00:29:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWNMX-00EmUe-UL
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 01:29:21 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6b077cdd-2eae-0a2a0a5409dd-0a2a450bdb60-20
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 01:29:21 +0100
Received: from [209.85.208.171] (helo=mail-lj1-f171.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6b077d61-b7e8-0a2a450b0019-d155d0aba412-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 01:29:21 +0100
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-3ada7d53082so70469601fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 16:29:21 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1795652961; cv=none;
        d=google.com; s=arc-20260327;
        b=G4+yu3zwvAt3hIpQP3kH8vCDqFzhuBubn4pjohJjDVKXKjvIvMhC/nWSaaBTsGIAnH
         jwkP4uTAmqGr25JEBO5O9AnUz8cKCOko0mMbadpNScF9Ny6RnZTwOS1fI/1i5li2mWcI
         1PNRBDxwmtxjtoMB6+sMOjXlRzZOD+oQWhwaM0xS8BiPJYDK1n+1PvTdR6rLWEUXSkKG
         Gpy1usDtksra/8Ped/zBYxcPmIgfCBIjH8r9q8Vyj8e9VtDlArPSB6UgP/FbMcfjbxN/
         XVmiE9f2xW6d0z2O86+ILJUGzksVuFYsSCUrjLJeXRe0Nw+XyiJp1aJsZyDsfHtXaH0u
         9Kag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lY7D/M8OX0FLWB39ISehQtqHLeLzhUeSBSpAYZK+nHo=;
        fh=F3RNbjY7HGhv1K80flmiFZpRiz/hLFdWKtGPVcWuod8=;
        b=q/5Zvmc3psWZ0IyviKwzycJsLasR83RtKOVnDOryT2VeVp7IlDRgKFc6CuLDwhOZdm
         B4zcW4JRhoMDYMfD01MqqpVTKxl4RX4WWjFYMuwmmrl6+E1eyfKV86Ai2vjLCSkeXGOV
         Q+o83HMednx3oX6W4kTOqJLdMxq0hxeqFjh3jSpqJcoJBAEamzam1S+/+y3EzSdcYqlV
         ipFNInp/heQlOi2uaHEyKdAJuKfrxGUcfYTpXoROprhqsdT9z1wQ++XwQSuAmD+vDOXU
         YYxH770tlFDnZzDKVOdacNpJWeeYQ8urOqosbTdLLhFMU500kJd5DVfUfCvR+7Y3onlA
         3Gxw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795652961; x=1796257761; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lY7D/M8OX0FLWB39ISehQtqHLeLzhUeSBSpAYZK+nHo=;
        b=i2MigzQGuId/Zfx/G0B37v/Z86tITpBVUrtAAXkb165XH3nvrcu+VEiIMlUrgayKHZ
         9QY1pCQkShrf4KYCYYpG/E9ucRDubBdM0bp4RuAzDYKjdjRtpwXrQGZrqOgX5iiKl2NE
         elObED5x22v33wBeNFnA+ZbUvkJ7PiBbhrmne43oKGf5eNP5PxiKoQRyYpymdv7oijNy
         5bv8b9XoZKnD/riusVgebpC81xxozrkilbYi0F2h78kyFC9xRo7kt7KgdKDzV7lUWcGI
         f4eNVc7gt3C/BeXZpmTSubAqiFfh8NIqwLja6R9esdrGzP8JtwiHOLYDPedNviKutoN5
         whsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795652961; x=1796257761;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lY7D/M8OX0FLWB39ISehQtqHLeLzhUeSBSpAYZK+nHo=;
        b=ErWhaYje8vEfF+Gdoj01fAAsy829jPwgL2hatQQss4pEYthdnQgQglpjTtFd5vm8fT
         DLopIxgU8VaJgbaK1+YiSR3qd6+5D4kODNleQGkXkPinV7ou+1JU18Z0ngQLK9uh9QVU
         qE5Y3njyU87h1WbOtt/sGKPJhYOJLHIk0667KfhtiUISQvbHDjyNNe0/02WJsN7X2uly
         5aqFVu7CFNnZh0DsO46qnNp4QsNgg98m0rkF0svDi7VblXM9aM7PORuZH1nIGDSpCHUJ
         +AK9R6mnyGVr/BUP/F3UaCOBDKtgIlMIUxE4umz5iEjcCk6eMWuyPapWm5yc3JqN3Ppl
         J0GQ==
X-Gm-Message-State: APuU4Z+8GyS8TI0fLT5OljKBTHobIBPP9r1xQmI4mXp/nSVDXjce427B
	rWJP2J46DjUxWSaG/610W8LWDnUEAZ/mKrjQgGi6e1f7yu3XWKZQcvj0ViHqJLspRje7BJaaCN6
	QlXfsudYAvVLzAsX423by/FaEgkVmOeLWLbm6
X-Gm-Gg: AZFdTZcygtEn1YWqD0fA1eaE4GF/0iXxE1HTswBPLo2L9bawoJizaKqw2IxCKabYR/l
	M5qpJHg162BWgXOl3avpgNhzW2rXTmGeNqdXBayGmbB9d2c3wsxcBE7jTElLA1qO08hqo9q8iBz
	dx8pPCYN+dPOktwaapt+lbVlHQ9I+lJs9NM258+JbDwnRBP0bXSFnglohSN/6KmP+zBNfB6Nelf
	T7VQNYQUGlKaJ5HDqGO9IMfPnu8t964ij4NtochbdX0KJ+HNspkO4X+m4/dtBaS7aC7J7sQIil9
	z24jiMCaxKd+4u85OdDMiZiwUjObznLLckYBUakNCt+CVdJOGxuaO1G5uLVKC/xOiXGEme3H46j
	kbISNBn6vMVNiRSBjecVu3GpPFK5kCgi0EnAMoSl09XTjt1H99JCKJnk=
X-Received: by 2002:a05:651c:2214:b0:3ae:28ac:6df with SMTP id
 38308e7fff4ca-3ae7fa25a48mr44520041fa.5.1795652960884; Wed, 25 Nov 2026
 16:29:20 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1788268510.git.bertrand.marquis@arm.com> <39cce5e806b7070da7d4a627bd739b7de711db4b.1788268510.git.bertrand.marquis@arm.com>
In-Reply-To: <39cce5e806b7070da7d4a627bd739b7de711db4b.1788268510.git.bertrand.marquis@arm.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 26 Nov 2026 02:29:09 +0200
X-Gm-Features: Aa3M54ow7nws3QKO6aFCQeRSR2X0kUwpnI8cW05mGSxrBzfSBIorFq_CZ9ZVmSY
Message-ID: <CAGeoDV-g-kxvN4cSJmkSk_59e-hZ5KHcoo6oW1VdyZLQrre+aA@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] xen/arm: ffa: Track hypervisor notifications in a bitmap
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Jens Wiklander <jenswi@kernel.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Michal Orzel <michal.orzel@amd.com>, Jens Wiklander <jens.wiklander@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-42698a/1795652961-1BED69EA-DD8E8449/0/0
X-purgate-type: clean
X-purgate-size: 8995
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Bertrand,

On Thu, Sep 3, 2026 at 5:44=E2=80=AFPM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> Hypervisor notifications are currently tracked with a dedicated
> buff_full_pending boolean. The old RX-buffer-full path also exposed a
> pending indication indirectly via vm_pending, so
> FFA_NOTIFICATION_INFO_GET could clear that summary before the guest
> retrieved the Hypervisor notification bitmap with
> FFA_NOTIFICATION_GET.
>
> Replace the single boolean with a Hypervisor notification bitmap
> protected by notif_lock. INFO_GET reports pending when hyp_pending is
> non-zero, GET returns and clears the HYP bitmap under the lock, and
> RX-buffer-full now keeps notif_lock held across the local NPI
> decision. notif_irq_raised is only set when an NPI is actually
> injected, and is cleared once the local pending state is consumed.
>
> Initialize and clear the bitmap during domain lifecycle handling, and
> use ctx->ffa_id for bitmap create and destroy so the notification
> state stays tied to the cached FF-A endpoint ID.
>
> If the local injection attempt fails because no vCPU is online,
> hyp_pending remains set and notif_irq_raised remains clear. This
> keeps the RX-buffer-full notification pending until the guest
> retrieves it, without publishing a successful local IRQ state too
> early.
>
> Functional impact: RX-buffer-full remains pending in hyp_pending
> until FFA_NOTIFICATION_GET, and failed local NPI injection no longer
> leaves Xen thinking the interrupt was already raised.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
> Changes since v2:
> - add Jens R-b
> Changes since v1:
> - clarify that v1 exposed RX-buffer-full indirectly via vm_pending
> - document that v2 keeps the HYP pending indication until
>   FFA_NOTIFICATION_GET
> - keep RX-buffer-full pending state stable across failed local NPI
>   injection attempts
> ---
>  xen/arch/arm/tee/ffa_notif.c   | 56 ++++++++++++++++++++++++++--------
>  xen/arch/arm/tee/ffa_private.h | 15 +++++++--
>  2 files changed, 56 insertions(+), 15 deletions(-)
>
> diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
> index 07bc5cb3a430..a631481e3815 100644
> --- a/xen/arch/arm/tee/ffa_notif.c
> +++ b/xen/arch/arm/tee/ffa_notif.c
> @@ -19,7 +19,7 @@
>  static bool __ro_after_init fw_notif_enabled;
>  static unsigned int __ro_after_init notif_sri_irq;
>
> -static void inject_notif_pending(struct domain *d)
> +static bool inject_notif_pending(struct domain *d)
>  {
>      struct vcpu *v;
>
> @@ -33,13 +33,15 @@ static void inject_notif_pending(struct domain *d)
>          if ( is_vcpu_online(v) )
>          {
>              vgic_inject_irq(d, v, GUEST_FFA_NOTIF_PEND_INTR_ID, true);
> -            return;
> +            return true;

The vCPU can go offline after this helper checks it. The default
vGIC checks the vCPU again inside vgic_inject_irq(). If the vCPU is
offline at that point, vgic_inject_irq() returns before it queues
the SGI.

The helper still returns true. The caller sets notif_irq_raised
because it thinks Xen queued the NPI. When a new local
notification arrives, Xen sees the flag and skips the NPI, even if
another vCPU is online.

Can the vGIC call tell us whether it queued the NPI? If the vCPU
went offline before the call could queue it, the helper could try
the next vCPU.

What happens if the target vCPU goes offline just after vGIC queues
the NPI and before the guest handles it? SGI  stays with that vCPU,
and notif_irq_raised stays true. The notification is still pending
for the whole VM.

Can FF-A notice when the target guest vCPU goes offline? If the
notification is still pending, can Xen send a new NPI to another
online vCPU? If none are online, can Xen try again when one comes
online?

>          }
>      }
>
>      if ( printk_ratelimit() )
>          printk(XENLOG_G_DEBUG "%pd: ffa: can't inject NPI, all vCPUs off=
line\n",
>                 d);
> +
> +    return false;
>  }
>
>  int32_t ffa_handle_notification_bind(struct cpu_user_regs *regs)
> @@ -94,8 +96,15 @@ void ffa_handle_notification_info_get(struct cpu_user_=
regs *regs)
>
>      notif_pending =3D test_and_clear_bool(ctx->notif.secure_pending);
>      if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
> +    {
>          notif_pending |=3D test_and_clear_bool(ctx->notif.vm_pending);
>
> +        spin_lock(&ctx->notif.notif_lock);
> +        if ( ctx->notif.hyp_pending )

Here, hyp_pending tells us that the guest still has to read
RX_BUFFER_FULL. The first INFO_GET call returns the endpoint and
leaves the pending bit set. If the guest calls INFO_GET again before
GET, Xen returns the same endpoint for the same notification. This
happens even if no new message has arrived.

DEN0077A 1.2 REL0, section 16.7.1, says to report pending
notification information only once.

Can INFO_GET record that it has reported the notification and
leave the bit set for GET to read?

Best regards,
Mykola

> +            notif_pending =3D true;
> +        spin_unlock(&ctx->notif.notif_lock);
> +    }
> +
>      if ( notif_pending )
>      {
>          /* A pending global notification for the guest */
> @@ -174,12 +183,19 @@ void ffa_handle_notification_get(struct cpu_user_re=
gs *regs)
>              w6 =3D resp.a6;
>      }
>
> -    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) &&
> -          flags & FFA_NOTIF_FLAG_BITMAP_HYP &&
> -          test_and_clear_bool(ctx->notif.buff_full_pending) )
> +    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
>      {
> -        ACCESS_ONCE(ctx->notif.vm_pending) =3D false;
> -        w7 =3D FFA_NOTIF_RX_BUFFER_FULL;
> +        spin_lock(&ctx->notif.notif_lock);
> +
> +        if ( (flags & FFA_NOTIF_FLAG_BITMAP_HYP) && ctx->notif.hyp_pendi=
ng )
> +        {
> +            w7 =3D ctx->notif.hyp_pending;
> +            ctx->notif.hyp_pending =3D 0;
> +            if ( !ctx->notif.vm_pending )
> +                ctx->notif.notif_irq_raised =3D false;
> +        }
> +
> +        spin_unlock(&ctx->notif.notif_lock);
>      }
>
>      ffa_set_regs(regs, FFA_SUCCESS_32, 0, w2, w3, w4, w5, w6, w7);
> @@ -211,9 +227,12 @@ void ffa_raise_rx_buffer_full(struct domain *d)
>      if ( !ctx )
>          return;
>
> -    ACCESS_ONCE(ctx->notif.buff_full_pending) =3D true;
> -    if ( !test_and_set_bool(ctx->notif.vm_pending) )
> -        inject_notif_pending(d);
> +    spin_lock(&ctx->notif.notif_lock);
> +    ctx->notif.hyp_pending |=3D FFA_NOTIF_RX_BUFFER_FULL;
> +    if ( !ctx->notif.notif_irq_raised &&
> +         inject_notif_pending(d) )
> +        ctx->notif.notif_irq_raised =3D true;
> +    spin_unlock(&ctx->notif.notif_lock);
>  }
>  #endif
>
> @@ -426,12 +445,16 @@ void ffa_notif_init(void)
>
>  int ffa_notif_domain_init(struct domain *d)
>  {
> +    struct ffa_ctx *ctx =3D d->arch.tee;
>      int32_t res;
>
> +    spin_lock_init(&ctx->notif.notif_lock);
> +    ctx->notif.notif_irq_raised =3D false;
> +    ctx->notif.hyp_pending =3D 0;
> +
>      if ( fw_notif_enabled )
>      {
> -
> -        res =3D ffa_notification_bitmap_create(ffa_get_vm_id(d), d->max_=
vcpus);
> +        res =3D ffa_notification_bitmap_create(ctx->ffa_id, d->max_vcpus=
);
>          if ( res )
>              return -ENOMEM;
>      }
> @@ -441,10 +464,17 @@ int ffa_notif_domain_init(struct domain *d)
>
>  void ffa_notif_domain_destroy(struct domain *d)
>  {
> +    struct ffa_ctx *ctx =3D d->arch.tee;
> +
> +    spin_lock(&ctx->notif.notif_lock);
> +    ctx->notif.notif_irq_raised =3D false;
> +    ctx->notif.hyp_pending =3D 0;
> +    spin_unlock(&ctx->notif.notif_lock);
> +
>      /*
>       * Call bitmap_destroy even if bitmap create failed as the SPMC will
>       * return a DENIED error that we will ignore.
>       */
>      if ( fw_notif_enabled )
> -        ffa_notification_bitmap_destroy(ffa_get_vm_id(d));
> +        ffa_notification_bitmap_destroy(ctx->ffa_id);
>  }
> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_privat=
e.h
> index e16bc0d83df3..025dfe6fed7b 100644
> --- a/xen/arch/arm/tee/ffa_private.h
> +++ b/xen/arch/arm/tee/ffa_private.h
> @@ -340,9 +340,20 @@ struct ffa_ctx_notif {
>      bool vm_pending;
>
>      /*
> -     * True if domain has buffer full notification pending
> +     * Lock protecting the hypervisor-managed notification state.
>       */
> -    bool buff_full_pending;
> +    spinlock_t notif_lock;
> +
> +    /*
> +     * Tracks whether a local notification pending interrupt was raised.
> +     * Protected by notif_lock.
> +     */
> +    bool notif_irq_raised;
> +
> +    /*
> +     * Bitmap of pending hypervisor notifications (for HYP bitmap querie=
s).
> +     */
> +    uint32_t hyp_pending;
>  };
>
>  struct ffa_ctx {
> --
> 2.53.0
>
>

