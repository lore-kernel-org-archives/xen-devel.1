Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F5CC3DA61
	for <xen-devel@archiver.kernel.org>; Wed, 24 Jul 2024 21:50:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.764533.1175001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWjsH-0007MP-Dn; Wed, 24 Jul 2024 21:50:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764533.1175001; Wed, 24 Jul 2024 21:50:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWjsH-0007MI-Ao; Wed, 24 Jul 2024 21:50:17 +0000
Received: by outflank-mailman (input) for mailman id 764533;
 Wed, 24 Jul 2024 21:50:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sWjsG-0007M8-BP; Wed, 24 Jul 2024 21:50:16 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sWjsG-0001UZ-5s; Wed, 24 Jul 2024 21:50:16 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sWjsF-0001VU-MD; Wed, 24 Jul 2024 21:50:15 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sWjsF-00073T-Ll; Wed, 24 Jul 2024 21:50:15 +0000
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
	bh=R+aEraF2W2GsUi7UATD2w2Rmhr5rJIuA3YlcKtmMPcQ=; b=zw7YA0MbQ5cx/n1/68JKdXWBtf
	9bIsrse3uReztsTDiElkg/bQsrdQGKnEBmTF7JcudjsWybnqQ6OAu+C9LClZmuk6lYttyCi72r6tp
	EP+T+/ODe+g3P4Gd9J6onNvkMdhEzT/ShkYQCUf6384/Vuix0ZObSm2ETifqTksPWmDA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186988-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186988: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=a7abb77c599f4243d7dbab552ec74ed4d0d0d152
X-Osstest-Versions-That:
    ovmf=a9c8c47d5347c74f5e7e7cb859912a276c6e9fb8
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 24 Jul 2024 21:50:15 +0000

flight 186988 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186988/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 a7abb77c599f4243d7dbab552ec74ed4d0d0d152
baseline version:
 ovmf                 a9c8c47d5347c74f5e7e7cb859912a276c6e9fb8

Last test of basis   186983  2024-07-24 10:43:12 Z    0 days
Testing same since   186988  2024-07-24 20:13:23 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>

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
   a9c8c47d53..a7abb77c59  a7abb77c599f4243d7dbab552ec74ed4d0d0d152 -> xen-tested-master

