Return-Path: <SRS0=Kis3=EM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CD1DC2D0A3
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2020 14:35:35 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4B6E2087E
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2020 14:35:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="Ge48ZGBW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4B6E2087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.20850.46875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kb2pd-0004h9-Ha; Fri, 06 Nov 2020 14:35:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20850.46875; Fri, 06 Nov 2020 14:35:13 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kb2pd-0004h2-Eh; Fri, 06 Nov 2020 14:35:13 +0000
Received: by outflank-mailman (input) for mailman id 20850;
 Fri, 06 Nov 2020 14:35:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DqEO=EM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kb2pd-0004gx-2s
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 14:35:13 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f7e2deb8-426a-4037-8c6f-b565494ea3dd;
 Fri, 06 Nov 2020 14:35:12 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8E137AE09;
 Fri,  6 Nov 2020 14:35:11 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=DqEO=EM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kb2pd-0004gx-2s
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 14:35:13 +0000
X-Inumbo-ID: f7e2deb8-426a-4037-8c6f-b565494ea3dd
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f7e2deb8-426a-4037-8c6f-b565494ea3dd;
	Fri, 06 Nov 2020 14:35:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604673311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zie/iFpkyz7Vm32IBQPlFpo7z97lWE4i4u88Ovukv2I=;
	b=Ge48ZGBW8QnB+ajj7ILsuFECNVF6YhUXYFJl4W9zNJNRVO6/sS/1QM97VEvgEVkMbmxXWm
	UCpoMCcwR3Y5ie4aNqxz3uoLt+BQM8Z0M3b/aPN4V1RHqHr1xfE/jNEzG8l0YZL4atOWJ5
	gVOPr/vQre6FL76Lj8bPpuujAV06swc=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 8E137AE09;
	Fri,  6 Nov 2020 14:35:11 +0000 (UTC)
Subject: Re: [PATCH] tools/libs/light: correct bitmap operations
To: Juergen Gross <jgross@suse.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20201106140504.25488-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <61860ac6-133a-0393-e63c-8de9ea13e5f9@suse.com>
Date: Fri, 6 Nov 2020 15:35:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201106140504.25488-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 06.11.2020 15:05, Juergen Gross wrote:
> Libxl bitmap operations for single bits (test, set, reset) take the bit
> number as a signed integer without testing the value to be larger than
> 0.
> 
> Correct that by adding the appropriate tests.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Wouldn't it be better to convert the parameter types to unsigned int?

Jan

