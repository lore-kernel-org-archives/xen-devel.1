Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03BD3606A31C
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 15:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.a=rsa-sha256 header.s=fm2 header.b=K896862v;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=qhrqgFD4
Received: from list by lists.xenproject.org with outflank-mailman.1480246.1684214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQR1m-000289-6e; Mon, 09 Nov 2026 15:11:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1480246.1684214; Mon, 09 Nov 2026 15:11:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQR1m-00027x-3y; Mon, 09 Nov 2026 15:11:22 +0000
Received: by outflank-mailman (input) for mailman id 1480246;
 Mon, 09 Nov 2026 15:11:21 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1xQR1k-00027l-Rp
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 15:11:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQR1j-00BBVa-Tr
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 16:11:20 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6af1e296-e002-0a2a0a5209dd-0a2a45049474-2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 16:11:19 +0100
Received: from [202.12.124.146] (helo=fout-b3-smtp.messagingengine.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6af1e296-b57f-0a2a45040019-ca0c7c92eac3-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 16:11:19 +0100
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfout.stl.internal (Postfix) with ESMTP id 275B51D0019B
 for <xen-devel@lists.xenproject.org>; Mon,  9 Nov 2026 10:11:18 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-02.internal (MEProxy); Mon, 09 Nov 2026 10:11:18 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 Nov 2026 10:11:15 -0500 (EST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm2 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm3 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794237077;
	 x=1794323477; bh=Nd+fRP9whILnYPUlZQfICgG7JtYs+TR4N7HOnq8DRdk=; b=
	K896862vXnSdEyyhzPQ/AEzrw7RgATIS3U5GFkAN5Fzp+ktHcVfjDPuvFlu/VVtD
	JNIYPMVETUBCDd/4fN8jXZjcI7PLl1eFkWv+9xy2TtFZOkepP1T3FNQRw7mHDzsr
	+PM08vyuMrDRRRoS1cqTP3ho2Z+sgl02VlyWmlboUxGe5cDd2sN5aNblOd799BJx
	DsfYERXJ4MiO1Mh9X/CS/oVLyJ3uBcdz0bqOgRAZxcb+SsHAmCUtqeOuaNiLGVGH
	0PDceztthj1+kzhDoM1xPxxRhobfBAlIWzPy7EdAYTVXOWPYAr29hp8nCKxR31fS
	khUedMALcUqIl2Dk1z7lDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1794237077; x=1794323477; bh=Nd+fRP9whILnYPUlZQfICgG7JtYs+TR4N7H
	Onq8DRdk=; b=qhrqgFD4Ngl2H3RV8t9HxFVQvqfNlKa9ltlfSMGA6NjKpTuqipV
	PL0XgHVWRp/0nH7h1U9GQK3VAYZRIfQl5AxL3h2EW4nPJfAbLnu/NyNrJMTdaQzP
	UVe1hn1PK68AI8g682aIJZ6Ip1MTC6we5GID55wt5qdXbjGCfSn5N6ykJ08iayks
	oit23SSdMOoXelbBXFHnH7q8q8qz1o7amfNRH9f4jObby5mnVI2dot+6ke2ZFVmb
	OUnGi3iHeb0oS70jGpHex9bbQ9lhOSF6Q/1WGzSPscwRPlRuGt8A49RYtRR5hunp
	VUuoMyFU8Ufpr9rLFjtOttKxP4feRhYGx4A==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=invisiblethingslab.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794237077; d=invisiblethingslab.com;
	mf=PG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+;
	rt=PHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz4=;
	s=fm2:rsa-sha256:GuP8rh4mMZmR/nt95Lfs7OLP4OPF5aGUvQDW6kLFOPqCuFk
	Zzm/ThOKpf5JyuCIpVBdLCCZMi+dRv1o5yKGaVIL86WCfJTnZlH6u5A1tWrW5DQu
	ZfhQg5RVucJKEKVYbTGqt1+qmRjKdARyeQO+tkVHLqD2RSm/n5aJaQI+CoGEUSPA
	MWwTGmzin8mgzeUkc9IHfRZWPwuGGEH2wjkonIX8KB8QhpwJlb2p0L5jZCf5u+MC
	7/sqJ9XpW137lLpVvqY588ztarBVN8j+GE5IInTzwCmnpWYSzyJU4WSaYkMz2jTH
	/cyEu6OixdP1swne/RvNxoBVj0hTNHTgnOJIIHw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:chz5SuMpke/YNteJKMrKgB6bCTJeu0LsX+TW1VdQJRA=:8sieIUTzEqsQ8Abwz2sXKuTlSp7usZPsv38mrNtd9/0=;
X-ME-Sender: <xms:leLxaiCCHsS-gCA_GqgshqFhc-yOtvMCE0OWeYefgUuyNlzRiyqn5Q>
    <xme:leLxaoWSl1zzyb4_v-mXCdR1V6ESbAnsTodzAUQ21RAw_O--9DVfIiu2he7c3WQMO
    ijVc6aAePodrfAJBSFl4m8meRg7O2g8Efbf0cagexSWlhnLVQ0>
X-ME-Received: <xmr:leLxag8aGstRB662mRVHohDmIb3Ay5ev2Pcrk4jkmsWbp8Tak9CPus4pK2jgq3APpFmN7PgbUxjNppAsG3eW5CGBAWTSFnX1iIEUN74w6q8>
X-ME-Proxy-Cause: dmFkZTFE392SYlY+fcZkcyT3ehmOEPFko1/oPZynWn6jTMhHDUIpM/XbUStHJRV+IJBPth
    WUcC8YBKhNjbLouCsOS/cAxsJAMOmIBx4x93kiC+ylv+PvlBN6Lwvx4ejTlrKT7LAEwYP4
    qOJLIU8GOZJO+whtXWWKxZKvHOUyuKlgrM2o+Co/o04uVGT6YQIEW4DrpxVFcsd86TbiDK
    yVxt8Box3rThkMfCU7IDzP4iLMR6lG6BeMIIkQLJePxbjTl9B6i8yy1VGSwIvALsYVuesO
    pqQeKtWCZnBEp4iAN33QIRo/cjrTnCC7AbGa9+s13DFTK1vUtC7JQxazrx0+G4ghJVMaR1
    3Tvzx6XNZSqDhocXjpvNyTXpN09hI0IpZA6WYaRa43Z8U7rxlf48q6Qr7gIeO3Ml3RJbbA
    0LRpGTwWS3K3tlxm663vkYzVuQsIL55d2PlBEXuoKvkYDTcAni+YeXC5fMvTWZuSLC8Jpx
    U+xg1BKSL2SMhbF3SndlzkC/uDxgLRUrNEa7hu9KiJlccF2+TgKRlJ2olXmihDWE7n3NFN
    Z01+cltl1C9vwq0OCFsUVrmbe7EbIkaUoxhFqtnOcZHyVvmzBxA+HIOBoeqnoJM9KHCjhG
    DjSi5AzIFRreYfPVMtwFx5p13mncu00wCazKYR+tyA+eqI9oAzrDQyKFcePQ
X-ME-Proxy: <xmx:leLxaqTPCCgRe0fQE3OyId1oAfmRJTYsQWziPb7eKTUtVI2-H8_Hew>
    <xmx:leLxalRXCODIca8-S2g-Pho1t6kQ_F9B1rprJ7IhKVINcQpxJ6DTBg>
    <xmx:leLxam54cWZKrS7RogPljkzN9JrUlW68kzRS6pg9X47ZD6aBTXotig>
    <xmx:leLxaqUohMMCKguuRtJ-mGd5WHdwBOSATEqtcThV68eUSrIWU4fXoA>
    <xmx:leLxakFwE8UUg2ON7KUAz0MpgrAkxela-6OjuiBiSa7C-SGu_5HvmqgY>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 9 Nov 2026 16:11:13 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] xen/efi: Handle efi_memmap with Xen relocating itself
Message-ID: <avHikdwM2wR-GpON@mail-itl>
References: <20261106231818.482564-1-jason.andryuk@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NjfjfO8wFjKcFDro"
Content-Disposition: inline
In-Reply-To: <20261106231818.482564-1-jason.andryuk@amd.com>
X-purgate-ID: tlsNG-ebf023/1794237079-51ED6B50-FD825C25/0/0
X-purgate-type: clean
X-purgate-size: 5442
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--NjfjfO8wFjKcFDro
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 9 Nov 2026 16:11:13 +0100
From: Marek =?utf-8?B?PT91dGYtOD9RP01hcmN6eWtvd3NraS1HPUMzPUIzcmVja2k/PQ==?= <marmarek@invisiblethingslab.com>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?PT91dGYtOD9CP1RXOXVic09wPz0=?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] xen/efi: Handle efi_memmap with Xen relocating itself

