Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501BD606A32E
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 10:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=aSCLYJ6c
Received: from list by lists.xenproject.org with outflank-mailman.1486969.1689473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRoGb-0005KQ-Q2; Fri, 13 Nov 2026 10:12:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1486969.1689473; Fri, 13 Nov 2026 10:12:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRoGb-0005IE-HI; Fri, 13 Nov 2026 10:12:21 +0000
Received: by outflank-mailman (input) for mailman id 1486969;
 Fri, 13 Nov 2026 10:02:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <alex@amutable.com>) id 1xRo7Q-0003LC-Ek
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 10:02:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRo7P-00Go6Q-Rm
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 11:02:51 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <alex@amutable.com>)
 id 6af6e049-bab6-0a2a0a5309dd-0a2a450ad830-6
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 11:02:51 +0100
Received: from [209.85.208.51] (helo=mail-ed1-f51.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <alex@amutable.com>)
 id 6af6e04b-f2d2-0a2a450a0019-d155d033e145-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 11:02:51 +0100
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-6b7bffb5b8fso1234772a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 02:02:51 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com.
 [80.187.86.54]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b7c262338csm739270a12.33.2026.11.13.02.02.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 02:02:50 -0800 (PST)
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
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564171; x=1795168971; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QOKRfXbntKilXKCbQIPuMXmISRmnU6cXIBUGi5zYMoA=;
        b=aSCLYJ6cW98HyZUtYRS+WcglbOq7c/cRGQh1M2YhDGBVPTgtjwavS4LJgnbht0DSS5
         tlaW9i8Npxc+hmsnpiEKZmwmqYWzQeo3W5ovzPihqQ5nV+YTvhDAQaoxJTpB+22y4FUq
         nkgIIQjdtodKeoEV6J+MgupaQUta8ZH7UntG+bB5FhVHYC18fEZLcp40fy2pzs+Fy2Gr
         KoNI3MfN4CODoEkdnUf36LSscnszHQRmF59EvjQ4hZCfv+qFUUy/K2nW9nyUCynUTAA0
         Y+8tPgMDMz0Y0T8f7Nd0rAe9kLkaCDVmBpfKX1OC9WI92r2TdSlyhuYzGmdcDnbhAMzW
         u4Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564171; x=1795168971;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QOKRfXbntKilXKCbQIPuMXmISRmnU6cXIBUGi5zYMoA=;
        b=v4h+NYEICS33PLzKs4aH1kbia4eZU13IUjHV62EV+ZeaDZ0KdWg2vGjTjeXMgkgpMI
         +SqPW5CRk0K9T4+mFQGxk6r9cwTZovB4aZSScf/da94U+uPp5WdmDxPNKPqg7P4do+Dv
         YJj9TsPGP+Kzfhy9w6Su4bikynlApbphFFWBIYeepDhSUd9YgsZs6X0e5v39XzVEEwHZ
         sIhLzuCGwKCL2qFNx1Dj+T64RIfj9drb20NRwteBqLMifzAHxymi4+v9p49Vgm1qgT1f
         IfAYE5HUs37VCNaIwVUIU0Qvj3p7LJa2DevAcIbhJBldyKobf7ehiYeuZgNq9lIpD92p
         BrFg==
X-Forwarded-Encrypted: i=1; AL+hErGcwzTbBa6EzNXjNyqYLTo0PJlG122d1oDUZsQxrTFWZsO+mwT6oD/5WY/TX4WYXdO5LyCCwYjhxRw=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+a/0NgZ9Ify/LmdlG3ghqX2qeePjRDL7vGX57Q/QLA/anwR6JZ
	2xhBYoXvla+PURtRerWToMgPbRL8JylqOXZ+I+yuY/Et50PnHwmOhPz5cAywdIxsNsrT
