Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439D3606A331
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 23:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DnudpLzG
Received: from list by lists.xenproject.org with outflank-mailman.1491530.1692326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xT5zN-0000N4-GC; Mon, 16 Nov 2026 23:19:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1491530.1692326; Mon, 16 Nov 2026 23:19:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xT5zN-0000Mx-DP; Mon, 16 Nov 2026 23:19:53 +0000
Received: by outflank-mailman (input) for mailman id 1491530;
 Mon, 16 Nov 2026 20:04:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrii.nakryiko@gmail.com>) id 1xT2vx-0003ov-PG
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 20:04:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xT2vx-007m8H-5X
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 21:04:09 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrii.nakryiko@gmail.com>)
 id 6afb619c-bab6-0a2a0a5309dd-0a2a4505cd28-32
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 21:04:09 +0100
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrii.nakryiko@gmail.com>)
 id 6afb61b8-4cb1-0a2a45050019-d155dd32d936-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 21:04:09 +0100
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-4a32576da88so240832f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 12:04:09 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1794859448; cv=none;
        d=google.com; s=arc-20260327;
        b=mGY2r3R/0mKLELg9FTtu0lWZkJM9vGtNzcX+IppNQEjE2/RzajT41sdKEFS8nyxATP
         dLJ7zNwjTjhayTTRAFNGFZp/UufXq4aHPZGsZ01ZHeJt4gIUKYPAV7723XYWOqDXiKHx
         BwatyME0VSo5w7HTvpW7PRllAh49Bmy8upp0nDEa/JYpcfP8Up+7db9LtdNV9sm8xUZd
         c1ihGpvQYjQ0uGdE30ASI+Rj8hSr9XBS4TX25ktd6+s9TtG6lUethJQ4XVgur1HqLmCA
         dnHvyiajzrjie6o7zC2kN5tejLM8cAH0A+3/W/WBk6xSeaT1WW3pA/CutoiinZQYGocO
         8UQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FEtpE65JhLGyAYaL/FOW2ebUIws2WwBZ/4Zy8VNXUuw=;
        fh=frq2Wzn0iQg3cXh9oDaaiTcrknmdL2uNu8alNe8QCjU=;
        b=X//rvuDXvE7h3CM3CIQfG+Pmn7gTi0UiNw0vNPfaPorDQ6GoDGhxeGrA81xPVPFEiz
         4E6qqnYt12f9dDIgiiB8mrV2QMeCFOA8zDtJt/fnt/LTcJZcoI7U6KbTSe1I9zH1UKkM
         cDD50iZ5RxoTwkf9hgKr3ot5va9kCmWZYb+NaQ4EgMYQufzMsa4MZFlL65nLOBiW86fI
         ic6NdcVkhvgY63dIVwqlcwadNRZcBJdaw0o8BAR/6nPLt9rtV30/0nBNXB/fwQq+3tz+
         oMZsDl9TfW7CJcCc6BLml83bPG9BLoSBOC/zGonlCCxlyhprRo0q0IrUuOUIbGb/K7nH
         Snag==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794859448; x=1795464248; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FEtpE65JhLGyAYaL/FOW2ebUIws2WwBZ/4Zy8VNXUuw=;
        b=DnudpLzGXJZAkCG/SrjJZbxl9TU/uDuSlgU6vO7o6OoL9sElMxFrUIddeo3KOmGOfL
         Vueqm0/ahTjeZZbylVn1HzS4nhYhH3wgngFq5LZCpRQYShKgjtfjojemja/QQighkSRc
         nIjh8GNcOGqlclp9xRREl2LkKg2N+DH1IwFZCVmeWqNtzdaUyxp2PqEA5wCM9MVjshGN
         x25MV86RDcwgP8J8lJosqR8NTW7guOd6vbZHtTIyMKFS1dCC4qj1yOtBa2SsVca+GzaY
         uDIZaVaOBEQoQYPmhus14tqpH0OTxPueEIlfDl/eQJQKbW6LHA0DgQOfBigR78SkYDzA
         pw9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794859448; x=1795464248;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FEtpE65JhLGyAYaL/FOW2ebUIws2WwBZ/4Zy8VNXUuw=;
        b=2mHaTyJXglR0/R0+FpCDMygRVgrZ76KiNbyJV14Hp/3L/0Aj5KREakHr8bJicHXcUf
         nutwQzfHCTdqchStzaMtskKE0Rb3RGLCX5QFPHK6Kos5kVBWyX6T0HATV+9jO0DEuaoe
         eD6OhyMqskOJkGbcxSN/5j/R5aIQXRnwwyrTVcaWzeaoP3GNyPCiIfGTLWExRF35kxEQ
         LSpH61Can59E0K8qfGrXStjdOYYooBD0TAbP9kC8YXGKzbQQISwjERo+E/DrQBjqGUNp
         XSLuXlZVhjHrJPayavM/3Ws/sH7Wito0VLuVPvCNK1RjxjuOZXrPR9P7etTWPCns0ST5
         LepA==
