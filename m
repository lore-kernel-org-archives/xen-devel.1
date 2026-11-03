Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93723606A32E
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 09:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZgUXexzq
Received: from list by lists.xenproject.org with outflank-mailman.1469323.1678169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOAcU-0003l6-WC; Tue, 03 Nov 2026 09:15:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1469323.1678169; Tue, 03 Nov 2026 09:15:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOAcU-0003kz-Sp; Tue, 03 Nov 2026 09:15:54 +0000
Received: by outflank-mailman (input) for mailman id 1469323;
 Tue, 03 Nov 2026 09:15:53 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luoyonggang@gmail.com>) id 1xOAcT-0003kZ-JB
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 09:15:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOAcS-006SKu-27
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 10:15:52 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ae9a646-8faa-0a2a0a5109dd-0a2a4509dfce-2
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 10:15:51 +0100
Received: from [209.85.208.51] (helo=mail-ed1-f51.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ae9a647-be1a-0a2a45090019-d155d033c8b4-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 10:15:51 +0100
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-6b413b0a974so5919784a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 01:15:51 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:Reply-To:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1793697351; cv=none;
        d=google.com; s=arc-20260327;
        b=ezqoDEDR4OVl2/TG8kOfJzFKUrjDo7dZ9gYjsxwITETQnwi28NhF0Sw+QhpTOm7npH
         EQOGH9PMhoAGa5KWONFBc/KfHDxKivrWkxWQz9yILNVfoiMtbB59XmaF1mGejymUU9uw
         t5v/Ue/Qq/8k8kQYZp9faIbBJSA4myRo/P4vLLFBsQG1g7j5207AGuFiJXgFBdxM/7Zq
         WHLQj/nsoIcg9Yg3AR+hE+0W5MT2bORDEhyJg7f9Ijz3WkrjbzKwuV+5SOJR/UCp+NeP
         JPgmFbxN3AjKZ07JWfZC6YyxzUsKAyeygIb3NFlourBTp7IJrlQFSrjEFwabbRociUoS
         89bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=6HpPn4PoYBNIQe4jwAq6RYNc4y0GSA5S0U2wFZLAcN4=;
        fh=bPC2PGMQmpuQGGT94eSxX5wfaBnz1TqG72hOn9rgZJI=;
        b=UGy3+mhPDLOOEKpii0GpD5M591VK6spZNOdu1A6zrNmaxQEbe9r38dCN04vgsX0ULf
         PUhF89i3oyr0hf4ujcClpW6HKonA4xduLJT6OtM46a720RL2dYI6+HQBOoFrv5Yg5S5l
         fV6ExYo0t9F1TKR78s6zOYGcZYcMlXoP8Pm4sAlNH6rq4x8D1/RSLf7nPc7G9k4k+yPK
         Z1ZqKQICXniMIPYB91ciqhhq8gKYd1a3eCdb8PFRmqpNX34aDI5k/DQK8+lTSTBXflTu
         gB/DKM5PFWp0IwmmiV7E8Ipngzef3CO4J8BVw72L942XOefE4aygQu7eKsmHLUaCPrUs
         /Svg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793697351; x=1794302151; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6HpPn4PoYBNIQe4jwAq6RYNc4y0GSA5S0U2wFZLAcN4=;
        b=ZgUXexzq/ELq1lBf29PLxT5Wbf67Ftwcn9EtmgkY93vyM2hN66xh/WH/yfb6Tl7bAv
         yPT22Za0loPtDNziXW8HgwFwfio3Kw3QWAarNPo5QTrVbCICRweJfgZ+oix/QC3Q3wjH
         n++52R8QvcouwhQcUObJR07ctLw5g7unfO3X2/yY9Fixbp6wbXMWQK1ooz9mzuIQfyQP
         Sgzlar72PmmumDj3TVVp2Dl4Zqjdm3FVafLQ3xiZ+hEaKbYOhYrJv4o8bAFBuKnGC5pV
         j4Hjshsrlqv1JC9EDsy9Gnv9J5BvhoLBw8Gpt3dZCPemF0VvwwkmFcBK7X/vbMuGIMhh
         x6Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793697351; x=1794302151;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6HpPn4PoYBNIQe4jwAq6RYNc4y0GSA5S0U2wFZLAcN4=;
        b=Bf2ai0S0es5pbm8XkZduRK0xVZTmkgV6WMSqvFAPrO6vwG2Et0EATAtrlIW9Qg2Xgh
         ZhYUenxHYtEzb/7VoRMuPEaEZu0faBkuLz1bIbYovPW2FQ3VZcCR05jHLgSNj/Ba9EUG
         hsfmkh/0irN1Lra9+ZVY+Bc3eL+hwAvkNbncWquzQlPbco+p51IdYiZv69G7oz0gD3Iw
         4LvnYp0FNVd4bSk/L5hmQH388+kAl3GQereKfxX7kCrZSz4O9PPrV6/oYZKd2htqRnwV
         98JtROyrZyb76v4h6/Kq6RYjCSLb0Q8pPzaXgcrNN62P8WzoNSJLwgZK1yzMFgm7Tm9j
         A1TQ==
X-Forwarded-Encrypted: i=1; AKwUvBzZ2v6EGZU1tD/V8l6hxVcoRvSbmveMWb09xE76+h5JFmukHI0yh4kGh5+nEEmcy26ENoLoFc33wrs=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+A+1dsDBWxjwQDME3n5a/EzKeQIHInXh8n6fThbSWCZJ5+sYaH
	1fJ8el+jzrWzPV5udxA3VGXx8o/oKmmzHWAh9O1DVpt9wtDDlbA5kw0nezxS/yrpf9JfMr1gtSO
	wOmeJhnLwO7wIZT2/fv591vrieGfkEYQ=
X-Gm-Gg: AYBFou1UBkxP7AHR4eg+wIPZI6jd7wybvd/lbh/BR9U93hGXVYOvydHaO6dtW1ZsuIK
	dOfIOTMm5VCAKO9zxpcJBdh3bHwStHVslOh4s1AB4H3Oy3zQhPtmQmBo1hvL1iCWxPp9zHICAoU
	u4GWCBYI8nM6L3M4xkXX3gKSHC4N4SKwJQgaSlhDrbkVzMXslOSe2HMT4f0QaGYlHJO59P5V1aD
	fR77pHfBwRiEdZI9mx3AxhL55BnHi1IksVTd/9eY89lyG9wMgFut4QNlxsQI0ES+uqPha6qFLJr
	v84LY7O58oaesFJ5eBmJ2HGp321bkTujTmGm5Owxpw+bk6e1Sy/fLFTNLWjJT0lfs19cyErBSGH
	mNiXJn/ceAB2ohE5BVciJOndiIlNJhpAvBasb
X-Received: by 2002:a05:6402:2355:b0:6b4:20bc:fa3 with SMTP id
 4fb4d7f45d1cf-6b4d467bb11mr9345520a12.22.1793697351217; Tue, 03 Nov 2026
 01:15:51 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030151539.1872-1-luoyonggang@gmail.com> <d1db54c6-b802-676a-7779-0c2c63f5f807@eik.bme.hu>
 <aa70e94c-d9a8-41c9-850f-7ded87f7f327@oss.qualcomm.com> <aumYOBw-nKQAWdYK@redhat.com>
In-Reply-To: <aumYOBw-nKQAWdYK@redhat.com>
Reply-To: luoyonggang@gmail.com
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Tue, 3 Nov 2026 17:15:38 +0800
X-Gm-Features: AclHuK9NUtlMJehxCaFT4QHnxh-0yBZ0hPP8kK9uDqXwDHrUyauf19YUe8SC3VE
Message-ID: <CAE2XoE8Xwevk523OfB+GgwbRu0iVnyD4VNOx81rj7J7F5aq=OA@mail.gmail.com>
Subject: Re: [PATCH 00/15] hw: expand DEFINE_MACHINE to explicit TypeInfo registration
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, BALATON Zoltan <balaton@eik.bme.hu>, 
	qemu-devel@nongnu.org, Anthony PERARD <anthony@xenproject.org>, 
	Felipe Balbi <balbi@kernel.org>, Aleksandar Rikalo <arikalo@gmail.com>, 
	Philippe Mathieu-Daude <philmd@mailo.com>, Antony Pavlov <antonynpavlov@gmail.com>, 
	Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Subbaraya Sundeep <sundeep.lkml@gmail.com>, 
	=?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
	Max Filippov <jcmvbkbc@gmail.com>, Niek Linnenbank <nieklinnenbank@gmail.com>, 
	xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org, 
	Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-ppc@nongnu.org, 
	Alexandre Iooss <erdnaxe@crans.org>, Weiwei Li <liwei1518@gmail.com>, Zhao Liu <zhao1.liu@intel.com>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
	Thomas Huth <th.huth+qemu@posteo.eu>, =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Yoshinori Sato <yoshinori.sato@nifty.com>, 
	Frederic Konrad <konrad.frederic@yahoo.fr>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Peter Maydell <peter.maydell@linaro.org>, Chao Liu <chao.liu@processmission.com>, 
	Sai Pavan Boddu <sai.pavan.boddu@amd.com>, Alistair Francis <alistair@alistair23.me>, 
	Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>, 
	Gaurav Sharma <gaurav.sharma_7@nxp.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Alistair Francis <alistair.francis@wdc.com>, 
	Artyom Tarasenko <atar4qemu@gmail.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-bad1c0/1793697351-3BED6034-7BF4A051/0/0
X-purgate-type: clean
X-purgate-size: 2661
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 3, 2026 at 4:16=E2=80=AFPM Daniel P. Berrang=C3=A9 <berrange@re=
dhat.com> wrote:
>
> On Fri, Oct 30, 2026 at 05:51:44PM -0800, Pierrick Bouvier wrote:
> > On 10/30/2026 4:09 PM, BALATON Zoltan wrote:
> > > On Fri, 30 Oct 2026, Yonggang Luo wrote:
> > >> DEFINE_MACHINE and DEFINE_MACHINE_EXTENDED hide the TypeInfo and the
> > >> type_init
> > >> function that calls type_register_static(). A later change needs to
> > >> pass a
> > >
> > > That's the point of the macro to hide the boiler plate code.
> > >
> > >> target mask into that registration, and the macros have no parameter
> > >> for it.
> > >
> > > Couldn't you just change the macros to take that parameter instead of
> > > expanding it everywhere?
> > >
> >
> > Problem of macros is that they don't have default parameters, so you
> > need variants for everything:
> >
> > DEFINE_MACHINE
> > DEFINE_MACHINE_EXTENDED
> > DEFINE_MACHINE_WITH_INTERFACES
> > DEFINE_MACHINE_WITH_INTERFACE_ARRAY
> > and now would need a new variant, with variant for other existing ones.
> >
> > In the end, it's just simpler to remove this and add the boilerplate.
> > It's written once and never modified, so using a macro just save typing
> > those lines once.
>
> For each machine, it is only written once, but we add machines
> over time, and every time a new machine is added the code style
> is slightly different. We introduced all the variuos DEFINE_*
> macros for QOM to better ensure consistent style and usage as
> new code is added over time.

I understand that the DEFINE_* macros are bloating because of this.
Indeed currently the only two macros used are "DEFINE_MACHINE" and
"DEFINE_MACHINE_EXTENDED"
; each time people want to add a new attribute, the macros is twiced.
And the usage of DEFINE_MACHINE_EXTENDED is rare and can be replaced
with DEFINE_TYPES or TypeInfo
and be more explicit. When we used as macro parameter, we need think
what's that parameter means, and for
TypeInfo, we can directly know what that member is about(because we
are assigned with the member name).
That's why I suggest keeping a single DEFINE_MACHINE, just like
DEFINE_TYPES; as they are the most
used macros(and simple enough), and won't suffer from changes much.

>
> With regards,
> Daniel
> --
> |: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
> |: https://libvirt.org          ~~          https://entangle-photo.org :|
> |: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|
>


--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

