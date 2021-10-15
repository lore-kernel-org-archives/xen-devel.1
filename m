Return-Path: <SRS0=Vzag=PD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F090C433F5
	for <xen-devel@archiver.kernel.org>; Fri, 15 Oct 2021 21:55:41 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14AF161184
	for <xen-devel@archiver.kernel.org>; Fri, 15 Oct 2021 21:55:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 14AF161184
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.211082.368141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbVAl-0006Zj-DP; Fri, 15 Oct 2021 21:55:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 211082.368141; Fri, 15 Oct 2021 21:55:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbVAl-0006Zc-AQ; Fri, 15 Oct 2021 21:55:27 +0000
Received: by outflank-mailman (input) for mailman id 211082;
 Fri, 15 Oct 2021 21:55:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mbVAk-0006ZS-BL; Fri, 15 Oct 2021 21:55:26 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mbVAk-0006D5-4P; Fri, 15 Oct 2021 21:55:26 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mbVAj-0007R6-QL; Fri, 15 Oct 2021 21:55:25 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mbVAj-0006SE-Pu; Fri, 15 Oct 2021 21:55:25 +0000
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
	bh=TCUJlif3b6TBrgaAMTxfHMEcynwx6qy5HDngVZRVUFk=; b=R23l9pElQIQfnPFeIRbrfmb7UK
	kstiLbIt4cx+e31wBq5G+QzpD+nbHSG9sbmpPTbS983bZAQRpU4YPs+kwsuzha8IQuvEVPS3TGfJa
	3U+rnpihdP/epBYwRyquDvgDOzvaQM3y35infIonYl0H8vtMT536IGiUegYjfVSajewA=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165523-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 165523: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=7e43d3e08611ac4c4bc41c46470052d4118168eb
X-Osstest-Versions-That:
    ovmf=785cfd33053f506d4a1c17100356a63f24e98f45
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 15 Oct 2021 21:55:25 +0000

flight 165523 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/165523/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 7e43d3e08611ac4c4bc41c46470052d4118168eb
baseline version:
 ovmf                 785cfd33053f506d4a1c17100356a63f24e98f45

Last test of basis   165508  2021-10-14 12:11:12 Z    1 days
Testing same since   165523  2021-10-15 11:10:08 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Leif Lindholm <leif@nuviainc.com>
  Ming Huang <huangming@linux.alibaba.com>

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
   785cfd3305..7e43d3e086  7e43d3e08611ac4c4bc41c46470052d4118168eb -> xen-tested-master

