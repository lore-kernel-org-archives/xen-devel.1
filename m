Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 955D7C4332F
	for <xen-devel@archiver.kernel.org>; Fri, 11 Nov 2022 10:10:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.442400.696530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otQye-00050w-G8; Fri, 11 Nov 2022 10:09:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442400.696530; Fri, 11 Nov 2022 10:09:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otQye-00050p-DT; Fri, 11 Nov 2022 10:09:36 +0000
Received: by outflank-mailman (input) for mailman id 442400;
 Fri, 11 Nov 2022 10:09:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1otQyd-00050f-9N; Fri, 11 Nov 2022 10:09:35 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1otQyd-0003Hz-5j; Fri, 11 Nov 2022 10:09:35 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1otQyc-0005kg-Lg; Fri, 11 Nov 2022 10:09:34 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1otQyc-0001QP-L7; Fri, 11 Nov 2022 10:09:34 +0000
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
	bh=4gXaMUEfWUteq6u/m5e7yljKcgHu5xdWncfGGT0sv1A=; b=Ru3N0Fsd1GOLlWIDLRTXWkI8Is
	ixwFEciNaal3nuqPwRRQIa24jODG9bqWevwFewva9N7aru5nXpcuu/BMwWH2kqSYevTw6MEqsmdyC
	AldCYZZNtfJ/cirkyjG0s4Vd5SHFWPVSVjuh6pMOB7f8MY6VWvGNcFjWfb1qz47qBIRQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-174734-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 174734: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=6d55ad9a592ba3bbc9392a67fd8c936279b73a45
X-Osstest-Versions-That:
    ovmf=c8fb7240469b5753773da4fa5710b870b790c363
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 11 Nov 2022 10:09:34 +0000

flight 174734 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/174734/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 6d55ad9a592ba3bbc9392a67fd8c936279b73a45
baseline version:
 ovmf                 c8fb7240469b5753773da4fa5710b870b790c363

Last test of basis   174730  2022-11-11 03:48:41 Z    0 days
Testing same since   174734  2022-11-11 06:10:20 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Kuo, Ted <ted.kuo@intel.com>
  Leif Lindholm <quic_llindhol@quicinc.com>
  Michael D Kinney <michael.d.kinney@intel.com>
  Ted Kuo <ted.kuo@intel.com>

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
   c8fb724046..6d55ad9a59  6d55ad9a592ba3bbc9392a67fd8c936279b73a45 -> xen-tested-master

