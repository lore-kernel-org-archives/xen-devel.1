Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D435606A32D
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 10:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=UioZ6eo+
Received: from list by lists.xenproject.org with outflank-mailman.1486965.1689460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRoGb-0005BJ-5d; Fri, 13 Nov 2026 10:12:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1486965.1689460; Fri, 13 Nov 2026 10:12:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRoGb-0005AX-1M; Fri, 13 Nov 2026 10:12:21 +0000
Received: by outflank-mailman (input) for mailman id 1486965;
 Fri, 13 Nov 2026 10:02:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <alex@amutable.com>) id 1xRo6t-0003IL-H3
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 10:02:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRo6s-00Gnvs-Tu
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 11:02:18 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <alex@amutable.com>)
 id 6af6e01e-e002-0a2a0a5209dd-0a2a4508a0bc-44
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 11:02:18 +0100
Received: from [209.85.208.51] (helo=mail-ed1-f51.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <alex@amutable.com>)
 id 6af6e02a-f659-0a2a45080019-d155d033e029-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 11:02:18 +0100
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-6b70880c0a4so1097612a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 02:02:18 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com.
 [80.187.86.54]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b7c23c672asm734155a12.15.2026.11.13.02.02.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 02:02:17 -0800 (PST)
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
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564138; x=1795168938; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Ee4ggwaa7pvqsvjnONVsvhhjx7Blw4b1QTFG8P7u7TE=;
        b=UioZ6eo+JNNKTrBw4XQt9NRD6mbWgqRoTvp2QT+x2gxQLqs+bKMUWpHJ4leb6MsNC4
         8gTrokJFMu2aw7Lwa6F0VG25HRHcxdrKCXm3q3PBVtdQ5CKEh0+e3IO+gVmeGokF0WYJ
         UDCIyWmJ5TBL3bFcWmpUai0j12V4ad9zBpd+h4xc14Jl/lPcSHqB+yR2rju1Y+ulTOzv
         CB/Ri4mkxR/RAoOp0q3d52yPgGJXR6JGIfqdHz8WVyLZ2sANBrRfhvnAHlUSYaK58OYW
         oMtrUIl0bVuARgpWmfoQu5GrxgAgvz1MOkefIsvlSp6opihJ5UIVryYWTdaV7WC4mYtn
         Pb6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564138; x=1795168938;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ee4ggwaa7pvqsvjnONVsvhhjx7Blw4b1QTFG8P7u7TE=;
        b=cgkRIfV/33rJC9Xj4mSNTLd4rIrRmYwb/HBwTiFEKqfmwlppP4guCyC41roEpGNu6g
         Emto8XHT6kCuz8RMS1oHZjZAQXazrrkws+QzpBQjbedOFumXpqUsZwfteGiTuEIzzXnU
         QZLLi953PLA51l+YLLLc6SLXo4Ft0yd9D/19XbW3JBEzpbIKj8HjYOIvxH0OxtkYJ+Df
         XCTTMashKJaR7A+WcQfTS+JqtwURftGBEaYEi2tYCx6QdYvxZffXYFffw3BMQV5KUAwU
         cG/Llzvt5/bTXkKTI4rhChx8xGTyo/wHIiedFIeq6p6a07LbdGwGIcGn6OfX7MKtd2BX
         6low==
X-Forwarded-Encrypted: i=1; AL+hErFKhL+fR53HH3s0N87hQ1rLDdWWJkEdU+4d7cibAhKnJPlx9JXOpuvenzV4zYMxJSEV0qy/qe2h3Z0=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8IzQVGq3P+oazIjzusMj6z+QVieY7az5AFckgFWHDdae9KjEiC
	AtyQ8VsmIzDe7/qBROxCbHIgfBABp711calGdCeLCLsN8dXmi2dzKyZZnFkd5KvBbxIk
X-Gm-Gg: AYBFou1VwkQ8H+/mHy6+qvji5S7PoEodtZnta8QLj9CgE82doVzumuW4oV+iEZLf4KQ
	6PSsxfQ8q5Nku7uHNae6NcdHatc/CczJedPlD/etXXDh0ck72o0c0gWH4LjGNhx7jbPeRmsg5yR
	zdKhc4xQ9sEZtPsdoYBYkfPoOwTc+Xh7HDB7m1GJiL6Geu81SFcEgexK4w/BSi2xhkwvj8Q8bwG
	zShLCL0VsIoqVemVW24yotIIMaXeYkx8QWJeHn3tvMuk3ikFIoqRLhxbzWZEp1oIz7HfXImxg+g
	KBWvFX6aikkpyaqj9JAr6bsZz88JivGhs50sPFRc7u6L/OrUb1xlFhPqrZneGIVqxewsqh8XpFY
	aGVMn1ttK5u9uUhmYjA6KVsQt3Jb7oRlvmiCkO2D/RW4Q+BsM+GW1OBJChyWJ/Gv7QsCZkKgvL5
	o1elU4XDPHV5Ox+PuGlXWXC1HNGPJLlM9VbCJ7O2zX62MPhqlXINUY/QLUBp9EFGOp7DjWXg1L9
	jJSVr91Rxt3R94Sq+OPc7KJmDQ38P7ZquCCLa+OR5aPjUsR6eJxrN1EdX6Qy9MeGbG850FkN5Nm
	c8NqstYkovtrhhShGYiOSe3Ey3xrPDqueTd2GuJlWrQrZGVKdhYZkRCUEU909Es=
