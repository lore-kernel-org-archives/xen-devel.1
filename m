Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873E4606A324
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 17:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=VPU53uhS
Received: from list by lists.xenproject.org with outflank-mailman.1470354.1679153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOILE-0001pN-Gv; Tue, 03 Nov 2026 17:30:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1470354.1679153; Tue, 03 Nov 2026 17:30:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOILD-0001o6-W9; Tue, 03 Nov 2026 17:30:36 +0000
Received: by outflank-mailman (input) for mailman id 1470354;
 Tue, 03 Nov 2026 17:30:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1xOILC-0001L6-4Y
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 17:30:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOILB-004K6F-Gw
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 18:30:33 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6aea1a35-2eae-0a2a0a5409dd-0a2a4506cece-8
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 18:30:33 +0100
Received: from [52.101.84.75]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6aea1a39-195a-0a2a45060019-3465544bea63-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 18:30:33 +0100
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com (2603:10a6:20b:595::7)
 by DBBPR03MB10511.eurprd03.prod.outlook.com (2603:10a6:10:53d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 17:30:31 +0000
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5]) by AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5%5]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 17:30:31 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fc0UOWfWjleWMbsGkLDtfwBGEH/4qQTVNkRLjuY8vsZybOwyvAXFZbja7mhnQ/Ea/Mk4/dJlAOCTfEqBm/xL8v1jqNxKbC+6H8s6Fe2wHLU+thkJNltADf9pwnkdMR4BnEvKKx/MwKYFYyRMK62N4kyCxkjfLiF555IfM05PJzUTv4BKOB6cCTWSsercdZFWFMkI93PUBH7USDXfNkAjygJlNG0rGnMsf3B7oqngGgw6XYcEkwTNWDxG5sSQlye3cZxGAu9k+82eb6TIfPqJmeILwX2+/o8x+fBrleX/iSEyz8WqmwGaHvmxUOpWtRDQEY3/fw5phVljuV7FdvMBeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+QGCqFTyH9G5nYKqfOyTomWNnOUGDIozO+kWVyetpRk=;
 b=tZilIdaZ6RBOjAJ1a9vodlNs+gI6WWNqdE7pHHQbjqWwdWBLLQTYHK52uLj8bGKJcRPTmlnSeJS5++V1CVuSlkJiWYVlX9Au+Tg7qb3FsfgQMComN/gGGHsUqixbJ72d52z1Flq8Sn+uev8UGFnvsjKep0v5EKQq7pzKq4xKfg6z/Yyg/IiI8XKcKazUQq3wlvUeHSm9I3x1Ayu3oWAmG2Qll2h0Pi/uUMX5vAJNbc5JNOaJ+t6TXsmoX25g6Q8xNNaKD4IddiTAhRnRG/VtV3rD6k55Wbsfi91QXCUnm+apxzhdincx7I86aJhbvsodzfabb4Cv0gd5FInUVSiygw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+QGCqFTyH9G5nYKqfOyTomWNnOUGDIozO+kWVyetpRk=;
 b=VPU53uhS7MnfgbMVVveBR6SAn1cfEPf+Z8VGVaDriIqHy4EIh8hxBzFNCOjwi9WnDZqx5S64BE9ZaGN6H9uLk5KRD+ieJ6HmPkhmgLsjp5vfjbNt2ScDxs99qKWSepUJxR159mJg31WxHwrb2t9/yV9sfvuIBv+eYZE4a/sk3oi2Pi7AODkSREpm/WYAegnbLdemLhnjloWrV5ApqF8yqUT5E986tOvt2tSNklfQQrfS9kebjTR9XaON7LIeKzyXDqxGUyPB/J9KcrfRXcSJtAQ5GhP5oiOtHzIeLPivJcJf3hhwRF/irshYrY63ZqS8Nxt6vcZ1CwhPInhDvY14TQ==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger@xenproject.com>, Milan Djokic
	<milan_djokic@epam.com>
Subject: [PATCH v5 11/22] xen/arm: vsmmuv3: Attach Stage-1 configuration to
 SMMUv3 hardware
Thread-Topic: [PATCH v5 11/22] xen/arm: vsmmuv3: Attach Stage-1 configuration
 to SMMUv3 hardware
Thread-Index: AQHda7kGEs1jLaaktkeEsaJubIp4rQ==
Date: Tue, 3 Nov 2026 17:30:31 +0000
Message-ID:
 <60014e87e1c8e125e59a87bd89ce4ce87d4a590f.1793726692.git.milan_djokic@epam.com>
