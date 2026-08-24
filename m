Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF49C5DF9C
	for <xen-devel@archiver.kernel.org>; Mon, 24 Aug 2026 01:20:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1398602.1634808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyJMO-0008Dp-Qq; Mon, 24 Aug 2026 01:20:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1398602.1634808; Mon, 24 Aug 2026 01:20:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyJMO-0008Di-Ny; Mon, 24 Aug 2026 01:20:24 +0000
Received: by outflank-mailman (input) for mailman id 1398602;
 Mon, 24 Aug 2026 01:20:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dongli.zhang@oracle.com>) id 1wyJMN-00089r-2F
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2026 01:20:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wyJMM-00Cy13-FS
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2026 03:20:22 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dongli.zhang@oracle.com>)
 id 6a8b9bbf-2eae-0a2a0a5409dd-0a2a4509d37a-48
 for <xen-devel@lists.xenproject.org>; Mon, 24 Aug 2026 03:20:22 +0200
Received: from [205.220.177.32] (helo=mx0b-00069f02.pphosted.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dongli.zhang@oracle.com>)
 id 6a8b9c55-be1a-0a2a45090019-cddcb120710e-3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Aug 2026 03:20:22 +0200
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67O002f64065363; Mon, 24 Aug 2026 01:20:11 GMT
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4g72j1sdhu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Aug 2026 01:20:10 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7)
 with ESMTP id 67O1FUjg013312; Mon, 24 Aug 2026 01:20:10 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 4g84kh6xtw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Aug 2026 01:20:10 +0000 (GMT)
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67O1JmW5024683;
 Mon, 24 Aug 2026 01:20:09 GMT
Received: from localhost.localdomain (ca-dev80.us.oracle.com [10.211.9.80])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 4g84kh6xgy-8; Mon, 24 Aug 2026 01:20:09 +0000 (GMT)
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
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=38jU8
	IIonVi12pQd4z21bPmb4kb4ECiPZZIFqO5pnuc=; b=pScvHeuAnFaWyC2fLr0tu
	rnK+ZjY9niD/EvSZTO3T2+YUhWSLITVC6hZ3IC6XAGzbPxBKySQP8/a8eRvtqZF9
	1JdLkZzyny/rLLEIp2+c9aTpm8b0pyIQNLz2eAuKfzVDOxUzqckjskwt0oQkncjW
	y5zLH3XGJBSYbND6PlqS9BIo7FqRWwvTcHtqfJGYuFAxf1Rb4jzA8QjzDpMSG6Jt
	XuvoVb4+LoF9fpJIFSQHMsM0NZnpMWmTV59v1T3HHRsSvF/4EoaFs87U9QG9ArDg
	vGcpr8PgE+njSrGm6b4jSqmsvTpqxPcB7Q33ghtktr47lq3D5c4IRmeKh6G1+mEp
	w==
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
Subject: [PATCH 7/8] hw/acpi/ged: Support forced PCI unplug
Date: Sun, 23 Aug 2026 18:13:37 -0700
Message-ID: <20260824011420.752806-8-dongli.zhang@oracle.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDAwOSBTYWx0ZWRfX24Chf8itq7kY
 c0iNGcrg2LAQYuKnGGGof6DEc5T0g8uxuU5MknKuRYVbahwnf5i/OhEpRLgeAM7Dt9fvMLlU/Zu
 JWVG8c0/lNV34IrtQvl/u4laiCRADkbE2JbG64JpT7b3bQgYs5cg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDAwOSBTYWx0ZWRfXypoIER7KOFEN
 yyOZFSUuWb97Na0ZmDw9aCkSMXjadybURfwMgWOU8R7nlBwKgN0Ybriz+mQ8l27GupAVOO3ngOz
 0WWJDJ8ldYaIkhrLfG6uxHqmeuObwA79mMoGflM5nUAwGAaCNGN4SuWQbapMEJ4UzjTjTB5BwuR
 Tcqrv+3M5EzTdGdcrIxcOJ+7Vfsi0XSAixwnJ73jkZiNpbvALgWQKvThQxbofGpuQCR619f8TgW
 o5W+PfCHSv7Z5PIsjmIo+/S/B+N23aVxIidj8G7TlBRnwvn2Lu7o+Y03cP52vcrpIIt5XJita2z
 +yh6Evo5COtnvGhbpNPD5iHEadc74wIcuslvOSiHRkuK4lr6rKLTAqmKT2ZvzF054kT6uzei3kD
 efkLZdlaDsNYJGxuXl0Djxoi0JkRDPJyL27YigFLEgc2VEUpyS04ssiojdaXWrnk2zEbmToYQYm
 bAR2w+M4DrPTjJcyXsXeejR6lkuC3rB0NjTI/1PU=
X-Proofpoint-GUID: W6iMb0pF__v8G2uZQ2ZPsCy8u0z8KVqP
X-Authority-Analysis: v=2.4 cv=Wek8rUhX c=1 sm=1 tr=0 ts=6a8b9c4a b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=o5oIOnhZENCTenyL_yNV:22 a=yPCof4ZbAAAA:8 a=G0a9BTs-aq7rllif8c0A:9
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:13521
X-Proofpoint-ORIG-GUID: W6iMb0pF__v8G2uZQ2ZPsCy8u0z8KVqP
X-purgate-ID: tlsNG-bad1c0/1787534422-FC610034-DA0F896A/0/0
X-purgate-type: clean
X-purgate-size: 1728

Support forced PCI unplug for generic event device (ged). This enables
forced removal for ACPI PCI hotplug on arm64 virt machines while rejecting
non-PCI devices.

Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
---
 hw/acpi/generic_event_device.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index 9e9416d406..3c041f5c26 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -314,6 +314,20 @@ static void acpi_ged_unplug_cb(HotplugHandler *hotplug_dev,
     }
 }
 
+static void acpi_ged_force_unplug_cb(HotplugHandler *hotplug_dev,
+                                     DeviceState *dev, Error **errp)
+{
+    AcpiGedState *s = ACPI_GED(hotplug_dev);
+
+    if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
+        acpi_pcihp_device_force_unplug_cb(hotplug_dev, &s->pcihp_state,
+                                          dev, errp);
+    } else {
+        error_setg(errp, "acpi: forced device unplug for unsupported device"
+                   " type: %s", object_get_typename(OBJECT(dev)));
+    }
+}
+
 static void acpi_ged_ospm_status(AcpiDeviceIf *adev, ACPIOSTInfoList ***list)
 {
     AcpiGedState *s = ACPI_GED(adev);
@@ -603,6 +617,7 @@ static void acpi_ged_class_init(ObjectClass *class, const void *data)
     hc->plug = acpi_ged_device_plug_cb;
     hc->unplug_request = acpi_ged_unplug_request_cb;
     hc->unplug = acpi_ged_unplug_cb;
+    hc->force_unplug = acpi_ged_force_unplug_cb;
     resettable_class_set_parent_phases(rc, NULL, ged_reset_hold, NULL,
                                        &gedc->parent_phases);
 
-- 
2.43.5


