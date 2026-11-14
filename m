Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30658606A31D
	for <xen-devel@archiver.kernel.org>; Sun, 15 Nov 2026 10:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=LMtj4b9n
Received: from list by lists.xenproject.org with outflank-mailman.1489360.1691013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSXEs-0005Dy-BT; Sun, 15 Nov 2026 10:13:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1489360.1691013; Sun, 15 Nov 2026 10:13:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSXEs-0005Cj-7i; Sun, 15 Nov 2026 10:13:34 +0000
Received: by outflank-mailman (input) for mailman id 1489360;
 Sat, 14 Nov 2026 20:06:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chris@chrisdown.name>) id 1xSK0f-0002Kj-96
 for xen-devel@lists.xenproject.org; Sat, 14 Nov 2026 20:06:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSK0e-001vHR-MJ
 for xen-devel@lists.xenproject.org; Sat, 14 Nov 2026 21:06:00 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chris@chrisdown.name>)
 id 6af8bebd-2eae-0a2a0a5409dd-0a2a4504b136-42
 for <xen-devel@lists.xenproject.org>; Sat, 14 Nov 2026 21:06:00 +0100
Received: from [209.85.216.51] (helo=mail-pj1-f51.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chris@chrisdown.name>)
 id 6af8bf27-b57f-0a2a45040019-d155d833e1bd-3
 for <xen-devel@lists.xenproject.org>; Sat, 14 Nov 2026 21:06:00 +0100
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-3b0e0e65adbso1012763a91.3
 for <xen-devel@lists.xenproject.org>; Sat, 14 Nov 2026 12:06:00 -0800 (PST)
