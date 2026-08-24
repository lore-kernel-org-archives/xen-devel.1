Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B60CC61CE3
	for <xen-devel@archiver.kernel.org>; Mon, 24 Aug 2026 01:20:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1398607.1634816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyJMT-00009d-4J; Mon, 24 Aug 2026 01:20:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1398607.1634816; Mon, 24 Aug 2026 01:20:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyJMT-00009Q-14; Mon, 24 Aug 2026 01:20:29 +0000
Received: by outflank-mailman (input) for mailman id 1398607;
 Mon, 24 Aug 2026 01:20:27 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dongli.zhang@oracle.com>) id 1wyJMR-00005x-Oz
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2026 01:20:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wyJMR-00AZzb-5z
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2026 03:20:27 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dongli.zhang@oracle.com>)
 id 6a8b9c28-e002-0a2a0a5209dd-0a2a45068ddc-28
 for <xen-devel@lists.xenproject.org>; Mon, 24 Aug 2026 03:20:27 +0200
Received: from [205.220.177.32] (helo=mx0b-00069f02.pphosted.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dongli.zhang@oracle.com>)
 id 6a8b9c59-195a-0a2a45060019-cddcb12089c8-3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Aug 2026 03:20:26 +0200
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67O0Ap2W4093319; Mon, 24 Aug 2026 01:20:14 GMT
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4g73csscpa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Aug 2026 01:20:13 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7)
 with ESMTP id 67O1FUME013326; Mon, 24 Aug 2026 01:20:13 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 4g84kh6xva-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Aug 2026 01:20:13 +0000 (GMT)
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67O1JmW7024683;
 Mon, 24 Aug 2026 01:20:12 GMT
