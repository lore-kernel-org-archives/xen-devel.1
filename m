Return-Path: <SRS0=CtBx=E7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA684C5519F
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2020 09:47:06 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3397B20872
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2020 09:47:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.b="Aa+wlYhR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3397B20872
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.37505.69896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khrNy-0000nd-W7; Wed, 25 Nov 2020 09:46:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37505.69896; Wed, 25 Nov 2020 09:46:50 +0000
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
	id 1khrNy-0000nW-SI; Wed, 25 Nov 2020 09:46:50 +0000
Received: by outflank-mailman (input) for mailman id 37505;
 Wed, 25 Nov 2020 09:46:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1khrNw-0000nO-RZ; Wed, 25 Nov 2020 09:46:48 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1khrNw-00038t-Jo; Wed, 25 Nov 2020 09:46:48 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1khrNw-0007j4-Ah; Wed, 25 Nov 2020 09:46:48 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1khrNw-0004LN-AB; Wed, 25 Nov 2020 09:46:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1khrNw-0000nO-RZ; Wed, 25 Nov 2020 09:46:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=AS+FsnKTQjnED6gZNQm4VBL7XsD0CE2YaV0RlnT1PZs=; b=Aa+wlYhRGH/o7LfjTAj40D+5qs
	RW+oqxU1PgnEJVlTvvTIAmypp3H7VGG3ZrKGFZyUsOUcy7T9futv55WVPqQVVP7/GLIz8iWE8Tqql
	YJaqd+Ok0qG2wdrDAFakbS0tVqCFOFVvm+xyeNnjt1fs8S6GIAJ+Q5OfKhXk+2Ld5zss=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1khrNw-00038t-Jo; Wed, 25 Nov 2020 09:46:48 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1khrNw-0007j4-Ah; Wed, 25 Nov 2020 09:46:48 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1khrNw-0004LN-AB; Wed, 25 Nov 2020 09:46:48 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-157003-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 157003: all pass - PUSHED
X-Osstest-Versions-This:
    xen=9b156bcc3ffcc7949edd4460b718a241e87ae302
X-Osstest-Versions-That:
    xen=b659a5cebd611dbe698e63c03485b5fe8cd964ad
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 25 Nov 2020 09:46:48 +0000

flight 157003 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/157003/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  9b156bcc3ffcc7949edd4460b718a241e87ae302
baseline version:
 xen                  b659a5cebd611dbe698e63c03485b5fe8cd964ad

Last test of basis   156941  2020-11-22 09:18:30 Z    3 days
Testing same since   157003  2020-11-25 09:18:28 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <JBeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Roger Pau Monné <roger.pau@citrix.com>

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
   b659a5cebd..9b156bcc3f  9b156bcc3ffcc7949edd4460b718a241e87ae302 -> coverity-tested/smoke

