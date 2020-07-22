Return-Path: <SRS0=exI2=BB=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F681C433E3
	for <xen-devel@archiver.kernel.org>; Wed, 22 Jul 2020 10:40:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D14C2065E
	for <xen-devel@archiver.kernel.org>; Wed, 22 Jul 2020 10:40:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.b="4iTOdNaf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D14C2065E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyC9y-0003uj-Gr; Wed, 22 Jul 2020 10:39:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q/Qh=BB=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jyC9x-0003ue-KF
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2020 10:39:37 +0000
X-Inumbo-ID: a2cefc2d-cc07-11ea-8625-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a2cefc2d-cc07-11ea-8625-bc764e2007e4;
 Wed, 22 Jul 2020 10:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rnIQZIYAi8mmNQEv2neSr12PLQMrmpMFuLr32rOwwX4=; b=4iTOdNafhNdA3NAy7WTT+kJYh
 lZvC+I7T4Uve6Ghao406EQT5tquPHUqyIopUKaIBBUneRhI7wDtpEvVHcMb0FsfEj+WpIbXSrR0jU
 wwdMPEbSpMcgM97ygMtpBbX+LNlzsLOYGZv0+iUG+aIT0qv4M5BZLe5Ri6XeF+K+jYEY0=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jyC9v-0003t7-Kl; Wed, 22 Jul 2020 10:39:35 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jyC9v-00058B-7q; Wed, 22 Jul 2020 10:39:35 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jyC9u-0001re-Vq; Wed, 22 Jul 2020 10:39:35 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-152103-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 152103: all pass - PUSHED
X-Osstest-Versions-This: xen=f3885e8c3ceaef101e466466e879e97103ecce18
X-Osstest-Versions-That: xen=fb024b779336a0f73b3aee885b2ce082e812881f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 22 Jul 2020 10:39:34 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

flight 152103 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/152103/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  f3885e8c3ceaef101e466466e879e97103ecce18
baseline version:
 xen                  fb024b779336a0f73b3aee885b2ce082e812881f

Last test of basis   152012  2020-07-19 09:18:28 Z    3 days
Testing same since   152103  2020-07-22 09:24:23 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Christian Lindig <christian.lindig@citrix.com>
  Edwin Török <edvin.torok@citrix.com>
  Elliott Mitchell <ehem+xen@m5p.com>
  George Dunlap <george.dunlap@citrix.com>
  Igor Druzhinin <igor.druzhinin@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Michal Leszczynski <michal.leszczynski@cert.pl>
  Nick Rosbrook <rosbrookn@ainfosec.com>
  Nick Rosbrook <rosbrookn@gmail.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Tim Deegan <tim@xen.org>
  Wei Liu <wl@xen.org>

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
   fb024b7793..f3885e8c3c  f3885e8c3ceaef101e466466e879e97103ecce18 -> coverity-tested/smoke

