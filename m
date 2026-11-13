Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18C3606A32D
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 10:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=NoG9X0/G
Received: from list by lists.xenproject.org with outflank-mailman.1486993.1689539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRoGg-0006l8-K3; Fri, 13 Nov 2026 10:12:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1486993.1689539; Fri, 13 Nov 2026 10:12:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRoGf-0006fK-Ur; Fri, 13 Nov 2026 10:12:25 +0000
Received: by outflank-mailman (input) for mailman id 1486993;
 Fri, 13 Nov 2026 10:10:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <alex@amutable.com>) id 1xRoFF-0004nl-0E
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 10:10:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRoFE-00GpTZ-6e
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 11:10:56 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <alex@amutable.com>)
 id 6af6e21a-8faa-0a2a0a5109dd-0a2a4504c076-46
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 11:10:56 +0100
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <alex@amutable.com>)
 id 6af6e22f-b57f-0a2a45040019-d155dd32a558-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 11:10:56 +0100
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-490d59c3edaso395267f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 02:10:56 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com.
 [80.187.86.54]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5a32d336sm4988050f8f.0.2026.11.13.02.10.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 02:10:55 -0800 (PST)
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
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564655; x=1795169455; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RUn5HyOzv5zK74OCIfLVACQcizuS/sHn5qpIQd0Zvv8=;
        b=NoG9X0/GOEIIvqDBaQFaS47gNW7gyuFA0Oai2so19VCfn92Fldw1UinKFMASkQzPtX
         FFNLjNnXymWlK/VAJ9iohpXCZgk+tQalZy7HO3LWGVUYpJEULjl+HvnnoYRssoctVd9+
         TetP+LZvWGcyrgzVJEE2Ig8MAJaJeUJOu1+VVJRjiA62GL35VSNGxdGBCuoElOn4Gbeo
         oFlBP0JqYKRA+5wTTVCRTYRV/QmQQcmf2TFpFnu5lytlpJdbJNFFteUTKCzBBeY7MXBy
         JyV3PYId5rRQebnL8blxO9YrGalmCkCaobevlIaxhnzIBs/+ileF8I9yav/RPpF8AZz6
         wdBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564655; x=1795169455;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RUn5HyOzv5zK74OCIfLVACQcizuS/sHn5qpIQd0Zvv8=;
        b=FyP/tWmaZWNoj/6lfTg/fMWrrLCFVp3K7A1LfWdQ4iUIbrCVZdXljYc2VjOJW16QMj
         dmJNR4ovYsxRytNwE7t6E1rHhtQM2Hzt/3Il57G30QUQ4PWSWsnytNHM8+0Qxb1SYKzM
         AFn/gKnOwNal/EJhbbsfG3YJf51C6ohxG1+bP3KQnTe/JdInOrpVmx+YsIjdFvSeJrtK
         zMZHwHtlOthpnjpR3kAwJ9nkXPtGPr6NZrS+Godrf00+2ZQiLGO58lCTiM0Om00PaGyY
         YFxpL7V8I5IVaQMfhf7mu93/Aek7xAgLqLz7EG8H0t+fJ/GPIEb4oFjP55kcmJqOFNjV
         i2Sw==
X-Forwarded-Encrypted: i=1; AL+hErEFHyIWA7zAZGqGwsB0prjqdYBx6V4OOcM7XXgOu4LeqYlMEtmNuj9CS1v/LVJgjyIkNrHgFLzHTTY=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9wKN13wAEGc0mQJ+KWFUmv2nyl1O+r/2GFFWK4efQD6V1ZkgSy
	7oLkyyIE7dlfWq01ziPcJvHu9GllXvd8N2aRWiTEsodZp20UNL1B44Hq32oKcpWTWue3
X-Gm-Gg: AYBFou1/MSfaiINGr3Zi0BM1K+JplMSNBNTFQchBySCmOphnib1Ttq+bLrpdIiCOQeY
	2BcGOw0N93EIy9kOgMxsBZabHc/pUbvNoE9knLSJq+59D8MyAIv+CK/l2JkKjvmn5B0m1sIk4Dv
	ojQhoeCFx/9lBquS28a/MIdFsvopIpE+b7Mb+Ezw83gfpQKSU6C+kmg6CV8/l8Wv1o648Nh+ik2
	0cQR/AUlU18TYb1ih08JJnIMiL1QpGGzGw3kexCyIU2yPHlRYHtsQ8xFHkZU4Ki6oerf5WKHdGt
	IRykTjTNESnmK15QmKf/rfH9zRVgJ2eE6E8ZulBX7VVsclj8YaSWBfSQw+Mv7DFhNF7mYwyVGGB
	1mUMIRDCjvjSH4dpunR7fx2t2KKZ9aDuSZciEeAee6+LdnNA3GAUvxMDKMx9acUD9Q0ephbMjR9
	ifK4z8xHkH24thNFUhc2WKWVqNLdQTdzeA49tJX6hDZVJXGLKGA88/mKSa8toHXGXtZLy20kguq
	h/3IYqchc/QY3ZrmI5zE23C8g9wLRmM52QMDDhbZWMy3RxC8CHFkfYbLAIM8g197z3S+NJXkWyP
	BaA+gGgwJCWSfgATulHTXA+d0L5p+XA1kaIiOssHMsSReGj5/fmtIlNcUg4/wMc=
X-Received: by 2002:a05:6000:470e:b0:499:ffd4:f519 with SMTP id ffacd0b85a97d-49b02d4c2cfmr11662822f8f.23.1794564655454;
        Fri, 13 Nov 2026 02:10:55 -0800 (PST)
Message-ID: <0894c601b3f3c5b92008c6c399faaa539b658307.camel@amutable.com>
Subject: Re: [PATCH RFC 17/41] securityfs: use fc_init_pseudo()
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
Date: Fri, 13 Nov 2026 11:10:52 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-17-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-17-4c998976c6c7@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-purgate-ID: tlsNG-ebf023/1794564656-526CAB50-1CFF0CBE/0/0
X-purgate-type: clean
X-purgate-size: 1295
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 2026-11-10 at 10:14 +0100, Christian Brauner wrote:
> Initialize securityfs as a pseudo filesystem. This raises SB_I_PSEUDO
> and
> also SB_I_NOEXEC and SB_I_NODEV. securityfs never holds executables
> or
> device nodes.
>=20
> AppArmor puts a .null device node into securityfs but only ever opens
> it via dentry_open() which doesn't care about SB_I_NODEV.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0security/inode.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/security/inode.c b/security/inode.c
> index 080402367674..93997a9f16fc 100644
> --- a/security/inode.c
> +++ b/security/inode.c
> @@ -14,6 +14,7 @@
> =C2=A0#include <linux/kobject.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/mount.h>
> =C2=A0#include <linux/pagemap.h>
> =C2=A0#include <linux/init.h>
> @@ -64,6 +65,7 @@ static const struct fs_context_operations
> securityfs_context_ops =3D {
> =C2=A0
> =C2=A0static int securityfs_init_fs_context(struct fs_context *fc)
> =C2=A0{
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &securityfs_context_ops;
> =C2=A0	return 0;
> =C2=A0}

