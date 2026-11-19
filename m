Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961B5606A325
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 05:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qQwNpQSC
Received: from list by lists.xenproject.org with outflank-mailman.1495384.1694503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTv8c-0002LO-Iw; Thu, 19 Nov 2026 05:56:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1495384.1694503; Thu, 19 Nov 2026 05:56:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTv8c-0002LH-FD; Thu, 19 Nov 2026 05:56:50 +0000
Received: by outflank-mailman (input) for mailman id 1495384;
 Thu, 19 Nov 2026 01:11:54 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <lcy8047@gmail.com>) id 1xTqgs-0000kQ-IS
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 01:11:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTqgr-00312s-Ux
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 02:11:53 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <lcy8047@gmail.com>)
 id 6afe4cb2-2eae-0a2a0a5409dd-0a2a450aedd6-28
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 02:11:53 +0100
Received: from [209.85.222.173] (helo=mail-qk1-f173.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <lcy8047@gmail.com>)
 id 6afe4cd8-f2d2-0a2a450a0019-d155deadd9bb-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 02:11:53 +0100
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-93f269e335eso201499785a.3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 17:11:53 -0800 (PST)
Received: from linux.. ([8.34.174.240]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-92114d28215sm35809866d6.16.2026.11.18.17.11.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2026 17:11:51 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795050712; x=1795655512; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P6BTWEWXY/BTGnn2IlV1PnrmMbfZ4BbNEeQU2kMUSc0=;
        b=qQwNpQSC46iIyAs8+JxShvKUOzvqY5vW003otJrxsEBZqGvwahLpnC1eHl/UWoVOtJ
         sLHdnYNHRrt65TuZkGagwwgIfmQW+wj7GWvFKADlDhYinjAJBDTg++Pz9WbwKztLa3qi
         R6gcDfUJHghNidUjM+21uYnrfXdwAn7If1JwccfcAoeRLtc5ehlNyvysQDt/k+/cvgU7
         je3mrXcEMoNwZpDPfrxApj4/2oFHjR/XPYXdEfFwziwTSWt1g4n/BFCECWkV7sqbTtno
         zDJYHPETls5HMGV7YJowGOxSJDx5vzKxF4guSxI6F6+BkSkcd5FNJVIG/3dmUQXP4tW4
         LNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795050712; x=1795655512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P6BTWEWXY/BTGnn2IlV1PnrmMbfZ4BbNEeQU2kMUSc0=;
        b=OLMq4Vw5i4LA7uLIieeW0i1kjvyhDDQLDd6UA+EIqLPv0KREhp9iBh4q1ncCvAoqZZ
         wtE/I8OLwEmlDYjhoUTtYatmOYYKufqBZh2y4IDqbERDIhOBWx8bbec+CR7VeaE3/TPY
         OU6Sl59czeCLb9FlDm6/bumQ3XrpfaXsn8Rn2pk3Poi4nbc5avB3drr/NgbClqkcvBrP
         e34nQsf+N42kmqkwLXrFkyOPb7Tv7yzO6790U7yxfrlwN6v0xBbMba9YvAl+etAZh8Bp
         /sXuS4sHagtJ0af46uH8z4oYxKTjQEa0uapUrJHXz2Sq3+4rUyvPbLsIEL23OWxXK4kt
         aU2g==
X-Forwarded-Encrypted: i=1; AL+hErE8S60lkZkyOesF0UY9vZnkdbnNRwcUT7l1nPFY1Ggyu32zWuLCViD/CBDQ1mpDJSoWItS/Z96EPtA=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+XMcR2B9OtXD9dKOB5Dcqec7t0vcMH2Hf4iTiimt4HYlhbEVK6
	J9WUqxQjHczuI7jnmr8S3NQlen4Vl8OrjCMbmUAagBY1jvhPl1RiapK6X+pP5ph7
X-Gm-Gg: AYBFou0+Dezbp862cauYTaRpA5cecPi5rv3SW13Ciu4FVu/4goWzNzGq3gBm4pQbazE
	1DE/KdOGemiQ7YrSYczgMPRgJfANW7trCcBMiZquACGBJZABwA06kkQEBsA/fYLoebPaFK5IcbP
	ymu4R8lS0T3MZ5JPhUmRAtdZ1NF0g3C+82v+lUcr1fUKKAKheJV6kL8VDe4bdxuZ3TsjZE7CBz/
	onNsrYxfjnax+RMG/1IoYtx98SPZaDMeWmDFCIWqnLp8eNaPyI//vCBJRWCc0CPdlNTscd6c/QE
	XZOwQWJqBcm85/AgLgyjwVTVX8Xh6tPdFzZzQRZJGQtr/3rrO+eGfbDOO/t0+Fj4r5olostaukU
	9LsvelMkb/CXSNj5FNaZX2eG84zh7ig7vXnj2cOBegYy8bBFe2PaX+pvFW8/Cij/Lg3AxbrplC5
	aq2FxLBZS6XfcxtKf3k41cMqQ4djrLfsCm28gMFFXT41LM2spqMdUQHyQJ4H7B00dExDEld89HN
	eHoQZQDc8TVMBeFkg7tBQwpicZDDiOJQdTk8sIFCCovX37js3jGe/DHvSKz/gSt22GpaCW4Hhtq
	hFZakWFUs1wkEnNah6P/wWy50ZLPkI3V2qniUzUZzReOvtPAbvfJQ3OlPCB9ChdNUTZOB1yAs/R
	n
X-Received: by 2002:a05:620a:1d0b:b0:945:d148:657a with SMTP id af79cd13be357-9499957e77dmr772314685a.24.1795050712252;
        Wed, 18 Nov 2026 17:11:52 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH] xen/virtio: Fix use-after-free of grant DMA data after rebind
