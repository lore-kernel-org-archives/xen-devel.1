Return-Path: <SRS0=fV0s=IG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32F98C433DB
	for <xen-devel@archiver.kernel.org>; Mon,  8 Mar 2021 09:45:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCB7A65134
	for <xen-devel@archiver.kernel.org>; Mon,  8 Mar 2021 09:45:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCB7A65134
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.94736.178349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJCRa-0004VH-5s; Mon, 08 Mar 2021 09:44:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94736.178349; Mon, 08 Mar 2021 09:44:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJCRa-0004VA-2s; Mon, 08 Mar 2021 09:44:54 +0000
Received: by outflank-mailman (input) for mailman id 94736;
 Mon, 08 Mar 2021 09:44:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lJCRZ-0004V5-3h
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 09:44:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lJCRZ-0000w7-2v
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 09:44:53 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lJCRZ-0002JG-21
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 09:44:53 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lJCRO-0007yq-5O; Mon, 08 Mar 2021 09:44:42 +0000
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
	bh=Aj0EJl06pIis/syNLPV8aPivy3Qr3YYxG+jlAI5iJvs=; b=TrdmLuzBNgDJk2s7ZmGpmZX8eU
	2OTmewJOTbItl1xWklCtRvnx7n6oDR+cbu4vGglpwzxsSrgPYJObSyF76jqjoUJgxBbRG7g8EVxZ+
	X4WtFA0VUu2YlNcuyvFQSAEnCqeGbPotJu4TO03UtzaIMYvaT2QbdpALsXtJ5IDqw9RY=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24645.61961.964574.269753@mariner.uk.xensource.com>
Date: Mon, 8 Mar 2021 09:44:41 +0000
To: Julien Grall <julien@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>,
    =?iso-8859-1?Q?J=FCrgen_Gro=DF?=  <jgross@suse.com>,
    raphning@amazon.co.uk,
    Julien Grall <jgrall@amazon.com>,
    Wei Liu <wl@xen.org>,
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.15 2/2] tools/xenstore: Check the format printf for
 xprintf() and barf{,_perror}()
In-Reply-To: <0249af89-ced0-0f7f-d370-9ffade6b1678@xen.org>
References: <20210305124003.13582-1-julien@xen.org>
	<20210305124003.13582-3-julien@xen.org>
	<0994b7a0-c537-b312-b134-caf54c79c87f@suse.com>
	<74568cd7-143b-48ad-b9be-bf4229655376@suse.com>
	<7eb12174-3268-ccdb-df9c-c4fe23d3a332@xen.org>
	<24642.14600.124181.19574@mariner.uk.xensource.com>
	<0249af89-ced0-0f7f-d370-9ffade6b1678@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Julien Grall writes ("Re: [PATCH for-4.15 2/2] tools/xenstore: Check the format printf for xprintf() and barf{,_perror}()"):
> Would the following comment work for you?
> 
> /* Function pointer as xprintf() can be configured at runtime. */
> 
> I can fold it in my patch while committing.

Sure, thanks.  FTAOD

Reviewed-by: Ian Jackson <iwj@xenproject.org>
Release-Acked-by: Ian Jackson <iwj@xenproject.org>

to that comment addition.

Ian.

