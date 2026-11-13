Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0C6606A32E
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 10:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=kS6DikUM
Received: from list by lists.xenproject.org with outflank-mailman.1486975.1689485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRoGc-0005Yy-J6; Fri, 13 Nov 2026 10:12:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1486975.1689485; Fri, 13 Nov 2026 10:12:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRoGc-0005VH-7O; Fri, 13 Nov 2026 10:12:22 +0000
Received: by outflank-mailman (input) for mailman id 1486975;
 Fri, 13 Nov 2026 10:03:25 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <alex@amutable.com>) id 1xRo7x-0003Mw-AI
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 10:03:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRo7w-004ZXM-N9
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 11:03:24 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <alex@amutable.com>)
 id 6af6e064-2eae-0a2a0a5409dd-0a2a4508a13e-20
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 11:03:24 +0100
Received: from [209.85.208.51] (helo=mail-ed1-f51.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <alex@amutable.com>)
 id 6af6e06c-f659-0a2a45080019-d155d033f138-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 11:03:24 +0100
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-6b570ff3dfdso980499a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 02:03:24 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com.
 [80.187.86.54]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b7c236124esm752333a12.6.2026.11.13.02.03.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 02:03:22 -0800 (PST)
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
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564204; x=1795169004; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yP9dZgkD4P/bNBFnmHOgKVBIpz9VJZUP73dl9853V04=;
        b=kS6DikUMvB2DL3BDASLhvF3O85bkktQcaOQBqniUegsWuRIkoAJwXXZQ/YS5KXAsGJ
         mSAztNCw1cQsXDeF+xUZunHexBxZivY4xff6BI+DqirL7JePKENPIXVuq5aRMgd85gQK
         BYGTEflj8OMrjVwZmiteSeYQ1F6WA4fbVVn6Kb1v1/85aKfDggTpqXxEFjIi2qx0VI6F
         HUZHOq02NXevcfMiMQ4T46wVmpOXkCuaGUlvJo8GiXIxyILjA/XEu5nIFT1qv0B8YOXG
         fHQwN2AMv2kzdn6uJ4jPnSQojMpFfkwRyf0iFDLg45vDFemwDeLnIoiFxtOLZpXImF+t
         caCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564204; x=1795169004;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yP9dZgkD4P/bNBFnmHOgKVBIpz9VJZUP73dl9853V04=;
        b=kWnqc6e0xx6OFP7e/9V04GI7mK9IPRDogVC0B9wIUQBHgsoLl6iiPbNoJEv8QDNB0R
         DIUyfh4tWoK+Yyvu/uzoke+HlVsQ7zZxWUjsjnHzmy2+14jzTTVtO1xUvF7BHtcVWNvp
         tFr1v0i0hOETBahxsbB2m3lAMLGaKHIpSIj8JrtaA7QnPTSrdr96ZANswjlY7FKdUB5I
         YbaxbgrgMRMJ3pkPBIh0Fve5YVTWcymxlF+pg0wTUESU39xBN3AEh5SJcOlfVnV9Fx+B
         C9t4jAO7B+1CkkuxkQCNHt0Q2HiGbtTkxbMWjJzPXUrbt9kQsz3ondU8L1NExLyBjHoL
         mWRw==
X-Forwarded-Encrypted: i=1; AL+hErEvxpsZ/XyE/ilcLjMdpOqoQPbTx39CUObWx0Jqf5yhSpoksqQfftGx5XD2jGdaavoOZha4nAfhPhY=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8BBn+crdCs2hFaEHKzAZD/Gkg0mPMjm1eXlWH0tbdnA4Z3NLLu
	rWx5i0B7J/7n8nklsPxyghgKOWsAdRifUEYUSI952gx11d56/osNFl4qnvnISN6VvVO0
