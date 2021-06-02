Return-Path: <SRS0=/WvL=K4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBFD3C47083
	for <xen-devel@archiver.kernel.org>; Wed,  2 Jun 2021 09:50:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C2176135D
	for <xen-devel@archiver.kernel.org>; Wed,  2 Jun 2021 09:50:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C2176135D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.135911.252243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loNWC-0000Eh-3x; Wed, 02 Jun 2021 09:50:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 135911.252243; Wed, 02 Jun 2021 09:50:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loNWC-0000Ea-0M; Wed, 02 Jun 2021 09:50:32 +0000
Received: by outflank-mailman (input) for mailman id 135911;
 Wed, 02 Jun 2021 09:50:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1loNWA-0000EM-St; Wed, 02 Jun 2021 09:50:30 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1loNWA-0003qG-L5; Wed, 02 Jun 2021 09:50:30 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1loNWA-0000RY-7j; Wed, 02 Jun 2021 09:50:30 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1loNWA-0004xQ-7E; Wed, 02 Jun 2021 09:50:30 +0000
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
	bh=VliLuNxhh3MpZPtSZ+oT672vukg4UTuOGmV5NWD6s9s=; b=5XlJfTUajz52pbq93v0FTnIZXs
	f8HZJt+OTjlekI6TQV403JjU3xAFnsHlbCLfJZ/DZuSkNs2TutZrsklg6M4f00M8/wixr6iiTYmGr
	XkMfDurZLr3xS+/p5vrDN6E6jpyltYJZu2gxbAjdiS2a3X+f+JmvZzeTjlO2wqOk2Zc0=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-162335-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 162335: all pass - PUSHED
X-Osstest-Versions-This:
    xen=5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
X-Osstest-Versions-That:
    xen=683d899e4bffca35c5b192ea0662362b0270a695
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 02 Jun 2021 09:50:30 +0000

flight 162335 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/162335/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
baseline version:
 xen                  683d899e4bffca35c5b192ea0662362b0270a695

Last test of basis   162265  2021-05-30 09:19:35 Z    3 days
Testing same since   162335  2021-06-02 09:20:40 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
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
   683d899e4b..5268b2dcf7  5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1 -> coverity-tested/smoke

