Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C097AC61CE0
	for <xen-devel@archiver.kernel.org>; Mon, 24 Aug 2026 01:20:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1398600.1634799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyJML-0007ua-LP; Mon, 24 Aug 2026 01:20:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1398600.1634799; Mon, 24 Aug 2026 01:20:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyJML-0007th-Fk; Mon, 24 Aug 2026 01:20:21 +0000
Received: by outflank-mailman (input) for mailman id 1398600;
 Mon, 24 Aug 2026 01:20:20 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dongli.zhang@oracle.com>) id 1wyJMK-0007bX-Kj
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2026 01:20:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wyJMK-008wuR-1U
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2026 03:20:20 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dongli.zhang@oracle.com>)
 id 6a8b9c21-bab6-0a2a0a5309dd-0a2a450ae05e-12
 for <xen-devel@lists.xenproject.org>; Mon, 24 Aug 2026 03:20:19 +0200
Received: from [205.220.177.32] (helo=mx0b-00069f02.pphosted.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dongli.zhang@oracle.com>)
 id 6a8b9c52-f2d2-0a2a450a0019-cddcb1206432-3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Aug 2026 03:20:19 +0200
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67NNt1FD4056749; Mon, 24 Aug 2026 01:20:08 GMT
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4g72j1sdht-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Aug 2026 01:20:07 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7)
 with ESMTP id 67O1FUaD013237; Mon, 24 Aug 2026 01:20:07 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 4g84kh6xsb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Aug 2026 01:20:07 +0000 (GMT)
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67O1JmW3024683;
 Mon, 24 Aug 2026 01:20:06 GMT
Received: from localhost.localdomain (ca-dev80.us.oracle.com [10.211.9.80])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 4g84kh6xgy-7; Mon, 24 Aug 2026 01:20:06 +0000 (GMT)
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
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=aTU6W
	vwCf7dVFveRp+8Di7qF8n2TK1NxXJQMZxinPeE=; b=h+NJIWBFVetrCAi6JPQMq
	AnZre7DU29ds7rqUasZtpPzPuZ3euvUW10mHK+tuic0pdes4MIH1iiMRdAeG6Wx4
	UkeIdxvdZnhQx4Jhtpcx1wbIUmuBuJUcQmlOtqBMUue48Dt/uYEqCzONjSc6efn8
	nXNZptIM1DGZ1NSLIIfe/zv5DzVaZ/iz6BCtRgt+DI631cx6BSYunnxETOw6w/ZT
	2CIbNyNL+9dTjWgtMjDcHfjOKRMBiwfvIBrNLnner9LnSjct/Pqj9K8LdovdtUzj
	dnmJI0LlM0WsSJ6LG7EUJktRUR6VpqCMCsCLMu5eG06rQIcl+DQzH22aE6zkOfav
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
Subject: [PATCH 6/8] hw/acpi/ich9: Support forced PCI unplug
Date: Sun, 23 Aug 2026 18:13:36 -0700
Message-ID: <20260824011420.752806-7-dongli.zhang@oracle.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDAwOSBTYWx0ZWRfXz9YOZ9qDy8HS
 +SghGegefBKikkhHiHni+UOguA7ph92WpeC5j+tg0tD/71PJyCnN0y+p6HH0J9DdGygzEn0qN9Q
 N8Vpym8vv6fAp9PbYFSCMiq/oSHsDv2UgTBICsP5Yrj9iQhO6BPs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDAwOSBTYWx0ZWRfX4rJccOSNWSDH
 ePO5OlzXZFL00+0OOA6BTz8zLWPUznzKMDCJBIAzVgQftNo52LqRmAEvDitqBOdwAx1dy7fD5dl
 N62MxNPp5KDPYRs3d7N55R5f5uc2lRzKJocY8tw3VcuuKTou4DcpFiZ+ud2eand4vFyGbR9mUM5
 Dc6nio5El7HqsTdIaxTxR1Fwtjwo3uvCtpiHPvEBC+Iq1xYqhF1aUqJP54bc3EFSern7AwY/p67
 1/V2ZUO6KtpRLU+g+H3DYFE8kXcffZYlYRRz4PNNybF3UBIKSQKeiU1k34sngAiLefzIMWwog6F
 wijyu79VehyMfdQVbx17/XI2/kRr9CM8aI7V21A/eF3fXFzlTu4npEn1E8QKDYt/E5GWoWfO2kR
 7kHrqf1hgalIDJn6WELVTDHts3lqU85oXPhrxCGr8cFhlBdiV1dEQBOIi0Swt6Hbfs3j10al3hO
 thPb48eBM0/6LXCsMTrcWwtN5+UvgSd5DoRI5GeA=
