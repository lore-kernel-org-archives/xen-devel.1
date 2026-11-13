Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD19606A323
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 10:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=WMqSABrM
Received: from list by lists.xenproject.org with outflank-mailman.1487084.1689626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRoL7-0004wj-OG; Fri, 13 Nov 2026 10:17:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487084.1689626; Fri, 13 Nov 2026 10:17:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRoL7-0004vs-LQ; Fri, 13 Nov 2026 10:17:01 +0000
Received: by outflank-mailman (input) for mailman id 1487084;
 Fri, 13 Nov 2026 10:17:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <alex@amutable.com>) id 1xRoL6-0004tV-6N
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 10:17:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRoL5-00Fbie-JN
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 11:16:59 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <alex@amutable.com>)
 id 6af6e386-8faa-0a2a0a5109dd-0a2a450be55e-44
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 11:16:59 +0100
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <alex@amutable.com>)
 id 6af6e2e7-b7e8-0a2a450b0019-d155dd2cdd92-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 11:13:59 +0100
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-492690dd5daso1015559f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 02:13:59 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com.
 [80.187.86.54]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49d673ce75fsm190118f8f.55.2026.11.13.02.13.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 02:13:58 -0800 (PST)
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
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564839; x=1795169639; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LWRhkHq/o14g3eGvU8PB/2eVsiZ8AcgjQiitoPu4Uko=;
        b=WMqSABrMBPbQ8QStc5gL6wVuKA1sRoRZ5sXSuIy01St7iai5WwdUWTc9qT4UnoBMwG
         8qjE9PEAOf0vW9U3qbew7VrRqfnxTAn934W4d2c5deQuSxiWgAS/PycITERx4p5PeZq7
         10B/4I2Nh9ESrp+4UAMhWURpRhaBxALc5NlzS+aP5zK01K/rZlgejBmS3nFFG2xQZkhr
         V535Aea/oCYzovpAsmDGTDcefOsyEo81ecYrG8FSMYTZcykI5hI9mADinlbdtcZn3BtW
         pDsVNDExp4C2BWYx+3xchdCrk59Ebq9ZRGrKCQxyNfJUthLyVbAlUgvPXbKwBcD1ozFr
         iGgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564839; x=1795169639;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LWRhkHq/o14g3eGvU8PB/2eVsiZ8AcgjQiitoPu4Uko=;
        b=ZyKbqMLwNF2fAGlFjIugspQP9qyhjEG5K+SF0f1qIacrQ9QOekYMnGzEmEQeR8ZZCa
         KbW4n/x/zjXxFLphQ5p07QJIubKEr2zGlaVuJOWcYRacmCCO1B51BDzLxPCeUlEQrTnI
         iWl7Tx0jRZKRREkRT2MrmaauMVnx1ETL7Vi2EJ0QM8OjBEaMhhV7Rb6UDPC/x36vnrZ5
         kIFa+vHRV52rRXUk3UP2ETiz0xnN/LctyG6xjAdT2rO+9Q1YvkZ4R8yhrAP+jlqc7m0o
         yWRANuji0qgM4L+OxE47qYvZ99mp48aqFVasMO425SHbu6j7dJrUrVlClxa7vQaWwd34
         zdkA==
X-Forwarded-Encrypted: i=1; AL+hErHyHbI3IUxxB/WQq6Soj4NxU0/848b0bgS8CKuMI1QbdkYxgsMczAUtbK5b0Lk8Mikz9ZdPILE0Dv0=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+KZ3MQB7hxS1WiiyJtpftpGa16uGsW73HK8p71rsm/lYH70tuG
	He16LXh9IGVKlJ9xRa99twiklYWipuHdvBHdX7Ma46vM9DGzbA+gZOGdrCy6Dn9X2Z3x
X-Gm-Gg: AYBFou3EqUxg+a25+Smk9bFrVrHY75YBF8nKVlTcih8ks+ivCQ3bFp3MECn+zIfmqXo
	8u6wswHMlKgY1JJ3zhSMhzOVxBpHIgd+qb3+sXCrJJk1hr8ZX1Kb09m6UUxafO2Jt4xZMEaW5DW
	bShfUvVYqG8xBUVqdumkp8Hjv6GP1CgkNANTeuMZxB5FZbqbU5kUm6dfH5SLrydmnyuxT9LlCdM
	b1OX4cFYMDg2r8I/TwwU394Dfi+DpwO6cbCtLlKE/2B08kWuCfDdR6nYlCUopXbtlQCEtZpdsAd
	GDZORh55NL2JEcKOxlOXmJfkN4itt4u3AqnzKsvw37vA9v74yOYTcaSjBURx6YXdjBPwaL+p2YS
	Tboy5Q04aIs5z07eo6T4Fr9A2xPai9XGHRkc7EU6vDzkhStCUvwTd65d+aCfcl61Fz+EzMQwjWQ
	EtVsRunDTeND3XkXkEiQJ3ni6OkJj6dLGPaXUvvxSfuMwmCrnz4UXIF5qjSyr9Y04upRkVrlTnM
	+jHPLd/Lvx0JtR7PDhACoL1sQLCDsp9irxI2kvpGq1MqnMJclXqy+sWVWg+aGDFCXgFS6e7ss/X
	ai88PWJ2+MZAd+aTLIVk9weVNY0eQxKgPRIJpFD5tkkexhGDa8J21CP8CxCR4AQ=
X-Received: by 2002:a05:6000:993:b0:48f:bc59:ab9c with SMTP id ffacd0b85a97d-49c6fd932f0mr4358101f8f.12.1794564838578;
        Fri, 13 Nov 2026 02:13:58 -0800 (PST)
Message-ID: <77855be3fb9f0e1888c6dddc56d73a1683c820f0.camel@amutable.com>
Subject: Re: [PATCH RFC 25/41] pstore: use fc_init_pseudo()
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
Date: Fri, 13 Nov 2026 11:13:56 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-25-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-25-4c998976c6c7@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-purgate-ID: tlsNG-42698a/1794564839-186CA9EA-225753DC/0/0
X-purgate-type: clean
X-purgate-size: 1129
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 2026-11-10 at 10:14 +0100, Christian Brauner wrote:
> Initialize pstore as a pseudo filesystem. This raises SB_I_PSEUDO and
> also SB_I_NOEXEC and SB_I_NODEV. pstore never holds executables or
> device nodes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0fs/pstore/inode.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/fs/pstore/inode.c b/fs/pstore/inode.c
> index cf499ba72702..4658561cf90b 100644
> --- a/fs/pstore/inode.c
> +++ b/fs/pstore/inode.c
> @@ -18,6 +18,7 @@
> =C2=A0#include <linux/ramfs.h>
> =C2=A0#include <linux/fs_parser.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/sched.h>
> =C2=A0#include <linux/magic.h>
> =C2=A0#include <linux/pstore.h>
> @@ -491,6 +492,7 @@ static int pstore_init_fs_context(struct
> fs_context *fc)
> =C2=A0	ctx->kmsg_bytes =3D kmsg_bytes;
> =C2=A0
> =C2=A0	fc->fs_private =3D ctx;
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &pstore_context_ops;
> =C2=A0
> =C2=A0	return 0;

