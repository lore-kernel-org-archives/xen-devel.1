Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5CD5C4707B
	for <xen-devel@archiver.kernel.org>; Wed, 10 Jan 2024 15:31:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.665640.1035856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNaXr-0003Ta-ER; Wed, 10 Jan 2024 15:31:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665640.1035856; Wed, 10 Jan 2024 15:31:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNaXr-0003TT-9h; Wed, 10 Jan 2024 15:31:07 +0000
Received: by outflank-mailman (input) for mailman id 665640;
 Wed, 10 Jan 2024 15:31:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rNaXq-0003TJ-JQ; Wed, 10 Jan 2024 15:31:06 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rNaXq-0005pA-9j; Wed, 10 Jan 2024 15:31:06 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rNaXp-0007Iz-O3; Wed, 10 Jan 2024 15:31:05 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rNaXp-0007t7-NR; Wed, 10 Jan 2024 15:31:05 +0000
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
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=EzseTJjYvRtFYdoN/LSK/SVYVnq85UhsWqAwn/28Fys=; b=NhFL6TZCCT1yhFoVkOZGs+RL67
	otWKV5eSYUGbARdUc4ROrdbAZmUfq4H1/cDEffq5+sO7BMA7P4widM0wOCObvFn9ogJbc5PItlq0w
	Z58w/cRlPHoJYr236FgIluQLrIV13wq5F5cgRLz/suFC6psZF1G4XYl1+amOVkM51p24=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184308-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xtf test] 184308: all pass - PUSHED
X-Osstest-Versions-This:
    xtf=f3bd152f5e83da943535f6ba7b5772d4dbe96717
X-Osstest-Versions-That:
    xtf=837f771d9612215d5e6c9a1a41bf3b3ab0d0b381
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 10 Jan 2024 15:31:05 +0000

flight 184308 xtf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184308/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xtf                  f3bd152f5e83da943535f6ba7b5772d4dbe96717
baseline version:
 xtf                  837f771d9612215d5e6c9a1a41bf3b3ab0d0b381

Last test of basis   184294  2024-01-09 12:14:55 Z    1 days
Testing same since   184308  2024-01-10 14:12:53 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>

jobs:
 build-amd64-xtf                                              pass    
 build-amd64                                                  pass    
 build-amd64-pvops                                            pass    
 test-xtf-amd64-amd64-1                                       pass    
 test-xtf-amd64-amd64-2                                       pass    
 test-xtf-amd64-amd64-3                                       pass    
 test-xtf-amd64-amd64-4                                       pass    
 test-xtf-amd64-amd64-5                                       pass    


------------------------------------------------------------
sg-report-flight on osstest.test-lab.xenproject.org
logs: /home/logs/logs
images: /home/logs/images

Logs, config files, etc. are available at
    http://logs.test-lab.xenproject.org/osstest/logs

Explanation of these reports, and of osstest in general, is at
    http://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=README.email;hb=master
    http://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=README;hb=master

Test harness code can be found at
    http://xenbits.xen.org/gitweb?p=osstest.git;a=summary


Pushing revision :

To xenbits.xen.org:/home/xen/git/xtf.git
   837f771..f3bd152  f3bd152f5e83da943535f6ba7b5772d4dbe96717 -> xen-tested-master

