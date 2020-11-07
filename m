Return-Path: <SRS0=ycEq=EN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65C52C2D0A3
	for <xen-devel@archiver.kernel.org>; Sat,  7 Nov 2020 01:11:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FE6320704
	for <xen-devel@archiver.kernel.org>; Sat,  7 Nov 2020 01:11:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eVZtrEZw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FE6320704
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.21226.47528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kbClV-0003Bo-G2; Sat, 07 Nov 2020 01:11:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 21226.47528; Sat, 07 Nov 2020 01:11:37 +0000
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
	id 1kbClV-0003Bh-Bq; Sat, 07 Nov 2020 01:11:37 +0000
Received: by outflank-mailman (input) for mailman id 21226;
 Sat, 07 Nov 2020 01:11:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kTuc=EN=redhat.com=bmasney@srs-us1.protection.inumbo.net>)
 id 1kbClT-0003Bc-Sl
 for xen-devel@lists.xenproject.org; Sat, 07 Nov 2020 01:11:35 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 888e7b8f-2d5a-47e5-9387-8f91592ef49b;
 Sat, 07 Nov 2020 01:11:34 +0000 (UTC)
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-KaIzL_T-O6CZQ9JMKHkH-w-1; Fri, 06 Nov 2020 20:11:32 -0500
Received: by mail-qv1-f70.google.com with SMTP id r11so1776806qvn.1
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2020 17:11:32 -0800 (PST)
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net.
 [98.239.145.235])
 by smtp.gmail.com with ESMTPSA id q6sm1758584qtq.53.2020.11.06.17.11.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 17:11:30 -0800 (PST)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=kTuc=EN=redhat.com=bmasney@srs-us1.protection.inumbo.net>)
	id 1kbClT-0003Bc-Sl
	for xen-devel@lists.xenproject.org; Sat, 07 Nov 2020 01:11:35 +0000
X-Inumbo-ID: 888e7b8f-2d5a-47e5-9387-8f91592ef49b
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id 888e7b8f-2d5a-47e5-9387-8f91592ef49b;
	Sat, 07 Nov 2020 01:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604711493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=s03eFWh3bvVnssKugy+SfcexCfSnOxFiFxui5ZZE6JM=;
	b=eVZtrEZww1YjvsUVfGezOqx/owmpDb0u9YcL9wkHu1NURBh6wGoInW5APFi6MST0iXrlo1
	avpkU/0uXDrRKwGxpFjjEhDMq5xG7HCwiMBsqLuNYVqlRIomOFHtsdLsojUTS2OtgM8qfO
	YdZeLP6vRoTcEkx3sxtGDxI6PRgF0Do=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-KaIzL_T-O6CZQ9JMKHkH-w-1; Fri, 06 Nov 2020 20:11:32 -0500
X-MC-Unique: KaIzL_T-O6CZQ9JMKHkH-w-1
Received: by mail-qv1-f70.google.com with SMTP id r11so1776806qvn.1
        for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2020 17:11:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s03eFWh3bvVnssKugy+SfcexCfSnOxFiFxui5ZZE6JM=;
        b=eCHBFn0iN650TG72XnMC/azAUS8rWNsc8+3ulSRNFnCQTbgPbUKGpzbp8gM7FG7/86
         lWI5dQOSGp6kzS4jqOUsanbQMOgP9oMYT1FFBK4/v2B2e6sAupTcnAjyUGsMo5qWaiB6
         fTbjj4tw+x0q4vcY5evRRsdSrkJrG/kWeQeE0ciwJ/5wHBb60NTvbGMymtoI3uR/4F6S
         m0z1jmAKOM0rC/jxRfxOrnFtiu4HTcw7wiWCk6qpXDcOEcjwSwiBlPyR8dozBDsOUkuO
         v9Y7uuAAvi2bt9UioHuFHlZKsXRuD/uCf2RkTZVJW1U7YO9RtFs+su4Dg/6QCxERJCSa
         UPQw==
