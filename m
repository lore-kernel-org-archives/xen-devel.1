Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C8D606A338
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 12:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=lO7zQrbY
Received: from list by lists.xenproject.org with outflank-mailman.1487466.1689891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRqY2-0002sN-Ns; Fri, 13 Nov 2026 12:38:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487466.1689891; Fri, 13 Nov 2026 12:38:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRqY2-0002sG-LP; Fri, 13 Nov 2026 12:38:30 +0000
Received: by outflank-mailman (input) for mailman id 1487466;
 Fri, 13 Nov 2026 12:38:30 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <alex@amutable.com>) id 1xRqY2-0002s8-0o
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 12:38:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRqY1-0031m3-Dw
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 13:38:29 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <alex@amutable.com>)
 id 6af704c0-8faa-0a2a0a5109dd-0a2a4508d9ea-20
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 13:38:29 +0100
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <alex@amutable.com>)
 id 6af704c4-f659-0a2a45080019-d155802ea5b2-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 13:38:28 +0100
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4a9a8d6cea8so9108275e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 04:38:28 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com.
 [80.187.86.54]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb571cfa2esm48348475e9.2.2026.11.13.04.38.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 04:38:27 -0800 (PST)
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
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794573508; x=1795178308; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Ny+1veWg8VD0eIDxFJ1X48Kguf5Oe9PbJZTpbcgMiOk=;
        b=lO7zQrbYd6E3G3gu7m7p9aN6/F/OBwDP0AqIpxXW8J49r7XxjqtAQgIi0zvruRHiPI
         dlIvXEvRRe8MZdj+42MNJVMocfqHeqx0LAb3ZXnKV6qksoEWsMNKMAxQ4cyCRABsJlyx
         WPl+3RUOqmFXAcXMPko4cHMQyzpsoVz3aJH3PolS0s2XTbYoeWZjq/bOrjSl4BQmNjdv
         vucQxO1+CPHiEf12o6Wd0TDBN7PbNLNfsk3fvz+pbWxO8o0itrS4EjdoES1xOin8zPOu
         NIZOAGa2cyuQjyvDfZ3wEo6ffy8LYHiajg3WhIBtpzawvWJk5VZgjMbMqW19uDk3C7S2
         6sgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794573508; x=1795178308;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ny+1veWg8VD0eIDxFJ1X48Kguf5Oe9PbJZTpbcgMiOk=;
        b=12w8M+wTd9ca18gnZH6IrP5UxjSAY9F/ZX/s2MrRJ7c2bQ/pqYdavAoYeelIudjT5C
         8z27LPUye3GD9xHmDUFylaD2dKTOXelNgEWj2sDP6BF4aYJYKLtVHR/GfFOkXi0HhgLD
         GTNxntpYJkLQMEPC7HxnGDvRfmddELU+HEaI+X6rIhUUDlw0SlpGPK523HlJgVgP3H0w
         hxDci3u5WZFkPeCaan5B/wfA7y0XVS0DbRdidTUEXI6G/8+orbYFm7pA5Y8BJteprfKl
         S0qCVPTfx2CnpZJNCtx2IOZI6M85Rk8F9Ng4Qg3AjSLslU2yA8CP8Lovp997mBTaCuMQ
         XVGw==
X-Forwarded-Encrypted: i=1; AL+hErEnUHK/yAk6waes0CCE9zjUOL4p+s4UemTxlnQ5ZqNPqcuTCVEBVPhgNSa3WKDGN2uj+eJErB0Ilvk=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9EyFFoMMqcMfnOtah50SP7Akoa74dZzoCAO+QRNBzEPVQf34EC
	J5SSwIzDAe5DSEEDJTLF4cE7zLDMY7tqju573eCDKN6e8QR7ufY8qD76+W0JKw7mN3tl
X-Gm-Gg: AYBFou0jFGY/jwyf67yKXNS/h5AnTXPYV6Ysc3LmlSiOfNw0MU4kJ7g47CvXF8StZEJ
	MQ0oT5keMG1VA2qG3oxn/X+evo69DpgTuYu2v01Ygp+ZxvRkYto88IOLaxGTJc9PDHttjZXkxI/
	Kd8ncMZUxv58uahfafAllY+1hq7RLqRxkvNVJEQh+KD2KeS6f0T94ekIPyCbwUVkp0kG5+FQOqK
	j0dYSmGrZG12KySWgONCr7xBgHkYpByVkPkET7BHln3Fp3vRHnMXGYPiU6zxAWnmD59qWIaSytj
	o0UKmkuL4bYmqZKkNSp9YdtwKg0ZaNr0Ij5pBpgkuU6gQ+QP0ncsE5vdgI8fj8r6T1XVn0ABeBF
	oRaex3e/L53N9l1G0AE+eqTX4zCblAnI+Q9HkNPBxdD/dZRWzAw17Isb3wEe2oRRl0dflndu4pv
	JsOe+nD/q4m+M/IIyfPB6QTqVtE+7Q+LsSoi2M/vJ3wNt/csevknBfeRhKoo9a+tfH0sAH3Hdmq
	YK38CDVz5iN0m61hKhZaaHT9T2bC7pw5I1eB2VSgfAV31FUiQ9nZUykM8YhWW0uVnVAfozMXdSH
	KXvvXktJybYxWQTIXZzJkLjacOkWpMHyge5c4Hj7fMi8v1FblPPCNOS9CWEV2U8=
X-Received: by 2002:a05:600c:a596:b0:4b5:d95c:2380 with SMTP id 5b1f17b1804b1-4bb55a86fb2mr24790785e9.11.1794573508217;
        Fri, 13 Nov 2026 04:38:28 -0800 (PST)
Message-ID: <28a33fa649dcaae2eadcc934ec49fa591ec1c283.camel@amutable.com>
Subject: Re: [PATCH RFC 20/41] apparmor: use fc_init_pseudo() for apparmorfs
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
Date: Fri, 13 Nov 2026 13:38:25 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-20-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-20-4c998976c6c7@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-purgate-ID: tlsNG-c1860d/1794573508-CF55C87B-592BEA7A/0/0
X-purgate-type: clean
X-purgate-size: 1229
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 2026-11-10 at 10:14 +0100, Christian Brauner wrote:
> Initialize apparmorfs as a pseudo filesystem. This raises SB_I_PSEUDO
> and
> also SB_I_NOEXEC and SB_I_NODEV. apparmorfs never holds executables
> or
> device nodes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0security/apparmor/apparmorfs.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/security/apparmor/apparmorfs.c
> b/security/apparmor/apparmorfs.c
> index a99366467217..351ea3a7120e 100644
> --- a/security/apparmor/apparmorfs.c
> +++ b/security/apparmor/apparmorfs.c
> @@ -21,6 +21,7 @@
> =C2=A0#include <linux/rcupdate.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/poll.h>
> =C2=A0#include <linux/zstd.h>
> =C2=A0#include <linux/string.h>
> @@ -263,6 +264,7 @@ static const struct fs_context_operations
> apparmorfs_context_ops =3D {
> =C2=A0
> =C2=A0static int apparmorfs_init_fs_context(struct fs_context *fc)
> =C2=A0{
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &apparmorfs_context_ops;
> =C2=A0	return 0;
> =C2=A0}

