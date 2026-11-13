Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41651606A33E
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 10:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=WBseci3h
Received: from list by lists.xenproject.org with outflank-mailman.1486977.1689493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRoGd-0005lB-3w; Fri, 13 Nov 2026 10:12:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1486977.1689493; Fri, 13 Nov 2026 10:12:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRoGc-0005kC-Pw; Fri, 13 Nov 2026 10:12:22 +0000
Received: by outflank-mailman (input) for mailman id 1486977;
 Fri, 13 Nov 2026 10:03:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <alex@amutable.com>) id 1xRo8E-0003PE-B8
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 10:03:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRo8D-006h3i-O8
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 11:03:41 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <alex@amutable.com>)
 id 6af6e071-e002-0a2a0a5209dd-0a2a4505c888-22
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 11:03:41 +0100
Received: from [209.85.218.52] (helo=mail-ej1-f52.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <alex@amutable.com>)
 id 6af6e07d-4cb1-0a2a45050019-d155da34a97e-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 11:03:41 +0100
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-c169ae1cb26so172962266b.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 02:03:41 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com.
 [80.187.86.54]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c5095b23b3asm74752966b.27.2026.11.13.02.03.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 02:03:40 -0800 (PST)
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
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564221; x=1795169021; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6cN8hpP/bnwcYzPsZf0cUkd2pk5Vve+UdRh8Jmnig90=;
        b=WBseci3hRln3okssnQcDeL+8tlk82mTXh1fQWBUOZ4l4DZpTmg6cNabXZYvGvEjoj5
         bFTVtYFki4yis+j79p0FyrzQP3RIPYhl8Eil+r7XLIF9SAiJOhzLF6lOLTUSp689ANXY
         ihM8vNDvwDWHhGLUSa4AwtxNxjpICfnOFw4aK2dpEja9PePwn9zbf6IrM7imc5q9oSJl
         N06lZ6qer6hcklWwK4vLVJik8iA80vzLGuF9y6UxPFyyXbgFbBQ6ZwnVrghyWWo8yeP+
         huD4Qr9JS0228kBjy1/N8BSu/N5mZ2sDQr+w+ayti6+lEVfvkqPivH5Btv5kHTu5dhgJ
         WLSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564221; x=1795169021;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6cN8hpP/bnwcYzPsZf0cUkd2pk5Vve+UdRh8Jmnig90=;
        b=pm5HsT22yXbfmjTOwW68GpcwK0IvsEGFXMCi2P8dc0aCtQuW+F5JyVZxQIctccJKnP
         DlGXh5oA3cLfu3/iyAY62aJDMXfyJskEc7BveCnIRiLsgq4DXJS5B7jZ0MsyziavpAlB
         0cFVMPCgJ4n9xJmjwFF5HacEblCZUhgmQoMl3SmWeeRubjqHOgGGRDtiYRUTYclw7ZqR
         euIJnVnsiUCSmc68L9l31xHEdP9/OECkt+QMlCr1/fp2/r8bcYfXTVtfQgiaX2PIKXgD
         w/pzKSrPeomaL1eotxmTls1697xLpRxAyw0l2Aj+XksftzFWINb3Ba2i3YUBTbNEljxt
         q4Sg==
X-Forwarded-Encrypted: i=1; AL+hErFF16wo8D2If4HdE4vSsvUA1WbtzO/lVMmzd459bNzUUxbrTJ3TLFY1dmmIyI8Ndr/wsoK8HUOAn9Y=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8SrYdTOB2Zf+8J84Vz9V6b+WHkW3Bg0l2oQdXqO94WhWzCmf6L
	HhfZWK4viVo9BXVYoN2knTjpktnqtlOT6tn0arW17d2mM3fMHPd5Q7z4R4l0RsoNPbfJ
