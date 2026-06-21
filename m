Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B34CDB46B
	for <xen-devel@archiver.kernel.org>; Sun, 21 Jun 2026 14:31:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1343330.1602781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbJCF-0003tH-UW; Sun, 21 Jun 2026 14:30:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1343330.1602781; Sun, 21 Jun 2026 14:30:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbJCF-0003t9-Pj; Sun, 21 Jun 2026 14:30:51 +0000
Received: by outflank-mailman (input) for mailman id 1343330;
 Sun, 21 Jun 2026 14:30:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wbJCE-0003t3-IR
 for xen-devel@lists.xenproject.org; Sun, 21 Jun 2026 14:30:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wbJCD-007Kjr-N7
 for xen-devel@lists.xenproject.org; Sun, 21 Jun 2026 16:30:49 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a37f56a-5cb7-0a2a0a5109dd-0a2a450a96dc-26
 for <xen-devel@lists.xenproject.org>; Sun, 21 Jun 2026 16:30:49 +0200
Received: from [209.85.167.41] (helo=mail-lf1-f41.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a37f599-93a5-0a2a450a0019-d155a729d9e5-3
 for <xen-devel@lists.xenproject.org>; Sun, 21 Jun 2026 16:30:49 +0200
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5ad4a5647e5so3938088e87.3
 for <xen-devel@lists.xenproject.org>; Sun, 21 Jun 2026 07:30:49 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1782052249; cv=none;
        d=google.com; s=arc-20240605;
        b=hPRu9Sq6ULFaq/nYC6c5WnLpH+4FIUAT6BfEvVWfR7VuzIO+zwWbd1yCmT5XklsWY4
         tmAeBX3EWFsxuLcL5NjP4VfY9aZQVOycdF/xbmBQk/R6phjoCx4a7bTPClwJ2Og0Quh4
         xIdtSDe6RXZNL9ZnMOiqovtSCBVPAk505g+VlF9rqBl2FYBMF8B5B8OU+5uO4DIvpqlM
         vYIjgbf0AciOBSrFAXxo+HNszwfphZ6y12mD/qLEsZ92UnRi3faH50/ruS7+BtzZ1dCo
         22ATDCXTHUvsqOhqp3Kz8Lv6QzJ4+bzIInEzpTGpKC51/07vcuQJDAO2O8zKHlGhb5QL
         5WkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+KC0u/KRYobJp2JZVAxFOAwL39TOvhEZsL8jNRWiAuM=;
        fh=c26W8yzhfrIIIAjqZnhAjFtxMz7x1oQjE+CBX55p50c=;
        b=TUByrexCTahNEru31xQKc3OO8V7HYw6fYHdHS9bq2bSjyz9+82MUm5idPFJvFmvmrq
         P2AywxyKdbBD0iuS19cjN/W4OJYoN0Di7lCvYLU4tCkB5sZKHD3rtJHX/vwtZV/WvEeI
         li8wi4pb2h8tN9zzcPxv0DTQNr3L2n5CDBBK0Z+f0aK3Yu3//nMVbVcpx856V2QtuJsN
         /InHiE9hDNStWjXUA0gc5QKZ5F2Eq/B4qgvW+/rfHJjMMvSL3+d4htoaVNJz1Ok7jLff
         hnVoAuJLc8iwbz3oRNIL6U/3rCUX2jbnRTheI4Q+iCGzwiCCvuHmAgtOn15KqARa3u0f
         U50A==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782052249; x=1782657049; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+KC0u/KRYobJp2JZVAxFOAwL39TOvhEZsL8jNRWiAuM=;
        b=RjKb9CGbmLOE3gNNzW62bsBIeAat5uSV81IMrDEHlXF275icqx9hPgmOwS0SsNvcCz
         sVqEUvs1sRseBOykInd7nTruYzLH52Asy+8lh2352XXPgdyr5vAqDt4SnzooYNyMM7Qq
         o4M9i5PjvYe1mi3sOeBmG8d2jTGG4f7k2O1PE5Qj0WGuurUxxzFhOaB4Yt1Zfyy+7zqc
         ZDEqOHjE0e9zh5XZ3zPFbLqqqz95MXgmt/OgbITARqZ0iBsVvje67XPbI0VK1cSTTtzn
         FAXgAJl4OCygy0ZT+rwDyDAEizpQ9wdvlayq02uiW60rkstwBoqd4vsNbQn6uuh7i2Yz
         gHZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782052249; x=1782657049;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+KC0u/KRYobJp2JZVAxFOAwL39TOvhEZsL8jNRWiAuM=;
        b=dvwVAx6PIrZBZAYPldJitnVDoal6xIPipnmMPZKxvi5bFR3bLHZU46euWgxCcb8hUs
         zCEimrWKfAiPQ9bCwFNMZ7ET7FUAujMYgpBMoMWBgfkvpHiSKkMC+tVzKElcAafG8QLQ
         PEi43Jhc1qI7m8Qk9VxYEXFS3qDJQN24s/9L5csrLZTgZ42uSPczi9j/RkAZkoisK9vK
         f+FWYVDrzyXjWz864bJDTPGkAIgmDPhInt3Jj7UzsZu1phOm7svZU0ccfyP6ccF5Og8r
         5MgYKm+SDLPX0SopEUulQAG8MpSCbxOUUne8xs4KJGUKfvJMI+pt1WPud/oNB3qcPOyC
         8ikg==
X-Forwarded-Encrypted: i=1; AFNElJ8bdqf1fdor6S6yGXKqfzO11GYdGMycCvbgZLL7g3yznYt0jPy/sEKUwzdyjwf3fPMAqhgbpLBxPfo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz6jYL8fPJdndcxhqCgfvYx3eGtktVgsto2aG4A4AzqouS0+/aI
	QoQvfSW+XZuuDSDBhuVacblWtdwHWOFF3x7ESDqScajv4cDgXwLH9PEMK2wwh7wtAupUJitEJmN
	eR0IqwHLOvVMtR36wlftvARNw/fzzB/8=
X-Gm-Gg: AfdE7cnZRAhk8/KliKoYimgBZVko+oXlUTKlr6CgAWP24/CvYX4Cxc7LWymBCgT5osu
	L+DcF4ElqYcYaNT0HCIVLjThpWAVWHNgPTCOaH5aqTEZGKc1fhlFRIZFVe5alyew8om5+XEdDMP
	W6I6pPqBMVsVxxR9JosB7tM+v4+DSVbkaGGvs9ksatm+YcVnF3wOORaW0Sb4WUbnMrd+Cs00yih
	sxoCLDcnp3zknEBA3hiKL7u5pWAZs7QjMR1uYtigBnGFXUGNWB2fjTcfMxoDB2NwLkFGUiUjfkM
	O8hhag==
X-Received: by 2002:a05:6512:32d6:b0:5aa:8822:c946 with SMTP id
 2adb3069b0e04-5ad562e8744mr3553283e87.48.1782052248690; Sun, 21 Jun 2026
 07:30:48 -0700 (PDT)
MIME-Version: 1.0
References: <74e132a5f3dff64be5bd0c04eb82fe78d9c2fe84.1781892316.git.mykola_kvach@epam.com>
 <3c6fe373-8840-4943-abaf-7e7ed13870e2@xen.org>
In-Reply-To: <3c6fe373-8840-4943-abaf-7e7ed13870e2@xen.org>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Sun, 21 Jun 2026 17:30:37 +0300
X-Gm-Features: AVVi8CfplHhuULAUXydmPr49w9rJAl4VM9IGS0xkmsKg-VvtI6IFPF7v27G2tLA
Message-ID: <CAGeoDV9c8Mv9vQiqa0TCubZ2VTD=r5ewbZZxwZTbVHh=ubcsUw@mail.gmail.com>
Subject: Re: [PATCH for-4.22?] xen/arm: mask debug exceptions in initial
 AArch64 guest state
To: Julien Grall <julien@xen.org>
Cc: Mykola Kvach <mykola_kvach@epam.com>, xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-4011c0/1782052249-2D3FFDB8-2D431AE1/0/0
X-purgate-type: clean
X-purgate-size: 1532

Hi Julien,

Thanks for the review.

On Sat, Jun 20, 2026 at 12:07=E2=80=AFAM Julien Grall <julien@xen.org> wrot=
e:
>
> Hi Mykola,
>
> On 19/06/2026 19:37, Mykola Kvach wrote:
> > PSR_GUEST64_INIT currently masks SError, IRQ and FIQ, but leaves debug
> > exceptions unmasked. Both the AArch64 Linux boot protocol and PSCI entr=
y
> > requirements expect PSTATE.DAIF to be masked.
> >
> > Add PSR_DBG_MASK to PSR_GUEST64_INIT. This fixes the initial AArch64 gu=
est
> > entry state as well as virtual PSCI CPU_ON and SYSTEM_SUSPEND resume en=
try.
> >
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
>
> Reviewed-by: Julien Grall <julien@xen.org>
>
> Regarding Xen 4.22, I understand and agree this is technically against
> the specification. However, AFAIR, we don't expose debug registers to
> the guest. So there should be no impact.
>
> The slight risk with this patch is OS that may have started to rely on
> Xen behavior (hopefully not here, but I know we had a couple of cases
> with the timer for instance...).
>
> This has been present forever. So unless there is a real issue, I am
> tempted to suggest to wait until the release is out and backport after.
>
> I will leave Oleksii the final decision.

I agree with your assessment. I am fine with deferring this until after the
release unless Oleksii decides otherwise.

The patch is not fixing any known issue and was only intended to align the
guest entry state with the documented requirements.

Best regards,
Mykola

