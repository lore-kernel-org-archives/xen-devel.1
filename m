Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1791E606A32E
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 10:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=kFGvMcO3
Received: from list by lists.xenproject.org with outflank-mailman.1486984.1689514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRoGe-0006B3-KV; Fri, 13 Nov 2026 10:12:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1486984.1689514; Fri, 13 Nov 2026 10:12:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRoGe-000688-8c; Fri, 13 Nov 2026 10:12:24 +0000
Received: by outflank-mailman (input) for mailman id 1486984;
 Fri, 13 Nov 2026 10:05:37 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <alex@amutable.com>) id 1xRoA5-0003Ru-Hs
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 10:05:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRoA4-002UEc-Tf
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 11:05:36 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <alex@amutable.com>)
 id 6af6e0ea-e002-0a2a0a5209dd-0a2a450cd2c8-16
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 11:05:36 +0100
Received: from [209.85.218.49] (helo=mail-ej1-f49.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <alex@amutable.com>)
 id 6af6e0f0-f479-0a2a450c0019-d155da31d4d4-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 11:05:36 +0100
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-c4322d310e7so190391466b.0
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 02:05:36 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com.
 [80.187.86.54]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c5095a5b93csm75365566b.5.2026.11.13.02.05.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 02:05:35 -0800 (PST)
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
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564336; x=1795169136; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/ZNAGjGCHSUHK/hbpNrctHFuArQcFUaSPHFuYTd8W2k=;
        b=kFGvMcO3kTEQgJ+ZfVdMbfNQMUmR9IbuIaoFqWIVBpHA203tsrUO1JrcjvVtIJYVVs
         LUoOInEUFtgBCWHPIZOYof9hJmvVt7yJLoLX8KBIg8SPUUSwG0gS3oQ2Q4upzEb0EJNe
         kBtrPKtB+jiseENky3PJ7tEc0lBfEIsOYWeuqgKmrlc2bai+MhoIWLr8Tnq46A+7XM6u
         AePwc0/NZId+70YkAQfoRbn439fGGjlYOv7QxrlLKYLB3QyDPE7S1uGhG59UoPyfI4jr
         twf1G6YzlEvI7lM7lkjH3FlgEIfD2PmGZ+xk6nQwVbEcsI+rB/gYzJ7E4LBPCi6cjLUC
         lvlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564336; x=1795169136;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ZNAGjGCHSUHK/hbpNrctHFuArQcFUaSPHFuYTd8W2k=;
        b=UWVN62TrT/YUQMuTZI5UE0SK1V0wKRptb8GNBIb+O/3dCRDyxjKh9/2Hnp5To/rQWS
         hGe8oI5VuKq3bsP2feVv4+HOCrVxcSserh31+Aa444Am6Qi2wTxZts/r2mwnMlTz//xP
         PKO4zSfevjqI87WpLQQhuVUKQZ1tB8uYwqvQ3PNvsQg6JXo5cVjh27uAtW3hvE9E1+me
         R15dBsTHd2TuqtCL6XV4Be7otHgvP8OEA2BsbRRaV2wLQzSL+OF0LfhZKOgIVhLEIj1u
         +2tjZyt1fdPXDJtLuGKTDCaif6MbtPMG2Go0OQBKCLdbRAne+SXsff8DvENGfGs82jSc
         UTpg==
X-Forwarded-Encrypted: i=1; AL+hErE1hH76MRiOAhnoRc1sG1QMq/o99p82rdyiYhduUVmSpDsmSJS2I7bRyImYnqdzEPcl7jOSn6YysvY=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9K/se42PaSFHKl9fWfhpACUmWB/ld+Pzi2IXvjFxWU385fpYz/
	ObROLXOQaJcTPCE1FIVWc4AXFrM6wHhQTHanc1YUdK4DDpWSDaVgZNOlAEYVtqYAd3x0
X-Gm-Gg: AYBFou05L9f3lMOxsbYBYAhZr7Wik6EPSShcGMu4zTTLnwIPVOx2615Euj0GyYis9wj
	LsgVywL6NAxDaVds86JCsqbIki4dpaGpzz5c0HFdCI4dAzpRo74Q6k80HiHN1N3Vad8ScrjzITX
	mT/8+Da8iU4JKznxUS33mSh+zPotm7mUDwNTyn9VJJSOXJmp7S/+rfBXzWqAxi/r3UUOkoy3iVs
	qTzU0knUEP0xoZ9JDPdYQ8XJyjGJF+JOaM9tOWS0uS55jrRs4INx8hFcTbWrnh1DU/ixLnbMK9a
	+vGyebKR0eoksgkgu3QkF7qII5bWbZhozBvkAGG/tbu8p52H+HJqDJgZUcFzxn4qbTXv3NOS+3u
	OfDGYZ92LCB0ZCx4coNBUE71KelUMiTxuulB9BR72/FZWeTyGCoT1tzkdrvpgLE1Jw4W+dVXxfj
	gZ/39zwRzScYR5sv2qobtGzRR0CrJB1B2HTUVTpiyAiifvBVrvrzne2v4Y0A2MXYkqCyfULHvXI
	etZU4KvCJJkffNY+cGW+o37N0OgbfYLTVkGPjXNx4LAyy1CSrz8lITU656X7edovZoV6lSz4KlA
	Nez/H2YT4aVoC6z3YAl36/5VBYcBVGQsnfiH1CTtgBV9zvAmKjFYRBRX93yv8d0=
X-Received: by 2002:a17:907:94cb:b0:c2e:3a72:ffbd with SMTP id a640c23a62f3a-c5096389759mr162937766b.41.1794564336347;
        Fri, 13 Nov 2026 02:05:36 -0800 (PST)
Message-ID: <8f532a01f6cc2eb73582864343e25be4ec990919.camel@amutable.com>
Subject: Re: [PATCH RFC 14/41] debugfs: use fc_init_pseudo()
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
Date: Fri, 13 Nov 2026 11:05:34 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-14-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-14-4c998976c6c7@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-purgate-ID: tlsNG-d25034/1794564336-51D34A5B-EAA2CA94/0/0
X-purgate-type: clean
X-purgate-size: 1293
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 2026-11-10 at 10:14 +0100, Christian Brauner wrote:
> Initialize debugfs as a pseudo filesystem. This raises SB_I_PSEUDO
> and
> also SB_I_NOEXEC and SB_I_NODEV. debugfs never holds executables or
> device nodes.
>=20
> SB_I_NOEXEC also refuses PROT_EXEC mappings. The debugfs files that
> can be mapped, kcov, relay channels and powernv's memtrace, map data.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0fs/debugfs/inode.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/fs/debugfs/inode.c b/fs/debugfs/inode.c
> index b4915551ad31..f163f0bc5703 100644
> --- a/fs/debugfs/inode.c
> +++ b/fs/debugfs/inode.c
> @@ -15,6 +15,7 @@
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/fs_parser.h>
> =C2=A0#include <linux/pagemap.h>
> =C2=A0#include <linux/init.h>
> @@ -317,6 +318,7 @@ static int debugfs_init_fs_context(struct
> fs_context *fc)
> =C2=A0	fsi->mode =3D DEBUGFS_DEFAULT_MODE;
> =C2=A0
> =C2=A0	fc->s_fs_info =3D fsi;
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &debugfs_context_ops;
> =C2=A0	return 0;
> =C2=A0}

