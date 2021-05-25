Return-Path: <SRS0=5a5X=KU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCEAEC2B9F8
	for <xen-devel@archiver.kernel.org>; Tue, 25 May 2021 07:03:19 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7307B6138C
	for <xen-devel@archiver.kernel.org>; Tue, 25 May 2021 07:03:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7307B6138C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.132072.246493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llR5j-0007CD-31; Tue, 25 May 2021 07:03:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132072.246493; Tue, 25 May 2021 07:03:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llR5j-0007C6-04; Tue, 25 May 2021 07:03:03 +0000
Received: by outflank-mailman (input) for mailman id 132072;
 Tue, 25 May 2021 07:03:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n3nm=KU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1llR5i-0007C0-AT
 for xen-devel@lists.xenproject.org; Tue, 25 May 2021 07:03:02 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4142c3a0-7b83-4ed6-b517-c793a7c588f0;
 Tue, 25 May 2021 07:03:01 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 53E81AE99;
 Tue, 25 May 2021 07:03:00 +0000 (UTC)
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
X-Inumbo-ID: 4142c3a0-7b83-4ed6-b517-c793a7c588f0
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621926180; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VJ7IVAyhd+ypXbSEjQNSSNr9w7SRTpHwAFx4NKCZ1Ms=;
	b=EZuaBG9MGug1dsr5q5sfMwMvHhdFr+i5u6nd4kpDN7CgA7nB6h9+KKliqowY2uYgamJojq
	s+NiP0TCpMdUvCEud9E8RWc7647321rBxCvNLm9plEOWHQv46KVEYKBTTfW1xZvKgOmKKq
	cLPm8Spw3Z6jODeyMZTibTTLlbL3zEI=
Subject: Re: [PATCH v4 1/4] xen/char: Default HAS_NS16550 to y only for X86
 and ARM
To: Connor Davis <connojdavis@gmail.com>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair23@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Alistair Francis <alistair.francis@wdc.com>,
 xen-devel@lists.xenproject.org
References: <cover.1621712830.git.connojdavis@gmail.com>
 <2a8329da33d2af0eab8581a01e3098e8360bda87.1621712830.git.connojdavis@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <97ef9c85-b5ba-42c6-88f0-6ac66063754c@suse.com>
Date: Tue, 25 May 2021 09:02:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <2a8329da33d2af0eab8581a01e3098e8360bda87.1621712830.git.connojdavis@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 24.05.2021 16:34, Connor Davis wrote:
> Defaulting to yes only for X86 and ARM reduces the requirements
> for a minimal build when porting new architectures.
> 
> Signed-off-by: Connor Davis <connojdavis@gmail.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


