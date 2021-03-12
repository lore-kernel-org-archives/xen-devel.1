Return-Path: <SRS0=dPyG=IK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D439DC433DB
	for <xen-devel@archiver.kernel.org>; Fri, 12 Mar 2021 10:25:10 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74CF465002
	for <xen-devel@archiver.kernel.org>; Fri, 12 Mar 2021 10:25:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74CF465002
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.96969.183965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKeyb-0007QF-1C; Fri, 12 Mar 2021 10:25:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96969.183965; Fri, 12 Mar 2021 10:25:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKeya-0007Q8-UV; Fri, 12 Mar 2021 10:25:00 +0000
Received: by outflank-mailman (input) for mailman id 96969;
 Fri, 12 Mar 2021 10:25:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lKeya-0007Q3-Is
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 10:25:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lKeya-0005YR-I2
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 10:25:00 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lKeya-0002uy-HC
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 10:25:00 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lKeyX-0003Y2-7E; Fri, 12 Mar 2021 10:24:57 +0000
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
	bh=djRI6z83hqBJ/Xzgaks9+EyKWbP13MvTx4JfTcOnNDY=; b=kNVZuCbwiveZMMyVA/PGXTjRR/
	dCvBRYQuLi+v5qg5dA3PZ5ck85ftlvn0RHha15yXp9qQXBqc/g0K7StFbXitiD4QHpLmG0Ze0X77+
	tnFFX83LYeMtVLo1eHG0sVy2AQ2aK65CjhVFfibJ4kGq8w7bqtwsaN22ynFWgvFoZ4tk=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24651.16760.951727.831368@mariner.uk.xensource.com>
Date: Fri, 12 Mar 2021 10:24:56 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Wei Liu <wl@xen.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 2/2] tools/x86: move arch-specific include/xen/ population
 into arch-specific rule
In-Reply-To: <e6bcfa87-aa12-97dd-23f4-d2f085e2e4f6@suse.com>
References: <1365013b-1e90-aeb2-3c80-7a5c6284c46a@suse.com>
	<e6bcfa87-aa12-97dd-23f4-d2f085e2e4f6@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("[PATCH v2 2/2] tools/x86: move arch-specific include/xen/ population into arch-specific rule"):
> There's no need for the common "xen-dir" rule to have an arch-specific
> part when there already is a arch-specific rule where this can be taken
> care of (arguably instead of all-y this might better be xendir-y
> anyway).

Thanks, but I do not like this change.

IMO make commands should be primarily organised by their logical
function and role in the file.  If that means that multiple targets
have arch-specific parts, so be it.

IMO it is not right to move something from xen-dir to all just to
reduce the number of different targets with arch-specific parts.

Ian.

