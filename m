Return-Path: <SRS0=cMO7=FW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BB3AC4361B
	for <xen-devel@archiver.kernel.org>; Fri, 18 Dec 2020 05:55:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1F5B23A5B
	for <xen-devel@archiver.kernel.org>; Fri, 18 Dec 2020 05:55:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1F5B23A5B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.56291.98467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kq8il-0008UE-Ib; Fri, 18 Dec 2020 05:54:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 56291.98467; Fri, 18 Dec 2020 05:54:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kq8il-0008U7-Ex; Fri, 18 Dec 2020 05:54:31 +0000
Received: by outflank-mailman (input) for mailman id 56291;
 Fri, 18 Dec 2020 05:54:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kq8ij-0008Tz-HI; Fri, 18 Dec 2020 05:54:29 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kq8ij-0007VN-8X; Fri, 18 Dec 2020 05:54:29 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kq8ii-0006bp-V5; Fri, 18 Dec 2020 05:54:29 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kq8ii-0000BJ-Ue; Fri, 18 Dec 2020 05:54:28 +0000
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
	bh=JyJ4+CkDpQZGei26+MJ/TcFAXlYzFv3hIaeMQBzQ4b0=; b=txokSJ/CwZ6KwCA6gGs3Pu6auc
	YOOaj7+EL8lHMC/mCaizP0xJ4cPsOLBXwHnQftrKO098cxZEO/Dc9qbahS7TCEQ7DMbhOOP1g9Eub
	0/qxuwlftwH+nPHPD9xlYdwWfFec1PNFRw+J91uvEavuUlAqz3vgK7uTJEpYMro7LCsY=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-157633-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 157633: regressions - FAIL
X-Osstest-Failures:
    ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
    ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
X-Osstest-Versions-This:
    ovmf=e6ae24e1d676bb2bdc0fc715b49b04908f41fc10
X-Osstest-Versions-That:
    ovmf=f95e80d832e923046c92cd6f0b8208cec147138e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 18 Dec 2020 05:54:28 +0000

flight 157633 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/157633/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-xl-qemuu-ovmf-amd64 12 debian-hvm-install fail REGR. vs. 157345
 test-amd64-amd64-xl-qemuu-ovmf-amd64 12 debian-hvm-install fail REGR. vs. 157345

version targeted for testing:
 ovmf                 e6ae24e1d676bb2bdc0fc715b49b04908f41fc10
baseline version:
 ovmf                 f95e80d832e923046c92cd6f0b8208cec147138e

Last test of basis   157345  2020-12-09 12:40:46 Z    8 days
Failing since        157348  2020-12-09 15:39:39 Z    8 days   52 attempts
Testing same since   157612  2020-12-16 21:09:14 Z    1 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abner Chang <abner.chang@hpe.com>
  Ard Biesheuvel <ard.biesheuvel@arm.com>
  Baraneedharan Anbazhagan <anbazhagan@hp.com>
  Baraneedharan Anbazhagan <anbazhgan@hp.com>
  Bret Barkelew <Bret.Barkelew@microsoft.com>
  Chen, Christine <Yuwei.Chen@intel.com>
  Fan Wang <fan.wang@intel.com>
  James Bottomley <jejb@linux.ibm.com>
  Jiaxin Wu <jiaxin.wu@intel.com>
  Marc Moisson-Franckhauser <marc.moisson-franckhauser@arm.com>
  Michael D Kinney <michael.d.kinney@intel.com>
  Michael Kubacki <michael.kubacki@microsoft.com>
  Pierre Gondois <Pierre.Gondois@arm.com>
  Ray Ni <ray.ni@intel.com>
  Rebecca Cran <rebecca@nuviainc.com>
  Sami Mujawar <sami.mujawar@arm.com>
  Sean Brogan <sean.brogan@microsoft.com>
  Sheng Wei <w.sheng@intel.com>
  Siyuan Fu <siyuan.fu@intel.com>
  Star Zeng <star.zeng@intel.com>
  Ting Ye <ting.ye@intel.com>
  Yuwei Chen <yuwei.chen@intel.com>

jobs:
 build-amd64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         fail    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          fail    


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


Not pushing.

(No revision log; it would be 699 lines long.)

