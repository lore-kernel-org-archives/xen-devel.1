Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C62CC48BF6
	for <xen-devel@archiver.kernel.org>; Mon,  4 Mar 2024 10:00:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.688255.1072270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh57S-0005gi-Oq; Mon, 04 Mar 2024 10:00:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688255.1072270; Mon, 04 Mar 2024 10:00:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh57S-0005gb-MB; Mon, 04 Mar 2024 10:00:26 +0000
Received: by outflank-mailman (input) for mailman id 688255;
 Mon, 04 Mar 2024 10:00:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rh57Q-0005gN-Hm; Mon, 04 Mar 2024 10:00:24 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rh57Q-00048G-Fs; Mon, 04 Mar 2024 10:00:24 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rh57Q-0001cc-9A; Mon, 04 Mar 2024 10:00:24 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rh57Q-0003hV-8j; Mon, 04 Mar 2024 10:00:24 +0000
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
	bh=KhTB0Q8s157eefQfIAlgdO0QZNKRb5vaRtvKMRVMBEk=; b=xWGz73xtchp/PdSJeEIiF8Q/df
	dAz8gSvCjE++jttswZitbndgQadQeuuDkQrV4sfxjhC7uJVdTIMOhiuN4qoGtjzvuXdcVad4JjMTR
	oK2HNdlnnbiXKwEyZKSXI7w3Jh6KIho4QGRA24476nSuun2g29k0rdjm3GnsyBhKH8NE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184889-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184889: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=3775122ede395d934198ffdb0c173875a5e94c00
X-Osstest-Versions-That:
    ovmf=275d0a39c42ad73a6e4929822f56f5d8c16ede96
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 04 Mar 2024 10:00:24 +0000

flight 184889 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184889/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 3775122ede395d934198ffdb0c173875a5e94c00
baseline version:
 ovmf                 275d0a39c42ad73a6e4929822f56f5d8c16ede96

Last test of basis   184836  2024-03-01 19:13:07 Z    2 days
Testing same since   184889  2024-03-04 07:41:17 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jason Lou <yun.lou@intel.com>

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
   275d0a39c4..3775122ede  3775122ede395d934198ffdb0c173875a5e94c00 -> xen-tested-master

