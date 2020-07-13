Return-Path: <SRS0=Ja2z=AY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FA27C433E2
	for <xen-devel@archiver.kernel.org>; Mon, 13 Jul 2020 21:13:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E11382077D
	for <xen-devel@archiver.kernel.org>; Mon, 13 Jul 2020 21:13:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.b="XNiV4ccc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E11382077D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jv5lL-0005ZH-Bt; Mon, 13 Jul 2020 21:13:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fjqj=AY=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jv5lK-0005ZC-1S
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2020 21:13:22 +0000
X-Inumbo-ID: ae122124-c54d-11ea-bb8b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ae122124-c54d-11ea-bb8b-bc764e2007e4;
 Mon, 13 Jul 2020 21:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=laf81dCMnqLhyWOADgLo3ZfPx6gkEFZUfMZWpMJL9zM=; b=XNiV4cccs/BbiTIm0b+lBxZKA
 /wL/qnjRRrm4XZ6pXSqB/WVWFkWE8vaKWVxcwkyxe5qVN167wHBERUII/tzQ6Cj5NkoXyNHcq3EUy
 582f432C/ci3BbDfeQslB+WbJWizvidY9llaf2N68dbzNFcl3p8TpjaeP2DhF1taxZr4Q=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jv5lI-00080l-W1; Mon, 13 Jul 2020 21:13:21 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jv5lI-0004EU-LD; Mon, 13 Jul 2020 21:13:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jv5lI-0005t4-Kf; Mon, 13 Jul 2020 21:13:20 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-151867-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 151867: all pass - PUSHED
X-Osstest-Versions-This: ovmf=d9a4084544134eea50f62e88d79c466ae91f0455
X-Osstest-Versions-That: ovmf=f45e3a4afa65a45ea1a956a7c5e7410ff40190d1
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 13 Jul 2020 21:13:20 +0000
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

flight 151867 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/151867/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 d9a4084544134eea50f62e88d79c466ae91f0455
baseline version:
 ovmf                 f45e3a4afa65a45ea1a956a7c5e7410ff40190d1

Last test of basis   151821  2020-07-11 06:33:51 Z    2 days
Testing same since   151867  2020-07-13 16:09:22 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Guo Dong <guo.dong@intel.com>
  Marcello Sylvester Bauer <marcello.bauer@9elements.com>
  Patrick Rudolph <patrick.rudolph@9elements.com>

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
   f45e3a4afa..d9a4084544  d9a4084544134eea50f62e88d79c466ae91f0455 -> xen-tested-master

