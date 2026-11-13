Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F8B606B12F
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 10:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=hlZm1rKC
Received: from list by lists.xenproject.org with outflank-mailman.1487111.1689645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRoLy-0005xK-Dg; Fri, 13 Nov 2026 10:17:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487111.1689645; Fri, 13 Nov 2026 10:17:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRoLy-0005xB-AB; Fri, 13 Nov 2026 10:17:54 +0000
Received: by outflank-mailman (input) for mailman id 1487111;
 Fri, 13 Nov 2026 10:17:53 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <alex@amutable.com>) id 1xRoLx-0005wo-24
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 10:17:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRoLw-004bna-F6
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 11:17:52 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <alex@amutable.com>)
 id 6af6e3c4-bab6-0a2a0a5309dd-0a2a4508c5c6-40
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 11:17:52 +0100
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <alex@amutable.com>)
 id 6af6e3d0-f659-0a2a45080019-d1558032f094-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 11:17:52 +0100
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4a35d5d4a20so13807615e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 02:17:52 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com.
 [80.187.86.54]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c7da37b19sm3937770f8f.5.2026.11.13.02.17.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 02:17:51 -0800 (PST)
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
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794565072; x=1795169872; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zqPqkCGOaO5RL/5NE1UeXRxAO7AqEHmUDDsiHSGxDsA=;
        b=hlZm1rKCzkJmMvwLl5dOVO79uZFzPa7ZaWPlVbp1TF+freINcMnly6npF6lnrWyeId
         DKznxNYcsX7bFczy9S3t/f8AnD5k21uUa4nflwOGHVeD7WQ/UyL+w1O/nM5MnySa/c8z
         e/edVaqSm12Cz2IAmtGcmPMp3lr6il3QT6JULUETQb2EKl2VvYBVQ59LWv8tyUw7N7o1
         Cgqpe8/Xs1sNeDU3Td6PR+KcoUJuVlA7KfkXb4bMaD8QsCABClmlYtGN05a62Q5z7QSs
         tW0ADV+sNpa58saxmvaxEOmH2sCEoynGmaNb8C/4fZq7Xo7oc6INYiZMYGA3862ihDLm
         8ECQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794565072; x=1795169872;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zqPqkCGOaO5RL/5NE1UeXRxAO7AqEHmUDDsiHSGxDsA=;
        b=yZAGYqteQxFJMDYsdxjtUKZoCrTzJQs459RSKM/PaBNs0BBwaxFl8i2YPO17ALwYX1
         4nVUeziJOzTZJ3sVEh6HnZw1pqpCHblG9nQWwmxOWYbCoI/W/tNyU9zoWpL1BaowNG5+
         yFV7TICCtQHhJ8yL5KCZKsj14I2zpCEuSIhO+YliBIqmIy0ADRwwPTQkiYJumgxxYEgI
         K7iSHpGiz0byTM3B+8LuIZPsxU+2OxuSPQFLxFcCVT+snDAoafJ9PodqO/t6O9XgOKLi
         CUYgQekB4EjV7NAUMbN77M7HY2vL+9z19ZYuRktvi1770rL0kfNBxj6P7/zNYXIJBxpe
         nmtQ==
X-Forwarded-Encrypted: i=1; AL+hErFdZNetEEdcssHBsyY0OCtEqHsLvJC6NgKg1XYghEOj/EKZtIox703Y1WszPcjGKFJCuiQLQWXUPHo=@lists.xenproject.org
X-Gm-Message-State: APuU4Z812lKDn+4gUb+bN0pNt25ivGJBrr23vk3NdEuwYhqrjEvesekq
	uSrBcx7P98z3eXBJq3YuHkmiluLNdwf8j14t2G7bjn3sYUImeIc+SaSFuuh6M/+NzH24
X-Gm-Gg: AYBFou22TejX0h/8ZN0wu0PfWWxsfukEVoNhF9sKOk3nqYWIW+7CayKceOAhlgBJpav
	gDXDsuFiEHe6FqoAj2ErIjAWqPEVbZq79RyrpBoZavPT2kK3ce+nS/udaFX66SLzYSsiHrx/N0D
	uYqjzsWKZClBeLA4y7lF6pKVq/R11EaFxkMJAYN00baO5ZysohRa4xlow9AqNMDXv5TMxmYte3O
	H9QPPZSgcgtm1H9839huG/FxFH+Y/lYtnF7Fcf8Dr612GA9mGJyIq0vxvOE5JDIl8d+KbB2CLVH
	WSVHtHrPU00h1N6zVcCYhyGZDyWQ079FrjXyBhiCjpgo+cdmjlnOFddPgkXoYVwzssETzCoi73V
	0hAn5iAOa/bpPxbZBiaaq0DG3ATcerVF1lbkGztrDWX18dvcBL3WRl9OATO2oSl4+aa0AkK7e2h
	/I06H+yJAABDZiIw4TZw1/FCoWMQEwF4tiqzmIqrTvS2fiiR/tLIwPHh1lbgIdQqkp5r4dHC2bR
	q/eUhy90/dtbhulDtz94hL95Cliq9aDvdyLzAoO6HfwbxuBRhFN9VvO48DNpU2owXFrYoNTG6ns
	yIQJyTeCsDITeZ6nsLR3C1i62nGMKlkKNiMBML3Vq3jBwxtacJHUDijg4BVUOg8=
X-Received: by 2002:a05:600c:45d4:b0:4a0:23f:8b0d with SMTP id 5b1f17b1804b1-4bb559f6f31mr43851425e9.2.1794565071804;
        Fri, 13 Nov 2026 02:17:51 -0800 (PST)
Message-ID: <7cde6f3091f9d90593e4a6441723b6b889cc4024.camel@amutable.com>
Subject: Re: [PATCH RFC 35/41] zloop: refuse zone files on pseudo filesystems
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
Date: Fri, 13 Nov 2026 11:17:48 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-35-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-35-4c998976c6c7@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-purgate-ID: tlsNG-c1860d/1794565072-D735D87B-EFF58BA2/0/0
X-purgate-type: clean
X-purgate-size: 1035
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 2026-11-10 at 10:14 +0100, Christian Brauner wrote:
> zloop opens its zone files by name below the base directory but a
> bind
> mount can put any file there, including a procfs or sysfs file.
> Refuse
> files on pseudo filesystems as zone files just like loop does.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0drivers/block/zloop.c | 5 +++++
> =C2=A01 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/block/zloop.c b/drivers/block/zloop.c
> index 65634a39b0bf..dcc06dd47b04 100644
> --- a/drivers/block/zloop.c
> +++ b/drivers/block/zloop.c
> @@ -1137,6 +1137,11 @@ static int zloop_init_zone(struct zloop_device
> *zlo, struct zloop_options *opts,
> =C2=A0		goto out_fput;
> =C2=A0	}
> =C2=A0
> +	if (file_is_pseudo(zone->file)) {
> +		ret =3D -EINVAL;
> +		goto out_fput;
> +	}
> +
> =C2=A0	if (zlo->block_size) {
> =C2=A0		ret =3D zloop_get_block_size(zlo, zone);
> =C2=A0		if (ret)

