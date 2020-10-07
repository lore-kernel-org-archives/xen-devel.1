Return-Path: <SRS0=B7KG=DO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7741C41604
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2020 16:44:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35C31206BE
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2020 16:44:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.b="EM8KRf5R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35C31206BE
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.3567.10208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQCY0-0003U0-Ut; Wed, 07 Oct 2020 16:44:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3567.10208; Wed, 07 Oct 2020 16:44:12 +0000
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
	id 1kQCY0-0003Tt-Ry; Wed, 07 Oct 2020 16:44:12 +0000
Received: by outflank-mailman (input) for mailman id 3567;
 Wed, 07 Oct 2020 16:44:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xB9j=DO=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kQCXz-0003TO-Aw
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 16:44:11 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5098ad54-d21a-4839-aeea-ef3ca01b5dd6;
 Wed, 07 Oct 2020 16:44:03 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kQCXr-00014E-Hv; Wed, 07 Oct 2020 16:44:03 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kQCXr-0007kc-9m; Wed, 07 Oct 2020 16:44:03 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kQCXr-00054J-9I; Wed, 07 Oct 2020 16:44:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xB9j=DO=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kQCXz-0003TO-Aw
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 16:44:11 +0000
X-Inumbo-ID: 5098ad54-d21a-4839-aeea-ef3ca01b5dd6
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 5098ad54-d21a-4839-aeea-ef3ca01b5dd6;
	Wed, 07 Oct 2020 16:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=4BU4gwyrQqT0d2uQTxxJokTpbp6ASD2wbgKM1SDYYZk=; b=EM8KRf5RKJfhzA3bBg86xVqr9I
	z1dbmlsNBxa86b5wldMVuA6QWu6f/1FST6OryYZoRnly5t6zG3ga4t6ivePGfNW3LQaQt+EfEgxSq
	Jy7vaUo6ppTO/t3rFuCBAQl0r8ZULf2wMw0tNwoUYYT5pi72SQvTVu8xjPpPxmN45Lk0=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kQCXr-00014E-Hv; Wed, 07 Oct 2020 16:44:03 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kQCXr-0007kc-9m; Wed, 07 Oct 2020 16:44:03 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kQCXr-00054J-9I; Wed, 07 Oct 2020 16:44:03 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-155512-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 155512: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=c640186ec8aae6164123ee38de6409aed69eab12
X-Osstest-Versions-That:
    ovmf=2d8ca4f90eaeb61bd7e9903b56bf412f0d187137
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 07 Oct 2020 16:44:03 +0000

flight 155512 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/155512/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 c640186ec8aae6164123ee38de6409aed69eab12
baseline version:
 ovmf                 2d8ca4f90eaeb61bd7e9903b56bf412f0d187137

Last test of basis   155223  2020-10-01 11:40:36 Z    6 days
Testing same since   155512  2020-10-07 04:39:54 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jeff Brasen <jbrasen@nvidia.com>

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
   2d8ca4f90e..c640186ec8  c640186ec8aae6164123ee38de6409aed69eab12 -> xen-tested-master

