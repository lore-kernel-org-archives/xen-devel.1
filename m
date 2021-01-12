Return-Path: <SRS0=tjso=GP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F886C433DB
	for <xen-devel@archiver.kernel.org>; Tue, 12 Jan 2021 14:26:00 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A4812312C
	for <xen-devel@archiver.kernel.org>; Tue, 12 Jan 2021 14:25:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A4812312C
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.65706.116439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzKcA-0006Qf-E6; Tue, 12 Jan 2021 14:25:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65706.116439; Tue, 12 Jan 2021 14:25:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzKcA-0006QY-Ay; Tue, 12 Jan 2021 14:25:42 +0000
Received: by outflank-mailman (input) for mailman id 65706;
 Tue, 12 Jan 2021 14:25:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=59Pv=GP=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kzKc9-0006QT-R6
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 14:25:41 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 37b6b271-8529-446e-8227-cf04e709ab33;
 Tue, 12 Jan 2021 14:25:40 +0000 (UTC)
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
X-Inumbo-ID: 37b6b271-8529-446e-8227-cf04e709ab33
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610461540;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=xeECRKo6TEP6cFw9eGwj3uW08jC8IWVVfTjOgLSNvpo=;
  b=HvzYzfxw5VUn4ncK7ZVNWYgAujkG6NIiG4eZw3NLq35VQMXV0+4wF1XQ
   3ZbYqHEqmE+5TiJOM60PgqKA0t/TKw1koa6mxs/4Vl5PytyZCrlKx3rE6
   AFlopaXpr11JbbBqAOm6QMhGv+tO47J2l0g4lMPHZV0sb+5id315R57JK
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 1cF+Hc5mEQH//U4F2Kukk/DpiAOxOqZYeOcZq7po0UKrQMKp6FoEDc59jP7MnOhZCgU3GPZ91g
 V5+i5LFG5pYqqsm64tWL7vaxFPaWxG5acFPx6GSVu+XgYEp218RpNXsz1BRIGThGjODNbWjP1e
 5abcYdjLWVtTh8Tgq+E6ipiKR+ym48FCr3NP9eoQfD2Np2fUQJ4cWUCpXFRPPq335Spcatcd32
 aOk2aCyHUR+M5WMNwyP2iF7yl/2j7N8ENUXRHNK5/aVbQkAMepj+UvKtwn6zY4tDttQ6pnxVg4
 G2A=
X-SBRS: 5.2
X-MesageID: 34962775
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,341,1602561600"; 
   d="scan'208";a="34962775"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NeZkZzl/iwmTvNurSkx26TU27hLqJwdwz0aY8+U6A5SJqovFqaqWaaAvoYT2uF2tr2LJXuRMsWR5a4IMumGAxEuW0meUkswVuTS0mevPyXS8bj9DQmymVwcVKQ3ymTEvgm4wrOOd57/kSZfY45suUBaZ1p4CpgzsGAHTNJWTJuSYsqWBrAGPhxpF/K5cCq0wNC1FtVY4fcwDMFS3pOHzPy7coTnG4si8DO5qvcU656i1mJy1U8PCwVcjv1gj0m9zyxSjngBZ7YWFDf3bpNjSD+cranVw02Izs27SiNwMgD3l6DSb35QQz9ysv530ns4oQq7ZcvNtBSIHQ6cZrRiytw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gjzr9TO2ZfQNGnkc+Oq7gn+vNyV9zHfJxuWejWGn6MI=;
 b=cyxYODYwONs5ivxbmD1Ng1x4UxmL5GImFtxCmmAlFZALz8MfVRYLp0hCa8SibKNiajxTRnPwdYi4wpq/XpKcHMJRcuFG1QoMxjjO0xzYU9XWFL7Xf4oQXDTZKowQtS9FZPhidEH95IYhAeH3yo+UaND7qn5dxWE0q6Foc5r2tvmXJr6zjprwiJk57bSeJFiaDQeawUmMx/lj+pM6sA+HpP+5pc9jOJRtYYorlGkYI196xuyxt8sl5nglYgRUpaDU3mTJNOdGrDP/4Lo0ZkZo8BjdsyQIqYpAAalpjFO+yRe/XkdgOT63fZ9Z1S0iFQ+EO6SDseNjsfK9lgFb+vsD0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gjzr9TO2ZfQNGnkc+Oq7gn+vNyV9zHfJxuWejWGn6MI=;
 b=UrEall2GjVTJcCKkoWCO8GsMpu++jOvq+ZY4uexmCvTVUCATL5/FX3QIsRAx9Ra43MsfczhgXAF1z6VPkkEM9ZNGEcB5qli2DMEHICWCmIzNHfP3yJ7yd3a3NU/wU3SDFNwwftILVtN050AHjGXchauMkSgcgui7MHuLn2qXXJQ=