References: <cover.1793726692.git.milan_djokic@epam.com>
In-Reply-To: <cover.1793726692.git.milan_djokic@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB9587:EE_|DBBPR03MB10511:EE_
x-ms-office365-filtering-correlation-id: eced4df7-588e-42a5-0e78-08df39d02920
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|38070700021|261022075727099003|11063799006|56012099006|261009223027099003|261022105027099003|261021121427099003|261102123227099003|261028144727099003|261026140227099003|261026121527099003|10067099003|18002099003|22082099003|6133799003;
x-microsoft-antispam-message-info:
 BJApNPOua/8/h9wmk+JD4oSmnRq55hShoyFdb/YoAwiM2hmyAjqxkStLJL1eHaluDn4ccConqnpktT8yKbzpXHrmppaEyRYdbng2MgWsPv6F48g8cOeBrtScua9MY5hyLEc+bcFIHb5MDhSGW9BMGWb1fsRGnX3T0O5zxOjOCp6xJP77L+YFyRukIuoeuIUR3pGiunN8wGD/cbuDBYltMAUZu8tlok4VvitX6pztxlgEhdtHL++XYmNLYP+5Qr/VRIrXe8W39Yn1M9ON6MchLJAbCalNCDlulO88FTEo2xfCQFKpwOzNMQ/mslD/7k3HayT3n9lP66rpyzZd490s/Wv6o7XuCSLn7Y5bWrYjnrmxn/Wp5dAkIMRpFAf06ipg9GeJrOBVB/a2dOclxnO5kWgwQkFvubyU6RXpdg2qZCHHmMRAhid56E4tar/inm0PTwTqiZm49x4BA+i1Ej6O1cv+mkUbzsP1OYG71O3mhM4P7gVmuPe0dgQLhso7mwXfrMcVWLjWKwSUsvu5XvjsqaSAc3hULt1YAHH4COCaDc6UKAuo6sQmJobaNfAymfuTLmhnLPHDx3Ae3hvjGvQl8OeAKr5VE5v7G7sMReQl8OjncFGMcKzb5c75fHds1dOKAuTO2GJ4eC3wbs2TiMdQ4Z1uaPpl7660P79NPYG9eOif+MP04D2n1J+iwvcIli8swBJjUIH0oia5vlUymyGMOqZNxpe9DNDWWVlpgG8Fkes=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9587.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(38070700021)(261022075727099003)(11063799006)(56012099006)(261009223027099003)(261022105027099003)(261021121427099003)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?KQ3ilepSknUBW6QQgSC7pxAFjKr+77Zn9eBCnRHchFa0Aa9aZuVLTh/Lqa?=
 =?iso-8859-1?Q?h/ZyQPU9gvWbx7AH0LprnMvgNr8eyFZOUa3Seh2jrSPlBT/M9jtRshkYaO?=
 =?iso-8859-1?Q?gOaq3MNgx+wqGuuYyS9GoHXbDE5GGX3MeTg5dlkvnuAyf1FGozdvLoiSGR?=
 =?iso-8859-1?Q?ys6vyhhuk3vCs2ii0pb19AEsMunxpsJKi6TsxrH9ybYwA323D/C8ci6zhm?=
 =?iso-8859-1?Q?0YBu68HAgNmyLWhiAF2HyqFHf6yTMaxBsB5MhTSXp+nPLAjfKFkIV+93Xe?=
 =?iso-8859-1?Q?Fa4SdEN6+Ta5/4UXEaehu+4F329hKlWFq9RdYVt4u4LqGoxXBoFg/wPEtr?=
 =?iso-8859-1?Q?jeiOZMTdMl8iEqD/j6L2KJ7AkhNGj9fdHUG/97GetQFiXxICuJxOOWnsmb?=
 =?iso-8859-1?Q?+4ZHIW6Eyd7r6skmz65Zb+k8fn3zS88hyH7hS9DouxCRN53sdioDPaaU6r?=
 =?iso-8859-1?Q?/+ED8nm9pZibyCjHb2YwPCBU6yL0VTWmSnM+mmekcsxaXq7KaxdLEk1jo6?=
 =?iso-8859-1?Q?6sK7dncxVmX/OtOukplZDSO3uQbLLEGnO/tT/1BLFg+xec+gG4ijj8PBMR?=
 =?iso-8859-1?Q?itcLlN+9wmkrnhDCQd712U1CfZZtKS/NM1oIyiK7qEiVWh3hMrD5k1OAA7?=
 =?iso-8859-1?Q?PD2Z3XBJCym2xOH431Eox0ni4c8FGdvGSpKHKRXF8n+8czZX1kQ+o+qfKL?=
 =?iso-8859-1?Q?it3ZvoJmjYrj7cjgcNi3c4rQg9KjqLKZ/wd6vcNqcueD3zzda2rFDJSKeh?=
 =?iso-8859-1?Q?uhPekWr9KH+Jx2Vp5m762fv0Ti1fLAd1d6jb44Pgb8QkQ473wHW2obensE?=
 =?iso-8859-1?Q?auGWIG6mBm+ax/gZLIwzzHb4qGOhovf3yFPzJt2auQ8Vjz8tUgGhNK7paw?=
 =?iso-8859-1?Q?ZmYgQ7KzfHfEDHr0o+WSxTc4JnVriuwPZHXn5kKz+cXYYNrF8T8/dKN3K4?=
 =?iso-8859-1?Q?2KWmrQDUsf4WwFwCYfxPxOp1EBuVp341Jc2u/8M/G442NrgaqvdQtmzXTy?=
 =?iso-8859-1?Q?B8/2YaUGlWtsA9LdZXhQVynRHubRGjj4cat/7wNe3IiSG7rDfUT8+lWCvB?=
 =?iso-8859-1?Q?RXdSrwTiD68R8t+KRjlk2x66Qydmic05hwKfQX5VEL8yEg44RFrvm4yZjH?=
 =?iso-8859-1?Q?T6c7iaNhg4hUF9fW58l+ZtCyKGFRo2OIJcPYQZMBCK0B1d46CgPPky7zIv?=
 =?iso-8859-1?Q?4vGyUy3UDjMLcjVKPoTkcwuzvQvyV2jDqu5SQw36NPSBLXgBMwQz0m6cDY?=
 =?iso-8859-1?Q?tJhnG3BYBnVs4F/M9Ti20ZBRKe6C3uYMrrXYvjDMjzodCsD+1dqblRR9q9?=
 =?iso-8859-1?Q?XLhsPwTwYvs1Sh90XOksN7KP00foQPsx3tGXdGmC3qPQ1TruFnXfAf4JTz?=
 =?iso-8859-1?Q?au1ENjSqPMpavbIqwHt0SijBzjxlNx25pHRPuCPs2u2rraphziED2UBFhw?=
 =?iso-8859-1?Q?sahaZrJbvWVw3gDmBgrFucpaMAMHeKmZcUKSYd46IKLEGsrVxnE+Y+e6sV?=
 =?iso-8859-1?Q?k9aWzXPiR9WOelBmhD2dp02IR6ohTFGzv1VyFc9MMIhrgs+zjeMoWKUmn5?=
 =?iso-8859-1?Q?t8A0aLlJCpQKw3t+o+gvpkdYmxb4X5f2UDmik84tfK/3YlS+4gBz3Kln7G?=
 =?iso-8859-1?Q?bx8FeUNdQeBzEJ8xydDwSPVnj167T6v7X/8Vf1jLDdVhRmvuRV0yDJ+FG0?=
 =?iso-8859-1?Q?GaULffv/GOJ4TiV0JMz60aolghhAllnD9helkjOvR6X24G4d9mD0HiAdny?=
 =?iso-8859-1?Q?1sCRf9ckpWSrDMaWO+6sizAvxs1sc6xNIxWnGJOZKZMvQuZwkBSH7SMc4o?=
 =?iso-8859-1?Q?Pzhyo8a0Vw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9587.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eced4df7-588e-42a5-0e78-08df39d02920
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 17:30:31.5704
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7UWeyAE3ewU2UYx6Hur5Y1dv6WKJL9o8HKgB5cKS5tatDN6wsWA11GyseqbNi+hycZUsMaheFhcwuFl5T1NHfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB10511
X-purgate-ID: tlsNG-16d1c6/1793727033-1F0C777B-0AA18D3D/0/0
X-purgate-type: clean
X-purgate-size: 7867
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Rahul Singh <rahul.singh@arm.com>