Date: Wed, 18 Nov 2026 20:11:49 -0500
Message-ID: <20261119011149.534095-1-lcy8047@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1795050713-4ACDBCFC-007A6A1D/0/0
X-purgate-type: clean
X-purgate-size: 1870
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When the device is unbound, devres frees its grant DMA data but leaves
the entry in xen_grant_dma_devices. On rebind, the remaining entry
causes xen_grant_setup_dma_ops() to skip setup. Since x86 retains
dev->dma_ops across unbind, subsequent DMA operations access the freed
data.

Register a devres action to erase the entry before freeing the data.

Fixes: 61367688f1fb ("xen/virtio: enable grant based virtio on x86")
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
Found with a static analysis tool we are developing.

Tested in QEMU with KVM Xen HVM emulation (xen-version=0x4000a) and
CONFIG_XEN_VIRTIO_FORCE_GRANT=y, using a virtio-keyboard-pci device with
iommu_platform=on. Unbinding and rebinding virtio-pci through sysfs
triggers a KASAN slab-use-after-free in xen_grant_dma_alloc() before
this patch and no report after it.

 drivers/xen/grant-dma-ops.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
index 5fcafa4c344f..784413e6d282 100644
--- a/drivers/xen/grant-dma-ops.c
+++ b/drivers/xen/grant-dma-ops.c
@@ -66,6 +66,15 @@ static int store_xen_grant_dma_data(struct device *dev,
 	return ret;
 }
 
+static void remove_xen_grant_dma_data(void *dev)
+{
+	unsigned long flags;
+
+	xa_lock_irqsave(&xen_grant_dma_devices, flags);
+	__xa_erase(&xen_grant_dma_devices, (unsigned long)dev);
+	xa_unlock_irqrestore(&xen_grant_dma_devices, flags);
+}
+
 /*
  * DMA ops for Xen frontends (e.g. virtio).
  *
@@ -396,6 +405,9 @@ static void xen_grant_setup_dma_ops(struct device *dev, domid_t backend_domid)
 		goto err;
 	}
 
+	if (devm_add_action_or_reset(dev, remove_xen_grant_dma_data, dev))
+		goto err;
+
 	dev->dma_ops = &xen_grant_dma_ops;
 
 	return;

base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.43.0


