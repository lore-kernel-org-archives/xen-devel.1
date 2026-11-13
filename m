Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51045606A898
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 10:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=LnxZxVdZ
Received: from list by lists.xenproject.org with outflank-mailman.1486940.1689455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRoGa-00059C-U4; Fri, 13 Nov 2026 10:12:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1486940.1689455; Fri, 13 Nov 2026 10:12:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRoGa-000595-RU; Fri, 13 Nov 2026 10:12:20 +0000
Received: by outflank-mailman (input) for mailman id 1486940;
 Fri, 13 Nov 2026 09:55:00 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <alex@amutable.com>) id 1xRnzn-0001LU-VV
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 09:55:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRnzn-003CWP-Al
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 10:54:59 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <alex@amutable.com>)
 id 6af6de65-8faa-0a2a0a5109dd-0a2a450395fa-28
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 10:54:59 +0100
Received: from [209.85.208.48] (helo=mail-ed1-f48.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <alex@amutable.com>)
 id 6af6de72-fae8-0a2a45030019-d155d030e4c7-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 10:54:59 +0100
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-6b2237b596cso1754432a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 01:54:59 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com.
 [80.187.86.54]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c50957c6c1fsm75151566b.0.2026.11.13.01.54.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 01:54:58 -0800 (PST)
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
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794563698; x=1795168498; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=G8DmFU4pJwAPCJlqHBF8SKasEEThxtJNlC1sg/CSkLw=;
        b=LnxZxVdZCg4pT+RnCHVueVsMAgBP/R1sfnoJ9akn/VoG48hzkUQQSVVWkacZLBwoFR
         CjXLb241VGehpz5g1FPMS/2n+u77QtZa4JfTafuIr3d1RHx+EoOEKLKS5rDiPgBM0tuw
         tQaZQL52iUUHSiV3IxPwp8drOQBF3fYgIRYXBpRcyMH7bgF4wm1ARdAHeEevx6fLgXFI
         /Gi5j19iNEES0bGI6BzEd0wGDRrOvoHAFS1oSePqNF9OYeU1+d0V7SO0KLd9D41fJj88
         LuB9zUfNoMTvE+UDTRuzV5zGI/x5dCv3oCioqUJ0ZDzf5I4l/t6c1LHONE63oFDDEIeV
         1e6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794563698; x=1795168498;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G8DmFU4pJwAPCJlqHBF8SKasEEThxtJNlC1sg/CSkLw=;
        b=pQNVG2vt6hGx2T4ftaThHS9ZNCPKMgTBlR9H0YziDhcRCEt8ix+apWjFJJhW1lvycr
         lPWYvMDvKmbNL8xSpMZoM3Vwq+rYhH9pK0/LJnN7QBRkLkYQHUoBOCNG39+Ht0+9LZhM
         BCMUBqV/jcb8Fzan8RB7Y8q1jPmnFbicKsLZDByYZf2yX14FRSIlgCyXTttYnvp1b70b
         Itfsj7Q06svRPG76v2EwZ5Q4F+5STZBlZYUbebw8GdF888v3RsA46h7fPNBioUqDZDoe
         tyzb/NIya/MwOX0ogpv4Dx3JKcGEGK+KbkFCmrZunrr7MBe0ICN72Eae1G09w/2VXu0W
         wM4w==
X-Forwarded-Encrypted: i=1; AL+hErE5yFIFOIw+z6wFq4AxnHonZ7CWdbS/DFGuo9ZS/AX7xpT7BYOoIFFXhHhmDjXjt3RmAvJYI60OMmQ=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8EHO6uaSq8BGGtLhxGoF02AtO/9nTND6p0mhmxDXASbsVlobbV
	KjOcf+i5bgJW5XnLROVjJ9z43UExQY4hdyTQGrwK4IZaV5PPiZIvCOa9vhtsL75+68MF
