Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834EC606A31F
	for <xen-devel@archiver.kernel.org>; Sun, 15 Nov 2026 10:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=XUgtLiDe
Received: from list by lists.xenproject.org with outflank-mailman.1489358.1691010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSXEs-0005Bz-6B; Sun, 15 Nov 2026 10:13:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1489358.1691010; Sun, 15 Nov 2026 10:13:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSXEs-0005Br-1I; Sun, 15 Nov 2026 10:13:34 +0000
Received: by outflank-mailman (input) for mailman id 1489358;
 Sat, 14 Nov 2026 20:05:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chris@chrisdown.name>) id 1xSK0c-0002JT-VQ
 for xen-devel@lists.xenproject.org; Sat, 14 Nov 2026 20:05:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSK0c-00AcqK-Ao
 for xen-devel@lists.xenproject.org; Sat, 14 Nov 2026 21:05:58 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chris@chrisdown.name>)
 id 6af8bee1-e002-0a2a0a5209dd-0a2a45018f4c-36
 for <xen-devel@lists.xenproject.org>; Sat, 14 Nov 2026 21:05:58 +0100
Received: from [209.85.210.181] (helo=mail-pf1-f181.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chris@chrisdown.name>)
 id 6af8bf24-5984-0a2a45010019-d155d2b5cdb1-3
 for <xen-devel@lists.xenproject.org>; Sat, 14 Nov 2026 21:05:57 +0100
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-8b5e5e64494so1463745b3a.1
 for <xen-devel@lists.xenproject.org>; Sat, 14 Nov 2026 12:05:57 -0800 (PST)
Received: from [172.22.0.2] ([64.16.22.130]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8bed12a8172sm2271197b3a.13.2026.11.14.12.05.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Nov 2026 12:05:54 -0800 (PST)
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
        d=chrisdown.name; s=google; t=1794686756; x=1795291556; darn=lists.xenproject.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SncZUWGrBOxT9WurRufkDIe8hGFcWm37DANGybHY+fQ=;
        b=XUgtLiDeJgK8iPm3xbvpxhDL4Kks7K5YpE3rgDVEzCpsty9cosrir9KpKZPqyv7Bap
         U/zv9yG8xpi5Dgj9pPo0QT1qcL8Arelq/3MLDYci1jhslxYc5U+6r5aOenIwFhlBBItS
         wLyulwPhJJpQVS25/GpNCMgJJ2qvzpCqDEqIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794686756; x=1795291556;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SncZUWGrBOxT9WurRufkDIe8hGFcWm37DANGybHY+fQ=;
        b=AdEStuua9aOzw0KdWND+92eEV+xKJnYU2sc6NxXc57KVTKmNADxU4ndAW/UN1uNoBy
         K1ExCMY7llOmz6ptPLFgEvljh0sCjTfAe6oeMkxKlPW67lSDhQWIFCS+D8feoS5t2MXa
         KQBpPtq8cJRHsDR/SjJLzAkhnfA0Bevt/p1EveYyAzUVl1sG+dJIm4sXDrMB0CXvxiaR
         2OUlZnzfeDJ9yX47P2qwvVhgZ7awAjeK3twKgUaSybFRD2EH5QPZdZI7Qx3K5PIvrpV0
         jaAoQGUUyf+9mBAWft6Kpup92KsZijRvjQGj1DSZXeHAm0z/V94EWB8WqOcQUXeWd6TQ
         aj6Q==
X-Forwarded-Encrypted: i=1; AL+hErEYlVhRXNG52XxTktbLFZsZdWWWpxKAZg7cdZNyb7w6rFkJ0MD/rPhiyIwcuH8NyPO7FS7jby7UcAo=@lists.xenproject.org
X-Gm-Message-State: APuU4Z875S+Tfi9F+cHAbQUcz43DociYLv80lK+yLMM9I/LxXNmqI/aM
	5i1AULS6xTj1mFb7QCd8+fJtGbzJWTTZgS9kp2B+qZb5CTPiWKlw5fV16vgjihpGUWA=
X-Gm-Gg: AYBFou13lb70TY/0btG577ycuXKHJgQPiKdACKn2GYwlxUu0ElBd3i0sA4FoRVRqO1Z
	jh9vPZ+deukXGFnnUYPkSN+mBy4jWXq7Ct7SioIwQo9JTHeSRk7O4mUaXR6Fxf54mxOzMTHLvAU
	bzmDGiI3y5JMjkLDX1r5NOhJuWmj+4WzrKxDQdjk8Byum9mS/IB3oHmw7MQ62gr/ZCMzk+F4c+C
	q/n3+Yx3Ugg5X/oaNIGehMc4RZdaxE69wn/KchI3ZZueDhC5zMFi+QkOa8UbDylS4eSyL9k58p2
	AKgaEvWCOMIqh2OuPlydjxo65eI4pH19FIH+dqMgKKBbX0HsjaYXH7iwPE3oUFJDU2Srm2mwpUn
	kBc/pXINNMqSFIcev3pUm7exuiof19mcNNowXPWJ/1w+PefYalZu3uZ3cBtKaP5FcY8TSQGvrM7
	myUXqtaRWP+m+vtsf71+t6fcyAEWwsbvQ03vFI4rIfaJIJ1zN6M5/KozWkpdG+KYd3CqYYKugaV
	6lWXpK7aa5uAMtjIHm4lDhwp6NehyalVABFc2MpY6Kky56PZeP2oO6txq957eq+ulL9AKaL8qHo
	rDNxkC1tnvbF0NbAHfHxWoj8iBiR0ARecrB5orm0DbO1Zh9ZoCh6KAAOUnNxdPlEzSHlhuhQysO
	KOoL4EWA5V70aJP1AiX7vbRlqkRn/RLvPBPlPXiZBc9WvVo+V72Ohw2P5byqTYW4OtoT5h+jEP4
	kmceJqbf9ijHZqv0P6sdYub/RPWl46/MHX73umjs77YFhi4N7RHYrlNuUH
X-Received: by 2002:a05:6a21:748b:b0:3e3:37ff:3795 with SMTP id adf61e73a8af0-3f7a4dbfbbfmr5517650637.7.1794686756009;
        Sat, 14 Nov 2026 12:05:56 -0800 (PST)
Date: Sat, 14 Nov 2026 12:05:50 -0800
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
	stable@vger.kernel.org, Alexander Mikhalitsyn <alex@amutable.com>,
	Breno Leitao <leitao@debian.org>, Casey Schaufler <casey@schaufler-ca.com>,
	Chuck Lever <cel@kernel.org>, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH RFC v2 00/42] fs: don't use pseudo filesystem files as
	storage
In-Reply-To: <20261114-work-loop-pseudo-v2-0-98639a2286fb@kernel.org>
References: <20261114-work-loop-pseudo-v2-0-98639a2286fb@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261114120550.0c9e73aa12a3072c@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)
X-purgate-ID: tlsNG-d62444/1794686758-BF063757-96A5A8B8/0/0
X-purgate-type: clean
X-purgate-size: 529
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Christian,

Patches 1-11, 13-16, 18-26, 28, 31, 32, 34-37 and 39-42 look good to me,
so for those please feel free to add:

Reviewed-by: Chris Down <chris@chrisdown.name>

I've also tested 5, 6, 34-37, 41 and 42. The selftests all pass with the
series applied, and a uid 0 without capabilities can no longer change
/sys/kernel/reboot/mode through a loop device. So for those, please also
feel free to add:

Tested-by: Chris Down <chris@chrisdown.name>

I've replied separately to 17 and 33.

Thanks!

Chris

