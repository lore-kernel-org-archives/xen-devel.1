Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677B060A2602
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 08:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=trVhdP/7
Received: from list by lists.xenproject.org with outflank-mailman.1491984.1692672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTEXw-0002YK-Fl; Tue, 17 Nov 2026 08:28:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1491984.1692672; Tue, 17 Nov 2026 08:28:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTEXw-0002YD-Cx; Tue, 17 Nov 2026 08:28:08 +0000
Received: by outflank-mailman (input) for mailman id 1491984;
 Tue, 17 Nov 2026 08:28:07 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <alex@amutable.com>) id 1xTEXv-0002Y5-LZ
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 08:28:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTEXv-00ErgD-1o
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 09:28:07 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <alex@amutable.com>)
 id 6afc1010-2eae-0a2a0a5409dd-0a2a4509eb64-20
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 09:28:07 +0100
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <alex@amutable.com>)
 id 6afc1016-be1a-0a2a45090019-d1558031e0e6-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 09:28:06 +0100
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4a3517554f7so47025615e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 00:28:06 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:de4c:6789:33ce:97c2?
 (p200300cf572c2800de4c678933ce97c2.dip0.t-ipconnect.de.
 [2003:cf:572c:2800:de4c:6789:33ce:97c2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb78418853sm74782845e9.8.2026.11.17.00.28.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2026 00:28:05 -0800 (PST)
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
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794904086; x=1795508886; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AET1JHslkSzLNTOs00e5qdhXA33kuZnL+yhN5Q6hFHY=;
        b=trVhdP/7NF4p/tvbPyMm82j8wutqEuG5/f0R4NLMi/5ONTwMegBU3VhpfSwTxTyPTU
         HUCsaM2nzN9sDT5AG+g8joVAT31KPTetgfFJFX6XoAIcHnOe9SuN7zcby9GHBwNu8NJd
         vpJp3m5qmYjFTBrzRfRplR8EXCL8DeEuVGYgpabGyVRo9N6pqBOJju0weyYE4JMyXH0t
         N/965/3I19GX4SSVpHI1/9h+VTAPOWb6sDKX6lPr9MwabVHFKkSbZmIlZ0Wn0gnM9LG3
         UKFaZqiMHYoPdjWHQkkM9clQnwfg/ar76khcronjwhlCb2a5Qri0M0zb7SMcn0q05I63
         XiGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904086; x=1795508886;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AET1JHslkSzLNTOs00e5qdhXA33kuZnL+yhN5Q6hFHY=;
        b=R0dUVUzIgdnazCoyWQ+QALRtyF4YbdjdwqVvnb/EAvhpE5kIoCw1AXGO8g9ivimCqu
         8JdZG5FmVdr3xkznI9qfU0v5ypu+Bt/NqIHLPgKlEzQOAcjbve9rJFz63nxZZ6DM+UnD
         VGpg+MY/qzzckWv2fY1gxFP4TQWBHnnzyNLln/Rg7sB4N68c5lBUXZ2Pbit6Wvzw/diD
         TlYlMVMWhiN79rnWWrNfb18Sy1qAddxcfb+3ofKboOqGB4AfX1gjxP9Cg+voEPYFBGK2
         aLAeVsrERM2EQkhy75h3qsokNShhb+r5/9bv1p1mlhTF4bXIFo9BFh6Ix3umVj4ckbAh
         fv2A==
X-Forwarded-Encrypted: i=1; AL+hErGFqiiSXu9LI2CRoz9gn5314VuBPqE0UvGIbVZsctP6jCFiE1ej1nmA8CRvqaf1cTyecfVDYpIEntc=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9Vz+98Tc1GQOSV/3RnQdQuVRYh5KXsvHzh3DTlxq8yhqnIuMll
	4LK77suyGrr8Yz1aLFFTYXuaj6rurJTvvmawBCFTTDdV8UJwZneGbsfBBCU2UTY2W56r
X-Gm-Gg: AYBFou2cQPIxztFmyOBD0uyIYG8kRZXfAzUmTeuy80NSRYUCCZJDe8bdA5DegFKG3mJ
	JNWlYBCaWtEbzsrM9iRGmv5b0v6+2nqb9+6FqbhLdOjnax259l8AeAfKVZ48IqeVqClrep1ffOV
	Iuvl4WwzdG3F8ED4J6IFKOlSZhomkCk3WG77MTt4O4ISYUlCnM0Avd2xR0ROdPIRBdAHbwHwZWr
	1ib9qxKi6c66bIgcOQGdwhPxufkOxROaxJ+qNbb1H0krCf0SMn2nYtA1O93SSmZlGo9Yg8BDE0M
	cxcxn6tffdbPZyNVmR7txdv151hQhmqzDi60v6wJuwic1pEU+x4zioZi2E3g1JOaHfSBzF7Y40i
	ZGh5ovm+wZvXh+071YS8eEjbkswgFyTwod78Rs6u142vMGZ486sOUx09i1T5Rmqv5sHQhYG/rB2
	7uzCh/SMV2bmSDUO8CYrE1BnF/Z8vo8hf0E+x+DL3lGD8q1svJq6eWQVLyUUwDyQY+LZMdu8Iv/
	zMWnXU64iu0OdkxN9vDI/OnF2wZZ311E1cTA+rzDzUrOtNqXUMyYVewqdgIvSSjEYLFKikDrGR2
	TDXx9qxDXyTbaEj9FnYkac814VVipGVvf0LaIG9k3Nj/miNF/W4x6MJjSQbaf7nSymxIoI3hQyf
	tRm6qM+7fTq99BZ59uDv0nVSETfVTl05Oxcx8U+1hbFdYcGwVKhmKfX7w
X-Received: by 2002:a05:600c:512:b0:4a2:a9:ed87 with SMTP id 5b1f17b1804b1-4bb55a5aa47mr209766355e9.19.1794904086313;
        Tue, 17 Nov 2026 00:28:06 -0800 (PST)
Message-ID: <fa0ce0f7ecdbe91cc6773bcbe86be137d2129944.camel@amutable.com>
Subject: Re: [PATCH RFC v3 21/44] nfsd: use fc_init_pseudo()
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
 linux-kselftest@vger.kernel.org, Chuck Lever	 <cel@kernel.org>, Chris Down
 <chris@chrisdown.name>
Date: Tue, 17 Nov 2026 09:28:04 +0100
In-Reply-To: <20261116-work-loop-pseudo-v3-21-8cbbea1cf34f@kernel.org>
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org>
	 <20261116-work-loop-pseudo-v3-21-8cbbea1cf34f@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-purgate-ID: tlsNG-bad1c0/1794904087-3B8D1034-667D4125/0/0
X-purgate-type: clean
X-purgate-size: 1235
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 2026-11-16 at 12:04 +0100, Christian Brauner wrote:
> Initialize the nfsd filesystem as a pseudo filesystem. This raises
> SB_I_PSEUDO and also SB_I_NOEXEC and SB_I_NODEV. It never holds
> executables or device nodes.
>=20
> Acked-by: Chuck Lever <cel@kernel.org>
> Reviewed-by: Chris Down <chris@chrisdown.name>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
> =C2=A0fs/nfsd/nfsctl.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/fs/nfsd/nfsctl.c b/fs/nfsd/nfsctl.c
> index f32311f2d7cf9..ce2666deddbd9 100644
> --- a/fs/nfsd/nfsctl.c
> +++ b/fs/nfsd/nfsctl.c
> @@ -9,6 +9,7 @@
> =C2=A0#include <linux/namei.h>
> =C2=A0#include <linux/ctype.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0
> =C2=A0#include <linux/sunrpc/cache.h>
> =C2=A0#include <linux/sunrpc/svcsock.h>
> @@ -1375,6 +1376,7 @@ static int nfsd_init_fs_context(struct
> fs_context *fc)
> =C2=A0{
> =C2=A0	put_user_ns(fc->user_ns);
> =C2=A0	fc->user_ns =3D get_user_ns(fc->net_ns->user_ns);
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &nfsd_fs_context_ops;
> =C2=A0	return 0;
> =C2=A0}

