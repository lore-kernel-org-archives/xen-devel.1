Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 645ACC98304
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 15:35:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1430908.1653314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9P0Z-0000k1-NN; Wed, 23 Sep 2026 15:35:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1430908.1653314; Wed, 23 Sep 2026 15:35:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9P0Z-0000ju-K5; Wed, 23 Sep 2026 15:35:43 +0000
Received: by outflank-mailman (input) for mailman id 1430908;
 Wed, 23 Sep 2026 15:35:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Bertrand.Marquis@arm.com>) id 1x9P0X-0000jo-Sm
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 15:35:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9P0S-009bbB-9M
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 17:35:41 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6ab3f1a6-8faa-0a2a0a5109dd-0a2a450bc980-44
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 17:35:36 +0200
Received: from [52.101.72.71]
 (helo=AM0PR02CU008.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6ab3f1c7-b7e8-0a2a450b0019-34654847adba-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 17:35:36 +0200
Received: from AS4P191CA0003.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d5::18)
 by AM9PR08MB6052.eurprd08.prod.outlook.com (2603:10a6:20b:2d5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.4; Wed, 23 Sep
 2026 15:35:27 +0000
Received: from AM2PEPF00070CF9.eurprd02.prod.outlook.com
 (2603:10a6:20b:5d5:cafe::3c) by AS4P191CA0003.outlook.office365.com
 (2603:10a6:20b:5d5::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.16 via Frontend Transport; Wed,
 23 Sep 2026 15:35:27 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF00070CF9.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Wed, 23 Sep 2026 15:35:27 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by DB4PR08MB8199.eurprd08.prod.outlook.com (2603:10a6:10:381::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.17; Wed, 23 Sep
 2026 15:34:53 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 15:34:52 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=SNBFrmEeTbVn2m/sxaI0E6dPMvbNPIioFw+2PXzSwvVIbRoqh6i0Cim8C9GxXDXzbipi/zvtarhQtyRPBeQGfUtRA+m2uohlawyP53e9wpaYqSDSwWS8doQbKoPKUT1sxvkU0vDmEsKwu5rolK3SQxKLO8UwSVlchnli34k02zIcBu6XtCAibGL+E7r7h9M8e0dDKopb62p6jWyi4PQWa9JKEueenRHyYPZ4vLIl9vvVTioPP1j6rwd15T6vQExxTqEkQjw2miuBM+m5RbE2fXZlriBGGN1klXLTmD0EnYTV0LecgVpHmEaRmT67y2OeD/c3nEkTkiHXYT7qqG8hxA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gyaXTMpxlPJmtJCjn80suRr8TvenbaZ8yXgtRm2S5k8=;
 b=ZnbOJxNle0JMhnk0u0pivVMxzRKf74ukk9GhX+EuuUJcjLNM+JBqiY1yiDbRrCBh0c+L4yFwPnqgNfXsBq9DjHJjANUHVNRmv18VCcKbha0PCP1NoCTBqTZ3qsEfnrNgd8ObGF23XblkQ96N7avRIslCex7ZTJhBoDGGkmv/7BRvPgo37TPR6e8zmd4k8mFUGWRNYpLdOuOJ59xaXyygiXNglcvKqOMo9jWut9jwYmw1yjueOPnFnlv0q1f6UvPT2cRjpu2094gw8YuqJDG0lfyS7wbYG9QP9lWaVhRyFqQWPEjSqgNDHyf8E3CpG9DhORBrhHXsbyLI0fpVgJn7Og==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gyaXTMpxlPJmtJCjn80suRr8TvenbaZ8yXgtRm2S5k8=;
 b=RhFhqAzekafF+jmhlfoSDmqrNbur/ZuBWvMkANt7MQy5OsBWWhkEQnQpMd/n77yVwyhq8wsg5jRbyi2aGT0Ro94g610e6Nc9PSIGP6rDs0hFNzSM9RUY25DWlHtDCtTPz9iOicD+LmY5dBA2fzVQOJYM7mZmrmlsSgaRxQ69feM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v+SK44WlzRAwLf+H22Hd23+lDqa2S7ygRC/fJYN/tIltxCln8ps4LLA8xgcgsKU54d77uIIsb48kplp1o28y/D0A4VoKjon1wJ5B+Kd6PTSxcnF4xn2RQzXMO03QqZOnKKbMFPkEMdG9/Qleeo7OquldXEF0OBPc6UBjAioiXMh5lKtjpHhe0wRGSroqEFg54/mOtpyBD/Mo8TILtM7s+2hu/mcrT3SQUy+R8XdVHmMJwuh24VMUAEIzY8ATJBRCxDNlhUPDcND0r2YXdHAV9VNd4zN5yTIymbYIsWM7EJBXyJWi4mflv3mfEaUwmNJwFGbmfEzV6ynYsFPnW5TO0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gyaXTMpxlPJmtJCjn80suRr8TvenbaZ8yXgtRm2S5k8=;
 b=wepTQW3qACki8wxIGeYryLJoB5VeX7MlhOiPtOf7MtqYUFfeQBGqMG6Qfnz2Qlo6ipN5nfsZzI1bYZKSNPf0/JPOiRdktgxXGpmYmtN7PaGjIlRsM+M8dLx2zlJskm7tvhswA8KhYBn3/GYbBuPNz+UVgX87sTP2ga0plBlfKGF/E46bnwB8RB3S2cG8ivTs56G+lEVulRfts3o1M4TedOkMAjH8t3NoFbEXzRVMqAS5r2Xq3vblckyL7zb3P65vHiiSTUhmHLCaIHgLDVl13XbgMQCpEss/RWPS/psy9Qk4m5kcb9KhpF91/l0NAz12UfscHXZem1jP9SUN8Bjm5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gyaXTMpxlPJmtJCjn80suRr8TvenbaZ8yXgtRm2S5k8=;
 b=RhFhqAzekafF+jmhlfoSDmqrNbur/ZuBWvMkANt7MQy5OsBWWhkEQnQpMd/n77yVwyhq8wsg5jRbyi2aGT0Ro94g610e6Nc9PSIGP6rDs0hFNzSM9RUY25DWlHtDCtTPz9iOicD+LmY5dBA2fzVQOJYM7mZmrmlsSgaRxQ69feM=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Mykola Kvach <mykola_kvach@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Luca Fancellu <Luca.Fancellu@arm.com>
Subject: Re: [PATCH v12 03/13] xen/arm: gic-v3: tolerate retained
 redistributor LPI state across CPU_OFF
Thread-Topic: [PATCH v12 03/13] xen/arm: gic-v3: tolerate retained
 redistributor LPI state across CPU_OFF
Thread-Index: AQHdNjDlOJD2OeV6HEaZdpj45JQE7rbcdbQA
Date: Wed, 23 Sep 2026 15:34:52 +0000
Message-ID: <427F337F-4D3C-4DEE-9978-5B1AD3AB23D5@arm.com>
References: <cover.1787838455.git.mykola_kvach@epam.com>
 <54a655ad51d994b46dff43e67c969a31772cec4b.1787838455.git.mykola_kvach@epam.com>
In-Reply-To:
 <54a655ad51d994b46dff43e67c969a31772cec4b.1787838455.git.mykola_kvach@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.700.51.1.1)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|DB4PR08MB8199:EE_|AM2PEPF00070CF9:EE_|AM9PR08MB6052:EE_
X-MS-Office365-Filtering-Correlation-Id: fae6f32a-cd10-4aa1-6428-08df19884afc
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|38070700021|4143699003|56012099006|11063799006|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info-Original:
 pUmXKmnDUvRK35o66EAgG14yVQQf2FNSYrq4MdlIdZzffU/oZCAANdQOf507+qUDYDT3Hbe8w15NNQIz1ZO7gF5ehgAaCYU9QXF3bGdKMZuf8NaaAPvEuDHq2Gt1iB3TwiijIIdr8lWNqSUucpzAPWCKqZ/EHb387FuQWAQbYvKK5K94fafHir960rcZS8Z1PqR6BqQZiMTP9ng4xJJhqBiY7J9LiqYG8zzGa+P/KH2nQASf0vEqZGXrp44SLUfRqMW1sYgQMhR2IP9kFJpkbM50Ov8d/M/UECZ7ncTMdfPXDil5uLaQbrWLZzy7p4SNSKtLwgKQDBVmUjwCeHXp5n8c21ssy6M/8PQ/ap7FNT0O4rVoce7ckMhHsYf08FukBz58ds+3UktBDcowrpYXlNUC8kbK4YKL6VSj3TC0PVxUjo7hlO6IXMmzw93b2Y6bCGkX3ombOwEyl2tCG7hgjeZcLoZlt7Baxu+eetW3t1RIj1IEFjwmxu/tuKMK+ruwE7E1M8bo8nGHLoghOLcGNRmTb6cFDHcq1TaDtnkUtw7oJgZODj5rK2g3A2bi5EjWB2i38HzwPvnSSjDmnbvyeU4xxBpaqji7hvAQuYYXvsSWQFS3yxS7mBA2T+6OY3yIAmts0PBc2fcJlcALsHKRpFf1ykZYXztvRt5HBdQ9MZcKafFiwD8sWj6I+Ajq/IkOwm+EQYQquJ33FG935JOUUJRqrUH9sHzOSJjBz6siNWM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(38070700021)(4143699003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <93EB5DD7D5002745A6D637CD328AA19F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 zJU1PI+pz7/4TmEnMhGnCXPzX0wA//u12nUVSGHlzrfhCbqW6JhjpLE6zNhNVqcra20mqtorxusdKJzImbrXaNM3iDfm+VbuFpVA2AuBhOompv2oif9XBCAXbdBxVAUFKmF6KskEQQF82FCs6tjo1UtygD5DuGQqaJ1U8nfMg1DM22PlolEj0V3uPvmHbVT5jVqE1xSpP5HjdpqFHhiBrGrWESd9MlCQdnF4eAYeITx4hZRlVM+i1chjDn6STFfiiWYY3JydXQ5BuwrR7RcFT5OnbSNU+Roex0sHIazphYUeL9q7d7wv4LqQJVDugvBKXYMDxW8PHNIKUmTYr1kmuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8199
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF00070CF9.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7c954f10-4c2f-4b9f-f0e4-08df19883652
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|14060799003|82310400026|36860700016|35042699022|23010399003|10067099003|6133799003|22082099003|4143699003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	f93ZFnDorHMrjGRSyPfLHd0hsbmXjUZMkC/mVEgx6Vw9tI4cFb5PKVOyfV/TzEgs61bl+iVv6u15J1MSid3SpdCoYASGO18OGln6Z4N1EXIaqoA5Y4Ft/vfJT2sT8pHUYbtlxG65TbptJk/m6NhLSk5+8zI7M6KSNOkaWcHolEJOHzZa/aPMNyMWzlV8V2wjt4JEaYPEwutvZNLqxhN9lR4ai4YziYSU8RpD2+/5DKOAMZe+bnqQcIc7rQiLKLSY5tyY2ajzC+sFGE2Z8N9wzwo/VP+5ZXauooslJu9XJ0/7int3EI4gSkOgF3PcXdbatryfWusQBGGN/GqmU3ofuf7T4b1jdHFggnMG0JESP1hrbhQ96J9mlFWaxqxCN9Fwe27q8+QnLg0zV/8R0ZKGT7KOE5MqBI783zBbhanm/9jzGW2c/9k7WbIuQuXRbx07L8eRrVT15UcTzjjDPN1o0d5LypEn7k50MnO4MKsb7pvxqXOU2hm+/ZUDHR+6vLvvGjKqurtPP5W1Bx69as2nGgazp5aanUlEWNPEylh5Ob5QHpcVLKVbH8S0brdl587kfJh2qpfe3PRbD8S5KclTEFhPDllcl3fPCiiLmWfaDw13yjXYeqReEKVMR+p9+dQCHNkGWeB8LtdF5HuUHBIgU7uOrc8ACWYWR5VWzIbUr0BiFoGWvXMXq0BO+p7kaxm1YMgdEjs3Z3EjLfXEXRnfnA==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(14060799003)(82310400026)(36860700016)(35042699022)(23010399003)(10067099003)(6133799003)(22082099003)(4143699003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	h4xQVibo54IQf/9hzvWlrA1iHBad2gatx2uHfhgtkF7S9ud9Hexc5EnciwgiLI75PO6XLBrIWOYzFS/7p+xZYQkZGaBCO+Z3ykw939T7UZKaxdlPrDPdy/K491b5+2eECRPoTzvq0GcCZc9sUJupUY0keaR3Uc3S/Oy5kvD4xMMlbkV2+h7pdPV2jtyDRh8ghR+VkShGJIRMNI0isDa45ffn+1gs4BQldw6ts73OMCubu+V+GFEwW3JaWNBP4xpUdz4asyzEm4ZPnepgefMsWLsjjx76WZQzIySaKmRBGbsZA4f04QN5ldVQbx6I04894A6T9IOU8Pzj/Csi9jLjAO6GXXOLZwOzo+WQ42Y2ytlY9kXbVaHCbv1g1ufYu6H/W55hUHU6MP/BMgEPO+ouTo0AUm4oH3P+shng08We7C7/VeiVszUPH6WKCh5f3Xl8
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 15:35:27.3173
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fae6f32a-cd10-4aa1-6428-08df19884afc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF00070CF9.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6052
X-purgate-ID: tlsNG-42698a/1790177736-AAAD89EA-1943ABA5/0/0
X-purgate-type: clean
X-purgate-size: 10855

Hi Mykola,

> On 27 Aug 2026, at 16:31, Mykola Kvach <mykola_kvach@epam.com> wrote:
>=20
> PSCI does not guarantee that a GICv3 redistributor is powered down across
> CPU_OFF -> CPU_ON.
>=20
> DEN0022F.b says CPU_OFF powers down the calling core (5.5) and CPU_ON
> brings the core back with a defined initial CPU state (5.6, 6.4).
> However, PSCI leaves interrupt migration and GIC re-initialization to the
> supervisory software/firmware stack: the caller must migrate interrupts
> away before CPU_OFF (5.5.2), and the execution context that is lost in a
> powerdown state must be saved and restored by software (6.8). PSCI also
> calls out GIC management explicitly in 6.8, including retargeting SPIs,
> preventing PPIs/SGIs from targeting a powered down CPU, and reinitializin=
g
> the CPU interface after CPU_ON.
>=20
> This matches the GIC architecture. IHI0069H.b Chapter 11.1 requires the P=
E
> and CPU interface to share a power domain, but explicitly allows the
> associated redistributor, distributor, and ITS to remain powered while th=
e
> PE and CPU interface are off. All other GIC power-management behavior is
> IMPLEMENTATION DEFINED. DEN0050D Chapter 4.2, "Generic Interrupt
> Controller (GIC)", says the GICv3 redistributor may live either in the AP
> core power domain or in a relatively always-on parent domain. So after
> CPU_OFF -> CPU_ON a secondary CPU can legitimately come back to a live
> redistributor with GICR_CTLR.EnableLPIs still set.
>=20
> Handle that case in the LPI setup path instead of assuming a fully reset
> redistributor.
>=20
> The LPI path needs special care because the GIC spec makes redistributor
> LPI state sticky and partially implementation defined. IHI0069H.b 5.1.1
> and 5.1.2 say that changing GICR_PROPBASER or GICR_PENDBASER while
> GICR_CTLR.EnableLPIs =3D=3D 1 is UNPREDICTABLE. After clearing EnableLPIs=
,
> software must wait for GICR_CTLR.RWP =3D=3D 0 before touching the pending
> table. The architecture also permits implementations where, once
> EnableLPIs has been set, clearing it again is not guaranteed to work.
> Where an ITS is present, the spec strongly recommends moving LPIs to
> another redistributor before clearing EnableLPIs.
>=20
> Because of that, treat a retained EnableLPIs state as valid when the
> redistributor still points at Xen's expected PROPBASER/PENDBASER tables.
> Only try to clear EnableLPIs when the retained configuration does not
> match Xen's state, and wait for RWP before reprogramming the tables.
>=20
> This is also consistent with platform firmware reality: PSCI and the GIC
> architecture allow platform-specific redistributor power handling, and no=
t
> all platform firmware implementations force a full redistributor power-of=
f
> through implementation-defined controls during CPU_OFF. Xen therefore nee=
ds
> to tolerate retained redistributor state on secondary CPU bring-up.
>=20
> Keep gicv3_populate_rdist() resident as well, because gicv3_cpu_init()
> reuses it on secondary CPU bring-up after init.
>=20
> Tested using Xen's non-boot CPU disable/enable path on Arm
> FVP_Base_RevC-2xAEMvA, both with and without:
> -C gic_distributor.allow-LPIEN-clear=3D1
> -C gic_distributor.GICR-clear-enable-supported=3D1
> and on Orange Pi 5.
>=20
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> Changes in v10:
> - Drop unrelated gicv3_populate_rdist() printk() format cleanups to keep
>  the patch focused on retained redistributor LPI state.
>=20
> Changes in v9:
> - move gicv3_do_wait_for_rwp prototype from its related header to gic.h
> - drop __init from gicv3_populate_rdist(), which is reused on secondary
>  CPU bring-up after boot
> - changed print format for smp_processor_id in gicv3_populate_rdist func
> - cosmetic changes
> ---
> xen/arch/arm/gic-v3-lpi.c      | 77 +++++++++++++++++++++++++++++++++-
> xen/arch/arm/gic-v3.c          | 15 ++++---
> xen/arch/arm/include/asm/gic.h |  4 ++
> 3 files changed, 90 insertions(+), 6 deletions(-)
>=20
> diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
> index 9ee338edc2..847da26ff7 100644
> --- a/xen/arch/arm/gic-v3-lpi.c
> +++ b/xen/arch/arm/gic-v3-lpi.c
> @@ -81,6 +81,13 @@ static DEFINE_PER_CPU(struct lpi_redist_data, lpi_redi=
st);
> #define MAX_NR_HOST_LPIS   (lpi_data.max_host_lpi_ids - LPI_OFFSET)
> #define HOST_LPIS_PER_PAGE      (PAGE_SIZE / sizeof(union host_lpi))
>=20
> +#define GICR_PROPBASER_XEN_MASK  GENMASK_ULL(51, 12)
> +/*
> + * For retained redistributor state, match the pending table by address =
only.
> + * Attribute bits such as PTZ may not read back with the programmed valu=
e.
> + */
> +#define GICR_PENDBASER_XEN_MASK  GENMASK_ULL(51, 16)
> +
> static union host_lpi *gic_get_host_lpi(uint32_t plpi)
> {
>     union host_lpi *block;
> @@ -296,6 +303,60 @@ static int gicv3_lpi_set_pendtable(void __iomem *rdi=
st_base)
>     return 0;
> }
>=20
> +static uint64_t gicv3_lpi_expected_proptable(void)
> +{
> +    return virt_to_maddr(lpi_data.lpi_property);
> +}
> +
> +static uint64_t gicv3_lpi_expected_pendtable(void)
> +{
> +    return virt_to_maddr(this_cpu(lpi_redist).pending_table);
> +}
> +
> +static bool gicv3_lpi_tables_match(void __iomem *rdist_base)
> +{
> +    uint64_t propbase, pendbase;
> +
> +    if ( !lpi_data.lpi_property || !this_cpu(lpi_redist).pending_table )
> +        return false;
> +
> +    propbase =3D readq_relaxed(rdist_base + GICR_PROPBASER);
> +    pendbase =3D readq_relaxed(rdist_base + GICR_PENDBASER);
> +
> +    return ((propbase & GICR_PROPBASER_XEN_MASK) =3D=3D
> +            (gicv3_lpi_expected_proptable() & GICR_PROPBASER_XEN_MASK)) =
&&
> +           ((pendbase & GICR_PENDBASER_XEN_MASK) =3D=3D
> +            (gicv3_lpi_expected_pendtable() & GICR_PENDBASER_XEN_MASK));
> +}
> +
> +static int gicv3_lpi_disable_lpis(void __iomem *rdist_base)
> +{
> +    uint32_t reg =3D readl_relaxed(rdist_base + GICR_CTLR);
> +    int ret;
> +
> +    if ( !(reg & GICR_CTLR_ENABLE_LPIS) )
> +        return 0;
> +
> +    writel_relaxed(reg & ~GICR_CTLR_ENABLE_LPIS, rdist_base + GICR_CTLR)=
;
> +
> +    /*
> +     * The spec only guarantees programmability when we have observed th=
e bit
> +     * cleared. Where clearing is supported, RWP must reach 0 before tou=
ching
> +     * PROPBASER/PENDBASER again.
> +     */
> +    wmb();
> +
> +    ret =3D gicv3_do_wait_for_rwp(rdist_base, GICR_CTLR_RWP);
> +    if ( ret )
> +        return ret;
> +
> +    reg =3D readl_relaxed(rdist_base + GICR_CTLR);
> +    if ( reg & GICR_CTLR_ENABLE_LPIS )
> +        return -EBUSY;
> +
> +    return 0;
> +}
> +
> /*
>  * Tell a redistributor about the (shared) property table, allocating one
>  * if not already done.
> @@ -374,7 +435,21 @@ int gicv3_lpi_init_rdist(void __iomem * rdist_base)
>     /* Make sure LPIs are disabled before setting up the tables. */
>     reg =3D readl_relaxed(rdist_base + GICR_CTLR);
>     if ( reg & GICR_CTLR_ENABLE_LPIS )
> -        return -EBUSY;
> +    {
> +        if ( gicv3_lpi_tables_match(rdist_base) )
> +            return -EBUSY;

I am wondering if there is a corner case when a CPU is unplugged and then
plugged back in. free_percpu_area() eventually frees the per-CPU area
containing lpi_redist.pending_table, but not the table itself. On the next
cpu_up(), gicv3_lpi_allocate_pendtable() allocates a new table, and I canno=
t
find where the old one is freed.

If the redistributor kept EnableLPIs=3D1 and GICR_PENDBASER pointing to the
old table, wouldn't gicv3_lpi_tables_match() fail?=20

What will happen if EnableLPIs cannot be cleared ? (i think this is somethi=
ng
possible in the hardware).=20

Cheers
Bertrand

> +
> +        ret =3D gicv3_lpi_disable_lpis(rdist_base);
> +        if ( ret =3D=3D -EBUSY )
> +        {
> +            printk(XENLOG_ERR
> +                   "GICv3: CPU%u: LPIs still enabled with unexpected red=
istributor tables\n",
> +                   smp_processor_id());
> +            return -EINVAL;
> +        }
> +        if ( ret )
> +            return ret;
> +    }
>=20
>     ret =3D gicv3_lpi_set_pendtable(rdist_base);
>     if ( ret )
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index acdac22953..b16888ad84 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -275,7 +275,7 @@ static void gicv3_enable_sre(void)
> }
>=20
> /* Wait for completion of a distributor/redistributor change */
> -static void gicv3_do_wait_for_rwp(void __iomem *base, uint32_t rwp_bit)
> +int gicv3_do_wait_for_rwp(void __iomem *base, uint32_t rwp_bit)
> {
>     uint32_t val;
>     bool timeout =3D false;
> @@ -299,17 +299,22 @@ static void gicv3_do_wait_for_rwp(void __iomem *bas=
e, uint32_t rwp_bit)
>     } while ( 1 );
>=20
>     if ( timeout )
> +    {
>         dprintk(XENLOG_ERR, "RWP timeout\n");
> +        return -ETIMEDOUT;
> +    }
> +
> +    return 0;
> }
>=20
> static void gicv3_dist_wait_for_rwp(void)
> {
> -    gicv3_do_wait_for_rwp(GICD, GICD_CTLR_RWP);
> +    (void)gicv3_do_wait_for_rwp(GICD, GICD_CTLR_RWP);
> }
>=20
> static void gicv3_redist_wait_for_rwp(void)
> {
> -    gicv3_do_wait_for_rwp(GICD_RDIST_BASE, GICR_CTLR_RWP);
> +    (void)gicv3_do_wait_for_rwp(GICD_RDIST_BASE, GICR_CTLR_RWP);
> }
>=20
> static void gicv3_wait_for_rwp(int irq)
> @@ -863,7 +868,7 @@ static bool gicv3_enable_lpis(void)
>     return true;
> }
>=20
> -static int __init gicv3_populate_rdist(void)
> +static int gicv3_populate_rdist(void)
> {
>     int i;
>     uint32_t aff;
> @@ -931,7 +936,7 @@ static int __init gicv3_populate_rdist(void)
>                     gicv3_set_redist_address(rdist_addr, procnum);
>=20
>                     ret =3D gicv3_lpi_init_rdist(ptr);
> -                    if ( ret && ret !=3D -ENODEV )
> +                    if ( ret && ret !=3D -ENODEV && ret !=3D -EBUSY )
>                     {
>                         printk("GICv3: CPU%d: Cannot initialize LPIs: %u\=
n",
>                                smp_processor_id(), ret);
> diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gi=
c.h
> index 29bb9a89a4..68003ab116 100644
> --- a/xen/arch/arm/include/asm/gic.h
> +++ b/xen/arch/arm/include/asm/gic.h
> @@ -301,6 +301,10 @@ extern int gicv_setup(struct domain *d);
> extern void gic_save_state(struct vcpu *v);
> extern void gic_restore_state(struct vcpu *v);
>=20
> +#ifdef CONFIG_GICV3
> +int gicv3_do_wait_for_rwp(void __iomem *base, uint32_t rwp_bit);
> +#endif
> +
> #ifdef CONFIG_SYSTEM_SUSPEND
> /* Suspend/resume */
> extern int gic_suspend(void);
> --=20
> 2.43.0
>=20


