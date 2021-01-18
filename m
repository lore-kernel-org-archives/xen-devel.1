Return-Path: <SRS0=uD1c=GV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46A68C433E0
	for <xen-devel@archiver.kernel.org>; Mon, 18 Jan 2021 16:10:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 038CB22B49
	for <xen-devel@archiver.kernel.org>; Mon, 18 Jan 2021 16:10:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 038CB22B49
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.69852.125167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1X6i-0000aO-2f; Mon, 18 Jan 2021 16:10:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69852.125167; Mon, 18 Jan 2021 16:10:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1X6h-0000aH-V2; Mon, 18 Jan 2021 16:10:19 +0000
Received: by outflank-mailman (input) for mailman id 69852;
 Mon, 18 Jan 2021 16:10:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d36Q=GV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l1X6g-0000aA-Lx
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 16:10:18 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 291eed92-356b-4881-8dd4-664468efe330;
 Mon, 18 Jan 2021 16:10:17 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6D222AF9A;
 Mon, 18 Jan 2021 16:10:16 +0000 (UTC)
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
X-Inumbo-ID: 291eed92-356b-4881-8dd4-664468efe330
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610986216; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e4Lhdg3Y3yeQBJqXlMfPPtvz6pYtq0rV8FzFavQ1B0c=;
	b=AmXK7r7Xw9Zo+3wweU27k/NZsuSl7j9YTtRjnMqZ6UpFCegwfNnbMj6FgOXhOed9RMYfPK
	CJsQvQ9O7bmyaRzIhW+Xkd5zTmKrE3S4ydQffizSvGhdVDmljohD1dRVqS1QV2U1/aqmLn
	EH8g8rTA3q3rZ2pGipWWGf85sZODxyE=
Subject: Re: [xen-unstable-smoke test] 158488: regressions - FAIL
To: xen-devel@lists.xenproject.org
References: <osstest-158488-mainreport@xen.org>
Cc: osstest service owner <osstest-admin@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a34a5ae8-ea4b-5269-63ce-aa3d5fce7d3c@suse.com>
Date: Mon, 18 Jan 2021 17:10:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <osstest-158488-mainreport@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 18.01.2021 16:43, osstest service owner wrote:
> flight 158488 xen-unstable-smoke real [real]
> flight 158490 xen-unstable-smoke real-retest [real]
> http://logs.test-lab.xenproject.org/osstest/logs/158488/
> http://logs.test-lab.xenproject.org/osstest/logs/158490/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  test-arm64-arm64-xl-xsm       8 xen-boot                 fail REGR. vs. 158453

Hmm, I've looked some at the log, but not being used to looking
at Arm logs I'm not sure whether some of the messages are
anomalies. What likely is indicative of the problem are

systemd-udevd[452]: e0010000.kcs: Worker [464] processing SEQNUM=3352 is taking a long time

rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:

I'm having trouble though connecting such to the changes under
test. If anyone has any helpful thoughts, please share.

Jan

