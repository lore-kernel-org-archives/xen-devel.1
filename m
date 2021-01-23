Return-Path: <SRS0=b7J0=G2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34900C433DB
	for <xen-devel@archiver.kernel.org>; Sat, 23 Jan 2021 01:06:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9BAE23A7D
	for <xen-devel@archiver.kernel.org>; Sat, 23 Jan 2021 01:06:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9BAE23A7D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.73183.131959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l37NK-0002sa-Tr; Sat, 23 Jan 2021 01:06:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 73183.131959; Sat, 23 Jan 2021 01:06:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l37NK-0002sT-Qs; Sat, 23 Jan 2021 01:06:02 +0000
Received: by outflank-mailman (input) for mailman id 73183;
 Sat, 23 Jan 2021 01:06:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l37NJ-0002sL-3Y; Sat, 23 Jan 2021 01:06:01 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l37NI-00027B-T3; Sat, 23 Jan 2021 01:06:00 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l37NI-0001DT-IX; Sat, 23 Jan 2021 01:06:00 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l37NI-0004nu-I3; Sat, 23 Jan 2021 01:06:00 +0000
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
	bh=6qvwBTWLojHsX6jmRaoVCxVw8/rljU+ry83uQGyoIRI=; b=Q7H5AbRB8c8cQoDSWGlZoeCs6L
	kTuJhrJlvkjf7Eb3YpwXA6OD4h+MwfeUFvXc98H0BQRVT7YH7qtqbpStY8pHaP44CWUmNpydIk5lA
	64x716crHQhR1GiIutYG/krIUuq0v4EL2ymSjT6fO5XIJKoOjRKqNLri3yW/U7hLDxi4=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-158566-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 158566: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=6c5801be6ef36e35f0b4ff906a4c99d68ca6f69a
X-Osstest-Versions-That:
    ovmf=5b4a97bbc39ed8e7eb50038b9cffe2e948e49995
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 23 Jan 2021 01:06:00 +0000

flight 158566 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/158566/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 6c5801be6ef36e35f0b4ff906a4c99d68ca6f69a
baseline version:
 ovmf                 5b4a97bbc39ed8e7eb50038b9cffe2e948e49995

Last test of basis   158555  2021-01-21 10:39:50 Z    1 days
Testing same since   158566  2021-01-21 23:10:45 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Bob Feng <bob.c.feng@intel.com>
  Star Zeng <star.zeng@intel.com>
  Zeng, Star <star.zeng@intel.com>

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
   5b4a97bbc3..6c5801be6e  6c5801be6ef36e35f0b4ff906a4c99d68ca6f69a -> xen-tested-master

