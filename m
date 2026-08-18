Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD2AC5DF80
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 08:48:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393702.1632554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwFUr-0008LM-UD; Tue, 18 Aug 2026 08:48:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393702.1632554; Tue, 18 Aug 2026 08:48:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwFUr-0008I0-Ij; Tue, 18 Aug 2026 08:48:37 +0000
Received: by outflank-mailman (input) for mailman id 1393702;
 Tue, 18 Aug 2026 08:48:35 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1wwFUp-0007fc-NA
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 08:48:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwFUp-008KNP-3T
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 10:48:35 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6a841c5b-2eae-0a2a0a5409dd-0a2a4502b71e-34
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 10:48:35 +0200
Received: from [52.101.65.110]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6a841c5f-6ca4-0a2a45020019-3465416e3afa-10
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 10:48:34 +0200
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by GVUPR03MB11425.eurprd03.prod.outlook.com
 (2603:10a6:150:362::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 08:48:31 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%4]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 08:48:31 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XTkMQo97HukRcTjjrOdCPFZAOTEcKLCdic5vYcGQKu91E+T0Qk239U5V8xAUxv7fIVD6Fo3zGFYBWwxLXfIZGw/ScR/RFh+tmIHijEn4dCttTZcUimG8wh5uS6dPsGLG0XyqOFUj5LadN3UGA1CcDcDjm9wUWlAOiIbUW1BggTOX1OuVCSiD4eENIlpAlBRlzo9bHhNO+IYc+HkAas7ljEp2arLamFw+7Ygk4xZK7acPMIRUWAsC82FiTNhMeIlJaTlRP9qUS2dLBxH/0PdFrYmehFUZGFbjutwEFyKOVzjKKZYJH5E+5CBG6yDJbcrIiqGiJ4qmXCeDvZelCToFrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k7+zNs5V3iR8FEEzs42eWXELhKzBBEEuVxpRSiUeRFY=;
 b=anZ6wV0bEIGfd4IZ5l1q5vojvSbApI/gp06fVrTsDrif4KNbsjp61GRGnRc0cpilZhfap+m3i98j2RtcOJrgBPN/jzVuthJlQEeD6Fa5uSto1P3jRF1wOxVAgFUtZ4yPXr5CiSsB/bVD3jmgkZV3yRh403BOgbElTwyeTk7d17TfghakBKMdjGcOTRP7QoqASCsuIf277OvVDKPkwUFT9Zn9WGqYgri7UrH0ECVeJoSdDUo2zvh6OG6FTww9pJoftIFNT6rZHhHUBT2ed9V3F5Rwdh6g3JCEsyGIf875pVOVGbyjM0kprBfIcfJD3gtv3cBTKHqAykvZdwi3qYf4Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k7+zNs5V3iR8FEEzs42eWXELhKzBBEEuVxpRSiUeRFY=;
 b=W4tTvG1YWsrxDEwpGu8TEG/9YMQfKpabcvlJLV+SlDa22u+/NvTMfEBvMVVdXEBAU7jataHMlo6teGVNTtsvCFRbKario74J1aUqiUFpv6UdnSnZ41z8EAngOwCjNswAqeo0h6Kz9GPRNuWVwPyQbrPQsLtgGEhrq5H5dP1jGAkt9Wd1twOcXN77eAIAggCHUs75vYIt/AwVZMtqhVeXqbCSkClbK/y/t15R0XeU0/PsRTNHZgEgqiur1U3GjNJY0Lqy0LEfmpdsuGcibNnzKfhFUVCqtsTcCpxHjTSsmLeTR+9r39+6EppngH2wT1/mmJBoPx5yI2W5Z0RIdms57A==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v9 6/6] docs: Document CPU hotplug
Thread-Topic: [PATCH v9 6/6] docs: Document CPU hotplug
Thread-Index: AQHdLu5YUFC+BXJe80SorzYjSmg7Eg==
Date: Tue, 18 Aug 2026 08:48:31 +0000
Message-ID:
 <70484b3362f3b816bf4ed5f70c374c198a8a6eea.1787042017.git.mykyta_poturai@epam.com>
