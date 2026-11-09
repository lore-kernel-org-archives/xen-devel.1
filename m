Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18B8606A31C
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 11:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PxOCBV0o
Received: from list by lists.xenproject.org with outflank-mailman.1479883.1683784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQNV0-0000bB-AR; Mon, 09 Nov 2026 11:25:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1479883.1683784; Mon, 09 Nov 2026 11:25:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQNV0-0000b4-7b; Mon, 09 Nov 2026 11:25:18 +0000
Received: by outflank-mailman (input) for mailman id 1479883;
 Mon, 09 Nov 2026 11:25:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQNUz-0000ay-22
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 11:25:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQNUy-002Xtm-0r
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 12:25:16 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6af1ad97-bab6-0a2a0a5309dd-0a2a450ca76a-20
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 12:25:15 +0100
Received: from [209.85.208.173] (helo=mail-lj1-f173.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6af1ad9b-f479-0a2a450c0019-d155d0aded65-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 12:25:15 +0100
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-3adfd5771ccso5314221fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 03:25:15 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1794223515; cv=none;
        d=google.com; s=arc-20260327;
        b=oB7/q4cih3SUu6DTIuJDPiDbyqUCjA7l5Xw1NyDslX0JloC34lBiufypHa+QzbWU8L
         1JIcoEV3otr0Xphn4nMnFohONTWlY6Zdr/O7FH1GjmnxqUo0DJILUZex9KVhPaPo8lV+
         UyxMnZPE44SsiTSAVM4g+LU9I35oYppSIXhEkV7xmqWWFPEpWA8EQqz7NP6ZfY9wGaB8
         PphxqQ9moDNw1wZdX2MIESub1RJzkX5DOEaoe7zYHOBM86k6NQQ3wffJkzV7q8JK3y2O
         aSgCT8Iu3x/A1Wp1Sx3q7kbTzyErD/b6VhrOZ4GAOSYlWBwJYVBD6dcSqborEPF/SOEn
         5fzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7vd28LUNAcXQYC8IquR/rqALyr+9bzLZGM4hS9fWKb4=;
        fh=otM5Y3HSqWrnegtZP/S+KnL4PqF4qzydXT2sQ05LBPg=;
        b=UsNqXB9JcZIM/HxQ0LoqVM0l/CF6ViA8xvx1JDuwQD1XtA5b91Ly+8WyT9Ei9bvULR
         f8RinQ6w23DZDECXnSatCnU8F0ZWb9RXtJ37iQmqrIdxG4mSf2uHqw0kUC0seZWD6NZo
         bq46ScIA2URD1Izo+zRoT4rh9dIsVvSFiNXYivf0OnGz6+WKik/ARn2aciurWz2TkxKF
         G1eocXU1blItCxB0hmcVvwh9pvf4R3Y4QCLzYqreKk0nV94DDbc3fw2GTq3AiJbHBKUF
         EN5bKA0Vu11euw4GZELZebnP/zbc1OUnWortRwGPHb5yPvE+hmzOwXZjg6RdcrW1EzGp
         3l+w==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794223515; x=1794828315; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7vd28LUNAcXQYC8IquR/rqALyr+9bzLZGM4hS9fWKb4=;
        b=PxOCBV0op861z6WQyVugdi0uw+Uy+XE0tRS7Uojte3TOvR7LCpO2KldYNMjaGvTSHJ
         e3TB18HMm+ZShH3anDGhTtymlBByitEeCgo6/DYeF5TVgVyoojsHcH5mG9T9KwWxpJtF
         nwAkYBkj8T9T8+dYdO5Ct1VZKy3a4DtzHSzEg/nasjXxRksAa+76BX9q0trrk2Ew5024
         Nai92aGU6dz9tEEQVpTs0JYcVUjgDjgaDVMYZcEg3C0vj2AF1QL8vGc8voVrl7JpoLvW
         0vZ22neMy1+NcetEa59mkM1wAJdx8EpFh+jkhFa9j5N2x1PEj1fZ4Fk8bF6czDNjXVPO
         VvrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794223515; x=1794828315;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7vd28LUNAcXQYC8IquR/rqALyr+9bzLZGM4hS9fWKb4=;
        b=nNO8AEqfSu7E96+iHDop163lkOk3VTF3gRk2P+X815oSXs+vw2f1DCQm7e8dAfIWZn
         h0f550fkeqyw+J8zAlgmthqWHRwwJrVmUdWWv8Yva/FgaasInubtKmr010eIumSJZkGW
         LhaMNe5tGt6+wTp6nGvgYYvZMGT/oPkcu8R70IWGc6SxWjzz4KCIPD/4cIWXgfimyTgj
         Rb7Iot1iAoUmHDZoQA3dAXAnSTBgwjdtvIMX50rHK7gYqrJf3kK+hfbScbolNEOsxfz3
         s/bNkWni0H+HnPaEyhAYAi5wz/MgMJGd4gMl6QBaeMuH0Ew8GtajrIwllfSt2NLNEyVw
         BkYQ==
X-Forwarded-Encrypted: i=1; AL+hErFLqRXmpZRyskbbrU53RSbTtd/h85kAEA4sAK3lOPvbmUEt5QWkbFhFE3tzKZgHe2GylNIclKm8mQs=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9Tx5UlbGth8Ncl/+0S5v++NSsrx6pu5CujdUjnIsPUGYUo72bw
	8OT/rgDdIfwT1wKw0J/uolPJgAEMiQFDlRVcUAEm8gjsvcVDxEjQVyf75JH7e1dopO1/87ztkhK
	XmNmk14tvV6HrNLkYHs8DQqMDdAOFwUQ=
X-Gm-Gg: AYBFou0c411qx+PIDWf5cjJiAHdnCnuQftSWvSHoxZ+x7lRpnH3ExzvAVHgyL8QmG6u
	pkyaLAhBOqSpJGiBkrztRK5u63Mzsm8F8AYyzqkl2eidn7c6bVq8kXm4TPB2UfJRmtKw6GNF+BP
	yvRUKLngcQt/zomU0E2hx+BTuPgUd+8rvEtyAAAtluBfkaFxlH5GI5kW+mrwcWlgqKq/mTLb6h0
	b5sc8Ta7uwvJkNNm4xyXYj3aioZtxsVxsapeL7zXx1zn32Moq5eg1soL3vJhqgjxfhUVboTBBtm
	mr7ghQPEWLxBBiEpg3zUDW1wGkmnDZHF8/QDm/jzSIxJevb4uLmCMOdt27YuNhXbn2+bxo4+tfd
	2PILBJg4khXEAJgRGSIUeeh1vC97CPbeViA==
X-Received: by 2002:a05:6512:838e:b0:5c1:4c4b:6b68 with SMTP id
 2adb3069b0e04-5c14c4b6edemr743304e87.31.1794223515065; Mon, 09 Nov 2026
 03:25:15 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1793129971.git.mykola_kvach@epam.com> <815a067a28bdc1db079cc3ad068e3ef74b7afe5c.1793129971.git.mykola_kvach@epam.com>
 <28ba9787-ffd4-49fc-aafc-ebc552ce812d@suse.com>
In-Reply-To: <28ba9787-ffd4-49fc-aafc-ebc552ce812d@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Mon, 9 Nov 2026 13:25:04 +0200
X-Gm-Features: AclHuK_-QX6Il1HN-eD2mUnfTmfLHr_9dogFkBdSTB3mp6NboeAAbdfMfCaukVE
Message-ID: <CAGeoDV8JKy79pAtRUtSFBrZ6h09AGahJoQD3V5mmcc6Z1sB2jg@mail.gmail.com>
Subject: Re: [PATCH v13 13/14] xen/arm: Add vPSCI SYSTEM_SUSPEND policy
To: Jan Beulich <jbeulich@suse.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
	Mykyta Poturai <mykyta_poturai@epam.com>, Rahul Singh <rahul.singh@arm.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-d25034/1794223515-022C0A5B-F3F83B02/10/78276251493
X-purgate-type: spam
X-purgate-size: 1626
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jan,

Thank you for the review.

On Wed, Oct 28, 2026 at 9:27=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 27.10.2026 22:06, Mykola Kvach wrote:
> > --- a/xen/arch/arm/Kconfig
> > +++ b/xen/arch/arm/Kconfig
> > @@ -19,6 +19,7 @@ config ARM
> >       select HAS_ALTERNATIVE if HAS_VMAP
> >       select HAS_DEVICE_TREE_DISCOVERY
> >       select HAS_DOM0LESS
> > +     select HAS_HWDOM_SYSTEM_SUSPEND if !MPU
>
> Why the !MPU dependency? Nothing is being said in this regard in the desc=
ription,
> unless I overlooked something.

I kept !MPU to preserve the current hardware-domain shutdown behaviour
on MPU systems. This series does not add suspend support for Cortex-R,
and I have not tested suspend/resume there. I should have explained
this in the commit message.

This option lets the hardware domain suspend while Xen keeps running.
A separate control domain can resume it. This can also be used on ARM32
MMU systems. Host suspend is a separate feature.

>
> > --- a/xen/drivers/char/serial.c
> > +++ b/xen/drivers/char/serial.c
> > @@ -490,6 +490,8 @@ const struct vuart_info *serial_vuart_info(int idx)
> >
> >  #ifdef CONFIG_SYSTEM_SUSPEND
> >
> > +static bool __ro_after_init serial_suspend_available =3D true;
>
> Nit: I'm not going to insist on a change to the name, but prefixing a sta=
tic
> variable in a file named serial.c with serial_ looks redundant to me. (I'=
m
> also inclined to suggest s/available/possible/, seeing how the variable i=
s
> set / used.)

Agreed. I'll rename it to suspend_possible.

Best regards,
Mykola

>
> Jan
>

