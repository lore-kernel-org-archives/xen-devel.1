Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AEA606A32E
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 10:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=moIzgSqn
Received: from list by lists.xenproject.org with outflank-mailman.1486972.1689476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRoGc-0005Oz-0o; Fri, 13 Nov 2026 10:12:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1486972.1689476; Fri, 13 Nov 2026 10:12:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRoGb-0005MV-PC; Fri, 13 Nov 2026 10:12:21 +0000
Received: by outflank-mailman (input) for mailman id 1486972;
 Fri, 13 Nov 2026 10:03:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <alex@amutable.com>) id 1xRo7h-0003Ly-1Z
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 10:03:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRo7g-006gy9-Ed
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 11:03:08 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <alex@amutable.com>)
 id 6af6e05a-e002-0a2a0a5209dd-0a2a45038822-4
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 11:03:08 +0100
Received: from [209.85.218.47] (helo=mail-ej1-f47.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <alex@amutable.com>)
 id 6af6e05c-fae8-0a2a45030019-d155da2fe12d-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 11:03:08 +0100
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-c50a4a2132cso50320466b.3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 02:03:08 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com.
 [80.187.86.54]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c5095b3dbaesm74933966b.32.2026.11.13.02.03.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 02:03:07 -0800 (PST)
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
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564188; x=1795168988; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SoW/gPie2WRRtXdhiV6ow6HDYwH4jtR4w1oiMzBwW74=;
        b=moIzgSqnx5a9D0zGUEtURWbIQkNkhfMkH77GR3eNiwPBuy6XuPoqFR82z6/WkAKUmW
         8JJoY3xPw6aSVx13hiA3VVXTibbdivRk/QKdtGQMDcaQyzub7rR0zN27ZrNRwhEfg6dw
         SEvTLtfWAII2jdzrbZ15K5Qhiq3fW9hT52qUk/Jq2vvU/sHhWTtvKpE7x0j28YIhg8tJ
         K7Y/oGpGbOvKmJLVhi9T7twdxUR3xOEDCHqy55p9YRf9RUpVRHdn7UQcX0zOJodLSG0H
         vyFYscQ/tXliUC0y+QMLqSYhr3RSfy7uQXSePAlwdM/ZqN/InqgQwpySPIT7SHox1LBG
         oP7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564188; x=1795168988;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SoW/gPie2WRRtXdhiV6ow6HDYwH4jtR4w1oiMzBwW74=;
        b=DS08/RFYDRVpCN96ar/cI/hd0pfNiglPuyXgCxb3cfNbPY0o4ygrs6lfc4zAcr+z+b
         lipYJsSTnQfCakkKDcJsFsur/0RkRm8+HbuOcoZgZm6cKgVw5PxiFv3Ogps7hoNBUhX0
         OS1lVMKyq9NRX2mvzpN+kqaG0VH301fug5uXQD0/lAhSi/4A6KHOrYaPEdw23o8CEcLF
         bTYT7udxainMKTctfyKOvWg8H5k0BL0pu2C7Nh9oKsikQQNc3wjJq61Nd4zn4pzGQj7M
         TA3Qcf2sDZP/aZesUu+grqrfR9LGWgxjonq+c1P5+/+xK2Z7lRTawDuZvG3VQZLPlTax
         81XQ==
X-Forwarded-Encrypted: i=1; AL+hErF0pmerPIc2D/cJuFT9M6sDrfcEebCUhRr9dt+JI9Nt6mPuo/xNhz6r0g687F49RUTZFF6PdnFu9m8=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8lGUT4pAowm4JfrvOHtRddkrOdeB+0f4k45rlwMk6+nNBIrYqR
	i9PbctwrrtJpAu1pldt7lZCMzr0+SzlAE8TtIlvpU2/IibVSIFYwowS+zvA0opXxYq2z
