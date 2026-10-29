Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D514606A31C
	for <xen-devel@archiver.kernel.org>; Thu, 29 Oct 2026 10:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=GCDs2hz5
Received: from list by lists.xenproject.org with outflank-mailman.1464417.1675094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMNoa-0000N0-1S; Thu, 29 Oct 2026 10:57:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1464417.1675094; Thu, 29 Oct 2026 10:57:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMNoZ-0000Mt-UP; Thu, 29 Oct 2026 10:56:59 +0000
Received: by outflank-mailman (input) for mailman id 1464417;
 Thu, 29 Oct 2026 10:56:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xMNoZ-0000Mn-DB
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 10:56:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xMNoZ-00000002Q0I-2D2B
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 10:56:59 +0000
Received: from mail-lj1-f169.google.com ([209.85.208.169])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xMNoZ-00000003Qzk-14mp
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 10:56:59 +0000
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-3ab4891fc73so18681751fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 03:56:59 -0700 (PDT)
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
	bh=Efja6pmbvVwOMLQt56xqENbzqtO47sBOANrpLbfmbUQ=; b=GCDs2hz5QgVExTtRHHC30r6JSU
	5oGdJfQ3KpCBXcnh4jZEYuAEFg0ELx/qbi2s56p2RXErutO7fk/Sk3cOrtu+w/rqXDHYmSBmUsyXO
	8UzMmZECXxwsxdyFyTuLxzYcQTXhHOzNC30f3BZhTflIqFHwB6Z5muRgCgldK0jYQ3r0=;
X-Gm-Message-State: AFq9FYITtcDd9AiI0TumNRF9TrQ4L3Zj5vHfJmBXOtc3kBtBxeItHDvj
	4zi5u4O7h72BpkS4GmoL6wjfXjIuQEuvFTYIINExv4VqbSfw1OPzHpZSiYPBwElt6OKYX19xlRs
	K7GUoYoFGep63k7SSoyHxJUT4pjFal28=
X-Received: by 2002:a05:651c:b26:b0:3a3:3170:5420 with SMTP id
 38308e7fff4ca-3ac9ce84920mr11099491fa.3.1793271418027; Thu, 29 Oct 2026
 03:56:58 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <ca7cc14c-e860-4626-9d20-820796a91024@suse.com>
In-Reply-To: <ca7cc14c-e860-4626-9d20-820796a91024@suse.com>
From: George Dunlap <gwd@xenproject.org>
Date: Thu, 29 Oct 2026 10:56:45 +0000
X-Gmail-Original-Message-ID: <CAFLBxZYC2ZASN37oUERKPta=HSYVt8n6XjqFUTDGd6D9yCftaw@mail.gmail.com>
X-Gm-Features: AclHuK_j0FzS-_OKVmwAH362qHz2dG4lkK6mBc8mz0dKuDerD84Yve73jY3SE2E
Message-ID: <CAFLBxZYC2ZASN37oUERKPta=HSYVt8n6XjqFUTDGd6D9yCftaw@mail.gmail.com>
Subject: Re: [PATCH] x86: invoke xenheap_max_mfn() unconditionally
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Teddy Astie <teddy.astie@vates.tech>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 12, 2026 at 12:12=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> Calling the function only conditionally can, when highmem_start isn't set
> and when hotplugged memory appears above the boundary where the "short"
> directmap ends, result in Xenheap allocations to yield memory which isn't
> accessible through the "short" directmap. Accesses from PV guest context
> would then either fault or access guest controlled memory.
>
> With this the bifurcation done by 88e3ed61642b ("x86/NUMA: make
> init_node_heap() respect Xen heap limit") can also be undone:
> end_boot_allocator() can be called from a single place, and system_state
> is bumped right afterwards.
>
> Fixes: adc5afbf1c70 ("x86: support up to 16Tb")
> Assisted-by: Claude Opus 5.5
> Reported-by: George Dunlap <gwd@xenproject.org>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: George Dunlap <gwd@xenproject.org>

I might note more strongly that the bifurcation is a robustness issue:
people checking for SYS_STATE_boot are specifically checking whether
the boot allocation regime is still in place.  I take it we're not
moving "system_state =3D SYS_STATE_boot" into end_boot_allocator() to
make it easier to see the major milestones in setup.c:__start_xen().

As an aside, Claude notes that highmem_start isn't clamped to 5TiB; in
theory if somebody put `highmem-start=3D6T` on the command-line, it
would cause problems.

