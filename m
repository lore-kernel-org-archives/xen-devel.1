Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BAF606A338
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 16:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qxsTAaow
Received: from list by lists.xenproject.org with outflank-mailman.1491222.1692104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSzO3-0007bC-Di; Mon, 16 Nov 2026 16:16:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1491222.1692104; Mon, 16 Nov 2026 16:16:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSzO3-0007b5-AK; Mon, 16 Nov 2026 16:16:55 +0000
Received: by outflank-mailman (input) for mailman id 1491222;
 Mon, 16 Nov 2026 16:16:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xSzO2-0007az-AJ
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 16:16:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSzO1-00FuLj-Mt
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 17:16:53 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6afb2c6d-2eae-0a2a0a5409dd-0a2a45099e86-8
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 17:16:53 +0100
Received: from [209.85.167.43] (helo=mail-lf1-f43.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6afb2c75-be1a-0a2a45090019-d155a72bd084-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 17:16:53 +0100
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5c08539c827so2847738e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 08:16:53 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1794845813; cv=none;
        d=google.com; s=arc-20260327;
        b=fyG/X/BIse6AzG10cYxucnTaCUekaU5SEnon0x/XOBj9wgkKR+HxOo7+PejFDbOCn9
         D99bgE9uU8IPvdVZOKV01ZnSsMU4TgABHCDuToiq2IT7I+8qOIgxGzY6bI8LNWNevDBc
         Vqw2Z7aPUwoWFsmFowwpt+qoFD92e2fdBGzzP8UTDO74Qjujb/LgpuqZ/pHjg+vcHdty
         3taVT8s6nQ0rND6j33ZijrbfXn5SL1IdvcgpkYlWfRkJcBHSSTaNSvzXnGRLDrk0oC+B
         TpMDlFTccaRRjHRxXW6mTF9MosJ7Op7L3+lV3p3ttOQGKrG3M6xOVePMkly0FFnWFP7y
         lH8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I6ch8DWjY1pnRn8ttiHOVdVvtK6sYgApQEC1gXflcc8=;
        fh=6IZGWk2W51j8C0yLF6Z6rSSMkcfTI7E4hWu/LLuh/YI=;
        b=QzCG3VpWqQF2d4ktWIksONnG1gh9R+f8xxidEYGXm+KoYZU4S8DmqWsKuLa8cYAgcL
         dOv5S+rnbvZxtO0OT6OhAp/XeIEDMmbsNpKr2dreaAu1mljpeKGlxnOjz2CF2sZZ4k9r
         GeAiAkPep0lkX5ClAhKfYG9sC0/D4d4nqtgo6KDcY0IDNWnaBZZUcSVWcvIAXXGDRSg8
         IjvkAy1C/djPIg/1GStu1hYXtMKzW7xBoRpbolMuKy/dwte/7yHyRdjX74c3UU6NB1Ii
         zQASEleQ/brLiRjgah1jjR3pn9yz8UT+V1Dne0fTYfWOTeZ6HQ6mRvY1NS7gPZ1d4pn9
         +Fqg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794845813; x=1795450613; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I6ch8DWjY1pnRn8ttiHOVdVvtK6sYgApQEC1gXflcc8=;
        b=qxsTAaowS5OrwPR/PrZ0oW6uAuxMRCaTDL1wcKI7eEOqBFRobH+bPilUkeVq67FrJs
         WH3+NqOZu5BTfkarBudCRCnOlQhY6s1b9U0sQ8iiesCSYzvO9SiGt8QxWP7viV4oDuCW
         Df8h+a3lFOIP0liuyZznX90/ONvCaoOZVfeTOBKw0JnkJnjWlYxDAer0AKRSLtNCAko/
         B2n2KGl4M5RENkDJDtsWSqjZwErzk+TgOOQvrE0ivVisGC61lNp77/rH4haDNxYCZp9n
         49pFMpkjvKy3wTX6TapPsK13plsHwQTSBZrB6NiEzCLFKskDLcUaSzU5Tw6oDxclVigU
         sABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794845813; x=1795450613;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I6ch8DWjY1pnRn8ttiHOVdVvtK6sYgApQEC1gXflcc8=;
        b=p5jLgsT9t/5Oh7Kv0iLxQMyZRa8WapTR9E89N5wiw7VnBFfhuK7Q/JmA1d3mNl2j6k
         KXjwx/VhQOZb2yFKl573wohEaTs2M/enIW4po8EFl3IqmAKGcE/WcTO4rIzAVYhZM+od
         3zHTYzwMR45MNbSX2D1X17trDVtiNyXGlgTspGyvv9A1vyZZh7XViEt+IH7D1Zs6wcMu
         SkfNC4T74JmTGoriH00+SuroRDtS+5RKM1ID7brRiMk04AcLdjvhyWtXKqKKprMTIG8n
         H08ke0HAbatYt/OiBOBuww65lteOVoOvG8PXxuwVuCef792ePlUkfbGXyfQVf0wbhrxW
         FYkQ==
X-Forwarded-Encrypted: i=1; AL+hErGNZCwn137bLUNQ9uIAsPm6uQwYJs846k7YD7De0xJu2EUppDNpqcQ2K6BCNn3/LmXl7HI4zJnjZi0=@lists.xenproject.org
X-Gm-Message-State: APuU4Z97OmRXsWRCN6rnfdn1LcqsjLb8xY39FirYQI1DXZPxxXi8265x
	0Lidf0AAUWz+SWCBVzlyOs/vhy4A++6aSpZwo40yoWYdopc16lz0nMgtFiCt7X+vaVrMcf4eZd+
	rntL7Q+bV9kD02MFaJjtYdx5LgT6eJdg=
X-Gm-Gg: AYBFou1WFasosnm7U9D78ZpqfUdjhdYRmUgLjPmQsZTJhP/c6etOLFaAnqzdl/5NNZJ
	UQ01rNMOxEjzsO4fAEM89lGAvI0iWSOcdyZEHb+vaya9UHK4Mc2G/c8hfjOe3yKFrxCqut3/WLi
	gTFOf88j1fTJEwV/iyk5trvXifkCVut748/RPAEvAaAioeogziGwCfv+Rb29vtNkQ7qO5xoK+Hn
	pc5VMHapjf7a4ORsJR0zwpae2sIQE0vmXwvOERVfsilCh/RN/kYaSrpLIHhGMmcbE9oVM7sUGVS
	hvtGDQChrlWaVep1COQyf/I3tqhwG+Z8XE8/wKNg83f/xXziQyEMBO5csoqSUNyshDJdC09bqzG
	LbYGxdtq+qvahr1CzTI5k01c8/UeitdqQ907A
X-Received: by 2002:a05:6512:2398:b0:5c1:57c4:9c4b with SMTP id
 2adb3069b0e04-5c1705d6878mr4143519e87.1.1794845812674; Mon, 16 Nov 2026
 08:16:52 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1793129971.git.mykola_kvach@epam.com> <3f0239435a9013b5ea35dda4ddd0253ef42e26ee.1793129971.git.mykola_kvach@epam.com>
 <35bf81cf-594f-4fff-ad3f-13cccf559d72@suse.com> <CAGeoDV8bMiJFZ9X6G3e+qEP3xnbrsd-ycHiscidzR9PPx7PN4g@mail.gmail.com>
 <a7396d64-3251-431d-a24c-afcc6c1f6e0c@suse.com>
In-Reply-To: <a7396d64-3251-431d-a24c-afcc6c1f6e0c@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Mon, 16 Nov 2026 18:16:41 +0200
X-Gm-Features: Aa3M54oAjgUV_LqDkbl6i_x0QJyA4ueTRjU8wu5MLfFWD6LSnBby330Js09VN8o
Message-ID: <CAGeoDV9EnPDFZ6EBwupkEpdc6aEoP27aPUGJSGL+d75bKBataw@mail.gmail.com>
Subject: Re: [PATCH v13 04/14] xen/percpu: defer freeing per-CPU areas after
 resume failures
To: Jan Beulich <jbeulich@suse.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-bad1c0/1794845813-BC6CA034-87ADDA8E/10/78276251493
X-purgate-type: spam
X-purgate-size: 2438
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 16, 2026 at 5:58=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 16.11.2026 16:15, Mykola Kvach wrote:
> > Hi Jan,
> >
> > Thank you for the review.
> >
> > On Tue, Nov 10, 2026 at 1:03=E2=80=AFPM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >>
> >> On 27.10.2026 22:05, Mykola Kvach wrote:
> >>> When a CPU fails to come back during system resume, cpu_up() sends
> >>> CPU_UP_CANCELED. After trying the other CPUs, enable_nonboot_cpus()
> >>> sends CPU_RESUME_FAILED for the same CPU.
> >>>
> >>> On architectures which do not park offline CPUs, both notifications
> >>> queue free_percpu_area(). The release metadata, including the rcu_hea=
d,
> >>> is stored in that CPU's per-CPU area. The first callback may already
> >>> have freed the area when the second notification arrives, or the same
> >>> rcu_head may be queued twice. The CPU_RESUME_FAILED callbacks also ne=
ed
> >>> the area to clean up timers and CPU-pool state.
> >>
> >> I think there's another change needed, for the change you presently do
> >> to not cause a leak: If enable_nonboot_cpus() calls cpu_up() for a CPU
> >> whose bit isn't set in frozen_cpus, and if that call fails, the CPU
> >> later wouldn't have the CPU_RESUME_FAILED notification sent for it.
> >> IOW the freeing would then not happen at all. Question is whether
> >> simply setting the bit in frozen_cpus would be correct: Notify
> >> handlers may not expect CPU_RESUME_FAILED for a CPU which wasn't
> >> online at the point of suspend.
> >
> > CPUs outside frozen_cpus are only tried when park_offline_cpus is true.
> > In that case, the existing !park_offline_cpus check already prevents
> > freeing their per-CPU areas.
> >
> > When park_offline_cpus is false, CPUs outside frozen_cpus are skipped.
> > A failed cpu_up() leaves the bit set, so CPU_RESUME_FAILED is sent.
> >
> > Am I missing a case where this patch would introduce a leak?
>
> No, you're right. What I'd like to ask for is an adjustment to the last
> sentence of the description: "does not take this release path" is
> ambiguous, because the notifiers are the same everywhere. What's skipped
> (for both of the notifier codes of interest here) is the call to
> free_percpu_area(). I'd appreciate if you could disambiguate that.

Thanks, I'll clarify that in v14:
x86 skips the call to free_percpu_area() for both notifications.

Best regards,
Mykola

