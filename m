Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165FC606A325
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 12:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zMUjiPDQ
Received: from list by lists.xenproject.org with outflank-mailman.1496229.1694882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU0nx-0000O3-Ny; Thu, 19 Nov 2026 11:59:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1496229.1694882; Thu, 19 Nov 2026 11:59:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU0nx-0000Nw-Iv; Thu, 19 Nov 2026 11:59:53 +0000
Received: by outflank-mailman (input) for mailman id 1496229;
 Thu, 19 Nov 2026 11:59:52 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1xU0nw-0000Nq-Gh
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 11:59:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xU0nv-00BZoM-T3
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 12:59:51 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6afee4af-e002-0a2a0a5209dd-0a2a450687fa-22
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 12:59:51 +0100
Received: from [209.85.167.41] (helo=mail-lf1-f41.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6afee4b7-195a-0a2a45060019-d155a729f1dd-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 12:59:51 +0100
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5c1b8120565so252015e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 03:59:51 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1795089591; cv=none;
        d=google.com; s=arc-20260327;
        b=f8rNMpdJ9/G8AdFrp13j39/1354Zal4uogZQU/mh3stwdIH1vzk2rhJ42STEKjWvWN
         IuK4aC7FSosDuC1Q/4x+9OcPkK1W1nYjiBJlDo1uwucURzBwZdrn1FhR/rKM53NCByVZ
         U4b07vogaooakbhdI87NxKpAZA72/rmtbTGmqBBEmaBTENLjWL0/eQRulY5vzKvGxRXi
         bM5KSahgI6jv6sOQnf+852NQVdvAHChfZBHkfY+ZwFYtTWpwe3hGdSPlfaOWOO9lqSnA
         t3vehBrHnpujRmQM8JJwOiagYcIk2OACs4PSm5dCpa62MbdHk+rq7UxH5FzzViTaSDrW
         7ycA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TTakPD3PLeAFXqmXj5kNB+BekR8BMgNfmWjba8qaf70=;
        fh=MrI02rc20GP/VrKE8nqr0XJ2mp59Dkr+cJdNDF0uzz4=;
        b=C8eDsC4p9tSIsPcIOc0wC4fll3dMafa5GiiWl07AV2/HpIp3JrHePMVR7nY/5r7cpH
         Ali159XbVG+AjSiN7OOkXKOlEXBD+Rj+hMf1P80TcoZS/w6rmE012IFGqUZ2WJo+vyCD
         M2bObxc+5BjWGMORIZpFLhTyRYomZ/s32Hf8siX4+jM9XNjZxwLw/9f9KKJIBikazLx/
         bhmoOqsiB7Mmrtjrg3GDDpfCOAANy2X6W6fQY9nyWE5VfzYgu/8SstbQHFL6DqWGin0f
         yY6t8/8iR2dVm/mZRmwq4TUkIXGp87HAF9MiThOt4oXYd9UeHLOE2ZGgs2VX9DTalJZd
         ppOw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795089591; x=1795694391; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TTakPD3PLeAFXqmXj5kNB+BekR8BMgNfmWjba8qaf70=;
        b=zMUjiPDQAHl2pApFnKiWp3k4D3hHTDcojfhI4hKRa6OaXfGeA7fxOg6sfBGklzlA2A
         hdjtQbNwowpujts2xUOA6RGMS4GAqf9iXOzpdLfOa7NJYWxiRCS7k2iN2bMaOWFL4d5Z
         nqntFhX/goP/mU+/CM1NnGlG5llFsFvjeLeLbDOddHmZpTXkisjxlWZx3IXHbycugXtu
         5tDedsP5bgInQZbI+Tx6feeup6793r1Hb3mojKOuBeYHBAXESc3WEjzX/tLev3Ki8EfF
         aQcbgILbZDPD86yLILcOX9zY4eho/spUqoPV51JSuyS1jSGPFkRGU7LE3JSP1ik5KSeV
         eSeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795089591; x=1795694391;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TTakPD3PLeAFXqmXj5kNB+BekR8BMgNfmWjba8qaf70=;
        b=2WYW6JGg0gQv1i74exVYsQiV2iupJN2hYAhVHMw2FrbK7HGFi6j9ZN1/mCx2vzTa9r
         ZFXXb92HzMxP44kKZdMwf3hL2O5UPOePfCAd+Pw9grcueRsco2JW6rDAZ/bvkjYusTfZ
         6Bc7HkeuN2SJd7oZltR7tbOi/WaXS3qwVDG2J2yD6OcYZxT4NE9nln1OEktQmkQc+WzS
         YNUxOuzVJ0eG1cjhe8AvL7pTy6ku3ooPTE9fJQ7fCWXY1ZEJo5rrnCST5WZAzUHOnEFp
         W/n8Fhj0DKOZTcDKPEec/ziWTFQAy+VlbjcAewMNvtmQdkCAXBMHXQxBX2qKQq91Polm
         G42w==
X-Forwarded-Encrypted: i=1; AL+hErHld7WKAzmK9cimghtbhQaHBU5l3EOzzQ6pVCmcpkVikuKS2/ml6prYPPYOTI297TRhcNBjzlTjSU8=@lists.xenproject.org
X-Gm-Message-State: APuU4Z91lb2qi/eqoo0+ZfMw8vWlefCgKRewAhiOrP2R6ZBl8ETKmt3h
	Kz70XIFWM6rWmdvhbb9GWYhwpp54hwb/pYkEi37k52VXBwS0M0XFwIe+aKaNFapojw6o/4xKu3z
	sdClXITzLMT31+4GiWgzJ3qlLgSsK63bMiaT3
X-Gm-Gg: AYBFou2lIlsW49UzwuoRgdBnbMwDwLoqqeBfRDwxD8mviX1NJzfQAToq6eCCVc6eqxE
	bHCMN+6iGlYwpfKzcCdY9mj6khCUvp/ga+3VxPk3NcJv9ioZq/u9m469MCXJHBR/LapDMDQdllj
	wRP2PjnnBxfOGYyeUqIbQeX+JIdQ9XO8rq2nCKa6JNpT3dJ06tVfFFO5PcZIqi/C3/F7dMBCufu
	ZSp0D6484bwbKHb8GwfCYtj0VTqnHSHLFtsZ1N71VJWZEfycYmCZa1kBfII+IZY+WMp2gBA8vBt
	shRbPF//5FlsudyAvDntsJKme9Iy6qSN0Q3b4XfaWt/ARQSaegV0lkl0tir4a7b4+JKz0F4Tr/a
	4tT3rk2anuTwOrkDNeB7Zfds/Cs7RiWqwr4c=
X-Received: by 2002:a05:6512:1045:b0:5c1:57ca:cf70 with SMTP id
 2adb3069b0e04-5c1a9b7317emr2043696e87.4.1795089590689; Thu, 19 Nov 2026
 03:59:50 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1794873792.git.mykola_kvach@epam.com> <3b0a92602e8cbc2f4df6b376876903e93850be3f.1794873792.git.mykola_kvach@epam.com>
 <87cxs2oqjc.fsf@epam.com> <b0a0df43-4402-4332-bc64-a89354c3bf91@suse.com>
In-Reply-To: <b0a0df43-4402-4332-bc64-a89354c3bf91@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 19 Nov 2026 13:59:36 +0200
X-Gm-Features: AclHuK9-zFQ093DZHvrbeVvsxe3APmyANTv9sC5ihQOX5wg4lnZ-u2JJZ0PJjxE
Message-ID: <CAGeoDV_RtFiEYueRggVe0h-_0V2jXr_WSCYBoUm9a8oFv5TurA@mail.gmail.com>
Subject: Re: [PATCH v14 04/15] xen/percpu: defer freeing per-CPU areas after
 resume failures
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Mykola Kvach <Mykola_Kvach@epam.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-16d1c6/1795089591-FCA0477B-70B43E61/0/0
X-purgate-type: clean
X-purgate-size: 2976
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi J=C3=BCrgen,

Thank you for the review.

On Thu, Nov 19, 2026 at 1:32=E2=80=AFPM J=C3=BCrgen Gro=C3=9F <jgross@suse.=
com> wrote:
>
> On 18.11.26 02:51, Volodymyr Babchuk wrote:
> > Hi,
> >
> > CC'ed Juergen, because I have a question about cpupools.
> >
> > Mykola Kvach <Mykola_Kvach@epam.com> writes:
> >
> >> When a CPU fails to come back during system resume, cpu_up() sends
> >> CPU_UP_CANCELED. After trying the other CPUs, enable_nonboot_cpus()
> >> sends CPU_RESUME_FAILED for the same CPU.
> >>
> >> On architectures which do not park offline CPUs, both notifications
> >> queue free_percpu_area(). The release metadata, including the rcu_head=
,
> >> is stored in that CPU's per-CPU area. The first callback may already
> >> have freed the area when the second notification arrives, or the same
> >> rcu_head may be queued twice. The CPU_RESUME_FAILED callbacks also nee=
d
> >> the area to clean up timers and CPU-pool state.
>
> I don't see why CPU_RESUME_FAILED would free percpu data twice.
> Even CPU_UP_CANCELED during resuming shouldn't cause a free of percpu
> data.
>
> When CPU_RESUME_FAILED is signaled, system_state should still be
> SYS_STATE_suspend. Or am I overlooking something here?

By the time enable_nonboot_cpus() runs, system_state is already
SYS_STATE_resume. Both enter_state() on x86 and system_suspend() in
Arm patch 15/15 set it before that call.

On x86, park_offline_cpus is true, so the per-CPU notifier skips
free_percpu_area() for both events. On Arm it is false. Without
patch 4, if __cpu_up() fails for a CPU in frozen_cpus, CPU_UP_CANCELED
queues an RCU callback to free that CPU's per-CPU area.

The CPU_RESUME_FAILED handlers still need that area. If the first
callback is still pending, the per-CPU notifier can queue the same
rcu_head again. This patch defers queuing the release until the timer
and cpupool callbacks have finished.

>
> >
> > A bit convoluted. As I see, problem is caused by the fact
> > CPU_UP_CANCELED is a terminal state in a "simple" CPU up sequence, but
> > is a transient state in a system resume sequence. As such, theoreticall=
y
> > other per_cpu callbacks might have a similar issue when they don't
> > expect one more "CPU state is bad" callback. I can see that
> > common/timer.c also tries to handle both callbacks as terminal
> > ones. Probably, you need a similar fix there as well.
> >
> > Actually, I am not sure why do we need CPU_RESUME_FAILED in the first
> > place. As I can see, only cpupool handles it in a sensible way. Which
> > begs a question: why cpupool can't call cpupool_cpu_remove_forced() on
> > CPU_UP_CANCELED instead?
> The difference is for the case of parked cpus: CPU_UP_CANCELED might be
> called for parked cpus not coming up, while CPU_RESUME_FAILED will only
> be used for non-parked cpus.

Thanks, that explains why cpupool uses CPU_RESUME_FAILED.

Best regards,
Mykola

>
>
> Juergen

