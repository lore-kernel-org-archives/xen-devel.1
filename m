Return-Path: <SRS0=/2oJ=GW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E934AC433E6
	for <xen-devel@archiver.kernel.org>; Tue, 19 Jan 2021 15:23:19 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99E3E23119
	for <xen-devel@archiver.kernel.org>; Tue, 19 Jan 2021 15:23:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99E3E23119
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.70511.126571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1sqb-0005hE-On; Tue, 19 Jan 2021 15:23:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 70511.126571; Tue, 19 Jan 2021 15:23:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1sqb-0005h7-Lo; Tue, 19 Jan 2021 15:23:09 +0000
Received: by outflank-mailman (input) for mailman id 70511;
 Tue, 19 Jan 2021 15:23:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rdq3=GW=linuxfoundation.org=gregkh@srs-us1.protection.inumbo.net>)
 id 1l1sqa-0005h2-Lc
 for xen-devel@lists.xenproject.org; Tue, 19 Jan 2021 15:23:08 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7966859b-2c65-4635-9330-8b64605bb0b9;
 Tue, 19 Jan 2021 15:23:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5392E22D2A;
 Tue, 19 Jan 2021 15:23:06 +0000 (UTC)
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
X-Inumbo-ID: 7966859b-2c65-4635-9330-8b64605bb0b9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1611069786;
	bh=pqyZ0jdGM2NW4JqDQHaY/YHHjqBTFdzRAExrriAwkf4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E93roEyk0HlKAwPu8VnBBSpf9m7sK2vnrtivH4G7zrhcNzqWOCv5vJECButDO1tLe
	 Km5YMNt5EO3+cnrS7Ydo2Qw32jytvvsI25+W5xRrnTweCo6GYrDDEgiIzcDAdwOBLO
	 zWH0R/Qur3RBxtFnIFYxKJorEOZkbYMYssXaC4Lc=
Date: Tue, 19 Jan 2021 16:23:04 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: stable@vger.kernel.org, linux-kernel@vger.kernel.org,
	Arthur Borsboom <arthurborsboom@gmail.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Jens Axboe <axboe@kernel.dk>, xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org
Subject: Re: [PATCH v2] xen-blkfront: allow discard-* nodes to be optional
Message-ID: <YAb5WHSglwumI77O@kroah.com>
References: <20210119105727.95173-1-roger.pau@citrix.com>
 <20210119123622.zweul6uqfg54erj3@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210119123622.zweul6uqfg54erj3@Air-de-Roger>

On Tue, Jan 19, 2021 at 01:36:22PM +0100, Roger Pau Monné wrote:
> Forgot to Cc stable for the Fixes tag. Doing it now.

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>

