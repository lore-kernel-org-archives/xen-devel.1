Return-Path: <SRS0=2oKG=LY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 689B1C11F65
	for <xen-devel@archiver.kernel.org>; Wed, 30 Jun 2021 12:44:49 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DC9761429
	for <xen-devel@archiver.kernel.org>; Wed, 30 Jun 2021 12:44:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DC9761429
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.148187.273815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyZZs-00054x-Hq; Wed, 30 Jun 2021 12:44:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148187.273815; Wed, 30 Jun 2021 12:44:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyZZs-00054q-Eb; Wed, 30 Jun 2021 12:44:28 +0000
Received: by outflank-mailman (input) for mailman id 148187;
 Wed, 30 Jun 2021 12:44:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lyZZr-00054e-BF; Wed, 30 Jun 2021 12:44:27 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lyZZr-0005NT-5Z; Wed, 30 Jun 2021 12:44:27 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lyZZq-000849-PN; Wed, 30 Jun 2021 12:44:26 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lyZZq-00076j-Ot; Wed, 30 Jun 2021 12:44:26 +0000
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
	bh=1cpqL2Mq8Giqcq6CEMYOI/FvT1hGNK3IUCFPY35nGXU=; b=6wqVs38FTYpZxm8dyaWA6UDlm5
	IorrPOSJNNCW6SPQuLm26bKbll9j8Be1zmjQiiagbeDZ0HoiRtR2nW72oE+KGoYmSL79hMTLrF3qw
	2zu4HwbkyHlIwX4MyXqjsAoKhPXVH1mJNDAL5fMaL+Fsv78JR4FvQgaR/7bTN7sHCbWg=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-163192-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 163192: regressions - FAIL
X-Osstest-Failures:
    ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
    ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
X-Osstest-Versions-This:
    ovmf=580b11201ed001f9533c6782ec87d430b1736040
X-Osstest-Versions-That:
    ovmf=c410ad4da4b7785170d3d42a3ba190c2caac6feb
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 30 Jun 2021 12:44:26 +0000

flight 163192 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/163192/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-xl-qemuu-ovmf-amd64 12 debian-hvm-install fail REGR. vs. 162359
 test-amd64-amd64-xl-qemuu-ovmf-amd64 12 debian-hvm-install fail REGR. vs. 162359

version targeted for testing:
 ovmf                 580b11201ed001f9533c6782ec87d430b1736040
baseline version:
 ovmf                 c410ad4da4b7785170d3d42a3ba190c2caac6feb

Last test of basis   162359  2021-06-04 03:40:08 Z   26 days
Failing since        162368  2021-06-04 15:42:59 Z   25 days   66 attempts
Testing same since   163192  2021-06-30 05:20:18 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abner Chang <abner.chang@hpe.com>
  Agrawal, Sachin <sachin.agrawal@intel.com>
  Alexandru Elisei <alexandru.elisei@arm.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Ard Biesheuvel <ardb@kernel.org>
  Daniel Schaefer <daniel.schaefer@hpe.com>
  Daoxiang Li <daoxiang.li@intel.com>
  Dov Murik <dovmurik@linux.ibm.com>
  DunTan <dun.tan@intel.com>
  gaoliming <gaoliming@byosoft.com.cn>
  Guo Dong <guo.dong@intel.com>
  Hao A Wu <hao.a.wu@intel.com>
  Jian J Wang <jian.j.wang@intel.com>
  Kaaira Gupta <kaaira7319@gmail.com>
  Ken Lautner <klautner@microsoft.com>
  Kenneth Lautner <kenlautner3@gmail.com>
  Kun Qin <kuqin12@gmail.com>
  Laszlo Ersek <lersek@redhat.com>
  Leif Lindholm <leif@nuviainc.com>
  Liming Gao <gaoliming@byosoft.com.cn>
  Loo Tung Lun <tung.lun.loo@intel.com>
  Loo, Tung Lun <tung.lun.loo@intel.com>
  Manickavasakam Karpagavinayagam <manickavasakamk@ami.com>
  Maurice Ma <maurice.ma@intel.com>
  Ni, Ray <ray.ni@intel.com>
  Patrick Rudolph <patrick.rudolph@9elements.com>
  Pierre Gondois <Pierre.Gondois@arm.com>
  Ray Ni <ray.ni@intel.com>
  Rebecca Cran <rebecca@bsdio.com>
  Rebecca Cran <rebecca@nuviainc.com>
  Sachin Agrawal <sachin.agrawal@intel.com>
  Sami Mujawar <sami.mujawar@arm.com>
  Scottie Kuo <scottie.kuo@intel.com>
  Sean Brogan <sean.brogan@microsoft.com>
  Sean Brogan <spbrogan@live.com>
  Sumana Venur <sumana.venur@intel.com>
  Sunil V L <sunilvl@ventanamicro.com>
  xueshengfeng <xueshengfeng@byosoft.com.cn>
  Zhiguang Liu <zhiguang.liu@intel.com>

jobs:
 build-amd64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         fail    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          fail    


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


Not pushing.

(No revision log; it would be 2917 lines long.)