X-Received: by 2002:a05:6402:c4e1:10b0:6b6:eefc:ae7a with SMTP id 4fb4d7f45d1cf-6b7c088f8ecmr1236733a12.4.1794564138223;
        Fri, 13 Nov 2026 02:02:18 -0800 (PST)
Message-ID: <f4ce8239f22046e90cf4807853282a570c73707a.camel@amutable.com>
Subject: Re: [PATCH RFC 04/41] fs: add SB_I_PSEUDO
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
Date: Fri, 13 Nov 2026 11:02:15 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-4-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-4-4c998976c6c7@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-purgate-ID: tlsNG-c1860d/1794564138-D7B5987B-082906D6/0/0
X-purgate-type: clean
X-purgate-size: 4054
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 2026-11-10 at 10:14 +0100, Christian Brauner wrote:
> Currently, there's no way to tell whether the files of a filesystem
> store data or whether they are kernel interfaces. Files on pseudo
> filesystems such as procfs or sysfs generate their contents when
> they're
> read and writes to them are commands to the kernel.
>=20
> But a few places in the kernel take an arbitrary file and use it as
> storage: loop, zloop, the nvme target's file backend, the scsi
> target's
> fileio backend, fuse passthrough, the usb mass storage gadget and
> erofs
> file-backed mounts. At most they check the file type and whether the
> file implements ->read_iter() and ->write_iter(). That's not enough.
> kernfs provides both for every sysfs attribute for example.
>=20
> Add SB_I_PSEUDO so a filesystem can state that its regular files are
> kernel interfaces and must not be used as storage.
>=20
> Pseudo filesystems also never hold executables or device nodes. But
> currently each of them decides on its own whether to raise
> SB_I_NOEXEC
> and SB_I_NODEV. Some do, most don't. Add fc_init_pseudo() as the
> common
> initialization point for all pseudo filesystems that raises all three
> flags and switch init_pseudo() over to it. The following patches
> convert the mountable pseudo filesystems.
>=20
> Nothing checks SB_I_PSEUDO yet so no functional changes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0fs/libfs.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +=
-
> =C2=A0include/linux/fs/super_types.h |=C2=A0 1 +
> =C2=A0include/linux/pseudo_fs.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 11 ++++++=
+++++
> =C2=A03 files changed, 13 insertions(+), 1 deletion(-)
>=20
> diff --git a/fs/libfs.c b/fs/libfs.c
> index 96a6e9b1535f..8c8789489fdf 100644
> --- a/fs/libfs.c
> +++ b/fs/libfs.c
> @@ -735,7 +735,7 @@ struct pseudo_fs_context *init_pseudo(struct
> fs_context *fc,
> =C2=A0		fc->fs_private =3D ctx;
> =C2=A0		fc->ops =3D &pseudo_fs_context_ops;
> =C2=A0		fc->sb_flags |=3D SB_NOUSER;
> -		fc->s_iflags |=3D SB_I_NOEXEC | SB_I_NODEV;
> +		fc_init_pseudo(fc);
> =C2=A0		fc->global =3D true;
> =C2=A0	}
> =C2=A0	return ctx;
> diff --git a/include/linux/fs/super_types.h
> b/include/linux/fs/super_types.h
> index 72f4288e16c5..472200bdf081 100644
> --- a/include/linux/fs/super_types.h
> +++ b/include/linux/fs/super_types.h
> @@ -359,5 +359,6 @@ struct super_block {
> =C2=A0#define SB_I_NOIDMAP	0x00002000	/* No idmapped mounts on
> this superblock */
> =C2=A0#define SB_I_ALLOW_HSM	0x00004000	/* Allow HSM events on this
> superblock */
> =C2=A0#define SB_I_NO_DATA_INTEGRITY	0x00008000 /* fs cannot guarantee
> data persistence on sync */
> +#define SB_I_PSEUDO	0x00010000	/* regular files are kernel
> interfaces, not storage */
> =C2=A0
> =C2=A0#endif /* _LINUX_FS_SUPER_TYPES_H */
> diff --git a/include/linux/pseudo_fs.h b/include/linux/pseudo_fs.h
> index a651e60d9410..0ca408aa60af 100644
> --- a/include/linux/pseudo_fs.h
> +++ b/include/linux/pseudo_fs.h
> @@ -2,6 +2,7 @@
> =C2=A0#define __LINUX_PSEUDO_FS__
> =C2=A0
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/fs/super_types.h>
> =C2=A0
> =C2=A0struct pseudo_fs_context {
> =C2=A0	const struct super_operations *ops;
> @@ -15,4 +16,14 @@ struct pseudo_fs_context {
> =C2=A0struct pseudo_fs_context *init_pseudo(struct fs_context *fc,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long magic);
> =C2=A0
> +/*
> + * Common initialization for all pseudo filesystems, mountable or
> not. Their
> + * regular files are kernel interfaces. They don't store data and
> pseudo
> + * filesystems never hold executables or device nodes.
> + */
> +static inline void fc_init_pseudo(struct fs_context *fc)
> +{
> +	fc->s_iflags |=3D SB_I_PSEUDO | SB_I_NOEXEC | SB_I_NODEV;
> +}
> +
> =C2=A0#endif

