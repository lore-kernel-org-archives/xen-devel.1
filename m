Return-Path: <SRS0=v/14=JE=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DE16C433ED
	for <xen-devel@archiver.kernel.org>; Wed,  7 Apr 2021 10:10:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4F476139B
	for <xen-devel@archiver.kernel.org>; Wed,  7 Apr 2021 10:10:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4F476139B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.106594.203830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU58i-0000vg-2T; Wed, 07 Apr 2021 10:10:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106594.203830; Wed, 07 Apr 2021 10:10:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU58h-0000vZ-Uf; Wed, 07 Apr 2021 10:10:23 +0000
Received: by outflank-mailman (input) for mailman id 106594;
 Wed, 07 Apr 2021 10:10:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lU58g-0000vR-OA; Wed, 07 Apr 2021 10:10:22 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lU58g-0002iS-Hp; Wed, 07 Apr 2021 10:10:22 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lU58g-00004z-7O; Wed, 07 Apr 2021 10:10:22 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lU58g-00010l-6r; Wed, 07 Apr 2021 10:10:22 +0000
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
	bh=z8KaovdMXMoT5CLk7b93A1b+KoyIPYAu+pE2LfeigI4=; b=Ef+C2AIPnHFYcPzvJVi3HBerHl
	xVgySSvXM0NbaeYVtLzjBcD0zjHqsb047ZjN8u1P8r77UFyBbd47Fxc1F17jvEUkmAu73A9b+KvPT
	/icsO5bQfvzYfIMNP6X60Wlkbl2tSTzvgXFBx9ObJnbbJjABnjurNJOSRqAPBMW8gP74=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-160790-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 160790: all pass - PUSHED
X-Osstest-Versions-This:
    xen=19be4d56a1f7aa65eb4d92276fa5d386e9cb2a62
X-Osstest-Versions-That:
    xen=0435784cc75dcfef3b5f59c29deb1dbb84265ddb
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 07 Apr 2021 10:10:22 +0000

flight 160790 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/160790/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  19be4d56a1f7aa65eb4d92276fa5d386e9cb2a62
baseline version:
 xen                  0435784cc75dcfef3b5f59c29deb1dbb84265ddb

Last test of basis   160721  2021-04-04 09:18:26 Z    3 days
Testing same since   160790  2021-04-07 09:18:32 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  George Dunlap <george.dunlap@citrix.com>
  Ian Jackson <ian.jackson@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
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
   0435784cc7..19be4d56a1  19be4d56a1f7aa65eb4d92276fa5d386e9cb2a62 -> coverity-tested/smoke

