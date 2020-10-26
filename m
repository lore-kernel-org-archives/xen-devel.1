Return-Path: <SRS0=Fpha=EB=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7DA7C56202
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2020 13:35:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E0712465B
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2020 13:35:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="oSGxm1L+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E0712465B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.12318.32094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kX2eO-0005ez-Rx; Mon, 26 Oct 2020 13:35:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12318.32094; Mon, 26 Oct 2020 13:35:04 +0000
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
	id 1kX2eO-0005es-OR; Mon, 26 Oct 2020 13:35:04 +0000
Received: by outflank-mailman (input) for mailman id 12318;
 Mon, 26 Oct 2020 13:35:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l58c=EB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kX2eN-0005em-60
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 13:35:03 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c1e74d0d-5a5e-4627-98c8-83a66328c2b4;
 Mon, 26 Oct 2020 13:35:02 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 22E18AD83;
 Mon, 26 Oct 2020 13:35:01 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=l58c=EB=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kX2eN-0005em-60
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 13:35:03 +0000
X-Inumbo-ID: c1e74d0d-5a5e-4627-98c8-83a66328c2b4
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c1e74d0d-5a5e-4627-98c8-83a66328c2b4;
	Mon, 26 Oct 2020 13:35:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603719301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2uDrOTb0Os/dYcoOTbQJ3/XBQHfsOHXatctiWkXpN9w=;
	b=oSGxm1L+3SyqyqHuoRb6wzTCk4Vz2EwfSDYUKJav5wLxoyLmLJ+oxnvND079Yv3/lMm2/4
	dPnombvhzXvosOCysJ02C/upxLJq99Em4BFVwSOIecVhdJzWuNLL9G/KA/pReUhCAwKzYb
	fJQuZKlofsweFhuIGvXA6s8nr62qXcg=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 22E18AD83;
	Mon, 26 Oct 2020 13:35:01 +0000 (UTC)
Subject: Re: [xen-unstable-smoke test] 156241: regressions - trouble:
 blocked/fail
To: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <osstest-156241-mainreport@xen.org>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <8528afe9-4225-1942-9f7c-54ec50379345@suse.com>
Date: Mon, 26 Oct 2020 14:35:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <osstest-156241-mainreport@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.10.20 14:27, osstest service owner wrote:
> flight 156241 xen-unstable-smoke real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/156241/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>   build-amd64                   6 xen-build                fail REGR. vs. 156117
>   build-arm64-xsm               6 xen-build                fail REGR. vs. 156117
>   build-armhf                   6 xen-build                fail REGR. vs. 156117

I'm pretty sure these failures will be fixed by my patch

"tools/libs: let build depend on official headers"


Juergen

