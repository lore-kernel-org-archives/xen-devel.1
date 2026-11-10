Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA379606A323
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 15:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZykMSu9I
Received: from list by lists.xenproject.org with outflank-mailman.1481956.1685843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQnT0-0001e6-0G; Tue, 10 Nov 2026 15:08:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481956.1685843; Tue, 10 Nov 2026 15:08:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQnSz-0001dz-T1; Tue, 10 Nov 2026 15:08:57 +0000
Received: by outflank-mailman (input) for mailman id 1481956;
 Tue, 10 Nov 2026 15:08:01 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kaylovefoss@gmail.com>) id 1xQnS5-0001RG-DQ
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 15:08:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQnS3-00DFoN-MV
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 16:07:59 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kaylovefoss@gmail.com>)
 id 6af3334c-2eae-0a2a0a5409dd-0a2a450ca65a-8
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 16:07:59 +0100
Received: from [209.85.214.169] (helo=mail-pl1-f169.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kaylovefoss@gmail.com>)
 id 6af3334e-f479-0a2a450c0019-d155d6a9dd70-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 16:07:59 +0100
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-2eb0f1b592bso8100485ad.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 07:07:59 -0800 (PST)
Received: from [192.168.2.6] ([27.75.101.24]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2edb6d78dbcsm10397575ad.27.2026.11.10.07.07.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2026 07:07:56 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794323277; x=1794928077; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JtM9UtzYhAWCxTCfoBKbcmHIR3U4Wq7tzdw7gboBY64=;
        b=ZykMSu9I3aZc/CSXynkWF7nEATscCRGM7NJ8DZZ2yXDnEESWag1BBP8DarFHwejte+
         9q3YxZQkOWCXpZ7ACv+cOQSwBBqSZsLgDK0WA6FPv/B3Bnd3wF5nM2B16VHCOfKHGUSo
         PkHMY7K6PPQG8gANgn5ywcHA3No1jZSLj8KS/TdysfpsVo7S96HCaTEBDuxcoj9mC89I
         KKUd6Qc9LVNrkETziwqg7FGdW96+VbeCWirE7KKggioLPh50QwFy1WxMnBnh9NDaPE75
         LjzGpmJ6zuZNoa8lkkVo4ZpdMjTe0fHZAmm9pXCDI8uxj9gujdGeyjego1SmhNIrghFx
         vrRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794323277; x=1794928077;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JtM9UtzYhAWCxTCfoBKbcmHIR3U4Wq7tzdw7gboBY64=;
        b=SPU4mTEjMYzHva62Nbj7FevJWujniK7Hd+ZWmGjRqywfPA96al8lRTMOvMkhdHvYBR
         towLDM/qnLnQlwFKrmz+1s1jr1ZiAX15IYtgc1FkJhh2wb1/IHNEXLG3F6vaR/+yo8yA
         2zkpjjpMB1etlz9H/At8/Daie1Wp/Hi8ITasJpbDB+fT9eXhvz4RQx4RLgB82Yea2gXw
         Qv1LpNNJXsrUK1eTJXfjKZN/o6EgFWgdE/CuBOUHmVvV2ilP3CW4iIWOwORNpUqpXVoA
         WsjWzlOzusNGXkif41dApzCFqz15YyZNBDVIQuyZx4JhGnQtS0nYqF6vTP1hfsIzivGd
         cYxg==
X-Forwarded-Encrypted: i=1; AL+hErFWPQORu49xPddWYOc6z4fKKi0eOWlR0wmaHmSVZmeR3meICxLlgZIAlRI38ijnBDZTRbNzHkObUJQ=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9pXsjH1AiIFxiLkSqEuTtUbUzTZxj6nCl2uHT/pgyquUFCQwAA
	AbGrEK44XGBj+hNu45cuGNBJK1W/Q51GYUvL2HGlJaSx822yB6fmsdN7
X-Gm-Gg: AYBFou2xcYRt7NgdMbe6RBvV0GiSQOvUVlodZWiuwx26uAntCysFaT/+4tzwAjy2ijL
	yOXn+HB4bnEL6pnt6G5362MhC00EwW4SXAGC21/VuzCibzSO7hcu7HvmCLj5/gpEF/THr1XUqXk
	eTYLznQwYDHO9mXKSEMqV0zEEdcvB5AoqB1sJR5w7WRvQhEVHaE8DOxBFmq44trJOve1BA4O5N/
	Yk0l7z/flWuMiRzUygJGydJrbp4b8hPXfeoFxhlFZx93yly0sLnHBphlXzbPVAHHQkFamrOUCoZ
	cV9yKPg9WswVDbQX3wKyc39r3FIkoQpi2O0x6pIvr6wBaPCXQ1sY8IwKuMWveLCgPz8ab1THRUi
	hRmvpcLQQPXbXl1Wv/7e6N167d+UIRmwS8IwdULq7KwTzPd0LmVBs9EZrqxhHrO+aBMZcjpQnz+
	JkWxGrhqaR7pexO5GSzdiqJIr4J8Ji8MEQ2hqkDbBU1RKtLvGjFDSzwc3MvI6sgmGJflGiRYq1G
	Y8gqwWvnLyhUuWZdNYvR6r0ePaZlBJ5n+bHrE25Wi6oumvJwBDxSnQ1SxQNHvw6OG7TWLNG7jID
	rf7QrQ/XlAfL6q7AfybamX0NnvSrOhyfCAouW+ujXEbqvJ/Uy6w2DScxAa73Bc44whY7pNu5XLg
	Ep76s9NeJ/h0=
X-Received: by 2002:a17:902:d481:b0:2ed:1ef3:9ec with SMTP id d9443c01a7336-2edb9172a2dmr26826345ad.14.1794323276968;
        Tue, 10 Nov 2026 07:07:56 -0800 (PST)
Message-ID: <71f76e5e-ce24-4a71-863a-169ad262c510@gmail.com>
Date: Tue, 10 Nov 2026 22:07:46 +0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 36/41] nvmet: refuse files on pseudo filesystems as
 namespace backing files
