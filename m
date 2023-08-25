Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F8CC3DA6F
	for <xen-devel@archiver.kernel.org>; Fri, 25 Aug 2023 12:11:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.590854.923223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZVeR-0000Ck-KX; Fri, 25 Aug 2023 12:10:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590854.923223; Fri, 25 Aug 2023 12:10:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZVeR-0000Cd-Hn; Fri, 25 Aug 2023 12:10:55 +0000
Received: by outflank-mailman (input) for mailman id 590854;
 Fri, 25 Aug 2023 11:56:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gotW=EK=kernel.org=brauner@srs-se1.protection.inumbo.net>)
 id 1qZVQq-0006Ht-3B
 for xen-devel@lists.xenproject.org; Fri, 25 Aug 2023 11:56:52 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 788af6de-433e-11ee-8783-cb3800f73035;
 Fri, 25 Aug 2023 13:56:49 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A3FC562DC7;
 Fri, 25 Aug 2023 11:56:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 690DCC433C8;
 Fri, 25 Aug 2023 11:56:45 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 788af6de-433e-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692964607;
	bh=YCgx9U87vcM/sPt5nfivx+zm1TRjhU2OgXFV2oyUhfE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YANaZq+Nab+4jPdlv9xZhGF68npY0UWCfbof63kV9MggkKvzsoBNQxKCZCrG9L1Bn
	 CAdn3RzlduIuIrAnNU8IxZdD2fFjPxNqNLI/1fGYuBe1wRSV6sZ6p8kdbvchE4dCWA
	 62yFhvG6u8WPXSdW0oQPAIsXOqBK+MPtWDMHAORo4MuXtZeVC8gOaxSyeNqJxNNZXF
	 TbH88JMcZ7cONOUtJ+qxK+1nRoT0t7JCgMQHZd14VZbtO6lyJNpH44CsPJ/OCFWwH6
	 bCJZbMf26MAuMr0oB6qUIyRcBXWxkoU0xmqGmIeoTZES+EvYdzXfaflTKlanU2y4uE
	 7vCUlKsUilz7Q==
Date: Fri, 25 Aug 2023 13:56:42 +0200
From: Christian Brauner <brauner@kernel.org>
To: Jan Kara <jack@suse.cz>
Cc: Jens Axboe <axboe@kernel.dk>, linux-fsdevel@vger.kernel.org,
	linux-block@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
	xen-devel@lists.xenproject.org, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 07/29] xen/blkback: Convert to bdev_open_by_dev()
Message-ID: <20230825-flatterhaft-zugluft-557515f1b2e7@brauner>
References: <20230818123232.2269-1-jack@suse.cz>
 <20230823104857.11437-7-jack@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230823104857.11437-7-jack@suse.cz>

On Wed, Aug 23, 2023 at 12:48:18PM +0200, Jan Kara wrote:
> Convert xen/blkback to use bdev_open_by_dev() and pass the
> handle around.
> 
> CC: xen-devel@lists.xenproject.org
> Acked-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Jan Kara <jack@suse.cz>
> ---

Looks good to me,
Acked-by: Christian Brauner <brauner@kernel.org>

