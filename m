Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47279606A884
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 10:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=r26nVF2i
Received: from list by lists.xenproject.org with outflank-mailman.1487196.1689662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRoVF-0000vT-Dm; Fri, 13 Nov 2026 10:27:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487196.1689662; Fri, 13 Nov 2026 10:27:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRoVF-0000vM-B4; Fri, 13 Nov 2026 10:27:29 +0000
Received: by outflank-mailman (input) for mailman id 1487196;
 Fri, 13 Nov 2026 10:27:28 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <alex@amutable.com>) id 1xRoVE-0000v5-2e
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 10:27:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRoVD-009vdy-C2
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 11:27:27 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <alex@amutable.com>)
 id 6af6e60d-2eae-0a2a0a5409dd-0a2a45098548-2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 11:27:27 +0100
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <alex@amutable.com>)
 id 6af6e60f-be1a-0a2a45090019-d1558031b5e5-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 11:27:27 +0100
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4a215e64962so13250435e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 02:27:27 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com.
 [80.187.86.54]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5a32d336sm5077482f8f.0.2026.11.13.02.27.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 02:27:26 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=amutable-com.20260707.gappssmtp.com header.i="@amutable-com.20260707.gappssmtp.com" header.h="MIME-Version:User-Agent:Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794565647; x=1795170447; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TXY31nY7nMCHyiOZTp7Dn0JSWYPda+tFg8CPAdTq7II=;
        b=r26nVF2iCm39QJ4N26YAf8pxO2eHsnVEfjvyMm86ZRi48wg5SJH30sP/kljVPtf0ZA
         z39EImq1O7lGagMiINt0e0YicmoZ4Tnxjw3wlzGFtwulTmEXmDrvupyTgz6T+3fZQ+/o
         rduL/kcEb1iV1ve1pkXWdI2nkni9tRGAo4in438XCq/V9LkPrhFgUAdUgQezixjuJRGG
         q5XuQyEJba31kyae7S3ITkYlkSLzYz4Y2E2ujJN6D4nSI818BcG/rfdJDwpaGbmdFL92
         uATwL9zypLPX6X7aKI/y/JwB3b+uwiN44QlryTBLcOWMJajmWzXOUbDcry15MHUjODLC
         1xhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794565647; x=1795170447;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TXY31nY7nMCHyiOZTp7Dn0JSWYPda+tFg8CPAdTq7II=;
        b=KyY4cexWNACrC90KhLJ5/I3CAYqCuW1SJ5DIy3uQDDmjhwzy3rYcX7wdBikQO6iEXd
         cC1txLqnNMUrJDNEVBM57CJx5Y6DsEiR3Tsbg15gdyAqTMpSuLeGL4NTZX/rfz9tgyFY
         /qgA/Z3fujBlzKP8nvS4ZFcTZ0g+Vxk9RrWkyJkIc8v30Sj55loMs9tkBu4tQ+35ib9I
         uq1q0/kY73npbpLSqeDvTfu654G5FRX9AyZszfargqUVhqqKIxfy8CQlsuWQS2PrloSA
         6AHV8hf24XDJHWLD5VFdaT4TmNdYyi7s6bJN4+2YMngH4IvfL8qhblsO/lDmZ+LWT0gz
         fT/A==
X-Forwarded-Encrypted: i=1; AL+hErEQFXKRgsFoc9UE7mg9iDXSXwE4M8K6bm9v0fqP0WKm0bUTodwC5X0Umb7K2EUUFjM5ZBUigN9CSB0=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+9En+tYbCZfUWt4KPtwUdOgYDtUIgJtf6t9GQoy+DE2CEyQ2Mg
	ZnBgJ+cNzJg+cDTbhD0JPbLTmXubBtln/TZGGrdizfoXHbHI4nNgUiz/Jp6/w+MvUzU9
