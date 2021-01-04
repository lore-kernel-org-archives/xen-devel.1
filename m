Return-Path: <SRS0=Mbyf=GH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA1FCC433E0
	for <xen-devel@archiver.kernel.org>; Mon,  4 Jan 2021 11:25:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6688320770
	for <xen-devel@archiver.kernel.org>; Mon,  4 Jan 2021 11:25:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6688320770
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.61134.107300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwNyl-0006bf-1v; Mon, 04 Jan 2021 11:24:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61134.107300; Mon, 04 Jan 2021 11:24:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwNyk-0006bY-UR; Mon, 04 Jan 2021 11:24:50 +0000
Received: by outflank-mailman (input) for mailman id 61134;
 Mon, 04 Jan 2021 11:24:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kwNyk-0006bQ-Bh; Mon, 04 Jan 2021 11:24:50 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kwNyj-0008Fk-Vr; Mon, 04 Jan 2021 11:24:50 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kwNyj-0006GB-Op; Mon, 04 Jan 2021 11:24:49 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kwNyj-0002fL-ON; Mon, 04 Jan 2021 11:24:49 +0000
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
	bh=fo9qN1VgGgj9hKPcZT+HvaT3PGIxMTxrDLRHVvJu2Xs=; b=HvPEEZcM7qa/f7lT81lNNqH0pU
	7EBFxC/neHFr+MZp30YDUjG80iA8qSOWxPzApXEX6sXgica5/Yi6jPcQDCj7hQWmLL29qDZ4ORsch
	RW11u+2WwmYf5l3M0SxlhApvumocuFSu6CM1dO2txgiXLa1KQJIWmA9gldyy+UDOPdZg=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-158121-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 158121: regressions - FAIL
X-Osstest-Failures:
    ovmf:build-amd64-xsm:xen-build:fail:regression
    ovmf:build-amd64:xen-build:fail:regression
    ovmf:build-i386-xsm:xen-build:fail:regression
    ovmf:build-amd64-libvirt:build-check(1):blocked:nonblocking
    ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
    ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
X-Osstest-Versions-This:
    ovmf=0785c619a58a450091d2bf6755591012533b80b8
X-Osstest-Versions-That:
    ovmf=140674a4601f804302e79d08cb06f91c882ddf28
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 04 Jan 2021 11:24:49 +0000

flight 158121 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/158121/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64-xsm               6 xen-build                fail REGR. vs. 157875
 build-amd64                   6 xen-build                fail REGR. vs. 157875
 build-i386-xsm                6 xen-build                fail REGR. vs. 157875

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-ovmf-amd64  1 build-check(1)             blocked n/a
 test-amd64-i386-xl-qemuu-ovmf-amd64  1 build-check(1)              blocked n/a

version targeted for testing:
 ovmf                 0785c619a58a450091d2bf6755591012533b80b8
baseline version:
 ovmf                 140674a4601f804302e79d08cb06f91c882ddf28

Last test of basis   157875  2020-12-24 14:39:42 Z   10 days
Testing same since   158121  2021-01-04 08:39:43 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Heng Luo <heng.luo@intel.com>
  Luo, Heng <heng.luo@intel.com>

jobs:
 build-amd64-xsm                                              fail    
 build-i386-xsm                                               fail    
 build-amd64                                                  fail    
 build-i386                                                   pass    
 build-amd64-libvirt                                          blocked 
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         blocked 
 test-amd64-i386-xl-qemuu-ovmf-amd64                          blocked 


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

------------------------------------------------------------
commit 0785c619a58a450091d2bf6755591012533b80b8
Author: Luo, Heng <heng.luo@intel.com>
Date:   Mon Jan 4 14:59:54 2021 +0800

    MdeModulePkg/Bus/Pci/PciBusDxe: Support PCIe Resizable BAR Capability
    
    REF: https://bugzilla.tianocore.org/show_bug.cgi?id=313
    
    Add PcdPcieResizableBarSupport to enable/disable PCIe Resizable
    BAR Capability fearture.
    Program the Resizable BAR Register if the device suports PCIe Resizable
    BAR Capability and PcdPcieResizableBarSupport is TRUE.
    
    Cc: Ray Ni <ray.ni@intel.com>
    Cc: Hao A Wu <hao.a.wu@intel.com>
    Signed-off-by: Heng Luo <heng.luo@intel.com>
    Reviewed-by: Ray Ni <ray.ni@intel.com>

commit 42fe8ca453f1ab19d03d8dc945398997b00b0777
Author: Luo, Heng <heng.luo@intel.com>
Date:   Mon Jan 4 14:59:53 2021 +0800

    MdePkg: Define structures for Resizable BAR Capability
    
    REF: https://bugzilla.tianocore.org/show_bug.cgi?id=3138
    
    Define structures for Resizable BAR Capability in
    MdePkg/Include/IndustryStandard/PciExpress21.h,
    Change ShellPkg/Library/UefiShellDebug1CommandsLib/Pci.c
    to use new structures.
    
    Cc: Ray Ni <ray.ni@intel.com>
    Cc: Hao A Wu <hao.a.wu@intel.com>
    Signed-off-by: Heng Luo <heng.luo@intel.com>
    Reviewed-by: Ray Ni <ray.ni@intel.com>
    Reviewed-by: Liming Gao <liming.gao@intel.com>