To: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org
Cc: Jann Horn <jannh@google.com>, Chris Mason <mason@kernel.org>,
 Josef Bacik <josef@toxicpanda.com>, Christoph Hellwig <hch@lst.de>,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Jan Kara <jack@suse.cz>, linux-scsi@vger.kernel.org,
 target-devel@vger.kernel.org, driver-core@lists.linux.dev,
 linux-mm@kvack.org, bpf@vger.kernel.org,
 linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
 apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, fuse-devel@lists.linux.dev,
 linux-efi@vger.kernel.org, xen-devel@lists.xenproject.org,
 ocfs2-devel@lists.linux.dev, linux-s390@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-usb@vger.kernel.org,
 Amir Goldstein <amir73il@gmail.com>, linux-erofs@lists.ozlabs.org,
 linux-kselftest@vger.kernel.org
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
 <20261110-work-loop-pseudo-v1-36-4c998976c6c7@kernel.org>
Content-Language: en-US
From: Bui Nguyen Nhu Quynh <kaylovefoss@gmail.com>
In-Reply-To: <20261110-work-loop-pseudo-v1-36-4c998976c6c7@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1794323279-51936A5B-794614F2/0/0
X-purgate-type: clean
X-purgate-size: 1237
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/10/2026 4:14 PM, Christian Brauner wrote:
> The file backend takes any path that isn't a block device. With
> buffered_io=1 that includes files on procfs or sysfs which then get read
> and written by a kernel worker on behalf of the host. Refuse files on
> pseudo filesystems just like loop does.
> 
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
>  drivers/nvme/target/io-cmd-file.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/nvme/target/io-cmd-file.c b/drivers/nvme/target/io-cmd-file.c
> index dfa8aa46188c..71c69bac5394 100644
> --- a/drivers/nvme/target/io-cmd-file.c
> +++ b/drivers/nvme/target/io-cmd-file.c
> @@ -52,6 +52,11 @@ int nvmet_file_ns_enable(struct nvmet_ns *ns)
>  		goto err;
>  	}
>  
> +	if (file_is_pseudo(ns->file)) {
> +		ret = -EINVAL;
> +		goto err;
> +	}
> +
>  	nvmet_file_ns_revalidate(ns);
>  
>  	/*
> 

I noticed patch 41/41 doesn't include a test for nvmet. Would it make
sense to add one with buffered_io=1? The test would need a pseudo file
that can be opened with O_RDWR and supports both read_iter and
write_iter. Otherwise, it could pass without ever reaching the new
file_is_pseudo() check.

Thanks.