X-Forwarded-Encrypted: i=1; AL+hErGaLplfDO6nhaZ/iJe/u+ALftzQBvus3up6zCIgNjY/BxfhGx23w1B5oKx5SoTpk8pFbLFKEWen14I=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/OGtOAKDS9hZRdGKMFTesXDOq6RP5KKEi5XzaUtVwos4NOoELb
	bBb2sXY71/GbufS+wSl0XbbPN+jwbQtdwYCUBA/XH0EAKKt9PG/ZCLXa9ECyRwAJsYRcrECv4H3
	qSyJNEPf0puNS3fWhQy2Sp+HcxW4AdPg=
X-Gm-Gg: AZFdTZcX+p5ZpT4AP5ogiFukAgPBf1VAy3hR1cCx1zOnXOc1gndN1HivoqWBoUguQ0h
	1R2RK3JXUQmzyzYbGm7UD7deIn3z+OesdKGsMxDIYl9oo9wPgLiFH6VFCsJOa0acy+d2RqGmlMb
	zASJqDeRh0eLrwi8UPsquvJoNDuenRmTrB4ugONbCrDhZMobxw/8K3KgIbpiy+XiFgZBJmCO46Q
	9qOn+6qFaljIKiAyggHqp9/Szn6xKtfPHvYlSsOgf5Wuw1DGV6RFFGhEUiE3LloCyY2GivPulYi
	xg/2nQkThXATk6OHCdNhEN0vIBZRO4jnJXo/A99MnEjMvY3epVoVLD+ZEzUmIEs8ObrNwJyWB3a
	MGnklXqHv4o8mG3Ws1YAQDGd7jU9vz1EpdQytWCYRrGmK34YsB8DwWcAiZ9vx07Zd585AnJrjgX
	WM6iVaarOcl4LhB5PBzpA=
X-Received: by 2002:a05:6000:4692:b0:491:3fdd:af34 with SMTP id
 ffacd0b85a97d-49d61c80db3mr13343868f8f.36.1794859448335; Mon, 16 Nov 2026
 12:04:08 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org> <20261116-work-loop-pseudo-v3-9-8cbbea1cf34f@kernel.org>
In-Reply-To: <20261116-work-loop-pseudo-v3-9-8cbbea1cf34f@kernel.org>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Mon, 16 Nov 2026 12:03:57 -0800
X-Gm-Features: Aa3M54q6P4M0RFDCKQ8HHGNCWJafItTSPdWR1qNwVGtToDAv2VOv8vDfWHzYR6A
Message-ID: <CAEf4BzbLFVawibuX0wk=8uzy0WZSYHbkgK55d7rqLab2qAM1Fg@mail.gmail.com>
Subject: Re: [PATCH RFC v3 09/44] bpf: use fc_init_pseudo() for bpffs
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>, 
	Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>, Christoph Hellwig <hch@lst.de>, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-nvme@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-mm@kvack.org, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, 
	fuse-devel@lists.linux.dev, linux-efi@vger.kernel.org, 
	xen-devel@lists.xenproject.org, ocfs2-devel@lists.linux.dev, 
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-usb@vger.kernel.org, Amir Goldstein <amir73il@gmail.com>, 
	linux-erofs@lists.ozlabs.org, linux-kselftest@vger.kernel.org, 
	Alexander Mikhalitsyn <alex@amutable.com>, Chris Down <chris@chrisdown.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c201ff/1794859449-F6AB72A1-DE4787E7/0/0
X-purgate-type: clean
X-purgate-size: 1680
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 16, 2026 at 3:21=E2=80=AFAM Christian Brauner <brauner@kernel.o=
rg> wrote:
>
> Initialize bpffs as a pseudo filesystem instead of raising
> SB_I_NOEXEC and SB_I_NODEV by hand. This adds SB_I_PSEUDO.
>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>
> Reviewed-by: Chris Down <chris@chrisdown.name>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
>  kernel/bpf/inode.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Acked-by: Andrii Nakryiko <andrii@kernel.org>

> diff --git a/kernel/bpf/inode.c b/kernel/bpf/inode.c
> index c6f328e4752e1..57cf3775c0766 100644
> --- a/kernel/bpf/inode.c
> +++ b/kernel/bpf/inode.c
> @@ -15,6 +15,7 @@
>  #include <linux/namei.h>
>  #include <linux/fs.h>
>  #include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
>  #include <linux/fs_parser.h>
>  #include <linux/kdev_t.h>
>  #include <linux/filter.h>
> @@ -1197,8 +1198,6 @@ static int bpf_fill_super(struct super_block *sb, s=
truct fs_context *fc)
>         sb->s_magic =3D BPF_FS_MAGIC;
>         sb->s_op =3D &bpf_super_ops;
>         sb->s_xattr =3D bpf_fs_xattr_handlers;
> -       sb->s_iflags |=3D SB_I_NOEXEC;
> -       sb->s_iflags |=3D SB_I_NODEV;
>         sb->s_time_gran =3D 1;
>
>         inode =3D bpf_get_inode(sb, NULL, S_IFDIR | 0777);
> @@ -1261,6 +1260,7 @@ static int bpf_init_fs_context(struct fs_context *f=
c)
>         opts->delegate_attachs =3D 0;
>
>         fc->s_fs_info =3D opts;
> +       fc_init_pseudo(fc);
>         fc->ops =3D &bpf_context_ops;
>         return 0;
>  }
>
> --
> 2.53.0
>
>

