Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A45C61CE4
	for <xen-devel@archiver.kernel.org>; Mon, 24 Aug 2026 01:20:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1398597.1634769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyJMI-00074k-N1; Mon, 24 Aug 2026 01:20:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1398597.1634769; Mon, 24 Aug 2026 01:20:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyJMI-00074V-HZ; Mon, 24 Aug 2026 01:20:18 +0000
Received: by outflank-mailman (input) for mailman id 1398597;
 Mon, 24 Aug 2026 01:20:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dongli.zhang@oracle.com>) id 1wyJMH-00070j-3C
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2026 01:20:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wyJMG-00Cy13-2O
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2026 03:20:16 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dongli.zhang@oracle.com>)
 id 6a8b9c46-2eae-0a2a0a5409dd-0a2a4501a1d6-2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Aug 2026 03:20:16 +0200
Received: from [205.220.165.32] (helo=mx0a-00069f02.pphosted.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dongli.zhang@oracle.com>)
 id 6a8b9c4e-5984-0a2a45010019-cddca5202e80-3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Aug 2026 03:20:15 +0200
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67NNoaSp184913; Mon, 24 Aug 2026 01:19:53 GMT
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4g73n79bq9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Aug 2026 01:19:53 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7)
 with ESMTP id 67O1FUFU013327; Mon, 24 Aug 2026 01:19:52 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 4g84kh6xjv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Aug 2026 01:19:51 +0000 (GMT)
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67O1JmVr024683;
 Mon, 24 Aug 2026 01:19:51 GMT
Received: from localhost.localdomain (ca-dev80.us.oracle.com [10.211.9.80])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 4g84kh6xgy-2; Mon, 24 Aug 2026 01:19:51 +0000 (GMT)
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
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=R5A5r
	X8ZNolp5d6iXru1bTvNH5HsxNPxzQWKsW5ngQk=; b=gexwkAxCTCU2CTSujcgAK
	3b40guQVoS/q1ESM3aJSUtXJBCg0qBsResRkB2M8et1OZhAYd5AfOADKiZFK/9yW
	zVTXzoIVmND4T2DxKG9/n6yY3sd6MDElh4006CGkkrG8EClIyT5DdXKmC0RZK6tW
	izvuAndZ5I01MA1cV2Bo3edh3sCIW2taWutahqRAej+Ae7l07omLFWsyPqtb7xFX
	MNFS3Dj147awOAezMukwigAmo90TekjjY+Xb7tOEs/85+dkNd4kALHnZINMyfr2R
	wpC8fIDrSxc5/sEeNjMUPitQmxWEu0ofbLNa3VSH1NudrD7PTAoDilxeG9w32iEP
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
Subject: [PATCH 1/8] qdev: Add force argument to qdev_unplug
Date: Sun, 23 Aug 2026 18:13:31 -0700
Message-ID: <20260824011420.752806-2-dongli.zhang@oracle.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDAwOSBTYWx0ZWRfX0pZHNniCXxvo
 +jYK89Xqx9BAiviF5TDhspqHIW99mm31IX6CyflKwUVl4yjJq97il/iY4iuqP+Z806+R1k78DX/
 RxzPoZv4I7SqKF9v8pJNyZhIlIjIVFRzLIAWKgpf02BgLC+kXyjx9tRGvIVwLyJb0l1ZDyOVi6l
 g2z7npr3VTEALBmvYct58QWhdGTGDJhN8cYem57Em8MJQV5CR+5+ZNCxdAZahWF/ORj0pWtmAup
 dmZtx/b2/QIOIFvM99diCzYM90nMqW1xPNw/aUMN9sCvlo67oovCYRzHYxXwFfFotrARKhgQ7ms
 vE6ReUgiewTyerpp1V5QkaaBTdetvJr1lK2UsvF7Qh4u+6nMZak5n2p7OTZCYuWfJSF5cNsF87j
 xptUB80Gg09hbRA4BHVmANBGETue9A/ma014LFXodMcjHj7fCV1C+xT8VQl2qWU8lm7pdWGvkqH
 zMpM8usZTyeSOAYkE0mTcCEhmKWF+X9vCUL0ZZsw=
