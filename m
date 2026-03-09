Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CAE9F3C246
	for <xen-devel@archiver.kernel.org>; Mon,  9 Mar 2026 12:52:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1249475.1546926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vza5i-0003QD-Vv; Mon, 09 Mar 2026 12:52:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249475.1546926; Mon, 09 Mar 2026 12:52:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vza5i-0003Q6-RY; Mon, 09 Mar 2026 12:52:10 +0000
Received: by outflank-mailman (input) for mailman id 1249475;
 Mon, 09 Mar 2026 12:52:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BjhM=BJ=kernel.org=ardb@srs-se1.protection.inumbo.net>)
 id 1vza5h-0003Q0-Mv
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2026 12:52:09 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6f9d7fa-1bb6-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Mar 2026 13:52:06 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 839E6600AE;
 Mon,  9 Mar 2026 12:52:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDC24C4AF09;
 Mon,  9 Mar 2026 12:52:04 +0000 (UTC)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailfauth.phl.internal (Postfix) with ESMTP id C5D69F40069;
 Mon,  9 Mar 2026 08:52:03 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
 by phl-compute-01.internal (MEProxy); Mon, 09 Mar 2026 08:52:03 -0400
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 999C9700065; Mon,  9 Mar 2026 08:52:03 -0400 (EDT)
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
X-Inumbo-ID: c6f9d7fa-1bb6-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773060725;
	bh=+l3GAe2jq8eBBZZbhrY4uib7DNJV8apVKmihOAiT6Gw=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=TSHrbFKPoRXfsXlhpwIxl3kZJwS2F2BttFk5QfPdMtO/2V51HyX6rtBr4NBX7fAnm
	 Mbo12H210Mu0rxpwX3x/oqe8N+CIQ1mUlnZIhdoYNbU87xSCxSCgXUoF4bHd6DbwKL
	 +j3OY3s1TM2gTxkaNs9J/IL2QVgVH5IxrNLE7MfKcJzecIH3329B0ZuHStfd7xZVaf
	 22b7kkG0HghO1/nWUHDjQHfrEUUYYxXoIdcvDQSPYVjLfLisQaKQqnPzaqg7HmmYlz
	 7bNv+jsnCFNqTQbCbDvjVrZ0nnUx4ye+D9QI0EaF1Hfh3XWKkSdZs4NO48m/Ck6zau
	 udgcC2oFo/FuA==
X-ME-Sender: <xms:c8KuaT6g5dfW3c5CvJAmOIXVGTkdvWPf_1QM9tkj9Uo4Ih2HRipxsA>
    <xme:c8KuaTvCc5M089GSvD9-x5Zb9s3cnu4ZwokOhjS_EvbvaTmzW5CmE8H91wSfVIP7N
    p3Ji-kBKSk56OzjrjYv0-oLOd1BiRoGgnZarhy-VIwNaMlgMTUK_A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvjeekudehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrugcu
    uehivghshhgvuhhvvghlfdcuoegrrhgusgeskhgvrhhnvghlrdhorhhgqeenucggtffrrg
    htthgvrhhnpeefhefgtefgkefhgfdvffdukeejheeuvedthfdtiefhleejhfefjeffieeu
    jeefteenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrugdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqudeijedthedttdejledqfeefvdduieegudehqdgrrhgusgeppe
    hkvghrnhgvlhdrohhrghesfihorhhkohhfrghrugdrtghomhdpnhgspghrtghpthhtohep
    iedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshhouhhmhigrjhihohhtihhsrg
    hrkhgrrhdvfeesghhmrghilhdrtghomhdprhgtphhtthhopehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhrtghpthhtohepihhlihgrshdrrg
    hprghlohguihhmrghssehlihhnrghrohdrohhrghdprhgtphhtthhopeigvghnqdguvghv
    vghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopehlihhnuh
    igqdgvfhhisehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidq
    khgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:c8KuaWcjcsw5z56A4U-0I8TpxxtNTYgcBSta9LzT8FhkHsW1Wcpt4g>
    <xmx:c8KuaSehKYxjTOw8IX5vaHSFoeHSbpymWVwezyS7Qb0SdlgfkExq_Q>
    <xmx:c8KuaZyDumFDVKesUG2kbHmbcAltYywi6iHzDnG0QlWiUUaFGX8MSw>
    <xmx:c8KuaZ-fJ1kWTGjVJ6UgZEl103GiQwkGGpA2aoIzzhEstZoUcvWo_g>
    <xmx:c8KuaRilkN9J9Yo9bdHlekGBpuyCg3gIBWtOc77In4fmiYdaKWJgdz_p>
Feedback-ID: ice86485a:Fastmail
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Al3Xjs-asQIN
Date: Mon, 09 Mar 2026 13:51:43 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: 
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
 linux-kernel@vger.kernel.org
Cc: "Soumyajyotii Ssarkar" <soumyajyotisarkar23@gmail.com>,
 xen-devel@lists.xenproject.org,
 "Ilias Apalodimas" <ilias.apalodimas@linaro.org>, linux-efi@vger.kernel.org
Message-Id: <2f8e9891-ef08-4094-ae86-c1b6d2dbe06c@app.fastmail.com>
In-Reply-To: 
 <cover.751f45ebbb644244b1d9da3aff289d6b66db4c6b.1773058629.git-series.marmarek@invisiblethingslab.com>
References: 
 <cover.751f45ebbb644244b1d9da3aff289d6b66db4c6b.1773058629.git-series.marmarek@invisiblethingslab.com>
Subject: Re: [PATCH 0/2] Allow using BGRT table under Xen dom0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On Mon, 9 Mar 2026, at 13:17, Marek Marczykowski-G=C3=B3recki wrote:
> For a long time Xen was invalidating BGRT table as it was reclaiming
> BootServicesData memory (where boot graphics is located). This is now =
changing,
> and the boot graphics is preserved. This series has necessary changes =
to
> actually make Linux use the preserved graphics.
>
> This is a companion series to Xen side at
> https://lore.kernel.org/xen-devel/20260305191810.31033-1-soumyajyotisa=
rkar23@gmail.com/
>
> CC: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
> Cc: xen-devel@lists.xenproject.org
> Cc: Ard Biesheuvel <ardb@kernel.org> (maintainer:EXTENSIBLE FIRMWARE=20
> INTERFACE (EFI))
> Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org> (reviewer:EXTENSIBL=
E=20
> FIRMWARE INTERFACE (EFI))
> Cc: linux-efi@vger.kernel.org (open list:EXTENSIBLE FIRMWARE INTERFACE=20
> (EFI))
>
> Marek Marczykowski-G=C3=B3recki (2):
>   efi: make efi_mem_type() and efi_mem_attributes() work on Xen PV
>   efi: Enable BGRT loading under Xen
>
>  drivers/firmware/efi/efi-bgrt.c |  7 +++++--
>  drivers/firmware/efi/efi.c      | 27 +++++++++------------------
>  2 files changed, 14 insertions(+), 20 deletions(-)
>

Looks good to me - if nobody else has any concerns, I'll queue this up f=
or v7.1

