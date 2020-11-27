Return-Path: <SRS0=GZ64=FB=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBF0DC2D0E4
	for <xen-devel@archiver.kernel.org>; Fri, 27 Nov 2020 09:20:22 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 539C220809
	for <xen-devel@archiver.kernel.org>; Fri, 27 Nov 2020 09:20:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.b="wOmHXq1P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 539C220809
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.39109.71886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiZuq-00082W-KI; Fri, 27 Nov 2020 09:19:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39109.71886; Fri, 27 Nov 2020 09:19:44 +0000
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
	id 1kiZuq-00082P-GI; Fri, 27 Nov 2020 09:19:44 +0000
Received: by outflank-mailman (input) for mailman id 39109;
 Fri, 27 Nov 2020 09:19:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kiZup-00082H-Mb; Fri, 27 Nov 2020 09:19:43 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kiZup-00082u-GB; Fri, 27 Nov 2020 09:19:43 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kiZup-0000au-87; Fri, 27 Nov 2020 09:19:43 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kiZup-0004eh-7c; Fri, 27 Nov 2020 09:19:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kiZup-00082H-Mb; Fri, 27 Nov 2020 09:19:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=IbZHOrRndej+7IFn42fI1mN7aSyEmKPqfeHX8o4cnXg=; b=wOmHXq1PAGjJNpMwnQM0zW4daq
	+IZJoLVGvtWk/WRQymUPpUXkYYnzXmQsG5OzMAZSYI8RjMDmI7yUdMyJfrEiMGJlCn2k2/MkNhEfz
	GoVsZJeuFIBvBNmV3BH8Tv3VJ0coT3ZF8DHWxIbveZu9MciHwcC0FzkKdjHXTDttc89M=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kiZup-00082u-GB; Fri, 27 Nov 2020 09:19:43 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kiZup-0000au-87; Fri, 27 Nov 2020 09:19:43 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kiZup-0004eh-7c; Fri, 27 Nov 2020 09:19:43 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-157045-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [libvirt test] 157045: regressions - FAIL
X-Osstest-Failures:
    libvirt:build-armhf-libvirt:libvirt-build:fail:regression
    libvirt:build-amd64-libvirt:libvirt-build:fail:regression
    libvirt:build-i386-libvirt:libvirt-build:fail:regression
    libvirt:build-arm64-libvirt:libvirt-build:fail:regression
    libvirt:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
    libvirt:test-amd64-amd64-libvirt-pair:build-check(1):blocked:nonblocking
    libvirt:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    libvirt:test-amd64-amd64-libvirt-vhd:build-check(1):blocked:nonblocking
    libvirt:test-amd64-amd64-libvirt-xsm:build-check(1):blocked:nonblocking
    libvirt:test-amd64-i386-libvirt:build-check(1):blocked:nonblocking
    libvirt:test-amd64-i386-libvirt-pair:build-check(1):blocked:nonblocking
    libvirt:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    libvirt:test-amd64-i386-libvirt-xsm:build-check(1):blocked:nonblocking
    libvirt:test-arm64-arm64-libvirt:build-check(1):blocked:nonblocking
    libvirt:test-arm64-arm64-libvirt-qcow2:build-check(1):blocked:nonblocking
    libvirt:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    libvirt:test-armhf-armhf-libvirt:build-check(1):blocked:nonblocking
    libvirt:test-armhf-armhf-libvirt-raw:build-check(1):blocked:nonblocking
X-Osstest-Versions-This:
    libvirt=6d69afe4517646811ee96981408bc6fc18b5ffbb
X-Osstest-Versions-That:
    libvirt=2c846fa6bcc11929c9fb857a22430fb9945654ad
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 27 Nov 2020 09:19:43 +0000

flight 157045 libvirt real [real]
http://logs.test-lab.xenproject.org/osstest/logs/157045/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-armhf-libvirt           6 libvirt-build            fail REGR. vs. 151777
 build-amd64-libvirt           6 libvirt-build            fail REGR. vs. 151777
 build-i386-libvirt            6 libvirt-build            fail REGR. vs. 151777
 build-arm64-libvirt           6 libvirt-build            fail REGR. vs. 151777

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-amd64-libvirt-vhd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt       1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-i386-libvirt-xsm   1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt      1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-qcow2  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-raw  1 build-check(1)               blocked  n/a

version targeted for testing:
 libvirt              6d69afe4517646811ee96981408bc6fc18b5ffbb
baseline version:
 libvirt              2c846fa6bcc11929c9fb857a22430fb9945654ad

