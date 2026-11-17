Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6E6606A8AA
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 08:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=aop+JFZK
Received: from list by lists.xenproject.org with outflank-mailman.1492017.1692700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTEel-0005Yb-MZ; Tue, 17 Nov 2026 08:35:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1492017.1692700; Tue, 17 Nov 2026 08:35:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTEel-0005YT-JU; Tue, 17 Nov 2026 08:35:11 +0000
Received: by outflank-mailman (input) for mailman id 1492017;
 Tue, 17 Nov 2026 08:35:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <alex@amutable.com>) id 1xTEel-0005YN-A6
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 08:35:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTEek-00AnJy-MP
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 09:35:10 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <alex@amutable.com>)
 id 6afc11ad-2eae-0a2a0a5409dd-0a2a450aa4a6-38
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 09:35:10 +0100
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <alex@amutable.com>)
 id 6afc11be-f2d2-0a2a450a0019-d155dd2ec8f8-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 09:35:10 +0100
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-490c3ae81d3so2440151f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 00:35:10 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:de4c:6789:33ce:97c2?
 (p200300cf572c2800de4c678933ce97c2.dip0.t-ipconnect.de.
 [2003:cf:572c:2800:de4c:6789:33ce:97c2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c603f4e2esm26338505f8f.36.2026.11.17.00.35.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2026 00:35:09 -0800 (PST)
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
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794904510; x=1795509310; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+cVfVc99Mj9JzDjRqkRlx7bbwk4z1TaP6S9xba6j1G0=;
        b=aop+JFZK//E1i1dshEy9GCrOirNbvbr0L7YVPzLv920ZU9nnLvpF9at2JG5belFbyW
         i+thA0xfnWbaaVUiX997Dborod4jQnE6um9bd88JAzqPzDoXe5PfKe4lG+PsZvm/RXeK
         ToBz0T6lzhNBaSebRJqo7LqN44hhKnhvJlpe/ZhcIhnVKdVpZmeGmN+UDwFILw4K7KMF
         SLYKkgjdsgw/DiTCQdPxz3OrhpCLUjg5XRVkuxDWY5R7cDQbiN+xJFChotnvhzkVtDaw
         bCqa4yRM2Xhr7tLNPHgVw2LkGVH29E0M2ud4BEp/PQxvqqm1V/9yQW7use+JqwzhSJrB
         JT8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904510; x=1795509310;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+cVfVc99Mj9JzDjRqkRlx7bbwk4z1TaP6S9xba6j1G0=;
        b=Ol3NmlFI/Y3bOXGnis2jZcCWIkmmBur3jp8miU5qfYgI1RzhE/CnswrVOyqi2CknZl
         N1/cwNOLnRZlmSQmAH1LShRb8okBE501YAGuqqnpU/RlIpWs7aoC5goeNTPK1Q/LADv0
         caq7/6WQeFi/1CIk4tEx0ioh+ow9NLYwJJogwpKmME8JmYc8Wd4GQbIli32OpR0kNk0R
         Qq0ySaOh0UxVY5hJ02D6at6VG+hNnGSK+C+UEtqxZVESc4BgpnSajdw2GeSyn3guHcSV
         bWr/ERk5QlvtvXL/2b5nVoTg5oW3wHku05iJYpUvv6P5RTC8Ex86L7cvfALHlzEsZkQ6
         jZUQ==
X-Forwarded-Encrypted: i=1; AL+hErEwReP1uRy51zOqagTtRrvOBUucSX+4MOl4fMJCBcPxsVZwUqC8MHyieFNk1T2OZasGaLpmDTkPerA=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/bNkYO68akJVa2UwNB479Qg8rGsoIhg2F6PV61xR2iNMCX0U7n
	OhuLeF9QqSKlyrFrdg/cFworzN/0DaKdziKykiWiyFIxCkuF8T4wfoOyssb+IYDRnakK
X-Gm-Gg: AZFdTZewhI0SGDKxsz9Yehrkt+bSmm6qfZcpf3lapZ0MFTmrhjeGFTCJXMSGrTY3iT4
	Lv0yXfGILZTC1n45G3nllEPhSp8MYEZpcOAG1iDBponpXAImONGZo9tNXUBmN87uKPbY7hTt2a8
	gc9bn357v8fdSi/17vJhFLl51iyADMsFWtJjtChCUmztJ+dG/iXwUlDVImFE34MoRbU8e1UVJ8G
	SxLD+mhqlLBfoCedP+T0EpVou7mJtmvvWHLtIedv8K9tlbTOt9h8nsY7HbEoq9ZOnbM3KmQmWSd
	C28IAn1NjlBVDy5KCRd4mIa03pN6UiOptCc3kDAc/D5liHh8cvptGNmfAEyemuH0p1xZkaneCjU
	BucRGF2pWecbb1CmS12VHhqyKqlHKznwoJ5Zc4sV2MH2LnkqinvAvgKjtbFOi9Q9Rp50DinZQjN
	2i62/KHyXxEXsj2uzhoBQqY7FFKBzKJOT2ww4ZZen7xQk65HsHSSBHUx2QsHeZApYbZuTKox6yp
	CoZmneVbKUZdsbDkT4UeACcuGMvqmR3tomEYAgYYqG47kf48SwDwebaheQh7ZrHgQoT7oJA3vi5
	kxfRL4EYepm+aRVNi9KzCwFpQejtUEOplp3dDZ3FYU/lkOE5CVK3YDYEybxdOMyMlsaUc0Neaj4
	JWkrwsGLXfxG+ub3fhiXC2Oz8HUTOK0xKeFAkyggAh8R85FGzHJWjFm9F
X-Received: by 2002:adf:e193:0:b0:48c:7306:18e9 with SMTP id ffacd0b85a97d-49c728c6e6amr26569239f8f.43.1794904509932;
        Tue, 17 Nov 2026 00:35:09 -0800 (PST)
Message-ID: <b0ec2cd8f9b7a6a2e4a54c6df2fa897bce068cbd.camel@amutable.com>
Subject: Re: [PATCH RFC v3 28/44] ocfs2: use fc_init_pseudo() for dlmfs
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
 linux-kselftest@vger.kernel.org, Chris Down	 <chris@chrisdown.name>
Date: Tue, 17 Nov 2026 09:35:07 +0100
In-Reply-To: <20261116-work-loop-pseudo-v3-28-8cbbea1cf34f@kernel.org>
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org>
	 <20261116-work-loop-pseudo-v3-28-8cbbea1cf34f@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-purgate-ID: tlsNG-4011c0/1794904510-526DECFC-1AC25C1A/0/0
X-purgate-type: clean
X-purgate-size: 1246
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 2026-11-16 at 12:05 +0100, Christian Brauner wrote:
> Initialize dlmfs as a pseudo filesystem. This raises SB_I_PSEUDO and
> also SB_I_NOEXEC and SB_I_NODEV. dlmfs never holds executables or
> device nodes.
>=20
> Reviewed-by: Jan Kara <jack@suse.cz>
> Reviewed-by: Chris Down <chris@chrisdown.name>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
> =C2=A0fs/ocfs2/dlmfs/dlmfs.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/fs/ocfs2/dlmfs/dlmfs.c b/fs/ocfs2/dlmfs/dlmfs.c
> index d3bfcada3e3bf..1789ec96dc130 100644
> --- a/fs/ocfs2/dlmfs/dlmfs.c
> +++ b/fs/ocfs2/dlmfs/dlmfs.c
> @@ -21,6 +21,7 @@
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/pagemap.h>
> =C2=A0#include <linux/types.h>
> =C2=A0#include <linux/slab.h>
> @@ -563,6 +564,7 @@ static const struct fs_context_operations
> dlmfs_context_ops =3D {
> =C2=A0
> =C2=A0static int dlmfs_init_fs_context(struct fs_context *fc)
> =C2=A0{
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &dlmfs_context_ops;
> =C2=A0
> =C2=A0	return 0;

