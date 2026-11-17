Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7818E606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 08:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ps98o6Iu
Received: from list by lists.xenproject.org with outflank-mailman.1491957.1692646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTEW0-00010u-NV; Tue, 17 Nov 2026 08:26:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1491957.1692646; Tue, 17 Nov 2026 08:26:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTEW0-00010n-KU; Tue, 17 Nov 2026 08:26:08 +0000
Received: by outflank-mailman (input) for mailman id 1491957;
 Tue, 17 Nov 2026 08:26:07 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <alex@amutable.com>) id 1xTEVz-00010V-4r
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 08:26:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTEVy-003agx-HA
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 09:26:06 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <alex@amutable.com>)
 id 6afc0f97-bab6-0a2a0a5309dd-0a2a4502dfe2-48
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 09:26:06 +0100
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <alex@amutable.com>)
 id 6afc0f9d-6ca4-0a2a45020019-d155802da5b5-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 09:26:05 +0100
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4a9a8d6cea8so7875535e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 00:26:05 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:de4c:6789:33ce:97c2?
 (p200300cf572c2800de4c678933ce97c2.dip0.t-ipconnect.de.
 [2003:cf:572c:2800:de4c:6789:33ce:97c2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb7ad9430asm12629125e9.15.2026.11.17.00.26.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2026 00:26:05 -0800 (PST)
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
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794903965; x=1795508765; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=z/NZRmC5bENRF/WsK1hUt6gARTy1xozW3x04wBCWbAk=;
        b=ps98o6IuZ4it7JykLtHjh432+fac+hnIAdaQTZboyzjIRRqlY8eQWAuZJ3RdMlN9fS
         7DEA6/st096Pi2ZKC4OxrXPR6gWyBP7hZkKjU13iYGEa5O6OSkwIQQTk9vdpYN8+KbBu
         +xkcEQ3Sg7TSKsvAVQasLYR13pR2Vyz+2OVTtt742Pkhya6ZPdS53rKMra0Ne7aEaMiO
         A8XSnQ+rrBlhT5HkHNfN4e3J5H00O60f2m7LekDhs0QizxgS2AaqoCSWT1/NNs/zDXOP
         cfoWkp+k+h9h2X8Uc2YuvaCL4xSJvWek9wSNPN99zC4Ep6P8U4XkzO+HwAtrld005ntG
         fF7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794903965; x=1795508765;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z/NZRmC5bENRF/WsK1hUt6gARTy1xozW3x04wBCWbAk=;
        b=F8K1fINZZRheC3N/uI4ZdUCGSUF8uc7TE3n+zYfE1MdUJMwOaQU1bsLw9pnKrb6Uic
         Ncqyo0oo7/cu64/BLe8JXHFUMgkJ8n/HO4MS0mTMyL3f9bCfbtQcvCWg4v5VAxbCDY9F
         z8BwZ+LtcwSiZTf/zXh89aLBU4W6q0GltpoHhoqLU6Ym3tQxMBtNrZRUClXDaWJX3Xw8
         6j0mCgXeZvf78qHr2KPwwLeniGBOr/Kob1kd75hWKhWzWiCiYs+dL7EfngJ3XgMo2gOj
         YKUho5D20pC30ZMuLlGYcdnGDtsvfZg7a277Go+InD6+vScEUBWnZCuDeMnqwZ9+RXcb
         Udnw==
X-Forwarded-Encrypted: i=1; AL+hErG1CDXrxSfL82hvmsAFjG/d5jpNpi/RF5mL2Tqgv1b1l33ozOwO+JVJGBqbJySLHG94wuyhcLrV9NI=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8Mx8MNg3YYioohwrxjE0oP4a1ktjWWGY5IoD7jqrIvHrUiNZ5v
	RwjP6BCMKp/JxJ/VD1E0gALsc7aUgsxcuMpIbSAxIFxBy6QLlnNONPrmfkT0MhtQekix
X-Gm-Gg: AYBFou1Q0P15WzEIyOCTL44F4fclo+PBEYSKaR/XH53WxC2fFzZq2BuA+V4mzQCc7N0
	+npQMIX+AxgnFY2tCuzqpL/Na0VC2rcrI+6ZwWLL8/gc1lPQ4oPQhq8oCNnfDiSpHz8Tci1Pg0R
	G//YyRAQ+J3cK+YTNgUfl2RQ3/365b7pIxZIstL4vnRcXAEC7kCAxUGCNHZcKOVkqg6sN5etLpb
	YZbvMsvUgXZWJBibJwkJamc9XpwQCEmJOwcz1bK1ffXfYH4h/HQNH5MRZtxTiXacnhQxWmQ5M3s
	TuQIRoBNpgfGAJOzB5KrZAPjR04KwEYeP2l5xWYv/F/S3jKspP1luQrDgZW2ExlNU2bHB0hpwjT
	OSs7bTyysNxPMH4jZ9aooBdrmH7XAQGWKlCMtKD1ay9UM6TRsnFqUoS23afaWxMh7QQl9ODFOCN
	nMTTmffdLn86r3d9BWZB/VTLkO0n0Tv0/Leow0MtKosrD5cEOii0q8JwZ8Loi6fCk8nGkrxPeHA
	CLKPpB/u/pMFu020Id6UYMq9juLf75djc0inDNojeRuvkL7+OpyyjluCaUWTAdLKwxqrGwbLP7r
	AFAZSQMAqaJ5/1WFuXuwlPoSM0btrRPRAn8id1LRwFuKp5b4WQpPK8q38zEBAo4ljbNAari+QPn
	xrBjwqOJlm0mxmgk9Ww0qmLo36KOfkofd7rzrc52OqOderbERVTZ3civw
X-Received: by 2002:a05:600c:5493:b0:4a1:c27d:e1a8 with SMTP id 5b1f17b1804b1-4bb783813a7mr42606245e9.10.1794903965400;
        Tue, 17 Nov 2026 00:26:05 -0800 (PST)
Message-ID: <88041240268f70b218de7dfd58c41977d03a60d3.camel@amutable.com>
Subject: Re: [PATCH RFC v3 03/44] target: fileio: check that the backing
 file supports ->{read,write}_iter
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
Date: Tue, 17 Nov 2026 09:26:03 +0100
In-Reply-To: <20261116-work-loop-pseudo-v3-3-8cbbea1cf34f@kernel.org>
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org>
	 <20261116-work-loop-pseudo-v3-3-8cbbea1cf34f@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-purgate-ID: tlsNG-720697/1794903966-F26B72AC-6371175E/0/0
X-purgate-type: clean
X-purgate-size: 1794
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 2026-11-16 at 12:04 +0100, Christian Brauner wrote:
> With fd_async_io=3D1 the fileio backend calls ->read_iter() and
> ->write_iter() of the backing file directly. The synchronous path
> goes
> through vfs_iter_read() and vfs_iter_write() which check for them but
> the aio path doesn't. So a backing file without them calls a NULL
> pointer on its first I/O.
>=20
> Refuse such files when configuring the device. On the synchronous
> path
> every read or write that needed the missing method failed with EINVAL
> anyway.
>=20
> Fixes: 769031c92c8b ("scsi: target: target/file: Add support of
> direct and async I/O")
> Reviewed-by: Jan Kara <jack@suse.cz>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Chris Down <chris@chrisdown.name>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
> =C2=A0drivers/target/target_core_file.c | 8 ++++++++
> =C2=A01 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/target/target_core_file.c
> b/drivers/target/target_core_file.c
> index ab9824a4852f1..a5391e57e9aa5 100644
> --- a/drivers/target/target_core_file.c
> +++ b/drivers/target/target_core_file.c
> @@ -144,6 +144,14 @@ static int fd_configure_device(struct se_device
> *dev)
> =C2=A0		goto fail;
> =C2=A0	}
> =C2=A0	fd_dev->fd_file =3D file;
> +
> +	if (!file->f_op->read_iter || !file->f_op->write_iter) {
> +		pr_err("FILEIO: %s lacks ->read_iter or -
> >write_iter\n",
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fd_dev->fd_dev_name);
> +		ret =3D -EINVAL;
> +		goto fail;
> +	}
> +
> =C2=A0	/*
> =C2=A0	 * If using a block backend with this struct file, we
> extract
> =C2=A0	 * fd_dev->fd_[block,dev]_size from struct block_device.

