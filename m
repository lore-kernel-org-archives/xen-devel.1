Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4179E606A32D
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 10:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=OekOdUSA
Received: from list by lists.xenproject.org with outflank-mailman.1486979.1689501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRoGd-0005th-M6; Fri, 13 Nov 2026 10:12:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1486979.1689501; Fri, 13 Nov 2026 10:12:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRoGd-0005rS-87; Fri, 13 Nov 2026 10:12:23 +0000
Received: by outflank-mailman (input) for mailman id 1486979;
 Fri, 13 Nov 2026 10:03:56 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <alex@amutable.com>) id 1xRo8S-0003Po-J6
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 10:03:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRo8R-002TxT-PC
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 11:03:55 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <alex@amutable.com>)
 id 6af6e07d-bab6-0a2a0a5309dd-0a2a450cea12-36
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 11:03:55 +0100
Received: from [209.85.208.53] (helo=mail-ed1-f53.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <alex@amutable.com>)
 id 6af6e08b-f479-0a2a450c0019-d155d035d086-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 11:03:55 +0100
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-6b56c428212so1145032a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 02:03:55 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com.
 [80.187.86.54]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b7c23611casm766458a12.9.2026.11.13.02.03.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 02:03:54 -0800 (PST)
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
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564235; x=1795169035; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=isfwHOSFEU1THdAtyjNR/BymwB+TGu4CpGjFt5oul8o=;
        b=OekOdUSAApY5iwci5C3C7LYCdI2R88G/fHzr94dAVJZECltsIldl/KbA3hR8y93/5/
         Jjm/463p/AbppN03yKtL1aXt8ecUIDLMSqnOtOcX3ftsx2+D9a7kqVsO/mDM4vf7Mtak
         LcnJ/LlQoziFhY3d2xh8i5Pe7LHX0mv0zTh9P2S/W/h6HF7/Ih8ReAgiHzRX3wx78pCU
         Sr6VDSkPlU2i2ueyS+a/RzNMHqW+45Ea9YgWcPz1YUaXJfPVos37qMFim2xEQJpnV2tA
         l/GBiyf/bQjrwks1jc83y26YqgSmOmiTe4ahnclLQWBjQTAHph6Sj0BUtussoWMxCSlZ
         SP6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564235; x=1795169035;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=isfwHOSFEU1THdAtyjNR/BymwB+TGu4CpGjFt5oul8o=;
        b=mJLuChKOv2ijWnb4NUcRq7ygX05UsTyrOYQmcuuts4KKCIOiaF9NMTczkV5uoZSop3
         cvHTiABJaskrH6f9nWDWUH35CIj0qp/3hoOWd0RrAm2avqVd1oNcclB+RsqO3aIlaHVs
         8nR3kewK6QNqkVQ+F4t1aG6Lo5AEoPexLOXqcY87BTrE17xZFgj4C9TIO5EsBQN6LO6C
         CvTPD9pUkIxa8vG+Hve+AMixVQp8atwENGJA1A7ptHQlKeNZCBHJ20UGtbHg1rHpvqXg
         NWAXLtyY449AlaRVXxKVLwYnZ65P+soG0JYZIhzHeVZbP8nYW78NwCqCGSinegRLlOJK
         xAYQ==
X-Forwarded-Encrypted: i=1; AL+hErHFn/7uVYO6s6tHuHRW5gFQpMRfyx3BpHXsQniTBFEgpXIwkMiDGThJ4M+odIfFb7y6WufYZI1H9QA=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/AJwD1RSDosnjII4uwU6qLiN6q0crH7/2VvefuO51M6+JcnuE/
	jiPkK3nXK429hWG9C/tgWdOAgMuuYobK3SaCIw1HUNGw4lBYv6JulTi7HU7l0QaE01K0
X-Gm-Gg: AYBFou0blHZW0oE0447JMyRTI5Mw6Efo3jeKByxCqhONIQuX4i3qlCUHVxAsUZZB7Z/
	OcinhVemCRMhrqr0wtCn+gMed4B08H4S0cMfkHSTQyDZwQrtpP7MJxdCX6s/wvAtdr5/VIdmJDR
	4dPrr8nohZiDO1WkwT/XySj9wTfwEzDUEFbJkPs0qu7CW6zNBKcYGn4Kj9pCqrxmtFmYJQawQ+x
	eZE4Gj6VY3Iqun1JO2RMszAKSguFvWq6/1VqKMKG9q3Mip8A56qWhPkJyzsjHQa8pQS70xn8fU/
	tYFxGFUke7UtHCTbf3V3BbmHqa4XnuDDinROjLHuiu5iyhLoHvubBYUU1dvwucn9LFpUUHtntRb
	GNRriFPE6QjHt/3ySMTwHQs9KfOzxr24W/573YVND4TMrVGfkcN7Ew5cqECY44LVrMBuo+18+Yh
	IpIW8sMcxhz/ps47mJg4UFocin+w3DA8re32gCubxsqEyIleuaUoeaTvM4/bY8bKjmCqYa2HXOU
	xlkT3goBY4+sJbewegge8s5pBYGMReVHTRRDemvqF3oU1liVsC4ONqoVpCjGm1xIRQGZMfLlVP1
	n74qTM/j29K4URVoBnF4BE4oq/tb+qDYENQVBljO3gtkti8AhmXQ4o8VfWlVnpQ=
X-Received: by 2002:aa7:d556:0:b0:6b5:96e9:ae97 with SMTP id 4fb4d7f45d1cf-6b7c0ccaafdmr1234919a12.34.1794564235160;
        Fri, 13 Nov 2026 02:03:55 -0800 (PST)
Message-ID: <16dbddeb5cbb9613dc806b43fc681eb26aa3b0dd.camel@amutable.com>
Subject: Re: [PATCH RFC 10/41] nullfs: use fc_init_pseudo()
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
Date: Fri, 13 Nov 2026 11:03:52 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-10-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-10-4c998976c6c7@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-purgate-ID: tlsNG-d25034/1794564235-51538A5B-A05F22C9/0/0
X-purgate-type: clean
X-purgate-size: 1148
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 2026-11-10 at 10:14 +0100, Christian Brauner wrote:
> Initialize nullfs as a pseudo filesystem instead of raising
> SB_I_NOEXEC and SB_I_NODEV by hand. This adds SB_I_PSEUDO.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0fs/nullfs.c | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/fs/nullfs.c b/fs/nullfs.c
> index 319c2f5c5a67..2fe24cb97160 100644
> --- a/fs/nullfs.c
> +++ b/fs/nullfs.c
> @@ -2,6 +2,7 @@
> =C2=A0/* Copyright (c) 2026 Christian Brauner <brauner@kernel.org> */
> =C2=A0#include <linux/fs/super_types.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/magic.h>
> =C2=A0#include <linux/splice.h>
> =C2=A0#include <linux/uio.h>
> @@ -174,7 +175,7 @@ static int nullfs_init_fs_context(struct
> fs_context *fc)
> =C2=A0{
> =C2=A0	fc->ops		=3D &nullfs_fs_context_ops;
> =C2=A0	fc->sb_flags	|=3D SB_NOUSER;
> -	fc->s_iflags	|=3D SB_I_NOEXEC | SB_I_NODEV;
> +	fc_init_pseudo(fc);
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0

