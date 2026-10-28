Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C9260A5BD1
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 08:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=iPu45QH5
Received: from list by lists.xenproject.org with outflank-mailman.1462930.1673914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLytl-0002Uw-7D; Wed, 28 Oct 2026 08:20:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462930.1673914; Wed, 28 Oct 2026 08:20:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLytl-0002Up-3Y; Wed, 28 Oct 2026 08:20:41 +0000
Received: by outflank-mailman (input) for mailman id 1462930;
 Wed, 28 Oct 2026 08:20:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <takakura@valinux.co.jp>) id 1xLytj-0002Uj-5G
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 08:20:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLyti-001MfJ-IK
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 09:20:38 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <takakura@valinux.co.jp>)
 id 6ae1b04b-e002-0a2a0a5209dd-0a2a450b9fb4-28
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 09:20:38 +0100
Received: from [40.107.74.81]
 (helo=OS0P286CU010.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <takakura@valinux.co.jp>)
 id 6ae1b053-b7e8-0a2a450b0019-286b4a5179ab-3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 09:20:37 +0100
Received: from TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:403:511::19) by TY4P286MB6752.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:33b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 08:20:32 +0000
Received: from TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5f8d:a6bf:3b84:5a82]) by TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5f8d:a6bf:3b84:5a82%5]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 08:20:32 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=valinux.co.jp header.i="@valinux.co.jp" header.h="From:Date:Subject:Message-Id:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LkeWRuXyMUiywJD9+7426Mmed8xBTHhjiKhbwXU/tD5w8yxZOQUza593Mbl/h1QekfOyzyG4TlscrgefNSr+3FyuJsBZd5LpLnTGnco05eBgqQeNyVKDId+CPalueHbgHCQtIH9t3l0wPus04aofTaw0/7ytCgfm/V5QLYxhxCG6KeLrYNA9P00qciwxMLxiWCULWaIJGlhdl7ekd8rnBukEOS8IHTREq2D7+V/uscqxNkHcci1jrVy2f5WcpXmaI7K3CLctg7Xh/mqFpsyN46CMl3WBMc2VHbBZg8wBRWFVF4GVb8TiMqW8yh+C87W4t0ljOSbAOo67B/5VAk199Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LansMxIS3D33QokSM4Gv2GyVi2Xj0o/26ld45KmfJX8=;
 b=c8kIcj/PNVrLYJFy57mDV3mu+la2Rkk5IaH1Sbx2ZjLJiBUa4cKwZuU/SEDnLVTXZGrrPMviWAdSsdbvP/C+wdUjH/GKxIuQhhCM2A6O6/PggNzFSzLF1iDIvv8bSNld3xE3biL2sBwrNW6ouhLbDoxk/9Vttwbv8vNXZeilwgP77vtUOYqmthDzniJDKEMNetbxsQwCh0RRu8lSrcVZjISSkFKn4sm0zTVlYbmjG6z2aNlSur1/FS3gtY28Ks+6tH80Ew1jVjY65AwOQiwxr0OZD5nMY11mkjl67CykbyK5GVMd5437IaIRIEOzx0zoMjX6dTUspOLwGJrEuyAE5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LansMxIS3D33QokSM4Gv2GyVi2Xj0o/26ld45KmfJX8=;
 b=iPu45QH5tZRu9/FzZMPcAmJ5NuhZLm/w41pp6Vg8Pj9QOIwK9z420dbjbaxH4/Ca0rfJ6frSRL8xiSjz0Tm9cgV7mLd4Qkn2J8lA/0B/CaLOrqomDWSaNDpSnuxrd3GVtAmuiwQ8AtST989BRc1mnQ0qSWTwLfkRy9J/5lWA7lA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Ryo Takakura <takakura@valinux.co.jp>
To: bernhard.kaindl@citrix.com
Cc: xen-devel@lists.xenproject.org,
	sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	jbeulich@suse.com,
	roger@xenproject.org,
	ross.lagerwall@citrix.com,
	jgross@suse.com
