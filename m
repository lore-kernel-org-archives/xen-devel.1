Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03386606A335
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2026 16:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=voDaYOFh
Received: from list by lists.xenproject.org with outflank-mailman.1498338.1696164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xURb7-0007sc-O6; Fri, 20 Nov 2026 16:36:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1498338.1696164; Fri, 20 Nov 2026 16:36:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xURb7-0007sT-Kn; Fri, 20 Nov 2026 16:36:25 +0000
Received: by outflank-mailman (input) for mailman id 1498338;
 Fri, 20 Nov 2026 16:36:24 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1xURb6-0007rJ-25
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 16:36:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xURb5-00B9Ev-Er
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 17:36:23 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6b0076eb-2eae-0a2a0a5409dd-0a2a4503e444-40
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 17:36:23 +0100
Received: from [52.101.61.54]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6b007706-fae8-0a2a45030019-34653d36da99-3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 17:36:23 +0100
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by SAAPR03MB282009.namprd03.prod.outlook.com (2603:10b6:802:301::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 16:35:24 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 16:35:24 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dQatoHi67cC6LDp6A1XzQDisYQwyWCReYEBB+uPjqfSD6VoxbM/NGeEpfH0CjknlT8nHWP3A3VGnxy+NBqGABUvBqgxrrtXlr6Tv7N4zToyj1WPMSodc67sa1rx4iz50DcDxF7ckOGwm1ZHVFVpuWHkQXDMKdqqkmuYfuTOk/sQS88NdGGKNOluxs+PQYtPfX82Y3G8h7jI8VTTE/Dut5JGVJPQKsf4nRotCHBoC4RtlHrsSrxorrafqoLQPLvwZzgL6ljIjuCfmbp+Z3Fd8vKEWaiVzTyegBW0I3I4jjmjX4t6N+1a0n0MAnN6SNAh6PPjyXvqm8oTsFjbcmYLnJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MTUuEfUdTpH7urUT7hS7BjH9iloQHfn91d4QiOzn4sc=;
 b=IJohoO+N9VyCzVV3Ex+DPuCov/7vJbq2D2ZbdziUIJhSrfWUJn9yfbmWTE2MkU8sgXadgHVKg2CuYKTzGsFaAKGjn0PiqPbeTFWYeFDnyiwxcaAQ/YRJchg/19TeTaGWpC2OOwNsGrQ83Ig9l6JKNCbOcCaESxCPwrrVl0HRoc83NEWir8BAwp6ZrNGO4LsPR77hnJeQ4xsFv8wewyNAN7kdaMGK4ZM501/zCtTILifl/M1aTLQkbzwBCbHsVvgLk/+hKxSwEXdhYUUMXlmD722EaNa/xRb2Cb+zoiX3ulYJ7ll1N0SFfDsWH4fj5o0Cw++HueGX/l+AbIkIisGZvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MTUuEfUdTpH7urUT7hS7BjH9iloQHfn91d4QiOzn4sc=;
 b=voDaYOFhTLvVrU6KBIvvQYyIvMejBEmxD2JaK67eMQmG2d87ot3ZyT+SNIE6NbYCY1M8iSHZDS0j6bdIE0x1uSbMff2pKH6ZLdonI2V+CsM4WS/SYvj6A9U9ssnZF9oKMXZjsjTROkuMSzO6Bcwlo+UDZPN8EdsHzZFatTBVxEM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v1 0/2] x86/nestedsvm: TPR bugfixes
