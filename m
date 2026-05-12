Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B23CD343F
	for <xen-devel@archiver.kernel.org>; Tue, 12 May 2026 16:05:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1307184.1578895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMpbf-0001dl-V5; Tue, 12 May 2026 16:05:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1307184.1578895; Tue, 12 May 2026 16:05:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMpbf-0001de-RY; Tue, 12 May 2026 16:05:15 +0000
Received: by outflank-mailman (input) for mailman id 1307184;
 Tue, 12 May 2026 16:05:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wMpbe-0001dM-33
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 16:05:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMpbd-00HM86-FF
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 18:05:13 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a034fac-5cb7-0a2a0a5109dd-0a2a4509aa68-20
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 18:05:13 +0200
Received: from [202.12.124.154] (helo=fhigh-b3-smtp.messagingengine.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a034fb8-2497-0a2a45090019-ca0c7c9addc7-3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 18:05:13 +0200
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 53B667A0118;
 Tue, 12 May 2026 12:05:11 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Tue, 12 May 2026 12:05:11 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 May 2026 12:05:05 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm3 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm3 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1778601911;
	 x=1778688311; bh=q6u7b2PUR+mLnvMgH6P/y+fc2nesAkTPNVf1mznQplE=; b=
	ikhOIOPA5cxyfI8T3Tf7gtO/NFMSMXR8posp18yCqz3L2pRPGo8Fz1Sr09+oPocj
	EluO+TG6CJagyysD+M0MHQ1DIWlDLy4mam9D2QpRjXnNvGOVbqf/E5Y8j2xafc8L
	AYgOie8nWh/EWQlFjQqNxQHZngXUeSOotlyYt7xqmBRaNCgF2MHZcOwFrEmmggfV
	JYgOqZe0/8ItUZtkwC4OROPnosVxxbnLwF2/Qi1kB0JnEUDL6mthiOwXlGP7ttVY
	KijOl6nFOCYKoCzyI4FKExuNJn5I/duKjKQClHTa0flF7axliI+hm8FQu5TUT57K
	/t+bvpl39VD1EEc4rqMXwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1778601911; x=1778688311; bh=q6u7b2PUR+mLnvMgH6P/y+fc2nesAkTPNVf
	1mznQplE=; b=dCdrkjYgFK1MrwHQXQ+kRk2YlnXLXYZk/tKilonRUMpI0AkDEqB
	/GGSGu6yFePQ1XMUCYQdFoyyl1Tb9ANPLCDTPIjA8KX7fJPO8PFnONqnlzsqcjYw
	4S1QyAgeoO4ZmPjzl/PaKeFyN7tybW9AUrCdW+n8iax6ETL0lkBzxNiAJRbWWW8B
	4qeQUvKoJoS3Q8XqkoCvqc6GUITxyL2ee/ILvgUNBd+9ArJHth0QMFiN99xkkauH
	q3NltT9vhOZV1t7WmcZTxPZLhp090cxNnQSRKzI6mvJqPR+P8MW5DDKgeqAUrbUi
	MbF1ZNs7wcWJVohoUPx+3eikjCH7HpZUXKw==
X-ME-Sender: <xms:tU8DasonUkycxOtfgXuBegFYXad_JkKHXEwF7F2-ifGpn6Fl-d-qLw>
    <xme:tU8Daug_1x-MELF0w4cqhBosOaWdOHxQHD2L5W7I4D4NUBIu_GPprzJj34gb6devC
    qEVFPxIiYnrGmBp1xWKK4bHOa3A0crRQ4r-QcH3mASI54XR>
X-ME-Received: <xmr:tU8DauPAu9tuin-E9DISlMd_HemUksaHpN9v9LKiAP2cwLkhTP402ZIrO-razgkyMxAwDKMafAdgR7MtlmsSY3t_OyTm55_EZs4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduvddvvdefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtroertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnheptdetvdfh
    kedutedvleffgeeutdektefhtefhfffhfeetgefhieegledvtddtkedtnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepuddupd
    hmohguvgepshhmthhpohhuthdprhgtphhtthhopehjghhrohhsshesshhushgvrdgtohhm
    pdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorh
    hgpdhrtghpthhtohepgiekieeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhgvvhhi
    nhdrsghrohgushhkhiesrghrmhdrtghomhdprhgtphhtthhopegsohhrihhsrdhoshhtrh
    hovhhskhihsehorhgrtghlvgdrtghomhdprhgtphhtthhopehtghhlgieskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtohepmhhinhhgohesrhgvughhrghtrdgtohhmpdhrtghpthhtoh
    epsghpsegrlhhivghnkedruggvpdhrtghpthhtohepuggrvhgvrdhhrghnshgvnheslhhi
    nhhugidrihhnthgvlhdrtghomh
X-ME-Proxy: <xmx:tU8Daox9sqbt6V7_9SfrHnyu0ew_B1zFovtWXqEueWM9fgK6U-rUlA>
    <xmx:tU8Dagp2LETUv27F6t2vqezhrh-GvcAu14fYnMloEUMnUTX7ihP4hg>
    <xmx:tU8DaoN74ajHyQwXeefP3bbXZwh_fMd8UrEp74jvr5IKUGtVSQkObg>
    <xmx:tU8DakffRzr1IUA3wa5CJh1j2xo3wqhelI_VWnbS9LjcxGxbGTRTpg>
    <xmx:t08DakdtuRpRtGBfb2nkRh_nITHA2bdGwJpjM89DDaIZNpLsvRhb1uVD>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 12 May 2026 18:05:01 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, kevin.brodsky@arm.com,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/xen: Tolerate nested XEN_LAZY_MMU entering/leaving
Message-ID: <agNPrRfBnRdMCGrE@mail-itl>
References: <20260508143933.493013-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TX6pd/gDPiw+HuTq"
Content-Disposition: inline
In-Reply-To: <20260508143933.493013-1-jgross@suse.com>
X-purgate-ID: tlsNG-bad1c0/1778601913-42573A53-857CACF2/0/0
X-purgate-type: clean
X-purgate-size: 3498


--TX6pd/gDPiw+HuTq
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 18:05:01 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, kevin.brodsky@arm.com,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/xen: Tolerate nested XEN_LAZY_MMU entering/leaving

On Fri, May 08, 2026 at 04:39:33PM +0200, Juergen Gross wrote:
> With the support of nested lazy mmu sections it can happen that
> arch_enter_lazy_mmu_mode() is being called twice without a call of
> arch_leave_lazy_mmu_mode() in between, as the lazy_mmu_*() helpers
> are not disabling preemption when checking for nested lazy mmu
> sections.
>=20
> This is a problem when running as a Xen PV guest, as
> xen_enter_lazy_mmu() and xen_leave_lazy_mmu() don't tolerate this
> case.
>=20
> Fix that in xen_enter_lazy_mmu() and xen_leave_lazy_mmu() in order
> not to hurt all other lazy mmu mode users.
>=20
> Fixes: 291b3abed657 ("x86/xen: use lazy_mmu_state when context-switching")
> Signed-off-by: Juergen Gross <jgross@suse.com>

I have ran several test iterations with this patch (on top of 7.0.4) and
it seems to fix the issue. So,

Tested-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

I did run some tests also with 291b3abed657 reverted (instead of this
patch), and that seems to work too, but I didn't run enough of
iterations to be 100% sure. Would it be helpful to that that further
too?

> ---
>  arch/x86/xen/mmu_pv.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
> index c80d0058efd1..3eee5f84f8a7 100644
> --- a/arch/x86/xen/mmu_pv.c
> +++ b/arch/x86/xen/mmu_pv.c
> @@ -2145,7 +2145,10 @@ static void xen_set_fixmap(unsigned idx, phys_addr=
_t phys, pgprot_t prot)
> =20
>  static void xen_enter_lazy_mmu(void)
>  {
> -	enter_lazy(XEN_LAZY_MMU);
> +	preempt_disable();
> +	if (xen_get_lazy_mode() !=3D XEN_LAZY_MMU)
> +		enter_lazy(XEN_LAZY_MMU);
> +	preempt_enable();
>  }
> =20
>  static void xen_flush_lazy_mmu(void)
> @@ -2182,7 +2185,8 @@ static void xen_leave_lazy_mmu(void)
>  {
>  	preempt_disable();
>  	xen_mc_flush();
> -	leave_lazy(XEN_LAZY_MMU);
> +	if (xen_get_lazy_mode() !=3D XEN_LAZY_NONE)
> +		leave_lazy(XEN_LAZY_MMU);
>  	preempt_enable();
>  }
> =20
> --=20
> 2.54.0
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--TX6pd/gDPiw+HuTq
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmoDT60ACgkQ24/THMrX
1yx4bAf/VQ75g91ht89MgBxSdIsuH3bHFEoMWP584OeaPmODQ286u3tzJYlkk6A0
N4hU2vs2cf6FGx1zFkwRrW4mCe7jsI2J0ZNinxpKEiX8Gkan1LqDWRI568/7lwHJ
RoWSFmeM6fq/EmpVnRIVvTucul9r6+I5LqV3cG01RcOyV50f3zRZgIacIIgQKdU/
F0b/vQVZ9FksDmCudohF6xdOH1kFMhC/wBu+GRmE1j2rALpRZhGp9ofiLxpwtyqp
6EE45bopaGTU2EecaeSOCnmmvtP+M4BIPaRDqsdXXvh8qKFDCjuCn+0wqUWUKItr
Gb8dxWXuPRtvYz/Q1el+pajOBkviBQ==
=QeYe
-----END PGP SIGNATURE-----

--TX6pd/gDPiw+HuTq--

