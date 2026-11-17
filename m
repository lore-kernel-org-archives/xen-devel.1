Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695A9606A323
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 08:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=IiDxdabs
Received: from list by lists.xenproject.org with outflank-mailman.1491966.1692655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTEWe-0001Zj-23; Tue, 17 Nov 2026 08:26:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1491966.1692655; Tue, 17 Nov 2026 08:26:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTEWd-0001Zc-VX; Tue, 17 Nov 2026 08:26:47 +0000
Received: by outflank-mailman (input) for mailman id 1491966;
 Tue, 17 Nov 2026 08:26:46 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <alex@amutable.com>) id 1xTEWc-0001ZK-JP
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 08:26:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTEWb-003b9x-Vf
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 09:26:45 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <alex@amutable.com>)
 id 6afc0fc4-bab6-0a2a0a5309dd-0a2a4505a81a-8
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 09:26:45 +0100
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <alex@amutable.com>)
 id 6afc0fc5-4cb1-0a2a45050019-d155dd34bc7b-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 09:26:45 +0100
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-4a358881793so374285f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 00:26:45 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:de4c:6789:33ce:97c2?
 (p200300cf572c2800de4c678933ce97c2.dip0.t-ipconnect.de.
 [2003:cf:572c:2800:de4c:6789:33ce:97c2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4a4de4cb1c3sm977858f8f.8.2026.11.17.00.26.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2026 00:26:44 -0800 (PST)
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
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794904004; x=1795508804; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zuUcsMvbqw5dxN0Fzu67367bPJAUtTqv88LLlRQCTVU=;
        b=IiDxdabsPtMdVfQY4g6PZi9D2I9L6y+xaHcJL3lQFCRD5HeUvnJMWKNETVa897KMjI
         3EWX7WCDGUk9Yi3Wa3QSICHRnfLDsc28uhZ1tUpA6KUp9cc44mPUFZilzy+NcrhGMHLV
         /j55N65pZeFz8TSLLUiVdGv6bfRJnqfU85c4xTgXFWsDlIoON3gkPlrpwm03W8BikJwh
         LnSch0kx+bJcjMJjl2KdPUj8JW4PLr+YAwchD8SK5EB3sOybCOWYLvYC8YoSDNtOew+y
         0vSElMjSNC/g86oSYL/fmHSiCpZfl9kEECwL9h7vJWX2lFwi0UwtE1AGG2UybyYNBn2w
         C0lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904004; x=1795508804;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zuUcsMvbqw5dxN0Fzu67367bPJAUtTqv88LLlRQCTVU=;
        b=x9aUfct1k9hTIq+23jBhcnqbqheq1EzwElNUka2f7LETRm2mDwK4AS7nd15vZI3vYm
         WWbaDhCWIwp1S0fR5aak8cl7CCMD3zPSyn5IerwMbd6rESfNsK6Vb6YfEEIsPqfytk5s
         m2jzGdSAFFUx/3nRgiS1FDq+3qMJ6qOebXrxhFUH46gI4jR2SXPLApgQ4D9FuNwop+Tr
         JSyWqfTM2VxBk6K8SMl9CtdnfeKqQZit2nnKR+o5nkHSClkLOt7BAnO4ef6EV81NUhV6
         1zZIulQXLv5Rh4ppRnFjGUW35L+RpOhT+8z8TEpxduFksUMcNr+p3R+g4LbXDtNAKr8G
         i5oA==
X-Forwarded-Encrypted: i=1; AL+hErF6A9OfmEn0wAJlN2zhsavsngrx9rpLwWplZ0CZm7dxWAg2eppSsJIfTJGqQ6Yp8Ojn77pBuTI0LVI=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8suxyLAoWVHW2HwTb5FJfl9D6O2EYEJS6PGvPjqLOc2J/5PZ0t
	eJgVph2+u6YikSUNJJ+mjseS0dzX24TjVka90olftWarpDCLTwW1eafK2iCEUSmbTxHj
X-Gm-Gg: AZFdTZe1/7xmEHIBmJogTrlMoy5WS1Pkx0BkeMkrKogX4qEHz5gOsnWtxn82Ig/6F7X
	mdHTWSPR+3olZWFBk7lzOiPAohbTamSaEGoS1sm8bpee7f6cWUblcXFhth9/w3W0EvB7+dqvTtc
	29j9juzAOrrLRn3SHm/ANZ0yqhqdyYaas8Y9AiNORiHIxv1y3oZP1dkBSNNdFBFNWER4zjUhqNt
	X1Rq9v8deef4ctnMiPQSH+8CA/ZHQi2xbeGyujNiZRT5I6QNno/Tn4CwTF+oSqM489uV89ZpJt4
	IHvq+M594E+Y85iefzPksOy2mQ9OpvizQ0YMQ8zOqJ3uvCijiS/ImGexUi6NLF2FXgcwi/CqSMH
	4Gnd50caPG29XvD8jO9mTAbHpwizBtQgaR/vbkp7RKDGKbg7lNg0UulzAMV7XGAAxNd3po6NngK
	UqgnKrQMU1J+BcoZsG9ptEHxOJb6waqbzeGZorL7tpE4xGq0s7xA+RKuRLiRXILXjzPHb+vANIt
	OWYgNpLZ4dOXLG7w4ggWvabcuasoMyjiRp1dlEVX0+m42Rv/BjnCCwG95AlbgdmtXPrkI3zs+Fi
	nHXh/11U7CuvinN5m0YDz1mY0zw5iXX0akByerY5haPkopxRL9BMU3yFRu6CEGuDsaaiX3J7kTK
	J3zfhsWdaGU7d03tNGJSmrG/LwfSMG/DY4kJHoTFSMRiZo65vYjVgknB0
X-Received: by 2002:a05:6000:2009:b0:4a5:2e5b:51c2 with SMTP id ffacd0b85a97d-4a52e6a947bmr243585f8f.29.1794904004601;
        Tue, 17 Nov 2026 00:26:44 -0800 (PST)
Message-ID: <c43d70badf41f62f8e149ac024bab3df979fa756.camel@amutable.com>
Subject: Re: [PATCH RFC v3 11/44] failfs: use fc_init_pseudo()
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
Date: Tue, 17 Nov 2026 09:26:42 +0100
In-Reply-To: <20261116-work-loop-pseudo-v3-11-8cbbea1cf34f@kernel.org>
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org>
	 <20261116-work-loop-pseudo-v3-11-8cbbea1cf34f@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-purgate-ID: tlsNG-c201ff/1794904005-73EB92A1-34293963/0/0
X-purgate-type: clean
X-purgate-size: 1267
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 2026-11-16 at 12:04 +0100, Christian Brauner wrote:
> Initialize failfs as a pseudo filesystem instead of raising
> SB_I_NOEXEC and SB_I_NODEV by hand. This adds SB_I_PSEUDO.
>=20
> Reviewed-by: Jan Kara <jack@suse.cz>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Chris Down <chris@chrisdown.name>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
> =C2=A0fs/failfs.c | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/fs/failfs.c b/fs/failfs.c
> index 437cdc981c2de..f03334f361c0e 100644
> --- a/fs/failfs.c
> +++ b/fs/failfs.c
> @@ -3,6 +3,7 @@
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs/super_types.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/fs_struct.h>
> =C2=A0#include <linux/magic.h>
> =C2=A0#include <linux/mount.h>
> @@ -132,7 +133,7 @@ static int failfs_init_fs_context(struct
> fs_context *fc)
> =C2=A0	fc->ops		=3D &failfs_context_ops;
> =C2=A0	fc->global	=3D true;
> =C2=A0	fc->sb_flags	|=3D SB_NOUSER;
> -	fc->s_iflags	|=3D SB_I_NOEXEC | SB_I_NODEV;
> +	fc_init_pseudo(fc);
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0

