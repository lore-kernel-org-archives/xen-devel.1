Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3068A606A31C
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 15:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E66rnN7A
Received: from list by lists.xenproject.org with outflank-mailman.1491117.1692024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSyR5-0007mM-17; Mon, 16 Nov 2026 15:15:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1491117.1692024; Mon, 16 Nov 2026 15:15:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSyR4-0007mF-Ug; Mon, 16 Nov 2026 15:15:58 +0000
Received: by outflank-mailman (input) for mailman id 1491117;
 Mon, 16 Nov 2026 15:15:58 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xSyR3-0007m9-UJ
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 15:15:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSyR3-00BTdL-5j
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 16:15:57 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6afb1e24-2eae-0a2a0a5409dd-0a2a45069684-36
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 16:15:57 +0100
Received: from [209.85.167.49] (helo=mail-lf1-f49.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6afb1e2b-195a-0a2a45060019-d155a731b1a1-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 16:15:55 +0100
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-5c14a204305so3210142e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 07:15:55 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1794842155; cv=none;
        d=google.com; s=arc-20260327;
        b=NuzxEuub57B/MI+DCWaBn+4h1Xmb+oCDt4CAmYQSIcNXSHjl7sGRxpgfzZh7MUngap
         H1oLjRBnM2n3Nxa7qW0iwtd/EBiYnXeKa0Lf9XIUAqG6aVY7XypiyekhGNfjHggbD/uA
         YQHBdri7Tyq7/zn5oKnhqUOxvbA3Jhdz6u6ofHdMXJ0eOUBE9YjR8pzMvj/8kILLTJzH
         YDJM1by5w86roYxLdkp+/zqs7jIm2TK1/zJJIaOsyRU3k1hjI3jWHdg6HdfNEMEhBNIN
         eCdOGjNQrO0wdMGfSpz+iWjk9zP1U8dI43m5sg6yXL0ihIxdF6tE29AioM0UQ9TIYEMq
         eiaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xreGGvHmp7BFTOpuP/eDux0gdC8b+52qsTKyGm3WBhs=;
        fh=JawDij6L4UQ7rM+oaxbNI2C9l2y4YUH+di7F6HkBxh8=;
        b=bwqi7ArNq+jbUz9KS1HjM6+qByAgfi0gN51bA3Onkihu1CyizqCmJpnKedVGC2AGzo
         4tCYVabjBYHGwWnDbt9Cqp8b6W+b4FaltO/wc+YeaexQPtwTJMRIfdALetLZdh2Vp/BZ
         PSkLvIbq8FKUjk5GAn6c1Poava19MDQbOnUMb1ajiy1wj1236kmXD81pRaR4cvBIyt5J
         RoZhwZwE0tHDIqD0h+MSJCw2PmvpKVZLeI6HkbA2mnOPEtLxqDwj+Ua3B+VsYNM75iZ7
         tlosAXrYwP/iIK9L5ahStP2US5B4LLAi+bIzuvvaIsWdjGCH62QmDv/VwuUf/4PBtALo
         LmgA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794842155; x=1795446955; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xreGGvHmp7BFTOpuP/eDux0gdC8b+52qsTKyGm3WBhs=;
        b=E66rnN7AB9tM251DNnOftmahFqKM/+Ms7KBEKsMYHjPPXnvALG4ux2YoSLaYb2CNHH
         iwq+R5AG1TlVL0aYlKkVdG/jGqo3u87nDIle/TbLKQuBPR1bRhr1keZdEJZXkbP67Cun
         WGE66S6QdX2eAcxMCMMrGPHFBRlOEOQJ56SPQ+j57SzmKS6LOv5HKb2eJIU3ftEp4V38
         5NgPSvNQMp6kfJ81S670urX9nuvpBLrQyUBFjVGWDLXthQC9bgz6y5R0UttJUvYdeWBd
         hFvlEOqxGQDadVU2U9ve4WlcMVg92z4IuxwLIc5ZBrUooQdwJvyNJzixn1ujnG66Uj8V
         XChw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794842155; x=1795446955;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xreGGvHmp7BFTOpuP/eDux0gdC8b+52qsTKyGm3WBhs=;
        b=QsvFNkhTz8ZfbxaleJpIQ8RjJKXP1gTu4/TNjFsONsOcof8RVwBAgmUnZqH5RA+aZM
         NoPBJS0i/lpkFzhixtqf/QfzV83jJRxxONEihLi7vJuE0CLVeEMfX77qymoIgQg4P4E7
         J82mcec/3xWI2E7A9ELh3+PZ6q3J6gFmuyLXn9jXCvKJ9iotmEhTIFqPvI93iNZuUkFz
         Gex+iK4q6wFQdWBknkhBRC6wuF+Eup7iX7h70fKvLaDI1fV/768QumJMIGBuswP4w2bt
         OHl+447a2xmANWrItiJvm/LgOoz0vJckh1UHD094MyhbQL1vsY5l4Rrrs8KLrCRYntIB
         zdzw==
X-Forwarded-Encrypted: i=1; AL+hErFKVFRMSvfRZbdAnyrEJMh2Q5JZwEhUckE0MYDE3SA1pfgEsQfOm1UG5G1AE4QFr19aUZw+lzzMWuo=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9vaQz8LiLsW8uIDYHDZhzDRCBapQjUzD2jQYbRr9aUQ7Usfdr5
	6eMAAXL3UHJJG5gS6L/bj8hFT9F2HJ+/eWkHVkYhNZ6/jMenTV/fOwY8SfPog1bwUaJfj+I8urO
	q/2TJ6AVtcrqeo/2/KsdOQGSH4/GAa7U=
X-Gm-Gg: AYBFou3RtQqygTRKJn1UI8Okg5Zfas0IxMTnUlgDaFBTrEXdcoXWuxDrxTkbgEGKH08
	qFSKwvzFwKJqN/T9230m1I+e5xb6P773HCWgakGrT0Axibzf0tJdMricOc0sgq+UqFggrBs64A3
	hyBqKwffpY6/Gc9VdbG8xujZ+ZlQ26gV1kKOe9y/lh4m6+spofMF4WIA9+u/kfOYMPlLSMexakN
	IR8DyoYwIu8TLwqYhbgFQadjK3iOVO8mSuoeV40c70V9FoCOj9vHyTxVEf4Kl0TjKtXLMnEEF0j
	R4prIKtdF2c3qt1KNnRaTwWTijxDzLV+F6u0SLbfCnHKeltZZ1HiY7CnjqzlPS0yvPDhaNhPl2r
	ilpjTtdScUalHw10cqZlBj/oBRpgRJHGvur8=
X-Received: by 2002:a2e:a9a5:0:b0:3ac:fd58:5e7b with SMTP id
 38308e7fff4ca-3ae2b4fad6bmr34405451fa.22.1794842155035; Mon, 16 Nov 2026
 07:15:55 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1793129971.git.mykola_kvach@epam.com> <3f0239435a9013b5ea35dda4ddd0253ef42e26ee.1793129971.git.mykola_kvach@epam.com>
 <35bf81cf-594f-4fff-ad3f-13cccf559d72@suse.com>
In-Reply-To: <35bf81cf-594f-4fff-ad3f-13cccf559d72@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Mon, 16 Nov 2026 17:15:43 +0200
X-Gm-Features: AclHuK_GBWgl6aSHnETyXcPLAH7wONdLEPp10B27K_hT6XAGJ4gAc1sxkjH6AUA
Message-ID: <CAGeoDV8bMiJFZ9X6G3e+qEP3xnbrsd-ycHiscidzR9PPx7PN4g@mail.gmail.com>
Subject: Re: [PATCH v13 04/14] xen/percpu: defer freeing per-CPU areas after
 resume failures
To: Jan Beulich <jbeulich@suse.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-16d1c6/1794842155-1ECC577B-4D2BB848/10/78276251493
X-purgate-type: spam
X-purgate-size: 2720
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jan,

Thank you for the review.

On Tue, Nov 10, 2026 at 1:03=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 27.10.2026 22:05, Mykola Kvach wrote:
> > When a CPU fails to come back during system resume, cpu_up() sends
> > CPU_UP_CANCELED. After trying the other CPUs, enable_nonboot_cpus()
> > sends CPU_RESUME_FAILED for the same CPU.
> >
> > On architectures which do not park offline CPUs, both notifications
> > queue free_percpu_area(). The release metadata, including the rcu_head,
> > is stored in that CPU's per-CPU area. The first callback may already
> > have freed the area when the second notification arrives, or the same
> > rcu_head may be queued twice. The CPU_RESUME_FAILED callbacks also need
> > the area to clean up timers and CPU-pool state.
>
> I think there's another change needed, for the change you presently do
> to not cause a leak: If enable_nonboot_cpus() calls cpu_up() for a CPU
> whose bit isn't set in frozen_cpus, and if that call fails, the CPU
> later wouldn't have the CPU_RESUME_FAILED notification sent for it.
> IOW the freeing would then not happen at all. Question is whether
> simply setting the bit in frozen_cpus would be correct: Notify
> handlers may not expect CPU_RESUME_FAILED for a CPU which wasn't
> online at the point of suspend.

CPUs outside frozen_cpus are only tried when park_offline_cpus is true.
In that case, the existing !park_offline_cpus check already prevents
freeing their per-CPU areas.

When park_offline_cpus is false, CPUs outside frozen_cpus are skipped.
A failed cpu_up() leaves the bit set, so CPU_RESUME_FAILED is sent.

Am I missing a case where this patch would introduce a leak?

>
> > --- a/xen/common/percpu.c
> > +++ b/xen/common/percpu.c
> > @@ -82,6 +82,15 @@ static int cf_check cpu_percpu_callback(
> >          break;
> >
> >      case CPU_UP_CANCELED:
> > +        /*
> > +         * On resume, CPU_RESUME_FAILED is sent after all CPUs have be=
en
> > +         * tried. Keep the area alive for its cleanup callbacks and le=
t
> > +         * that notification release it.
> > +         */
> > +        if ( system_state =3D=3D SYS_STATE_resume )
> > +            break;
> > +        fallthrough;
> > +
> >      case CPU_DEAD:
> >      case CPU_RESUME_FAILED:
> >          if ( !park_offline_cpus && system_state !=3D SYS_STATE_suspend=
 )
>
> Nit: While generally we want blank lines between non-fall-through
> case blocks, imo between fall-through ones such blank lines would
> better be omitted, to make the falling through visually easier to
> notice.

Agreed, I'll remove the blank line after fallthrough.

Best regards,
Mykola

>
> Jan
>

