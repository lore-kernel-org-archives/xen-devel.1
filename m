Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CC6606A321
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 22:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Kt8CmQfx
Received: from list by lists.xenproject.org with outflank-mailman.1480441.1684352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQXsT-0005ju-75; Mon, 09 Nov 2026 22:30:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1480441.1684352; Mon, 09 Nov 2026 22:30:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQXsT-0005jn-4Q; Mon, 09 Nov 2026 22:30:13 +0000
Received: by outflank-mailman (input) for mailman id 1480441;
 Mon, 09 Nov 2026 22:30:11 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <irogers@google.com>) id 1xQXsQ-0005jW-VW
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 22:30:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQXsQ-00C3AJ-4T
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 23:30:10 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <irogers@google.com>)
 id 6af24972-e002-0a2a0a5209dd-0a2a4509b452-0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 23:30:10 +0100
Received: from [209.85.160.173] (helo=mail-qt1-f173.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <irogers@google.com>)
 id 6af24971-be1a-0a2a45090019-d155a0ad9127-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 23:30:09 +0100
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-535f598d126so39731cf.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 14:30:09 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=google.com header.i="@google.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1794263408; cv=none;
        d=google.com; s=arc-20260327;
        b=fJNbN6G5xcnBfxIQxqqqMpis0T+ySwGeWXET8uvybylMG1tOxjm+mRwrNGPXyc/X3g
         bp71xE1Ch7etqtijqzYoTgz1S4/ClklsR0PzD5VfhLpkf7APlazuapn8QOTB/IxRZj+W
         V/lOh1ZUo3b1fNdMW6Rmq7j51FPv0TC468xG0Nn3KnId2daqMXDmz1no4A4QRgEIpnV7
         LI7xnacxXAWcby9L7o3sdgqHlUzXIYyY+ldB/5YFLErSxY3044AXx6T8aNhHRGC44HlI
         0MkldA45SnCtD2fKsPxgXHVTJ+q/RavGr90Swj+EvVooNChxytlGZwWS8mrltL2j2kSA
         J9xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S6J9qhUwfhfejNNDnNi/t39zME3R/+tshu3QmKCryWs=;
        fh=wGlH6owyz56d8d1N2OQXFqJvOmG9yCLb9N3kRuWzNAw=;
        b=V9yh4HM9n6IYJUMoMEv/oJ2tJuCDggLoWwtMCQCmHD3Kos4I4yzZNzcJ3fA+nsIimJ
         dD0nGjvdG/fe/szNVIhSTSBFnz1icO+NocJykursnMlcBatBIKxQHF7Tz5qAsnvulOKI
         f+R2SQlSJ1h2wU3iivS5HkkuIyFKCtDT+aZCG3OJ2LXhWoVhN7RhHBq52vT7jbd+1LB1
         piaK18E0Jjf5oS3m72/GLbFZ//4LYF1sjECXrG27JvZpOxqJ5SlA9R8UIU3mteY3upfU
         Qv7H7Gv24gYy0M9Zu+W1jlXwICrELQJpPuFViKxNsc1957rgdVF9QeN3IW6rYIimSIG7
         EgTg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794263408; x=1794868208; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S6J9qhUwfhfejNNDnNi/t39zME3R/+tshu3QmKCryWs=;
        b=Kt8CmQfx8xPjC32xppqKIEKLiE7TqO072XQO6D1pS8U01BNmSPiwcbWfADWbU4FlNL
         5lQMduX1pzuhtAbdIMZZnZ9OzqF7M/upwNFnZ18gYyzxh39PZv3lG1gLxF2INTPQ60XW
         XYcnGmZQB2KXf8rYZLfjbQ1ar9QLt2jlTYzwCUkyWqnAUofL4pQQpQKog+dB4qYd0DBX
         7OgjSbXyO+WWNyKS7PuhC/Rs0Ha6V7WwAyhdf6ZHlamkXv4Oi0zSVy/Zas6J2bcde6sV
         N6MLmEffWmnMs4W/SAGgKjupjqAVkn5aHataFGTgkLiBcxyES34PApmWfuabZg/Z5C7n
         Mddw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794263408; x=1794868208;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S6J9qhUwfhfejNNDnNi/t39zME3R/+tshu3QmKCryWs=;
        b=P+rs6Ze8tbeAtjM9/S6RjxAo0UHHdcPR1RLw7vZzpTRY51byOyPx5z0akMv3o3JuW/
         3H6z+pcCezg9yPW5Pk2fOCvjsNKxwW8DXSYs8ILaL+it9ywHoWZZlvabl2rYrT5JlG1g
         +oDxX2qGZ7figRbUTRMsHc+HO3l5+W73XUdRXrKSanCohFUQiZxIqJDj307tcQ+mvmH1
         TySeBW2hd9U7HFnQi1t5HF0yw5Yugzb2XxbErO6HdrVD81TmQ+K+QiX0B5xF++zYjk1H
         afr7jTJarwFLLcr/+JXaF10MzrviokeeEj6oQJ5uy1dG8rJCrmt5El+qXfPI2LI99sRq
         Jveg==
X-Forwarded-Encrypted: i=1; AL+hErFwbKak4Lr3POX4IIVdiC17O3UWUFWA54f6EqurHGWshyBhT4SiUYT3G/x6LVAozO4s/aM+XLqJPW4=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+uAhr84UOFF5xNvsJN24MNWWzTNTqHMkbRmX81kbgkiXzDpKEv
	uf719MTcyU0vQZ4oXGSbQONn9g+sTaut9qkB9iKT9Il9aE7euxlnX/PWGwXFlBwPR0XG+J6Htlv
	GKjJ+/BwGaPUfq04zrlGDQLOBxXSuNrqM8uK4KR3D