Received: from [172.22.0.2] ([64.16.22.130]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3b1b266d873sm4654869a91.1.2026.11.14.12.05.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Nov 2026 12:05:57 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=chrisdown.name header.i="@chrisdown.name" header.h="User-Agent:Message-ID:Content-Disposition:Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:From:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794686758; x=1795291558; darn=lists.xenproject.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cEK0v6G1yB2cz/8630PKsjvi8Z78P9QyctaIU0ylRW4=;
        b=LMtj4b9nt9HBl5gGGExQ/dqwXHe1PvsKs93WwMK5hSkmrFovOZbooKiXyIq0L/2+nn
         T5Rkh6mnr14VxZsRwAQGIR8fuLkzldF1nEJQiBx9nsohgWEWHbZrbCfsU84gpTn13jZo
         Ux9EtnSAW6T47cfpSSK0z8Z0ZYNIQGFe+SApU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794686758; x=1795291558;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cEK0v6G1yB2cz/8630PKsjvi8Z78P9QyctaIU0ylRW4=;
        b=Zb0cZRtzrjvncTBXizBKm4FKuPoKvKS8K17RTP/6GnoalMA955slJjNX3EReVaREpJ
         W7VIGwjnjZVejcN4kKtNSY4Uw9d2Hw40526x3L0yPZnqtHqKqL5218YySaH+G5YziH6q
         zAo9oVgj0Gb5eVdbsuOZ+9KwSV1R8I7ZwXhXSAGEMqcQW9IgdB0p8WvIoGq3FNnd+DfT
         SUPj6IN05toaT34PcL1gM3DAgjkXla6tZxHH/VRsUi62B7svl6hyzz8QbyCaM9U6IVkI
         gtbGLZ92f5MHRjTOC3R/iuXGKyKrjhvO0E+bTEj3RmqG0ySLjqe0gty9iSjfomv4uxa8
         nEjw==
X-Forwarded-Encrypted: i=1; AL+hErHqgzQVV84ISJoMvKPuZRfHUl0JMWkncg1qjdjPiBsrix8D3k1EJXOgkvby1ZhKC+vjrBZGizRy0+s=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8HSla3elJLR89S1PTH71ldWnj5B9DXgjAPV5faQf+K3z4xExxs
	SXPbi7Et/8NmRL893NGLB1n6EqzodnhrolAYdvwzw7WuRWiDNTAbY+OHz1h4nFJObSc=
X-Gm-Gg: AYBFou0bjxLBe20S9tC/+dYcfTDTGaoTnlMjuo38rYl1uErSMk2kngcw3wRFuwT/5vV
	vFiCKlW/rXMFNhojzSYQkNQ0shIJYCnrod1sgLiqecoeNZbBGZJW2FHF/PFsBEjJ0CopmficW/M
	aZjpRRaHjOvvjNJN0w5rtIE9w6ZBopUd8E2xOhf/OLXj+PK0MlG7q1NIYImRBwpQhXDrN3fEFxu
	P5F//mkSfLPWBDvmlFfBM8Ihy9h5OfYkNYix8VNqe1S86iBImP88mHnnvrJyRySmVwolCrUyeRz
	YyoxgYn+GYZ+8PsrAtqrDbR/OMVZWAA78+E5PgYnTwD09mnTc4lta5EUsqpkwaEfZSUOIPT9O1G
	l1FZnAVI1XxaNfwCYQdvNXbP7yH3GCDmDVLtrs7uJRD1ZaqJ6gI6memXcpAkUHFOSQv6J1m0GmO
	K3SmtGl8lh3lk9agSaVEIrqaKe39hOrKxKMsfh+FaG/gQujtH2e8CpVHeE4cOVEECnMkAsGLTLp
	eRuNAqs6fIYqyE51jecwl25EOcvrm5BuHjcUU1iAozZnJ4ulXOk7uhNMXcQCR08inzzrhL2xVrE
	KWYSRrYca51okm5tdxKf38ZXsDefVrKrYX2TAt+QFhT6O/qtgPRzO+1bIPw7sTwyV3qzovkmNqm
	pATk5pJWmXEEC2FEcYtxADrTz/yflNlX0QjvYeaum39mZpvzO9dPPKoTUiMHLU8SVuFBT2DgS1A
	H1kPUZG9zJuXxnOn1WHtEhqz6Jxe8vTSbFA0t0DJLV6V96mFjiKxrctorv
X-Received: by 2002:a17:90b:3b8a:b0:3b0:9f53:e8a8 with SMTP id 98e67ed59e1d1-3b1b0b5f2c1mr6192503a91.52.1794686758572;
        Sat, 14 Nov 2026 12:05:58 -0800 (PST)
Date: Sat, 14 Nov 2026 12:05:55 -0800
From: Chris Down <chris@chrisdown.name>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>,
	Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
	Christoph Hellwig <hch@lst.de>, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	driver-core@lists.linux.dev, linux-mm@kvack.org, bpf@vger.kernel.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
	fuse-devel@lists.linux.dev, linux-efi@vger.kernel.org,
	xen-devel@lists.xenproject.org, ocfs2-devel@lists.linux.dev,
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-usb@vger.kernel.org, Amir Goldstein <amir73il@gmail.com>,
	linux-erofs@lists.ozlabs.org, linux-kselftest@vger.kernel.org,
	Alexander Mikhalitsyn <alex@amutable.com>
Subject: Re: [PATCH RFC v2 17/42] securityfs: use fc_init_pseudo()
In-Reply-To: <20261114-work-loop-pseudo-v2-17-98639a2286fb@kernel.org>
References: <20261114-work-loop-pseudo-v2-0-98639a2286fb@kernel.org>
	<20261114-work-loop-pseudo-v2-17-98639a2286fb@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261114120555.cbfaf8ab8a92fb25@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)
X-purgate-ID: tlsNG-ebf023/1794686760-512DCB50-500973A4/0/0
X-purgate-type: clean
X-purgate-size: 753
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Christian,

Christian Brauner writes:
>AppArmor puts a .null device node into securityfs but only ever opens
>it via dentry_open() which doesn't care about SB_I_NODEV.

Not a big deal, but userspace can see that node too, as
/sys/kernel/security/apparmor/.null. Opening it by path works in current
kernels and fails with EACCES after this patch. Now, I don't know of
anything that does that, but selinuxfs gets SB_I_NODEV cleared again in
the next patch for the same kind of node, so I think we should do the
same thing here. If not, it would be good to have a line in the
changelog saying that opening it by path is meant to stop working.

Once that's fixed, please feel free to add:

Reviewed-by: Chris Down <chris@chrisdown.name>

