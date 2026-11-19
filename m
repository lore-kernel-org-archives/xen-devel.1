Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A927606A326
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 05:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nXX0WfJq
Received: from list by lists.xenproject.org with outflank-mailman.1495690.1694493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTuyA-0000Ad-L4; Thu, 19 Nov 2026 05:46:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1495690.1694493; Thu, 19 Nov 2026 05:46:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTuyA-0000AW-Hu; Thu, 19 Nov 2026 05:46:02 +0000
Received: by outflank-mailman (input) for mailman id 1495690;
 Thu, 19 Nov 2026 05:46:00 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <irogers@google.com>) id 1xTuy8-0000AP-OV
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 05:46:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTuy7-00AooK-L8
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 06:45:59 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <irogers@google.com>)
 id 6afe8d01-8faa-0a2a0a5109dd-0a2a450c884a-26
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 06:45:59 +0100
Received: from [209.85.160.174] (helo=mail-qt1-f174.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <irogers@google.com>)
 id 6afe8d16-f479-0a2a450c0019-d155a0ae9126-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 06:45:59 +0100
Received: by mail-qt1-f174.google.com with SMTP id
 d75a77b69052e-55be673e029so117351cf.1
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 21:45:59 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=google.com header.i="@google.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1795067158; cv=none;
        d=google.com; s=arc-20260327;
        b=Vz6zA4Qoe7lhtbn69/ARAczXXqeaO0KKDsTEh3nmIQtoOJzOPsN+2gaQ4n59WJbCgf
         EXVpcoN0pGSpIug6JO/U5fQJ0xpnG1VVUqHxbWoN21n5ZOxFODIoSUzVQUWdY3xWtrKU
         Kw833ndlZYoNKAmx0L0o9LVmIc0++I2lzCxaU5ro3c0Hj16DdiKGU40iBDLMhhpfCLWw
         JDz+uR02qZFm5tiQ8cP/TupZby8x5HwCS17o0kdecpGycOfkcgKbMKCN8lmoLW8dOIvO
         lwwgOQ8Kdap8gI/bMcIuSF+rgWW/oWFR2qRoNagqn3yHGpgCynj/Ew/NwFfCaAnAKwiX
         wMlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cIkoHsOVRZS7gIowPl6xkao6tH+bfcK9X/Z+HF8PGU0=;
        fh=YNw5Bu8yimON7VdOZW3GUBIittkH8mYhBJJox3P6BLw=;
        b=d7ZbyoTfDzf7GSyJ5U5etoZeta9DiGe3EI4y8dhBkTrkYGhDGuplTpI0ct6i+ogqlc
         Ei8pmzOXv8y/ohctWZEOwUO30WrbBe8LtocxkGuZoaj3qsLOVBdwLRNTU2YNScJx+aqS
         hrQ2dsE2asE0Ubs77yStL6GYNZM2baluH9L8OpFuItdHafyIhwI75z5ulUkUCn3xGkBF
         hKbWfJ7ho2RmPHEEtIizqzCe7MuYUZ3zeVpF+BTqNeotq7xAyYdUnl/AWfllYpZw/mze
         rN6Cb6Xbk6s0OblQ2yWKZQA0HoaCwkMJkiwsxXvyj7/vfkrPj23YEGz7+cSmaK9XFcTa
         nLpg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795067158; x=1795671958; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cIkoHsOVRZS7gIowPl6xkao6tH+bfcK9X/Z+HF8PGU0=;
        b=nXX0WfJqFltgvyG3Ka3njMAcxH1bXgVZTRlo0wfTTUU5VYGEjISXuw/PwpnhG5IvGU
         5I2DVDG3g8GJCvcGzqgiEffftqFJN7MksNPsYKWvqV4GReS5HTUN2adBZ7EFtsATOp2y
         ksTCH4PMP6yNiwYtJGbG28D8fGL+AkYFuKGXiojk/tN44jP+pO+4fPl+pMqgMIN/8noj
         9D1jC+yCHqJekMQ0qjMBCPuCCyzh/juLCF/dOlMmsjDQ1Z7cANy1JlOl6Ue+SlH43YHV
         i0yAerVCXYPtp/ofYXqjVqVE4nmcdqw4lIH82XoV7GqClVRQ42vDJGXmMnNW4lrv7yS7
         HHkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795067158; x=1795671958;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cIkoHsOVRZS7gIowPl6xkao6tH+bfcK9X/Z+HF8PGU0=;
        b=Wchv+vXnLLEPQE8WGKv/2kB98U4dg33mRs07P7c6ZncH8fKSU8YS85R1pATH32EBR4
         dH91uGB6LqiODBuUAfFoZXScy9HZqZo+6mwaGGHvsqSl99hTJnl55/KvBllvJ+RudYYZ
         +xVUOH17ZYaXizIlYrZ3H5iWfdAiAeoGxUC7C3C6PIiP5vEropZ0Ng+J9PI1TOJqklQq
         nddgMFEWdx2YS4X83iSIq2dgjPDCsadtBWRv1Pb1ELjvsiErH0evoBaUzQPx67ORz2Aq
         GL2eGfE7Aqmx+jX1oU4LrUXs9LcAEXw62tCdPPNGLTajUen+WRMYMhm7ynHRVh7/JzJ3
         383w==
