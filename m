Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD01606A331
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 17:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=bzb7w0ou
Received: from list by lists.xenproject.org with outflank-mailman.1472316.1680244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOera-0002lr-7b; Wed, 04 Nov 2026 17:33:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1472316.1680244; Wed, 04 Nov 2026 17:33:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOera-0002lk-4o; Wed, 04 Nov 2026 17:33:30 +0000
Received: by outflank-mailman (input) for mailman id 1472316;
 Wed, 04 Nov 2026 17:33:29 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1xOerY-0002le-S2
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 17:33:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOerY-0000wf-1V
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 18:33:28 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6aeb6c67-bab6-0a2a0a5309dd-0a2a450be85e-2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 18:33:27 +0100
Received: from [40.93.196.66]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6aeb6c66-b7e8-0a2a450b0019-285dc4428109-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 18:33:27 +0100
Received: from CH2PR10CA0026.namprd10.prod.outlook.com (2603:10b6:610:4c::36)
 by IA0PPF52B16157D.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::bce) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Wed, 4 Nov
 2026 17:33:19 +0000
Received: from BN2PEPF000044A2.namprd02.prod.outlook.com
 (2603:10b6:610:4c:cafe::84) by CH2PR10CA0026.outlook.office365.com
 (2603:10b6:610:4c::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.8 via Frontend Transport; Wed, 4
 Nov 2026 17:33:19 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000044A2.mail.protection.outlook.com (10.167.243.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 17:33:19 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 4 Nov
 2026 11:33:19 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 4 Nov
 2026 11:33:18 -0600
Received: from [192.168.19.2] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Wed, 4 Nov 2026 11:33:18 -0600
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jpNTTe8ywusT/7uWiEMDzFJyqxt3+vIj9Q5yOhoOUhqSQUwqSGe53Tzx9ZO5x8jt6faf5SG+obDxSXvZNCqU5RSIN3E3BrCtl0xPWLV/sq6KpZF2nuHzcC2zcyHxCsEnBPuvOxsPATCpIjIPxNNZWacUnTJFiK850dW3WzgAPLdhFlvQpHWVuK/HfpOb68C7YirArmwi2dPaQV9ff3Zi72G5HVtZTJh4ZkIh+w3rUrZ33JJUK3rfeewyP+OjnlUijIjGJv1MBjFvbUcHLh2v8guMseoFGf7KY3qsOAndEDJPgc42cJ4ubzwT8fnh1KN1syZavUe2jp15fMbLYhnydA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KH0cjcSzGgPO3uZLJv4e8L2XyUvuLRkjrWF6x9bITw8=;
 b=Dc7kixC6R+ScFYhUU+mOMFXHZnLdiR7IYQhE642lyV6Sy7gMNh812YTEEmsr5Jn7MHJH+eAW68JzOWjK5wk0kQb3BkONh9qmIYY8pOFy6aWkpvUIBUaTC1U3Qc8QEiM7rD1L1pbAXbc0UnMKb6cs+ByxN12dxArZP/c8eqpZ3PnCaT6Fl/MbeIAVhNf1qE6Wdnc2Dil+YwcHu7toneZaj0LUn3to4hIXBmIC09aPR+EncO/NW9rUyT+6i3GJaT+H1K9nQgoXJDUjrwZI8MqG0fgJ6MLT7IPLQVslnmcqCcJNnNRyLebrq5jNRzy+En3H+XmrS1L2FEmQlMfpqJawbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KH0cjcSzGgPO3uZLJv4e8L2XyUvuLRkjrWF6x9bITw8=;
 b=bzb7w0ouT6j7nugYZdGD20R0ud+pMENzukY9+fh6JtFAoicdHTivcQbJCJqzWa+Kxa/4Esf6q4SLX/ltDFW0bztfXHu6xWCHBQ44LNegZubAhrJIdbXMsZS6/6kgNoq2etTVVAf4fPOKD9WsW3H+mut0eghnd62cTtubUYDEwsc=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <0762b21d-3173-4014-bd43-fa2a9cef9c85@amd.com>
Date: Wed, 4 Nov 2026 12:33:17 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH] libxl: wait for QEMU exit before restarting a domain
To: Jiaqing Zhao <Zhao.Jiaqing@amd.com>, <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross
	<jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Penny Zheng
	<penny.zheng@amd.com>
References: <20261104064645.1171477-1-Zhao.Jiaqing@amd.com>
Content-Language: en-US
In-Reply-To: <20261104064645.1171477-1-Zhao.Jiaqing@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A2:EE_|IA0PPF52B16157D:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ab8ff3b-c498-4921-c789-08df3a99b792
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|36860700016|376014|82310400026|261022105027099003|11063799006|56012099006|261021123027099003|261021121427099003|261009223027099003|261102123227099003|261022115727099003|261022075727099003|261026121527099003|261026140227099003|261028144727099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	WH19Cg+eg6Kkh6VGuJWU5MV5ClDva/0FRD1/YbyB+TXbzc6NxXQyzrA0VrTOcUtd4KL2DHX7+yUHKSpS7ZHsuOUKQhX9dSQQXdNtmRswHStTTVV2Ih7c0EvezpqjvTDf14wXMiLZA16fPO4U00NTKx6qvMr5FIg3ZAfN9FrwKpWXsv28OuQtXCSTXKHhTvH5ZrEFTUhFs8PtaOj33qSWIEA92gPVk1+4/LNdFPJLDbeu6u30AERPiyPuaRYlwyTFbLZ5BmqfAWl8Y3eJoc5IdQ3ImntoZVfNpOd0FlT2NRqZ5OsA+R5sLvmZKe4RQdYZmXfCT20YmfXBbl9v0XKffJoG8OuCkFfbnufEIv63ksVNIbfupSGVUc6vsSA5NVVZyAVtNUegBL6IJ7BZLAEe5dmQEybSf05OaLvhqbLEvhrubYcsvyjE5hSahih03gwMS2Zob9qiarIISQoT2mbR78sI5mQKfEm5oTcaY9qT7COCE9gEH8WQ8gDGH5vIeExicMbzGjdd38S+m7qc48TVGM/p5/ujpfc5WI+2nWAO2AKvfSMIwaXsAIw7KZeZzm2Nd+1tJMQ/WfOhEGX20RuiTDDBSZHiCxKZPyxRSBqeuy/1qEnU0tiO2M8Q6KjDH5SeOT2NO0UP2ZkcLua9YKXMKtJa+AkHWtnRTTg0V5KTGxNK9QqgUKbk5GqfPLIcLSO8Iw3C0Bjr38eL0vkOhWkjyQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(36860700016)(376014)(82310400026)(261022105027099003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003)(261022115727099003)(261022075727099003)(261026121527099003)(261026140227099003)(261028144727099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CaRZeSBACH4asmgpIzDmQYOiTEwEcgb+7CsCFtjVNSlybhz2IkhEBMaKyGNsJtGEOEC3FsWtAGcwBCmEjK8+N7OfOcCGU02L7Mj4nQEfjUlEXEOBD0NKbbipQc7CUDWoqHIDSfs1UezS/SbQIMwQEGQm0cijvfyeXAcH7YgoWU2vz24NiVpa0Xxmq3QkPQfo/gawWEFJMUcUh52Qjkh92zlGphNJ8wDvw8mZOeTwOr8tUMYg4DEUFh60zufkX1LNpqRzHPeEp2QKAS6WarWSZr1qgkK3czbsacPL9gJQJcp1in1eHTUJ0mWK0U2u0r8kswhzVt8U+dxTbTwFAZtmh3GoDYSCH4RMXzvsvg4ZwRl2nM7yMCLhc4NqTQz4vFapxRIv/y25CgR5UcSTn5qoTGCyHXyCTMkzx2339uJHr8lh9Z+4rRy9pKCrBRE887LY
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 17:33:19.3728
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ab8ff3b-c498-4921-c789-08df3a99b792
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF52B16157D
X-purgate-ID: tlsNG-42698a/1793813607-A86CA9EA-5A29D937/0/0
X-purgate-type: clean
X-purgate-size: 2324
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-04 01:46, Jiaqing Zhao wrote:
> The PID-based device model destruction path returns immediately after
> sending SIGHUP, before QEMU has necessarily exited. When an HVM guest
> reboots with VNC enabled, the new QEMU process may fail to bind the VNC
> port because the old process still holds it.
> 
> Wait for QEMU to exit in a child process after singaling it for at most

"signaling"

> 60 seconds. If waiting fails or times out, log the error and retain the
> existing domain destruction behaviour.

60 seconds seems like a lot.  Did you measure the time to see how long 
it takes?  It's an upper bound, but maybe 10 seconds would be better?

> Signed-off-by: Jiaqing Zhao <Zhao.Jiaqing@amd.com>

> @@ -3547,12 +3564,28 @@ void libxl__destroy_device_model(libxl__egc *egc,
>       LOGD(DEBUG, domid, "Didn't find dm UID; destroying by pid");
>   
>       path = GCSPRINTF("/local/domain/%d/image/device-model-pid", domid);
> -    rc = kill_device_model(gc, path);
> -
> +    rc = kill_device_model(gc, path, &dm_pid);

If you just read the pid directly here, you don't need to change 
kill_device_model().  But your approach is only a single read, so maybe 
it's better.  I'm undecided, but maybe someone else has an opinion.

>       if (rc) {
>           ACCUMULATE_RC(ddms->rc);
>           LOGD(ERROR, domid, "Killing device model pid from path %s", path);
> +        goto out;
> +    }
> +
> +    LOGD(DEBUG, domid, "Waiting for device model [%d] to exit", dm_pid);
> +    reaper_pid = libxl__ev_child_fork(gc, &ddms->destroyer,
> +                                      kill_device_model_uid_cb);

The reaper_pid handling below is duplicated from
`if (dm_kill_uid_str) {`

Put the above pid code in an else, and use a single implementation of 
the reaper_pid handling.

> +    if (reaper_pid < 0) {
> +        rc = ERROR_FAIL;
> +        ACCUMULATE_RC(ddms->rc);
> +        LOGD(ERROR, domid, "Unable to fork device model exit waiter");
> +        goto out;
>       }
> +    if (!reaper_pid) {
> +        rc = wait_device_model_pid_child(gc, domid, dm_pid);

Though this would need an additional conditional.

Thanks,
Jason

> +        assert(rc <= 0 && rc >= -125);
> +        _exit(-rc);
> +    }
> +    return;
>   
>   out:
>       /*

