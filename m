Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FED1606A33D
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 08:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=aLL2x3Cd
Received: from list by lists.xenproject.org with outflank-mailman.1492027.1692709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTEg6-00065m-VT; Tue, 17 Nov 2026 08:36:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1492027.1692709; Tue, 17 Nov 2026 08:36:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTEg6-00065f-St; Tue, 17 Nov 2026 08:36:34 +0000
Received: by outflank-mailman (input) for mailman id 1492027;
 Tue, 17 Nov 2026 08:36:34 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <alex@amutable.com>) id 1xTEg5-00065X-Us
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 08:36:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTEg5-003f2u-3W
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 09:36:33 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <alex@amutable.com>)
 id 6afc1205-bab6-0a2a0a5309dd-0a2a4505c3ee-42
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 09:36:32 +0100
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <alex@amutable.com>)
 id 6afc1210-4cb1-0a2a45050019-d155802ad5f6-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 09:36:32 +0100
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4a2000d5fb1so21992445e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 00:36:32 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:de4c:6789:33ce:97c2?
 (p200300cf572c2800de4c678933ce97c2.dip0.t-ipconnect.de.
 [2003:cf:572c:2800:de4c:6789:33ce:97c2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb78430752sm52548565e9.12.2026.11.17.00.36.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2026 00:36:31 -0800 (PST)
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
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794904592; x=1795509392; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=u/hxpfxH2Ygjpkkpn+gEQ4NFMpeA+YPAHTw9d0qdSc4=;
        b=aLL2x3Cd72yC9y5Yyka9sJtbPkd5GQqCoxfH6sUO8kvh+KeDzhizcWwe8DUu1tAkyg
         v+7c9UvS2OZfrzSZAv1+H47ZUERb1PcEYfrX1utjT7XH/LEswmFnH4UdBulxumBCtcgT
         HFJ5H5pCAh8KusmxymeVQAUFUWklZmkRW01vhVuCcZTJo9YeHIQED1Sr5kFWZ63hs0J+
         lkWryrRuqlDWvmeDWs+3LOpJ78HqSkhDpAIDfhqJwOObefbq0MDwlNMQ2w15A7s578Lb
         9jhubJjmjnAozeWJIcJsY5yEqJ4r1AlsZ2lKvhYFFcnlsRbPbqd+MpWetkxAa9Gq8QJR
         Pgjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904592; x=1795509392;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u/hxpfxH2Ygjpkkpn+gEQ4NFMpeA+YPAHTw9d0qdSc4=;
        b=0LnxlD+8ct2jWA3tNBtRW1xnKAIDcrvtVtx3yocGOvdZ0CHsTzhiJZQW0O2sXIM4LU
         WSHW0bQfx/ULQ+iXqv5jM+JhXbNdtUbH9pIoaZJnFJKtNAU/C1RVoFGxmRgGRzrcxynW
         hFa83mrR/Cmr5qO2qKlOXAWQGotMyyA3gwCogdobEiRcvKow0wmPqUg2w8V6v9mgzL6V
         Q7F2s1el1mGj5kPN4JMbcKQK7v7o2ddkGUtb9PbMT7PB5Y56Bzx6tPLCriEHnOuJZp+C
         X8MQdz7EWXV4MzHugyFKCdUOckSNpsyQ+4nVY8sHfIqmmjd2s+14+/xG60LNr1bnzGaA
         5/QQ==
X-Forwarded-Encrypted: i=1; AL+hErEGMl0hYG7nRgbXouJxLF/Zivs5Boiieu6oXd5fccVOxqxsd9T0qS3WRtPtxZan/qKYqvQChlX3O2k=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8MMOkoyt2Da383bJu+9IddLZ2jqwqrubOFxnSd3Ki36gcTCY9Y
	Q/rrwVUTRANmgVtz32Fr7uxam9dAB8bpZ+YoGXvy1QUsDRA2TRubagbuXfhjD8JLZbEF
X-Gm-Gg: AYBFou1tCcRPMKg6SxeZI9uJB/t0Z0C7WH5f8n98sLdk2TbCtbfQG0sqhLOVJH+lCR9
	8sKc9vpnFPDzLWfTvGtcjavWR87f+oJb1aLKLx8bqH/c/r9d3MQabJ2NTYBsKk0JZHihC1V3oxu
	pCiR8oV8YciYV/wd4fXjENDj2zlJfi3uK4ibsJ8WGHVXvPArmPMJ6cc6qMLe2pTNpNAbJ5UZzHy
	oNW48OCMzS9HpV1qjeJv93+vH/aZUGDSoB1jJKIAnks0Bj6ZwJ4ryfCuVtdf2qLkO3wESjtjKU9
	5YOayPH7bQR81vJLDDNkUCqZQEZWIoZqLmHFUZroMthPkWmCa+gWhquWtkBkdYAoiH0zvF08ucZ
	We8eQosWqz2py/ODltcn8SBEk6qiNo901iajQeo31l1S5jEGLU7M4oeWexvzs8co/kyJdIRMMk6
	3fJzE5y6ghtTa16KNq54LvDnoQimjL9Uk9rhkNNHhwGhrTqi5JlYuU5tb1rzP23KKVlsfO6aS/b
	ZoGHztlHHzsQ8xoIoIwFy+OJrnYlqKJ4diWEJSP6XROXXQU+JcevaKwrTeEiZUU7m//A6zLg2NE
	o3balMW6QZn36FGJ0viOczI34qNGoa7KbO50mUTCB59Ev0crY0vWYfqltfNFvUArmVHB8Isid59
	XrtWwOjjUpPMYKjNtfjZRih4n3KVAx2TDCvUU4xbL6PakHmppLQD/rIYi
X-Received: by 2002:a05:600c:1f90:b0:4a7:76fa:87e9 with SMTP id 5b1f17b1804b1-4bb55ab281bmr266345525e9.21.1794904592167;
        Tue, 17 Nov 2026 00:36:32 -0800 (PST)
Message-ID: <411502f9a4f940c223b2b88d7e19fafdce63172e.camel@amutable.com>
Subject: Re: [PATCH RFC v3 29/44] s390/hypfs: use fc_init_pseudo()
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
Date: Tue, 17 Nov 2026 09:36:30 +0100
In-Reply-To: <20261116-work-loop-pseudo-v3-29-8cbbea1cf34f@kernel.org>
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org>
	 <20261116-work-loop-pseudo-v3-29-8cbbea1cf34f@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-purgate-ID: tlsNG-c201ff/1794904592-F60AA2A1-C81BE705/0/0
X-purgate-type: clean
X-purgate-size: 1147
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 2026-11-16 at 12:05 +0100, Christian Brauner wrote:
> Initialize hypfs as a pseudo filesystem. This raises SB_I_PSEUDO and
> also SB_I_NOEXEC and SB_I_NODEV. hypfs never holds executables or
> device nodes.
>=20

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
> =C2=A0arch/s390/hypfs/inode.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/arch/s390/hypfs/inode.c b/arch/s390/hypfs/inode.c
> index 559b011e68800..8662169de477a 100644
> --- a/arch/s390/hypfs/inode.c
> +++ b/arch/s390/hypfs/inode.c
> @@ -12,6 +12,7 @@
> =C2=A0#include <linux/errno.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/fs_parser.h>
> =C2=A0#include <linux/namei.h>
> =C2=A0#include <linux/vfs.h>
> @@ -301,6 +302,7 @@ static int hypfs_init_fs_context(struct
> fs_context *fc)
> =C2=A0	sbi->gid =3D current_gid();
> =C2=A0
> =C2=A0	fc->s_fs_info =3D sbi;
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &hypfs_context_ops;
> =C2=A0	return 0;
> =C2=A0}