X-Proofpoint-GUID: vHD5v_s0FE83Tiu0YxCJBrdfCIEalDCo
X-Authority-Analysis: v=2.4 cv=Wek8rUhX c=1 sm=1 tr=0 ts=6a8b9c47 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=o5oIOnhZENCTenyL_yNV:22 a=yPCof4ZbAAAA:8 a=WNH3IyxyIQbYLsLU91AA:9
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:13521
X-Proofpoint-ORIG-GUID: vHD5v_s0FE83Tiu0YxCJBrdfCIEalDCo
X-purgate-ID: tlsNG-4011c0/1787534419-506CECFC-31AB1BBB/0/0
X-purgate-type: clean
X-purgate-size: 2691

Support forced PCI unplug for ICH9. This enables forced removal for ACPI
PCI hotplug on q35 machines while rejecting non-PCI devices.

Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
---
 hw/acpi/ich9.c         | 15 +++++++++++++++
 hw/isa/lpc_ich9.c      |  1 +
 include/hw/acpi/ich9.h |  2 ++
 3 files changed, 18 insertions(+)

diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
index 5e8f8a7eaf..4bcaf3858b 100644
--- a/hw/acpi/ich9.c
+++ b/hw/acpi/ich9.c
@@ -528,6 +528,21 @@ void ich9_pm_device_unplug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
     }
 }
 
+void ich9_pm_device_force_unplug_cb(HotplugHandler *hotplug_dev,
+                                    DeviceState *dev, Error **errp)
+{
+    ICH9LPCState *lpc = ICH9_LPC_DEVICE(hotplug_dev);
+
+    if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
+        acpi_pcihp_device_force_unplug_cb(hotplug_dev,
+                                          &lpc->pm.acpi_pci_hotplug,
+                                          dev, errp);
+    } else {
+        error_setg(errp, "acpi: forced device unplug for not supported device"
+                   " type: %s", object_get_typename(OBJECT(dev)));
+    }
+}
+
 bool ich9_pm_is_hotpluggable_bus(HotplugHandler *hotplug_dev, BusState *bus)
 {
     ICH9LPCState *lpc = ICH9_LPC_DEVICE(hotplug_dev);
diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index edf9783ec8..6d734ffc47 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -908,6 +908,7 @@ static void ich9_lpc_class_init(ObjectClass *klass, const void *data)
     hc->plug = ich9_pm_device_plug_cb;
     hc->unplug_request = ich9_pm_device_unplug_request_cb;
     hc->unplug = ich9_pm_device_unplug_cb;
+    hc->force_unplug = ich9_pm_device_force_unplug_cb;
     hc->is_hotpluggable_bus = ich9_pm_is_hotpluggable_bus;
     adevc->ospm_status = ich9_pm_ospm_status;
     adevc->send_event = ich9_send_gpe;
diff --git a/include/hw/acpi/ich9.h b/include/hw/acpi/ich9.h
index 30990fcef5..cc9f50a60f 100644
--- a/include/hw/acpi/ich9.h
+++ b/include/hw/acpi/ich9.h
@@ -93,6 +93,8 @@ void ich9_pm_device_unplug_request_cb(HotplugHandler *hotplug_dev,
                                       DeviceState *dev, Error **errp);
 void ich9_pm_device_unplug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
                               Error **errp);
+void ich9_pm_device_force_unplug_cb(HotplugHandler *hotplug_dev,
+                                    DeviceState *dev, Error **errp);
 bool ich9_pm_is_hotpluggable_bus(HotplugHandler *hotplug_dev, BusState *bus);
 
 void ich9_pm_ospm_status(AcpiDeviceIf *adev, ACPIOSTInfoList ***list);
-- 
2.43.5


