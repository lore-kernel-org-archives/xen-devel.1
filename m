Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157C0606A324
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 13:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i0ZALrAc
Received: from list by lists.xenproject.org with outflank-mailman.1469829.1678585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOEsn-0004Qv-RX; Tue, 03 Nov 2026 13:49:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1469829.1678585; Tue, 03 Nov 2026 13:49:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOEsn-0004Qo-OZ; Tue, 03 Nov 2026 13:49:01 +0000
Received: by outflank-mailman (input) for mailman id 1469829;
 Tue, 03 Nov 2026 13:49:00 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luoyonggang@gmail.com>) id 1xOEsm-0004Qi-Dm
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 13:49:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOEsl-00DOVz-G3
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 14:48:59 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ae9e63f-e002-0a2a0a5209dd-0a2a4503a13c-28
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 14:48:59 +0100
Received: from [74.125.224.47] (helo=mail-yx1-f47.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ae9e64a-fae8-0a2a45030019-4a7de02fcc11-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 14:48:59 +0100
Received: by mail-yx1-f47.google.com with SMTP id
 956f58d0204a3-6767d92cde6so3855739d50.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 05:48:59 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:Reply-To:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1793713738; cv=none;
        d=google.com; s=arc-20260327;
        b=SA1028N6RlVygyDEE+p18gJTrlJ4TpiVvKdra9SxZumSEpliZ6glGW9n4e6xARo0YH
         SzrUIxXsjG0D6GkhD9LTG0dlq0qctMryhbMPPjyoj5yVgy81yQwrvZnBPTnNzyd23neD
         pZ8f0PQPXxlGk3w8wTMKwKqMrwZhA1OVrl86/nrhpx3X2ZUOEBldwVdJSPmY+lEgrqUn
         Ua8Pm2iEUSqUNiTCxJ0Z3kG3H7BQLTUq9+NMjntbRuw6atP5Undfus2eMHxuK2li/fVf
         Nu6zoyZrBbfk6RnnT6mKjapBaRnvfePAvC6ks90yxJKyugebK7Igfq7RK9Jmp4e6KRQs
         FD5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=VhJo4HokwhEWSYkNV3t4SWIVzwRlrhbcTP4O4ufZ8fc=;
        fh=rGVAC7EHbnI9ARDYn1on9tW4ofyxcDVsaDg/oGZhHeM=;
        b=bTy0iTBKo6kzPaUp8wx8wcwuZRNvrFCs9FLUmK0JpyQoHuPV8EUJ8sF0MbNxjCt3Vi
         8PurvDgB/KfP9Eh04DBcWcryOqUSX1L/B3cZMYos+e75PncwkF+/PgHIXbSc7SkETT0k
         Wy5BEhU36B9svJzalIeaCnsY96dO7NSQXtoTtAyMmpFmmsDUOcGCwnTgNmRQqsJnhcu4
         /GFfSZY5Qx50gwcrAqbty4LZEDpC4/u+cLp6IKrLbxsXLV6LfvDvJBWP2E7MEedJcJUb
         /EM9TJ+Cjzv47Bp3yr4F8hHhZTMYCQs9TK59L+cpmtiTNHzvz3BzhV3ktPofCc8I+Omk
         fbvQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793713738; x=1794318538; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VhJo4HokwhEWSYkNV3t4SWIVzwRlrhbcTP4O4ufZ8fc=;
        b=i0ZALrAcRGXwMi8vXFAiasxX742pZ5YmgLwMr/fKTnmysGOtvF5izXcWA89rxBM5wm
         0SSvyVoqiOVlSuxDSgNjK4T3UcVfDhM7bOx1RJjvfdt+f8GTIqQT0erX6iOZ95sQHtSB
         xd1Tky52NjfqFnJIJQlM087fPL51x2yIOkOfC5Sge+tmQFrQkfhBtNJgPSUv8hgIr4ej
         iU6rTyOPz6JTqnxlUsBjONPfYV2KoyaOagTfKO/b7BfFKZmhQ4sWssIlp9VW0FSC5Z42
         ezwodefJKjWzZIL1PsbkPF8O/5qM+TVOh+qwz2pPFP7Oo+mMNaO5u+hXmLiYrRZMwEaW
         Ensg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793713738; x=1794318538;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VhJo4HokwhEWSYkNV3t4SWIVzwRlrhbcTP4O4ufZ8fc=;
        b=Z/0jmCLjyKEb5aFENxpR9DXMuIArDEV0giipjveclXyGHH/xNJ+u0y5EM4gdmOZkaz
         Ivvy92K9ADQLLSjCTaTW7OiPR5nfemMs+o7xbH6NE4OOFBEOyHRmtZuiWv/XfrVGVZ7d
         zjTlTATx3bIjbnj0YbTh3UCxavEy0oLkWs+O+HnSGASHhukX3bZ2bgfV0LWOczEWeBhO
         zTBpwLyCfcfVXaUAJDCOE1tgkPha8xG6fOBJYwoK28XrK89dUxixlXiCz/ghECKJEJNC
         xhrVr2Elwg39TLSpLCoQLmQtzw6DXHGPrm+wQHobR0nxILDaEhSTaKmYcQGZKtsCgnam
         ieJA==
X-Forwarded-Encrypted: i=1; AKwUvBwqilJ6ltg10uPZOvtLhfYeMw/Puc0l8y3tCGggxta13hfXmLVhgeoEfiT3HWL8QBuQlKW1DLNZ3AY=@lists.xenproject.org
X-Gm-Message-State: APuU4Z89CLuEsbd5U6lm9J1mTFm8mCIAwmCxWPwBDqQ6JkuY6JhRkyZ+
	ox8nqFYqLN4YRMmu1EzEhG/oYPutEiJPkrB5r75b3ugiGM3kKqBavAjTdSWRroZMTpoOOHfb9rm
	GSLnfa2ykE/8fKA9QCdBd006a6pZqJhk=
X-Gm-Gg: AYBFou1sJNPbXNV8xk9q1XgjvUzcRgjAZFcw6trmDJdKR4QxNsq2cteoUQa8oyVH/yS
	qACMZMJ19DPjAE7M9kd7jsXAmdL2Sm+F6TQOK+0mfwM9g0byXThlbYZny+afOcJVb2QStjJbaHI
	e4Ervfiyne9sxSbErfsQvdFzFY6BC0aCtZ02eDdT/etS3xXiEIihlc8Z2m2v+ZxyY4t6s9jmZCt
	Nh+l+7k2QcF841zrHe8wn32TqyYk2xDGf2lr4qOLZrq3KKuPJmnr57Le2EJO7p6SDalEFh9pLME
	9jNnv9ESzFnjtiwZ4AFw4qnCUg1OZtuzS1OL3KVAiYCvNx0BDAq0MR3wqXselTBRu1OhxG3iwaK
	LoNK0G08RXKT4FJhK0WGU3dbNnq0YLdqFjWRV2Q==
X-Received: by 2002:a05:690e:b89:b0:677:d251:ccd9 with SMTP id
 956f58d0204a3-67ba500f58dmr9210985d50.48.1793713737821; Tue, 03 Nov 2026
 05:48:57 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030151539.1872-1-luoyonggang@gmail.com> <d1db54c6-b802-676a-7779-0c2c63f5f807@eik.bme.hu>
 <aa70e94c-d9a8-41c9-850f-7ded87f7f327@oss.qualcomm.com> <aumYOBw-nKQAWdYK@redhat.com>
 <CAE2XoE8Xwevk523OfB+GgwbRu0iVnyD4VNOx81rj7J7F5aq=OA@mail.gmail.com> <54851326-3627-2b86-57d6-c338ed4e4b50@eik.bme.hu>
In-Reply-To: <54851326-3627-2b86-57d6-c338ed4e4b50@eik.bme.hu>
Reply-To: luoyonggang@gmail.com
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Tue, 3 Nov 2026 21:48:44 +0800
X-Gm-Features: AclHuK-kyxeFGeOmdxTnC2slmrHrvKR4DYxVNGXjAJzfbSHbPByoLDfveF6OVPE
Message-ID: <CAE2XoE_P2mZAT8wZwzFsTqJTK8nxNSSqJRrOM2T-AJkQjwJHBw@mail.gmail.com>
Subject: Re: [PATCH 00/15] hw: expand DEFINE_MACHINE to explicit TypeInfo registration
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-devel@nongnu.org, 
	Anthony PERARD <anthony@xenproject.org>, Felipe Balbi <balbi@kernel.org>, 
	Aleksandar Rikalo <arikalo@gmail.com>, Philippe Mathieu-Daude <philmd@mailo.com>, 
	Antony Pavlov <antonynpavlov@gmail.com>, 
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
X-purgate-ID: tlsNG-33051d/1793713739-6C6DE4E9-B1D73949/0/0
X-purgate-type: clean
X-purgate-size: 4480
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 3, 2026 at 9:23=E2=80=AFPM BALATON Zoltan <balaton@eik.bme.hu> =
wrote:
>
> On Tue, 3 Nov 2026, Yonggang Luo wrote:
> > On Tue, Nov 3, 2026 at 4:16=E2=80=AFPM Daniel P. Berrang=C3=A9 <berrang=
e@redhat.com> wrote:
> >>
> >> On Fri, Oct 30, 2026 at 05:51:44PM -0800, Pierrick Bouvier wrote:
> >>> On 10/30/2026 4:09 PM, BALATON Zoltan wrote:
> >>>> On Fri, 30 Oct 2026, Yonggang Luo wrote:
> >>>>> DEFINE_MACHINE and DEFINE_MACHINE_EXTENDED hide the TypeInfo and th=
e
> >>>>> type_init
> >>>>> function that calls type_register_static(). A later change needs to
> >>>>> pass a
> >>>>
> >>>> That's the point of the macro to hide the boiler plate code.
> >>>>
> >>>>> target mask into that registration, and the macros have no paramete=
r
> >>>>> for it.
> >>>>
> >>>> Couldn't you just change the macros to take that parameter instead o=
f
> >>>> expanding it everywhere?
> >>>>
> >>>
> >>> Problem of macros is that they don't have default parameters, so you
> >>> need variants for everything:
> >>>
> >>> DEFINE_MACHINE
> >>> DEFINE_MACHINE_EXTENDED
> >>> DEFINE_MACHINE_WITH_INTERFACES
> >>> DEFINE_MACHINE_WITH_INTERFACE_ARRAY
> >>> and now would need a new variant, with variant for other existing one=
s.
> >>>
> >>> In the end, it's just simpler to remove this and add the boilerplate.
> >>> It's written once and never modified, so using a macro just save typi=
ng
> >>> those lines once.
> >>
> >> For each machine, it is only written once, but we add machines
> >> over time, and every time a new machine is added the code style
> >> is slightly different. We introduced all the variuos DEFINE_*
> >> macros for QOM to better ensure consistent style and usage as
> >> new code is added over time.
> >
> > I understand that the DEFINE_* macros are bloating because of this.
> > Indeed currently the only two macros used are "DEFINE_MACHINE" and
> > "DEFINE_MACHINE_EXTENDED"
>
> There are a few machines using some others but these are the most used.
> That suggests maybe we should change the convenience wrappers to match
> what machines need but DEFINE_MACHINE_EXTENDED is meant to be the one tha=
t
> allows all parameters which should be rarely needed.
>
> > ; each time people want to add a new attribute, the macros is twiced.
>
> Not necessarily. The SECURE parameter did that to preserve previous
> behaviour but if you add new parameter changing all callers (which is the
> same as expanding the macro that would also change all callers) then it's
> just a new parameter added not changing the number of DEFINE_MACHINE*
> wrappers. Rearranging the wrappers to make DEFINE_MACHINE_EXTENDED used
> less is an independent change.
>
> > And the usage of DEFINE_MACHINE_EXTENDED is rare and can be replaced
> > with DEFINE_TYPES or TypeInfo
> > and be more explicit. When we used as macro parameter, we need think
>
> But that defies the purpose of hiding the QOM boiler plate as much as
> possible. New people are confused by QOM and it's easier for them to look
> up documentation on the DEFINE_MACHINE* macros to see what parameter is
> what and not care about how it's stored in QOM TypeInfo or what is that
> at all.
>
> > what's that parameter means, and for
> > TypeInfo, we can directly know what that member is about(because we
> > are assigned with the member name).
>
> The parameter also has a name and documentation so it's not simpler to
> look up TypeInfo than look at the macro definition or docs. In fact it's
> harder to guess from TypeInfo as then you also need to get into QOM.
>
> > That's why I suggest keeping a single DEFINE_MACHINE, just like
> > DEFINE_TYPES; as they are the most
> > used macros(and simple enough), and won't suffer from changes much.
>
> That means exposing all the boiler plate for all machines other than the
> simplest case. I think it would be better to keep DEFINE_MACHINE_EXTENDED
> but maybe rethink the existing wrappers and drop unused ones and maybe ad=
d
> new ones that reduce the usage of DEFINE_MACHINE_EXTENDED but still keep
> the boiler plate hidden.

Thanks, I'll go this way, remove unused macros, and keep DEFINE_MACHINE_EXT=
ENDED
and extend both DEFINE_MACHINE_EXTENDED DEFINE_MACHINE supports
"targets" or "arch_mask" parameter.


>
> Regards,
> BALATON Zoltan



--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