X-Gm-Gg: AYBFou2y5u+Yu7cWzel/UWUcsSuJbXBUNRoX86j5q1p+ITLEumdu/qP6h52F8lau7P9
	IShFika5zFz7EKcSF2r02ZjNuOeKNfgCRbke5h/crAvxm6zRwk4mnQ9jUcG6ZFyvv75+uPN4wTw
	EBy7N2Zx6caHEjFWNchoofxvFqmlZbaXGYtFuUQad6aKHT3efnf0pRRVq1ruHW1ERh3Np6w2/DE
	M0TXJ+f3hmAEWezPW/w4HCxX5cpDulg6eb80EfYichA6VJzdc1NQqQd1eotShQbYk0QifuHYsrk
	jQEUOKM6kIyyvD6tZNYwII2kfKZavj+oeGyY4TDx2YUEdZF+qtTRUPfWiZTi1chAnxyeOvKi8di
	9a2ZfOoh0CkmjDpflb6QuUNQt35NiJ9SBBcLEbmZPgoE6Z4Tu1ybq2kGG1LI5npqR27PM25nNqx
	I9An/zhGxWkcOPH+xLn4lDW9z2R3P0DDx1nzQ0E1bwykp7T9XeH78hIT5MmDrmA33rSde26XN4d
	ZcX/DNvdof2TM4C7/N1cEmXjSGsV14ilyWSIxUufr4511rETi9Tvb+FvRGE78LgxcTIHWpHfLTz
	rRdKrAnXBeZYFCUci1fGqx/hVQFa70vweHMmHgJ1WgblxeYY
X-Received: by 2002:a17:907:d12:b0:c4c:b4fe:c9e8 with SMTP id a640c23a62f3a-c50963dbee5mr161853166b.38.1794564187801;
        Fri, 13 Nov 2026 02:03:07 -0800 (PST)
Message-ID: <fffc4f7f87fd5f03d1ef409df76f71ddad552213.camel@amutable.com>
Subject: Re: [PATCH RFC 07/41] binfmt_misc: use fc_init_pseudo()
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
Date: Fri, 13 Nov 2026 11:03:05 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-7-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-7-4c998976c6c7@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-purgate-ID: tlsNG-33051d/1794564188-7448C4E9-84FD1640/0/0
X-purgate-type: clean
X-purgate-size: 1537
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 2026-11-10 at 10:14 +0100, Christian Brauner wrote:
> Initialize binfmt_misc as a pseudo filesystem instead of raising
> SB_I_NOEXEC and SB_I_NODEV by hand. This adds SB_I_PSEUDO.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0fs/binfmt_misc.c | 5 +++--
> =C2=A01 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/fs/binfmt_misc.c b/fs/binfmt_misc.c
> index d945b4f6e158..7dc233becd98 100644
> --- a/fs/binfmt_misc.c
> +++ b/fs/binfmt_misc.c
> @@ -22,6 +22,7 @@
> =C2=A0#include <linux/file.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/init.h>
> =C2=A0#include <linux/kstrtox.h>
> =C2=A0#include <linux/limits.h>
> @@ -1575,8 +1576,7 @@ static int bm_fill_super(struct super_block
> *sb, struct fs_context *fc)
> =C2=A0	if (user_ns !=3D current_user_ns())
> =C2=A0		return -EINVAL;
> =C2=A0
> -	/* Never exec off this instance and never let anything stack
> on it. */
> -	sb->s_iflags |=3D SB_I_NOEXEC | SB_I_NODEV;
> +	/* Never let anything stack on this instance. */
> =C2=A0	sb->s_stack_depth =3D FILESYSTEM_MAX_STACK_DEPTH;
> =C2=A0
> =C2=A0	/*
> @@ -1660,6 +1660,7 @@ static void bm_kill_sb(struct super_block *sb)
> =C2=A0
> =C2=A0static int bm_init_fs_context(struct fs_context *fc)
> =C2=A0{
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &bm_context_ops;
> =C2=A0	return 0;
> =C2=A0}

