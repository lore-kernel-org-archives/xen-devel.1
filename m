Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00BB606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 21:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kuXqBQo9
Received: from list by lists.xenproject.org with outflank-mailman.1495183.1694280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTmwJ-0002X5-7g; Wed, 18 Nov 2026 21:11:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1495183.1694280; Wed, 18 Nov 2026 21:11:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTmwJ-0002Wy-4X; Wed, 18 Nov 2026 21:11:35 +0000
Received: by outflank-mailman (input) for mailman id 1495183;
 Wed, 18 Nov 2026 21:11:34 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dakr@kernel.org>) id 1xTmwI-0002Ws-1t
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 21:11:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTmwH-009uYT-7S
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 22:11:33 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dakr@kernel.org>)
 id 6afe1474-8faa-0a2a0a5109dd-0a2a45088668-38
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 22:11:33 +0100
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dakr@kernel.org>)
 id 6afe1483-f659-0a2a45080019-ac6904fee9fa-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 22:11:32 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 2624E63DC5;
 Wed, 18 Nov 2026 21:11:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4625B1F000C4;
 Wed, 18 Nov 2026 21:11:22 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Date:Cc:To:From:Subject:References:In-Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795036290;
	bh=fYW7C7ZSeq/hMphn21Jk8+ekBniTzrghgjy5BvzP2bc=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=kuXqBQo9E+h9GfS4TOHEmqgk/yUMmLyRthOV87kyoVvVOAzwMpnvqD7A1XkucwxwG
	 +Vl7bpZlxX0JE1vzCQVuNBvbZMaKuIBAvlXTPAUK/GTa7v0LsXaOQ5W64VpbC1VuJl
	 uqJ8OInlapAXmctcRxyW0008D6Xzwyp9lCFH5W/hdRpNqLETcSMRWepnBuLx7zwxxU
	 Sylw1ch5ITJRoQmWb3zw4zYMMrzwKyJn/UZhs2/85dIxkfhwlxjTdBpT9dCJJryN21
	 FmmGw4YgDxUh6xSvFjYiQgrHT7xeYbJw48awVnPj+qHidKGuRNABBugA/RDx9fw+YY
	 xy76njp+TsmiA==
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Nov 2026 22:11:20 +0100
Message-Id: <DMYN979QJFNV.LM3T6O68OHW6@kernel.org>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Kees Cook"
 <kees@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>, "Madhavan Srinivasan" <maddy@linux.ibm.com>, "Michael
 Ellerman" <mpe@ellerman.id.au>, "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <chleroy@kernel.org>, "Nayna Jain"
 <nayna@linux.ibm.com>, "Srish Srinivasan" <ssrish@linux.ibm.com>, "Mimi
 Zohar" <zohar@linux.ibm.com>, "Yoshinori Sato"
 <ysato@users.sourceforge.jp>, "Rich Felker" <dalias@libc.org>, "John Paul
 Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>, "Juergen Gross"
 <jgross@suse.com>, "Stefano Stabellini" <sstabellini@kernel.org>,
 "Oleksandr Tyshchenko" <oleksandr_tyshchenko@epam.com>, "Nathan Chancellor"
 <nathan@kernel.org>, "Nick Desaulniers" <ndesaulniers@google.com>, "Viresh
 Kumar" <viresh.kumar@linaro.org>, "Zhongqiu Han"
 <zhongqiu.han@oss.qualcomm.com>, "Alexander Aring" <aahringo@redhat.com>,
 "Felix Kuehling" <felix.kuehling@amd.com>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, "Zhihao Cheng" <chengzhihao1@huawei.com>,
 "Sumanth Korikkar" <sumanthk@linux.ibm.com>, "Bill Wendling"
 <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>,
 <driver-core@lists.linux.dev>, <llvm@lists.linux.dev>,
 <linux-hardening@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-sh@vger.kernel.org>, <linux-s390@vger.kernel.org>,
 <gfs2@lists.linux.dev>, <xen-devel@lists.xenproject.org>,
 <linux-mtd@lists.infradead.org>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
To: "Ian Rogers" <irogers@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v3 9/9] kobject: Require explicit initialization of
 struct kobj_type::release
References: <20261108223913.3624571-1-irogers@google.com>
 <20261108223913.3624571-10-irogers@google.com>
In-Reply-To: <20261108223913.3624571-10-irogers@google.com>
X-purgate-ID: tlsNG-c1860d/1795036293-D554C87B-996A0E3E/0/0
X-purgate-type: clean
X-purgate-size: 1649
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun Nov 8, 2026 at 11:39 PM CET, Ian Rogers wrote:
>  static const struct kobj_type cpuregs_kobj_type =3D {
> +	/*
> +	 * Pre-existing: info->kobj is embedded in per-CPU cpu_data;
> +	 * cpuid_cpu_offline() only calls kobject_del().
> +	 */

All of these comments carry a =E2=80=9CPre-existing:=E2=80=9D prefix, but t=
hat doesn=E2=80=99t
distinguish cases with broken lifetime management from those where the stor=
age
remains valid despite the API misuse.

For example:

> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_xcp.c
> index ab14079d1c42..0847134a1391 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
> @@ -797,6 +797,11 @@ static const struct sysfs_ops xcp_cfg_res_sysfs_ops =
=3D {
>  };
> =20
>  static const struct kobj_type xcp_cfg_res_sysfs_ktype =3D {
> +	/*
> +	 * Pre-existing: xcp_res is embedded in struct amdgpu_xcp_cfg
> +	 * rather than freed individually by kobject_put().
> +	 */
> +	.release =3D NULL,

Being embedded in another structure doesn't explain what guarantees that th=
e
enclosing allocation outlives the kobject=E2=80=99s final cleanup.

Could you please drop the =E2=80=9CPre-existing:=E2=80=9D prefix and make t=
hat distinction
explicit? For broken cases, describe the lifetime problem and mark it as ne=
eding
a follow-up fix. For cases where the lifetime is safe, explain what guarant=
ees
that safety, while acknowledging that omitting release() still violates the
documented API contract.

Also, do you plan to follow up on those cases?

Thanks,
Danilo

