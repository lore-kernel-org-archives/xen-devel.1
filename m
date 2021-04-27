Return-Path: <SRS0=syOn=JY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAE70C433ED
	for <xen-devel@archiver.kernel.org>; Tue, 27 Apr 2021 15:37:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66B8C608FE
	for <xen-devel@archiver.kernel.org>; Tue, 27 Apr 2021 15:37:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66B8C608FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.118640.224834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbPm9-0003MM-QB; Tue, 27 Apr 2021 15:37:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118640.224834; Tue, 27 Apr 2021 15:37:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbPm9-0003MF-MI; Tue, 27 Apr 2021 15:37:25 +0000
Received: by outflank-mailman (input) for mailman id 118640;
 Tue, 27 Apr 2021 15:37:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4dJ3=JY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lbPm8-0003MA-Bw
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 15:37:24 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e356a5e6-f412-4ee8-8eb7-137953bb92e5;
 Tue, 27 Apr 2021 15:37:23 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C011EB1E0;
 Tue, 27 Apr 2021 15:37:22 +0000 (UTC)
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
X-Inumbo-ID: e356a5e6-f412-4ee8-8eb7-137953bb92e5
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619537842; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dKn6Ilad4P4Vpe8uZAU87CBKzN9AMeVUavwViwojt6k=;
	b=pU56aHK4QjyAMHYg10faj2BDu9Otf3Ff0tmFGFgaluGmFK3W3L0hAvBOxz90WrAyRF1N51
	NhLOYLaEsVQ3TcNAu/4MFid9htWBRi6adV2ue6cHZBdeoaZtFvVH0APPFjoWEKEYXlhW75
	EYNLg/15nKRV1e8H1Ig07nxuKc4VBx4=
Subject: Re: [PATCH v3] x86/oprofile: remove compat accessors usage from
 backtrace
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210427142113.31961-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6812da01-72ef-7b88-9512-2feb250de223@suse.com>
Date: Tue, 27 Apr 2021 17:37:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210427142113.31961-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 27.04.2021 16:21, Roger Pau Monne wrote:
> Remove the unneeded usage of the compat layer to copy frame pointers
> from guest address space. Instead just use raw_copy_from_guest.
> 
> While there change the accessibility check of one frame_head beyond to
> be performed as part of the copy, like it's done in the Linux code.

Oh, one further question: I suppose you mean historic Linux here? I
can't find anything like this anymore in current one. If so, I'm
inclined to suggest "..., like used to be done in the Linux code."
Or something substantially similar.

Jan