Date: Fri, 20 Nov 2026 16:35:01 +0000
Message-ID: <20261120163503.1907256-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.56.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0160.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::21) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|SAAPR03MB282009:EE_
X-MS-Office365-Filtering-Correlation-Id: 64e4bab4-cf3f-4cc6-da08-08df472446d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|261021123027099003|261021121427099003|261022105027099003|261028144727099003|261026140227099003|261102123227099003|11063799006|56012099006|10067099003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	hYTukfkHhX5szvyGdxqyKEx3i8luHNqaI/iXz/EM9TPmQ7yAJtDEJoTQFLJ2uHAfIcjXqJvCCL4iHqisEuKNeatjuWhs0bTo7qjKnBxyOWrEVTRwTQkH/riZNKlBCFE1qgu9mNiBfHLqBw+A8cy495Ohi3pn78EMkbbDHQru1QqSeZr7seYXUO7hQ9/R12N5l9Gu1vhpStr0alF6SaxLI0RH5YZG3DjVD7xfCcXOLMIs/UTDi2IWqDpeVXSEfHEgtBPGVG0baCFffWmjU4AG9J1I1V1yoa3z4yJJ13S0Me1Znut0xHl+Lridfj5u/DzZPuwrNaiQjKoDrOzGz+CfWIBEpxz5QjqQvrFCaocZOTTU4zCyiMG2y6MIGOfXETEZ8SYfaYEx50jALo3opdRJGHJCUzeZh1es1n6PZU4wsWLKkaXm/2D6OX4W/X5gmd4RTD2pJ5okzGLsw8yH87fTYR5HqOvLAGKaZ5zAJRX4Q30oijIAM0XwyD/cmbeiinjSOut9fQ687R5onvAIPnWgky8Jn3Hb59HlhXBNfRteSMPOwlDF+ehYWAH2U3WCFIAhBKayUQBGDapkJv0XZwvpAs8UQzprp9bsN6iNTkNoIgzrOdeOu9OYJIxqHub25nRBpHHS0syiFIg6wDMYsnv5L8Ct0ej8VakjU7oKaoBHQvs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261021123027099003)(261021121427099003)(261022105027099003)(261028144727099003)(261026140227099003)(261102123227099003)(11063799006)(56012099006)(10067099003)(261009223027099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?USADfREOKDJ0SzIZMGeewesJpDaUWIJj/GMi23ncAb0QiObzaScDRXRthO+W?=
 =?us-ascii?Q?L2uuN98u1qx+CPnG7LxcycrYH5CodrpCUDkR5LbZOHICA1dS/bwcqhyXRPLW?=
 =?us-ascii?Q?LlcGOsJlCtGWMceek6nc4p1rV8otGpqT/KedCooYM+h3JsbrmLtoE/TcfuUD?=
 =?us-ascii?Q?4pgcKrJtDDFRI7fhSBxGpX/Xj1d2iE8bv6vCx2hmMGOjUzIxYZOYtlydgNcK?=
 =?us-ascii?Q?AZGjyS+U8DuIshcM890LWrZ0BSMYEPwDQtD/WBRPM2qva57wIwEXC5MGb/jR?=
 =?us-ascii?Q?q7yjQgwHrDuEok5vZGpVYnRr5n1gvvBaGdU6xHyf6dA1yfOGMVOfaomcinkP?=
 =?us-ascii?Q?Lp6abmnimvAWAW2agXkRXELyL1Di0AIV1rpU1RA+A4x9LJXBVnUTdLDyRAl9?=
 =?us-ascii?Q?OUfvQPwTFLR12O8JOvqoLsW712FypkKINIX9AgXxZFc1G7cWa495ZXlx16f/?=
 =?us-ascii?Q?Q1ReHBvZeFl05ij10Z2j1fgR7NkFZpFUtZuz4tEneJsiwsCJSnCGvrrgvkSA?=
 =?us-ascii?Q?XbNqR5AJwtiQgtsUdLnKQ0vAka36ipwURA9I+V/A3cQvhxYMQX+PN1d6q76t?=
 =?us-ascii?Q?AGAFd1b7EEBM0CjQy68nmDtsI7Zd6xPpKV4HwhmVz9vmMQexGMfEpqgQCuUc?=
 =?us-ascii?Q?5UYFIG+vvmlJ/f0WG1sW+ZZLqzgo7wpVOOy0YF9e0d7x9VUDAE8belPMHWJ1?=
 =?us-ascii?Q?iYYRoMt20iAEbspNpUqw5TGsZbAKzdZlck15qC5uYVu/aGcgW0JcDMkXqkT1?=
 =?us-ascii?Q?2PcTT3y1g4TEGY7gKLlIL8ukCpcHdrOi4FatC7lhUTBtxIRK6BMc3fFGXR/u?=
 =?us-ascii?Q?y8uQNDk1C6ImYcT1V/LO7R7j+EaVCarY8JLtx2Sj+GAigrUl6UKukmKSvdty?=
 =?us-ascii?Q?1FNMmaJPVgD5O7LWRzLxxGNEm7IdAuvXsshpjtNw0Vav5lDGNiSpsvojyuCy?=
 =?us-ascii?Q?eE+DeH5llE7qhg2Edc6R8Lm1xrKXO2cdC2kbeGyxe9Se/WlSiHZ6kF3YTFtc?=
 =?us-ascii?Q?1ZBrEoD+FoCI5evtwVY4miNCXC1q+ogyNAjiol7VE+rJFrH68LMI5jpyuT86?=
 =?us-ascii?Q?AzbpndStbfBGTVfA5kL1BfxFZcfs/MXciOPZfQaVBwYOohNC5EhgJklN/EjL?=
 =?us-ascii?Q?UEMGMrofyuF4DtpWCFzxxs3ATGjINyKffnydtyGHWDdcNHBWVwT4QE0pieoZ?=
 =?us-ascii?Q?+BUGEtduNXvNEW0OcpaNz9ipwCyMW2mRcDF55rHj1blU4S0hj5Dhb5K2EIxy?=
 =?us-ascii?Q?0kwbotQcT0A9xBXo86ZDP/0Xcl6ipMJ9hOPOvaULC5iDLjJImzp0GbbEqyHQ?=
 =?us-ascii?Q?R5fHyuUKAL+UEe0KQ420lnCDMrB24kUZ+m0b9QduI9pBdckHPkjJ1uj77duu?=
 =?us-ascii?Q?Me7jL+klJTjlSB/281rHVFzHHrzR2PpnmDTA4hlLDGmJ9i9p/jLOrv2fySMP?=
 =?us-ascii?Q?WnXTeC4IrHNVSeu2Me7BprBXu6UaNpXi7j4qzgSGz2iyvkQz5Vo8+ntWdW5m?=
 =?us-ascii?Q?Y+r8loiBFi1R02TAVhFMzo45wYE/J0NPTDZURdcLQDa1Bh+lRI1oer4xU61n?=
 =?us-ascii?Q?JddNowyC0kba52iLEU8109eoIxuGBOAry6Bf8K1m08eO/IPW0xR5Rnz7+Hfk?=
 =?us-ascii?Q?mqLA1jOdudp6clgZNcFSCFvvyWRAzorywXwQLMKDz1wgePgoIQv5a5qAX8To?=
 =?us-ascii?Q?kspzLGLRNZ3KzoKe5Bag336SuaRROlx1HLtaeM9+BMmG1mltWk/v6HmM5jGW?=
 =?us-ascii?Q?uQEufYg/dtdOr57qZqD9lzGmEWfR9Wc=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64e4bab4-cf3f-4cc6-da08-08df472446d6
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 16:35:24.3762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ce8o1aFxN17fkwKVBLh6Nx/jHSkV9T/VZ4Wmz21/IVMopxP5m/A9vSzPDNUQVrYoPhmYTW6eTQdwpaGTBUWMxhJRbiZrjTN5AgHs1Di6HSw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAAPR03MB282009
X-purgate-ID: tlsNG-33051d/1795192583-6C2E04E9-2ED19FF3/0/0
X-purgate-type: clean
X-purgate-size: 562
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

This series fixes a couple of bugs with TPR handling of nested guests.

Thanks,
Ross

Ross Lagerwall (2):
  x86/nestedsvm: Handle CR8 accesses with V_INTR_MASKING=0 correctly
  x86/nestedsvm: Handle L2 writing to the L1 APIC TPR

 xen/arch/x86/hvm/emulate.c       |  1 +
 xen/arch/x86/hvm/hvm.c           |  1 +
 xen/arch/x86/hvm/svm/nestedsvm.c |  3 +++
 xen/arch/x86/hvm/svm/svm.c       | 36 +++++++++++++++++++-------------
 xen/arch/x86/hvm/vmx/vmx.c       |  4 ++++
 5 files changed, 31 insertions(+), 14 deletions(-)

-- 
2.56.0