References: <cover.1787042017.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1787042017.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|GVUPR03MB11425:EE_
x-ms-office365-filtering-correlation-id: 8133ac73-a04d-475a-a03c-08defd057b2d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|10067099003|56012099006|6133799003|11063799006|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 KjbZAH/XJGRhbvE2b+wzOnWzCRJUCCj8b3hdnGrfp9iPE8u0bslYAWsS2yQZAfNbO7s87bP0B1wR3plVBxTffTSEU/wWWympZAeLMKRq0hwIbkFln3M/CFx/wvgnUgwUBDXp2qexHIo4lhO6aeDsE1/3tWw9aeazAUALAXTUsefnhDU7gtokXeuPWBWcl8i4Kp+trNiFgUNvPKQpKhQgEiOrLVgzSgiatM7iJLJ06/xBbNrAowNCqgd5DdzYV/oJCthS5ZWA/3eJgtIBVngR/KY47A9ayZ8z7yXpVpvYeJfWjfrmH4qDE030b3XTmOx8bpsByeZKQIIz+Y8P2CCsw8JYWW2g286o/Q77UmUTMMGHQQ0YWZgddDMTt3rSaPEoY/FVQXV+jPkWT6aDnKOuH/PJxqbJC/hm06WaJD40KbzjsYUCMdUkuYX+kv2QSDaBBsUAiUKEv1720Nm+2/sAJpZqgracP0qkb9tBJPcuBLodLp8cNZdwmwOagU2bC+okDcKOGAwgIO/+qthmBPu1UoESSUafS/7kJWcG0YSJ8LtLNV1XchmArd3gi2an/wY6kieBkl2vKcXuYKY8V1SkLJonZgCjoS0Wo87l6JwpCU9Din2tIgai15j3HC4Wrvi/H1EQ53kPeJrLke3UmZVD8O9okfra+iP8VeJskNJSO/ZNEBL9s4MIgQr4MMIsBq/gT4CKJLFfGUdgPw2GnkdkRFgCnyw6JvaVZV4/6ajdKuI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(10067099003)(56012099006)(6133799003)(11063799006)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?2ojB5AR8Ck8eXZFBdYgtzZcSvfFQwhP7HrAIWzcZpNMZfCOjTXV0HKAmYp?=
 =?iso-8859-1?Q?PWg20PJzYzp44zH5IthV2jB2DDJ8mSH3QZH0VEeNVtwQ1X78AQbyjV3JaA?=
 =?iso-8859-1?Q?U4woDs2+HCfcT6a/vOaJX8WQIkee4bV2/JEBDZ/o65PzD/rzllsKSMWNBJ?=
 =?iso-8859-1?Q?pp6//ilsWm9XU9eAYE6WuJQ6fJYC7dzJuojJ4lBjgIiuN10iVy9DOoPASo?=
 =?iso-8859-1?Q?FmhRJRiSjUvjKqMMnxVYp2ODSnFn5Z+RiRyDpo0WH26MO34KyuefvwXgzD?=
 =?iso-8859-1?Q?abzG4zZYkBnTE27/17TGWKTp9kkV0wwZJE0sz8tQgGDh/zjsViiPzCgIlM?=
 =?iso-8859-1?Q?iIk4dPnpsUaQwwJ0Xai86fvdO4hs/UZDqLCxpwHmMkLcFiLYYqwzIWzjeX?=
 =?iso-8859-1?Q?y40qodwAXR3qCmmP1sdtOdMNIhsOZtc6w/Ge8HNPPMcqWfY7RNbxL88ML1?=
 =?iso-8859-1?Q?5njX4ozlCFwcMgljC5rl/+7+0MG+23eCMYc1gEyu/KcojFAPc79ffdcci1?=
 =?iso-8859-1?Q?q56e0E/rj8fWgITUIHsQsMpFdZuP8ndW6rp7jl9HL9jG5gYacf0lLGXzCC?=
 =?iso-8859-1?Q?RJ2dgorp3genXpNQltkMAykn8+ZdGj8zpe2MtWEtg6M1qkBf82VCj6ioi4?=
 =?iso-8859-1?Q?DSCT880TbCyal+FH/hYwPGktAsbW8ar+9hb1gCcBkwZymBGlemNA+wtqLz?=
 =?iso-8859-1?Q?BMBp5YrZZV9Q1HWxlnSNebi2VgOBUxzstYiHjvl9Dl5ndD94qRrr/qSKWc?=
 =?iso-8859-1?Q?IV6M3IvphmeIWTlqHw4egeetbtYy2xjfZjbfHyACqW/QQZkZ3QhaC4BUrU?=
 =?iso-8859-1?Q?iK/31PilvQy/xfmn30wsRnb3ZcDP4AjbsEiegMI6kPYuOF/Ylyl5sT+mGU?=
 =?iso-8859-1?Q?ur0+f/Eu3tOpwO6j49nL0lbhRz3HQ9jx2cr5m0z60AEqS2Xjyp4J+Y4g8e?=
 =?iso-8859-1?Q?VjeGooE7hozUqjiNkgPc2rDZTgl3gOQ6YHHeN+nfjPT5uul9dMeRU7dCXL?=
 =?iso-8859-1?Q?PTADF4JkTXYCLThvZ/VOmT2m1/utHR01M+zj2Mqo1puK4pGXR8J0kBqIPQ?=
 =?iso-8859-1?Q?PpUQryTKqposD8BEAx6QKOF9WldtZjXa5j9l05akFvJNNDhldrN+dsdRra?=
 =?iso-8859-1?Q?qss3YqS5GuHqZ1GUyNw8hH6c8qzB7LApCgb1fBje+rY6P8eqbN9T8UOHOV?=
 =?iso-8859-1?Q?1m5y7D36pNM7qMuqr+T7l7xxwMLYhgJBwfFXje+gMOkPaUlTktgHubON4y?=
 =?iso-8859-1?Q?MrBNXAomnvGT03weC7Kq1OyM1cHgN1fKRUAPHInyrreVRctQxgPC4n9rHa?=
 =?iso-8859-1?Q?Fw9czuYKPUq/jQ42Gv1qZjXXuUCnXaFf+SSVwqbpSvaCWbGe2EarCs26Se?=
 =?iso-8859-1?Q?Cc//wtBTRGqzRG2qrCe/WtGkcdHUYZKhkL6MdE4phdhbR4ZruvJsG1ZyaT?=
 =?iso-8859-1?Q?OXnvsJLCTBP/XyaBySDy1o93xyD/QY2ZO05urnWKWkKG2sCVsGvK1cvEiI?=
 =?iso-8859-1?Q?D+A0qlYVeC77P/pTfnz26UBBTVMIRWmQR/gYpTt4xYQz5ux6w0WoqSQHot?=
 =?iso-8859-1?Q?rLBU+OL7bv0rvlIBKL/+9bMUWhPc5BzA/yykUmdDLRT6piFKR7GZnLDLco?=
 =?iso-8859-1?Q?LbZXF6a1STSJQHKlnfkvYci6f2p2yDj2o+SBAxey0pegHA5tQp0eoZeRCW?=
 =?iso-8859-1?Q?xqXyZ8fqbS+VPbo7fzJS/XfX4SRptJAZ1yiWW05njegBdrrP6bEH1vG+f+?=
 =?iso-8859-1?Q?lLyAGw9hSZpBgo7VS1thDuAsPBqPLbxBjWID3ET6BTHmqLM0BUSEVq4bDq?=
 =?iso-8859-1?Q?sLw4A9XmwBKj7ArB+B/I1K4mWbRmKMI=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8133ac73-a04d-475a-a03c-08defd057b2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2026 08:48:31.5978
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hc7tdIsq4js1AKsZm7JjgQV0H93WsuumKyf/MjUwtTMW31iBFdJ4DJY24MHIuHUBQeOqtbX9yZbmIvnVrA+qeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVUPR03MB11425
X-purgate-ID: tlsNG-720697/1787042915-F12A12AC-A8ED2642/0/0
X-purgate-type: clean
X-purgate-size: 4120

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
v8->v9:
* fix typos