On Fri, Nov 06, 2026 at 06:18:18PM -0500, Jason Andryuk wrote:
> With Xen booting via Multiboot2/GRUB on an EFI platform, and modified to
> use MULTIBOOT2_LOAD_PREFERENCE_LOW, Xen relocates itself with
> move_xen().
>=20
> However a PVH dom0 shows:
> kernel: Failed to lookup header 0x77ffd000 in Xen memory map: error -3
> kernel: ACPI=3D0x77ffd000
>=20
> ... for all the Xen efi memory map lookups.  Dumping the memory map at
> runtime showed it was scrubbed.  Because Xen relocated itself, the
> original physical address referenced through a directmap address goes
> stale.
>=20
> Add efi_arch_mmap_buffer_virt() to convert from the initial value to an
> appropriate runtime value.  ARM uses Boot Services AllocatePool(), so it
> must continue to use DIRECTMAP_VIRT_START.
>=20
> For x86, we use an offset into the loaded Xen binary at the time of the
> call and add the to XEN_VIRT_START.  ebmalloc() allocates from the Xen
> image memory, so it moves during relocation.  xen_phys_start is set for
> xen.efi in efi_exit_boot(), but not for xen.gz, so it cannot be used
> Use `lea __image_base__(%rip)` to get the current load address, and use
> that to calculate the offset into the Xen image.  That offset is also
> valid from XEN_VIRT_START.
>=20
> Fixes: c5b9805bc1f7 ("efi: create new early memory allocator")
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

