Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC2F606A31A
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 18:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hWbXkW5k
Received: from list by lists.xenproject.org with outflank-mailman.1462360.1673351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLlh1-0000cD-Pa; Tue, 27 Oct 2026 18:14:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462360.1673351; Tue, 27 Oct 2026 18:14:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLlh1-0000c1-Md; Tue, 27 Oct 2026 18:14:39 +0000
Received: by outflank-mailman (input) for mailman id 1462360;
 Tue, 27 Oct 2026 18:14:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <berrange@redhat.com>) id 1xLlgz-0000b0-VM
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 18:14:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLlgz-007Z83-C7
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 19:14:37 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <berrange@redhat.com>)
 id 6ae0e9f9-e002-0a2a0a5209dd-0a2a450bdddc-48
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 19:14:37 +0100
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <berrange@redhat.com>)
 id 6ae0ea0c-b7e8-0a2a450b0019-aa0a857c9b57-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 19:14:37 +0100
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-648-DAvRLKr5NMGyM-khrW0W2g-1; Tue,
 27 Oct 2026 14:14:31 -0400
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 7DE8C1800747; Tue, 27 Oct 2026 18:14:27 +0000 (UTC)
Received: from berrange.csb (headnet04.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.116])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id C10C91800586; Tue, 27 Oct 2026 18:14:19 +0000 (UTC)
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
	s=mimecast20190719; t=1793124875;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c8HnPQcFtU7MhJRZ/6L5s11AsfWMBibuK6w1Kgqphf8=;
	b=hWbXkW5kZx8SU/EJ4dFQPQa23RCl3PyA8z6AfoD3j971c5GQC8oOEzPINBnGkIzqmgL+ww
	lbhYrMY9KaL2KKQS+H40/EKRPi+pb+Dgkx66eFk9khkjzOmtG1Hp/+qgZXvsG+Z+x7HSTT
	/RVocpX/sXFmfwZoDaR7k/ymsvn0ouo=
X-MC-Unique: DAvRLKr5NMGyM-khrW0W2g-1
X-Mimecast-MFC-AGG-ID: DAvRLKr5NMGyM-khrW0W2g_1793124868
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
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 02/11] hw/i386: mark 'microvm', 'i440fx', 'q35' as secure machines
Date: Tue, 27 Oct 2026 18:13:51 +0000
Message-ID: <20261027181400.1752951-3-berrange@redhat.com>
In-Reply-To: <20261027181400.1752951-1-berrange@redhat.com>
References: <20261027181400.1752951-1-berrange@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: otQgT7mrGDIjpAgBicGFDQDB0LDgNoBxWtGZmx61-sM_1793124868
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1793124877-1A8D99EA-972E30F0/0/0
X-purgate-type: clean
X-purgate-size: 1410
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The 'microvm', 'i440fx', 'q35' i386 machines are already declared
secure in docs/system/security.rst, due too their intended usage
in virtualization scenarios.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/i386/microvm.c    | 1 +
 include/hw/i386/pc.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index a49de337497..342aa7a9dd0 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -736,6 +736,7 @@ static const TypeInfo microvm_machine_info = {
     .instance_init = microvm_machine_initfn,
     .class_size    = sizeof(MicrovmMachineClass),
     .class_init    = microvm_class_init,
+    .secure        = true,
     .interfaces = (const InterfaceInfo[]) {
          { TYPE_HOTPLUG_HANDLER },
          { }
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 8edec62a1af..4ac489d2ffa 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -330,6 +330,7 @@ extern const size_t pc_compat_4_1_len;
         .name       = MACHINE_VER_TYPE_NAME(namestr, __VA_ARGS__), \
         .parent     = TYPE_PC_MACHINE, \
         .class_init = MACHINE_VER_SYM(class_init, namesym, __VA_ARGS__), \
+        .secure     = true, \
     }; \
     static void MACHINE_VER_SYM(register, namesym, __VA_ARGS__)(void) \
     { \
-- 
2.56.0