v7->v8:
* remove support status update
* update config option name

v6->v7:
* add testing and limitations

v5->v6:
* no changes

v4->v5:
* s/supported/implemented/
* update SUPPORT.md

v3->v4:
* update configuration section

v2->v3:
* patch introduced
---
 docs/misc/cpu-hotplug.txt | 98 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)
 create mode 100644 docs/misc/cpu-hotplug.txt

diff --git a/docs/misc/cpu-hotplug.txt b/docs/misc/cpu-hotplug.txt
new file mode 100644
index 0000000000..4f6068db30
--- /dev/null
+++ b/docs/misc/cpu-hotplug.txt
@@ -0,0 +1,98 @@
+CPU Hotplug
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+CPU hotplug is a feature that allows pCPU cores to be added to or removed =
from a
+running system without requiring a reboot. It is implemented on x86 and Ar=
m64
+architectures.
+
+Implementation Details
+----------------------
+
+CPU hotplug is implemented through the `XEN_SYSCTL_CPU_HOTPLUG_*` sysctl c=
alls.
+The specific calls are:
+
+- `XEN_SYSCTL_CPU_HOTPLUG_ONLINE`: Brings a pCPU online
+- `XEN_SYSCTL_CPU_HOTPLUG_OFFLINE`: Takes a pCPU offline
+- `XEN_SYSCTL_CPU_HOTPLUG_SMT_ENABLE`: Enables SMT threads (x86 only)
+- `XEN_SYSCTL_CPU_HOTPLUG_SMT_DISABLE`: Disables SMT threads (x86 only)
+
+All cores can be disabled, assuming hardware support, except for the boot =
core.
+Sysctl calls are routed to the boot core before doing any actual up/down
+operations on other cores.
+
+If there are Xen-bound interrupts pinned to the pCPU being offlined, they =
will
+be automatically migrated to other online pCPUs. Interrupts used by guest
+domains are handled by the scheduler when it reschedules the vCPUs to a ne=
w,
+online, pCPU. When a pCPU is being onlined, some Xen-bound interrupts will=
 get
