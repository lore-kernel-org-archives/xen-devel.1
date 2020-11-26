Return-Path: <SRS0=kjYx=FA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1830C56202
	for <xen-devel@archiver.kernel.org>; Thu, 26 Nov 2020 07:09:05 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75BE820578
	for <xen-devel@archiver.kernel.org>; Thu, 26 Nov 2020 07:09:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.b="1zBBTMtk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75BE820578
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.38289.71026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiBOM-0003l0-Ir; Thu, 26 Nov 2020 07:08:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 38289.71026; Thu, 26 Nov 2020 07:08:34 +0000
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
	id 1kiBOM-0003kt-Fb; Thu, 26 Nov 2020 07:08:34 +0000
Received: by outflank-mailman (input) for mailman id 38289;
 Thu, 26 Nov 2020 07:08:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kiBOL-0003kl-1s; Thu, 26 Nov 2020 07:08:33 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kiBOK-0002LS-Rx; Thu, 26 Nov 2020 07:08:32 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kiBOK-0006Fb-JJ; Thu, 26 Nov 2020 07:08:32 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kiBOK-0005ig-Im; Thu, 26 Nov 2020 07:08:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kiBOL-0003kl-1s; Thu, 26 Nov 2020 07:08:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=idQettaSfyuU4Nt6A1EKE8qyS1KNqHy7MMvb2lxbDJg=; b=1zBBTMtkP7BUH3NwXEDnDORt3v
	KUFO0hI0AJwHc9DAwnmUSrN0r62N/CdA0E75jTVQM6tHQXelTpIvSaMMICFNLnMm1OG9MwZayC8MD
	pch1z/yL3CgEi/gITL8zfy6s01dfq1I3rufaY3UqxbZmlga8NFInYS/0trgl4+cX5IJc=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kiBOK-0002LS-Rx; Thu, 26 Nov 2020 07:08:32 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kiBOK-0006Fb-JJ; Thu, 26 Nov 2020 07:08:32 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kiBOK-0005ig-Im; Thu, 26 Nov 2020 07:08:32 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-157018-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 157018: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=e9d62effa37ea13fe04fc89b21d2de7776f183a2
X-Osstest-Versions-That:
    ovmf=388f9a9355ae7ab95a34ac2e9a3c608caf11b74a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 26 Nov 2020 07:08:32 +0000

flight 157018 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/157018/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 e9d62effa37ea13fe04fc89b21d2de7776f183a2
baseline version:
 ovmf                 388f9a9355ae7ab95a34ac2e9a3c608caf11b74a

Last test of basis   157012  2020-11-25 18:09:50 Z    0 days
Testing same since   157018  2020-11-26 01:39:48 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  gaoliming <gaoliming@byosoft.com.cn>
  Jiewen Yao <Jiewen.yao@intel.com>
  Liming Gao <gaoliming@byosoft.com.cn>

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
   388f9a9355..e9d62effa3  e9d62effa37ea13fe04fc89b21d2de7776f183a2 -> xen-tested-master

