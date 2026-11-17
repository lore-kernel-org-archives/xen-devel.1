Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21ECB606A8BB
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 08:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=iz5GToOE
Received: from list by lists.xenproject.org with outflank-mailman.1491993.1692683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTEYI-0002y7-O4; Tue, 17 Nov 2026 08:28:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1491993.1692683; Tue, 17 Nov 2026 08:28:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTEYI-0002y0-Ka; Tue, 17 Nov 2026 08:28:30 +0000
Received: by outflank-mailman (input) for mailman id 1491993;
 Tue, 17 Nov 2026 08:28:29 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <alex@amutable.com>) id 1xTEYH-0002xg-Ix
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 08:28:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTEYG-003cCV-VX
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 09:28:28 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <alex@amutable.com>)
 id 6afc1018-bab6-0a2a0a5309dd-0a2a4505e836-28
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 09:28:28 +0100
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <alex@amutable.com>)
 id 6afc102c-4cb1-0a2a45050019-d1558031adab-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 09:28:28 +0100
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4b79502c27aso36240035e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 00:28:28 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:de4c:6789:33ce:97c2?
 (p200300cf572c2800de4c678933ce97c2.dip0.t-ipconnect.de.
 [2003:cf:572c:2800:de4c:6789:33ce:97c2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb78422d2dsm75197335e9.10.2026.11.17.00.28.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2026 00:28:27 -0800 (PST)
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
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794904108; x=1795508908; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=80nJ9mfJsz3UGKSZAnLQ0A7kD85nyx4H/r5vYSV/3QM=;
        b=iz5GToOEjdyKG5UyOiPzTDUAT1TQoGONG8XiQg4TUQj8ibKtfDUu4puxENafalMPY0
         Ha4BzuifSqrHhkp8DOr83634ty/eqbM9erY6RFnt0Cz6+1qDcCY3JCY58XM67oALUuF3
         hXT7GlpimdenAj+PrAyL04BF1++XoEny+c1tBV+sD6nYJLiDUmxmx42d6DD+Rrmr1kgy
         vjpAKNmqac/gJbYZ0KveUOgXn5EtvhRtrBuGgi5HJeuk7GGEglQt+zXWUdCWxxQ0OwSL
         ND4WszYb4KXQoMCKnZN0DH1oCFnDeaNQXKkkeWm56BUOPTIEXolTZiQtyY/Abj21DdMJ
         6WBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904108; x=1795508908;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=80nJ9mfJsz3UGKSZAnLQ0A7kD85nyx4H/r5vYSV/3QM=;
        b=Oc4Cl4Yt64Nz9p1rN4Ry4jxNyT9a7414/r80XrezcHd3494x7Jz7PqGSa4Zs/aExZh
         AMBPBqJ7mRu8X1MlSn4G68ujQcRqZXEHv2GlLZ6ZwN+fnPq4KNDVbrpNUh8q5EfVWLFB
         xWkWv/0QVT6yZHk5DdcvKx0q+tn2u3oXEVUN0Vp28BuG39PQ5czaa9k3/JOVJ0KWbG/z
         SOqG/rrcOCq35cxEwnQfwhJRyvlZqoYxEHcbB8CPqPXhwIaac1X4RVswVPTg8aUqaLUm
         82YP5rZq1mJH3MXHbhtunMABJPXb0tEYzB+oHxaYpoz9Hkp5LjgurdGmqP9MI7lv9t9R
         eXtA==
X-Forwarded-Encrypted: i=1; AL+hErGT14sywtNBuc18ey2CEwlgNJzBD4C/3Ch4S0dOFiGeHvg0dW8/trS78gkqvsxDQ/7nBnL0Hyu66zU=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9anBHGit5pH5s9bjjqb1dx83pXUi5dUodqniGedXDFbVzQ3fGD
	mbui09MOcQ7aU9YgYGE6vAqJHZVxnE0oWioVGsruhrOAKocB7PnzRgL/mEx133aSkwW4
X-Gm-Gg: AYBFou1fuULifcVdRmaJaEDofu5DIaiimQ0NzIqP4S0ow1ICFpTYM+szMQQEMtHBLFC
	UAgWHpS0vhZr71wGtFnQfRF/8+tb9tFhMe25YwF+VSt6g1A47FoHpPMSgTzP9R5GshQV9XKJP/r
	gPy8mHBML+maFo/ykbeLfhmAGiHN4KS2fpR6WtmauoYFwPvzbquYxf3J/gXdRkrpW1Z8evRfxQp
	iDNCNc+qR2BS6BDvS6rjdtVuaLH9aQGjTaEDUMJozYxzQ76KBvvN+hvRfc7dKpFNGvhwZjeg449
	C8nC2IQs/GfE0EGXEzSSLfjD6HDMB3RkOIK88qK90Ye030WU3n15qyX/Bz7kvUtKDNRn8HlC7ND
	eXBR9mZgYRwJbNOmXdr9apB+MJqF8yFQKDdjNNAmWGQN9z4eZMDQdVYW90cLod/Z1XluEbF2LkK
	o7t8Kb5rIBOE/yXfvGipPuvWS/5ic8uoe4+ODBfoebKpazkGR+DZ0+6o+cwvrZ0yNg84UH95ghe
	RAlwicp4exW2naibjk9OJSlQbWHi3vohSUIRebBDTina/jv/fpn4z5kt3nmPIaMXr4ysKmdS/2e
	KSelev+8GSvQwGCJt7K5yYTSM+VowKA1ZZP8o+8c8H+0FumTcTQHRAt9mUYwDpVYlas7WwMUKmk
	Si7esFH2mo5pAIX+EnJuvzCX4P1kCE4kum830sGgXjklxFcIjnlyltHBg
X-Received: by 2002:a05:600c:6286:b0:4a1:7e77:c382 with SMTP id 5b1f17b1804b1-4bb55a5d634mr255399085e9.5.1794904108278;
        Tue, 17 Nov 2026 00:28:28 -0800 (PST)
Message-ID: <afc070a816e3ae5eb3c9e2d62d4f25c59ee61df2.camel@amutable.com>
Subject: Re: [PATCH RFC v3 26/44] xenfs: use fc_init_pseudo()
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
Date: Tue, 17 Nov 2026 09:28:26 +0100
In-Reply-To: <20261116-work-loop-pseudo-v3-26-8cbbea1cf34f@kernel.org>
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org>
	 <20261116-work-loop-pseudo-v3-26-8cbbea1cf34f@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-purgate-ID: tlsNG-c201ff/1794904108-F68B62A1-D5EE1BC4/0/0
X-purgate-type: clean
X-purgate-size: 1322
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 2026-11-16 at 12:04 +0100, Christian Brauner wrote:
> Initialize xenfs as a pseudo filesystem. This raises SB_I_PSEUDO and
> also SB_I_NOEXEC and SB_I_NODEV. xenfs never holds executables or
> device nodes.
>=20
> SB_I_NOEXEC also refuses PROT_EXEC mappings. xenfs maps the xenstore
> page and guest memory through privcmd, both data.
>=20
> Reviewed-by: Chris Down <chris@chrisdown.name>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
> =C2=A0drivers/xen/xenfs/super.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/xen/xenfs/super.c b/drivers/xen/xenfs/super.c
> index 37ea7c5c03469..aba7d038ed735 100644
> --- a/drivers/xen/xenfs/super.c
> +++ b/drivers/xen/xenfs/super.c
> @@ -15,6 +15,7 @@
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/magic.h>
> =C2=A0
> =C2=A0#include <xen/xen.h>
> @@ -80,6 +81,7 @@ static const struct fs_context_operations
> xenfs_context_ops =3D {
> =C2=A0
> =C2=A0static int xenfs_init_fs_context(struct fs_context *fc)
> =C2=A0{
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &xenfs_context_ops;
> =C2=A0	return 0;
> =C2=A0}

