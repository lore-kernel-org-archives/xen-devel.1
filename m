Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CB5606A330
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 12:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w4U80rh/
Received: from list by lists.xenproject.org with outflank-mailman.1490833.1691789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSvd5-00072c-UZ; Mon, 16 Nov 2026 12:16:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1490833.1691789; Mon, 16 Nov 2026 12:16:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSvd5-00072V-Rv; Mon, 16 Nov 2026 12:16:11 +0000
Received: by outflank-mailman (input) for mailman id 1490833;
 Mon, 16 Nov 2026 12:16:10 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1xSvd4-00071G-It
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 12:16:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSvd3-00ENWF-O5
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 13:16:09 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6afaf408-e002-0a2a0a5209dd-0a2a450ba7c8-4
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 13:16:09 +0100
Received: from [209.85.167.46] (helo=mail-lf1-f46.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6afaf409-b7e8-0a2a450b0019-d155a72ea47a-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 13:16:09 +0100
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5c14f3dab66so4121234e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 04:16:09 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1794831369; cv=none;
        d=google.com; s=arc-20260327;
        b=bUQ/DHLsaq7VaAuQc7gW/BkdX51PjBy0pY/jBhR5H5Jqz4ysY9L2FT7nipyBoCyEY9
         WGqtHH3c6XmmZvW0PZH9ViIYUPWiL0XPJJ6g8o7mS5yM5bU3jqSwoahRzExz5cFahrFX
         0RNqvN5WZrqsQ11grsOvqw1JDNf+ir/04cl9SaImAupS3r6lVc5/QGCIK9N2+eo0ZYvg
         ov82cuo5oi5i0OO0kBtJuyPpZoyTfWqGo4I8gxs88cUcKDyn2NLYUN1O5YN0bqPONggS
         72cJ4Gggr9NQBygoFrLmuECWnf6gHbmGb50SU2QfYu5Od/2BrlZxAWocTb7qKdl+Ln6+
         Pl+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+/3pC1DOOT8boafXwN481xBar6gYaxUnO1VQTNAiNII=;
        fh=mTziSQThFeeOYTGpAiM5auKHF7P6xsZ+3MZNB61wh2Y=;
        b=OLhFgTNiAT1IgfzWE6BStsd41IfGTvp14HAnRsqgXFukBYdpOeB/Rcl2CrqfevkUPy
         A5n7pY231GUmDmwlvWRHvsrr+9+TteGgp7z/tEV+kkuHYylBiM2XxA1z4dGXX/EE1DuD
         02em6zgdUzYbmQMrbRpdjpOOqZ5BXdTkmA2BbHTgAl4pIQzKQyRH2QbXDbLcvnafwSUJ
         Yk86EsL9ar/5n26TZZwR4pjYPX261CpOOt7gbfaWUhzviMi/bfCpuEu2kSNgcCktil6F
         MkF28G2PFoHd7p5rS07YW2lH2+7c6zoqU5ytemHv4lvgm0UuWQOHe2YPAvMEIk1MtysL
         GsvA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794831369; x=1795436169; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+/3pC1DOOT8boafXwN481xBar6gYaxUnO1VQTNAiNII=;
        b=w4U80rh/U+513/UX/HxqfjSaTe14Hf/5UyPjramc6FCB8yOeb8CVSPoya7a8wzJR30
         NN4cgnL6QrNvmc17AbD3KzcqvxWoSuQTZV+JiIy4LWm54jHEKtqAekhOYQe8LwuhNAGs
         99Zi1QE8TY0joPZd83jLuPzOh5ErTdu2K38VbbvoZyjTkOfmlyDSpSfIFIedGacwb2UL
         VLjsjnxBcDg9wj6fWkUrbECZ9Eo5ey0rIE+9hF4eOBKlOukydfBcPGG2evgMzpM32O51
         qLuwRjMZyHkGgPUjc8ZJ5FosHWGq7NRsVLyfdsl1TH0iJAp2m5gb1NGzd/SslNAp60VE
         yIxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794831369; x=1795436169;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+/3pC1DOOT8boafXwN481xBar6gYaxUnO1VQTNAiNII=;
        b=S0sJRvJDMjLqL5hQINfPjrUHGDjar0Oy51snRXLiKygMU9LlnIeTHDywW2fZYZP8M/
         ZUgkpOvR4C/QR6/C+HwRxxDDQXyPjHKsQaf9nkipvv72xMdjShOWGhve0u6tdr0H1WxP
         RDFWvBsf6VMGDFbR08q6wulmLmYbybemT3rMeArVK/4n3WL1+F3uMm4HrH6wnHL17N2/
         HtgqC5b9yBEnrIKY8Enr5khxax+1LrKI1f097SmE+svtUZWE/QmJGKi4FNQ7k1e+jtHd
         F1sQb4REUNJp29yj77DeJnAFYteu4XTAkrVcacNN0/ozCEvY3PkiFWrT7gZkqNWHU55u
         wBsw==
X-Forwarded-Encrypted: i=1; AL+hErH0ESmBocYNKZC9B0etYN3RhFkAgv6VKPGSxqTqUJPb7rLXwHjAF2hDklugpk27QbPqHm3CrJhvKrw=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8hB5Bx+h3fhilMmRDnhqZAThxqZqC3i/jroBHsaL+X2I86KI7z
	wR88dLVfuVAVOovyBO0ZBz15GYwHOeC7CqEYLvqNr9sCFOzLA+BNcLNkrtD5yhnDH+OuMY58qQy
	D407Dh9kKe1J3g6atDzuKHnC28WuK4Nw=
X-Gm-Gg: AYBFou2NNjOhrT3jaj/qwvqipsoib3VuxYsispRQjDU30a3hMpXUMGmjUhNpU6VzC25
	85qPCngGNc6ryz2maD3ymMgZ5bSl48vwUcsqGBghYGqh3c4dJU10ZpgcnZykp85pz9Vcwd7DE4o
	HQ97PK+ahcSUZ1Mib7kLy+6KSu7PFeLiizksApI5TowY0UgVeLNj0SnCnUY/kYkaq+ShbkkFL41
	BHWQWyF1gRT+cWbRMuqOkonb9tS2dRlGu3QhfE5lRhnofUKH1UOpCSy459cTtHmypLJQpaZYUkS
	QPb92D5w3rWgT+PNjvmTog5XucVPwrBKsqCjBc9hNX2vWvxAPwGtwetT1A2LDaoPRsrVMNwIQxy
	y9irmgmjuJ8VhibscZm5FiHrWKz122xmYPP4=
X-Received: by 2002:ac2:4f13:0:b0:5bf:a34f:14ce with SMTP id
 2adb3069b0e04-5c164e80022mr4816549e87.11.1794831368437; Mon, 16 Nov 2026
 04:16:08 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1793129971.git.mykola_kvach@epam.com> <25db7c4451729a8c6e35b5e8f7a473c42eeac7a9.1793129971.git.mykola_kvach@epam.com>
 <4641C3FB-AC62-4885-A81D-F407F9E337E4@arm.com>
In-Reply-To: <4641C3FB-AC62-4885-A81D-F407F9E337E4@arm.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Mon, 16 Nov 2026 14:15:57 +0200
X-Gm-Features: Aa3M54qyqzvu5ZkjRsCMh-GRuzMcUWBGc_8oRhUJl9pnXL1vbWPFUEU583vxslM
Message-ID: <CAGeoDV_JSR182P=MLj+XGMm1VcmR=otR3HLVQ2kbV7RT5C_NSQ@mail.gmail.com>
Subject: Re: [PATCH v13 05/14] xen/arm: gic-v3: Implement GICv3 suspend/resume functions
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-42698a/1794831369-AB2DC9EA-067BF367/0/0
X-purgate-type: clean
X-purgate-size: 1778
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Bertrand,

Thanks for the review.

On Tue, Nov 10, 2026 at 4:49=E2=80=AFPM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Mykola,
>
> > On 27 Oct 2026, at 22:05, Mykola Kvach <mykola_kvach@epam.com> wrote:
> >
> > System suspend may lead to a state where GIC would be powered down.
> > Therefore, Xen should save/restore the context of GIC on suspend/resume=
.
> >
> > Note that the context consists of states of registers which are
> > controlled by the hypervisor. Other GIC registers which are accessible
> > by guests are saved/restored on context switch.
> >
> > Before continuing suspend, also verify that the physical CPU interface
> > has no Group 1 active-priority state left. Use ICC_CTLR_EL1.PRIbits to
> > decide which ICC_AP1R<n>_EL1 registers are implemented, so Xen does not
> > read an unimplemented AP1R register.
> >
> > Have gicv3_suspend() panic if the Redistributor does not set
> > GICR_WAKER.ChildrenAsleep before the timeout. Clearing ProcessorSleep
> > while ChildrenAsleep is still zero is UNPREDICTABLE, so Xen cannot safe=
ly
> > undo this transition and restore the CPU interface. Keep error reportin=
g
> > in gicv3_disable_redist(), including the CPU.
> >
> > Check active priorities before disabling the CPU and virtual interfaces=
,
> > while local IRQs are masked. Return directly on failure, without changi=
ng
> > the interfaces or requesting Redistributor sleep.
> >
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
>
> Looks good to me with one nit:
> With your renaming to nr_block_irqs some lines are now 81 chars it seems.

Ack.

Best regards,
Mykola

>
> With that handled:
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>
> Cheers
> Bertrand
>
>