X-Proofpoint-ORIG-GUID: zjVPwpTg9rN1xiA-29n-6Ur4p4ty26Y7
X-Authority-Analysis: v=2.4 cv=Os9/DS/t c=1 sm=1 tr=0 ts=6a8b9c39 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=EIcjfB9IiI4px24ztqRk:22 a=yPCof4ZbAAAA:8 a=DmdIBfvRwVG_7NqPh9cA:9
 a=O8hF6Hzn-FEA:10 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf
 awl=host:13521
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDAwOSBTYWx0ZWRfX3/8k42mkVOnG
 5hfcO/Qymt00VmDX9zzro68WRF+zuLyRDXj2XcOGiqF+VWdd+i0MFvP0zFX7BGXvg3jSzWxnFG8
 CDp5NJP1zNEOhZlN0rwLTfGnn4OPrTlR9V8HciqVOSkAtTMww6yK
X-Proofpoint-GUID: zjVPwpTg9rN1xiA-29n-6Ur4p4ty26Y7
X-purgate-ID: tlsNG-d62444/1787534416-C4F47757-E080D29F/0/0
X-purgate-type: clean
X-purgate-size: 5214

Add a force argument to qdev_unplug() and update all existing callers to
pass false.

No functional change.

The upcoming patches will add the hotplug controller callback used to
implement it to force detach a PCI device.

Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
---
 hw/s390x/s390-pci-bus.c     | 4 ++--
 hw/vfio/ap.c                | 2 +-
 hw/vfio/ccw.c               | 2 +-
 hw/vfio/pci.c               | 2 +-
 hw/xen/xen-legacy-backend.c | 2 +-
 hw/xen/xen_pvdev.c          | 2 +-
 include/hw/core/qdev.h      | 2 +-
 system/qdev-monitor.c       | 4 ++--
 8 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
index eff980fdfe..11ff9bcce5 100644
--- a/hw/s390x/s390-pci-bus.c
+++ b/hw/s390x/s390-pci-bus.c
@@ -1276,7 +1276,7 @@ static void s390_pcihost_unplug_request(HotplugHandler *hotplug_dev,
         }
 
         pbdev->pci_unplug_request_processed = true;
-        qdev_unplug(DEVICE(pbdev), errp);
+        qdev_unplug(DEVICE(pbdev), false, errp);
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_S390_PCI_DEVICE)) {
         pbdev = S390_PCI_DEVICE(dev);
 
@@ -1287,7 +1287,7 @@ static void s390_pcihost_unplug_request(HotplugHandler *hotplug_dev,
          * is not blocked, e.g. because it's a PCI bridge).
          */
         if (pbdev->pdev && !pbdev->pci_unplug_request_processed) {
-            qdev_unplug(DEVICE(pbdev->pdev), errp);
+            qdev_unplug(DEVICE(pbdev->pdev), false, errp);
             return;
         }
         pbdev->pci_unplug_request_processed = false;
diff --git a/hw/vfio/ap.c b/hw/vfio/ap.c
index 6e2a1223ea..8e7c72dc8b 100644
--- a/hw/vfio/ap.c
+++ b/hw/vfio/ap.c
@@ -79,7 +79,7 @@ static void vfio_ap_req_notifier_handler(void *opaque)
         return;
     }
 
-    qdev_unplug(DEVICE(vapdev), &err);
+    qdev_unplug(DEVICE(vapdev), false, &err);
 
     if (err) {
         warn_reportf_err(err, VFIO_MSG_PREFIX, vapdev->vdev.name);
diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
index c3dc7c1962..c7d48966dc 100644
--- a/hw/vfio/ccw.c
+++ b/hw/vfio/ccw.c
@@ -282,7 +282,7 @@ static void vfio_ccw_req_notifier_handler(void *opaque)
         return;
     }
 
-    qdev_unplug(DEVICE(vcdev), &err);
+    qdev_unplug(DEVICE(vcdev), false, &err);
     if (err) {
         warn_reportf_err(err, VFIO_MSG_PREFIX, vcdev->vdev.name);
     }
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 428ab2f069..aafa841241 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3328,7 +3328,7 @@ static void vfio_req_notifier_handler(void *opaque)
         return;
     }
 
