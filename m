Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FA2606A338
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 16:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=ET1SotIP;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=ET1SotIP
Received: from list by lists.xenproject.org with outflank-mailman.1491208.1692095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSzKh-0006oY-UV; Mon, 16 Nov 2026 16:13:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1491208.1692095; Mon, 16 Nov 2026 16:13:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSzKh-0006oQ-Pt; Mon, 16 Nov 2026 16:13:27 +0000
Received: by outflank-mailman (input) for mailman id 1491208;
 Mon, 16 Nov 2026 16:12:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Pierre.Gondois@arm.com>) id 1xSzJZ-0006fU-AL
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 16:12:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSzJY-008c6B-84
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 17:12:16 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Pierre.Gondois@arm.com>)
 id 6afb2b46-bab6-0a2a0a5309dd-0a2a45048ba2-42
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 17:12:15 +0100
Received: from [40.107.162.71]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Pierre.Gondois@arm.com>)
 id 6afb2b5d-b57f-0a2a45040019-286ba247e523-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 17:12:14 +0100
Received: from PR3P192CA0007.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:56::12)
 by PR3PR08MB5627.eurprd08.prod.outlook.com (2603:10a6:102:83::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 16:12:10 +0000
Received: from MI3PEPF0000855B.eurprd05.prod.outlook.com
 (2603:10a6:102:56:cafe::9b) by PR3P192CA0007.outlook.office365.com
 (2603:10a6:102:56::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.14 via Frontend Transport; Mon,
 16 Nov 2026 16:12:10 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 MI3PEPF0000855B.mail.protection.outlook.com (10.167.240.23) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Mon, 16 Nov 2026 16:12:09 +0000
Received: from BESPR08MB999898.eurprd08.prod.outlook.com
 (2603:10a6:b10:109::23) by VI0PR08MB10799.eurprd08.prod.outlook.com
 (2603:10a6:800:204::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Mon, 16 Nov
 2026 16:11:30 +0000
Received: from BESPR08MB999898.eurprd08.prod.outlook.com
 ([fe80::d62a:5300:bc89:9f62]) by BESPR08MB999898.eurprd08.prod.outlook.com
 ([fe80::d62a:5300:bc89:9f62%6]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 16:11:29 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=FvArtZ0JvaPjzc1zLO0XuYIn0D7URyJye5TTZZscenXARyEmtdFCC1XHIBBRi+bu50dQl4mfwHTl6ra09+j2vW1OFcQkF3EjyvY1dbb7QoQlclgLEZR6ISY2H206jl1Z8oCCh5lYUijoSWfvQeKAlrTi8sKAHlmi/wu1sAI7N2Twbbta9Gm2Zm962Obh2+35qhAyQpb/LNyd/wxFH9JF5kWysfhbW1J5pVFK37WSFI9fPXwH5jPlQ3yYLxyf2T+VxUo//SB56SRozZYSTdmQrXmO8/jeaORoQ4l4W75xzJJtyFDDug/j6SceKVQ+aT9nI5r4Vg1Y3BLKCQKp3kwrtw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a6De4g5dm99WFc/ovQwH3JCmRMbUy3TdEu5pzb/pPHY=;
 b=r41TGpbC1bMEP1WPf9JKUoA5uALlH6Q0gtRGsWNn4Rrj04VlaCQV7xSTfWY2N7lC4idrmhjFDBpHkoBxtqICvf1x1mpVTH5PmK8oodZYH9csQW34WreHXf9MOqtd6rw8nnpmwQuMHc4u/2gUKoi0xbewI9ZjDIjQ7SqcN2QnqEkehAeyB070z+LjBNU1l6msA4WxwT3tCYGiCPVypJHxgd1nz1WZqgdi7kbLo/2zXzj1xki/TsYWf98lb77lC+Ps5b8wbF8lmI+ruGCuv6wwgGow/qrQz4XfmgpulQ6XDcPI1A9oPWjxWEiz2DxgTih3Hgb++FN185iU3CxBmoIMrQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a6De4g5dm99WFc/ovQwH3JCmRMbUy3TdEu5pzb/pPHY=;
 b=ET1SotIPUZXpS944IBF4jW+ybiFrlCeYtLgg0kXU4Vq+3xcUVoCNwNh07VEHC162dgSr2Ztlm+v/JVgOVGDu2hpF24mW1rtmwuFauWR5gMIIPG+bLKKDgmRD8i064XOSyQFT5R0uRddcK0qG6IJ1Gj7xryzCwoFW9cMwOus9YoI=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ze+gsdLzxzYSGY1KOn9MDC1QzHdATV+ZSsWG0irj3vHE2JdUMTXSVmfljOiiw3662DUckJgWzgAZV8E3oxJiIjKhfLxuPV45Gntr+dxrpAzKW3Utli9EVrGAQ19KdaKhjI+WB7pVdMgZfrcUdrdYeDcX7Y1/0dgvouiXuehN7VPS20oR82vtFqBLEmi9+3wn/BxzYoMIj4q8kdkkt8uQT8MrYS3re/NkINYgYSVfJkPODRsRyODy9AZC2P1U/WMKaKyE+UUbGF5u7YvawWSjvIFvip+1DyCwWoArWjz2x2Ink9Pe10AaxXWBHu+GnvFmXh7mXQIuJdmS9vVuN7CpRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a6De4g5dm99WFc/ovQwH3JCmRMbUy3TdEu5pzb/pPHY=;
 b=Byg7Y9dOVg0p+4wz/m5vMV+Dkagy5+siFFTtpUgt/lELiUde3I+9HqnR09MpNzkiSOQ0Rts+lp2F1ziNxvmVBAuHrXouUFZ1Z+QB5L5KN2C+tJqUSlhFoTKf7fRPF3goYgZtRnWUByO+923SEvHkGAomX2O9p8+BNNLyXQI7HdLhxiHeQPMUWnXS8ivqLfrt7Vo1a/H6NFPLoVZjloDQg3QZ3PIkRY8/bTZ1Q2X/eDAyEIuwRteTJ7dMcYB+VFcuJVTw4fNpIbzWcxjjsXy6xiwPkdZOJIpY1ouqXpxwyxj2gWCG/ec3Jdg2bl05h27ilBFhA5I5Y7HC9jjwmpES6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a6De4g5dm99WFc/ovQwH3JCmRMbUy3TdEu5pzb/pPHY=;
 b=ET1SotIPUZXpS944IBF4jW+ybiFrlCeYtLgg0kXU4Vq+3xcUVoCNwNh07VEHC162dgSr2Ztlm+v/JVgOVGDu2hpF24mW1rtmwuFauWR5gMIIPG+bLKKDgmRD8i064XOSyQFT5R0uRddcK0qG6IJ1Gj7xryzCwoFW9cMwOus9YoI=
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
Message-ID: <3d783a50-06bc-4c6b-815e-bd42ce5e54d1@arm.com>
Date: Mon, 16 Nov 2026 17:11:28 +0100
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: xen-devel@lists.xenproject.org
Cc: Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Luca Fancellu <Luca.Fancellu@arm.com>
From: Pierre Gondois <pierre.gondois@arm.com>
Subject: ARM EFI: should bootinfo memory banks be reset before retrying
 ExitBootServices ?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO0P123CA0004.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::9) To BESPR08MB999898.eurprd08.prod.outlook.com
 (2603:10a6:b10:109::23)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	BESPR08MB999898:EE_|VI0PR08MB10799:EE_|MI3PEPF0000855B:EE_|PR3PR08MB5627:EE_
X-MS-Office365-Filtering-Correlation-Id: 960cd178-addd-42fd-20a4-08df43fc5e1d
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|260925021311599003|260925021911599003|260925022911599003|10067099003|11063799006|56012099006|261021121427099003|261009223027099003|261102123227099003|261022115727099003|261022075727099003|261026121527099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 Mt06cbfp/nFi4hOkNroHt9fwTMzs7BOV10k2txfR8ngZ0q4z/0vK3R4UesqVT5SHHBdZhwqef0udJn/WgypK9f9torNYDxSsb18f8yvtvu7rZdArCJs9LC89GBol0A9d1wXL6MZhAxxgL6nbtjRemNoWMCNb8wUDEqm0byyTBi2HswTbljmaEbxqLxvSMGdP0S7eeJCFoGGnqwvMqL3UYITdo9LxMpAV/z5avwAWCUJGIeOJEgeQKz1JIMQPGZJ0MHQOFmmUlMDUOvSHCieO4XmaJ1uW1MgTmrzExuHVuCR9WC2R1o9m02m1R0yRKQ8uZRbYQHXBXTia2LscM+zLK3LfhCzQLl5ZTrJjngJVZUV+UO61Yl1rFPWmGVJ5Z9/L9/T6+9nFUHxNPnq6TkMMmKXDfLIzEtGCGhkXWSu6r5lXPjVuoR6aoFx9IBiVxCnTuQVjbhsEBak/1PefrCPqVvfThpEXN4u+bPg/uEOy0Om43/Hm1IlejFZNHYQjUGkQeraXym3/CvUIu5ScBxFOGAZlGagQYxZVeYh9o8d17USDuLkOh8sqVIYPiESvYdELFfXMusATn83x69ULUwxnPPmhQJ6DHt1qNbb6AwS2+pAXJPZqWL4fj2g5ARYj7Tvh58HKh04XfqbeDIAxbPiZNYhTrqHU4wkZctVDmqTTFYk=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BESPR08MB999898.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(260925021311599003)(260925021911599003)(260925022911599003)(10067099003)(11063799006)(56012099006)(261021121427099003)(261009223027099003)(261102123227099003)(261022115727099003)(261022075727099003)(261026121527099003)(18002099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 2TZVIG9xzw6/u0Bb44iJkj2Oo7YzzT4xL+hd7RvSUJf1ntZhMwXLRS2kRES3+2p0/pA46+mN92nHDjIKtxgtkJ8ISNbiPfADoaHy2t30BrlP+KoijJU/oja2oNCab8QMnoDPjzW1XmdWXzd8OzATXti16u+sjjF2Ovm6ywjuzgt9WSKEB5E86usZLJPlYyW7CVup79x5Gwl21vzk4fK6ahPbKYieCp17lFiBZ0JSm+XD/0fbqVbFG77+9/n4uOl9xSLATbHyuphWKKqjrHN0r39pQ+lnOyibz988iovYk23jVqjYDxm9ZfbqJwLnfLRuJFkzotRZ+efqV9HlP1RvZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10799
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 MI3PEPF0000855B.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9c5598ec-5018-4967-a851-08df43fc45ff
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|35042699022|14060799003|376014|1800799024|82310400026|36860700016|10067099003|11063799006|56012099006|260925021911599003|260925022911599003|260925021311599003|261026121527099003|261022075727099003|261021121427099003|261102123227099003|261022115727099003|261009223027099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	L0dhTywGw6PnkMHYOig3RB4kbOjBibuYnDrWqFDuMzUDjZHPyRMcRqWFJPq6TcN/xRdKsBpMIKdXmPLmfooFmUXLTrvNpf5k7CZ8AO35rIAwAtLMoelxBySHC7xioh7x3IPjZ9b0AMcuuZfmy3K9Z6m2kp8S51oOyib9F8xL55w9IW++nrjYnIWyuuwO+h87LLA1M3An0GZnMrNHKkACwHRo1p0IJWqlk1YkJQdLapxgu2sQcedNOx5ypvjXq5/VEkwx7+FT1AvkSOkpClHrHgZhuqlXpJcWg11PsVLH1WGW16vUoOF9tcBBWKbTyTBtWnGzq3OHyFCQnGjHgHIa8einLwtWF2dMSlytS3iIKYJeiqWs4ei4sIMPRfd7+ixIdHjjcTc9vTGbx6TX8iYcApKjhtkaHcBMAMio19rpHg8oZXU7aL22cFKcoMyaaY5OTtYdbYx+YkepBQd+93lrT1lHdh1j70ObYNr2K3bFjYov4OJOUmeXJQnCxMsyFSJFntn622z09WMSXTuQxQ0ARq3mxnGdW0QfpfAxQ/rUH8pbypTiq1mGUA2EYB+VofMHEWFTflN8UzanFyD5ILRnOxpKc4iyAwO0uVdTKuql6+sFDL9KpvPHbB7T7h4c0U0jle6mCRiMSaJLsaHeb+0obAPuCOJfaGr4yz5leMNsS28Z9eDXdNU41oWf30o3I4M4zI3rK8ZiBfDQ1WWiGD+noQ==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(35042699022)(14060799003)(376014)(1800799024)(82310400026)(36860700016)(10067099003)(11063799006)(56012099006)(260925021911599003)(260925022911599003)(260925021311599003)(261026121527099003)(261022075727099003)(261021121427099003)(261102123227099003)(261022115727099003)(261009223027099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZhiRxRzAM/qHioi2o/2C+rYtVsrQpFhk03JwIJNZczfUQAi8SRkMpxJADpChWyELIWhlImIq2hQQ0US/MztTl6OjkiRh+DoNz/aBY3ItG8N9jzGOJOnBbTRpItwysbUO/kf1+NuqM/IQv1HZvJXrfyN81TZh70BxL5mDHYGaEpgowxD8MBgrk11LN58DwPvD8PVepW0rSTiWyJ/jnx3XgLFk55JHYBW3dCNIvFbEVVUoITjg6curmzsdWouqA8znjoXf2vWb0QEG6keeWCdP9KOBkkl125Vxk8VzfE11S9+kLYm26W3OplLGeqekxYdeCSGhAn5I4p1+hop3D5XGmUGTO8bfkhUolUM/t+B7phlN5V3Eb0Lc5OYM5meKruyD0okB4KKqf9YmD14fZFG9iKvw4TsKkjANZn/eIliEGKTxIw7vZ3rZUWt4cBbpTAba
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 16:12:09.7870
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 960cd178-addd-42fd-20a4-08df43fc5e1d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF0000855B.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5627
X-purgate-ID: tlsNG-ebf023/1794845535-C2ECEB50-D7637D7C/0/0
X-purgate-type: clean
X-purgate-size: 556
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello,

I am requesting some guidance regarding a boot issue related to the
edk2/uefi project. This patchset [1] introduced a change which
modified the memory map just before the ExitBootServices, which should
be authorized. As described in [2], it seems that xen doesn't handle
that case correctly, preventing edk2 to boot valid kernel images.

Does the change suggested in [2] seem sensible ?

Regards,

Pierre

[1] https://github.com/tianocore/edk2/pull/12704
[2] https://github.com/tianocore/edk2/pull/13261#issuecomment-6774136145



