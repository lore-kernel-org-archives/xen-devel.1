Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28847606A337
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 10:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Hje2XmHF
Received: from list by lists.xenproject.org with outflank-mailman.1487020.1689590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRoIL-0001X3-LT; Fri, 13 Nov 2026 10:14:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487020.1689590; Fri, 13 Nov 2026 10:14:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRoIL-0001Wv-IY; Fri, 13 Nov 2026 10:14:09 +0000
Received: by outflank-mailman (input) for mailman id 1487020;
 Fri, 13 Nov 2026 10:14:07 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <alex@amutable.com>) id 1xRoIJ-0001WF-Is
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 10:14:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRoII-009cRK-Vt
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 11:14:06 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <alex@amutable.com>)
 id 6af6e2e5-2eae-0a2a0a5409dd-0a2a4506a332-34
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 11:14:06 +0100
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <alex@amutable.com>)
 id 6af6e276-195a-0a2a45060019-d1558032d11c-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 11:12:06 +0100
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4a214c5c4c0so10660835e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 02:12:06 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com.
 [80.187.86.54]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb4e2842e6sm142085915e9.4.2026.11.13.02.12.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 02:12:05 -0800 (PST)
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
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564726; x=1795169526; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=C9TZKYRayQVC7UyXoancZRI4bPIYIHY06/n7s/4tB9k=;
        b=Hje2XmHF+RBk/S2K2WxR9YtH9Y9THGD6fjPI1+0kagja3X+R8eGc7jn+5VYM+Lihpo
         aDTjwtb6FSRlBArdOirJP4OPAf8fJ7mcd8rN3qJQawqHvOTxhQVBB5Rmbfsy3xDSPPQH
         FuY1/IN+XNYNMsLoxqlblxQxqNHqjGL01KqUyOnmZxIYusvstIQIOMYEZIpT2bnKFokw
         cCYjxSL2zoOMgVxhAwODVji0QluCUSNFn/Epg3K9EyHMUwyCAAyDO/6ZuDLuijk/CtaP
         TCqOOl8lDJ8iJbN0j4vOZVVG42AopoatnRbj0f3cfgMDh9SPaORwSvo/AIAn6aVSKFE/
         3iYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564726; x=1795169526;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C9TZKYRayQVC7UyXoancZRI4bPIYIHY06/n7s/4tB9k=;
        b=qNhnVod8FUeX/YinLKU3R7zQPINBhl39DsBsHWaJtn2Z4dylv96Ag1sjkgzmFrk90N
         vfkIKfrNJIqGAEelBrM7pwp8bvglf8iasRyYnU7XNUT35ieU7WpQAeCpoxiUB6RD3k4b
         IMz2/d2uBNOaR5WpIHY5s7yCdTed7zD0gA95RmS3tJgqrhscvPNglZ6sP+c00rqezA92
         sc+axXsgTrtVTt5i6zLlW1+/AhpthVeGaYsJ3fsqpxwAT6iFs9CTbpZbbscnnjVPPGfz
         nv0FZP+7NutH2LdCSXd6MgwBzKVUu5PY/r2oT8rAV9hPMWWxktGUq+I/q7exAZBFfZzU
         +H8Q==
X-Forwarded-Encrypted: i=1; AL+hErEmLXYEX6fgVrjXIYtpIBFLf1SSIxNew29+nDgffqQhqdoPzyKtuk9iYmplKAe514V9epVHF5J4FME=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8cv90Qa8WiF4wHPXYcKKrE0IDSlZfr0rfhvMjaut5JVYyYMOoR
	USAfslZ364wRZL2kw3bVBfhKlTkgxHbeZh58Iu3AHQizlDr2t4aOm0KLSod6stHP0mww
X-Gm-Gg: AYBFou2CmT/YmNV+wuSnYXBJYgqK7cSQtEsYpNIr77LsLXDujUlZ9SHJofw0/avdcvI
	1c5Yy6tj6Y3+Oog3CiGv2Sbyg3ox436f4VfQQU5PVYAuhWw3OwLu9XPaAFqP1KHdgjyTp6s9yjv
	aoAMtp64dH/edVpncc5Yu9ffEHetpAblD0qFiuttP/3OJwiEtbb/FZcY/emE7d81H43rabk+49K
	mxMmKkrjPWgjebfqdIEZzby9g1vYs/8JXCaeyJnMqCYE8LGf8wiuCsvN4XNwHrD1yo69C3uce6o
	ZjiqlokLv2OiN1rNfx2u15rYwv+BK+uYa9mQHGdgny4ww9cipJNjwFqfSv+E+eLYsF7cKm+K4vi
	Tc9PRdS9E9itONYdOq3osIDC7LpacHgv2CHoBe1W+00onWNhgA9zKylgRkBTkQq1OH+55z5yYlc
	lJpQQBE4oW4EpVh7IY+N99bKb2zuxsoiL2Kq2evUiFoAqJ1CoHmeUG0chrt3SM5njmI8n7TSNqo
	hA83EP4RQlP3fEgqyb0V+epNk4nEfkpeAyNJbJ/wzPD5Eztdixp1tvsRm9j+FZD07bLUyhWQ4YH
	KOyg5F6A6bcT/x49jTPkCSlOWepWo9f9U02ew3zaO0mb/8D3SDb8QzS6rhpyBGxYODgKPTJDbYR
	wHV9nKl9Y
X-Received: by 2002:a05:600c:c4a3:b0:4a1:6992:f861 with SMTP id 5b1f17b1804b1-4bb55a02932mr40317635e9.1.1794564726124;
        Fri, 13 Nov 2026 02:12:06 -0800 (PST)
Message-ID: <82d691d2db7579d9630bf89f73132e36124bf74e.camel@amutable.com>
Subject: Re: [PATCH RFC 19/41] smack: use fc_init_pseudo() for smackfs
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
Date: Fri, 13 Nov 2026 11:12:03 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-19-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-19-4c998976c6c7@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-purgate-ID: tlsNG-16d1c6/1794564726-F500977B-E35A4196/0/0
X-purgate-type: clean
X-purgate-size: 1153
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 2026-11-10 at 10:14 +0100, Christian Brauner wrote:
> Initialize smackfs as a pseudo filesystem. This raises SB_I_PSEUDO
> and
> also SB_I_NOEXEC and SB_I_NODEV. smackfs never holds executables or
> device nodes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0security/smack/smackfs.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/security/smack/smackfs.c b/security/smack/smackfs.c
> index a72bc7fabea9..4a56bbeaeca3 100644
> --- a/security/smack/smackfs.c
> +++ b/security/smack/smackfs.c
> @@ -25,6 +25,7 @@
> =C2=A0#include <linux/magic.h>
> =C2=A0#include <linux/mount.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include "smack.h"
> =C2=A0
> =C2=A0#define BEBITS	(sizeof(__be32) * 8)
> @@ -2880,6 +2881,7 @@ static const struct fs_context_operations
> smk_context_ops =3D {
> =C2=A0 */
> =C2=A0static int smk_init_fs_context(struct fs_context *fc)
> =C2=A0{
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &smk_context_ops;
> =C2=A0	return 0;
> =C2=A0}