X-Gm-Gg: AYBFou3pHGioZu6xCa9AVyYWpHrXCVk5KSItXQXV7OfJLzgvAHsSk4d+Ya1LN6BahA1
	igwzzAiH9Kj2lh3EKoWjNejfRTKuvljxWK8bKJ/0FU8kVRh8dLyi3BlB3TPv1VRGXesrZ92w+9o
	3ZDxKvyfYCuTqpnfC4lt2ooo5sspHQhKui0n13/TK3Fk2Sv6/kKoSekjLsyvv41U+OtBEUjw1mv
	IqsX0w3AJgeVNbMFADHhfS7ZRSRA1UYxJSI0St9whG8uLmfi3ZjJ8l/nOckxAkkUR2vAOSgIU4o
	otcIeyEiiUbGQtXhhLMK83XembDsfRQHbRAduwEpAkcu0gQQVIjrf5XqTKwi8jk0KMF/TRakvZu
	v0QJ3eJ1rWRVdg8FqnfGGMaLgCgmRp/TaVywS7QsRrU5ipbUcDHESWjdC87C2k85K+oMGDqQInd
	sop1F0z3GEY+jB92AcA2X3yoOvy9hGb10EHEcnEgioNLARypar6c2/2n03yDnIctfQfmYSCVHja
	s6zglH6lI8uVEt/VOy9KQqLqOlDXCUzkEvX8qVSEtzjiUrOEm5nasoY14HSJ7tu0HwfuigVffge
	5ghTJMkcsuzkmTQI6PAI13KrfnPeT9W+TFJgdVYWK4JBvkf4JYVuFLbU+A8MYxk=
X-Received: by 2002:a17:907:7b8c:b0:c42:bc58:f21 with SMTP id a640c23a62f3a-c50963856f2mr175546966b.15.1794564221164;
        Fri, 13 Nov 2026 02:03:41 -0800 (PST)
Message-ID: <cfcbef5caf7651b63774549fa1999d34981c78a4.camel@amutable.com>
Subject: Re: [PATCH RFC 09/41] bpf: use fc_init_pseudo() for bpffs
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
Date: Fri, 13 Nov 2026 11:03:39 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-9-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-9-4c998976c6c7@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-purgate-ID: tlsNG-c201ff/1794564221-72EB12A1-E15918DF/0/0
X-purgate-type: clean
X-purgate-size: 1513
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 2026-11-10 at 10:14 +0100, Christian Brauner wrote:
> Initialize bpffs as a pseudo filesystem instead of raising
> SB_I_NOEXEC and SB_I_NODEV by hand. This adds SB_I_PSEUDO.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0kernel/bpf/inode.c | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/kernel/bpf/inode.c b/kernel/bpf/inode.c
> index c6f328e4752e..57cf3775c076 100644
> --- a/kernel/bpf/inode.c
> +++ b/kernel/bpf/inode.c
> @@ -15,6 +15,7 @@
> =C2=A0#include <linux/namei.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/fs_parser.h>
> =C2=A0#include <linux/kdev_t.h>
> =C2=A0#include <linux/filter.h>
> @@ -1197,8 +1198,6 @@ static int bpf_fill_super(struct super_block
> *sb, struct fs_context *fc)
> =C2=A0	sb->s_magic =3D BPF_FS_MAGIC;
> =C2=A0	sb->s_op =3D &bpf_super_ops;
> =C2=A0	sb->s_xattr =3D bpf_fs_xattr_handlers;
> -	sb->s_iflags |=3D SB_I_NOEXEC;
> -	sb->s_iflags |=3D SB_I_NODEV;
> =C2=A0	sb->s_time_gran =3D 1;
> =C2=A0
> =C2=A0	inode =3D bpf_get_inode(sb, NULL, S_IFDIR | 0777);
> @@ -1261,6 +1260,7 @@ static int bpf_init_fs_context(struct
> fs_context *fc)
> =C2=A0	opts->delegate_attachs =3D 0;
> =C2=A0
> =C2=A0	fc->s_fs_info =3D opts;
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &bpf_context_ops;
> =C2=A0	return 0;
> =C2=A0}

