Return-Path: <SRS0=Zr9Q=MT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2A5CC4338F
	for <xen-devel@archiver.kernel.org>; Tue, 27 Jul 2021 13:27:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DBCD61A60
	for <xen-devel@archiver.kernel.org>; Tue, 27 Jul 2021 13:27:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6DBCD61A60
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.161183.295959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8N7O-0006rh-VP; Tue, 27 Jul 2021 13:27:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161183.295959; Tue, 27 Jul 2021 13:27:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8N7O-0006ra-SP; Tue, 27 Jul 2021 13:27:34 +0000
Received: by outflank-mailman (input) for mailman id 161183;
 Tue, 27 Jul 2021 13:27:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m8N7N-0006rQ-NX
 for xen-devel@lists.xenproject.org; Tue, 27 Jul 2021 13:27:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m8N7N-00064J-4O
 for xen-devel@lists.xenproject.org; Tue, 27 Jul 2021 13:27:33 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m8N7N-0007lH-3V
 for xen-devel@lists.xenproject.org; Tue, 27 Jul 2021 13:27:33 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1m8N7I-0002YO-GN; Tue, 27 Jul 2021 14:27:28 +0100
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=Qh308XA4oQeCTo6wf1iuCob/cAw84HNdX6QGqkAgNAM=; b=XV6YhTTOBLAL48vbZj2n374xEI
	V25ZXIsonhKgQXt0subrqHqLagTvHIE9x6PcsBFJvkCfyEsIrdC+CVsHHWDZcYQ659PGtcsTjS+X8
	UlvfBuzImCX6vWfuavWHtZo3fgDSB6gT3iS8Q910FgCBbuGYBzv4pc1Iq3K5epUYugRs=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24832.2496.323844.216236@mariner.uk.xensource.com>
Date: Tue, 27 Jul 2021 14:27:28 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Alan Robinson <Alan.Robinson@fujitsu.com>,
    <xen-devel@lists.xenproject.org>,
    "Wei  Liu" <wl@xen.org>,
    Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2] tools/libxl: add missing blank in message
In-Reply-To: <YP/dW2trNx1camFQ@perard>
References: <20210727074703.19865-1-Alan.Robinson@fujitsu.com>
	<YP/dW2trNx1camFQ@perard>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Anthony PERARD writes ("Re: [PATCH v2] tools/libxl: add missing blank in message"):
> On Tue, Jul 27, 2021 at 09:47:03AM +0200, Alan Robinson wrote:
> > Add missing blank giving "an emulation" instead of "anemulation"
> > while making the text a single source line.
> > 
> > Signed-off-by: Alan Robinson <alan.robinson@fujitsu.com>
> > ---
> > 
> > Changed since v1:
> >   * text as as single line, requested by Juergen
> > 
> 
> Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Oh, didn't spot this in my earlier reply.  Thanks everyone, I will
dequeue the previous one and queue this instead.

Ian.