I did not tested this, but looks correct:
Reviewed-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.c=
om>

> ---
> I think it could be seen without MULTIBOOT2_LOAD_PREFERENCE_LOW if xen
> chose to relocate itself.  But since grub usually loads xen high, it
> doesn't relocate itself.
> ---
>  xen/arch/arm/efi/efi-boot.h |  5 +++++
>  xen/arch/x86/efi/efi-boot.h | 10 ++++++++++
>  xen/common/efi/boot.c       |  2 +-
>  3 files changed, 16 insertions(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
> index 069cc68b0a..717bd8d607 100644
> --- a/xen/arch/arm/efi/efi-boot.h
> +++ b/xen/arch/arm/efi/efi-boot.h
> @@ -449,6 +449,11 @@ static void *__init efi_arch_allocate_mmap_buffer(UI=
NTN map_size)
>      return ptr;
>  }
> =20
> +static void *__init efi_arch_mmap_buffer_virt(void *ptr)
> +{
> +    return ptr + DIRECTMAP_VIRT_START;
> +}
> +
>  static void __init efi_arch_edd(void)
>  {
>  }
> diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
> index d738b839ee..ffc277ccfd 100644
> --- a/xen/arch/x86/efi/efi-boot.h
> +++ b/xen/arch/x86/efi/efi-boot.h
> @@ -224,6 +224,16 @@ static void *__init efi_arch_allocate_mmap_buffer(UI=
NTN map_size)
>      return ebmalloc(map_size);
>  }
> =20
> +static void *__init efi_arch_mmap_buffer_virt(void *ptr)
> +{
> +    unsigned long load_base;
> +
> +    /* RIP-relative address is the current Xen load address. */
> +    asm("lea __image_base__(%%rip), %0" : "=3Dr" (load_base));
> +
> +    return ptr - load_base + XEN_VIRT_START;
> +}
> +
>  static void __init efi_arch_pre_exit_boot(void)
>  {
>      if ( !trampoline_phys )
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index 89b5831691..5396bad7a5 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -1425,8 +1425,8 @@ static void __init efi_exit_boot(EFI_HANDLE ImageHa=
ndle, EFI_SYSTEM_TABLE *Syste
>      /* Adjust pointers into EFI. */
>      efi_ct =3D (const void *)efi_ct + DIRECTMAP_VIRT_START;
>      efi_rs =3D (const void *)efi_rs + DIRECTMAP_VIRT_START;
> -    efi_memmap =3D (void *)efi_memmap + DIRECTMAP_VIRT_START;
>      efi_fw_vendor =3D (const void *)efi_fw_vendor + DIRECTMAP_VIRT_START;
> +    efi_memmap =3D efi_arch_mmap_buffer_virt(efi_memmap);
>  }
> =20
>  /* SAF-1-safe */
> --=20
> 2.34.1
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--NjfjfO8wFjKcFDro
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmrx4pEACgkQ24/THMrX
1yxMRwf+MeRnbd48+hnxrSMOuEF/P3YQjU9JQ0YCcSnBj+cl8y0HU18V09wlLcmr
GCT7mVpC4IbeuKWpJ82YJj/sKUSFE0ULQTGkK5nYEsK2oxy42eoHhD1qTrrMFZgW
aFpC2oLwDAHQxLX2c0kT+Ei/LYba+VohUZY3Rivinm8lJRWR9yph9mrRj4tenVLy
t+uDEHlgFI5lnMtNkdUeJEPhOJGBSVQThuUMJ8TAytu/IWatmqJQlasLu4QBUS0W
1el0q6Vt6tN/7f9znI2upDnRCJOiRCb6t+qlYv2Fh3zn0qwsWHDuvbMqrStIHlkf
B2zAV+B5eaW2qgsPtFLWvY7gPNeSkw==
=HgJX
-----END PGP SIGNATURE-----

--NjfjfO8wFjKcFDro--

