Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A34CEC61CE2
	for <xen-devel@archiver.kernel.org>; Mon, 24 Aug 2026 01:20:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1398595.1634754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyJME-0006mC-32; Mon, 24 Aug 2026 01:20:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1398595.1634754; Mon, 24 Aug 2026 01:20:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyJMD-0006m4-WB; Mon, 24 Aug 2026 01:20:13 +0000
Received: by outflank-mailman (input) for mailman id 1398595;
 Mon, 24 Aug 2026 01:20:12 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dongli.zhang@oracle.com>) id 1wyJMC-0006bE-Ml
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2026 01:20:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wyJMB-00AZzb-8B
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2026 03:20:11 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dongli.zhang@oracle.com>)
 id 6a8b9c28-e002-0a2a0a5209dd-0a2a45068ddc-12
 for <xen-devel@lists.xenproject.org>; Mon, 24 Aug 2026 03:20:11 +0200
Received: from [205.220.165.32] (helo=mx0a-00069f02.pphosted.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dongli.zhang@oracle.com>)
 id 6a8b9c49-195a-0a2a45060019-cddca5201442-3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Aug 2026 03:20:10 +0200
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67NKeTTk080588; Mon, 24 Aug 2026 01:19:56 GMT
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4g72p9sd8k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Aug 2026 01:19:56 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7)
 with ESMTP id 67O1FUex013276; Mon, 24 Aug 2026 01:19:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 4g84kh6xkr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Aug 2026 01:19:54 +0000 (GMT)
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67O1JmVt024683;
 Mon, 24 Aug 2026 01:19:54 GMT
Received: from localhost.localdomain (ca-dev80.us.oracle.com [10.211.9.80])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 4g84kh6xgy-3; Mon, 24 Aug 2026 01:19:54 +0000 (GMT)
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
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=rUdN0
	aeKDSMQqE11yR1hJ7bU2ydRSC3JxdFwpQzV/nk=; b=NCFIEJvt2ZBHnB8T0AxWy
	ZOXACdKzmXfuTtW7FEFMm2K/ZuyzrInrJZtGHsH7ihoGH993WKuow1razVzq4Wr4
	GdZMQTv2ZU8JMNoYeLOzc2HCz1aTyKLjGSFmJtmYYWpLXxSOO7JfYRAbGlVIBNAo
	0+HgW2Yf6X/lVDZLclcGl+JazsEtnaPCAkhTcS7/iVtjnA/5HAqh/c1AcS3Y7lko
	+PKjIk3G3d6qbxEHZZuMzIbznhEIPfyIFDHUSmTAgk0RJvRKuN4qWwp2Ago+JpDl
	H7Jsta9rkcevTSxQaqoC3UYr1LTLI14RrQ7uqm798paKocIlh1TfjjKFeCcZVx/7
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
Subject: [PATCH 2/8] qdev: hotplug: Add force_unplug handler callback
Date: Sun, 23 Aug 2026 18:13:32 -0700
Message-ID: <20260824011420.752806-3-dongli.zhang@oracle.com>
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
X-Proofpoint-ORIG-GUID: G6ZUnmDnatOdqyyPUSBLTMwgv6ngryTY
X-Authority-Analysis: v=2.4 cv=EqfiaycA c=1 sm=1 tr=0 ts=6a8b9c3c b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=x0eKOSpe3m1H3M0S9YoZ:22 a=yPCof4ZbAAAA:8 a=R0-9NCqHhopK7IinchQA:9
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:13521
X-Proofpoint-GUID: G6ZUnmDnatOdqyyPUSBLTMwgv6ngryTY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDAwOSBTYWx0ZWRfXxWgLRDFowCsU
 5e+mNH+Ar5z8qIYae8wTu+DgxKud9tTIHDzx9xOtBiNas0QiqJSgvtZzng1XokCXEUwPevvItpS
 K15PQn51jTzyad8GpI1IKHED71M/ZeFSv+jrrATnaDM2jPU9u1Ah54zHBhbApL7cEwKjuyvBn6E
 K2ZZUaVNyfYte5gyB6dUGYpG+CoHNBn071ncpSUkZFtQCduuiObJwyUrhizr6a7PTB0XyR/DL3H
 nS/diGOxLEDmdx7RJ9h3VBnI3bQAneooxjI1SXLFgR8O8SdHCP5fVu69LyrSls07OCp4bihD5gy
 QEzQjCyPwAynUB1TSuLXGsLCrx5wRKrUI9CR3Px39+5h3sy3KrVed6E7ECr2DCSv9CWzvAi8j9g
 0/cK1B07edIJHRDcz7b3/Lg2wqo9h930FRrCNKUt7Uusf3x3+iFb6R45W/chExfJdnUk57y1yjR
 tfOhubkfOiUMtv+GNcp6gCZ4CWxKtQtxiP2IoMBU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDAwOSBTYWx0ZWRfXwd+CFlCS9IfR
 8VEsTphbiUSSvdZcRBkpKBOm9QlsVre4/GuUwmpUFQGlHeoPCXtj7lqH35E6Ca9CP+cRvz4DASN
 0F1r2h/E3xz7o8pAfFRkpEnKv5rnZihU+DSLydPiOvnYvvHfZZZJ
