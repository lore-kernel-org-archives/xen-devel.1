Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02A0606A31C
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 10:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=NSd45dLl
Received: from list by lists.xenproject.org with outflank-mailman.1487192.1689654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRoTq-0000Zz-4w; Fri, 13 Nov 2026 10:26:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487192.1689654; Fri, 13 Nov 2026 10:26:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRoTq-0000Zs-2G; Fri, 13 Nov 2026 10:26:02 +0000
Received: by outflank-mailman (input) for mailman id 1487192;
 Fri, 13 Nov 2026 10:26:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <alex@amutable.com>) id 1xRoTp-0000Zm-I4
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 10:26:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRoTo-006kgJ-Qd
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 11:26:00 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <alex@amutable.com>)
 id 6af6e5b6-2eae-0a2a0a5409dd-0a2a4505da18-16
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 11:26:00 +0100
Received: from [74.125.225.138] (helo=mail-wm2-f10.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <alex@amutable.com>)
 id 6af6e5b8-4cb1-0a2a45050019-4a7de18ac8f2-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 11:26:00 +0100
Received: by mail-wm2-f10.google.com with SMTP id
 5b1f17b1804b1-4b80834ce1aso1170655e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 02:26:00 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com.
 [80.187.86.54]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb4e2538b9sm244439965e9.1.2026.11.13.02.25.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 02:25:59 -0800 (PST)
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
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794565560; x=1795170360; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5OyDtStyAeBedN7jaZpmypaL0n4+GQJgji3UYOQMX7Y=;
        b=NSd45dLlZjhc5DRiM5TGjhUIbeuPeMewekAA5L9RKDKZ1A4YlLA3pr2hU5/0vw0AQ9
         CYYI/xjCFRWT/rUFxWHnd6M02T+6DrgvUf4pZGjP5x7lVwNRSXmuFpXLVIWswkpNjS86
         giF4rOe9Avy+oiQ7Fs5zxiWfNLIZfOC6ktnTwYI3Ttu0+rj1G+GnJLta2Tz92rt7guCN
         H6FvB/JYwFBiR8tLZ8IfUESHZADgvjICswohJAVRE+nj7LiNyepA1Ff0mDFxgGAKD6mu
         pat6lSzWPY7eqx/1LzY//+xHF6zGvnIwRx6ydv5owCW1ra0CVbvG603we/PiUjqsWq1A
         s/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794565560; x=1795170360;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5OyDtStyAeBedN7jaZpmypaL0n4+GQJgji3UYOQMX7Y=;
        b=Ov9uhXH+iUlG79gE2ciXGc542ifIYC0acXYcuH4RNbxW0kcl2V0WpJKMhtkj2zf9aN
         jHTZ2ViFahGw2XuUyDpp8CzWRfVdFqzaeq0LBi7K4hoyEXzsS/plOZRI5aTlEM027Xj+
         H2s9QBKoa8T+dnZhC727AmcNzRhRo/yWE8SbcTE9Zwc75IuB4lpsotftXwjZgaoth8qr
         wiyuM1aNfQHKPckB50M9pt7kS39TrdEx/pEIULrtpd8TG+cpJ6dbalM7DpOiJk2o6rOt
         2FjkbfagDU6r7uIiz0Mh8G/1ZMBelHlSrIsWzwlkpClqCo0MsdsqNSQ/8iM/0ePPmFAp
         Dlfw==
X-Forwarded-Encrypted: i=1; AL+hErHizol5tQuIn+BykX6gmmOODXkWsYJIQzQwCtQgNy0RozmoL5LBtCgP+1KBzUZI88OkHVE/bi0aPPs=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/GgV0d7+CMzps8vQYhcdQARGh8BDm7/++F4roAmsg8TnIcKuxZ
	ijWAnkAUxwvrR9dFYBwKyis59SYl9pnG42KjO+/Z0pijFl3uRv+kUG1l0M6ufxasaJT3
X-Gm-Gg: AYBFou1i/1ULFhGYl4ZO/BqPxuAA+ZF1qSJVPOVEd/17sw+gOI2kaBJfLPJ4mZYyyV9
	mBZgatQFdIEWvD/t/Oq0yKqqS5nZ8mEWzVr9q2SsiNzYThdUheEt4kxlDTb4qApDDeKUKDrxK5r
	OyjgF6CZ2PC/nbqKGkBfoxOrqpr40oloOEQ6Q1wuD07m35LVLA3NMQffN2xrkzq1UGysZg3HuXs
	9Y5XgW+rZhNS4eySJF/bRHYhZcaB7bL/STrn2vexH7Ls960CXcB5YmtpUqshdfVU78VwQWpMgG+
	dm5X+RjRI/NgAFhPpFbq7rL9JfVuG2WWftXBQRs08Ki5QVlj78jtxt5q87EJbqEB0GHuBCmp4jp
	BYODw089ewhEsHWOPTLUx3G17uQu5XD9IeyqCu5eaEchD1AkEqM04l9k7HZLc/x4WBiVwkY90QR
	XszHQeztqLa29PQ7FlTKcUwJ7giVFacy4hhUnsF72cYZz29k5DbKzJu2kiffcJmMgSRjsqZ4vCx
	423xuM66AwN6yGFvpPOpUqp+DD1aTtaxdj2nKHX+0e+ZUBUi2GRSwKelEZaiDETIQmwBHnsoc6i
	KHBt60azNVrzQ5sBHK+d9RR0r+WIYr3Qjhk6RcaN7JQzgyilprL5Jyl/CUOD5aE=
X-Received: by 2002:a05:600c:4e49:b0:4a1:78c5:79f5 with SMTP id 5b1f17b1804b1-4bb55aa999dmr38995625e9.33.1794565560090;
        Fri, 13 Nov 2026 02:26:00 -0800 (PST)
Message-ID: <fb1d72cf25d10a960da627f6d93a3e041820ed3a.camel@amutable.com>
Subject: Re: [PATCH RFC 38/41] fuse: refuse files on pseudo filesystems as
 passthrough backing files
From: Alexander Mikhalitsyn <alex@amutable.com>
To: Christoph Hellwig <hch@lst.de>, Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>, Chris Mason
	 <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>, 
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
Date: Fri, 13 Nov 2026 11:25:57 +0100
In-Reply-To: <20261111151202.GA11391@lst.de>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-38-4c998976c6c7@kernel.org>
	 <20261111151202.GA11391@lst.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-purgate-ID: tlsNG-c201ff/1794565560-F44A42A1-0F11F438/0/0
X-purgate-type: clean
X-purgate-size: 373
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Christoph,

On Wed, 2026-11-11 at 16:12 +0100, Christoph Hellwig wrote:
> I've seen setups where people use fuse to mediate access to sysfs
> sysfs in odd ways.=C2=A0 No idea if that's still around, but if so, this
> patch will break it.


Oh, that's painful. Do they use backing files for that?
It's a relatively new feature in FUSE...

Kind regards,
Alex

