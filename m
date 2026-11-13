Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2EA606A327
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 10:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ZyJhZuRC
Received: from list by lists.xenproject.org with outflank-mailman.1487057.1689618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRoKa-00041b-Fn; Fri, 13 Nov 2026 10:16:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487057.1689618; Fri, 13 Nov 2026 10:16:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRoKa-00041U-DC; Fri, 13 Nov 2026 10:16:28 +0000
Received: by outflank-mailman (input) for mailman id 1487057;
 Fri, 13 Nov 2026 10:16:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <alex@amutable.com>) id 1xRoKZ-000410-QM
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 10:16:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRoKZ-006jBq-7A
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 11:16:27 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <alex@amutable.com>)
 id 6af6e377-bab6-0a2a0a5309dd-0a2a4508df06-14
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 11:16:27 +0100
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <alex@amutable.com>)
 id 6af6e2c6-f659-0a2a45080019-d1558032f17a-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 11:13:26 +0100
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4a140e7405dso10214395e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 02:13:26 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com.
 [80.187.86.54]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c609c8a77sm4362275f8f.49.2026.11.13.02.13.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 02:13:26 -0800 (PST)
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
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564806; x=1795169606; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UX3uQO58FXw3i2m3kzI3o8uINYIcsljrdUAfEKBly4o=;
        b=ZyJhZuRC8zMyakSO8OAcZtyFMFvd+4aoQyw844IOPW2b6LOaHe6C2Cz2Ugn8n7iyhk
         kdCHoN7DMDOq7TXDqfWlF3qYDJpBfWtzPL1BTAyd7eWcvUu5IlEBaM5tX3rdfJhYqHLq
         suuGd/84USJDNDNPJ3cSRzZ2jwoqxasfyCHM2XTjKYJaAR9iLEn3LHV/lKNEK39fEeIR
         uiC2YV2Twge1OoIOZJHIQ3rG0wf9J/cAJRjZL9kdmyE2RxyOUg1h+bwrCFoiEmV+EHch
         JuXmx7rmDF8yN6P4ecelnh827cPKyMfE13w3DuXkCQM5G96sr6BdvRyg2awUhFRvh4S/
         XKYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564806; x=1795169606;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UX3uQO58FXw3i2m3kzI3o8uINYIcsljrdUAfEKBly4o=;
        b=eAx0GV50FXxl+42MCscd4rryszomarLnwPVwRG4U8MPIqowFFO9DimBxR86yEP/UQ1
         gR3vmaB8Vq8+3Ky6pf9moO5pjLrPgAfXDDFyMMp1RGocymYwmPZ9cW+xL7K5GQxday+7
         HOGFgjcEe0uWv0M7uGy1M5DA6AvxqLnbbr0eQNw376ggE/LvIXPa5B6Ac02ytfkJXe1v
         cn4W6+AvOmbB22sxi1FiQNanpEVtUlGosp8Z4RnPCo9UIfiNsq0XdHN92UE29NzuXr/r
         dBzKFrcB9HH33ANRt2wX4PuG0sPdD+u/fiACw3dLDzN2N7dXLdXFhNU0RV/mc+MbKDFj
         1OuA==
X-Forwarded-Encrypted: i=1; AL+hErHRuStL4vBjTSgx0+IXebjV96ulOlGbRc6u+0xBDeMkMKFcRDXlHEInh75Jm6Uu7LxBgnVV5fp+31M=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/hN02VM6XPLm5TjfFOURVDl38ZM0akJA3UgtAb8rk3XsNOLZW7
	PyqkI4hz/N3QfDcgRvXp063PmY0wy2HMBnB+/zi3P3B5RGiKlwUg/tiq/FSHPXm3dh6o
X-Gm-Gg: AYBFou1BInuTZO9h0oY6dKj2KB60HMtOS87yyeVe4D6Oc2xk8wnt0yz47XQNrr7bEWe
	WbUGROphedS0oVfljYNRqRs79r+2TwvXxNIZbfWkyi2dVDiwL26Ivt3de3cnbMqizpVVSZUc3CP
	yu8q6RXqVKpXGQm6kdj8rMWHT0uUBK1IodmUTLiYG1S/HPCxwPZzRVIT4w5oIrTPWyvppQD8ppj
	sfD55JYVm88pslxadzhhu7dOX1bUh9bTad+9MQpeXXtnetCBdPKvntjEklASsS1w2Oz0RTKZp+R
	Oe/onuer7TLija2EjIF5Kr/BFb5F2CvbnEWwLP+MOysBkleBE5Ss3+4q5PAGmrt/WYyqnJTCDdA
	QqI023RuyotZFGBav21TZoizWS0T9gs85gGkSbIm5upkTFJJaKse0UqjjVMn32D6F8cHJ2Tu4IN
	wWMjv32mKaYZJfJh2FRhH0t41hWhwUiW4UdEsggKs60FSTKUke+IOyt4RHeaQ//n/1g2vizgW/m
	O9eHDLzCvhHxottP8062wYpYEfVA1klI1uuvzAcAdngWNg+oJO1HpSz2sQObikf/grIAhXr0eMV
	B9KF7vtjdErTZjSz5dFaAnZooXloVi6IOULfv0F4CiS2y8JzdQQ8Q9NTMgylcN4=
X-Received: by 2002:a05:600c:45d4:b0:4a0:23f:8b0d with SMTP id 5b1f17b1804b1-4bb559f6f31mr43583035e9.2.1794564806374;
        Fri, 13 Nov 2026 02:13:26 -0800 (PST)
Message-ID: <23edc29c421f5d4c1103004f79e104e9f94d42c2.camel@amutable.com>
Subject: Re: [PATCH RFC 23/41] fuse: use fc_init_pseudo() for fusectl
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
Date: Fri, 13 Nov 2026 11:13:24 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-23-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-23-4c998976c6c7@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-purgate-ID: tlsNG-c1860d/1794564806-D614687B-434E18CC/0/0
X-purgate-type: clean
X-purgate-size: 1141
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 2026-11-10 at 10:14 +0100, Christian Brauner wrote:
> Initialize fusectl as a pseudo filesystem. This raises SB_I_PSEUDO
> and
> also SB_I_NOEXEC and SB_I_NODEV. fusectl never holds executables or
> device nodes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0fs/fuse/control.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/fs/fuse/control.c b/fs/fuse/control.c
> index 21ffde596d61..4497362e7df0 100644
> --- a/fs/fuse/control.c
> +++ b/fs/fuse/control.c
> @@ -10,6 +10,7 @@
> =C2=A0#include <linux/init.h>
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/namei.h>
> =C2=A0
> =C2=A0#define FUSE_CTL_SUPER_MAGIC 0x65735543
> @@ -334,6 +335,7 @@ static const struct fs_context_operations
> fuse_ctl_context_ops =3D {
> =C2=A0
> =C2=A0static int fuse_ctl_init_fs_context(struct fs_context *fsc)
> =C2=A0{
> +	fc_init_pseudo(fsc);
> =C2=A0	fsc->ops =3D &fuse_ctl_context_ops;
> =C2=A0	return 0;
> =C2=A0}

