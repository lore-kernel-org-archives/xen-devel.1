Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668BC60A6F65
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 12:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=tSFQYWyR;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=V1tJ5Byu;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=tSFQYWyR;
	dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=V1tJ5Byu
Received: from list by lists.xenproject.org with outflank-mailman.1481648.1685553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQlPH-0002IT-2D; Tue, 10 Nov 2026 12:56:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481648.1685553; Tue, 10 Nov 2026 12:56:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQlPG-0002IL-SR; Tue, 10 Nov 2026 12:56:58 +0000
Received: by outflank-mailman (input) for mailman id 1481648;
 Tue, 10 Nov 2026 12:56:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jack@suse.cz>) id 1xQlPG-0002I6-0H
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 12:56:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQlPF-00Ed9y-Cy
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 13:56:57 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jack@suse.cz>)
 id 6af31496-e002-0a2a0a5209dd-0a2a4504b646-10
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 13:56:57 +0100
Received: from [195.135.223.130] (helo=smtp-out1.suse.de)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jack@suse.cz>)
 id 6af31499-b57f-0a2a45040019-c387df82aa64-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 13:56:57 +0100
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 10FD721F68;
 Tue, 10 Nov 2026 12:56:57 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E25DE1339F;
 Tue, 10 Nov 2026 12:56:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 6y7vMJgU82poRAAAD6G6ig
 (envelope-from <jack@suse.cz>); Tue, 10 Nov 2026 12:56:56 +0000
Received: by quack.suse.cz (Postfix, from userid 1000)
 id 8D370224E9; Tue, 10 Nov 2026 13:56:56 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=susede2_rsa header.d=suse.cz header.i="@suse.cz" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References"; dkim=permerror header.s=susede2_ed25519 header.d=suse.cz header.i="@suse.cz"; dkim=pass header.s=susede2_rsa header.d=suse.cz header.i="@suse.cz" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References"; dkim=permerror header.s=susede2_ed25519 header.d=suse.cz header.i="@suse.cz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1794315417; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8ydl7Tmlsy6sB/5DKTtOnjnkkw2YCPYFk9bjL7BuvBI=;
	b=tSFQYWyRwwv+kHYE8YhpOGU4Ki3HgKpsjkr+3bnlJF4cyRVZi+z6dmRnLVspPlNWBQ97T6
	CjWhI8INKAvD/P6E+SsUzIAB++2Mfn4yUQshTJILp/aD0y+vMUsCGK8B/SvT9SJxrm+lD6
	OfAmAtDkJMnT/TjtT42JjMJHwAmLTYA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1794315417;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8ydl7Tmlsy6sB/5DKTtOnjnkkw2YCPYFk9bjL7BuvBI=;
	b=V1tJ5Byu2B6p1tefK4YDbMgOvwybp9VjU+aSU5c9lZUhOg8WFHNH3DAT2n59zkgMTRqYSW
	vjk8sfZwK3dN1ECg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1794315417; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8ydl7Tmlsy6sB/5DKTtOnjnkkw2YCPYFk9bjL7BuvBI=;
	b=tSFQYWyRwwv+kHYE8YhpOGU4Ki3HgKpsjkr+3bnlJF4cyRVZi+z6dmRnLVspPlNWBQ97T6
	CjWhI8INKAvD/P6E+SsUzIAB++2Mfn4yUQshTJILp/aD0y+vMUsCGK8B/SvT9SJxrm+lD6
	OfAmAtDkJMnT/TjtT42JjMJHwAmLTYA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1794315417;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8ydl7Tmlsy6sB/5DKTtOnjnkkw2YCPYFk9bjL7BuvBI=;
	b=V1tJ5Byu2B6p1tefK4YDbMgOvwybp9VjU+aSU5c9lZUhOg8WFHNH3DAT2n59zkgMTRqYSW
	vjk8sfZwK3dN1ECg==
Date: Tue, 10 Nov 2026 13:56:56 +0100
From: Jan Kara <jack@suse.cz>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>, 
	Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>, 
	Christoph Hellwig <hch@lst.de>, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-nvme@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-mm@kvack.org, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, apparmor@lists.ubuntu.com, 
	linux-nfs@vger.kernel.org, netdev@vger.kernel.org, fuse-devel@lists.linux.dev, 
	linux-efi@vger.kernel.org, xen-devel@lists.xenproject.org, ocfs2-devel@lists.linux.dev, 
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-usb@vger.kernel.org, 
	Amir Goldstein <amir73il@gmail.com>, linux-erofs@lists.ozlabs.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC 07/41] binfmt_misc: use fc_init_pseudo()
Message-ID: <pgygyhsa4yghzrnta5qgeqehqixklm4tzdjz76ro7j6zy5r5ib@2xq25urai24i>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
 <20261110-work-loop-pseudo-v1-7-4c998976c6c7@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110-work-loop-pseudo-v1-7-4c998976c6c7@kernel.org>
X-Spam-Level: 
X-Spamd-Result: default: False [-16.80 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	R_RATELIMIT(0.00)[to_ip_from(RLdu9otajk16idfrkma9mbkf9b)];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,google.com,kernel.org,toxicpanda.com,lst.de,lists.infradead.org,zeniv.linux.org.uk,suse.cz,lists.linux.dev,kvack.org,lists.ubuntu.com,lists.xenproject.org,lists.ozlabs.org,gmail.com];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,imap1.dmz-prg2.suse.org:helo,suse.cz:email]
X-Spam-Score: -16.80
X-purgate-ID: tlsNG-ebf023/1794315417-53CC7B50-3CFC0BB9/0/0
X-purgate-type: clean
X-purgate-size: 1505
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue 10-11-26 10:14:23, Christian Brauner wrote:
> Initialize binfmt_misc as a pseudo filesystem instead of raising
> SB_I_NOEXEC and SB_I_NODEV by hand. This adds SB_I_PSEUDO.
> 
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

OK. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/binfmt_misc.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/binfmt_misc.c b/fs/binfmt_misc.c
> index d945b4f6e158..7dc233becd98 100644
> --- a/fs/binfmt_misc.c
> +++ b/fs/binfmt_misc.c
> @@ -22,6 +22,7 @@
>  #include <linux/file.h>
>  #include <linux/fs.h>
>  #include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
>  #include <linux/init.h>
>  #include <linux/kstrtox.h>
>  #include <linux/limits.h>
> @@ -1575,8 +1576,7 @@ static int bm_fill_super(struct super_block *sb, struct fs_context *fc)
>  	if (user_ns != current_user_ns())
>  		return -EINVAL;
>  
> -	/* Never exec off this instance and never let anything stack on it. */
> -	sb->s_iflags |= SB_I_NOEXEC | SB_I_NODEV;
> +	/* Never let anything stack on this instance. */
>  	sb->s_stack_depth = FILESYSTEM_MAX_STACK_DEPTH;
>  
>  	/*
> @@ -1660,6 +1660,7 @@ static void bm_kill_sb(struct super_block *sb)
>  
>  static int bm_init_fs_context(struct fs_context *fc)
>  {
> +	fc_init_pseudo(fc);
>  	fc->ops = &bm_context_ops;
>  	return 0;
>  }
> 
> -- 
> 2.53.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

