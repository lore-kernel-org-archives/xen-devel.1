Return-Path: <SRS0=uMCZ=IY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29E8EC433DB
	for <xen-devel@archiver.kernel.org>; Fri, 26 Mar 2021 11:45:10 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D850861601
	for <xen-devel@archiver.kernel.org>; Fri, 26 Mar 2021 11:45:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D850861601
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.101713.194673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPktc-0000ke-Nj; Fri, 26 Mar 2021 11:44:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101713.194673; Fri, 26 Mar 2021 11:44:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPktc-0000kX-Kr; Fri, 26 Mar 2021 11:44:56 +0000
Received: by outflank-mailman (input) for mailman id 101713;
 Fri, 26 Mar 2021 11:44:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPktb-0000kM-GK
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 11:44:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPktb-0005jZ-Dp
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 11:44:55 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPktb-0007ur-C7
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 11:44:55 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lPktX-0002IM-Nk; Fri, 26 Mar 2021 11:44:51 +0000
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
	bh=+UewVNXB5X7/GBZ2eWJSW9f/mfh+r1p/FoASrAd6zhA=; b=pRl2Fou9am8kJelT+JgHDczBgw
	wy9hVLMYoytrJR7EpfgBRTVzbjb4SfnDVJZzCfCeOFA99546ULCpqsqrpcvQE1at1zG2h0w4JHowM
	P8+irytrJfhGsfxY/DUBz8sU2Hv2/v31FZ6IIR498QLh5VQA+8dz7RVre2KfgEb04jy0=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24669.51507.523770.695347@mariner.uk.xensource.com>
Date: Fri, 26 Mar 2021 11:44:51 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/2] Branching: Update version files etc. for newly
 unstable
In-Reply-To: <0c938aa8-a954-55f5-7d21-37f2c10ea136@suse.com>
References: <20210324162831.7587-1-iwj@xenproject.org>
	<0c938aa8-a954-55f5-7d21-37f2c10ea136@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH 1/2] Branching: Update version files etc. for newly unstable"):
> I suppose you didn't mean to leave "-rc" in there?

You are right.  I will fix it in a moment.

Ian.

