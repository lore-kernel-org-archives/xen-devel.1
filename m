Return-Path: <SRS0=Klnx=FJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FFD7C4361A
	for <xen-devel@archiver.kernel.org>; Sat,  5 Dec 2020 05:17:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B99CC22D08
	for <xen-devel@archiver.kernel.org>; Sat,  5 Dec 2020 05:17:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B99CC22D08
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.45188.80685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klPw6-0000mQ-Db; Sat, 05 Dec 2020 05:16:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 45188.80685; Sat, 05 Dec 2020 05:16:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klPw6-0000mJ-AA; Sat, 05 Dec 2020 05:16:46 +0000
Received: by outflank-mailman (input) for mailman id 45188;
 Sat, 05 Dec 2020 05:16:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1klPw5-0000m6-0I; Sat, 05 Dec 2020 05:16:45 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1klPw4-0003Vz-SD; Sat, 05 Dec 2020 05:16:44 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1klPw4-0006vt-HA; Sat, 05 Dec 2020 05:16:44 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1klPw4-0005IN-Gh; Sat, 05 Dec 2020 05:16:44 +0000
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
	bh=pnExG2D1+grtKOWLo5B4MZIlCiB0wnwOEla/itdqaCc=; b=X2TfuEfS6XhyJVIlsyflefc74x
	y298k/UM2gdjKCDL/sh97qsEegOFThzTs7/Rm40GFNAUEkFaWdXVB+kNXLJf0Wtcp7qIr6QLGp0C3
	ZWSRyecSVIAs6W0JAElGA752rYokZ00G0j6xM4SxBLv5gkCGH7ZeB/kKzb2R0/insnNw=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-157214-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 157214: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=265eabc905eaa38b7c6deb3fedb83fe6d37e9b11
X-Osstest-Versions-That:
    ovmf=97e2b622d1f32ba35194dbca104c3bf918bf3271
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 05 Dec 2020 05:16:44 +0000

flight 157214 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/157214/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 265eabc905eaa38b7c6deb3fedb83fe6d37e9b11
baseline version:
 ovmf                 97e2b622d1f32ba35194dbca104c3bf918bf3271

Last test of basis   157204  2020-12-04 12:10:48 Z    0 days
Testing same since   157214  2020-12-05 01:55:44 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Divneil Rai Wadhawan <divneil.r.wadhawan@intel.com>

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
   97e2b622d1..265eabc905  265eabc905eaa38b7c6deb3fedb83fe6d37e9b11 -> xen-tested-master

