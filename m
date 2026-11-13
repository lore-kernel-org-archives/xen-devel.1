Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D805606A327
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 10:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=YG20rx/O
Received: from list by lists.xenproject.org with outflank-mailman.1487088.1689636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRoLC-0005CE-41; Fri, 13 Nov 2026 10:17:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487088.1689636; Fri, 13 Nov 2026 10:17:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRoLC-0005C7-19; Fri, 13 Nov 2026 10:17:06 +0000
Received: by outflank-mailman (input) for mailman id 1487088;
 Fri, 13 Nov 2026 10:17:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <alex@amutable.com>) id 1xRoLA-0005B3-LV
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 10:17:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRoLA-00GqTK-28
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 11:17:04 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <alex@amutable.com>)
 id 6af6e39e-e002-0a2a0a5209dd-0a2a450be980-4
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 11:17:03 +0100
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <alex@amutable.com>)
 id 6af6e2af-b7e8-0a2a450b0019-d1558035cd95-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 11:13:03 +0100
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4a20bdaf39cso13116855e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 02:13:03 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com.
 [80.187.86.54]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb5d2872edsm4056955e9.12.2026.11.13.02.13.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 02:13:02 -0800 (PST)
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
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564783; x=1795169583; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PGZ86VpI4/X6bkLIqgY54HnsW6MSps296zHbeFwxlLU=;
        b=YG20rx/ONxAHGwZkT3OpOY07ZOOOeLjerGsdz7N9JtYPJMnp7/O3/CQKuNJE1d5LKM
         CcHSGJEBSltEwJuUsmsyYwNTXREhLLxN2rIFPRzXs8n4cI5iWOGp/SuC4ZJfMvjCWO0/
         ywwAQEv5oUwQ83vYHNoWP/WnbyJKaCG6jphOQus77rvJgQwAfO8ATYIKQAl1lH/+uEK8
         ay9eb3R74oJNzvXtXLR89MK7GHF9DFwO0eqUtjCvkrkEH5m8buU6IaqkknV+qusr38Aa
         YxdBwQPpugc1gwbupDRKgydDCqcPaXjQ9szZBAJpOLpSM+Y1SPy16T+qRdo+Pd0vOR6v
         22tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564783; x=1795169583;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PGZ86VpI4/X6bkLIqgY54HnsW6MSps296zHbeFwxlLU=;
        b=1tRNpsvVPka4eRhfuhpqiKpoJkbNRy14EoAznDCXlHM0hOTrQHI+WO/6k9wEJ2JZ+R
         maNrDOKbL+UQCn0XemXYiYUFyT7FPlYyd3CIRMntUVifLyxVC5lsrpAWMp9ja5lOezJL
         ER2YMap/AW0IJcsplMOyYATx8SajtBegP6Y9zaOJRK7YMAfYkWaQTV+GkorvWndySSvs
         oPxLG03QbOcsrWIsmBka1efSl/os1dJUbuJXJkXl5kw5jibwKhe7KSj2WVxg8rk4CzQ6
         PuSCvN+veXDT2A+2qQCafjHQM8psfqDJ7u9fYQXWH/bPRPUXzh6AIFwRIeEwe4fSP2u3
         lEwg==
X-Forwarded-Encrypted: i=1; AL+hErHSOrYK5bzgUa4pcr+m9o8FltC4TvodrPwjTztmIrf+19APvr8ZUwhF6ZqhOlKMX8wT5tciQpl3/is=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8HNKESKsZEzTrVqqJvNsRkUlSKI2JzppIevDQy6wcKcjUb4ZzN
	abXjA39R1Ld6XgAyqYZS08/e7Bt/LPbuE8UnJFo9PSAiqqzUOcrQdEKKNr3vJbiIsJIS
X-Gm-Gg: AYBFou1dbVPnaWEN4UaxZ6joYhWAy8+eS0WCIBFYKSWYtq1B4taqxj36d5z3A5CIG43
	QREz00SIVpD+3KkuBxdzvvXDBqN4d/T/bCx8K45cIaIE/A62Dq0mZHByEPa7uIaLdEum4vithpQ
	Wdg+iutg1K7lXbslLR4hbLsml2uaAuzcay605w5xg8cV/MHIbW11JI7frTah3yHRP2obmYyanxb
	j7raqHiRJKYK4oSX2FbQihTVSiTRb4FJCfEnoFbH6JMflCEENHnhco8Z3razfJ+P5uGCwPqJpKt
	EdWbwnodr1qSIHEJjISthRt5bJQxt6nWBBeqmpMgWngMlUDgK4MC+U84VK9KpzbjeAWhvcNHOnC
	Gge57NoIYHtC04fud8pcvC0jr2QiGBY1MKNCoGzPSQ9keaG2qz4sLUJsROfr22BqdmAcfRbXcnn
	DjCWsNrruY7PyUFmV2eEEghSMV/G0Ul+juMoWKq2UTz7LA9251idpzDr0wYVvDKhsi/dWUA76AA
	lw7xDyDt+d1Zz8Ode6OGGtG1f38o4Hl2oddMqbT8wtZhfmI7uVK8fpyU+CmxHAT4nNq/uCJeBrn
	Kt0If7j1ia5DZ7gv5OpOKTTAmEPXeOnqU71GYLWz0xZVhyVrRj3XTXpNRSe8ObtZ
X-Received: by 2002:a05:600c:4f90:b0:4b7:6c16:7b43 with SMTP id 5b1f17b1804b1-4bb55a47602mr36814615e9.10.1794564782834;
        Fri, 13 Nov 2026 02:13:02 -0800 (PST)
Message-ID: <94dfa5ec75f4479663dd79f3ce05c1dc6c080185.camel@amutable.com>
Subject: Re: [PATCH RFC 22/41] sunrpc: use fc_init_pseudo() for rpc_pipefs
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
Date: Fri, 13 Nov 2026 11:13:00 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-22-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-22-4c998976c6c7@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-purgate-ID: tlsNG-42698a/1794564783-AAAD89EA-C09F41D3/0/0
X-purgate-type: clean
X-purgate-size: 1185
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 2026-11-10 at 10:14 +0100, Christian Brauner wrote:
> Initialize rpc_pipefs as a pseudo filesystem. This raises SB_I_PSEUDO
> and
> also SB_I_NOEXEC and SB_I_NODEV. rpc_pipefs never holds executables
> or
> device nodes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0net/sunrpc/rpc_pipe.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/net/sunrpc/rpc_pipe.c b/net/sunrpc/rpc_pipe.c
> index 9d349cfbc483..37277a6d2415 100644
> --- a/net/sunrpc/rpc_pipe.c
> +++ b/net/sunrpc/rpc_pipe.c
> @@ -15,6 +15,7 @@
> =C2=A0#include <linux/pagemap.h>
> =C2=A0#include <linux/mount.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/namei.h>
> =C2=A0#include <linux/fsnotify.h>
> =C2=A0#include <linux/kernel.h>
> @@ -1181,6 +1182,7 @@ static int rpc_init_fs_context(struct
> fs_context *fc)
> =C2=A0{
> =C2=A0	put_user_ns(fc->user_ns);
> =C2=A0	fc->user_ns =3D get_user_ns(fc->net_ns->user_ns);
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &rpc_fs_context_ops;
> =C2=A0	return 0;
> =C2=A0}

