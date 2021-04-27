Return-Path: <SRS0=syOn=JY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4D02C433ED
	for <xen-devel@archiver.kernel.org>; Tue, 27 Apr 2021 00:34:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76F7461027
	for <xen-devel@archiver.kernel.org>; Tue, 27 Apr 2021 00:34:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76F7461027
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.117959.223899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbBft-0000ao-1s; Tue, 27 Apr 2021 00:34:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 117959.223899; Tue, 27 Apr 2021 00:34:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbBfs-0000ah-Uj; Tue, 27 Apr 2021 00:34:00 +0000
Received: by outflank-mailman (input) for mailman id 117959;
 Tue, 27 Apr 2021 00:33:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lbBfr-0000aZ-4X; Tue, 27 Apr 2021 00:33:59 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lbBfq-00057W-VI; Tue, 27 Apr 2021 00:33:58 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lbBfq-0007NO-Jw; Tue, 27 Apr 2021 00:33:58 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lbBfq-0004Jb-JR; Tue, 27 Apr 2021 00:33:58 +0000
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
	bh=sujppvLPlXVgYqdNcrghpU+0IVNlJzynaGEsFG58OVQ=; b=RBpn5kXYQ6PI3VlS/7wVtLiVCP
	0DLc2ka1dBLvONUCDqebzViM7w7xYCW36wnrLFBOq2PI0ajF97r3QlEc2RTGCIqWP7nzU0anqmM35
	TJOZYdi9erXEheF9MrdZ/faxoPQaNQ7OEU0lqljUbhGHAoAagyGAKJ6FYspUuK7N/ZbA=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-161469-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 161469: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=5396354b868bd6652600a654bba7df16701ac1cb
X-Osstest-Versions-That:
    ovmf=f2f4c6be2dba3f8e97ac544b9c3da71e9f81b294
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 27 Apr 2021 00:33:58 +0000

flight 161469 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/161469/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 5396354b868bd6652600a654bba7df16701ac1cb
baseline version:
 ovmf                 f2f4c6be2dba3f8e97ac544b9c3da71e9f81b294

Last test of basis   161417  2021-04-23 22:13:28 Z    3 days
Testing same since   161469  2021-04-26 16:40:08 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jiaqi Gao <jiaqi.gao@intel.com>
  Jiewen Yao <jiewen.yao@intel.com>

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
   f2f4c6be2d..5396354b86  5396354b868bd6652600a654bba7df16701ac1cb -> xen-tested-master