X-Gm-Gg: AYBFou0MLqr7rrVqgL1+ZNJvwksbzyRJIR0mqxLSyOaHfEGfjih+bkyTpURgvspiake
	yJL7GlCI3P2nHDjPNYgdu2XdqTKi4uWlFm4BAW7g7E68IdG9hSH5QptJPNIyl8xa7R1X/DW/znK
	rbXtOp8J7aVq9G9z/4mHo/28LP/qHI+knHz9QLDkKOc/9lR/leqASpMGiPI+XGYEgGllNLt4z7i
	SozqfSM4uX2tafotlu3/d4wsC3n3pZtIdqWqqvTc3r9DmUuKRlSNx27RLR3bwSPJcqAyIdZVja3
	VahfSMtWDua7NxiD2VanceNcz4cGRfjFG3fl54q6GvAWB5Jf7d9zfT9l77Lew32AG5i0pKpek3K
	joAwZbxakReby7YjYYuAq+roYFvFucam4xyqpRN3uGRAulxt/DVyA+Wd9zKHFHWIyv7MmhH8wnY
	+nGy9zvS7ZK8mjQx2Jja4L2+753CEoKqzlAj6anTuvakScibImfp2KbZvbD6B8KlEDSluEtsYEm
	g1qOqWbEY9TIcA5ofvw5jR0v7cTMrqcTmhiAoBUeBqybW6cYcGOco4t7KnALWLbE8DagjTGwKtJ
	NCVBlaPxdTeCn2s2u2F5hYpzpDaSE0tIB2iOqVCbA3eeJBOa7gSATRhxPE4cQpk=
X-Received: by 2002:a05:6000:4707:b0:498:c419:3728 with SMTP id ffacd0b85a97d-49c713ae367mr4463557f8f.22.1794565646661;
        Fri, 13 Nov 2026 02:27:26 -0800 (PST)
Message-ID: <0c109a58804a2d782e549af6ad13e89532d9f9d2.camel@amutable.com>
Subject: Re: [PATCH RFC 40/41] erofs: refuse files on pseudo filesystems as
 backing files
From: Alexander Mikhalitsyn <alex@amutable.com>
To: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org
Cc: Jann Horn <jannh@google.com>, Chris Mason <mason@kernel.org>, Josef
 Bacik	 <josef@toxicpanda.com>, Christoph Hellwig <hch@lst.de>, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-nvme@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Jan Kara <jack@suse.cz>, linux-scsi@vger.kernel.org,
 target-devel@vger.kernel.org, 	driver-core@lists.linux.dev,
 linux-mm@kvack.org, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, 	fuse-devel@lists.linux.dev,
 linux-efi@vger.kernel.org, 	xen-devel@lists.xenproject.org,
 ocfs2-devel@lists.linux.dev, 	linux-s390@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, 	linux-usb@vger.kernel.org, Amir Goldstein
 <amir73il@gmail.com>, 	linux-erofs@lists.ozlabs.org,
 linux-kselftest@vger.kernel.org
Date: Fri, 13 Nov 2026 11:27:24 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-40-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-40-4c998976c6c7@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-purgate-ID: tlsNG-bad1c0/1794565647-3A0C5034-A5496563/0/0
X-purgate-type: clean
X-purgate-size: 1655
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 2026-11-10 at 10:14 +0100, Christian Brauner wrote:
> File-backed mounts take any regular file as the image and the same
> goes
> for the extra devices of such a mount. erofs reads them with the
> credentials of the mounter so this doesn't hand out anything the
> mounter
> couldn't read anyway. But files on pseudo filesystems aren't images.
> Refuse them just like loop does.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0fs/erofs/super.c | 6 +++++-
> =C2=A01 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/fs/erofs/super.c b/fs/erofs/super.c
> index ce05557bd998..980d5fc2b576 100644
> --- a/fs/erofs/super.c
> +++ b/fs/erofs/super.c
> @@ -158,7 +158,8 @@ static int erofs_init_device(struct erofs_buf
> *buf, struct super_block *sb,
> =C2=A0		if (!erofs_is_fileio_mode(sbi)) {
> =C2=A0			dif->dax_dev =3D
> fs_dax_get_by_bdev(file_bdev(file),
> =C2=A0					&dif->dax_part_off, NULL,
> NULL);
> -		} else if (!S_ISREG(file_inode(file)->i_mode)) {
> +		} else if (!S_ISREG(file_inode(file)->i_mode) ||
> +			=C2=A0=C2=A0 file_is_pseudo(file)) {
> =C2=A0			fput(file);
> =C2=A0			return -EINVAL;
> =C2=A0		}
> @@ -835,6 +836,9 @@ static int erofs_file_get_tree(struct fs_context
> *fc)
> =C2=A0{
> =C2=A0	struct erofs_sb_info *sbi =3D fc->s_fs_info;
> =C2=A0
> +	if (file_is_pseudo(sbi->dif0.file))
> +		return invalfc(fc, "source is on a pseudo
> filesystem");
> +
> =C2=A0	if (!test_opt(&sbi->opt, SUPERBLOCK_SHARE))
> =C2=A0		return get_tree_nodev(fc, erofs_fc_fill_super);
> =C2=A0

