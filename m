Return-Path: <SRS0=uqgo=JD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5EF6C433ED
	for <xen-devel@archiver.kernel.org>; Tue,  6 Apr 2021 09:06:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87DF761396
	for <xen-devel@archiver.kernel.org>; Tue,  6 Apr 2021 09:06:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87DF761396
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.105724.202200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lThfI-00018K-U3; Tue, 06 Apr 2021 09:06:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105724.202200; Tue, 06 Apr 2021 09:06:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lThfI-00018D-Qg; Tue, 06 Apr 2021 09:06:28 +0000
Received: by outflank-mailman (input) for mailman id 105724;
 Tue, 06 Apr 2021 09:06:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lThfH-000185-Ho; Tue, 06 Apr 2021 09:06:27 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lThfH-0002yk-88; Tue, 06 Apr 2021 09:06:27 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lThfG-0007ii-W1; Tue, 06 Apr 2021 09:06:27 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lThfG-0005cH-VS; Tue, 06 Apr 2021 09:06:26 +0000
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
	bh=shW1A4LbaSfzfW1PBgHyPHuJiNLAHQgnqblrNZ4X2so=; b=QkSu93q+MqdAVeUN+FHqGQeLky
	ztuUWOnQKbnn3amSxgGp4trQ1EwaPNp0xE55ySw3VuS0EKE7jpN2fLe6hT5iL2Y4boE5jzywsWhwY
	wMN62Sg9o3vkImUwxjRSUjDAZ+fQ4JYYKwqgssh+sI8ttXZEYgt7akxb//gewoOJ6bSo=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-160757-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 160757: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=4ac02962017c77bf38b462f970c884c2dc7931cf
X-Osstest-Versions-That:
    ovmf=f95cdd316c3d56e8f76b5044be54b9645e1dc60f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 06 Apr 2021 09:06:26 +0000

flight 160757 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/160757/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 4ac02962017c77bf38b462f970c884c2dc7931cf
baseline version:
 ovmf                 f95cdd316c3d56e8f76b5044be54b9645e1dc60f

Last test of basis   160687  2021-04-03 01:55:05 Z    3 days
Testing same since   160757  2021-04-06 01:11:18 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jiaxin Wu <Jiaxin.wu@intel.com>
  Zhang Hongbin1 <hongbin1.zhang@intel.com>

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
   f95cdd316c..4ac0296201  4ac02962017c77bf38b462f970c884c2dc7931cf -> xen-tested-master