X-Gm-Gg: AYBFou36xRhsvtDLgswb6YfWDDfro+yjEDn1BSfA9RMMEpnJSBhPgYY1L+hMebbGdi/
	1YA5NqMPVqyE3D/yUjuEx2JmPxdo/J7duYCO2KfkLM+xZMqEgY5x2+uo1/AT2qQy5hAL2I/22Rd
	0w450q/KXgxqiCkOxoMU9daisIWMA05KmXCsB2cQC+Akca85nlhBJ01s3bvpJ01bIGjerWOrtTR
	Kgyeq7UGDSKS+eHd+dbPmJque+O5CQgVX5X2TofGTTjrMIWBOyZQcXvPK5+JFjakisvNWjR/6YH
	L98mGebLKtWg6qLs6RSlgMEFFNKLasZzvMafnYjBMbqNsW/J1IuQJglMnULrZxkS2Ld1VeoGVVK
	2hjfZoChAnQqhfa+Lber4Mmq1HQ1C55ZxiTEzShkkQCMVIB4b37kDELH4CMuz4RLC2Tv/c14sR6
	tx70PSDMcR97sOHKVbWDMsxOW5h7DrXi6kccPf3UcO8QBlRYgIW5qbkZIrl7iuwLWkxOvWZchee
	pi/6unbiPrrIP1Wk8c6cxtygItcEiRN6WdCws0vBrGq/yP1fdjOpJRlNvr0fmNfdornvHYyENY4
	yMqDhlKW+wrJWLaJwJTc274aK+O8I1CrGYZVvsBEX0FdEHvKpph8lc7GneKFfDo=
X-Received: by 2002:aa7:c842:0:b0:6b7:82cf:f69f with SMTP id 4fb4d7f45d1cf-6b7c0ceaefemr1298014a12.41.1794564171137;
        Fri, 13 Nov 2026 02:02:51 -0800 (PST)
Message-ID: <06b194053de4f4b65895248d1f2ba29d42a21b17.camel@amutable.com>
Subject: Re: [PATCH RFC 06/41] proc: use fc_init_pseudo()
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
Date: Fri, 13 Nov 2026 11:02:49 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-6-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-6-4c998976c6c7@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-purgate-ID: tlsNG-4011c0/1794564171-5A5DBCFC-910F15E7/0/0
X-purgate-type: clean
X-purgate-size: 1567
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 2026-11-10 at 10:14 +0100, Christian Brauner wrote:
> Initialize procfs as a pseudo filesystem instead of raising
> SB_I_NOEXEC and SB_I_NODEV by hand. This adds SB_I_PSEUDO.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> =C2=A0fs/proc/root.c | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/fs/proc/root.c b/fs/proc/root.c
> index 7fbbe92bf73a..ca0e75081934 100644
> --- a/fs/proc/root.c
> +++ b/fs/proc/root.c
> @@ -17,6 +17,7 @@
> =C2=A0#include <linux/bitops.h>
> =C2=A0#include <linux/user_namespace.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/mount.h>
> =C2=A0#include <linux/pid_namespace.h>
> =C2=A0#include <linux/fs_parser.h>
> @@ -265,8 +266,6 @@ static int proc_fill_super(struct super_block *s,
> struct fs_context *fc)
> =C2=A0	if (ret)
> =C2=A0		return ret;
> =C2=A0
> -	/* User space would break if executables or devices appear
> on proc */
> -	s->s_iflags |=3D SB_I_NOEXEC | SB_I_NODEV;
> =C2=A0	s->s_flags |=3D SB_NODIRATIME | SB_NOSUID | SB_NOEXEC;
> =C2=A0	s->s_blocksize =3D 1024;
> =C2=A0	s->s_blocksize_bits =3D 10;
> @@ -350,6 +349,7 @@ static int proc_init_fs_context(struct fs_context
> *fc)
> =C2=A0	put_user_ns(fc->user_ns);
> =C2=A0	fc->user_ns =3D get_user_ns(ctx->pid_ns->user_ns);
> =C2=A0	fc->fs_private =3D ctx;
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &proc_fs_context_ops;
> =C2=A0	return 0;
> =C2=A0}

