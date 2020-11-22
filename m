Return-Path: <SRS0=Rr0c=E4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EB8DC5519F
	for <xen-devel@archiver.kernel.org>; Sun, 22 Nov 2020 09:48:01 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E544120738
	for <xen-devel@archiver.kernel.org>; Sun, 22 Nov 2020 09:48:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.b="XrLc3Pes"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E544120738
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.33243.64285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kglxw-0006kh-Me; Sun, 22 Nov 2020 09:47:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 33243.64285; Sun, 22 Nov 2020 09:47:28 +0000
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
	id 1kglxw-0006ka-Iu; Sun, 22 Nov 2020 09:47:28 +0000
Received: by outflank-mailman (input) for mailman id 33243;
 Sun, 22 Nov 2020 09:47:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kglxv-0006kS-9t; Sun, 22 Nov 2020 09:47:27 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kglxu-0001D1-VD; Sun, 22 Nov 2020 09:47:26 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kglxu-0002er-Kq; Sun, 22 Nov 2020 09:47:26 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kglxu-0008Nz-KL; Sun, 22 Nov 2020 09:47:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kglxv-0006kS-9t; Sun, 22 Nov 2020 09:47:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=Amkfqtll0X0YJ6lyampDoyMrC35f7F3Z1jXSiXVvwX4=; b=XrLc3Pes9qpCNHM42z2zyD+PQR
	VL8M+QwOSiYvHihbrTIQBzeEZM3X+QJyX2UKzfUPfSJ6qswOkVmT+WxoJArJKEmZ134UMBOXU8U4J
	V5pzvqKPCzJLSFE+a8Zc0N1uB0+qVHhRoHtmhxqIAMO3Eso9oi5Wj8CAmtZFxzdUonEA=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kglxu-0001D1-VD; Sun, 22 Nov 2020 09:47:26 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kglxu-0002er-Kq; Sun, 22 Nov 2020 09:47:26 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kglxu-0008Nz-KL; Sun, 22 Nov 2020 09:47:26 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156941-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 156941: all pass - PUSHED
X-Osstest-Versions-This:
    xen=b659a5cebd611dbe698e63c03485b5fe8cd964ad
X-Osstest-Versions-That:
    xen=5505f5f8e7e805365cfe70b6a4af6115940bb749
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 22 Nov 2020 09:47:26 +0000

flight 156941 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156941/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  b659a5cebd611dbe698e63c03485b5fe8cd964ad
baseline version:
 xen                  5505f5f8e7e805365cfe70b6a4af6115940bb749

Last test of basis   156811  2020-11-15 09:18:26 Z    7 days
Testing same since   156941  2020-11-22 09:18:30 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andre Przywara <andre.przywara@arm.com>
  Andrew Cooper <andrew.cooper3@citrix.com>
  Doug Goldstein <cardoe@cardoe.com>
  Edwin Török <edvin.torok@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Julien Grall <julien.grall@arm.com>
  Michal Orzel <michal.orzel@arm.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Tim Deegan <tim@xen.org>

jobs:
 coverity-amd64                                               pass    


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

To xenbits.xen.org:/home/xen/git/xen.git
   5505f5f8e7..b659a5cebd  b659a5cebd611dbe698e63c03485b5fe8cd964ad -> coverity-tested/smoke