X-Gm-Gg: AYBFou1NaywgU0ATN96jPWtpmNZ5pVhNdCA5Tq4wBLq/w6HwnNr8lEwyxjAofwKjnJy
	g5n8V2K6u4EYrMxaeirgEn48RqRLLvramH80KMyPLId0pkxelFjvcLi+/BMmx5KSYy6wMs30eWp
	OLV6bHgwYAnIB+05neudAGuXLW4JLjRpWmCr1xE1de+CIdJlNtLgpiATimcFEuDeRSE+Ve3eAE0
	cr1UyD+cJJnPN9kbFkxaQeGLOkU/tXEk6nmrlJoE4ar7CxSnhEYENkvLAIV3055RWdtmbKr+Eiz
	BN0ZR2jjdtBsezQKbZ+JrWWQgzVSsauSxlO6rWDrkXTB9DXFDUAEoAPRqA874WyaaZbm6YP/Z6m
	sxQ6AS4kKH5E9Y9DhcTrJ/17fLI5AIpdgLWPol45ofhRv+6gOVvZtWdVBLju2iFaKTTCPvGrWr5
	+t9azvYMqLTzkxmqMRdew45d+0ZAJgV5UsJyX4ZRiNUBAIqpa6+IxL56NsmH9IeRDN9QxEw7lJA
	NOKqJufjwYcEZzIVvUzpzYJArN2ykGcRFId9DfDr+eAPTlyvJ5i4LAoBEia+dC3dLsvLd6vnwtZ
	AKsqaS1JkEtltRMJnXJ6o7HrrKX2inD+InxUhwiq05mDUA5DhnHhVRlu3zcGIFk=
X-Received: by 2002:a17:907:ea93:b0:c41:4c20:5a80 with SMTP id a640c23a62f3a-c50963bdb9bmr198299566b.44.1794563698514;
        Fri, 13 Nov 2026 01:54:58 -0800 (PST)
Message-ID: <b42c9f4d29a9cbea66929c95cc8f736f12703c72.camel@amutable.com>
Subject: Re: [PATCH RFC 01/41] loop: refuse backing files that aren't open
 for reading
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
 linux-kselftest@vger.kernel.org, 	stable@vger.kernel.org
Date: Fri, 13 Nov 2026 10:54:56 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-1-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-1-4c998976c6c7@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-purgate-ID: tlsNG-33051d/1794563699-77CC34E9-BD84D569/0/0
X-purgate-type: clean
X-purgate-size: 1954
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 2026-11-10 at 10:14 +0100, Christian Brauner wrote:
> loop_configure() takes any file as long as it implements -
> >read_iter().
> Loop itself never checked whether the file was actually opened for
> reading. Buffered I/O went through vfs_iter_read() which refuses
> files
> without FMODE_READ. Direct I/O has called ->read_iter() of the
> backing
> file directly ever since loop grew support for it.
>=20
> Since commit f2fed441c69b ("loop: stop using vfs_iter_{read,write}
> for
> buffered I/O") buffered I/O calls ->read_iter() directly as well.
> That
> commit was about O_DIRECT handling and the FMODE_READ check went away
> as a side effect.
>=20
> So whoever can set up a loop device can read a file it was only
> allowed
> to open for writing. Open the file O_WRONLY, configure a loop device
> with it and read the contents through the loop device.
>=20
> Refuse backing files that aren't open for reading. Loop always reads
> from its backing file so a write-only backing file never made sense
> in
> the first place.
>=20
> Fixes: bc07c10a3603 ("block: loop: support DIO & AIO")
> Fixes: f2fed441c69b ("loop: stop using vfs_iter_{read,write} for
> buffered I/O")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0drivers/block/loop.c | 3 +++
> =C2=A01 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/block/loop.c b/drivers/block/loop.c
> index a3325ceab484..c96e35c3ef42 100644
> --- a/drivers/block/loop.c
> +++ b/drivers/block/loop.c
> @@ -528,6 +528,9 @@ static void loop_assign_backing_file(struct
> loop_device *lo, struct file *file)
> =C2=A0
> =C2=A0static int loop_check_backing_file(struct file *file)
> =C2=A0{
> +	if (!(file->f_mode & FMODE_READ))
> +		return -EBADF;
> +
> =C2=A0	if (!file->f_op->read_iter)
> =C2=A0		return -EINVAL;
> =C2=A0

