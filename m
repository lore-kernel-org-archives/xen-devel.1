Return-Path: <SRS0=7l2D=P2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4E06C433F5
	for <xen-devel@archiver.kernel.org>; Sun,  7 Nov 2021 09:49:43 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5831A6134F
	for <xen-devel@archiver.kernel.org>; Sun,  7 Nov 2021 09:49:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5831A6134F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.222794.385165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mjenc-0004iq-BL; Sun, 07 Nov 2021 09:49:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222794.385165; Sun, 07 Nov 2021 09:49:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mjenc-0004ij-8L; Sun, 07 Nov 2021 09:49:16 +0000
Received: by outflank-mailman (input) for mailman id 222794;
 Sun, 07 Nov 2021 09:49:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mjenb-0004iZ-3c; Sun, 07 Nov 2021 09:49:15 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mjena-00011X-TJ; Sun, 07 Nov 2021 09:49:14 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mjena-0008IW-L5; Sun, 07 Nov 2021 09:49:14 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mjena-000590-Ke; Sun, 07 Nov 2021 09:49:14 +0000
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
	bh=J90zp8+MkL5vh853B5RmOJAERi8gcq5H6AVyZ6ewWFk=; b=p1JtADeVGQzswB7ykWgpjwtGMa
	a01SzxB4zhrU2WT2QaRX+sj91txjhVLV/WsPh0ZvwDfiAz72uFz/Vz21t1kfr1bjyydQPTpM067C4
	+9B2lYp8+Jb87stawQTUnMsrdYfx2xP2ceGV42GYTEcMBxdv6v3YkgFWvb87aGcE9mCE=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-166078-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 166078: all pass - PUSHED
X-Osstest-Versions-This:
    xen=9bc9fff04ba077c4a9782f12578362d8947c534b
X-Osstest-Versions-That:
    xen=9f8434d77859462ad98a51ec49ad8e23769d9b10
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 07 Nov 2021 09:49:14 +0000

flight 166078 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/166078/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  9bc9fff04ba077c4a9782f12578362d8947c534b
baseline version:
 xen                  9f8434d77859462ad98a51ec49ad8e23769d9b10

Last test of basis   166027  2021-11-03 09:19:42 Z    4 days
Testing same since   166078  2021-11-07 09:18:29 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Dongli Zhang <dongli.zhang@oracle.com>
  Ian Jackson <iwj@xenproject.org>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Luca Fancellu <luca.fancellu@arm.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Stefano Stabellini <sstabellini@kernel.org>

jobs:
 coverity-amd64                                               pass    


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

To xenbits.xen.org:/home/xen/git/xen.git
   9f8434d778..9bc9fff04b  9bc9fff04ba077c4a9782f12578362d8947c534b -> coverity-tested/smoke

