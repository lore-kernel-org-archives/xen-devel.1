Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DFC2C433F5
	for <xen-devel@archiver.kernel.org>; Fri, 26 Nov 2021 19:18:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.233447.405055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqgiy-0002DL-0H; Fri, 26 Nov 2021 19:17:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233447.405055; Fri, 26 Nov 2021 19:17:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqgix-0002DE-TI; Fri, 26 Nov 2021 19:17:31 +0000
Received: by outflank-mailman (input) for mailman id 233447;
 Fri, 26 Nov 2021 19:17:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mqgix-0002D8-51
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 19:17:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mqgix-0006gD-3P
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 19:17:31 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mqgix-0006tE-2O
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 19:17:31 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>) id 1mqgiu-0003if-T2
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 19:17:28 +0000
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
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:To:Date:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=q9gVPBkUnoJePWp10nNq8pZXCRX7DVJi8oCZ7SMct2w=; b=09KvZWMQJGJBwCSLQ5RBmXcE3Y
	5XN2Lb2asOKLLdLE8V3QxuJU24iSIF9fp68E576vYb4ICwss0WqTq6Wj7B4XlhhRdrQ4eQGnJxWYW
	03cIk3FC2cEjb2xIbgzfFOinfsOv8DFYBYH3es8oVa6/g/yEfEToXQ+v1yGheCwRLpMs=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24993.13000.254192.278702@mariner.uk.xensource.com>
Date: Fri, 26 Nov 2021 19:17:28 +0000
To: xen-devel@lists.xenproject.org
Subject: Re: [xen-unstable test] 166378: regressions - FAIL
In-Reply-To: <osstest-166378-mainreport@xen.org>
References: <osstest-166378-mainreport@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

osstest service owner writes ("[xen-unstable test] 166378: regressions - FAIL"):
> flight 166378 xen-unstable real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/166378/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  build-amd64-prev              6 xen-build                fail REGR. vs. 166304

git submodules.  Horror.

Cloning into '/home/osstest/build.166378.build-amd64-prev/xen/tools/firmware/ovmf-dir-remote/UnitTestFrameworkPkg/Library/CmockaLib/cmocka'...
fatal: remote error: git-cache-proxy: git remote died with error exit code 1 // Fetching origin // fatal: unable to access 'https://git.cryptomilk.org/projects/cmocka.git/': Failed to connect to git.cryptomilk.org port 443: Connection refused // error: Could not fetch origin
fatal: clone of 'https://git.cryptomilk.org/projects/cmocka.git' into submodule path '/home/osstest/build.166378.build-amd64-prev/xen/tools/firmware/ovmf-dir-remote/UnitTestFrameworkPkg/Library/CmockaLib/cmocka' failed
Failed to clone 'UnitTestFrameworkPkg/Library/CmockaLib/cmocka'. Retry scheduled
Cloning into '/home/osstest/build.166378.build-amd64-prev/xen/tools/firmware/ovmf-dir-remote/UnitTestFrameworkPkg/Library/CmockaLib/cmocka'...
fatal: remote error: git-cache-proxy: git remote died with error exit code 1 // Fetching origin // fatal: unable to access 'https://git.cryptomilk.org/projects/cmocka.git/': Failed to connect to git.cryptomilk.org port 443: Connection refused // error: Could not fetch origin
fatal: clone of 'https://git.cryptomilk.org/projects/cmocka.git' into submodule path '/home/osstest/build.166378.build-amd64-prev/xen/tools/firmware/ovmf-dir-remote/UnitTestFrameworkPkg/Library/CmockaLib/cmocka' failed
Failed to clone 'UnitTestFrameworkPkg/Library/CmockaLib/cmocka' a second time, aborting

>  test-amd64-amd64-xl-pvshim   20 guest-localmigrate/x10   fail REGR. vs. 166304

ssh to guest took >10s.

Ian.