Date: Tue, 12 Jan 2021 15:25:29 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: Purpose of translate MSI interrupt into INTx for guest
 passthrough
Message-ID: <20210112142529.btveobjtj45hcvg6@Air-de-Roger>
References: <20210112141057.xjbslkq2em56kk3r@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210112141057.xjbslkq2em56kk3r@Air-de-Roger>
X-ClientProxiedBy: MR2P264CA0059.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 243e94a2-360c-4560-8d4a-08d8b705ecbc
X-MS-TrafficTypeDiagnostic: DM5PR03MB2777:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2777182A9EACDB65CCD8B8B18FAA0@DM5PR03MB2777.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z9DgANNSgRR+0RvKAYbkiJ00he95xSKip/9fjhtUiALHXxFzWw/3uEhhBPWa0yBHmwu+NdgswxztUcusz4+6fVG0tfilAM6cv5/GHbjHfmJrjqLCilvc5YnGIii7yJsDXkdWBdeOe42169ik4B9tWzslS/Pn1W4i59y743FWLim6OYKfQOiMI7aHCwkG2lN/LVqbxcqJR99tbdwofQ/rV+eMHpXxaF6KmG/Rmag5FjCWyyxWxMA2r7leuj/96x4qYRCMgbfhmqtGQocappz0yn1dqQiaDChW3ZRLXAHJb2vMELRlMQ76g+bEjeZBEAr0qCgKRVrk+gnU8+NOW+KKmk8Ket/ADNy5vN/MjaNquYYANnaGGg32OM2aaiJ21BwWbeABBNjjUCBDA4fAk0ia7Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(136003)(346002)(376002)(39840400004)(396003)(1076003)(66476007)(66556008)(8936002)(9686003)(66946007)(6666004)(316002)(54906003)(6916009)(85182001)(83380400001)(956004)(478600001)(5660300002)(86362001)(8676002)(186003)(2906002)(4326008)(33716001)(16526019)(6486002)(26005)(6496006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aXZvcGhYVWpKZ2JlMzM5aElzSXlqSGtXckYwVnBxODhzR21nMFpTa3U4dWxG?=
 =?utf-8?B?UnA2SFoza0NKcnFFbzNGUDA2cWZyZGVMUmNkR1ZSUmx2WnZ1RWpPeXhWMTMr?=
 =?utf-8?B?cU1PM2RaWjBaaDlnUytCeUdFUFgxMEFyVU9FeUNZWElvVkRNbFJxNklwWi9P?=
 =?utf-8?B?cVN5Zy90OThBSjZSYWcvZitoZElRMjdLVnFwZENrYkFFZXZmYkQ4OW9mV0F5?=
 =?utf-8?B?UjdObi9nK0Q2R1ZLclcvaCtwSVg0Wm9id1IyZHAxaU1RL0Q4RHcveFlMa242?=
 =?utf-8?B?cTZPb05GM1o4WG1mQ3J1L0xsQUFhbVp6UGg1OUp6d1FJdk9rV1EySHdzcW55?=
 =?utf-8?B?U2l4a2s2UFBCQ3RBTmZPYlVhQXZLaHc1dzJJdW9lSzd4T1prcjlRRmZablVM?=
 =?utf-8?B?V21HaWlyZUNxdG5uUTRhaW9GL0hSTndnQnFtQjNkQTN5VlJJR1FSbUJQcDRH?=
 =?utf-8?B?NVNxK1M5WW8zeWl5QXg3WktpUDRPejFqdVowTWtlQkk2Q3AxYVNUU014TkRo?=
 =?utf-8?B?U2hFWGtxek90S211TmZMSmpEM2VwMVI1ZTBRMVUrbHlDNFJIQlJuOFdacWRn?=
 =?utf-8?B?SUNrbGFKNk42YkFBRS9tZ0hXRTFIczBYaUVJb2ZUZFcxOXJ4ZFNRM1RicERm?=
 =?utf-8?B?RytjM1NXK3dPZzZuZ0hoQ2xuTE9CK0hxQ052Q0N6VkRMakZpUnBNODhtS3h0?=
 =?utf-8?B?SEhwdVVIN0tOTGZ1Q2JXaUZsTENnZnFNUm9Ta0RMazd0cloreUk0OXdWK1RO?=
 =?utf-8?B?SUg0b0thN01SMEp5eHdMMU9LM1pXQjJzWFM0aDNtSWJaTk5ZTGErMFR3ai8z?=
 =?utf-8?B?TkgyZXplSGMyd3BCVzFCWWxwZnAxZXJIMTdMemcrYmRPR2gzTFYwWXROb3NU?=
 =?utf-8?B?QU9rbVJoVThKRm5telZVYmNadG1IaVR4RSt6d2FxSVR1T1BHSlByUXFvSnJp?=
 =?utf-8?B?Q0pqYmFRZXptRkYvb3NIcStneXdFL2daVkQ4TUw1NlN1M3RWSllrTFBIb3R0?=
 =?utf-8?B?SjYyOGptUzRsYksxaFJNcEIxQVpoYkY0a05yZ1ZqcHBmSVZiWFE3dFJBeXB6?=
 =?utf-8?B?dHNUYTB2LzFZVDNZWmlWNGZFeFJWbTVzbVAvUnZIWkdhcE5ZeXMraVdRbjBx?=
 =?utf-8?B?SW9vVE1kUHdhbzhIYm55R25Hc2ZhaE81NGNyVURyQytueVY0dzBQVTczYS94?=
 =?utf-8?B?V09LdW1PYVpSNWFPZGZFTzlHWVVqZjNlL01UWG1tK0wzVTZFeGNXRWNTNEZj?=
 =?utf-8?B?bGVJdVMxc2ZhbnhjZnBSTlZzcGh1RmFHaXZGMzJsWW81UWRPRnZQeGhoZVcy?=
 =?utf-8?Q?U1AMw3+o6FPxctvC2znl4++KbTZJIPrOul?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 14:25:34.6299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 243e94a2-360c-4560-8d4a-08d8b705ecbc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y6gSc4MwcIaWrGXtMFcydoHgL4wgm0AvkPnerr6xYmj7ZTF8a9ehftdthFBiYyUDnaZGOvAawXDhsjgA2+269g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2777
X-OriginatorOrg: citrix.com

Dropping Qing He as this address bounces.

On Tue, Jan 12, 2021 at 03:10:57PM +0100, Roger Pau Monné wrote:
> Hello,
> 
> While trying to do some cleanup of the Xen interrupt support for pci
> pass though I came across the MSI to INTx translation that Xen is in
> theory capable of performing (ie: use a physical MSI interrupt source
> and inject that as an INTx to a guest).
> 
> AFAICT such functionality is not wired up to the toolstack, so it's
> hard to tell what's the indented purpose, or whether it has seen any
> usage.

So apparently it is wired up to the toolstack for qemu-traditional,
albeit it's disabled by default. There's some documentation in
xl-pci-configuration:

"When enabled, MSI-INTx translation will always enable MSI on the PCI
device regardless of whether the guest uses INTx or MSI."

So the main purpose seem to be to always use the MSI interrupt source
regardless of whether the guest is using INTx or MSI. Maybe the
purpose was to workaround some bugs when using INTx? Or buggy devices
with INTx interrupts?

qemu-upstream doesn't seem to support it anymore, so I would still
like to remove it if we get consensus.

Roger