Attach the Stage-1 configuration to device STE to support nested
translation for the guests.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 xen/arch/arm/include/asm/iommu.h       |   7 ++
 xen/drivers/passthrough/arm/smmu-v3.c  | 114 +++++++++++++++++++++++++
 xen/drivers/passthrough/arm/vsmmu-v3.c |  18 ++++
 xen/include/xen/iommu.h                |   6 ++
 4 files changed, 145 insertions(+)

diff --git a/xen/arch/arm/include/asm/iommu.h b/xen/arch/arm/include/asm/io=
mmu.h
index ad15477e24..56bc9314a7 100644
--- a/xen/arch/arm/include/asm/iommu.h
+++ b/xen/arch/arm/include/asm/iommu.h
@@ -20,6 +20,13 @@ struct arch_iommu
     void *priv;
 };
=20
+struct iommu_guest_config {
+    paddr_t     s1ctxptr;
+    uint8_t     config;
+    uint8_t     s1fmt;
+    uint8_t     s1cdmax;
+};
+
 const struct iommu_ops *iommu_get_ops(void);
 void iommu_set_ops(const struct iommu_ops *ops);
=20
diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthroug=
h/arm/smmu-v3.c
index d2dfb06cae..4f95b5206e 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -3061,6 +3061,37 @@ static struct arm_smmu_device *arm_smmu_get_by_dev(c=
onst struct device *dev)
 	return NULL;
 }
