Return-Path: <SRS0=GZ64=FB=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17E2BC63777
	for <xen-devel@archiver.kernel.org>; Fri, 27 Nov 2020 07:21:57 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89B1C20B80
	for <xen-devel@archiver.kernel.org>; Fri, 27 Nov 2020 07:21:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.b="zAv38tWA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89B1C20B80
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.39085.71867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiY4P-0005lH-Gf; Fri, 27 Nov 2020 07:21:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39085.71867; Fri, 27 Nov 2020 07:21:29 +0000
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
	id 1kiY4P-0005lA-DN; Fri, 27 Nov 2020 07:21:29 +0000
Received: by outflank-mailman (input) for mailman id 39085;
 Fri, 27 Nov 2020 07:21:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kiY4O-0005l2-2Z; Fri, 27 Nov 2020 07:21:28 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kiY4N-00059C-Py; Fri, 27 Nov 2020 07:21:27 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kiY4N-0001Xk-GN; Fri, 27 Nov 2020 07:21:27 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kiY4N-0007s2-Fr; Fri, 27 Nov 2020 07:21:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kiY4O-0005l2-2Z; Fri, 27 Nov 2020 07:21:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=C6NsvQEZUE9rNKS0RA4lIyDls1MrieCzzmqLts1S2vE=; b=zAv38tWA1SXf7zn5IUl/X+dCy0
	ys5KOJC66ehBc2KZguSru2O39gtmlM9fYrZJuisef5urCM12uHEDLhT+CqpTyMRr3D149sikfc8fC
	nVG4HC7ravNKxaZRel/p0KVxAZLXF4T2a6thFldaL+pBBEs4GedwODJRCMQDTOGiGRek=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kiY4N-00059C-Py; Fri, 27 Nov 2020 07:21:27 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kiY4N-0001Xk-GN; Fri, 27 Nov 2020 07:21:27 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kiY4N-0007s2-Fr; Fri, 27 Nov 2020 07:21:27 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-157042-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 157042: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=872f953262d68a11da7bc2fb3ded16df234b8700
X-Osstest-Versions-That:
    ovmf=21f984cedec1c613218480bc3eb5e92349a7a812
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 27 Nov 2020 07:21:27 +0000

flight 157042 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/157042/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 872f953262d68a11da7bc2fb3ded16df234b8700
baseline version:
 ovmf                 21f984cedec1c613218480bc3eb5e92349a7a812

Last test of basis   157025  2020-11-26 07:11:04 Z    1 days
Testing same since   157042  2020-11-27 01:41:56 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  James Bottomley <jejb@linux.ibm.com>
  Laszlo Ersek <lersek@redhat.com>

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
   21f984cede..872f953262  872f953262d68a11da7bc2fb3ded16df234b8700 -> xen-tested-master

