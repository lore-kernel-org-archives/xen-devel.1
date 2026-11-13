Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B914606A32A
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 10:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ceG1+Iah
Received: from list by lists.xenproject.org with outflank-mailman.1486989.1689531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRoGf-0006WG-Tg; Fri, 13 Nov 2026 10:12:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1486989.1689531; Fri, 13 Nov 2026 10:12:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRoGf-0006S1-9I; Fri, 13 Nov 2026 10:12:25 +0000
Received: by outflank-mailman (input) for mailman id 1486989;
 Fri, 13 Nov 2026 10:06:17 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <alex@amutable.com>) id 1xRoAj-0003U5-9P
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 10:06:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRoAi-002UQN-M8
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 11:06:16 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <alex@amutable.com>)
 id 6af6e102-8faa-0a2a0a5109dd-0a2a45049264-34
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 11:06:16 +0100
Received: from [209.85.208.47] (helo=mail-ed1-f47.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <alex@amutable.com>)
 id 6af6e118-b57f-0a2a45040019-d155d02fd9a9-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 11:06:16 +0100
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-6b56221d361so1538897a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 02:06:16 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com.
 [80.187.86.54]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b7c21b1b5asm706711a12.4.2026.11.13.02.06.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 02:06:15 -0800 (PST)
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
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564376; x=1795169176; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=oBVCWZMOabVq55k67Q8GIm9NBAOJHOxllLRlvncSbis=;
        b=ceG1+IahTmjdxg8lH/ygd3fLN/u0dOUr66MLCJm7od9R9CA6cX/nq680WI+vW7MMys
         4iDRC9HO3QUQAPuI4RyCEFpG6FbSghYuADGZfdc9/TYJVFqIym1XyOXjAPkauOR9qh8e
         UWafJWlbkUn4Ah0wPNdnPoLvE1bJ2uVUrxGSfLrqFura/bY9K+obq6dHlGaVPizS/+2i
         PCMC5nExaujPiy8rcJ6a0kYwz8j9IoFm1EWMDKrSRZFmiJu9L8RdRawgS4pbKCnIgDFk
         Faiex5pTd6kCNRwqKkZCX7MaHIAIX+ESW1rp67Kb9Ros5fEYusgrMPRrGoXU4EHiRcAG
         kVVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564376; x=1795169176;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oBVCWZMOabVq55k67Q8GIm9NBAOJHOxllLRlvncSbis=;
        b=bWtmOBN4Mw0CCnBpLgrE7f4GvsqxoJ9AZfmC+R5qgiu28ONsMZjRN3ojQpoFo2olms
         URwxLVDjs+eanX86+z1erlvcCxvKXU9Lqa8fTd5HqY3cVVx0XSz3DgJsPxR4hDqiymy3
         CATSTZelXccpH7b/fYGLxdoKz2XWV0kC+W174OD5yg4N0botYl0XvbCjXA1VXodtKBTG
         1D+2IuJRGk2h/wppX01MSW7NVmcVMFaOsKxl9sQwX8FXTEnlZZtWWn8bp6bTqcL/eQP+
         CI9oouEQ2Jb/McL+wlhvLtBIRsGsll2AMwyym8iny+L/YuuSzgkWyAThiuHQnG6KfiRF
         TT3Q==
X-Forwarded-Encrypted: i=1; AL+hErGAjZaZi7je6ASybRYiZqlHvnTsVkxdnFiTUf8HbqUZgC0hy19rGIolewf5Y7FRPzP+E1ZZX2XOmfY=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/RWcXsk+eaH+fLFvI35hbkfq9c+3evdTde5yLOtc/HHknSRJEV
	tR9nO2YBfFSXE1IUH+xV+wOxTRkIoKSoJNV+1f67TfaCPpDY67qPMocXJlA223xiHXDV
X-Gm-Gg: AYBFou1w8lso2IEy6ps/i56DWkjNmyvAiS5YLg4JkNP3JvCrmXi0PzhvZaMtmqxSZPg
	AXQyvJq3LZL8dhbAlL+OM2etbRm4RMgre16EGWHW5+VxmcEUvnYNmUA0jxui+LHGY+Yl0sTJ4ZL
	KJw2qvg8t/D6EuvhOSL+tc1flkvr+nS0DSb3/5alUsnxxZrlfjlX7CDQjjGI+Tz48JpBgLl93j/
	XP+pYSikGV0dNfsz7SZt6q5qml9y2T1+K6R4frZl9a59fCBE3Ce2uLNxSCMJ1eJETgnTWPozwvR
	LNl9LyMQsQVcHY1L8pJB3L3lOpvp/0Grrdez0m0OiZoeDRoEDlNSUiLd2V6i6I5bgO49OpEUR92
	VjRCua5gcf3R8jfdlZ9j77jaaqJXylW016XzEr6dVAP91VeOTNAF/XtvdWEZTyQDWYXkFKCM6mb
	F824em4/l1grxOredyTUd3z6dYLKhPkE5hSAQk4IeLyiU3V2qT8caPsLsIblGoxyz/uYlnHP9mQ
	gnjTo/e9Bm7tGvi6y4scRqAiJPCfKljGkVXnqzAXFT1RK69KzCWNNckXfZD6pkxnTm+o+1v8t5X
	A1+iiGWOxtOfQM23NbxcjPrzLoaQqzdoa4k9oGgYrmUDWSM2z8WIRCFjAvX4mlY=
X-Received: by 2002:a05:6402:280d:b0:6b6:4dcd:967e with SMTP id 4fb4d7f45d1cf-6b7c0bbc394mr1685420a12.20.1794564376161;
        Fri, 13 Nov 2026 02:06:16 -0800 (PST)
Message-ID: <4dfa19dd41ec1a202182284d9617926a259288a7.camel@amutable.com>
Subject: Re: [PATCH RFC 16/41] configfs: use fc_init_pseudo()
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
Date: Fri, 13 Nov 2026 11:06:14 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-16-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-16-4c998976c6c7@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-purgate-ID: tlsNG-ebf023/1794564376-538C1B50-70F5578A/0/0
X-purgate-type: clean
X-purgate-size: 1160
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 2026-11-10 at 10:14 +0100, Christian Brauner wrote:
> Initialize configfs as a pseudo filesystem. This raises SB_I_PSEUDO
> and
> also SB_I_NOEXEC and SB_I_NODEV. configfs never holds executables or
> device nodes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0fs/configfs/mount.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/fs/configfs/mount.c b/fs/configfs/mount.c
> index d8cac1cbf3bd..60ba24e7ae2b 100644
> --- a/fs/configfs/mount.c
> +++ b/fs/configfs/mount.c
> @@ -13,6 +13,7 @@
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/mount.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/pagemap.h>
> =C2=A0#include <linux/init.h>
> =C2=A0#include <linux/slab.h>
> @@ -106,6 +107,7 @@ static const struct fs_context_operations
> configfs_context_ops =3D {
> =C2=A0
> =C2=A0static int configfs_init_fs_context(struct fs_context *fc)
> =C2=A0{
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &configfs_context_ops;
> =C2=A0	return 0;
> =C2=A0}

