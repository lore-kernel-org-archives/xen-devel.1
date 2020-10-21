Return-Path: <SRS0=90EN=D4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3081C4363A
	for <xen-devel@archiver.kernel.org>; Wed, 21 Oct 2020 10:10:37 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 695D2221FC
	for <xen-devel@archiver.kernel.org>; Wed, 21 Oct 2020 10:10:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="RntKs8ir"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 695D2221FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.9962.26277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVB4U-0004JB-4w; Wed, 21 Oct 2020 10:10:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9962.26277; Wed, 21 Oct 2020 10:10:18 +0000
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
	id 1kVB4U-0004J4-1t; Wed, 21 Oct 2020 10:10:18 +0000
Received: by outflank-mailman (input) for mailman id 9962;
 Wed, 21 Oct 2020 10:10:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JBpP=D4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kVB4S-0004Iz-6h
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 10:10:16 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6004a910-c7d0-49b7-b173-32f3cfa0e013;
 Wed, 21 Oct 2020 10:10:15 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 73CECB2B8;
 Wed, 21 Oct 2020 10:10:14 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=JBpP=D4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kVB4S-0004Iz-6h
	for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 10:10:16 +0000
X-Inumbo-ID: 6004a910-c7d0-49b7-b173-32f3cfa0e013
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 6004a910-c7d0-49b7-b173-32f3cfa0e013;
	Wed, 21 Oct 2020 10:10:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603275014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JUflINopUiLlYqrN5sufhJ97Pnst6amZ13r1ziOvJmg=;
	b=RntKs8irZM6otmiq+F1ExDUtCKICWbEFVGqk6Sg9IkgELvmIPYTpxCk1s9KNOcFrfi2wWE
	SeZoLKc5/mskn7OkqTIa0o+ghw/mU/vyxVs21bhlo/+7wQAuwATvwkEg/1lLH7qX9pP85Q
	c8oI+OZpxlfOfk20jPjk+5/C0NcAgvw=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 73CECB2B8;
	Wed, 21 Oct 2020 10:10:14 +0000 (UTC)
Subject: Re: [xen-unstable test] 156027: regressions - FAIL
To: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>
References: <osstest-156027-mainreport@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Cc: osstest service owner <osstest-admin@xenproject.org>
Message-ID: <432399e9-9bd2-07d2-c182-353e0b7f21d4@suse.com>
Date: Wed, 21 Oct 2020 12:10:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <osstest-156027-mainreport@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 20.10.2020 23:37, osstest service owner wrote:
> flight 156027 xen-unstable real [real]
> flight 156048 xen-unstable real-retest [real]
> http://logs.test-lab.xenproject.org/osstest/logs/156027/
> http://logs.test-lab.xenproject.org/osstest/logs/156048/

Here as well as in the respective 4.14 and 4.13 reports the
"retest" flights look to not really work, so they don't provide
any additional useful data. Ian?

> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  test-amd64-i386-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail REGR. vs. 156013

Taking together this and the respective 4.14 and 4.13 reports
there looks to be an interaction problem with qemu: The gpa
of the physical address of the NPF vCPU1 did encounter last
points at 04:00.0, i.e. the (emulated) NIC. In the 4.x flights
no such information is available (on VT-x the gpa of the last
EPT violation doesn't get dumped when dumping the VMCS), but
one of them shows Dom0 in the context of
XEN_DMOP_set_pci_intx_level, again for 04:00.0.

In any event the guests in all cases experience soft lockups.

What I'm unable to do for the moment is put in place any kind
of connection to the commits under test, but it's highly
likely one of the security fixes committed yesterday.

Jan

