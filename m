Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB88606A31A
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 18:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=C3/RgCrs
Received: from list by lists.xenproject.org with outflank-mailman.1462357.1673334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLlgq-000076-AM; Tue, 27 Oct 2026 18:14:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462357.1673334; Tue, 27 Oct 2026 18:14:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLlgq-00006z-5l; Tue, 27 Oct 2026 18:14:28 +0000
Received: by outflank-mailman (input) for mailman id 1462357;
 Tue, 27 Oct 2026 18:14:27 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <berrange@redhat.com>) id 1xLlgo-00006t-RB
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 18:14:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLlgo-00556j-8F
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 19:14:26 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <berrange@redhat.com>)
 id 6ae0e9da-8faa-0a2a0a5109dd-0a2a450580e0-26
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 19:14:26 +0100
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <berrange@redhat.com>)
 id 6ae0ea01-4cb1-0a2a45050019-aa0a817c889b-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 19:14:26 +0100
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-651-ogOcdw8xNomqQoUIrQuolg-1; Tue,
 27 Oct 2026 14:14:15 -0400
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 6EFF81955BF1; Tue, 27 Oct 2026 18:14:10 +0000 (UTC)
Received: from berrange.csb (headnet04.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.116])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 8D1DC18005AD; Tue, 27 Oct 2026 18:14:01 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mimecast20190719 header.d=redhat.com header.i="@redhat.com" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793124864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=caBZVIE/hSguJ/sxrRpKGVVVydsKnFLoXQm6GdDdBq0=;
	b=C3/RgCrsuaoT6deF5d+L8VTH/NOkEUt2B/U/zTLA6a9GBtLYIWxcMfp7BT0X/1hC/2mf/c
	UF/TJua3jfEYlaBz+ND+ffk+jDroBRvH8bg7ZIrX/jAPaH7+0rSqCk7sLkPucnaYTGEt5/
	hbzGDrCSl9czz92hNqCvGpjjausx9F8=
X-MC-Unique: ogOcdw8xNomqQoUIrQuolg-1
X-Mimecast-MFC-AGG-ID: ogOcdw8xNomqQoUIrQuolg_1793124851
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	David Hildenbrand <david@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-riscv@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Chao Liu <chao.liu@processmission.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
	Amit Machhiwal <amachhiw@linux.ibm.com>,
	xen-devel@lists.xenproject.org,
	Sergio Lopez <slp@redhat.com>,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	Bibo Mao <maobibo@loongson.cn>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Xianglai Li <lixianglai@loongson.cn>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	qemu-s390x@nongnu.org,
	kvm@vger.kernel.org,
	Alexander Graf <graf@amazon.com>,
	Song Gao <17746591750@163.com>,
	Eric Farman <farman@linux.ibm.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 00/11] hw: mark virtualization related machines & accelerators as secure
Date: Tue, 27 Oct 2026 18:13:49 +0000
Message-ID: <20261027181400.1752951-1-berrange@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: SJRNZwynIFML59hhLezod6Z6NyBiu4eZJKOC1koHnNU_1793124851
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1793124866-245122A1-964B4F1E/0/0
X-purgate-type: clean
X-purgate-size: 1547
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is the machine type and accelerators patches pulled out of the
bigger series and split per target / accelerator:

  https://lists.gnu.org/archive/html/qemu-devel/2026-09/msg03555.html

Note this only deals with marking leaf types. All parent types
are implicitly also considered secure if any leaf is secure. A
future series will explicitly mark parent types too.

Daniel P. Berrangé (11):
  hw/arm: mark 'virt' as a secure machine
  hw/i386: mark 'microvm', 'i440fx', 'q35' as secure machines
  hw/loongarch: mark 'virt' as a secure machine
  hw/ppc: mark 'pseries' as a secure machine
  hw/riscv: mark 'virt' as a secure machine
  hw/s390x: mark 's390x-ccw-virtio' as a secure machine
  hw: mark xenpv, xenpvh, xenfv as secure machines
  hw/nitro: mark 'nitro' machine as secure
  accel/kvm: mark kvm accelerator as secure
  accel/xen: mark xen accelerator as secure
  accel/nitro: mark 'nitro' accelerator as secure

 accel/kvm/kvm-all.c        | 1 +
 accel/nitro/nitro-accel.c  | 1 +
 accel/xen/xen-all.c        | 1 +
 hw/arm/virt.c              | 1 +
 hw/arm/xen-pvh.c           | 1 +
 hw/i386/microvm.c          | 1 +
 hw/i386/pc_piix.c          | 4 ++--
 hw/i386/xen/xen-pvh.c      | 1 +
 hw/loongarch/virt.c        | 1 +
 hw/nitro/machine.c         | 1 +
 hw/ppc/spapr.c             | 1 +
 hw/riscv/virt.c            | 1 +
 hw/s390x/s390-virtio-ccw.c | 1 +
 hw/xenpv/xen_machine_pv.c  | 2 +-
 include/hw/i386/pc.h       | 1 +
 15 files changed, 16 insertions(+), 3 deletions(-)

-- 
2.56.0


