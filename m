Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95AD606A320
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 14:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=5ghxdcFV
Received: from list by lists.xenproject.org with outflank-mailman.1496440.1694961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU2rJ-0008QO-H3; Thu, 19 Nov 2026 14:11:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1496440.1694961; Thu, 19 Nov 2026 14:11:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU2rJ-0008QH-Dx; Thu, 19 Nov 2026 14:11:29 +0000
Received: by outflank-mailman (input) for mailman id 1496440;
 Thu, 19 Nov 2026 14:11:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xU2rI-0008QB-Uo
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 14:11:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xU2rI-00000006j1O-2EJf
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 14:11:28 +0000
Received: from mail-lf1-f50.google.com ([209.85.167.50])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xU2rI-00000002W6T-3Nft
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 14:11:28 +0000
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5c14f7768acso1833481e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 06:11:28 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:Content-Type:Cc
	:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version;
	bh=G8xeUT2q1V7DK3bpHldzuKv9mr7Q1h0ryOZxWpuINr4=; b=5ghxdcFVvf8dNhnzr9bAw2z968
	13wC9ePFp8vakutfJo5+smr3p0LlqF1b0A/MHKrlbpIQe5W8J9UO/M9PRfoHuW2v+wsQEqQRLDIQE
	BcQqq0G5zAdu6rX38dUjKk3MMNwCMJgk42CjGNA14huuHrvcAoQIS4fgKUEwSVqbxnkY=;
X-Forwarded-Encrypted: i=1; AL+hErEYesg6vT9r8tkOtmy/78UkyRihWm1ulZObYrrjxc/TnLcPXJCb5KWqvq9PCFx1MjzCugE67o0l2nE=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/mqH9dDWchY4JF9MXsTcvqkNKJfMOuP/KiKU37sI/BMnrJT+fA
	Qbm66pB4wcJL1+2fzMLCaoiImdDp49oPPpYk+0lTlYc8TAj8Mwnu6igSFeT8v6Ljtob2JkQ/4pf
	i6dizd1Ny27TgI/mIlZg0XaTlXlKDBzM=
X-Received: by 2002:a05:6512:3c9a:b0:5c0:ca1:9dcc with SMTP id
 2adb3069b0e04-5c1aa02c2bbmr2152817e87.57.1795097487567; Thu, 19 Nov 2026
 06:11:27 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103-asi-hvm-v6-0-59dbc5ce9615@xenproject.org>
 <20261103-asi-hvm-v6-22-59dbc5ce9615@xenproject.org> <8a0e1a5a-18af-4e6f-aaf3-cfa4e44d980d@suse.com>
In-Reply-To: <8a0e1a5a-18af-4e6f-aaf3-cfa4e44d980d@suse.com>
From: George Dunlap <gwd@xenproject.org>
Date: Thu, 19 Nov 2026 14:11:15 +0000
X-Gmail-Original-Message-ID: <CAFLBxZbVWpFeiWzgOqtnP83TJEKVASRgtkAPRz+by_Rs4Quu5g@mail.gmail.com>
X-Gm-Features: AclHuK8GttjpQUPVyMjewJOhRA4MrIMTwjrg8LlyCxwIP6tcTyX5wQ6nynYRTuA
Message-ID: <CAFLBxZbVWpFeiWzgOqtnP83TJEKVASRgtkAPRz+by_Rs4Quu5g@mail.gmail.com>
Subject: Re: [PATCH v6 22/44] xen/xmalloc: return an emptied region after
 dropping the pool lock
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 18, 2026 at 12:05=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 03.11.2026 23:13, George Dunlap wrote:
> > When a free leaves a whole region of an xmalloc pool empty,
> > xmem_pool_free() hands the region back through pool->put_mem() with
> > pool->lock still held.  For the xenheap pool that is
> > free_xenheap_pages(), which takes the heap lock inside the pool lock
> > and runs arch_xenheap_pages_free().  On x86 with a sparse directmap
> > view configured, the latter takes the page out of the sparse view,
> > at the cost of one to three rounds of TLB-flush IPIs to every CPU,
> > while every other CPU's sub-page xmalloc() and xfree() waits on the
> > pool lock.
> >
> > By then the region is on no free list and no longer counted in the
> > pool,
>
> This, I think, isn't entirely accurate, as pool->num_regions still
> accounts for the region (and pool->used_size still accounts for the
> bhdr). Yet at the same time the change you make also better mirrors
> the ->get_mem() side, where accounting is done only after the call.

Ack

> > Assisted-by: Claude Code:claude-opus-5-5
> > Signed-off-by: George Dunlap <gwd@xenproject.org>
>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks,
 -George