-    qdev_unplug(DEVICE(vdev), &err);
+    qdev_unplug(DEVICE(vdev), false, &err);
     if (err) {
         warn_reportf_err(err, VFIO_MSG_PREFIX, vdev->vbasedev.name);
     }
diff --git a/hw/xen/xen-legacy-backend.c b/hw/xen/xen-legacy-backend.c
index 7977b52712..4aa0339887 100644
--- a/hw/xen/xen-legacy-backend.c
+++ b/hw/xen/xen-legacy-backend.c
@@ -186,7 +186,7 @@ static struct XenLegacyDevice *xen_be_get_xendev(const char *type, int dom,
     xendev->evtchndev = qemu_xen_evtchn_open();
     if (xendev->evtchndev == NULL) {
         xen_pv_printf(NULL, 0, "can't open evtchn device\n");
-        qdev_unplug(DEVICE(xendev), NULL);
+        qdev_unplug(DEVICE(xendev), false, NULL);
         return NULL;
     }
     qemu_set_cloexec(qemu_xen_evtchn_fd(xendev->evtchndev));
diff --git a/hw/xen/xen_pvdev.c b/hw/xen/xen_pvdev.c
index e36370e2ee..9518f5b3b5 100644
--- a/hw/xen/xen_pvdev.c
+++ b/hw/xen/xen_pvdev.c
@@ -273,7 +273,7 @@ void xen_pv_del_xendev(struct XenLegacyDevice *xendev)
 
     QTAILQ_REMOVE(&xendevs, xendev, next);
 
-    qdev_unplug(DEVICE(xendev), NULL);
+    qdev_unplug(DEVICE(xendev), false, NULL);
 }
 
 void xen_pv_insert_xendev(struct XenLegacyDevice *xendev)
diff --git a/include/hw/core/qdev.h b/include/hw/core/qdev.h
index 37f7d33551..c1daa74914 100644
--- a/include/hw/core/qdev.h
+++ b/include/hw/core/qdev.h
@@ -527,7 +527,7 @@ bool qdev_hotunplug_allowed(DeviceState *dev, Error **errp);
  * or NULL if there aren't any.
  */
 HotplugHandler *qdev_get_hotplug_handler(DeviceState *dev);
-void qdev_unplug(DeviceState *dev, Error **errp);
+void qdev_unplug(DeviceState *dev, bool force, Error **errp);
 int qdev_sync_config(DeviceState *dev, Error **errp);
 void qdev_simple_device_unplug_cb(HotplugHandler *hotplug_dev,
                                   DeviceState *dev, Error **errp);
diff --git a/system/qdev-monitor.c b/system/qdev-monitor.c
index 00fed791cc..3606a347a0 100644
--- a/system/qdev-monitor.c
+++ b/system/qdev-monitor.c
@@ -912,7 +912,7 @@ static DeviceState *find_device_state(const char *id, bool use_generic_error,
     return dev;
 }
 
-void qdev_unplug(DeviceState *dev, Error **errp)
+void qdev_unplug(DeviceState *dev, bool force, Error **errp)
 {
     HotplugHandler *hotplug_ctrl;
     HotplugHandlerClass *hdc;
@@ -960,7 +960,7 @@ void qmp_device_del(const char *id, Error **errp)
             return;
         }
 
-        qdev_unplug(dev, errp);
+        qdev_unplug(dev, false, errp);
     }
 }
 
-- 
2.43.5