X-Forwarded-Encrypted: i=1; AL+hErHz5An9v2V6ymBfqi0C+GWnCZ3ru5R1cUZQ+S/4Q12sZrRSVMnbLno8XGh3VqXgpto6eNGHQHDirdI=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9BGwGBcV8mDAs9crYjAuXv81fSEwsP578TCizDfp+WzDgvWMP+
	vZp5n68SiXIQnUT8SmNR0NM5kf/yl0LQECeizReFr8r2NroAsaQVdYtYjm3flyVg3JYZCJzJsJ3
	/AGnyTjrakbLdFgW7ReUr0jmdJtjBiMYkliTvF6O8
X-Gm-Gg: AYBFou1OFG4JYcYsIcvBq6UmcvjmhkNlK6izkUyM5AfDWU6epTp7+vXLfliB2WvaYBD
	d+jGQHLN0XJ1b/KkcaSdvSVN7N5Q2QKUT9HT65IUSxRsbuFqCx6QJ6Ry21l2/jwy+gvtdP3u490
	+v2rqbIBcnaEoTuyae424dyZJW62Fv3/hr4JNnpWsOxnETSHtfVmtxQzJ3K7UUF463ZX69GULCR
	2u+OQsmojVMfVzjaGiMzlIcnvzTIRtfl4+UEZsC8Lbnkw3rT/ltqGWMeIuEkeyiQbFPShcwYa16
	biGHOCiFB8HEg4e8ydBBl2uqr+ckVnXhggxFl1NrRmJ/30/efCA2PNH2kTjcOoEQzV7vfY/sKVA
	pl6cgBW4MwoYC8+Z/Whh5GnYK3hGBC+niXaAr
X-Received: by 2002:a05:622a:4808:b0:536:934f:7da2 with SMTP id
 d75a77b69052e-55d6c7995f9mr6557911cf.2.1795067157461; Wed, 18 Nov 2026
 21:45:57 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261108223913.3624571-1-irogers@google.com> <20261108223913.3624571-10-irogers@google.com>
 <DMYN979QJFNV.LM3T6O68OHW6@kernel.org>
In-Reply-To: <DMYN979QJFNV.LM3T6O68OHW6@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Wed, 18 Nov 2026 21:45:45 -0800
X-Gm-Features: Aa3M54p8GzPfKDPQ_HJcPbdLHGq3vwK7n9VGnVvnVB1ODjbFHeHwrlgOfVCaaEo
Message-ID: <CAP-5=fXrMyfLFXq6CiqwWMSbtYVRNESxuDo-ddqNwDmq5Nm4SA@mail.gmail.com>
Subject: Re: [PATCH v3 9/9] kobject: Require explicit initialization of struct kobj_type::release
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kees Cook <kees@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>, 
	Srish Srinivasan <ssrish@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, Alexander Aring <aahringo@redhat.com>, 
	Felix Kuehling <felix.kuehling@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Zhihao Cheng <chengzhihao1@huawei.com>, Sumanth Korikkar <sumanthk@linux.ibm.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, driver-core@lists.linux.dev, 
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, 
	linux-s390@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-mtd@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-d25034/1795067159-76EDAA5B-B29DE801/0/0
X-purgate-type: clean
X-purgate-size: 2626
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 18, 2026 at 1:11=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Sun Nov 8, 2026 at 11:39 PM CET, Ian Rogers wrote:
> >  static const struct kobj_type cpuregs_kobj_type =3D {
> > +     /*
> > +      * Pre-existing: info->kobj is embedded in per-CPU cpu_data;
> > +      * cpuid_cpu_offline() only calls kobject_del().
> > +      */
>
> All of these comments carry a =E2=80=9CPre-existing:=E2=80=9D prefix, but=
 that doesn=E2=80=99t
> distinguish cases with broken lifetime management from those where the st=
orage
> remains valid despite the API misuse.
>
> For example:
>
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_xcp.c
> > index ab14079d1c42..0847134a1391 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
> > @@ -797,6 +797,11 @@ static const struct sysfs_ops xcp_cfg_res_sysfs_op=
s =3D {
> >  };
> >
> >  static const struct kobj_type xcp_cfg_res_sysfs_ktype =3D {
> > +     /*
> > +      * Pre-existing: xcp_res is embedded in struct amdgpu_xcp_cfg
> > +      * rather than freed individually by kobject_put().
> > +      */
> > +     .release =3D NULL,
>
> Being embedded in another structure doesn't explain what guarantees that =
the
> enclosing allocation outlives the kobject=E2=80=99s final cleanup.
>
> Could you please drop the =E2=80=9CPre-existing:=E2=80=9D prefix and make=
 that distinction
> explicit? For broken cases, describe the lifetime problem and mark it as =
needing
> a follow-up fix. For cases where the lifetime is safe, explain what guara=
ntees
> that safety, while acknowledging that omitting release() still violates t=
he
> documented API contract.
>
> Also, do you plan to follow up on those cases?

Makes complete sense, thanks Danilo!

Auditing all 17 files in patch 9 with that distinction in mind:
- Only 3 built-in sites (arm64 cpuinfo, ACPI hotplug profiles, and
s390 sclp_mem) have backing storage that genuinely remains valid for
the lifetime of the kernel.
- The other 14 files either free/zero an enclosing dynamic or devm
allocation without waiting for final kobject cleanup, or are tristate
modules that unregister static kobjects/ksets on module_exit and can
unmap module memory before delayed cleanup finishes.

I've dropped the "Pre-existing:" prefix, documented the specific
guarantee or FIXME lifetime hazard at each site in v4, and yes, I plan
to send follow-up fixes to the respective subsystems once __must_init
is in place.

Thanks,
Ian

> Thanks,
> Danilo
>

