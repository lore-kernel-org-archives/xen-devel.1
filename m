Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45915606A32E
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 10:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=uDj1qMhi
Received: from list by lists.xenproject.org with outflank-mailman.1486983.1689508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRoGe-00063G-7M; Fri, 13 Nov 2026 10:12:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1486983.1689508; Fri, 13 Nov 2026 10:12:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRoGd-00060L-OL; Fri, 13 Nov 2026 10:12:23 +0000
Received: by outflank-mailman (input) for mailman id 1486983;
 Fri, 13 Nov 2026 10:05:36 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <alex@amutable.com>) id 1xRoA4-0003Ro-Ef
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 10:05:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRoA3-002UEc-RU
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 11:05:35 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <alex@amutable.com>)
 id 6af6e0dc-e002-0a2a0a5209dd-0a2a4501e0d2-42
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 11:05:35 +0100
Received: from [209.85.218.50] (helo=mail-ej1-f50.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <alex@amutable.com>)
 id 6af6e0ef-5984-0a2a45010019-d155da32c04a-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 11:05:35 +0100
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-c247f6687dcso182009266b.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 02:05:35 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com.
 [80.187.86.54]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c5095b7b2c9sm75811766b.73.2026.11.13.02.05.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 02:05:21 -0800 (PST)
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
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564335; x=1795169135; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fNM18G1T3F0ezY9f7dMoEwC6d3kOVWk14Z1vuqkOGWM=;
        b=uDj1qMhisu2XGEUoDOwkvTVoR3UZQDMlTCKP4acrEXThIqb5PObNjQWi9cQ1/ouJKn
         rMBGPySosT2qQuxnOFk0rBGeuLGa65fm9pJQ3iLYUSW5e4mB4+82AulfhmWnQA6Rbzh2
         K9ZIjmgjVvgg4zWAF0Q8eOuklX8spEFIoL5Bsm9IJVGckgmzol+0OQYybhE1N9tXgQLZ
         lmZBOAs/pUP1mwX/azOdEvqcQX/J1oGdWvO0WS+5jrIqEUjji2eZyyhcUHQM8+WnRhJC
         oD0aiTK6bpNuIPi6vyJFDkiEbsPPFFvI2ti8xqXTgImd/27wi3+CtKwL843D2/Z6FJMq
         HjoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564335; x=1795169135;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fNM18G1T3F0ezY9f7dMoEwC6d3kOVWk14Z1vuqkOGWM=;
        b=JrQQ2jLuNSlFPt5fKnhj53lPfmYLm+HtJF3cLwttVQ0s8PLmP3kHOdSoQgTFMprSEx
         j/x1heTzAzXh42E8Uk37HmWlQnN2bAKKhEQ6JrtD1eGg+H5AXpq9S7X5T1+FaebZ8DYT
         z4TaaVkmhZXvPI+ASVte1BSxrmfuMUzT2KQRa9gaVpF/q0cFLoOPEgnJ+6W4x/FoBhrf
         pqpK+kbKxgIvB5EHy58S+FgVapfntuexePZc60xkkFgwgMtO0tk4o7nNsJzHaVCIF7Cx
         rS6lu/1xC6nCdgPefhZOo8E0b5aYT9Vlot/MiVYv9qs3jK4o1tYizo7CEVFhcB7uFb97
         Tqew==
X-Forwarded-Encrypted: i=1; AL+hErFfdI3zWT1+Ss5AAuX+ZgYK20gF8/5WD8qB43V5UXqn7G8dlXyuFuyqa0qlx3C0ZMUST7zOpq/MW2w=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8c6AfXeUUj+lMWGsT2tAmXke1m9nKnQIjqVKOB2ku5CBMS4EnS
	NJh9EFEDISUmYmO2adHfSvszWj5TzzYhAs/mT/lcK6fCeaNMkNtAWw8Us07gg2V86czucK6HOHL
	2yAGwjXh3BO8=
X-Gm-Gg: AYBFou3tl+4nchvMaHdb+8FobytCq6O6+F0GzLMPRDertUqRG8Uj4OmaQwgdKNxZZ0U
	TqTzQAzYHTWXUqlO1wbwf6DHa0MefKvx6KABySJhtsGDQ4Xi2IUKWvQzLXaBXDhAoL0vgO5+J1i
	0IaAXec7Tti6OJ/LV3Qt7/8bwOE9j1djClpt3hSW0UePnViypIWVCOKsxPKPbMjxqa8R72L4FMK
	T+lEFrH2Khrs+qeDsR3yqpg1+CVQeXs/COT6f2GcYj9Z6ACga8wWKNWpFt7K+MRuKrC5oGvBIaJ
	NhDd0XSvxeSCdYp5TbSFA/8ZiizUYHSS6HfJBQJooX9gV9g7RIAlNzIHoMppGVfrZD8Zi/7/KqI
	HOBNB7X1Sc0p2eFMCK7jvLR4p6GvdC5PM6E5pz11NUUU91WTCRkVpNGMQ5TWjp1KZgGuOi03pdj
	r2uVVEyIS7AMEAoQOHsDT+bhHQ45vNrQHgYr4cVv+NnX+V5sUoJMe0+LPNZ0znbkCUT4yKfE9zS
	lk01mlMd/Ml7crGrm8SGEYt3jqhr7zZ7YV/5ahAqbz5fAdZ035YzdZW9h24qiWDEEgAmkfftyX+
	vdOXvaDTPD4Xy0AASDnFOR90twR1zn4J+z4+zqrRtFAtzR0NfBM8aMdA+jMPumE=
X-Received: by 2002:a17:907:608f:b0:c43:eae5:ee80 with SMTP id a640c23a62f3a-c5096398b03mr148720566b.17.1794564321873;
        Fri, 13 Nov 2026 02:05:21 -0800 (PST)
Message-ID: <08fa1be263cf4a3db6b3e5ec2847107fba7acfba.camel@amutable.com>
Subject: Re: [PATCH RFC 13/41] devpts: use fc_init_pseudo()
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
Date: Fri, 13 Nov 2026 11:05:19 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-13-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-13-4c998976c6c7@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-purgate-ID: tlsNG-d62444/1794564335-1DE78757-D798A9A6/0/0
X-purgate-type: clean
X-purgate-size: 1166
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 2026-11-10 at 10:14 +0100, Christian Brauner wrote:
> Initialize devpts as a pseudo filesystem. This raises SB_I_PSEUDO and
> SB_I_NOEXEC. devpts never holds executables. devpts_fill_super()
> keeps
> clearing SB_I_NODEV for the pty device nodes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0fs/devpts/inode.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/fs/devpts/inode.c b/fs/devpts/inode.c
> index bd1e8eb26edb..47ef12241d92 100644
> --- a/fs/devpts/inode.c
> +++ b/fs/devpts/inode.c
> @@ -13,6 +13,7 @@
> =C2=A0#include <linux/init.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/fs_parser.h>
> =C2=A0#include <linux/sched.h>
> =C2=A0#include <linux/namei.h>
> @@ -438,6 +439,7 @@ static int devpts_init_fs_context(struct
> fs_context *fc)
> =C2=A0		fsi->mount_opts.reserve =3D true;
> =C2=A0
> =C2=A0	fc->s_fs_info =3D fsi;
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &devpts_context_ops;
> =C2=A0	return 0;
> =C2=A0}

