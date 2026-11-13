Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44556606A32D
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 10:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=NYrBcVyQ
Received: from list by lists.xenproject.org with outflank-mailman.1486987.1689518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRoGe-0006LZ-WB; Fri, 13 Nov 2026 10:12:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1486987.1689518; Fri, 13 Nov 2026 10:12:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRoGe-0006IK-Ps; Fri, 13 Nov 2026 10:12:24 +0000
Received: by outflank-mailman (input) for mailman id 1486987;
 Fri, 13 Nov 2026 10:06:02 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <alex@amutable.com>) id 1xRoAU-0003TU-Nu
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 10:06:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRoAU-002UHG-0w
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 11:06:02 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <alex@amutable.com>)
 id 6af6e100-bab6-0a2a0a5309dd-0a2a450aa392-18
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 11:06:01 +0100
Received: from [209.85.208.49] (helo=mail-ed1-f49.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <alex@amutable.com>)
 id 6af6e109-f2d2-0a2a450a0019-d155d031ddb8-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 11:06:01 +0100
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-6b408f2d936so1445741a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 02:06:01 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com.
 [80.187.86.54]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c5095b8651bsm73693366b.78.2026.11.13.02.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 02:06:01 -0800 (PST)
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
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564361; x=1795169161; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TjkCmA8zoLhZK8u7U4HhR7QcElVzore/o+jClE5BdRs=;
        b=NYrBcVyQNQLRijv5X1ZPigGfmAlhtSQFV9xH6hTQeQ6lIChhy4CfT/R+jeN7Dblffr
         uJ3IjUP+BioUBpk4yA0KH79IEs2HhMXNTZflG5ExhQo+5x8Yxusd919szqTEklu1nl/i
         QxstPBmzF7YHsguK0pi4hOlec2EkZGNUR85pIsBb6P+/6KqxZWlVBfNTi+b+iIax3pn0
         hd9ZXq2SQDZI7JXg79ArQML5gUWYxG+wntcpwLm4exdAK7BzW2uxHcNdIR1KeCfKpt/M
         I3sFFWvBB61xsiUDN3g/4+XpvrxqdoKMh5geSFTcLAka0h89NcwdF8FJk1pwYZQ0Cx3c
         Dy1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564361; x=1795169161;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TjkCmA8zoLhZK8u7U4HhR7QcElVzore/o+jClE5BdRs=;
        b=1nSMWEH9BLdZP4gNfEYSog2lbVnuj/WqCOgeo3NeoQG4Ct0guJrSzqedGs9T0kpvrY
         nkwtvRMZQxctNcbRunT09ElKDlJtYWt6Dn2QLrhNUaS9FB1g8iKRNp4jSVIYFsB5rsG+
         3NzZxWy6HSNOZ/o7Azm9xC0llwUgLMlPlc3+SaeN/PYUIs5/QtRcPXTlJLPE32295ylF
         Y0cBgmz7WzxTXiUlw8xCeSAjqITYc6PO0zGiHkZdjKzHonOkw25pMV+HyjKQwOQs9hw5
         YkSA5rd8fq3rA5H8HC6XoMRIwV+Ytndi0jHVfPzHDchAq0l+ZagKcj+w+TITLyHKgZ3H
         +gQA==
X-Forwarded-Encrypted: i=1; AL+hErHIeBM++7bIey9xkCqK+FLqDcyk17kcj5JYCWitvzxh4z6zdSpVespd+w/R2ul2LbT9TAEzAiGo/LE=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8RT2/JG+ludrAstCof0sTN7TE60UvsAFfukxdIQHDLHKpYWbkw
	auL3j8a4u1PvbrnDEgOS2dq6FLyI/wn7MBCaaOtovCpCQjMkyY4z9Y/Z0i9mo6cTYQzb
X-Gm-Gg: AYBFou1jYwbFpKp7B3kfjvjliLudGkmNs7qV7mNWFzmOsO3YpRy8u+8z9phB5Oqg43v
	UgI+/2eotjoL6WgzVsogNHvxBsN+o0dT2UjFpqD6yYepTZUpZj/kGO8bKKLOdZ/miv8mqS5jsPe
	Yuoho2qfAZQYMP2uofTB7+YtE8EqMYHDX2wNs9c7igOB1+TBl3wB/ZGFD7AlbTcPVILgmpjsoyR
	yx9B1fqYFiCrLTehSxt9JWHd22W5wf+j3ryRfxiLgMTBmjY88cd73azTLzRoojjWTQuuTFHRDdT
	CLkcMAOycl3LBSMKoov9HBo9WqaAuf0ClnnkLm4NwmV65hwjKzilp3AY1MWi2GDsySl6ckZZig1
	YKtkDJekw/EiQQvZLbIpRMBmdixl1yOZqzG8NxORIIwC+9EHrsMeW4GmCyvBM9YG7P+FTurMgkj
	W2DtpRkpZppU0Zhd2f+ItXoSCixABit7VJVOYHBQhFlv1o97en7Wij/E/sFHXzoo1NoNvxFu+S6
	5dgJgEcQfDkJuZdbdARJ33yd9epxjA9eI/HlW2jwdqP4TfwstxeRa6AG77CvFUGVAwcXXK5PEj8
	fN07tdJF2AeZ0Lka40upQ74ZCi4r2Oh/6kIlc7c1vOwcmEKIxUipP3GyjFQh43s=
X-Received: by 2002:a17:906:ef07:b0:c4d:5820:325a with SMTP id a640c23a62f3a-c50963dc627mr169588066b.39.1794564361325;
        Fri, 13 Nov 2026 02:06:01 -0800 (PST)
Message-ID: <e8b71a2778d7d7797d433e7bac1a37ee64aaa30c.camel@amutable.com>
Subject: Re: [PATCH RFC 15/41] tracefs: use fc_init_pseudo()
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
Date: Fri, 13 Nov 2026 11:05:59 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-15-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-15-4c998976c6c7@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-purgate-ID: tlsNG-4011c0/1794564361-4B4D7CFC-3A97C0A5/0/0
X-purgate-type: clean
X-purgate-size: 1311
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 2026-11-10 at 10:14 +0100, Christian Brauner wrote:
> Initialize tracefs as a pseudo filesystem. This raises SB_I_PSEUDO
> and
> also SB_I_NOEXEC and SB_I_NODEV. tracefs never holds executables or
> device nodes.
>=20
> SB_I_NOEXEC also refuses PROT_EXEC mappings. The only tracefs files
> that can be mapped are the ring buffers and __rb_map_vma() refuses
> VM_EXEC already.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0fs/tracefs/inode.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/fs/tracefs/inode.c b/fs/tracefs/inode.c
> index 5020365ca704..e04febd868eb 100644
> --- a/fs/tracefs/inode.c
> +++ b/fs/tracefs/inode.c
> @@ -12,6 +12,7 @@
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/fs_parser.h>
> =C2=A0#include <linux/kobject.h>
> =C2=A0#include <linux/namei.h>
> @@ -510,6 +511,7 @@ static int tracefs_init_fs_context(struct
> fs_context *fc)
> =C2=A0	fsi->mode =3D TRACEFS_DEFAULT_MODE;
> =C2=A0
> =C2=A0	fc->s_fs_info =3D fsi;
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &tracefs_context_ops;
> =C2=A0	return 0;
> =C2=A0}