+redistributed to the newly onlined pCPU to prevent imbalance.
+
+If pCPU being offlined has some vCPUs pinned to it, they will be automatic=
ally
+unpinned and migrated to other online pCPUs.
+
+Limitations
+-----------
+
+On Arm64 cpu hotplug is currently not compatible with ITS, due to an issue=
 with
+the redistributor assignment.
+
+On Arm64 there can be problems with FFA if secure FW supports the notifica=
tion
+ABI, and with TEE, as both use non-static IRQ actions.
+
+Configuration
+-------------
+
+The presence of the feature is controlled by CONFIG_CPU_ONLINE_OFFLINE opt=
ion.
+It is enabled by default on x86 architecture. On Arm64, the option is disa=
bled
+by default and marked as EXPERT. xen-hptool userspace tool is built
+unconditionally.
+
+Usage
+-----
+
+Disable core:
+
+$ xen-hptool cpu-offline 2
+Prepare to offline CPU 2
+(XEN) Removing cpu 2 from runqueue 0
+CPU 2 offlined successfully
+
+Enable core:
+
+$ xen-hptool cpu-online 2
+Prepare to online CPU 2
+(XEN) Bringing up CPU2
+(XEN) GICv3: CPU2: Found redistributor in region 0 @00000a004005c000
+(XEN) CPU2: Guest atomics will try 1 times before pausing the domain
+(XEN) CPU 2 booted.
+(XEN) Adding cpu 2 to runqueue 0
+CPU 2 onlined successfully
+
+Disabling a core with pinned vCPUs:
+
+$ xl vcpu-pin 0 3 3 3
+$ xl vcpu-pin 0 2 3 3
+$ xl vcpu-pin 0 1 3 3
+$ xl vcpu-pin 0 0 3 3
+$ xen-hptool cpu-offline 3
+Prepare to offline CPU 3
+(XEN) Breaking affinity for d0v0
+(XEN) Breaking affinity for d0v1
+(XEN) Breaking affinity for d0v2
+(XEN) Breaking affinity for d0v3
+(XEN) Removing cpu 3 from runqueue 0
+CPU 3 offlined successfully
+
+Testing
+-------
+
+The CPU hotplug feature has been tested on both x86 and Arm64 QEMU setups =
and on
+R-Car Gen5 (Arm64) hardware.
+
+The tests included:
+- Offlining and onlining cores with no pinned vCPUs
+- Offlining cores with pinned vCPUs
+- Offlining cores with Xen-bound interrupts
+- Offlining all cores except the boot core
+- Offlining the boot core (expected to fail)
+- Enabling and disabling SMT threads (x86 only)
+- Offlining cores to which guests with passthrough devices are pinned
--=20
2.55.0

