Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40101606A32D
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 07:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FwZyzsHn
Received: from list by lists.xenproject.org with outflank-mailman.1471508.1679849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOVdB-0003xE-2R; Wed, 04 Nov 2026 07:42:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1471508.1679849; Wed, 04 Nov 2026 07:42:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOVdA-0003x7-Vc; Wed, 04 Nov 2026 07:42:00 +0000
Received: by outflank-mailman (input) for mailman id 1471508;
 Wed, 04 Nov 2026 07:41:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <krzk@kernel.org>) id 1xOVd9-0003x0-Ih
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 07:41:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOVd8-00DCwk-LX
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 08:41:58 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <krzk@kernel.org>)
 id 6aeae1c6-2eae-0a2a0a5409dd-0a2a450ad70e-4
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 08:41:58 +0100
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <krzk@kernel.org>)
 id 6aeae1c5-f2d2-0a2a450a0019-ac6904fee918-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 08:41:58 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id BC0F5601F6;
 Wed,  4 Nov 2026 07:41:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC17D1F000C1;
 Wed,  4 Nov 2026 07:41:55 +0000 (UTC)
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
	s=k20260515; t=1793778116;
	bh=fVUUJ8Dl8BM5zbCnaDwoeCDrtuTfYmgK5IGYTspP9KE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FwZyzsHnyOsLSyHFRJ74qtvoVXJqRKTpO25qiJwDy6ovTPNvRIFy9jB5VmQe8pEeO
	 ndopN9bA7jCsLV53uUX2vNCJPGbUeeZt7KhSsIyuX0R65B+P8u3eenybGVUDarPgwq
	 XxzzTLdAM82x6WrYX2aB30MN7iHC792WqCVXm96QVuTFFfoIyoHPOaS8I7A6w6dMkK
	 lFRkMN+9dZSzR2Ptfmjak54b1rDA3vQCmMwbQ0xqNoQddwvYurgrH6vUdhZAbMXfEU
	 5lCJCZ+9Tr0A5cGCCx0vXzaxLKxR+07h52A7c6Dr77wZgIvBlLb4tBs1zkeC4ZbcVo
	 ChXdorI2X+dKA==
Date: Wed, 4 Nov 2026 08:41:53 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: xen-devel@lists.xenproject.org, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen/balloon: drop the device reference if registration
 fails
Message-ID: <20261104-musical-trogon-of-climate-e4e0cb@quoll>
References: <20261104021548.1468864-1-vulab@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261104021548.1468864-1-vulab@iscas.ac.cn>
X-purgate-ID: tlsNG-4011c0/1793778118-51AC4CFC-D3997203/0/0
X-purgate-type: clean
X-purgate-size: 2296
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Wed, 04 Nov 2026 02:15:48 +0000, Wentao Liang wrote:
> register_balloon() registers the statically allocated balloon device.
> When device_register() fails, device_add() drops the reference it took
> itself but the reference taken by device_initialize() stays behind, so
> the device's private data and name are never released.
> 
> Give up that reference with put_device() before unregistering the bus.
> 
> Fixes: 803eb047a28d ("xen-balloon: Move core balloon functionality out of module")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/xen/xen-balloon.c | 1 +
>  1 file changed, 1 insertion(+)
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