Subject: Re: [RFC 3/5] xen/tracing: prepare a livepatch payload and its controling interface
Date: Wed, 28 Oct 2026 17:20:17 +0900
Message-Id: <20261028082017.121826-1-takakura@valinux.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <179285123800.1706038.4978498781229199186.b4-review@b4>
References: <179285123800.1706038.4978498781229199186.b4-review@b4>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0056.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::17) To TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:403:511::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY5P286MB319683:EE_|TY4P286MB6752:EE_
X-MS-Office365-Filtering-Correlation-Id: 47eb6180-aacc-455d-8309-08df34cc5599
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|23010399003|1800799024|376014|261022105027099003|261021121427099003|261009223027099003|261022075727099003|261022115727099003|10067099003|56012099006|261026140227099003|6133799003|3023799007|18002099003|22082099003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	td70Lds5b6nHTZgjwmvb6EaRgrVwzeaYWlzXHJa5Cno/yqo6OtTCyamg0BW1luUamYLRax6zHdIlzrM/j+3BDpCtlrxGXyf+WkmCSY4Z6Vya1ZiV6i+tzHgzAhcogVHATOyu+w/EFNN0A71jwJbpLO1Cv8WgU/3sKkrwa5zwT/vSKjWRlvbyIJU3cM1m8691fl575GPboHqNLjqTdDcBAR+iHTIUU8N8Dtjs9L5m5XZY5qEceNjkRHUnDSx5uVRD0vzCBCrZsId5O396MxWUO9n65Ukl7VFTayw/g9d9cYLHlAN6K0jb1Q+0Nm9cMbdk0f4EEh9Myg/eVDJ/vq2Lge64HtRCZFYtw0+oE5S/PJhId9FWCZ+Vi/s+7AwUwryEJyuL/y2CeiXqH65VuIN/iY3ekJiH1Me9glvkCIJNcaPub/7LUeo7YdS6b443TAvMMuV7eAyQ+4MwdTtSaW/W+3twqVAZSj2T1XLj8FV6RrQNwTFM4IFJiXPRgrMUuPs90YAdKca3KIEvJQBjpDkRF36yS6rA2FZ/2nfslAw9opEOjSkY3ZEMnn39CFgNgFDH434qjSYSO05j04SODdvrbU+1lCLN7Qxtu396xKsunGEoAK0ZzzXK/LglzYjRqInJ5roRcghjLP4bR7ChHiLqFuR7mcAUxOl0Bd3lrwPJdrE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(23010399003)(1800799024)(376014)(261022105027099003)(261021121427099003)(261009223027099003)(261022075727099003)(261022115727099003)(10067099003)(56012099006)(261026140227099003)(6133799003)(3023799007)(18002099003)(22082099003)(261026121527099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?B+DL1ONMBkklWmupw03AmxRW7l7ycR1twceH5Dcm9BsTDvf30cA+tGtoe2BD?=
 =?us-ascii?Q?DjQAU1eKC7KqUEM/0mZLqGBelSr+e2CFnuyQYjrdeIyED7+75o+Wnu/jJSqr?=
 =?us-ascii?Q?iaBqeNGl0ntYRB+rSh7b8syOR7L2H4vxNPlrKeFwVy5K/ioo2Dkf1f1Z8DkF?=
 =?us-ascii?Q?GSfFsKdu/35e4jGJzH671fT7X+J3aogOYJAvvchO3tvxjynLdeK/tivJvueN?=
 =?us-ascii?Q?ftksIMuE0BM/Fh7vTAPXCt+jAq8FpFnsBvDoAn0ucYyBs9QU4AaczmJM6akk?=
 =?us-ascii?Q?mEnPVs7DTWsDaNlGNfzYqu7u87oNYSni0CsE47UXRSUAj7B4EW4oD9lKY81M?=
 =?us-ascii?Q?R6Q5uKra9FT6trxBUpwbsCGVjjI+ID/xkMrjfznpDZvxfU9A9ceU12g/qjDB?=
 =?us-ascii?Q?SO59h637NmrSZ1LKaqF0gZAnHrwaQ76x6qGIeRXrWXCljhn62QK5vayxF70T?=
 =?us-ascii?Q?H3Yha2jXc6bN1NGFrZK75LDmiY+UPQa+U8uqiT17nHfEmq5PF89kXNi6X8nK?=
 =?us-ascii?Q?9HQ8qibMFWrl9fjk0lYBQG2Axduo3DRNUzrCEzDqKpzBJazz0xn6EG7//Bhw?=
 =?us-ascii?Q?LnZluNyiKs9pjywWwfYLjc2+xSbN33ySQd2Pk+hORXmeYhZ098f/5DRF3Wtg?=
 =?us-ascii?Q?OL0WA5DzKV3wlVp+i/5x6rhk5OWAA6NaYEZ59KgDnJFE4Eh0yf1Jc17r5rHc?=
 =?us-ascii?Q?6oYusNuW66G59RAM7R1kG94sNMyEgMVIm9Gg83LFTKj2IJcfmCgvm2QZpWeq?=
 =?us-ascii?Q?g0+hgQsHjXMIKMdRGTz40ZPL6khj4MA1orseShiYsTRPTInEmnZq0khXyERe?=
 =?us-ascii?Q?6hYCXTlQvdaVgPq1dSHD3L7/OgSyPi9bm+csX/wrSlHsS2dZFoaZ7SNQJYPf?=
 =?us-ascii?Q?ZZFflpTmcYMwhhniW6/+sMJUA0CBM8urAU8BsorNdM6wN1cn6erz5OmGYQxj?=
 =?us-ascii?Q?PN25H2y/bADwlgOto/pMTmgv4U32qQd1It5M3DGcLAIwoBCzDy9lK3tAcbgF?=
 =?us-ascii?Q?jPPAyLycKCDcWYzmI0v43jRBnOWq8WOCFFxLxY3D0wR5n9vgkJqRGYju1I1y?=
 =?us-ascii?Q?+cRmRqsIMb3KlBajkSUG17GrKv0FP/heZQ/wd/tWlRL6CPMlKlVS+YOiCSJt?=
 =?us-ascii?Q?OqB0Ksx/3eCj2TF2LOFJwEs3Tf7PuwdumtMxr7Dy+sIgi+pSHp1E2bH80sLc?=
 =?us-ascii?Q?ry/hUMBsPO7tHk7a4GDCPTcgOF/ZzSJ84hNw/KfCs7vpFO8Orr9SrxgopVn1?=
 =?us-ascii?Q?wmwrgB1dkJoz79iSiPphPU/ktFZZNK8eqzJwkLt8A0GoavZtUOO247/Oizzx?=
 =?us-ascii?Q?f0ZFCnrCXtkoaQNzMX0sN4F9tmn5zUbyB8E0BUntXFGKQH0ox291CocGV9vn?=
 =?us-ascii?Q?V3CaAmH/kDGu16o4C/aTy5RtZ8UsHCwu14FrAFj/8HRyRogL10yXbX5a/FCB?=
 =?us-ascii?Q?vEDmUgjhIvBdQPgobxLVx/SdkgROOVkmoUdKgMyYEbBCRAtMagIpwLaIuxtU?=
 =?us-ascii?Q?W3uzy1O/sdtEaWg7hzSTeagRB9Kz/nmC5CFEZ+khufnC9RyThv1PYtNAjQ2S?=
 =?us-ascii?Q?tHq7ZLtRvMnIa6l4jqjrBstphzkLrIm63umVuxKypmxwlwAijpfY1OVZaeAA?=
 =?us-ascii?Q?oZ6w6510oNPOolU1nkVsZJ+hxWHzOgPaAQ/d0SoRa/5/ownJObhhW+QnYfrm?=
 =?us-ascii?Q?FiTIFNweDwotibMXDOXnLVMQPgpnFoYZIG8uNZY2QRICvr2dm098ZYHpod1x?=
 =?us-ascii?Q?r4EVmVtb1A=3D=3D?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 47eb6180-aacc-455d-8309-08df34cc5599
X-MS-Exchange-CrossTenant-AuthSource: TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 08:20:32.4748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ou4xjeZtxH5XQZCsp8haj4ZUNYKmlx2EiIkFmpEhwSg2mwa4UeaicXTiUwr4DS8ApgyfM0wB2TEdsGMVW6qpNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P286MB6752
X-purgate-ID: tlsNG-42698a/1793175638-AA4DB9EA-ACC66283/0/0
X-purgate-type: clean
X-purgate-size: 12526
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, 24 Oct 2026 16:13:58 +0200, Bernhard Kaindl wrote:
>> --- /dev/null
>> +++ b/xen/common/hypfs_trace.c
>> @@ -0,0 +1,741 @@
>> +void trace_dispatch_callbacks(unsigned long ip, unsigned long parent_ip)
>> +{
>> +    livepatch_trace_func_t callback;
>> +
>> +    if ( !tracing_is_on() )
>> +        return;
>> +
>> +    if ( !trace_callback_registered )
>> +        return;
>> +
>> +    if ( !global_trace_func.old_addr )
>> +        return;
>> +
>> +    if ( (unsigned long)global_trace_func.old_addr != ip )
>> +        return;
>> +
>> +    callback = global_trace_func.new_addr;
>> +    callback((unsigned long)global_trace_func.old_addr, parent_ip);
>> +}
>
>What synchronizes this reader with callback removal on another CPU?

Testing !trace_callback_registered was the intended synchronization here...

>The corresponding part of trace_unregister_callback() is:
>
>> --- /dev/null
>> +++ b/xen/common/hypfs_trace.c
>> @@ -0,0 +1,741 @@
>> +int trace_unregister_callback(void)
>> +{
>> +    int rc = 0;
>> +
>> +    spin_lock(&trace_callback_lock);
>> [...]
>> +    trace_callback_registered = false;
>> +    global_trace_func.new_addr = NULL;
>> +
>> +out_unlock:
>> +    spin_unlock(&trace_callback_lock);
>
>Could CPU A pass the enabled and registered tests, then CPU B clear
>new_addr, before CPU A loads and calls it? Would that permit a NULL
>indirect call despite the writer's lock, since the reader does not
>take that lock?

... and yes, I think this can happen.

>I wondered whether the existing payload RCU region might cover this,
>but the new dispatch appears after its unlock:
>
>> --- a/xen/common/livepatch.c
>> +++ b/xen/common/livepatch.c
>> @@ -232,6 +236,11 @@ xen_livepatch_trace_dispatcher(unsigned long ip, 
>> unsigned long parent_ip)
>>  out:
>>      rcu_read_unlock(&rcu_payload_lock);
>> +
>> +#ifdef CONFIG_LIVEPATCH_TRACER
>> +    /* Call tracer callbacks. */
>> +    trace_dispatch_callbacks(ip, parent_ip);
>> +#endif
>
>Would an ordered publication and reader-lifetime protocol help here,
>including draining callbacks before unregister/reset completes? Could
>it cover registration as well, where the registered flag is currently
>set before the callback pointer? Merely checking the pointer for NULL
>would not seem to protect callback state already being used elsewhere.

Thank you for your suggestion.

I'll extend the existing payload RCU read-side region to cover the
callback dispatch and remove the registered flag entirely.

Do you think something like the following would work?

---- BEGIN IDEA ----
--- a/xen/common/hypfs_trace.c
+++ b/xen/common/hypfs_trace.c
@@ -135,17 +135,16 @@ void trace_dispatch_callbacks(unsigned long ip, unsigned long parent_ip)
     if ( !tracing_is_on() )
         return;

-    if ( !trace_callback_registered )
-        return;
-
     if ( !global_trace_func.old_addr )
         return;

     if ( arch_livepatch_trace_entry((unsigned long)global_trace_func.old_addr) != ip )
         return;

-    callback = global_trace_func.new_addr;
-    callback((unsigned long)global_trace_func.old_addr, parent_ip);
+    callback = rcu_dereference(global_trace_func.new_addr);
+
+    if ( callback )
+        callback((unsigned long)global_trace_func.old_addr, parent_ip);
 }

 int trace_register_callback(livepatch_trace_func_t callback)
@@ -154,14 +153,13 @@ int trace_register_callback(livepatch_trace_func_t callback)

     spin_lock(&trace_callback_lock);

-    if ( trace_callback_registered )
+    if ( global_trace_func.new_addr )
     {
         rc = -EEXIST;
         goto out_unlock;
     }

-    trace_callback_registered = true;
-    global_trace_func.new_addr = callback;
+    rcu_assign_pointer(global_trace_func.new_addr, callback);

  out_unlock:
     spin_unlock(&trace_callback_lock);
@@ -175,14 +173,16 @@ int trace_unregister_callback(void)

     spin_lock(&trace_callback_lock);

-    if ( !trace_callback_registered )
+    if ( !global_trace_func.new_addr )
     {
         rc = -ENOENT;
         goto out_unlock;
     }

-    trace_callback_registered = false;
-    global_trace_func.new_addr = NULL;
+    rcu_assign_pointer(global_trace_func.new_addr, NULL);
+
+    /* Drain every callbacks before unregistering this tracer */
+    rcu_barrier();

 out_unlock:
     spin_unlock(&trace_callback_lock);
---- END IDEA ----

>Separately, could a pending filter apply survive a successful clear?

Yes, it could.
Currently, it only checks the immediate result of schedule_work()
and the applied state of the payload.

>> --- /dev/null
>> +++ b/xen/common/hypfs_trace.c
>> @@ -0,0 +1,741 @@
>> +    /* Schedule removal of the current patch. */
>> +    if ( global_trace_fstate.applied == LIVEPATCH_FUNC_APPLIED )
>> [...]
>> +    /* Clear the filter if no target function was requested. */
>> +    if ( !ip )
>> +    {
>> +        /*
>> +         * Keep global_trace_func.old_addr since livepatching
>> +         * might be in flight. Only clear global_trace.filter_name
>> +         * which will effectively update /tracing/set_function_filter.
>> +         */
>> +        global_trace.filter_name[0] = '\0';
>> +        return 0;
>> +    }
>
>If I select a function and then clear the filter before the trace-on
>worker runs, wouldn't applied still be LIVEPATCH_FUNC_NOT_APPLIED?

Yes.

>Could the clear therefore return success without canceling or removing
>anything, followed by the queued worker installing the original target
>while set_function_filter reports an empty filter?

Yes.

>Would it make sense to track pending work explicitly and either return
>busy or arrange a safe cancellation/removal before accepting the clear?

Yes, I agree tracking the pending work. I'll make sure the pending work
gets handled appropriately for the next version.
And I believe it should take care the issue you addressed concerning
trace_set_filter() as well.

>There seems to be a related completion-status question at the end of
>trace_set_filter():

Yes.

>> --- /dev/null
>> +++ b/xen/common/hypfs_trace.c
>> @@ -0,0 +1,741 @@
>> +    rc = livepatch_schedule_trace_on(payload, global_trace.func, ip);
>> +    if ( rc )
>> +        return rc;
>> +
>> +    strlcpy(global_trace.filter_name, name, 
>> sizeof(global_trace.filter_name));
>
>Am I missing a place where the controls consume payload->rc after the
>worker finishes?

No, you are right. There is currently no such place.

>The existing livepatch worker can fail during CPU
>rendezvous or application after submission has succeeded. Could the
>displayed name then describe a target that was never installed? The
>removal path clears the name before completion, which seems to allow
>the converse if removal fails.

Yes. The same issue stemming from overlooking the pending work.

>Could requested and installed state be kept separate until completion,
>with a way for the user to see the eventual result?

I agree that those two states should be kept separate.

I plan to prepare a new file, something like /set_function_status,
which user can track the state of the request, which is payload->rc.
And leave /set_function_filter for showing the installed function.

>What is the intended contract for changing current_tracer while
>tracing_on is still set?

I see that its inconsistent right now.
I think current_tracer should not be changed while tracing_on is set.

>> --- /dev/null
>> +++ b/xen/common/hypfs_trace.c
>> @@ -0,0 +1,741 @@
>> +    if ( prev->reset )
>> +    {
>> +        rc = prev->reset(&global_trace);
>> +        if ( rc )
>> +            return rc;
>> +    }
>> +
>> +    global_trace.current_trace = &nop_tracer;
>> +
>> +    if ( new->init )
>> +    {
>> +        rc = new->init(&global_trace);
>> +        if ( rc )
>> +            return rc;
>> +    }
>> +
>> +    global_trace.current_trace = new;
>
>Could a tracer change either be rejected while recording, or perform
>a stop-and-drain transition before reset and initialization?

I plan fix it by the former approach of "reject while recording".

>For a tracer using the optional start/stop hooks, wouldn't the present path
>leave recording reported as enabled without stopping the old tracer
>or starting the new one?

I missed this inconsistency as well.
I believe it should also be fixed by enforcing "reject while recording".

>What should tracing_on report if the new
>initialization fails and nop remains selected?

By enforcing "reject while recording", it should be reporting '0' as
tracing should already be disabled at this point.

>One more target-validation question: what excludes discarded init
>functions from filter selection after boot?

Thank you. This was missing as well.

>> --- /dev/null
>> +++ b/xen/common/hypfs_trace.c
>> @@ -0,0 +1,741 @@
>> +    if ( len )
>> +    {
>> +        ip = symbols_lookup_by_name(name);
>> +        if ( !ip || !is_patchable_function_entry(ip) )
>> +            return -EINVAL;
>> +    }
>
>The new linker table appears to retain the compiler-generated entries
>without filtering out init functions:
>
>> --- a/xen/arch/arm/xen.lds.S
>> +++ b/xen/arch/arm/xen.lds.S
>> @@ -61,6 +61,11 @@ SECTIONS
>> +       . = ALIGN(8);
>> +       __start_patchable_function_entries = .;
>> +       KEEP(*(__patchable_function_entries))
>> +       __stop_patchable_function_entries = .;

Yes, they still retain the init functions.

>For reference, the existing symbol_valid() in xen/tools/symbols.c
>retains symbols in init text too, and symbols_lookup_by_name() in
>xen/common/symbols.c returns matching addresses without an active-text
>check. Its non-FAST_SYMBOL_LOOKUP branch contains:
>
>>         if ( !strcmp(name, symname) )
>>             return addr;
>
>Meanwhile free_init_memory() in xen/arch/arm/mmu/setup.c removes the
>init mapping and returns those pages to the heap when appropriate:
>
>>     rc = destroy_xen_mappings((unsigned long)__init_begin,
>>                               (unsigned long)__init_end);
>> [...]
>>     if ( !using_static_heap )
>>     {
>>         init_domheap_pages(pa, pa + len);
>
>Could an init function's name and compiler entry therefore still pass
>this selection check after its code has been discarded? Since the Arm
>patcher writes through an alias of the original image's physical pages,
>could that write into memory which has already been reused?

Thank you for elaborating.
And yes, currently init functions could pass the check and be selected.

>Would checking active text before accepting the target address rule out
>this case? To illustrate, I think this could be addressed with a small
>change like:
>
>--- a/xen/common/hypfs_trace.c
>+++ b/xen/common/hypfs_trace.c
>@@ -3,6 +3,7 @@
> #include <xen/init.h>
> #include <xen/hypfs.h>
> #include <xen/hypfs_trace.h>
>+#include <xen/kernel.h>
> #include <xen/livepatch_payload.h>
> #include <xen/symbols.h>
> #include <xen/string.h>
>@@ -266,7 +267,8 @@ static int trace_set_filter(const char *name)
>     if ( len )
>     {
>         ip = symbols_lookup_by_name(name);
>-        if ( !ip || !is_patchable_function_entry(ip) )
>+        if ( !ip || !is_active_kernel_text(ip) ||
>+             !is_patchable_function_entry(ip) )
>             return -EINVAL;
>     }
> 
>
>Would this reject discarded init text before either scheduling path,
>using the same text-region safeguard as address-based symbols_lookup()?

Yes, I think this works.
I'll make the change for the next version.

>This only checks whether the target is currently active text. It does
>not validate reserved instruction bytes, reject overlapping livepatches,
>or establish the lifetime of a dynamically removable target.

Understood.
For the other concerns, please take a look at my reply to your feedback
on the 1/5 patch. I believe the check I added for the proposed
arch_livepatch_verify_entry() should address those concerns.

>The pending
>operation and callback-lifetime questions above would still need their
>own solution.
>
>Thanks for looking through these questions. Is there a lifecycle,
>completion, or target-lifetime guarantee elsewhere that I have missed?

Thank you for your feedback. You didn't miss anything.
I'll make sure they get fixed for the next version.

Sincerely,
Ryo Takakura

