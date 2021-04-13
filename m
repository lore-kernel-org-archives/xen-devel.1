Return-Path: <SRS0=+ia2=JK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C463C433ED
	for <xen-devel@archiver.kernel.org>; Tue, 13 Apr 2021 17:59:21 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 245486121E
	for <xen-devel@archiver.kernel.org>; Tue, 13 Apr 2021 17:59:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 245486121E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.110068.210114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWNJi-0005ts-Nw; Tue, 13 Apr 2021 17:59:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110068.210114; Tue, 13 Apr 2021 17:59:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWNJi-0005tj-KK; Tue, 13 Apr 2021 17:59:14 +0000
Received: by outflank-mailman (input) for mailman id 110068;
 Tue, 13 Apr 2021 17:59:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1MWi=JK=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lWNJh-0005mq-Kv
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 17:59:13 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 83ad58cc-c534-4bec-b2f5-aac17a5f7db3;
 Tue, 13 Apr 2021 17:59:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9D5B4613BA;
 Tue, 13 Apr 2021 17:59:07 +0000 (UTC)
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
X-Inumbo-ID: 83ad58cc-c534-4bec-b2f5-aac17a5f7db3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1618336748;
	bh=GPoJSocdsrvEwhHDE5FqQZWJ8Wf0LhPUhy+KObvq+MY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SJgdR9eqXI6OtzFJpsZ53jbb+ISgss34Mn6/Ysx84STntpdSsmX9C85F26xogi3N4
	 Z2Aq8HrqBntx+Z0OcTThf748vrJULUrplXvC2F5DYHGUDd0Dn8x3jLMHyJx6+tT3jR
	 uy7VRuIJKyhM/FkVTIKfyxhOKIqWY6HjJseadtEQ9mVq3mSdhul+2CutYYIA6vTG4h
	 IaTa6OfS10iYA+FmZvdJynd/9+aBdlXVg7YHQq0IeVr7zJ0zZaY1rs8uQbI99r7Aza
	 4JbTYvqD3WHB3Lq68bbRWqhFQR+eFPLu/PBOLlYpaJyvsMXCOB4n+ftGCj3f6wajQL
	 4xy2OWOQI/cTQ==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	Bertrand.Marquis@arm.com,
	Volodymyr_Babchuk@epam.com,
	rahul.singh@arm.com,
	brian.woods@xilinx.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH RESEND v3 2/3] arm,smmu: restructure code in preparation to new bindings support
Date: Tue, 13 Apr 2021 10:59:04 -0700
Message-Id: <20210413175905.15123-2-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2104131055580.4885@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2104131055580.4885@sstabellini-ThinkPad-T480s>

From: Brian Woods <brian.woods@xilinx.com>

Restructure some of the code and add supporting functions for adding
generic device tree (DT) binding support.  This will allow for using
current Linux device trees with just modifying the chosen field to
enable Xen.

Signed-off-by: Brian Woods <brian.woods@xilinx.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Reviewed-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/drivers/passthrough/arm/smmu.c | 62 +++++++++++++++++-------------
 1 file changed, 35 insertions(+), 27 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index ac75e23268..f949c110ad 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -810,52 +810,36 @@ static int insert_smmu_master(struct arm_smmu_device *smmu,
 	return 0;
 }
 
-static int register_smmu_master(struct arm_smmu_device *smmu,
-				struct device *dev,
-				struct of_phandle_args *masterspec)
+static int arm_smmu_dt_add_device_legacy(struct arm_smmu_device *smmu,
+					 struct device *dev,
+					 struct iommu_fwspec *fwspec)
 {
-	int i, ret = 0;
+	int i;
 	struct arm_smmu_master *master;
-	struct iommu_fwspec *fwspec;
+	struct device_node *dev_node = dev_get_dev_node(dev);
 
-	master = find_smmu_master(smmu, masterspec->np);
+	master = find_smmu_master(smmu, dev_node);
 	if (master) {
 		dev_err(dev,
 			"rejecting multiple registrations for master device %s\n",
-			masterspec->np->name);
+			dev_node->name);
 		return -EBUSY;
 	}
 
 	master = devm_kzalloc(dev, sizeof(*master), GFP_KERNEL);
 	if (!master)
 		return -ENOMEM;
-	master->of_node = masterspec->np;
-
-	ret = iommu_fwspec_init(&master->of_node->dev, smmu->dev);
-	if (ret) {
-		kfree(master);
-		return ret;
-	}
-	fwspec = dev_iommu_fwspec_get(dev);
-
-	/* adding the ids here */
-	ret = iommu_fwspec_add_ids(&masterspec->np->dev,
-				   masterspec->args,
-				   masterspec->args_count);
-	if (ret)
-		return ret;
+	master->of_node = dev_node;
 
 	/* Xen: Let Xen know that the device is protected by an SMMU */
-	dt_device_set_protected(masterspec->np);
+	dt_device_set_protected(dev_node);
 
 	for (i = 0; i < fwspec->num_ids; ++i) {
-		u16 streamid = masterspec->args[i];
-
 		if (!(smmu->features & ARM_SMMU_FEAT_STREAM_MATCH) &&
-		     (streamid >= smmu->num_mapping_groups)) {
+		     (fwspec->ids[i] >= smmu->num_mapping_groups)) {
 			dev_err(dev,
 				"stream ID for master device %s greater than maximum allowed (%d)\n",
-				masterspec->np->name, smmu->num_mapping_groups);
+				dev_node->name, smmu->num_mapping_groups);
 			return -ERANGE;
 		}
 		master->cfg.smendx[i] = INVALID_SMENDX;
@@ -864,6 +848,30 @@ static int register_smmu_master(struct arm_smmu_device *smmu,
 	return insert_smmu_master(smmu, master);
 }
 
+static int register_smmu_master(struct arm_smmu_device *smmu,
+				struct device *dev,
+				struct of_phandle_args *masterspec)
+{
+	int ret = 0;
+	struct iommu_fwspec *fwspec;
+
+	ret = iommu_fwspec_init(&masterspec->np->dev, smmu->dev);
+	if (ret)
+		return ret;
+
+	fwspec = dev_iommu_fwspec_get(&masterspec->np->dev);
+
+	ret = iommu_fwspec_add_ids(&masterspec->np->dev,
+				   masterspec->args,
+				   masterspec->args_count);
+	if (ret)
+		return ret;
+
+	return arm_smmu_dt_add_device_legacy(smmu,
+					     &masterspec->np->dev,
+					     fwspec);
+}
+
 static struct arm_smmu_device *find_smmu_for_device(struct device *dev)
 {
 	struct arm_smmu_device *smmu;
-- 
2.17.1


