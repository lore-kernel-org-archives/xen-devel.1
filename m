Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74581606A32D
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 10:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=MfK5QT1U
Received: from list by lists.xenproject.org with outflank-mailman.1486999.1689549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRoGh-0006s8-CD; Fri, 13 Nov 2026 10:12:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1486999.1689549; Fri, 13 Nov 2026 10:12:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRoGg-0006pR-HR; Fri, 13 Nov 2026 10:12:26 +0000
Received: by outflank-mailman (input) for mailman id 1486999;
 Fri, 13 Nov 2026 10:11:44 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <alex@amutable.com>) id 1xRoG0-00056s-AN
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 10:11:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRoFz-005xRg-ND
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 11:11:43 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <alex@amutable.com>)
 id 6af6e23c-bab6-0a2a0a5309dd-0a2a45018670-38
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 11:11:43 +0100
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <alex@amutable.com>)
 id 6af6e25f-5984-0a2a45010019-d155dd35e9ce-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 11:11:43 +0100
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-492fcbfaa88so323601f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 02:11:43 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com.
 [80.187.86.54]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c1797sm4931434f8f.11.2026.11.13.02.11.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 02:11:42 -0800 (PST)
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
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564703; x=1795169503; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gXMsjTg9KyNTuX1cuQ9yr2iJq2/VClhNCtHhh+FL0ZU=;
        b=MfK5QT1U0Zwra6VqKCibvA2S7O27d4GUtx1cjdW0jU5vDa1gGZ/wYU41D3gNsPYg6P
         STHbBE8E5/+tr51iMwAAhRfNR4bhFD3UP7bRjh7RSiOI8dCsWBIIFWCx5YWrhg3wlsS8
         q+ftTQJuHDvv3Ga7fNsuiWRZw4ou3fMzP2TN4E10xrERzY3dM+JD1I6jGr6AKzJfl1XG
         6bV/v6H2I0b1GdXYeQ5p6HV+NRDgC1jJwfRKyw0OHdn+0Ky6x9AWSrKKeYfF1/9acgxF
         c5sLtVckiley067Zgr8uI6xCvNCKFRjHkEKTOMuV8i/tsD9RZnr1EqtxFAKxTb0feJtV
         NwxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564703; x=1795169503;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gXMsjTg9KyNTuX1cuQ9yr2iJq2/VClhNCtHhh+FL0ZU=;
        b=HTYi/9H+RVlGNfam7Zzwf9o817M1TVoytC3r+ZS4E+bVyJ/AmgQAz6n7B9vSnE0842
         wrTdOHLPpJmFgyoTBqH1FAuKzWYSbjRdWmLWZe5FMLqxl0PsoaExvaSBa3dd0dXApjQz
         gOOdzspw3V+7TJ+sPgFqVu86x2HAUlMigBWEpw0Wr5oRWgpvrHTJWPoj6uTutIpfu0H0
         yowsfQLufgoGyYItUCNZpiEUs49WX2mDYnCkfIHhOajlU8LgRKFC2S9Q1rxXFHJWXxUx
         3BVYw6TgP5lQT9Yr/VpL+3iuWrUBMpSSMzCwYLBkbWew2HUl6RU1xQCuRVdr4QxgCALe
         Q98w==
X-Forwarded-Encrypted: i=1; AL+hErFIWwMuHOd1JRPn8bVQzc5hh9lf0+krTVyrP8OcSntdhJEirsMU0J0KBvUuXazXfa4qx/a1Mg1s3u8=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/lskcpSXncVNeWVuNtgtsAgle2UpWGnKbmxQJJgUzs4vXWr8Fn
	OA2rnE+GJk/mFsOpR6PWrT4jNadGYBql4nmtTBlsCcAfc6cvlpcWwj4CZgh5+ZkJXBZI
