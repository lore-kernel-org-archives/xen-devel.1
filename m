Return-Path: <SRS0=zvGf=KJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ACB5C433ED
	for <xen-devel@archiver.kernel.org>; Fri, 14 May 2021 21:26:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFE216134F
	for <xen-devel@archiver.kernel.org>; Fri, 14 May 2021 21:26:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFE216134F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.127587.239804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhfK8-0000rn-5Q; Fri, 14 May 2021 21:26:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127587.239804; Fri, 14 May 2021 21:26:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhfK8-0000rg-2H; Fri, 14 May 2021 21:26:20 +0000
Received: by outflank-mailman (input) for mailman id 127587;
 Fri, 14 May 2021 21:26:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lhfK7-0000rW-1j; Fri, 14 May 2021 21:26:19 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lhfK6-0001dn-Tp; Fri, 14 May 2021 21:26:18 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lhfK6-00060w-MF; Fri, 14 May 2021 21:26:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lhfK6-0008Tq-Lp; Fri, 14 May 2021 21:26:18 +0000
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
	bh=opZifqcHdh4O0vUzMm5OwdDp5MuulbEJ1kC8iNjUyds=; b=PYkGwntXTN5zshGsiqf9XVh6E0
	+dCYXmXu6KgQ2Ap3xY8OOXlWKlq+z3CfeGp/Aauqb2IND7J4WUxKdygqHFr0v0ngJMxCiP2G7c5SF
	bG6Du/tGKnOHOG5/aFuUVFf1o/RH098CrMS+pRaEQRnn/UWzbuR/HlrabtoyNGEl6E6w=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-161949-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 161949: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=d82c4693f8d5c6b05f40ccf351c84645201067c1
X-Osstest-Versions-That:
    ovmf=22ac5cc9d9db34056f7c97e994fd9def683ebb2e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 14 May 2021 21:26:18 +0000

flight 161949 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/161949/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 d82c4693f8d5c6b05f40ccf351c84645201067c1
baseline version:
 ovmf                 22ac5cc9d9db34056f7c97e994fd9def683ebb2e

Last test of basis   161943  2021-05-14 03:41:19 Z    0 days
Testing same since   161949  2021-05-14 10:10:07 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Sergei Dmitrouk <sergei@posteo.net>

jobs:
 build-amd64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    


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

To xenbits.xen.org:/home/xen/git/osstest/ovmf.git
   22ac5cc9d9..d82c4693f8  d82c4693f8d5c6b05f40ccf351c84645201067c1 -> xen-tested-master

