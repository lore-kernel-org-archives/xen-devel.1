Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23926606A8AD
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 10:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=WaBQogdc
Received: from list by lists.xenproject.org with outflank-mailman.1487017.1689583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRoHx-0000y0-FB; Fri, 13 Nov 2026 10:13:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487017.1689583; Fri, 13 Nov 2026 10:13:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRoHx-0000xs-Ag; Fri, 13 Nov 2026 10:13:45 +0000
Received: by outflank-mailman (input) for mailman id 1487017;
 Fri, 13 Nov 2026 10:13:43 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <alex@amutable.com>) id 1xRoHv-0000x2-Jk
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 10:13:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRoHv-003Fqv-0X
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 11:13:43 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <alex@amutable.com>)
 id 6af6e2cc-e002-0a2a0a5209dd-0a2a45099988-28
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 11:13:42 +0100
Received: from [209.85.208.51] (helo=mail-ed1-f51.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <alex@amutable.com>)
 id 6af6e2d6-be1a-0a2a45090019-d155d033b45c-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 11:13:42 +0100
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-6b757029223so1116385a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 02:13:42 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com.
 [80.187.86.54]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c603f4d29sm4332158f8f.35.2026.11.13.02.13.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 02:13:42 -0800 (PST)
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
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564822; x=1795169622; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ycFr7tcHP3BtNSevVHScuCcUOF/OuOrXOdu+rsUd7U8=;
        b=WaBQogdc3CUKMpYpQrFTTjXPi6scjqs4d7IBuRLdKcbKqdSzcU8XmwSAPDt861LWcg
         GKJGnzjc2/E6S2FBrAkIDzYCYNapLFct97w/CR6F67lnLe+Dqbi2awEcimgNw4Jt+i+/
         OhtJQ15snRonGUdsObGwxjsmbaWG3navikRUzNNWu8cvysPaC/PnpTdww5iioCSiGpJ/
         XZ1AbpNLG6LUgCjo6yOSeQuFRgQoTUUM8AEAmJ+xpiOo4UR7sPdUrdC9DcVt8xFjaJfJ
         9P3haYgYzyRyeElKnYn9QSMtnbJb1RtYwN0WUn5OuOwhXRfXg9LMTLNoM/Ij7NY6QLrW
         n7vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564822; x=1795169622;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ycFr7tcHP3BtNSevVHScuCcUOF/OuOrXOdu+rsUd7U8=;
        b=nbORTew2gKx+lYACmVIK4GVGohqJdhZqVlsy4kkq6PuV9BRQHzNLjBAJn2mMR0ZjjJ
         bEq+hyrB9OeqVI3tpFBowb7+Tae1B2rjEdzIpqhG8TtnpDgAmf5Qwh/e1N+ZsIpC6WRs
         NTp4ogLjkr3MQI8r7Dxwhs/ldtY/fn8IePAJmKOij4XsO/WPJZ/vB42CvKIkc6OeoUW2
         9dKrITHC97fzsHSCnfLw+btlO3oZ06nVb1xuuYQlztSVgdzy31B/dT3NZNUrJesEVsuz
         r/nu/6yc403D45p/ivlSWjf9+dIBy1B68T7FEf3DJG+E8tRmWrlAdPLaBMZJmymBCJic
         z3iQ==
X-Forwarded-Encrypted: i=1; AL+hErGBircrBrXx5WWLbWaCV+mJ0luwM9764v0269J5ceKYMPSc7LM460vlPFofBnioYQPpxtwFEdeaBnk=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8gk8Fuh1xYmSy1OxNnJX3PmX9GUkIidcfgnXg2OLdn054wONPT
	ohlDg/EssYakH+BTMZim6cG8U59rwOytqqdU0P+V3o+Yxe4RPCSSGCmuP0VRRJ6+qWcN
X-Gm-Gg: AYBFou1Ow2nVegmhYcpLoU4QDL0XUQCnho6IPsa5Ro6aJP03Hppn6mfFS3Tb8glxVuO
	qYOyjGmJGsj0jPV5IbW5Hirxlkqg5vXCrzRLrLlPdEUcvTgvDCwoUolL9NCBSGv5G9VC6qt+A2a
	n43mGV8eu3O4Qpyx3+8ZuKS9xQpE1eltafGDSUKHASAMrJlGJesqahCIE/hTr7Z0iZBjBM/ZEiz
	oZS7G9QroVm5bY8rEPf5QA073r/EjA1XyUqTPNzLADQINDozSuY/8wM0PkxLLIOu/rcume2gVzG
	aM+ZwHHifgrcISiR8HwqHXMtUh8iV6639ks4xfaSAe7QyIUECwklF2JMSpK3F+6jZHsxjv2Kb/v
	s+5HUslhB2pmqz1X1786PkLT5HS1sATJ313OlAyZuTJr2MK3H80Dj90FbLIfcxU5INV9PYrwdQN
	T/bYt4Z5jchvT1qmOPDZKXUIBN4b6o32IvJtk5VAY3prfIuE7DxFXXirQwaW5EvCyhcOZtBX4JG
	ihrrTCWYCth4okVtKZKplnHookuSzXT+u+XEEIY0v3YKU+lbVGbWbwiFxdMNGsUb9N9urO+Dc6X
	Y4Qh+PGMX/GvwpYdKIQlmSyZxt/WyBC2bbNHrh6hXjqeZCmKgYFELBDdXV2IWwzGTJ6O/fjCYA3
	Zpn9ED1oj
X-Received: by 2002:a05:6402:208c:20b0:6b5:69f4:e7ce with SMTP id 4fb4d7f45d1cf-6b7c0c62bacmr1415990a12.39.1794564822367;
        Fri, 13 Nov 2026 02:13:42 -0800 (PST)
Message-ID: <3546dd28b1d63c1478d391a2015fff4c1b976639.camel@amutable.com>
Subject: Re: [PATCH RFC 24/41] efivarfs: use fc_init_pseudo()
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
Date: Fri, 13 Nov 2026 11:13:40 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-24-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-24-4c998976c6c7@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-purgate-ID: tlsNG-bad1c0/1794564822-3BCD7034-41578150/0/0
X-purgate-type: clean
X-purgate-size: 1114
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 2026-11-10 at 10:14 +0100, Christian Brauner wrote:
> Initialize efivarfs as a pseudo filesystem. This raises SB_I_PSEUDO
> and
> also SB_I_NOEXEC and SB_I_NODEV. efivarfs never holds executables or
> device nodes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0fs/efivarfs/super.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/fs/efivarfs/super.c b/fs/efivarfs/super.c
> index 12746ced6dc6..e598d42c5f42 100644
> --- a/fs/efivarfs/super.c
> +++ b/fs/efivarfs/super.c
> @@ -8,6 +8,7 @@
> =C2=A0#include <linux/efi.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/fs_parser.h>
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/pagemap.h>
> @@ -554,6 +555,7 @@ static int efivarfs_init_fs_context(struct
> fs_context *fc)
> =C2=A0	}
> =C2=A0
> =C2=A0	fc->s_fs_info =3D sfi;
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &efivarfs_context_ops;
> =C2=A0
> =C2=A0	return 0;