=20
+static struct iommu_domain *arm_smmu_get_domain_by_sid(struct domain *d,
+				u32 sid)
+{
+	int i;
+	unsigned long flags;
+	struct iommu_domain *io_domain;
+	struct arm_smmu_domain *smmu_domain;
+	struct arm_smmu_master *master;
+	struct arm_smmu_xen_domain *xen_domain =3D dom_iommu(d)->arch.priv;
+
+	/*
+	 * Loop through the &xen_domain->contexts to locate a context
+	 * associated with the target SMMU and device SID
+	 */
+	list_for_each_entry(io_domain, &xen_domain->contexts, list) {
+		smmu_domain =3D to_smmu_domain(io_domain);
+
+		spin_lock_irqsave(&smmu_domain->devices_lock, flags);
+		list_for_each_entry(master, &smmu_domain->devices, domain_head) {
+			for (i =3D 0; i < master->num_streams; i++) {
+				if (sid !=3D master->streams[i].id)
+					continue;
+				spin_unlock_irqrestore(&smmu_domain->devices_lock, flags);
+				return io_domain;
+			}
+		}
+		spin_unlock_irqrestore(&smmu_domain->devices_lock, flags);
+	}
+	return NULL;
+}
+
 static struct iommu_domain *arm_smmu_get_domain(struct domain *d,
 				struct device *dev)
 {
@@ -3274,6 +3305,88 @@ static void arm_smmu_iommu_xen_domain_teardown(struc=
t domain *d)
 	xfree(xen_domain);
 }
