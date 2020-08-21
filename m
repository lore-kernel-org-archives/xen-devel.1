Return-Path: <SRS0=m7Uf=B7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50961C433F2
	for <xen-devel@archiver.kernel.org>; Fri, 21 Aug 2020 02:17:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C56B208E4
	for <xen-devel@archiver.kernel.org>; Fri, 21 Aug 2020 02:17:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="q7dSxIfa";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="QYOx4xUy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C56B208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8wcH-0002Sa-6I; Fri, 21 Aug 2020 02:17:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z7lF=B7=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1k8wcG-0002Bb-4p
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2020 02:17:16 +0000
X-Inumbo-ID: 82896dfd-5336-4959-8093-031b1ec68c5a
Received: from galois.linutronix.de (unknown [193.142.43.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 82896dfd-5336-4959-8093-031b1ec68c5a;
 Fri, 21 Aug 2020 02:16:59 +0000 (UTC)
Message-Id: <20200821002946.887237419@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1597976218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=GYsCif/3llmuLBvpYPtjuTHhsKUK5MCMDeW2t2MJscU=;
 b=q7dSxIfa2NAL9KD2teMyDV01SxnyZKzF6/JmWFSxrt4bg5x1doERDgaXnVj7u4mOEdz45i
 s8eTgKutbpA8zbvLN5XbMOhfEhT83rB5QSmk3Nf0wJfsbCBE7O+H8RbvjPFoHLYvaj3PI5
 0Ir3gWIVXdw7KlQi2QzmUFBvtwM6SWdulp/PPE8Spn9KjhcUnevfsg+y1085hUP5RhdjNK
 F3NUTNp6L/aTcVNHc6YLFBxk5XAo5Pz16xMSpAOmFrmGxGLLpFdTuB0EtA14DMy8whOStx
 rsDXjkHsk66HqrWp+bjMVgu9KVh7sP5kmRE4Up2Fo/rMlXBGcFLN0TtbKmh7Xw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1597976218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=GYsCif/3llmuLBvpYPtjuTHhsKUK5MCMDeW2t2MJscU=;
 b=QYOx4xUygE/UcllLug+eYgjWxrxLwQK7B3c3lbd2KZJMEHg+1hEG377sd9w4Vwj9eR08qW
 BT1NC9ypZFV92bAg==
Date: Fri, 21 Aug 2020 02:24:40 +0200
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org, Joerg Roedel <joro@8bytes.org>,
 iommu@lists.linux-foundation.org, linux-hyperv@vger.kernel.org,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Jon Derrick <jonathan.derrick@intel.com>,
 Lu Baolu <baolu.lu@linux.intel.com>, Wei Liu <wei.liu@kernel.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Steve Wahl <steve.wahl@hpe.com>, Dimitri Sivanich <sivanich@hpe.com>,
 Russ Anderson <rja@hpe.com>, linux-pci@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Jonathan Derrick <jonathan.derrick@intel.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Megha Dey <megha.dey@intel.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Dave Jiang <dave.jiang@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jacob Pan <jacob.jun.pan@intel.com>, Baolu Lu <baolu.lu@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Dan Williams <dan.j.williams@intel.com>
Subject: [patch RFC 16/38] x86/irq: Move apic_post_init() invocation to one
 place
References: <20200821002424.119492231@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline; filename="x86-irq--Move-apic_post_init"
Content-transfer-encoding: 8-bit
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

No point to call it from both 32bit and 64bit implementations of
default_setup_apic_routing(). Move it to the caller.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/x86/kernel/apic/apic.c     |    3 +++
 arch/x86/kernel/apic/probe_32.c |    3 ---
 arch/x86/kernel/apic/probe_64.c |    3 ---
 3 files changed, 3 insertions(+), 6 deletions(-)

--- a/arch/x86/kernel/apic/apic.c
+++ b/arch/x86/kernel/apic/apic.c
@@ -1429,6 +1429,9 @@ void __init apic_intr_mode_init(void)
 		break;
 	}
 
+	if (x86_platform.apic_post_init)
+		x86_platform.apic_post_init();
+
 	apic_bsp_setup(upmode);
 }
 
--- a/arch/x86/kernel/apic/probe_32.c
+++ b/arch/x86/kernel/apic/probe_32.c
@@ -170,9 +170,6 @@ void __init default_setup_apic_routing(v
 
 	if (apic->setup_apic_routing)
 		apic->setup_apic_routing();
-
-	if (x86_platform.apic_post_init)
-		x86_platform.apic_post_init();
 }
 
 void __init generic_apic_probe(void)
--- a/arch/x86/kernel/apic/probe_64.c
+++ b/arch/x86/kernel/apic/probe_64.c
@@ -32,9 +32,6 @@ void __init default_setup_apic_routing(v
 			break;
 		}
 	}
-
-	if (x86_platform.apic_post_init)
-		x86_platform.apic_post_init();
 }
 
 int __init default_acpi_madt_oem_check(char *oem_id, char *oem_table_id)


