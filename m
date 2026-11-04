Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67C6606A326
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 07:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W2ubsvT6
Received: from list by lists.xenproject.org with outflank-mailman.1471481.1679840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOVAg-0007lJ-Tk; Wed, 04 Nov 2026 07:12:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1471481.1679840; Wed, 04 Nov 2026 07:12:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOVAg-0007lC-Qn; Wed, 04 Nov 2026 07:12:34 +0000
Received: by outflank-mailman (input) for mailman id 1471481;
 Wed, 04 Nov 2026 07:12:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <krzk@kernel.org>) id 1xOVAe-0007l6-UB
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 07:12:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOVAd-0054Zn-Ut
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 08:12:32 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <krzk@kernel.org>)
 id 6aeadadb-2eae-0a2a0a5409dd-0a2a450cb4aa-14
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 08:12:31 +0100
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <krzk@kernel.org>)
 id 6aeadade-f479-0a2a450c0019-aceafc1fa766-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 08:12:31 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 56B29409FD;
 Wed,  4 Nov 2026 07:12:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AE551F000C1;
 Wed,  4 Nov 2026 07:12:28 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:Cc:Subject:References:In-Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793776349;
	bh=bxPVSttrjRZNJw1tsx+VPo6VdRh7HalumXq9Vu4+3CE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=W2ubsvT6ELNKnkmdO+5Xs/mzxUvQJDQtCsUe6PszNVvpDQz6BQLdqwoVw2Oggy9sr
	 J/QXKU9BM8Q/1yI5zTrwyPa6I51nKenWxebirQYXk0ZmCsbWYx5Qiyr9ihBHaWD9yd
	 iJZ0cbQq+QhUww6I5UP1BcDhFGd6u7Q9LuMrMLjUF8gFsYPq2q+TCluyLKI1MHLIA6
	 7UbNyeNIOCD1tzatH/VSyDKpDYIyXaEYK7DrISsdJouF/JuLHCO+VLllxAa8NP8mmb
	 J7TjrnIuB8FfTwLmRWL+wHGAQFlK+aeDMcxVKmGFSbCwF6y0bqr6oXGuEmnNf/cLmT
	 l8bRaNj0x/R2Q==
Date: Wed, 4 Nov 2026 08:12:26 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] xen/pciback: drop the device reference if the export
 fails
Message-ID: <20261104-vehement-tireless-goat-4ea84a@quoll>
References: <20261104021537.1468780-1-vulab@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261104021537.1468780-1-vulab@iscas.ac.cn>
X-purgate-ID: tlsNG-d25034/1793776351-778D5A5B-1883EE77/0/0
X-purgate-type: clean
X-purgate-size: 3131
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Wed, 04 Nov 2026 02:15:37 +0000, Wentao Liang wrote:
> xen_pcibk_export_device() takes a pcistub_device reference through
> pcistub_get_pci_dev_by_slot().  On success xen_pcibk_add_pci_dev()
> stores the device on the backend's device list and the reference is
> released later by xen_pcibk_release_devices().
> 
> When the add fails before the device was queued -- the list entry
> allocation fails, or for the vpci backend the device is a bridge or no
> virtual slot is free -- the reference is never dropped.  psdev->pdev
> then keeps pointing at the pdev that free_pdev() frees, and the device
> can never be exported to a guest again because
> pcistub_device_get_pci_dev() rejects a psdev that already has an owner.
> 
> Drop the reference on these paths, taking the device lock which
> pcistub_put_pci_dev() requires.  Whether the device was queued is
> checked with the coordinates the frontend sees, obtained through
> xen_pcibk_get_pcifront_dev(), because the vpci backend hides the real
> topology behind a single virtual bus.  The reference is kept when the
> failure came from the publish callback, which runs after
> list_add_tail() and is undone by xen_pcibk_release_devices().
> 
> Fixes: 30edc14bf39a ("xen/pciback: xen pci backend driver.")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/xen/xen-pciback/xenbus.c | 33 +++++++++++++++++++++++++++++++-
>  1 file changed, 32 insertions(+), 1 deletion(-)
> 

Multiple things here:
1. Your team ignored completely previous feedback. Multiple times.

2. You use multiple identities with this email address, thus I doubt that we
   speak with an actual person.

3. Your bot does not even bother running checkpatch, right?

4. Nothing of this was reproduced nor tested.

5. Finally, the same feedback:
You sent multiple independent patches, to multiple independent
subsystems. The amount of these patches clearly suggest this was
AI generated and most likely not tested.

More importantly, you sent all this work without properly organizing
relevant patches into patchsets. This makes reviewing difficult
and might cause multiple reviewers to address the same issue.
Replying to the entire set is impossible and requires handling each
patch independently, instead of applying or discarding the set.
Maintainers also won't see the bigger picture of your work. Quite
worrying.

This is on the verge of hostile patch: bomb us with so many
contributions, we won't be able to handle them in efficient manner,
like responding ONCE to ask you to slow down.  Considering all this
is untested and LLM generated, I have even more doubts whether this
should be considered for review.

Please read kernel documentation BEFORE posting more work. It will
explain you how to identify subsystems, how to organize your work per
subsystem (so a patchset grouping multiple patches with a short cover
letter), how to document the issue discovery method and what was
or was not tested.

Best regards,
Krzysztof





