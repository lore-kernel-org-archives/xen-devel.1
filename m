Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A97CD8CAA
	for <xen-devel@archiver.kernel.org>; Tue,  9 Jun 2026 11:49:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1332615.1595091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWux9-0000a2-Pt; Tue, 09 Jun 2026 11:49:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1332615.1595091; Tue, 09 Jun 2026 11:49:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWux9-0000Zv-N3; Tue, 09 Jun 2026 11:49:07 +0000
Received: by outflank-mailman (input) for mailman id 1332615;
 Tue, 09 Jun 2026 11:49:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sumit.saxena@broadcom.com>) id 1wWux8-0000YT-Ol
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 11:49:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWux6-004AxN-CI
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 13:49:04 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sumit.saxena@broadcom.com>)
 id 6a27fda3-e002-0a2a0a5209dd-0a2a45029486-30
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 13:49:03 +0200
Received: from [209.85.167.225] (helo=mail-oi1-f225.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sumit.saxena@broadcom.com>)
 id 6a27fdae-af86-0a2a45020019-d155a7e1d5c8-3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 13:49:03 +0200
Received: by mail-oi1-f225.google.com with SMTP id
 5614622812f47-4863eae453eso2416245b6e.1
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 04:49:03 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
 by smtp-relay.gmail.com with ESMTPS id
 586e51a60fabf-440d7b9324fsm1526980fac.1.2026.06.09.04.49.00
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Jun 2026 04:49:02 -0700 (PDT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-36bc54005a7so7346491a91.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 04:49:00 -0700 (PDT)
Received: from sumit_ws.dhcp.broadcom.net ([192.19.234.250])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36f6bf903fasm18898075a91.2.2026.06.09.04.48.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 04:48:57 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=broadcom.com header.i="@broadcom.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781005742; x=1781610542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cij0f7XK3gPTc98cKs5ll/gp5Fj5YlFQkChYuGOVaaM=;
        b=dqMlK5EOEFiXHKoTjWbPS8mjQdfymklRSh13o5W/tkI6oK3KaRVHY7lANMD6eucpqk
         +HRxildKvHU2phtmwFjLsjgInJaZ2hHN8o4ZPBghDCVFZ6vtRUsgrJIHNafIS26aa7Oq
         QxbCeCmqJCBu1k9g/DW1nl6kWrLZ8OB2s80MCSAWgrKBm05rBL1mgQ2TXsl6ie8EUtCe
         OTO3cEVRbkueqZMXpZCZEN5CcSowS7EhqeHsa110nXNusEiGEFx/uQGcmlm+Nv8uuCY+
         p0IaCz2MlYrgwilB2aOlb/0B5VyGG7DyvVbGs2rODLyMr8Q+PxwaRAtydPROh+TQ0er8
         btbw==
X-Forwarded-Encrypted: i=1; AFNElJ8A4uQK33AR5z/m09ziOrWs1loQ9r3uQyTizCzZq6VX/uv36WnfoiTm5y27T77J5OBwIge/D5uAoI0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzqtylW5O22vpzZL/6LtfNEZe+hbWbeAE1qmDHbJXxZA1guZjB8
	mI/lEdDkTM7FdnJASSB49QgYAysQZpFBNJLho9thYuMitQ7NIZttuuqDL13VNQ7lTkpvxYTZyLB
	vwHtrTEcxJhtwptpcDvgxpssaXtB59JhNC/r5JAArGezBDxRtPsMsINaJlYNwCLQO6E+mQo0bsM
	q9H9i9cgqKo30mHe9xtDWXBB6SYUepMiJ212zf/Wt+KnZs+CRLThxSHMdyT9PCL0ZuWInBI+6Fh
	cnI6N1BwlJNqPaGwsNJnQ==
X-Gm-Gg: Acq92OHo70UZWzYryVjTozm/XOum+5ikiLIcwXBtFrgDwukFex9fwT2JF9oNPlnzQWG
	dHA5vqYttLEIKFhILu3UwQkL+E6oCzk7ZQ7iBDskstzoPn5DfOobGW+GkqKJD4bArPwq4sInSOy
	9z5PoTkRMWOIzIlRq6r+Wf1S6bsdI5fdHmK/Gud5KRWHiSHJAxv7wjjbLw0fHx9E19KeKmE+QMg
	qYg4XI9QkvIIGn50v0zc6+UqQ/MlzB0yvYUXMN9v2DAC3aO2dcB1sfCT4ag3fJNjsMUFtO17FI3
	9prS+8c9ByQxkpJ8t5OtrP6LZKBNTAbGj6U9ljYTH6kpg6HUFERSDFySzsW4LRVi9EcYhgbm7st
	DJvG0WMa/4IrDJ88vIBFnBnffuGw2kA2vL0IWyo7yOq9LiIZpnSvrOhe73x3MqPWyt0b+0aqhmx
	Rpsz/zl4iRBqPd/MpptL88gR6278uFKWLgrJP+hK7YGZT8sQaydpUV2Twe8zfArxlIOnslSw==
X-Received: by 2002:a05:6870:d181:b0:41c:20cd:c0b5 with SMTP id 586e51a60fabf-4413d25803fmr9893260fac.6.1781005742058;
        Tue, 09 Jun 2026 04:49:02 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1781005739; x=1781610539; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cij0f7XK3gPTc98cKs5ll/gp5Fj5YlFQkChYuGOVaaM=;
        b=JyLFWVAGXVd9wkrcwkq5Nh0cRx2Ve1JMb4H8a/KkTXez/1W7kmLkyg2dRq/B/kg7k7
         FVTW0uHQs8V38lY3TBZJv4x74MsHOZgtzTc7VO7c7mtMWO8jOBTiXTP/MhnhYE1bp1aZ
         MJn1xMVmpYBmxbrQ9Gdz0M4KxpKsT5BDfahRc=
X-Forwarded-Encrypted: i=1; AFNElJ97nPnlR8ayNHanSpgYQ9ingwEEdPPfMhF6DolVBNxbV/ObWOIBDTsTKxJrXr2okHNVd9xept+LCkM=@lists.xenproject.org
X-Received: by 2002:a17:90b:5787:b0:36b:8824:d7cc with SMTP id 98e67ed59e1d1-370f057a115mr22377741a91.20.1781005739347;
        Tue, 09 Jun 2026 04:48:59 -0700 (PDT)
X-Received: by 2002:a17:90b:5787:b0:36b:8824:d7cc with SMTP id 98e67ed59e1d1-370f057a115mr22377714a91.20.1781005738858;
        Tue, 09 Jun 2026 04:48:58 -0700 (PDT)
From: Sumit Saxena <sumit.saxena@broadcom.com>
To: "Martin K . Petersen" <martin.petersen@oracle.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	linux-scsi@vger.kernel.org,
	linux-block@vger.kernel.org,
	Adam Radford <aradford@gmail.com>,
	Khalid Aziz <khalid@gonehiking.org>,
	Adaptec OEM Raid Solutions <aacraid@microsemi.com>,
	Matthew Wilcox <willy@infradead.org>,
	Hannes Reinecke <hare@suse.com>,
	"Juergen E . Fischer" <fischer@norbit.de>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Finn Thain <fthain@linux-m68k.org>,
	Michael Schmitz <schmitzmic@gmail.com>,
	Anil Gurumurthy <anil.gurumurthy@qlogic.com>,
	Sudarsana Kalluru <sudarsana.kalluru@qlogic.com>,
	Oliver Neukum <oliver@neukum.org>,
	Ali Akcaagac <aliakc@web.de>,
	Jamie Lenehan <lenehan@twibble.org>,
	Ram Vegesna <ram.vegesna@broadcom.com>,
	target-devel@vger.kernel.org,
	Bradley Grove <linuxdrivers@attotech.com>,
	Satish Kharat <satishkh@cisco.com>,
	Sesidhar Baddela <sebaddel@cisco.com>,
	Karan Tilak Kumar <kartilak@cisco.com>,
	Yihang Li <liyihang9@h-partners.com>,
	Don Brace <don.brace@microchip.com>,
	storagedev@microchip.com,
	HighPoint Linux Team <linux@highpoint-tech.com>,
	Tyrel Datwyler <tyreld@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	Brian King <brking@us.ibm.com>,
	Lee Duncan <lduncan@suse.com>,
	Chris Leech <cleech@redhat.com>,
	Mike Christie <michael.christie@oracle.com>,
	open-iscsi@googlegroups.com,
	Justin Tee <justin.tee@broadcom.com>,
	Paul Ely <paul.ely@broadcom.com>,
	Kashyap Desai <kashyap.desai@broadcom.com>,
	Shivasharan S <shivasharan.srikanteshwara@broadcom.com>,
	Chandrakanth Patil <chandrakanth.patil@broadcom.com>,
	megaraidlinux.pdl@broadcom.com,
	Sathya Prakash Veerichetty <sathya.prakash@broadcom.com>,
	Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
	mpi3mr-linuxdrv.pdl@broadcom.com,
	Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
	Ranjan Kumar <ranjan.kumar@broadcom.com>,
	MPT-FusionLinux.pdl@broadcom.com,
	Daniel Palmer <daniel@thingy.jp>,
	GOTO Masanori <gotom@debian.or.jp>,
	YOKOTA Hiroshi <yokota@netlab.is.tsukuba.ac.jp>,
	Jack Wang <jinpu.wang@cloud.ionos.com>,
	Geoff Levand <geoff@infradead.org>,
	Michael Reed <mdr@sgi.com>,
	Nilesh Javali <njavali@marvell.com>,
	GR-QLogic-Storage-Upstream@marvell.com,
	Narsimhulu Musini <nmusini@cisco.com>,
	"K . Y . Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>,
	linux-hyperv@vger.kernel.org,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Eugenio Perez <eperezma@redhat.com>,
	virtualization@lists.linux.dev,
	Vishal Bhakta <vishal.bhakta@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org,
	James Rizzo <james.rizzo@broadcom.com>,
	Sumit Saxena <sumit.saxena@broadcom.com>
Subject: [PATCH v3 1/4] scsi: scan: allocate sdev and starget on the NUMA node of the host adapter
Date: Tue,  9 Jun 2026 17:48:00 +0530
Message-ID: <20260609121806.2121755-2-sumit.saxena@broadcom.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260609121806.2121755-1-sumit.saxena@broadcom.com>
References: <20260609121806.2121755-1-sumit.saxena@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-purgate-ID: tlsNG-720697/1781005743-83F66161-7B02C711/0/0
X-purgate-type: clean
X-purgate-size: 1893

From: James Rizzo <james.rizzo@broadcom.com>

When a host adapter is attached to a specific NUMA node, allocating
scsi_device and scsi_target via kzalloc() may place them on a remote
node.  All hot-path I/O accesses to these structures then cross the NUMA
interconnect, adding latency and consuming inter-node bandwidth.

Use kzalloc_node() with dev_to_node(shost->dma_dev) so allocations land
on the same node as the HBA, reducing cross-node traffic and improving
I/O performance on NUMA systems.

Signed-off-by: James Rizzo <james.rizzo@broadcom.com>
Signed-off-by: Sumit Saxena <sumit.saxena@broadcom.com>
---
 drivers/scsi/scsi_scan.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/scsi/scsi_scan.c b/drivers/scsi/scsi_scan.c
index e27da038603a..121a14d5fdb8 100644
--- a/drivers/scsi/scsi_scan.c
+++ b/drivers/scsi/scsi_scan.c
@@ -34,6 +34,7 @@
 #include <linux/kthread.h>
 #include <linux/spinlock.h>
 #include <linux/async.h>
+#include <linux/topology.h>
 #include <linux/slab.h>
 #include <linux/unaligned.h>
 
@@ -287,8 +288,8 @@ static struct scsi_device *scsi_alloc_sdev(struct scsi_target *starget,
 	struct Scsi_Host *shost = dev_to_shost(starget->dev.parent);
 	struct queue_limits lim;
 
-	sdev = kzalloc(sizeof(*sdev) + shost->transportt->device_size,
-		       GFP_KERNEL);
+	sdev = kzalloc_node(sizeof(*sdev) + shost->transportt->device_size,
+		       GFP_KERNEL, dev_to_node(shost->dma_dev));
 	if (!sdev)
 		goto out;
 
@@ -502,7 +503,7 @@ static struct scsi_target *scsi_alloc_target(struct device *parent,
 	struct scsi_target *found_target;
 	int error, ref_got;
 
-	starget = kzalloc(size, GFP_KERNEL);
+	starget = kzalloc_node(size, GFP_KERNEL, dev_to_node(shost->dma_dev));
 	if (!starget) {
 		printk(KERN_ERR "%s: allocation failure\n", __func__);
 		return NULL;
-- 
2.43.7


