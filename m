Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB25606A31A
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2026 10:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IVpoXcVS
Received: from list by lists.xenproject.org with outflank-mailman.1457450.1671072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKCLa-0007v5-8a; Fri, 23 Oct 2026 10:18:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1457450.1671072; Fri, 23 Oct 2026 10:18:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKCLa-0007ux-4y; Fri, 23 Oct 2026 10:18:02 +0000
Received: by outflank-mailman (input) for mailman id 1457450;
 Wed, 21 Oct 2026 16:30:05 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <armbru@redhat.com>) id 1xJZCX-0004re-Mj
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 16:30:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJZCX-008U6r-3Y
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 18:30:05 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <armbru@redhat.com>)
 id 6ad8e88a-bab6-0a2a0a5309dd-0a2a4502d226-18
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 18:30:04 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <armbru@redhat.com>)
 id 6ad8e88b-6ca4-0a2a45020019-aa0a817cdd39-3
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 18:30:04 +0200
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-5-uVm7wy9uPnqna-YWwQgM4A-1; Wed,
 21 Oct 2026 12:30:00 -0400
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8BB8C195396C; Wed, 21 Oct 2026 16:29:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.44.22.5])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id CE23F18005B7; Wed, 21 Oct 2026 16:29:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6C44321E6A04; Wed, 21 Oct 2026 18:29:40 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mimecast20190719 header.d=redhat.com header.i="@redhat.com" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792600203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gZqi5d3mOF1KjfwoAQKfIbSpBBQZDfbhPtfOzYqQUmI=;
	b=IVpoXcVS5nRf6ndwi0P3A8JbkHJFaAAk1xPNA+q2IUAlMjXBIkzN7WgYkt1QXjbpskdSde
	BaU7/gKrPSIi5l5OizqT4j3Jo262T89Mox/CVR/7+f3Njc8BrOYWzenRJlj5FurvRjPUtd
	Ax5C2lTSiFXxWwKh+kg9oftpShqvhc0=
X-MC-Unique: uVm7wy9uPnqna-YWwQgM4A-1
X-Mimecast-MFC-AGG-ID: uVm7wy9uPnqna-YWwQgM4A_1792600194
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org,  Michael Roth <michael.roth@amd.com>,  John Snow
 <jsnow@redhat.com>,  Peter Maydell <peter.maydell@linaro.org>,  Mauro
 Carvalho Chehab <mchehab+huawei@kernel.org>,  Pierrick Bouvier
 <pierrick.bouvier@oss.qualcomm.com>,  Paolo Bonzini <pbonzini@redhat.com>,
  Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Kostiantyn
 Kostiuk
 <kkostiuk@redhat.com>,  Eric Blake <eblake@redhat.com>,  David Hildenbrand
 <david@kernel.org>,  Igor Mammedov <imammedo@redhat.com>,  "Edgar E.
 Iglesias" <edgar.iglesias@gmail.com>,  Jason Wang <jasowangio@gmail.com>,
  Marcelo Tosatti <mtosatti@redhat.com>,  kvm@vger.kernel.org,  Alberto
 Garcia <berto@igalia.com>,  Kevin Wolf <kwolf@redhat.com>,  Hanna Reitz
 <hreitz@redhat.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@oss.qualcomm.com>,
  Zhao Liu <zhao1.liu@intel.com>,  Jonathan Cameron <jic23@kernel.org>,
  Junjie Cao <junjie.cao@intel.com>,  Anisa Su <anisa.su@samsung.com>,
  Elena Ufimtseva <elena.ufimtseva@oracle.com>,  Jagannathan Raman
 <jag.raman@oracle.com>,  John Levon <john.levon@nutanix.com>,  Thanos
 Makatos <thanos.makatos@nutanix.com>,  =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@redhat.com>,
  Cornelia Huck <cohuck@redhat.com>,  Eric Farman <farman@linux.ibm.com>,
  Matthew Rosato <mjrosato@linux.ibm.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  Ilya Leoshkevich <iii@linux.ibm.com>,
  qemu-block@nongnu.org,  linux-cxl@vger.kernel.org,
  qemu-s390x@nongnu.org,  "Michael S. Tsirkin" <mst@redhat.com>,  Sergio
 Lopez <slp@redhat.com>,  qemu-arm@nongnu.org,  Palmer Dabbelt
 <palmer@dabbelt.com>,  Alistair Francis <alistair.francis@wdc.com>,
  Weiwei Li <liwei1518@gmail.com>,  Daniel Henrique Barboza
 <daniel.barboza@oss.qualcomm.com>,  Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>,  Chao Liu <chao.liu@processmission.com>,
  qemu-riscv@nongnu.org,  Song Gao <17746591750@163.com>,  Bibo Mao
 <maobibo@loongson.cn>,  Xianglai Li <lixianglai@loongson.cn>,  Jiaxun Yang
 <jiaxun.yang@flygoat.com>,  Pedro Barbuda <pbarbuda@microsoft.com>,
  Mohamed Mediouni <mohamed@unpredictable.fr>,  Nicholas Piggin
 <npiggin@gmail.com>,  Harsh Prateek Bora <harshpb@linux.ibm.com>,  Amit
 Machhiwal <amachhiw@linux.ibm.com>,  qemu-ppc@nongnu.org,  Zhang Chen
 <zhangckid@gmail.com>,  Li Zhijian <lizhijian@fujitsu.com>,  Alistair
 Francis <alistair@alistair23.me>,  Alexander Graf <graf@amazon.com>,
  "Gonglei (Arei)" <arei.gonglei@huawei.com>,  zhenwei pi
 <zhenwei.pi@linux.dev>,  Ani Sinha <anisinha@redhat.com>,  Luc Michel
 <luc@lmichel.fr>,  =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,  Jamin
 Lin
 <jamin_lin@aspeedtech.com>,  Kane Chen <kane_chen@aspeedtech.com>,  Samuel
 Tardieu <sam@rfc1149.net>,  "Denis V. Lunev" <den@openvz.org>,  FangSheng
 Huang <FangSheng.Huang@amd.com>,  Tyrone Ting <kfting@nuvoton.com>,  Hao
 Wu <wuhaotsh@google.com>,  Keith Busch <kbusch@kernel.org>,  Klaus Jensen
 <its@irrelevant.dk>,  Jesper Devantier <foss@defmacro.it>,  Aditya Gupta
 <adityag@linux.ibm.com>,  Glenn Miles <milesg@linux.ibm.com>,  Conor
 Dooley <conor@kernel.org>,  Sebastian Huber
 <sebastian.huber@embedded-brains.de>,  Halil Pasic <pasic@linux.ibm.com>,
  Christian Borntraeger <borntraeger@linux.ibm.com>,  Jason Herne
 <jjherne@linux.ibm.com>,  Titus Rwantare <titusr@google.com>,  Stefano
 Stabellini <sstabellini@kernel.org>,  Anthony PERARD
 <anthony@xenproject.org>,  Peter Xu <peterx@redhat.com>,  Chinmay Rath
 <rathc@linux.ibm.com>,  Hendrik Brueckner <brueckner@linux.ibm.com>,
  xen-devel@lists.xenproject.org,  Roman Bolshakov <rbolshakov@ddn.com>,
  Phil Dennis-Jordan <phil@philjordan.eu>,  Fam Zheng <fam@euphon.net>,
  Farhan Ali <alifm@linux.ibm.com>,  Alex Williamson <alex@shazbot.org>,
  Tao Tang <tangtao1634@phytium.com.cn>,  Stefan Berger
 <stefanb@linux.vnet.ibm.com>,  Fabiano Rosas <farosas@suse.de>,  Mark
 Cave-Ayland <mark.cave-ayland@ilande.co.uk>,  Artyom Tarasenko
 <atar4qemu@gmail.com>,  Yoshinori Sato <yoshinori.sato@nifty.com>,  Jiri
 Pirko <jiri@resnulli.us>,  Eric Auger <eric.auger@redhat.com>,  Laurent
 Vivier <lvivier@redhat.com>
