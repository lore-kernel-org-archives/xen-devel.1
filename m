Return-Path: <SRS0=UsJP=GQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06538C433DB
	for <xen-devel@archiver.kernel.org>; Wed, 13 Jan 2021 13:15:35 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 857BB23433
	for <xen-devel@archiver.kernel.org>; Wed, 13 Jan 2021 13:15:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 857BB23433
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cam.ac.uk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.66499.118129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzfzb-0001KH-UN; Wed, 13 Jan 2021 13:15:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66499.118129; Wed, 13 Jan 2021 13:15:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzfzb-0001KA-Qp; Wed, 13 Jan 2021 13:15:19 +0000
Received: by outflank-mailman (input) for mailman id 66499;
 Wed, 13 Jan 2021 13:15:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdpw=GQ=cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1kzfzZ-0001K5-8O
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 13:15:19 +0000
Received: from ppsw-41.csi.cam.ac.uk (unknown [131.111.8.141])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d1bc390e-b34c-49fe-8dff-4197da52d624;
 Wed, 13 Jan 2021 13:15:13 +0000 (UTC)
Received: from 88-111-100-194.dynamic.dsl.as9105.com ([88.111.100.194]:55620
 helo=[192.168.1.219])
 by ppsw-41.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.159]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1kzfzU-000O4o-RB (Exim 4.92.3)
 (return-path <amc96@cam.ac.uk>); Wed, 13 Jan 2021 13:15:12 +0000
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
X-Inumbo-ID: d1bc390e-b34c-49fe-8dff-4197da52d624
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cam.ac.uk;
	 s=20180806.ppsw; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4VeaFjZ3HkICosSFunM++mJb6snEMOPx6TReacqZq08=; b=I5oFE877u0VHqWIHieYzV/NCGM
	GyvuRkJjwHk95UN+vZFgK9GejQl67dh7f0FkJSJ+qucP9K50ZaJB7BqfhrgXDFzdLZSL3PAxtFvt/
	duQiVMFPEvUlYKBsidekXF6/mVLHUakbhePyiewaxbrVL9HxUKDmqSZEPUepvdpKKV0g=;
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Subject: Re: [PATCH 1/3] tools/tests: Drop obsolete running scripts
To: Ian Jackson <iwj@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
References: <20210113123455.23209-1-andrew.cooper3@citrix.com>
 <20210113123455.23209-2-andrew.cooper3@citrix.com>
 <24574.61324.543410.159952@mariner.uk.xensource.com>
From: Andrew Cooper <amc96@cam.ac.uk>
Message-ID: <f03ee65a-8b8a-57ac-0c78-0f9a356b2697@cam.ac.uk>
Date: Wed, 13 Jan 2021 13:15:06 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <24574.61324.543410.159952@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB

On 13/01/2021 13:03, Ian Jackson wrote:
> Andrew Cooper writes ("[PATCH 1/3] tools/tests: Drop obsolete running scripts"):
>> The python unit tests were dropped in Xen 4.12 due to being obsolete, but the
>> scripts to run the tests were missed.  Clean up .gitignore as well
> I'm happy with this part.
>
>> Also drop the libxenctrl {C,LD}FLAGS adjustments in the Makefile.  This logic
>> isn't used, and isn't appropriate even in principle, as there are tests in
>> here which don't want to use libxenctrl.
> It's not clear to me that it's EBW to link all the tests to libxenctrl
> simply to make the build easier.
>
> In a later patch you add these settings back as part of a particular
> test target.
>
> I don't much mind it being done this way, and you've done the work, so
> I am giving this my ack, but I just wanted to register my qualm in
> case you had a second thought.

These lines aren't used, because this Makefile doesn't compile/link any
code.  They don't apply to subdirs.

More than half the remaining content in tests/ really are unit tests,
and must not be linked against libxc if they want to be run outside of
dom0 (e.g. the developers build box.)

> FTR, however, IMO the -DXC_WANT_COMPAT_DEVICEMODEL_API that you move
> to a specific test program in a later patch is something that ought
> not to be applied to all tests, so there doing it that way is
> necessary - thanks.
>
> Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

Thanks,

~Andrew