=20
+static int arm_smmu_attach_guest_config(struct domain *d, uint32_t sid,
+		const struct iommu_guest_config *cfg)
+{
+	int ret =3D -EINVAL;
+	unsigned long flags;
+	struct arm_smmu_master *master;
+	struct arm_smmu_domain *smmu_domain;
+	struct arm_smmu_xen_domain *xen_domain =3D dom_iommu(d)->arch.priv;
+	struct iommu_domain *io_domain;
+
+	spin_lock(&xen_domain->lock);
+	io_domain =3D arm_smmu_get_domain_by_sid(d, sid);
+	if (!io_domain) {
+		ret =3D -ENODEV;
+		goto out;
+	}
+
+	smmu_domain =3D to_smmu_domain(io_domain);
+
+	switch (cfg->config) {
+	case ARM_SMMU_DOMAIN_ABORT:
+		smmu_domain->abort =3D true;
+		smmu_domain->stage =3D cfg->config;
+		break;
+	case ARM_SMMU_DOMAIN_BYPASS:
+		smmu_domain->abort =3D false;
+		/* Install stage-2-only config */
+		smmu_domain->stage =3D ARM_SMMU_DOMAIN_S2;
+		break;
+	case ARM_SMMU_DOMAIN_S1:
+		/* Check stage-1 support */
+		if (!(smmu_domain->smmu->features & ARM_SMMU_FEAT_TRANS_S1)) {
+			dev_info(smmu_domain->smmu->dev,
+					"stage-1 not implemented\n");
+			goto out;
+		}
+
+		/* If stage-2 is not supported, configure stage-1 only */
+		if (!(smmu_domain->smmu->features & ARM_SMMU_FEAT_TRANS_S2)) {
+				dev_warn(smmu_domain->smmu->dev,
+						"SMMU does not implement stage-2 translation support. "
+						"Fallback to stage-1-only translation configuration\n");
+			/* Enable Stage-1 translation. */
+			smmu_domain->stage =3D ARM_SMMU_DOMAIN_S1;
+		}
+		else {
+			/* Check nested support */
+			if (!(smmu_domain->smmu->features & ARM_SMMU_FEAT_NESTING)) {
+					dev_info(smmu_domain->smmu->dev,
+							"Nested translation not supported\n");
+					goto out;
+			}
+			smmu_domain->stage =3D ARM_SMMU_DOMAIN_NESTED;
+		}
+
+		/* Enable Stage-1 translation. */
+		smmu_domain->s1_cfg.s1ctxptr =3D cfg->s1ctxptr;
+		smmu_domain->s1_cfg.s1fmt =3D cfg->s1fmt;
+		smmu_domain->s1_cfg.s1cdmax =3D cfg->s1cdmax;
+		smmu_domain->abort =3D false;
+		break;
+	default:
+		goto out;
+	}
+
+	spin_lock_irqsave(&smmu_domain->devices_lock, flags);
+	/*
+	 * TODO: The same Stage-1 configuration is applied to all SIDs
+	 * belonging to this SMMU domain. PCI devices may require different
+	 * Stage-1 configurations for different SIDs, which is not supported
+	 * by the current implementation.
+	 */
+	list_for_each_entry(master, &smmu_domain->devices, domain_head)
+		arm_smmu_install_ste_for_dev(master);
+	spin_unlock_irqrestore(&smmu_domain->devices_lock, flags);
+
+	ret =3D 0;
+out:
+	spin_unlock(&xen_domain->lock);
+	return ret;
+}
+
 static const struct iommu_ops arm_smmu_iommu_ops =3D {
 	.page_sizes		=3D PAGE_SIZE_4K,
 	.init			=3D arm_smmu_iommu_xen_domain_init,
@@ -3287,6 +3400,7 @@ static const struct iommu_ops arm_smmu_iommu_ops =3D =
{
 	.dt_xlate		=3D arm_smmu_dt_xlate,
 	.add_device		=3D arm_smmu_add_device,
 	.remove_device		=3D arm_smmu_remove_device,
+	.attach_guest_config =3D arm_smmu_attach_guest_config,
 };
=20
 static __init int arm_smmu_dt_init(struct dt_device_node *dev,
diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrou=
gh/arm/vsmmu-v3.c
index 5e12d5c587..72f8075e0a 100644
--- a/xen/drivers/passthrough/arm/vsmmu-v3.c
+++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
@@ -324,8 +324,11 @@ static int arm_vsmmu_handle_cfgi_ste(struct virt_smmu =
*smmu, uint64_t *cmdptr)
     int ret;
     /* Only the first 8 bytes of the STE are currently used. */
     uint64_t ste[1];
+    struct domain *d =3D smmu->d;
+    struct domain_iommu *hd =3D dom_iommu(d);
     struct arm_vsmmu_s1_trans_cfg s1_cfg =3D {0};
     uint32_t sid =3D smmu_cmd_get_sid(cmdptr[0]);
+    struct iommu_guest_config guest_cfg =3D {0};
=20
     ret =3D arm_vsmmu_find_ste(smmu, sid, ste);
     if ( ret )
@@ -335,6 +338,21 @@ static int arm_vsmmu_handle_cfgi_ste(struct virt_smmu =
*smmu, uint64_t *cmdptr)
     if ( ret )
         return (ret =3D=3D -EAGAIN ) ? 0 : ret;
=20
+    guest_cfg.s1ctxptr =3D s1_cfg.s1ctxptr;
+    guest_cfg.s1fmt =3D s1_cfg.s1fmt;
+    guest_cfg.s1cdmax =3D s1_cfg.s1cdmax;
+
+    if ( s1_cfg.bypassed )
+        guest_cfg.config =3D ARM_SMMU_DOMAIN_BYPASS;
+    else if ( s1_cfg.aborted )
+        guest_cfg.config =3D ARM_SMMU_DOMAIN_ABORT;
+    else
+        guest_cfg.config =3D ARM_SMMU_DOMAIN_S1;
+
+    ret =3D hd->platform_ops->attach_guest_config(d, sid, &guest_cfg);
+    if ( ret )
+        return ret;
+
     return 0;
 }
=20
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 37c4a1dc82..253f8bb6cb 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -312,6 +312,7 @@ static inline int iommu_add_dt_pci_sideband_ids(struct =
pci_dev *pdev)
 #endif /* HAS_DEVICE_TREE_DISCOVERY */
=20
 struct page_info;
+struct iommu_guest_config;
=20
 /*
  * Any non-zero value returned from callbacks of this type will cause the
@@ -387,6 +388,11 @@ struct iommu_ops {
 #endif
     /* Inhibit all interrupt generation, to be used at shutdown. */
     void (*quiesce)(void);
+
+#ifdef CONFIG_ARM
+    int (*attach_guest_config)(struct domain *d, uint32_t sid,
+                               const struct iommu_guest_config *cfg);
+#endif
 };
=20
 /*
--=20
2.43.0