Last test of basis   151777  2020-07-10 04:19:19 Z  140 days
Failing since        151818  2020-07-11 04:18:52 Z  139 days  134 attempts
Testing same since   157045  2020-11-27 04:20:18 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Adolfo Jayme Barrientos <fitoschido@gmail.com>
  Aleksandr Alekseev <alexander.alekseev@virtuozzo.com>
  Andika Triwidada <andika@gmail.com>
  Andrea Bolognani <abologna@redhat.com>
  Balázs Meskó <meskobalazs@mailbox.org>
  Barrett Schonefeld <bschoney@utexas.edu>
  Bastien Orivel <bastien.orivel@diateam.net>
  Bihong Yu <yubihong@huawei.com>
  Binfeng Wu <wubinfeng@huawei.com>
  Boris Fiuczynski <fiuczy@linux.ibm.com>
  Brian Turek <brian.turek@gmail.com>
  Christian Ehrhardt <christian.ehrhardt@canonical.com>
  Christian Schoenebeck <qemu_oss@crudebyte.com>
  Cole Robinson <crobinso@redhat.com>
  Collin Walling <walling@linux.ibm.com>
  Cornelia Huck <cohuck@redhat.com>
  Côme Borsoi <fedora@borsoi.fr>
  Daniel Henrique Barboza <danielhb413@gmail.com>
  Daniel Letai <dani@letai.org.il>
  Daniel P. Berrange <berrange@redhat.com>
  Daniel P. Berrangé <berrange@redhat.com>
  Erik Skultety <eskultet@redhat.com>
  Fabian Freyer <fabian.freyer@physik.tu-berlin.de>
  Fangge Jin <fjin@redhat.com>
  Fedora Weblate Translation <i18n@lists.fedoraproject.org>
  Göran Uddeborg <goeran@uddeborg.se>
  Halil Pasic <pasic@linux.ibm.com>
  Han Han <hhan@redhat.com>
  Hao Wang <wanghao232@huawei.com>
  Ian Wienand <iwienand@redhat.com>
  Jamie Strandboge <jamie@canonical.com>
  Jamie Strandboge <jamie@ubuntu.com>
  Jean-Baptiste Holcroft <jean-baptiste@holcroft.fr>
  Jianan Gao <jgao@redhat.com>
  Jim Fehlig <jfehlig@suse.com>
  Jin Yan <jinyan12@huawei.com>
  Jiri Denemark <jdenemar@redhat.com>
  Jonathan Watt <jwatt@jwatt.org>
  Jonathon Jongsma <jjongsma@redhat.com>
  Julio Faracco <jcfaracco@gmail.com>
  Ján Tomko <jtomko@redhat.com>
  Kashyap Chamarthy <kchamart@redhat.com>
  Kevin Locke <kevin@kevinlocke.name>
  Laine Stump <laine@redhat.com>
  Liao Pingfang <liao.pingfang@zte.com.cn>
  Lin Ma <lma@suse.com>
  Lin Ma <lma@suse.de>
  Lin Ma <morecache@gmail.com>
  Marc Hartmayer <mhartmay@linux.ibm.com>
  Marc-André Lureau <marcandre.lureau@redhat.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Markus Schade <markus.schade@hetzner.com>
  Martin Kletzander <mkletzan@redhat.com>
  Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>
  Matt Coleman <matt@datto.com>
  Matt Coleman <mcoleman@datto.com>
  Mauro Matteo Cascella <mcascell@redhat.com>
  Michal Privoznik <mprivozn@redhat.com>
  Michał Smyk <fedora@smyk.it>
  Milo Casagrande <milo@milo.name>
  Neal Gompa <ngompa13@gmail.com>
  Nico Pache <npache@redhat.com>
  Nikolay Shirokovskiy <nshirokovskiy@virtuozzo.com>
  Olaf Hering <olaf@aepfle.de>
  Olesya Gerasimenko <gammaray@basealt.ru>
  Orion Poplawski <orion@nwra.com>
  Patrick Magauran <patmagauran.j@gmail.com>
  Paulo de Rezende Pinatti <ppinatti@linux.ibm.com>
  Pavel Hrdina <phrdina@redhat.com>
  Peter Krempa <pkrempa@redhat.com>
  Pino Toscano <ptoscano@redhat.com>
  Pino Toscano <toscano.pino@tiscali.it>
  Piotr Drąg <piotrdrag@gmail.com>
  Prathamesh Chavan <pc44800@gmail.com>
  Ricky Tigg <ricky.tigg@gmail.com>
  Roman Bogorodskiy <bogorodskiy@gmail.com>
  Roman Bolshakov <r.bolshakov@yadro.com>
  Ryan Gahagan <rgahagan@cs.utexas.edu>
  Ryan Schmidt <git@ryandesign.com>
  Sam Hartman <hartmans@debian.org>
  Scott Shambarger <scott-libvirt@shambarger.net>
  Sebastian Mitterle <smitterl@redhat.com>
  Shaojun Yang <yangshaojun@phytium.com.cn>
  Simon Gaiser <simon@invisiblethingslab.com>
  Stefan Bader <stefan.bader@canonical.com>
  Stefan Berger <stefanb@linux.ibm.com>
  Szymon Scholz <szymonscholz@gmail.com>
  Thomas Huth <thuth@redhat.com>
  Tim Wiederhake <twiederh@redhat.com>
  Tomáš Golembiovský <tgolembi@redhat.com>
  Wang Xin <wangxinxin.wang@huawei.com>
  Weblate <noreply@weblate.org>
  Yang Hang <yanghang44@huawei.com>
  Yanqiu Zhang <yanqzhan@redhat.com>
  Yi Li <yili@winhong.com>
  Yi Wang <wang.yi59@zte.com.cn>
  Yuri Chornoivan <yurchor@ukr.net>
  Zheng Chuan <zhengchuan@huawei.com>
  zhenwei pi <pizhenwei@bytedance.com>
  Zhenyu Zheng <zheng.zhenyu@outlook.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          fail    
 build-arm64-libvirt                                          fail    
 build-armhf-libvirt                                          fail    
 build-i386-libvirt                                           fail    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           blocked 
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            blocked 
 test-amd64-amd64-libvirt-xsm                                 blocked 
 test-arm64-arm64-libvirt-xsm                                 blocked 
 test-amd64-i386-libvirt-xsm                                  blocked 
 test-amd64-amd64-libvirt                                     blocked 
 test-arm64-arm64-libvirt                                     blocked 
 test-armhf-armhf-libvirt                                     blocked 
 test-amd64-i386-libvirt                                      blocked 
 test-amd64-amd64-libvirt-pair                                blocked 
 test-amd64-i386-libvirt-pair                                 blocked 
 test-arm64-arm64-libvirt-qcow2                               blocked 
 test-armhf-armhf-libvirt-raw                                 blocked 
 test-amd64-amd64-libvirt-vhd                                 blocked 


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

(No revision log; it would be 29554 lines long.)

