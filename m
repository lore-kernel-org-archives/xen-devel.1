Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC373606A339
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 08:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=S/pna95f
Received: from list by lists.xenproject.org with outflank-mailman.1491975.1692664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTEX3-000208-8B; Tue, 17 Nov 2026 08:27:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1491975.1692664; Tue, 17 Nov 2026 08:27:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTEX3-000201-5U; Tue, 17 Nov 2026 08:27:13 +0000
Received: by outflank-mailman (input) for mailman id 1491975;
 Tue, 17 Nov 2026 08:27:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <alex@amutable.com>) id 1xTEX1-0001zk-Pe
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 08:27:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTEX1-000UYP-5i
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 09:27:11 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <alex@amutable.com>)
 id 6afc0fc9-2eae-0a2a0a5409dd-0a2a4506d182-42
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 09:27:11 +0100
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <alex@amutable.com>)
 id 6afc0fde-195a-0a2a45060019-d155802bd83e-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 09:27:10 +0100
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4a210470b49so35729635e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 00:27:10 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:de4c:6789:33ce:97c2?
 (p200300cf572c2800de4c678933ce97c2.dip0.t-ipconnect.de.
 [2003:cf:572c:2800:de4c:6789:33ce:97c2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb7838c912sm45730155e9.4.2026.11.17.00.27.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2026 00:27:10 -0800 (PST)
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
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794904030; x=1795508830; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=o7Ds5Sp5DChQJ6GHa3pEkVZuOErJkij7LbLCUPT9+Pc=;
        b=S/pna95fNrr6jotXOaL5b8AQp/n/Jl5pghMR494LxoFIJZPVVfWJ8br+mKdE77qObd
         OqOqV/FgOFzZ8ukMqft0OoLb0lLDOi0G0/Bt198suEm+pjKgpbRNUfDkfqLiJWRbYpaO
         S+jMaKIuO/ZG7Qfwvm/fhT0cb0jY3tlUKmEiCBWtKNUcDE3CtibsCOdZT55dkbu08M2M
         enrrhl79wD9O6dqWCofJ/PRQqXoMybgWTFx1cefjkuHFyRcVXZep1xgr+gr+5WUZDPyf
         kQfwD3qRe08A0ufB2iQMF9gQu01BTrsS+DBRDoD3FWC8FHEr3/feb4ee4X/f7KcDLGND
         O2sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904030; x=1795508830;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o7Ds5Sp5DChQJ6GHa3pEkVZuOErJkij7LbLCUPT9+Pc=;
        b=EN1onGecE/L13IafjJ1PzbcRv+P0GojC8V8k4MJjJ10CB7woNxOjLYtzJPODqEsdC9
         Hpdc+jDQnldT4Boao7kbKo0xdZDX+LESUV6tjNch9BRNmt2nW2cxEPNIAuZIAYr/gtnV
         32Ol4sKTheUTbeich7CrXKx3GclgOQ4QDTh8b0TGKBhkQaYHlOh8B3Xyljp5e77SSJGy
         3PBQZrDQIHLTal26VfcL9uTdaYHDw39ulVAn+nAknpjgMWpnJipGJyI8AGjdOU17Q69x
         T4SRhBnEiCTcTTNiQHxW8kVa/orF5SpF0oRax9rzZHfpKNoytq75FUXHPaumXqT0dnhg
         IpAQ==
X-Forwarded-Encrypted: i=1; AL+hErHjMFtDpF99M9e+0dcHpPahB4PCxpAj+nYBq+SmP1h/ls8KoqURXKd/+vsFHQd2eFP9ZNNSHmVsiVI=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8ILITSq+ENXBt+cmOyU14Q3g+eF9tA4mk4G11lpmpZTtDADKKg
	VAH7EBEmwF/WPrpeoY+smGH2uEdtg9imycxjqNSITECvJvi91YLkAV6yhFweOXtlSFrt
X-Gm-Gg: AYBFou3GBzAQUMk/68cMcHz6GCE46UKZzZ7NKB8Q0iUanBAPpDXh1ssc8j1qG+6m41r
	/43hQxEkbTS5TfdhSxzQkOnhbZ0RNGvqsMxXZqOafq5LtspPIzGNue+fYxjOjvrhV5kjm0QDlHG
	/+GiWk7GBAWISs1iQh9s6h2MIhAFNPKMghtlwwV+U5FJdlgtsump2P0vRlhNAczSKLMHxABknnE
	st4mre+FbRhEmQw8wP6puBvIvnnf8JtU/2FWsu6fllwtCjnW0MwRo00+fpbxGx5bLjxVPJ26l6K
	fhjpYvA26pE6tyfHfBdwFnP3n5TyoGGKdVi8H6toklp3uy5g26bOyPpX+HeI0RMLRN78DQBRwR7
	0rl0CRXu6c8pcxoKspy7H3gxZ8rLnmRv4usKmkO5cBMfdvlxkTD6fyXMfKPdCJ6eGuXCZ/oq31H
	oe6eNy+CkNGNvI3CcEPb2M+n/DtSh7VZqUeoMFpriyOJT1IVTlB98gDOft7HkPkXozY92dAZnD5
	rK11pPmokSW+8jRG0SXTf4R6/U7I4kj3pD9q+8zALhlm/KlKPG2q5DzQQYdHnK/5kw7GRmTgQn8
	r+S0GBNJ50ZmtdijwLr0Jd6+Cs588HW/oUE1UsAuXE7Zd7YgkezI6T8Zu33nPdD5xsGWeujPg9o
	CacU3H20YHrBIKf00hNYXlWTAJtcLqQWJFJMImvg+o5B/9LsiHD3ON8hJ
X-Received: by 2002:a05:600c:3494:b0:4bb:6c71:b268 with SMTP id 5b1f17b1804b1-4bb6c71c232mr134135095e9.6.1794904030378;
        Tue, 17 Nov 2026 00:27:10 -0800 (PST)
Message-ID: <0ec7b8c90cc456b24e5b19c1db673d497ae43735.camel@amutable.com>
Subject: Re: [PATCH RFC v3 12/44] rust_binderfs: use fc_init_pseudo()
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
Date: Tue, 17 Nov 2026 09:27:08 +0100
In-Reply-To: <20261116-work-loop-pseudo-v3-12-8cbbea1cf34f@kernel.org>
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org>
	 <20261116-work-loop-pseudo-v3-12-8cbbea1cf34f@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-purgate-ID: tlsNG-16d1c6/1794904030-F70C777B-54267837/0/0
X-purgate-type: clean
X-purgate-size: 1663
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 2026-11-16 at 12:04 +0100, Christian Brauner wrote:
> Initialize binderfs as a pseudo filesystem instead of raising
> SB_I_NOEXEC
> by hand. This adds SB_I_PSEUDO. binderfs_fill_super() keeps clearing
> SB_I_NODEV for the binder device nodes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0drivers/android/binder/rust_binderfs.c | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/android/binder/rust_binderfs.c
> b/drivers/android/binder/rust_binderfs.c
> index 5f020226720db..04468c5b5c116 100644
> --- a/drivers/android/binder/rust_binderfs.c
> +++ b/drivers/android/binder/rust_binderfs.c
> @@ -3,6 +3,7 @@
> =C2=A0#include <linux/compiler_types.h>
> =C2=A0#include <linux/errno.h>
> =C2=A0#include <linux/fs.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/fsnotify.h>
> =C2=A0#include <linux/gfp.h>
> =C2=A0#include <linux/idr.h>
> @@ -667,7 +668,6 @@ static int binderfs_fill_super(struct super_block
> *sb, struct fs_context *fc)
> =C2=A0	 * necessary and safe.
> =C2=A0	 */
> =C2=A0	sb->s_iflags &=3D ~SB_I_NODEV;
> -	sb->s_iflags |=3D SB_I_NOEXEC;
> =C2=A0	sb->s_magic =3D RUST_BINDERFS_SUPER_MAGIC;
> =C2=A0	sb->s_op =3D &binderfs_super_ops;
> =C2=A0	sb->s_time_gran =3D 1;
> @@ -759,6 +759,7 @@ static int binderfs_init_fs_context(struct
> fs_context *fc)
> =C2=A0	ctx->stats_mode =3D binderfs_stats_mode_unset;
> =C2=A0
> =C2=A0	fc->fs_private =3D ctx;
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &binderfs_fs_context_ops;
> =C2=A0
> =C2=A0	return 0;

