Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E753CC5DF8C
	for <xen-devel@archiver.kernel.org>; Mon, 24 Aug 2026 01:20:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1398599.1634785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyJMK-0007U3-5d; Mon, 24 Aug 2026 01:20:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1398599.1634785; Mon, 24 Aug 2026 01:20:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyJMK-0007Sj-12; Mon, 24 Aug 2026 01:20:20 +0000
Received: by outflank-mailman (input) for mailman id 1398599;
 Mon, 24 Aug 2026 01:20:18 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dongli.zhang@oracle.com>) id 1wyJMI-00071S-5E
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2026 01:20:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wyJMH-00AZzb-Ia
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2026 03:20:17 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dongli.zhang@oracle.com>)
 id 6a8b9c28-e002-0a2a0a5209dd-0a2a45068ddc-18
 for <xen-devel@lists.xenproject.org>; Mon, 24 Aug 2026 03:20:17 +0200
Received: from [205.220.177.32] (helo=mx0b-00069f02.pphosted.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dongli.zhang@oracle.com>)
 id 6a8b9c50-195a-0a2a45060019-cddcb120582a-3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Aug 2026 03:20:17 +0200
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67O00kWL3992865; Mon, 24 Aug 2026 01:20:05 GMT
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4g726bhdp9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Aug 2026 01:20:04 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7)
 with ESMTP id 67O1FURi013245; Mon, 24 Aug 2026 01:20:04 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 4g84kh6xq4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Aug 2026 01:20:04 +0000 (GMT)
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67O1JmW1024683;
 Mon, 24 Aug 2026 01:20:03 GMT
Received: from localhost.localdomain (ca-dev80.us.oracle.com [10.211.9.80])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 4g84kh6xgy-6; Mon, 24 Aug 2026 01:20:03 +0000 (GMT)
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
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=ZkCph
	0zQMEceV1V18yZjC3gcjw4ROxQqcgj3PoAbDGw=; b=K+ppLH/PCrj/wbA/jzZyt
	bdWHWQsvBzJP3uHHw0XVLHrTgqphOE8xm6sv4c059cmQtpVO+0EohzFiC2r2t2wJ
	gbK72cj5QYQpd4zlR3Pj5JlySk2DNqIxDPow3OPvB5cyzuuO2eJCNc917BuBXFbE
	B1Hf1v3SmNbum+TIuj2ohgbbVcc5dEPwqwSFc6Bud1ubjYj0CDPxUqXZuEjuKmUS
	jmw1wUjZVY9yejj23QxQERzBShuELPBA12M1EM/r1y6o/lOa4tz4r1wUGxIU44Wx
	0MmIrv1Li2sqU2zPBS71UGJi9LiBxcq0UyzBAOGjgXb2mK5kDV477Q24t0TpV3S5
	g==
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
Subject: [PATCH 5/8] hw/acpi/piix4: Support forced PCI unplug
Date: Sun, 23 Aug 2026 18:13:35 -0700
Message-ID: <20260824011420.752806-6-dongli.zhang@oracle.com>
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
X-Authority-Analysis: v=2.4 cv=Q6niJY2a c=1 sm=1 tr=0 ts=6a8b9c44 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=x4eqshVgHu-cdnggieHk:22 a=yPCof4ZbAAAA:8 a=sVUD1VjQnF4y5snLtUwA:9
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:13521
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDAwOSBTYWx0ZWRfXxvMG/AodywxN
 jCyivwTyKNJb7pSvrie6I6RuCokvMF818rlPF/8bsoT0lCdzDmVzD4+NE+ApH2tNNrMR29QI5vH
 anCSfJXwMSn8z9g4yRkYBLJhEllboYQdR0mYgvtnTOI2tygxcVXlp2gXMcNjY5bdMTVdVy3XRpy
 laFF9tvkH1QdRK0yFgl/ZdEyTF158dwT7d72qSHbJhdpZhUKFap93RJxyPEeEwVvBtD2bExAJc3
 A7Kx3mGRPcsDclRFwoGTz+j1hA6geSYW8y/l98FSUO1P4W9EQc33VoswjNARv9DLmJbxvOXNwMG
 JD3psO7dHlYK+SouXuCgwMhr9MeH2LxvI6+LOvBTjJZwc/RT3Gx/aw9pHyRj+Pi1DfUMQzPLjRr
 F+54t1AGpMLhGcirKbnldfuTeZLRSmF/vvsrA+AycOv/aNGvPYM537nGfrH7CS7qtDhHT+77DU5
 YJtx4JTtE1XpJo83Aw2HghZBAnRKht72ekQZFnFs=
X-Proofpoint-GUID: BQ11WiPJKvoDJTnITlj-K1M2Dpi6kofY
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDAwOSBTYWx0ZWRfX7PdpZXwEuZUR
 Kgpvj5Y7N7TTyuKSMp5OJlRcXWjHfLjfn7glgHYeRaDpIakhtEpRIbV+XwtwlegXouqk0gUb+/J
 7oNzYP0rhwchNLwIlmNs4M0BGlJHxMf85/XFZ/BF0V0dvNDxdY2C
X-Proofpoint-ORIG-GUID: BQ11WiPJKvoDJTnITlj-K1M2Dpi6kofY
X-purgate-ID: tlsNG-16d1c6/1787534417-1ECC577B-B3BCA6E3/0/0
X-purgate-type: clean
X-purgate-size: 1666

Support forced PCI unplug for PIIX4. This enables forced removal for ACPI
PCI hotplug on i440fx machines while rejecting non-PCI devices.

Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
---
 hw/acpi/piix4.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 9b7f50c7af..7cfdcb7935 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -383,6 +383,20 @@ static void piix4_device_unplug_cb(HotplugHandler *hotplug_dev,
     }
 }
 
+static void piix4_device_force_unplug_cb(HotplugHandler *hotplug_dev,
+                                         DeviceState *dev, Error **errp)
+{
+    PIIX4PMState *s = PIIX4_PM(hotplug_dev);
+
+    if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
+        acpi_pcihp_device_force_unplug_cb(hotplug_dev, &s->acpi_pci_hotplug,
+                                          dev, errp);
+    } else {
+        error_setg(errp, "acpi: forced device unplug for not supported device"
+                   " type: %s", object_get_typename(OBJECT(dev)));
+    }
+}
+
 static bool piix4_is_hotpluggable_bus(HotplugHandler *hotplug_dev,
                                       BusState *bus)
 {
@@ -604,6 +618,7 @@ static void piix4_pm_class_init(ObjectClass *klass, const void *data)
     hc->plug = piix4_device_plug_cb;
     hc->unplug_request = piix4_device_unplug_request_cb;
     hc->unplug = piix4_device_unplug_cb;
+    hc->force_unplug = piix4_device_force_unplug_cb;
     hc->is_hotpluggable_bus = piix4_is_hotpluggable_bus;
     adevc->ospm_status = piix4_ospm_status;
     adevc->send_event = piix4_send_gpe;
-- 
2.43.5


