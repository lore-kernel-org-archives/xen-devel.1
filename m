Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331EF606A334
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 20:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XUK/fNMZ
Received: from list by lists.xenproject.org with outflank-mailman.1496969.1695273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU8XM-000159-6H; Thu, 19 Nov 2026 20:15:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1496969.1695273; Thu, 19 Nov 2026 20:15:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU8XM-000151-2Q; Thu, 19 Nov 2026 20:15:16 +0000
Received: by outflank-mailman (input) for mailman id 1496969;
 Thu, 19 Nov 2026 20:15:15 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jarkko@kernel.org>) id 1xU8XL-00014t-3C
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 20:15:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xU8XH-009M2n-LO
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 21:15:11 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jarkko@kernel.org>)
 id 6aff58ba-8faa-0a2a0a5109dd-0a2a45058632-44
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 21:15:11 +0100
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jarkko@kernel.org>)
 id 6aff58ce-4cb1-0a2a45050019-ac6904fedf60-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 21:15:11 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with UTF8SMTP id B192760D4B;
 Thu, 19 Nov 2026 20:15:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id B8E8F1F000D2;
 Thu, 19 Nov 2026 20:15:08 +0000 (UTC)
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
	s=k20260515; t=1795119309;
	bh=HvamKg69m8EuO3o+qYD0z47GTCOTQLf+wfkXOWv8Fvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XUK/fNMZmkPb7w1gBF+xCyIII4cjcYpw//PSIKQePeEJyJ9nLLYCek9lfwW9K6EN9
	 kmLFldH6AGXBpta0+Wpc7gHmyIfvdhA+O8aATeaLPkMQZgatpLSsGU1/kDDQFh4Xct
	 7YXdLmJPc2Khp1O9/kRNMD6d2mbYXyv2I8D7ZA0pvX4xxa/sus0drmCBzTRjf6uTBT
	 NslglZWR9FmC++W+quXJ8Ckb0DzAm5yPI9RQPYpsHF/u9QLupzNhAAqcItJmolda/b
	 0+7UvCujopttFf7a6A3Thgc7zL8OgbeaSJ/DhxG99pH3muj8IBpzeDK1zpuszp5uEY
	 hvELhFIVDrByQ==
Date: Thu, 19 Nov 2026 22:15:05 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Wong Steve <shyckless@gmail.com>
Cc: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, jgg@ziepe.ca,
	linux-kernel@vger.kernel.org, sstabellini@kernel.org,
	linux-integrity@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] tpm: xen-tpmfront: fix use-after-free in
 backend_changed()
Message-ID: <av9YyWpbdnIF67Hl@kernel.org>
References: <20261119-xen-tpmfront-v1-1-bfabbbed462a@gmail.com>
 <av8Tr2jTQaOBOEid@kernel.org>
 <8c988944-34e3-4fc9-a323-daca101c1bab@suse.com>
 <av8kIqYC04D5QdXf@kernel.org>
 <3b37565a-4dd7-454d-99b7-108b8e4e7133@suse.com>
 <CA+X8Sdj4KRfJagaKHkcXrv370Si_WktanBqRN-SrB7qOMH=FAg@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+X8Sdj4KRfJagaKHkcXrv370Si_WktanBqRN-SrB7qOMH=FAg@mail.gmail.com>
X-purgate-ID: tlsNG-c201ff/1795119311-72EB12A1-57CAE0D6/0/0
X-purgate-type: clean
X-purgate-size: 558
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 20, 2026 at 03:31:53AM +0800, Wong Steve wrote:
> Hi Juergen, Jarkko,
> 
> Thanks Juergen, that explains why nobody has run into it: with the
> stubdom backend the frontend never sees Closing or Closed, so this
> path is only reached with a backend that does close. I agree the
> normal state machine should stay.
> 
> So with today's backend this is latent. Jarkko, if you prefer, I can
> send a v2 that says so in the commit message and drops the
> Cc: stable.
> 
> Thanks,
> Suyuan

Given the feedback, go ahead.

Br, Jarkko