Received: from localhost.localdomain (ca-dev80.us.oracle.com [10.211.9.80])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 4g84kh6xgy-9; Mon, 24 Aug 2026 01:20:12 +0000 (GMT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=corp-2025-04-25 header.d=oracle.com header.i="@oracle.com" header.h="Cc:Content-Transfer-Encoding:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=XvAUB
	QoXJbUB6s9aMnBe/fHC44+ByRRCLPqOgVKeuAU=; b=Y0MpiKVRey6ei+1/34zOS
	a54gCEOHbdPQ0e9QzNvN7YHTt/eLHnxWj7sjJvNF2TJRlfQf/Tna/zXYCYPQGOsu
	o1CqeNiGYjSJMGBaArYHjqmUBEm3ANVefTsbiI9iExpTiDy/O57OlmKoqKzwWLgl
	BN/TsUqm5hUUNy3+glZvAXk4ZnOWP3fgDGi5nblbnFlkDQlaGIx3LM/GdVx2zZkb
	Co+49SOAYPcwz8wPGYiWr6ZlHsWu8O+ahTvDh2C4si7U4DiEtj/oYMNSP23zn2rq
	wz/6oGnKTX9wcZ2NRNifFzhtT4lFeyJLzixh7m7BRIqP1rK0HXHDCWBFqU/l7k+E
	Q==
From: Dongli Zhang <dongli.zhang@oracle.com>
To: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
        xen-devel@lists.xenproject.org
Cc: dave@treblig.org, mst@redhat.com, imammedo@redhat.com, anisinha@redhat.com,
        philmd@mailo.com, aurelien@aurel32.net, mjrosato@linux.ibm.com,
        alifm@linux.ibm.com, farman@linux.ibm.com,
        richard.henderson@linaro.org, iii@linux.ibm.com, david@kernel.org,
        pasic@linux.ibm.com, borntraeger@linux.ibm.com, cohuck@redhat.com,
        alex@shazbot.org, clg@redhat.com, akrowiak@linux.ibm.com,
        jjherne@linux.ibm.com, sstabellini@kernel.org, anthony@xenproject.org,
        edgar.iglesias@gmail.com, pbonzini@redhat.com, berrange@redhat.com,
        eblake@redhat.com, armbru@redhat.com, joe.jin@oracle.com
Subject: [PATCH 8/8] hw/pci/pcie: Support forced PCIe native unplug
Date: Sun, 23 Aug 2026 18:13:38 -0700
Message-ID: <20260824011420.752806-9-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260824011420.752806-1-dongli.zhang@oracle.com>
References: <20260824011420.752806-1-dongli.zhang@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_01,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 mlxlogscore=999 spamscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2606160000 definitions=main-2608240009
X-Authority-Analysis: v=2.4 cv=D+h37PRj c=1 sm=1 tr=0 ts=6a8b9c4e b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=3I1J8UUJPc9JN9BFgKH3:22 a=yPCof4ZbAAAA:8 a=IQMDJlptZtJ-cjhD5E0A:9
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:13521
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDAwOSBTYWx0ZWRfX5rG4lXUBNxHq
 T+o4qRB20FbSQ3VkEDo0kDPEQGcipZoPjbrAhux1NKndowjuN2sBil13UbyffaoxT7I9OStPXoi
 oKpY3xlRnw7DYH40382c7wXgk/SqNQDdbi87Fh/QPyJY6loUC8Sr
X-Proofpoint-ORIG-GUID: 9fPHksSYfaSWwaY-VGY-i5dZnZuVka1r
X-Proofpoint-GUID: 9fPHksSYfaSWwaY-VGY-i5dZnZuVka1r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDAwOSBTYWx0ZWRfX99x47b0T2hs4
 lWe2QX2cJi8aWQ+T2BCIwD9hyY9fQuc6qYrHdLK7e21Lrxi/eqwyM9CGGMUG2mL/oGHCX1eDZ6a
 0q4EfeIACp+Nma3vsITTIYdWUcLayceHZoNmgJNLX3qktn6sUQoihHoxqEVb/vM2Dv3us7m1XP6
 WBcSb+U/E9Qem2YaUlL8mQz23is7gLawKUVDH1DquPuoaEkXetx87y9DBQntyDfAYXxZsUDEKyY
 wQ74G0acFOp8+UdjmyJq2zAp9IXCubuw4oZuhqGITPuGdvP0eF6h4GdaSmHiO1kWYseA3LjWbLo
 OKoqIaYi0A6QMS0ZHvJyxoacdJbz8K+qdnUPmaZl5eWRuruUjGELJE5J+3jTvgZqZgwOGmKO8i6
 PrltezR6ziKJrdjqpFv48rH8574fr0utBHzDEF91JkSbp6wQUx0FagpotuTD2qPdgewWfVgxjrH
 KxOLfVz0YUlGY1MOH/1+bfXrMHFYzPuk52BZaBnk=
X-purgate-ID: tlsNG-16d1c6/1787534427-FDA0C77B-B16D083D/0/0
X-purgate-type: clean
X-purgate-size: 2937

Support forced PCIe native unplug by implementing force_unplug method.

The forced path completes the pending slot unplug immediately through the
existing PCIe slot removal helper, clears the attention button pressed
status bit, and notifies the hotplug event.

Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
---
 hw/pci/pcie.c         | 20 ++++++++++++++++++++
 hw/pci/pcie_port.c    |  1 +
 include/hw/pci/pcie.h |  2 ++
 3 files changed, 23 insertions(+)

diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index 4622c75e48..bd967ca73b 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -666,6 +666,26 @@ void pcie_cap_slot_unplug_request_cb(HotplugHandler *hotplug_dev,
     pcie_cap_slot_push_attention_button(hotplug_pdev);
 }
 
+void pcie_cap_slot_force_unplug_cb(HotplugHandler *hotplug_dev,
+                                   DeviceState *dev, Error **errp)
+{
+    PCIDevice *hotplug_pdev = PCI_DEVICE(hotplug_dev);
+    uint8_t *exp_cap = hotplug_pdev->config + hotplug_pdev->exp.exp_cap;
+    uint32_t sltcap = pci_get_word(exp_cap + PCI_EXP_SLTCAP);
+
+    if ((sltcap & PCI_EXP_SLTCAP_HPC) == 0) {
+        error_setg(errp, "Hot-unplug failed: "
+                   "unsupported by the port device '%s'",
+                   DEVICE(hotplug_pdev)->id);
+        return;
+    }
+
+    pcie_cap_slot_do_unplug(hotplug_pdev);
+    pci_word_test_and_clear_mask(exp_cap + PCI_EXP_SLTSTA,
+                                 PCI_EXP_SLTSTA_ABP);
+    hotplug_event_notify(hotplug_pdev);
+}
+
 /* pci express slot for pci express root/downstream port
    PCI express capability slot registers */
 void pcie_cap_slot_init(PCIDevice *dev, PCIESlot *s)
diff --git a/hw/pci/pcie_port.c b/hw/pci/pcie_port.c
index dbb6032160..4806c8289b 100644
--- a/hw/pci/pcie_port.c
+++ b/hw/pci/pcie_port.c
@@ -221,6 +221,7 @@ static void pcie_slot_class_init(ObjectClass *oc, const void *data)
     hc->plug = pcie_cap_slot_plug_cb;
     hc->unplug = pcie_cap_slot_unplug_cb;
     hc->unplug_request = pcie_cap_slot_unplug_request_cb;
+    hc->force_unplug = pcie_cap_slot_force_unplug_cb;
     hc->is_hotpluggable_bus = pcie_slot_is_hotpluggable_bus;
 }
 
diff --git a/include/hw/pci/pcie.h b/include/hw/pci/pcie.h
index 71ba94874b..08c6c81f34 100644
--- a/include/hw/pci/pcie.h
+++ b/include/hw/pci/pcie.h
@@ -154,6 +154,8 @@ void pcie_cap_slot_unplug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
                              Error **errp);
 void pcie_cap_slot_unplug_request_cb(HotplugHandler *hotplug_dev,
                                      DeviceState *dev, Error **errp);
+void pcie_cap_slot_force_unplug_cb(HotplugHandler *hotplug_dev,
+                                   DeviceState *dev, Error **errp);
 
 void pcie_pasid_common_init(PCIDevice *dev, uint16_t offset,
                             uint8_t pasid_width, bool exec_perm, bool priv_mod);
-- 
2.43.5