X-Gm-Gg: AYBFou3TcP//9MODi1is75bvbSikSPg20L6FQd+KBZduUzEkK0aonAVdwbda2a2n6TB
	9V7UXQ2QIJR6ia/7aAbZWiXWn83ngNrNebTTpKlFfVMQUsoz+P+hOccUdvZvRHt344qeSFsdkl0
	ecDCzJrMLwWpOivJSrRB2MEXNKglFe1WxWTU63iqjYguIPTAD8ehkbdbJ+WtOQnsfcIl9EX4tZZ
	RDLlg/KC9BOSZyuQw7QsvTU1G2oA8Awg5qrYPQ3X838RPMEA9XzEtOxTDZ0F6IoxOWpKztz7B47
	0yt0mhU54gijBB6rrRcLzxpaYIA1mOl13yhNZCuXwSa3msSxQIO7mCFl/MPonFtVBpWHB0hyvRK
	FdshwPSWX0IQozXqiwKnua7BREi9rNFDur79j0WlZ9LHgPkv16E63v4BFa0mty1c1lb8=
X-Received: by 2002:a05:622a:1b16:b0:530:e00f:7768 with SMTP id
 d75a77b69052e-555290bb288mr6464421cf.0.1794263407457; Mon, 09 Nov 2026
 14:30:07 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261108223913.3624571-1-irogers@google.com> <20261108223913.3624571-7-irogers@google.com>
 <b8d171de-52fe-474e-96db-d119840c6240@suse.com>
In-Reply-To: <b8d171de-52fe-474e-96db-d119840c6240@suse.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 9 Nov 2026 14:29:55 -0800
X-Gm-Features: AclHuK-dlWDp0B4FdK6V9QBR5LM_sA67_T-19O3ovPwDJ5RdBpzojQ18ICzxF_E
Message-ID: <CAP-5=fXd640kfaR+soPdiEV2mfqCPGDANCt04KzaXBphYP4Htg@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] xen/sys-hypervisor: Add release callback to hyp_sysfs_kobj_type
To: Juergen Gross <jgross@suse.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kees Cook <kees@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <chleroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>, 
	Srish Srinivasan <ssrish@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Stefano Stabellini <sstabellini@kernel.org>, 
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
X-purgate-ID: tlsNG-bad1c0/1794263410-3B2DC034-44252426/0/0
X-purgate-type: clean
X-purgate-size: 2796
X-Spam-Status: No, score=-23.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 8, 2026 at 10:56=E2=80=AFPM Juergen Gross <jgross@suse.com> wro=
te:
>
> On 08.11.26 23:39, Ian Rogers wrote:
> > hypervisor_init() in drivers/base/hypervisor.c creates hypervisor_kobj
> > with kobject_create_and_add() (which allocates a dynamic kobject using
> > dynamic_kobj_ktype), and hypervisor_subsys_init() in
> > drivers/xen/sys-hypervisor.c then overwrites hypervisor_kobj->ktype wit=
h
> > &hyp_sysfs_kobj_type, which had no .release callback.
> >
> > Add hyp_sysfs_release() calling kfree(kobj) to preserve the dynamic
> > kobject release behavior.
> >
> > Fixes: cff7e81b3dd7 ("xen: add /sys/hypervisor support")
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >   drivers/xen/sys-hypervisor.c | 6 ++++++
> >   1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/xen/sys-hypervisor.c b/drivers/xen/sys-hypervisor.=
c
> > index 91923242a5ae..0e8a2cd69fd6 100644
> > --- a/drivers/xen/sys-hypervisor.c
> > +++ b/drivers/xen/sys-hypervisor.c
> > @@ -659,7 +659,13 @@ static const struct sysfs_ops hyp_sysfs_ops =3D {
> >       .store =3D hyp_sysfs_store,
> >   };
> >
> > +static void hyp_sysfs_release(struct kobject *kobj)
> > +{
> > +     kfree(kobj);
> > +}
> > +
> >   static const struct kobj_type hyp_sysfs_kobj_type =3D {
> > +     .release =3D hyp_sysfs_release,
> >       .sysfs_ops =3D &hyp_sysfs_ops,
> >   };
> >
>
> Wouldn't it make sense to have a common function for just kfree(kobj)?
>
> In your series there are 3 instances of .release just doing kfree(kobj).
>
> In case this is not wanted or with using the suggested common .release
> helper you can add my
>
> Reviewed-by: Juergen Gross <jgross@suse.com>

Thanks Juergen!

lib/kobject.c already has a static dynamic_kobj_release() that does
this (and there are ~15 other places in the tree open-coding a static
kfree(kobj) release wrapper), so include/linux/kobject.h +
lib/kobject.c would be the natural home if we exported one.

I kept them as local static functions here for two reasons:

1. Patches 2/9, 3/9, and 6/9 carry Fixes: tags, and keeping the small
   local callbacks avoids a dependency on a new driver-core export for
   backports.
2. Since kobjects are normally embedded in a larger struct and freed via
   container_of(), I wasn't sure whether Greg and Danilo would view an
   exported kfree(kobj) release helper (especially alongside
   __must_init) as an invitation for misuse on embedded kobjects.

Unless Greg or Danilo would like dynamic_kobj_release() (or similar)
exported now, I'll plan to keep the local callbacks for this series
and can send a follow-up cleanup for the tree-wide callers if
driver-core maintainers think a shared helper makes sense.

Thanks,
Ian

>
>
> Juergen

