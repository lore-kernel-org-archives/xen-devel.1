Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975CD606A8AC
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 08:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=tQZw6uRD
Received: from list by lists.xenproject.org with outflank-mailman.1492007.1692691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTEc6-0004zc-Ak; Tue, 17 Nov 2026 08:32:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1492007.1692691; Tue, 17 Nov 2026 08:32:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTEc6-0004zV-7B; Tue, 17 Nov 2026 08:32:26 +0000
Received: by outflank-mailman (input) for mailman id 1492007;
 Tue, 17 Nov 2026 08:32:24 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <alex@amutable.com>) id 1xTEc4-0004zP-MU
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 08:32:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTEc3-00Drf9-Vb
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 09:32:23 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <alex@amutable.com>)
 id 6afc1112-2eae-0a2a0a5409dd-0a2a4509e52c-14
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 09:32:23 +0100
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <alex@amutable.com>)
 id 6afc1117-be1a-0a2a45090019-d155dd31c157-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 09:32:23 +0100
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-49412eb1474so2235573f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 00:32:23 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:de4c:6789:33ce:97c2?
 (p200300cf572c2800de4c678933ce97c2.dip0.t-ipconnect.de.
 [2003:cf:572c:2800:de4c:6789:33ce:97c2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c608d10b2sm43646659f8f.44.2026.11.17.00.32.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2026 00:32:22 -0800 (PST)
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
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794904343; x=1795509143; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iGZ2JImQ8AaSp09QdDpLN1PoylGc+Kk+7WphF44IQ4E=;
        b=tQZw6uRDPY6CnwjJwK7X8wq30awnK68OX5SB2CI8XJLFprMWgTWyvcy2FR67QHKNk4
         Ql3MZJxQietzmOa+W85r3Dqe7ByFIAIQFvzfT5TYkVXqg6p7iBHR2gql4MG7ZL2lwtMK
         /5CHup51M4IxaJZnEbx2uNOgk7Pk0MGNtR6wWRoo6E5E8/CXUL5jaLC0nlnIb3MUTI6A
         qSgsshGylnQnaAvRfxgCGTo0afxGh5p4DKmxnpx9/dpaik8mGsPPKmpd6ZVUK6RGMOBk
         dxpxCW6jNSgONK2ZRbSO92kvk3ES5bgrn210s+KJP62Nlgjf6HpAxt6vGzrahDoc98+S
         PQuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904343; x=1795509143;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iGZ2JImQ8AaSp09QdDpLN1PoylGc+Kk+7WphF44IQ4E=;
        b=vevGD+utEAZYpZ6iJDsJONlzbByvnObA0no6br/4eB2MBlIgDLjrvx98nkcnQHrnsw
         fmzkn356VKMwNp3CrmMliuubHLPs2Kx6i+NSEKYrywzchNEVuChNzKDnsXuBMaMQXXxt
         3SIEzAeHY/mKfCLwoVYUUA69gOpUpaY5JrQtEgC7gvNrO7dfwUDjIGQXBkkmU50QeVdZ
         ThgTL91/jUqfIbu4Pt50h1o7weHKL4iAYfqrXxVX0OOnBUATvFbiA8mAp7+xFSdbnwrz
         RHMqMql2o0JZhIFOZ9+0xT2OS8RCy4eXp6zvVuiRHihtZTFEhcBjK/btR61SWqbYTC93
         yoCQ==
X-Forwarded-Encrypted: i=1; AL+hErGPoD/UR6J0akEdX5xgS0JEYa2f9k/c5i/84tHE/ZiCJwhgI6KgJbBGJYDkjpDaEMP1TNeuxin5PtU=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8HR8vaSKf1v/GF1myNvr+RMts3HTZy8rdxDrlxg5eHW4ahMx04
	OVlrxxka7nbkXyQ57Opdt6NAJCdWxRY4N+WDsJtBvsZPRrVaGxZXrn9Pp0fpN+U51g8v
X-Gm-Gg: AZFdTZf+VPK4LqVQV6P1UCg37HWXMortAtEHwJRRSxmigSthL5r0RoeZoNboLE58gBp
	D8vdtORLfc2dnJAR3gnCtb49KW6xsSpT0xcWPc0F626xLKGdRVQ7B9vvTPvakeFoa8TQUnDqOTj
	niHCi08hV3vZ7TXSM7SDndPq0W/MVCFkfFwSKlOJoSCrx/XhhluwWWuaqrwz00Ani8eT+/xbQg4
	lEt6ArWsk2K82F4Q0yRC6veeR/7P6KXkop0SxFT7O3FyrNHJScDwQRUolZZKnklV/KBmqgetpnM
	+DxQRsuSfMisIHsMZ3sWTwSvkCGv8V8cNaCgd5ZARwSRD5e05BLRDUKabWcHoaBaPeNLgBT/+MC
	E4UoFHKy+RwPIMjt97XvOe8OL15zZkiYFyRBHsK/IWnwCfktmh1Bh/vMFZSlF1KGXzg0HffZYJQ
	HtP5WduIa9kPA9HsVq1b9CDGq3Z3aWqBv3lLRXtdU0Y/WsvOmnq1JOIuRqygTEVgss0GxZ2d4yk
	2Mf5zCRkYQneOf4X48/bKZRjGH9v0dnZu9ODynb54pBn7nVQQST/glgx1MXoj0YrPs8id+QZYRM
	y0Ha0sPVWxHOHKs4uyOY46JAykgBeoe2IfiaxjUf2JOZVngrkUIXzHgvoMDt+KVh/R7aXKuG+yd
	BzdwM4SU7OL/2OPT81RpaSuaqOjV6psWiDCXU4i0gIeexJfKq+aO5Z1AC
X-Received: by 2002:a05:6000:3108:b0:48d:f9dd:e3de with SMTP id ffacd0b85a97d-49c7353c415mr27089117f8f.45.1794904343236;
        Tue, 17 Nov 2026 00:32:23 -0800 (PST)
Message-ID: <fd39200976086130cc82d59699a988fc3e0689cf.camel@amutable.com>
Subject: Re: [PATCH RFC v3 27/44] openpromfs: use fc_init_pseudo()
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
Date: Tue, 17 Nov 2026 09:32:20 +0100
In-Reply-To: <20261116-work-loop-pseudo-v3-27-8cbbea1cf34f@kernel.org>
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org>
	 <20261116-work-loop-pseudo-v3-27-8cbbea1cf34f@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-purgate-ID: tlsNG-bad1c0/1794904343-BD8C1034-ECABD6C1/0/0
X-purgate-type: clean
X-purgate-size: 1183
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 2026-11-16 at 12:05 +0100, Christian Brauner wrote:
> Initialize openpromfs as a pseudo filesystem. This raises SB_I_PSEUDO
> and
> also SB_I_NOEXEC and SB_I_NODEV. openpromfs never holds executables
> or
> device nodes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0fs/openpromfs/inode.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/fs/openpromfs/inode.c b/fs/openpromfs/inode.c
> index fb8d84bdedfb2..6cd02d456bac9 100644
> --- a/fs/openpromfs/inode.c
> +++ b/fs/openpromfs/inode.c
> @@ -10,6 +10,7 @@
> =C2=A0#include <linux/string.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/init.h>
> =C2=A0#include <linux/slab.h>
> =C2=A0#include <linux/seq_file.h>
> @@ -419,6 +420,7 @@ static const struct fs_context_operations
> openpromfs_context_ops =3D {
> =C2=A0
> =C2=A0static int openpromfs_init_fs_context(struct fs_context *fc)
> =C2=A0{
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &openpromfs_context_ops;
> =C2=A0	return 0;
> =C2=A0}

