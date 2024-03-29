Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D9D8C6FD1F
	for <xen-devel@archiver.kernel.org>; Fri, 29 Mar 2024 05:15:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.699241.1091971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rq4af-0003Fx-1y; Fri, 29 Mar 2024 05:15:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699241.1091971; Fri, 29 Mar 2024 05:15:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rq4ae-0003Fq-V8; Fri, 29 Mar 2024 05:15:44 +0000
Received: by outflank-mailman (input) for mailman id 699241;
 Fri, 29 Mar 2024 05:15:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rq4ae-0003Fe-Fn; Fri, 29 Mar 2024 05:15:44 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rq4ae-0004Jb-1P; Fri, 29 Mar 2024 05:15:44 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rq4ad-0005E5-NL; Fri, 29 Mar 2024 05:15:43 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rq4ad-00066g-Mt; Fri, 29 Mar 2024 05:15:43 +0000
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
	bh=f8l3hhpc3xRb/Pcj9+1/azqhdMWUgwd3cNqfpCXlNjI=; b=CT7/rarw9QowydEIp4fPt5Sm+o
	ohcwZOuqNxxdgG1xl5kFfUz97W7JAP3vNs0cKqshb5FypaYuQoVYzzUXCVaZeUeQFDEA24z/ozJL3
	lEfuFaLdHMTY2MI+8H4s2vEn4/mq2RqCQWmv9iXCv6lO1hCFTvpdWm6MnTjK4MefIVmo=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185198-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 185198: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=7fde22823d64cb7b9f2a65bb87ffb7581f5ff84e
X-Osstest-Versions-That:
    ovmf=cf58f47623c40a66b160face4f04e08efb4c7f5b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 29 Mar 2024 05:15:43 +0000

flight 185198 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185198/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 7fde22823d64cb7b9f2a65bb87ffb7581f5ff84e
baseline version:
 ovmf                 cf58f47623c40a66b160face4f04e08efb4c7f5b

Last test of basis   185156  2024-03-25 08:12:54 Z    3 days
Testing same since   185198  2024-03-29 03:14:32 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Wenxing Hou <wenxing.hou@intel.com>

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
   cf58f47623..7fde22823d  7fde22823d64cb7b9f2a65bb87ffb7581f5ff84e -> xen-tested-master

