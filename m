Return-Path: <SRS0=1u55=OI=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A165EC433F5
	for <xen-devel@archiver.kernel.org>; Sat, 18 Sep 2021 15:48:34 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 563CB6127A
	for <xen-devel@archiver.kernel.org>; Sat, 18 Sep 2021 15:48:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 563CB6127A
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.189928.339772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRcZf-00043s-8M; Sat, 18 Sep 2021 15:48:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189928.339772; Sat, 18 Sep 2021 15:48:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRcZf-00043l-5V; Sat, 18 Sep 2021 15:48:19 +0000
Received: by outflank-mailman (input) for mailman id 189928;
 Sat, 18 Sep 2021 15:48:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mRcZe-00043b-G5; Sat, 18 Sep 2021 15:48:18 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mRcZe-0000zV-AT; Sat, 18 Sep 2021 15:48:18 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mRcZe-0000Zr-1W; Sat, 18 Sep 2021 15:48:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mRcZd-0002Uh-3U; Sat, 18 Sep 2021 15:48:18 +0000
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
	bh=rEJlhPf+9VaxWbPU8JOkFIrH976vMXwMncJrEl/Gs9k=; b=GaPiokbdqqYTAJ+xq5R/gKhNLs
	ERkmRkEuTMzblwVU2ijed6HSi0ZbHEN7Zm3LIqgG4CxzrzgNpJwNDYdQ5VO9xa4tzkkazrcMKA+bg
	e+5nnse532kS4EUTF86voth6Zpe8dpIqNwdzNH/bYYcq3ifM81fMGt9cu4jycLuxVGFE=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165108-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 165108: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=e3e47d7963985f669f5826eac41b3ac4f19fc444
X-Osstest-Versions-That:
    ovmf=ac6388add4ade3ae5c4036ea6c2ce9c8d301d057
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 18 Sep 2021 15:48:17 +0000

flight 165108 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/165108/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 e3e47d7963985f669f5826eac41b3ac4f19fc444
baseline version:
 ovmf                 ac6388add4ade3ae5c4036ea6c2ce9c8d301d057

Last test of basis   165013  2021-09-16 15:12:46 Z    2 days
Testing same since   165108  2021-09-18 08:42:25 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ashraf Ali S <ashraf.ali.s@intel.com>
  S, Ashraf Ali <ashraf.ali.s@intel.com>

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
   ac6388add4..e3e47d7963  e3e47d7963985f669f5826eac41b3ac4f19fc444 -> xen-tested-master

