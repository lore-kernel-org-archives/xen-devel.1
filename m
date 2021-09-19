Return-Path: <SRS0=EXO/=OJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D997C433EF
	for <xen-devel@archiver.kernel.org>; Sun, 19 Sep 2021 01:44:47 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02459610A3
	for <xen-devel@archiver.kernel.org>; Sun, 19 Sep 2021 01:44:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 02459610A3
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.190001.339848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRlsV-0000ue-Ej; Sun, 19 Sep 2021 01:44:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 190001.339848; Sun, 19 Sep 2021 01:44:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRlsV-0000uX-Au; Sun, 19 Sep 2021 01:44:23 +0000
Received: by outflank-mailman (input) for mailman id 190001;
 Sun, 19 Sep 2021 01:44:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mRlsU-0000uN-2t; Sun, 19 Sep 2021 01:44:22 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mRlsT-0001UV-OX; Sun, 19 Sep 2021 01:44:21 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mRlsT-0006jz-E0; Sun, 19 Sep 2021 01:44:21 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mRlsT-0005ov-DW; Sun, 19 Sep 2021 01:44:21 +0000
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
	bh=xqRN6Ndgt+CGcZzR1JNr1oCn5u1GELUJLjbKdvIPyNI=; b=EYLYdy3Fuzh/QssC7zHI5eoz1Z
	9yHIZ2JEUBwhQNv+DsmrdbHJmeXcZxWfXp2cNCQJTZEVG7D9N8+Y7SrfaIe0Twtok4M28lfHA+xrQ
	Tt69/gOCRSSN3/hjQbhb0n/64azbj0MmstggOh6tIRFLVVfkXAGwP7zO4TPjHsCkpCb0=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165113-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 165113: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=542cba73d21b7bcc1e3852a9d9843d5fffc2d173
X-Osstest-Versions-That:
    ovmf=e3e47d7963985f669f5826eac41b3ac4f19fc444
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 19 Sep 2021 01:44:21 +0000

flight 165113 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/165113/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 542cba73d21b7bcc1e3852a9d9843d5fffc2d173
baseline version:
 ovmf                 e3e47d7963985f669f5826eac41b3ac4f19fc444

Last test of basis   165108  2021-09-18 08:42:25 Z    0 days
Testing same since   165113  2021-09-18 16:11:19 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Longlong Yang <longlong.yang@intel.com>
  Yang, Longlong <longlong.yang@intel.com>

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
   e3e47d7963..542cba73d2  542cba73d21b7bcc1e3852a9d9843d5fffc2d173 -> xen-tested-master