Subject: Property types changed in this series (was: [PATCH v7 00/65] Hi)
In-Reply-To: <20261020-qom-qapi-v7-0-431a86b02b58@redhat.com> (marcandre
	lureau's message of "Tue, 20 Oct 2026 14:45:17 +0400")
References: <20261020-qom-qapi-v7-0-431a86b02b58@redhat.com>
Date: Wed, 21 Oct 2026 18:29:40 +0200
Message-ID: <87tsmfkoej.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: B2kxSoh1jySj2AFfgWjLl2DM47pRus-WSSNVKDk2hMs_1792600194
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
X-purgate-ID: tlsNG-720697/1792600204-307C22AC-BAC6BB24/0/0
X-purgate-type: clean
X-purgate-size: 2831
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

I used qom-list-types and qom-list-properties to list all properties and
their types, then looked for changes.  This can miss changes in
dynamically created properties; see the note on qom-list-properties in
qapi/qom.json.  Moreover, I ran into a few QOM types where
qom-list-properties is broken.

1. Close misses of QAPI type names change to actual QAPI type names

    old property type           new property type
    ---------------------------------------------
    string                      str
    uint64_t                    uint64
    uint64_t                    size
    int32_t                     int32
    int                         size
    uint32_t                    uint32
    [uint16]                    uint16List
    NotifyVMexitOption          NotifyVmexitOption
    CXLFixedMemoryWindow        CXLFixedMemoryWindowOptionsList

2. Incorrect QAPI type names change to correct ones

    old property type           new property type
    ---------------------------------------------
    SgxEPC                      SgxEPCList
    QAuthZListRule              QAuthZListRuleList
    X86CPUFeatureWordInfo       X86CPUFeatureWordInfoList
    bool                        Pca9552LedState

3. Less than useful QAPI type names change to more useful ones

    old property type           new property type
    ---------------------------------------------
    str                         Pca9552PinState
    str                         Pca9554PinState

4. Lazy crap
 
    old property type           new property type
    ---------------------------------------------
    list                        link<arm-cpu>List
    list                        strList
    list                        uint16List
    list                        uint32List
    list                        uint64List
    list                        uint8List
    struct                      any

    I'm not sure the first one is what it should be.

    I need to have a closer look at the last one.

5. Inventive crap
  
    old property type           new property type
    ---------------------------------------------
    busnr                       uint8
    guest statistics            VirtioBalloonGuestStats
    loadparm                    str
    on|off|split                OnOffSplit
    struct tm                   StructTm

6. An odd duck

    old property type           new property type
    ---------------------------------------------
    str                         int32

    This is pci-device property addr.  See PATCH 54.

On the way, I noted properties with anti-social names:

    QOM type name       property name
    ---------------------------------
    acpi-ged            memhp container[0]
    e500-spin           e500 spin pv device[0]