X-purgate-ID: tlsNG-16d1c6/1787534411-F76C877B-FEFE9ED5/0/0
X-purgate-type: clean
X-purgate-size: 3795

Add a HotplugHandlerClass force_unplug callback and a wrapper used by the
generic qdev unplug path.

When qdev_unplug() is called with force=true, delegate to the hotplug
controller if it implements force_unplug. Controllers without the callback
return a normal error. This makes forced removal available only for
controllers that explicitly implement the operation.

Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
---
 hw/core/hotplug.c         | 11 +++++++++++
 include/hw/core/hotplug.h | 12 ++++++++++++
 system/qdev-monitor.c     | 10 +++++++++-
 3 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/hw/core/hotplug.c b/hw/core/hotplug.c
index 68aabad8ae..0e44d98cf7 100644
--- a/hw/core/hotplug.c
+++ b/hw/core/hotplug.c
@@ -57,6 +57,17 @@ void hotplug_handler_unplug(HotplugHandler *plug_handler,
     }
 }
 
+void hotplug_handler_force_unplug(HotplugHandler *plug_handler,
+                                  DeviceState *plugged_dev,
+                                  Error **errp)
+{
+    HotplugHandlerClass *hdc = HOTPLUG_HANDLER_GET_CLASS(plug_handler);
+
+    if (hdc->force_unplug) {
+        hdc->force_unplug(plug_handler, plugged_dev, errp);
+    }
+}
+
 static const TypeInfo hotplug_handler_info = {
     .name          = TYPE_HOTPLUG_HANDLER,
     .parent        = TYPE_INTERFACE,
diff --git a/include/hw/core/hotplug.h b/include/hw/core/hotplug.h
index a9840ed485..300ac4fa8f 100644
--- a/include/hw/core/hotplug.h
+++ b/include/hw/core/hotplug.h
@@ -48,6 +48,8 @@ typedef void (*hotplug_fn)(HotplugHandler *plug_handler,
  * @unplug: unplug callback.
  *          Used for device removal with devices that implement
  *          asynchronous and synchronous (surprise) removal.
+ * @force_unplug: force unplug callback.
+ *                Used to complete enforced removal without guest cooperation.
  * @is_hotpluggable_bus: called to check if bus/its parent allow hotplug on bus
  */
 struct HotplugHandlerClass {
@@ -59,6 +61,7 @@ struct HotplugHandlerClass {
     hotplug_fn plug;
     hotplug_fn unplug_request;
     hotplug_fn unplug;
+    hotplug_fn force_unplug;
     bool (*is_hotpluggable_bus)(HotplugHandler *plug_handler, BusState *bus);
 };
 
@@ -96,4 +99,13 @@ void hotplug_handler_unplug_request(HotplugHandler *plug_handler,
 void hotplug_handler_unplug(HotplugHandler *plug_handler,
                             DeviceState *plugged_dev,
                             Error **errp);
+
+/**
+ * hotplug_handler_force_unplug:
+ *
+ * Calls #HotplugHandlerClass.force_unplug callback of @plug_handler.
+ */
+void hotplug_handler_force_unplug(HotplugHandler *plug_handler,
+                                  DeviceState *plugged_dev,
+                                  Error **errp);
 #endif
diff --git a/system/qdev-monitor.c b/system/qdev-monitor.c
index 3606a347a0..fa3cae246b 100644
--- a/system/qdev-monitor.c
+++ b/system/qdev-monitor.c
@@ -937,7 +937,15 @@ void qdev_unplug(DeviceState *dev, bool force, Error **errp)
     /* If device supports async unplug just request it to be done,
      * otherwise just remove it synchronously */
     hdc = HOTPLUG_HANDLER_GET_CLASS(hotplug_ctrl);
-    if (hdc->unplug_request) {
+
+    if (force) {
+        if (!hdc->force_unplug) {
+            error_setg(&local_err, "Device '%s' does not support forced unplug",
+                       dev->id ? dev->id : object_get_typename(OBJECT(dev)));
+        } else {
+            hotplug_handler_force_unplug(hotplug_ctrl, dev, &local_err);
+        }
+    } else if (hdc->unplug_request) {
         hotplug_handler_unplug_request(hotplug_ctrl, dev, &local_err);
     } else {
         hotplug_handler_unplug(hotplug_ctrl, dev, &local_err);
-- 
2.43.5