X-Gm-Message-State: AOAM530QhsOO6OSsZcCL6EtWRtMjGVPy2AXhNtRo5m1B1bCzwswH5LRx
	J3XElSbWinJUup5dnnjm/LN1Y3JgzEDUYNxYQby+H/2G/j3IraJuTKIMRPjbuB8Oq+SrzA32wqD
	8qP4izDKBAfJtBxPGYVlAUCzNdWY=
X-Received: by 2002:ac8:51cd:: with SMTP id d13mr270204qtn.148.1604711491826;
        Fri, 06 Nov 2020 17:11:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxp4oEucNKi98qPC7sJzn96P9bBblqisJwW0aucCPpUta95o5nBu9m7hEOogL969VFDL1oc3Q==
X-Received: by 2002:ac8:51cd:: with SMTP id d13mr270180qtn.148.1604711491516;
        Fri, 06 Nov 2020 17:11:31 -0800 (PST)
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net. [98.239.145.235])
        by smtp.gmail.com with ESMTPSA id q6sm1758584qtq.53.2020.11.06.17.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 17:11:30 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
To: boris.ostrovsky@oracle.com,
	jgross@suse.com,
	sstabellini@kernel.org
Cc: tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	x86@kernel.org,
	hpa@zytor.com,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	dustymabe@redhat.com
Subject: [PATCH v2] x86/xen: don't unbind uninitialized lock_kicker_irq
Date: Fri,  6 Nov 2020 20:11:19 -0500
Message-Id: <20201107011119.631442-1-bmasney@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=bmasney@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

When booting a hyperthreaded system with the kernel parameter
'mitigations=auto,nosmt', the following warning occurs:

    WARNING: CPU: 0 PID: 1 at drivers/xen/events/events_base.c:1112 unbind_from_irqhandler+0x4e/0x60
    ...
    Hardware name: Xen HVM domU, BIOS 4.2.amazon 08/24/2006
    ...
    Call Trace:
     xen_uninit_lock_cpu+0x28/0x62
     xen_hvm_cpu_die+0x21/0x30
     takedown_cpu+0x9c/0xe0
     ? trace_suspend_resume+0x60/0x60
     cpuhp_invoke_callback+0x9a/0x530
     _cpu_up+0x11a/0x130
     cpu_up+0x7e/0xc0
     bringup_nonboot_cpus+0x48/0x50
     smp_init+0x26/0x79
     kernel_init_freeable+0xea/0x229
     ? rest_init+0xaa/0xaa
     kernel_init+0xa/0x106
     ret_from_fork+0x35/0x40

The secondary CPUs are not activated with the nosmt mitigations and only
the primary thread on each CPU core is used. In this situation,
xen_hvm_smp_prepare_cpus(), and more importantly xen_init_lock_cpu(), is
not called, so the lock_kicker_irq is not initialized for the secondary
CPUs. Let's fix this by exiting early in xen_uninit_lock_cpu() if the
irq is not set to avoid the warning from above for each secondary CPU.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Changes since v1:
- Remove duplicate per_cpu() call and pass in irq variable.
- Changed subject from 'x86/xen: fix warning when running with nosmt
  mitigations'
- Shorten code comment

 arch/x86/xen/spinlock.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/x86/xen/spinlock.c b/arch/x86/xen/spinlock.c
index 799f4eba0a62..043c73dfd2c9 100644
--- a/arch/x86/xen/spinlock.c
+++ b/arch/x86/xen/spinlock.c
@@ -93,10 +93,20 @@ void xen_init_lock_cpu(int cpu)
 
 void xen_uninit_lock_cpu(int cpu)
 {
+	int irq;
+
 	if (!xen_pvspin)
 		return;
 
-	unbind_from_irqhandler(per_cpu(lock_kicker_irq, cpu), NULL);
+	/*
+	 * When booting the kernel with 'mitigations=auto,nosmt', the secondary
+	 * CPUs are not activated, and lock_kicker_irq is not initialized.
+	 */
+	irq = per_cpu(lock_kicker_irq, cpu);
+	if (irq == -1)
+		return;
+
+	unbind_from_irqhandler(irq, NULL);
 	per_cpu(lock_kicker_irq, cpu) = -1;
 	kfree(per_cpu(irq_name, cpu));
 	per_cpu(irq_name, cpu) = NULL;
-- 
2.26.2