X-Gm-Gg: AYBFou2wakqF+g42PQV+8uBdVGW/XqvdKSQup5VxIXjiXq8XJhqEdzggNt5HeeDIC/o
	aZGzMlbckPDebASsubIZ3WPfAKMyvYlus04ODF42A3NaHAaT37rYF66zNFSjGp4nZXyCsFayhTr
	yF1pmiRXvCCYFr08Q5MqkiSvuYNAGkmdoBRutWoKfGOLUID4ZeJQqLBCkZP7bm2DYupzw0pr0V+
	zSGoJLozjER7sLtkFeEyINfc99TLy1eTPzXRCcp3yHDceh5BI538Z0MNY6l8QsC4NqIv0SHoyX8
	ZCvhk+sxAOD+UABiRM6qZ6f4ZddWVo7mpqw27toSJM1L8yZVYCBZ/HVusO249QwFd2gRoB1BP5H
	dKmhmR1VPOnUL11qqx51zhja2wcQjjgnHtfLny8zDAmG1SmhfY46bH0xLqCFdcHbYUgaqbg4tDp
	ty2NIvy1tYzWPJLxNU6Hg8h2++AEown037GO3jXsGf0m/ImRXSYdB7pjZFIr6Weefjg6dnQHWdz
	M38slWUx7mFiMKKL1JQ2LNUMgXyccjyZ8Z4o466ewJxouxQm+MDnjPxOcxba7rhwvtYhx5thQn8
	yDJO5B3zZ2EehKiysRObQ6GlVQhVKD1GkTciuABKcNOgnHloFBu35leAMZn+ww0=
X-Received: by 2002:a05:6402:270d:b0:6b7:d479:654a with SMTP id 4fb4d7f45d1cf-6b7d47965e6mr298323a12.36.1794564203570;
        Fri, 13 Nov 2026 02:03:23 -0800 (PST)
Message-ID: <e5f36cc53b733383ac1d1f1e8c03f73091595edf.camel@amutable.com>
Subject: Re: [PATCH RFC 08/41] mqueue: use fc_init_pseudo()
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
Date: Fri, 13 Nov 2026 11:03:20 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-8-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-8-4c998976c6c7@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-purgate-ID: tlsNG-c1860d/1794564204-CD74B87B-145CF2D9/0/0
X-purgate-type: clean
X-purgate-size: 1502
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 2026-11-10 at 10:14 +0100, Christian Brauner wrote:
> Initialize mqueue as a pseudo filesystem instead of raising
> SB_I_NOEXEC and SB_I_NODEV by hand. This adds SB_I_PSEUDO.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0ipc/mqueue.c | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/ipc/mqueue.c b/ipc/mqueue.c
> index 322c3dd98c44..8bbe32d0881f 100644
> --- a/ipc/mqueue.c
> +++ b/ipc/mqueue.c
> @@ -18,6 +18,7 @@
> =C2=A0#include <linux/file.h>
> =C2=A0#include <linux/mount.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/namei.h>
> =C2=A0#include <linux/sysctl.h>
> =C2=A0#include <linux/poll.h>
> @@ -405,7 +406,6 @@ static int mqueue_fill_super(struct super_block
> *sb, struct fs_context *fc)
> =C2=A0	struct inode *inode;
> =C2=A0	struct ipc_namespace *ns =3D sb->s_fs_info;
> =C2=A0
> -	sb->s_iflags |=3D SB_I_NOEXEC | SB_I_NODEV;
> =C2=A0	sb->s_blocksize =3D PAGE_SIZE;
> =C2=A0	sb->s_blocksize_bits =3D PAGE_SHIFT;
> =C2=A0	sb->s_magic =3D MQUEUE_MAGIC;
> @@ -457,6 +457,7 @@ static int mqueue_init_fs_context(struct
> fs_context *fc)
> =C2=A0	put_user_ns(fc->user_ns);
> =C2=A0	fc->user_ns =3D get_user_ns(ctx->ipc_ns->user_ns);
> =C2=A0	fc->fs_private =3D ctx;
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &mqueue_fs_context_ops;
> =C2=A0	return 0;
> =C2=A0}

