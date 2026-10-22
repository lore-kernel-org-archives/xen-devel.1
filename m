Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE66606A31D
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2026 10:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ffV77D/0
Received: from list by lists.xenproject.org with outflank-mailman.1457799.1671079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKCLa-0007zz-HL; Fri, 23 Oct 2026 10:18:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1457799.1671079; Fri, 23 Oct 2026 10:18:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKCLa-0007zb-CB; Fri, 23 Oct 2026 10:18:02 +0000
Received: by outflank-mailman (input) for mailman id 1457799;
 Thu, 22 Oct 2026 06:49:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <armbru@redhat.com>) id 1xJmcG-0007F3-Sc
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2026 06:49:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJmcG-001BlI-2K
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2026 08:49:32 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <armbru@redhat.com>)
 id 6ad9b1f4-8faa-0a2a0a5109dd-0a2a4505d124-26
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 08:49:31 +0200
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <armbru@redhat.com>)
 id 6ad9b1fa-4cb1-0a2a45050019-aa0a857cca09-3
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 08:49:31 +0200
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-668-9wIN8bqtNjm5ZsV_6-4TKQ-1; Thu,
 22 Oct 2026 06:49:26 +0000
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 2E93719560B2; Thu, 22 Oct 2026 06:49:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.44.22.5])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 725C81803A48; Thu, 22 Oct 2026 06:49:14 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1B3A121E6A04; Thu, 22 Oct 2026 08:49:12 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mimecast20190719 header.d=redhat.com header.i="@redhat.com" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792651770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JADHWg0Jlsj3MBmuPMLUMpANIVwK+0qeu0X1mxgI0Mk=;
	b=ffV77D/0ReZDC2F4Zs2LkCXWakwzWO8FeMGwsFvj/L9lpSHqSI3lxP9aUl/RpSl2o6T2Ya
	hpQYzmHEeT1/p1K0V11YN8Hyo9lovmGf1WXspxItAQ+iwSlWqTRqHItUl3YjAgGxw28SqT
	omm60soW5Lfsstv1f+TN3erzAT3RegI=
X-MC-Unique: 9wIN8bqtNjm5ZsV_6-4TKQ-1
X-Mimecast-MFC-AGG-ID: 9wIN8bqtNjm5ZsV_6-4TKQ_1792651761
From: Markus Armbruster <armbru@redhat.com>
To: devel@lists.libvirt.org
Cc: marcandre.lureau@redhat.com, qemu-devel@nongnu.org,  Michael Roth
 <michael.roth@amd.com>,  John Snow <jsnow@redhat.com>,  Peter Maydell
 <peter.maydell@linaro.org>,  Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>,  Pierrick Bouvier
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
Subject: Re: Property types changed in this series
In-Reply-To: <87tsmfkoej.fsf@pond.sub.org> (Markus Armbruster's message of
	"Wed, 21 Oct 2026 18:29:40 +0200")
References: <20261020-qom-qapi-v7-0-431a86b02b58@redhat.com>
	<87tsmfkoej.fsf@pond.sub.org>
Date: Thu, 22 Oct 2026 08:49:12 +0200
Message-ID: <878q3qkz6f.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: s_J0x-Iljg2GUajGPBWlschbCyzmrelUbS7sAzMAoZU_1792651761
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c201ff/1792651771-F7CB82A1-FACECDB5/0/0
X-purgate-type: clean
X-purgate-size: 3469
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Libvirt developers: does libvirt use member @type of the reply of
qom-list, qom-list-properties, qom-list-get?

I'm asking because Marc-Andr=C3=A9's work changes many values to add a more
useful replacement.  I think we should deprecate @type.  I'd like to
find out whether we need to preserve the values for the deprecation
grace period.

Markus Armbruster <armbru@redhat.com> writes:

> I used qom-list-types and qom-list-properties to list all properties and
> their types, then looked for changes.  This can miss changes in
> dynamically created properties; see the note on qom-list-properties in
> qapi/qom.json.  Moreover, I ran into a few QOM types where
> qom-list-properties is broken.

These are ast2700-a1, ast2700-a2, and several riscv CPUs.  A fix for the
latter has been queued.

> 1. Close misses of QAPI type names change to actual QAPI type names
>
>     old property type           new property type
>     ---------------------------------------------
>     string                      str
>     uint64_t                    uint64
>     uint64_t                    size
>     int32_t                     int32
>     int                         size
>     uint32_t                    uint32
>     [uint16]                    uint16List
>     NotifyVMexitOption          NotifyVmexitOption
>     CXLFixedMemoryWindow        CXLFixedMemoryWindowOptionsList
>
> 2. Incorrect QAPI type names change to correct ones
>
>     old property type           new property type
>     ---------------------------------------------
>     SgxEPC                      SgxEPCList
>     QAuthZListRule              QAuthZListRuleList
>     X86CPUFeatureWordInfo       X86CPUFeatureWordInfoList
>     bool                        Pca9552LedState
>
> 3. Less than useful QAPI type names change to more useful ones
>
>     old property type           new property type
>     ---------------------------------------------
>     str                         Pca9552PinState
>     str                         Pca9554PinState
>
> 4. Lazy crap
> =20
>     old property type           new property type
>     ---------------------------------------------
>     list                        link<arm-cpu>List
>     list                        strList
>     list                        uint16List
>     list                        uint32List
>     list                        uint64List
>     list                        uint8List
>     struct                      any
>
>     I'm not sure the first one is what it should be.
>
>     I need to have a closer look at the last one.
>
> 5. Inventive crap
>  =20
>     old property type           new property type
>     ---------------------------------------------
>     busnr                       uint8
>     guest statistics            VirtioBalloonGuestStats
>     loadparm                    str
>     on|off|split                OnOffSplit
>     struct tm                   StructTm
>
> 6. An odd duck
>
>     old property type           new property type
>     ---------------------------------------------
>     str                         int32
>
>     This is pci-device property addr.  See PATCH 54.
>
> On the way, I noted properties with anti-social names:
>
>     QOM type name       property name
>     ---------------------------------
>     acpi-ged            memhp container[0]
>     e500-spin           e500 spin pv device[0]