X-Gm-Gg: AYBFou3l8rO8NxfAnCvsi5TZjXosI58fAxf4eEgFonWMgtlWHlChUfJPtArZH1xJf05
	ePcEr5jPuzrD0mkFHL6DdiDl5B3eaxxviszzvfdi7I0W8Tt1x/GKFdgR9j5OcUGd/A6WknVXinN
	kvmFjHqi8dvhVXLiVRC5aB/nTuOhoofmZXQS6J3ZMsEtby0ATyyEnlz0qUvEUe2195xcerP43Hr
	SzOEkM88BsZWzojRkCJ1ehIGVROzGaT7aL0iSmHp6Rngo6hNNONsRjfl3FFnzc+bHX5i04Lo4Nv
	Xg59dNGUObn4GotyE8zkXhssKQk+v39S/nM2Spg5+3lu9XwLVI1SJF1kCDHPsxEYlP4epa6AxYw
	rUyjPx2V8ZEDPRcZpoulTm0nuCyNeIcrQYwB9tBp4GH+w3LVyyDcpxHkIyfNw5FytqX9d12iapk
	gaoiBHNHreCYl9q0beC29vM1LMkOsxFAVCq7qzK/SUwg3m7YEX9EQqLUky/vpHQRRxNevLjSjBv
	AkaK5ICL2Pv/j/+sZPk4DULpAAZjz0k51mH+0Qm9PeCxZvelaDd1nsrRuuIMpiQJnKxE/c0cOm7
	jICFnSacyuQQIxr2FTw5N0uQfQUaHa5MzMsqjdTfEfqIwvA/JqrSGf2Maur4VGY=
X-Received: by 2002:a05:6000:2501:b0:488:88ec:59c3 with SMTP id ffacd0b85a97d-49c73259cc3mr5012611f8f.14.1794564703010;
        Fri, 13 Nov 2026 02:11:43 -0800 (PST)
Message-ID: <ff6d2a8c8623f5476d5c352dac1ad98ab3da303c.camel@amutable.com>
Subject: Re: [PATCH RFC 18/41] selinux: use fc_init_pseudo() for selinuxfs
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
Date: Fri, 13 Nov 2026 11:11:40 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-18-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-18-4c998976c6c7@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-purgate-ID: tlsNG-d62444/1794564703-C5146757-F509A373/0/0
X-purgate-type: clean
X-purgate-size: 1970
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 2026-11-10 at 10:14 +0100, Christian Brauner wrote:
> Initialize selinuxfs as a pseudo filesystem. This raises SB_I_PSEUDO
> and
> SB_I_NOEXEC. selinuxfs never holds executables. SB_I_NOEXEC also
> refuses PROT_EXEC mappings but the status and policy files are only
> ever mapped for reading.
>=20
> But selinuxfs needs device nodes. The kernel replaces file
> descriptors
> with /sys/fs/selinux/null on exec via dentry_open() which doesn't
> care
> about SB_I_NODEV. Android init however opens /sys/fs/selinux/null by
> path as /dev/null doesn't exist yet at that point. So clear
> SB_I_NODEV
> again in sel_fill_super().
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>
   I.=20
> ---
> =C2=A0security/selinux/selinuxfs.c | 5 +++++
> =C2=A01 file changed, 5 insertions(+)
>=20
> diff --git a/security/selinux/selinuxfs.c
> b/security/selinux/selinuxfs.c
> index 310e19efff1d..d7ae853b6d68 100644
> --- a/security/selinux/selinuxfs.c
> +++ b/security/selinux/selinuxfs.c
> @@ -18,6 +18,7 @@
> =C2=A0#include <linux/vmalloc.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/hex.h>
> =C2=A0#include <linux/mount.h>
> =C2=A0#include <linux/mutex.h>
> @@ -1852,6 +1853,9 @@ static int sel_fill_super(struct super_block
> *sb, struct fs_context *fc)
> =C2=A0 /* last one */ {"", NULL, 0}
> =C2=A0 };
> =C2=A0
> + /* Android init opens the null device below by path. */
> + sb->s_iflags &=3D ~SB_I_NODEV;
> +
> =C2=A0 ret =3D selinux_fs_info_create(sb);
> =C2=A0 if (ret)
> =C2=A0 goto err;
> @@ -1955,6 +1959,7 @@ static const struct fs_context_operations
> sel_context_ops =3D {
> =C2=A0
> =C2=A0static int sel_init_fs_context(struct fs_context *fc)
> =C2=A0{
> + fc_init_pseudo(fc);
> =C2=A0 fc->ops =3D &sel_context_ops;
> =C2=A0 return 0;
> =C2=A0}

