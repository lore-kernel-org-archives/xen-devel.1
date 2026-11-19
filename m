Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC24606A320
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 12:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=WTQlkWH9
Received: from list by lists.xenproject.org with outflank-mailman.1496270.1694907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU13Y-0004ca-Bp; Thu, 19 Nov 2026 12:16:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1496270.1694907; Thu, 19 Nov 2026 12:16:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU13Y-0004cT-9M; Thu, 19 Nov 2026 12:16:00 +0000
Received: by outflank-mailman (input) for mailman id 1496270;
 Thu, 19 Nov 2026 12:15:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xU13W-0004cN-UU
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 12:15:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xU13W-00000006gZf-23Nk
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 12:15:58 +0000
Received: from mail-lj1-f174.google.com ([209.85.208.174])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xU13W-00000000564-3DVg
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 12:15:58 +0000
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-3ae7d1ce1bfso2471001fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 04:15:58 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:Content-Type:Cc
	:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version;
	bh=HWmYoxK4kE/NONTGcoTdODBWogGT4su7hVU8Kr0N8qk=; b=WTQlkWH9HSyK0qux6AtMWczTAX
	irQxuZXRW3LaXF1h3ehcYI7y1rGrO6K9m31Y94gJ1iUWavFs65t4faBo8s2jSMIKeYx+OmSqYGcoP
	VwJJNjfpNaP3UsgetE6rE1EOPbleu4z6uk8FwDbueSZQTjsXyOuYZ+dWhAHjZWDv4ik4=;
X-Forwarded-Encrypted: i=1; AL+hErEyFLbeCyqTYVaP5cQIVN8/HOaMgqBKNCt0bvTbVz1d9OE0FOwp1FhcLi0ENZ/t7Knf3z9NFGbmR7w=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+aw1amAs9aFK3bEXfWtGuNdY8pQK3Ml5DlB4DXi2G9lCQPzVdk
	u6Yew/h1I7IRwes0M1prJuTq+lqLJY05HHCE8UUqvcEpivqR77Nnv/b6Gx4224/WMcBasofqWAa
	HvTMSBnpuuh4rf1TVXUQF0lMx/FZ+IfQ=
X-Received: by 2002:a2e:bd02:0:b0:3ac:ff0a:9d86 with SMTP id
 38308e7fff4ca-3ae670bea6bmr19761161fa.15.1795090557693; Thu, 19 Nov 2026
 04:15:57 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103-asi-hvm-v6-0-59dbc5ce9615@xenproject.org>
 <20261103-asi-hvm-v6-25-59dbc5ce9615@xenproject.org> <ff3a75ce-acf1-4fd3-abfe-9835a27d694d@suse.com>
In-Reply-To: <ff3a75ce-acf1-4fd3-abfe-9835a27d694d@suse.com>
From: George Dunlap <gwd@xenproject.org>
Date: Thu, 19 Nov 2026 12:15:44 +0000
X-Gmail-Original-Message-ID: <CAFLBxZY-=+J0YY2z2Q9e5wS6qD=5jfXagCJ6nofKF+-J1RySQg@mail.gmail.com>
X-Gm-Features: AclHuK8iDpMbvDjnzgjI0-3ZKZ8bFVwJRI0Bb8MupGtePstemFwAH-5etj3RYFk
Message-ID: <CAFLBxZY-=+J0YY2z2Q9e5wS6qD=5jfXagCJ6nofKF+-J1RySQg@mail.gmail.com>
Subject: Re: [PATCH v6 25/44] x86/mm: introduce a per-vCPU state window in the
 perdomain area
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
	Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 18, 2026 at 11:51=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 03.11.2026 23:13, George Dunlap wrote:
> > --- a/xen/arch/x86/include/asm/config.h
> > +++ b/xen/arch/x86/include/asm/config.h
> > @@ -158,7 +158,7 @@
> >  /* Slot 260: per-domain mappings (including map cache). */
> >  #define PERDOMAIN_VIRT_START    (PML4_ADDR(260))
> >  #define PERDOMAIN_SLOT_MBYTES   (PML4_ENTRY_BYTES >> (20 + PAGETABLE_O=
RDER))
> > -#define PERDOMAIN_SLOTS         3
> > +#define PERDOMAIN_SLOTS         4
> >  #define PERDOMAIN_VIRT_SLOT(s)  (PERDOMAIN_VIRT_START + (s) * \
> >                                   (PERDOMAIN_SLOT_MBYTES << 20))
> >  /* Slot 4: mirror of per-domain mappings (for compat xlat area accesse=
s). */
> > @@ -293,6 +293,25 @@ extern unsigned long xen_phys_start;
> >  #define ARG_XLAT_START(v)        \
> >      (ARG_XLAT_VIRT_START + ((v)->vcpu_id << ARG_XLAT_VA_SHIFT))
> >
> > +/*
> > + * Per-vCPU state window. The fourth per-domain-mapping sub-area: a sm=
all
> > + * per-vCPU stride of page slots holding long-lived per-vCPU structure=
s kept
> > + * out of always-mapped memory, each mapped once for the life of the v=
CPU at
> > + * a fixed index within the stride.
> > + */
> > +#define VCPU_STATE_SLOT          3
> > +#define VCPU_STATE_VIRT_START    PERDOMAIN_VIRT_SLOT(VCPU_STATE_SLOT)
> > +#define VCPU_STATE_ORDER         3
>
> As long as this remains <=3D GDT_LDT_VCPU_SHIFT, it won't further constra=
in
> MAX_VIRT_CPUS (primarily relevant to PV, when right here you cover HVM
> stuff only, but anyway). Nevertheless I wonder whether ...
>
> > +#define VCPU_STATE_NR_PAGES      (1U << VCPU_STATE_ORDER)
> > +#define VCPU_STATE_VA_SHIFT      (VCPU_STATE_ORDER + PAGE_SHIFT)
> > +#define VCPU_STATE_START(v)      \
> > +    (VCPU_STATE_VIRT_START + ((v)->vcpu_id << VCPU_STATE_VA_SHIFT))
> > +#define VCPU_STATE_ADDR(v, idx)  \
> > +    (VCPU_STATE_START(v) + (idx) * PAGE_SIZE)
> > +#define VCPU_STATE_IDX_VMCB      0
> > +#define VCPU_STATE_IDX_N2VMCB    1
> > +#define VCPU_STATE_IDX_VMX_MSR   2
>
> ... we wouldn't better conserve on space use from the very start: VMX_MSR
> could re-use either of the other two slots.

Sure, we can have "AMD-specific", "Intel-specific", and "Common" slot
sections, where the first two are effectively a union.

 -George

