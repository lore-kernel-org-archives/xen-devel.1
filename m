Return-Path: <SRS0=l9VS=EX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20334C2D0E4
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2020 04:46:03 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A05A224695
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2020 04:46:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.b="FIdCM29B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A05A224695
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.28724.57801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kessC-0001I7-FE; Tue, 17 Nov 2020 04:45:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 28724.57801; Tue, 17 Nov 2020 04:45:44 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kessC-0001I0-CG; Tue, 17 Nov 2020 04:45:44 +0000
Received: by outflank-mailman (input) for mailman id 28724;
 Tue, 17 Nov 2020 04:45:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g2yZ=EX=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kessB-0001HS-JN
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 04:45:43 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1e1c9052-8a11-4a1c-a2a9-1564635ad09d;
 Tue, 17 Nov 2020 04:45:36 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kess4-00033m-7Y; Tue, 17 Nov 2020 04:45:36 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kess3-0003qF-Ty; Tue, 17 Nov 2020 04:45:35 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kess3-0005rk-St; Tue, 17 Nov 2020 04:45:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=g2yZ=EX=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kessB-0001HS-JN
	for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 04:45:43 +0000
X-Inumbo-ID: 1e1c9052-8a11-4a1c-a2a9-1564635ad09d
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 1e1c9052-8a11-4a1c-a2a9-1564635ad09d;
	Tue, 17 Nov 2020 04:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=H28yGD3pDbZoPoatKZ0E4kssf7TZeV8/aD2vxur2Amc=; b=FIdCM29BXSxW5+kcjSRmpcSIt5
	zd8lRXyIQ4f0VYiLTL6ypDXozH9frv+qLmbuOmwYWEGdeTlCG7VTBIlaCP8DiWBvjK40tepzlOcyW
	TCoFvDsDdxXy1xgwYeL34Laa6Ntm4Hnd+5RARZqDZ2QPr6xigCnTy/nqYbrbWnnuEyNg=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kess4-00033m-7Y; Tue, 17 Nov 2020 04:45:36 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kess3-0003qF-Ty; Tue, 17 Nov 2020 04:45:35 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kess3-0005rk-St; Tue, 17 Nov 2020 04:45:35 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156826-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 156826: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=124b3f9289f11479d9f042ea6e39bea2b1d5cee3
X-Osstest-Versions-That:
    ovmf=d448574e73108f031ea6b02994f2579bb574785a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 17 Nov 2020 04:45:35 +0000

flight 156826 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156826/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 124b3f9289f11479d9f042ea6e39bea2b1d5cee3
baseline version:
 ovmf                 d448574e73108f031ea6b02994f2579bb574785a

Last test of basis   156806  2020-11-15 00:39:51 Z    2 days
Testing same since   156826  2020-11-17 01:10:39 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Bret Barkelew <brbarkel@microsoft.com>
  Jian J Wang <jian.j.wang@intel.com>

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
   d448574e73..124b3f9289  124b3f9289f11479d9f042ea6e39bea2b1d5cee3 -> xen-tested-master

