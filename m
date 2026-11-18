Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD990606A325
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 01:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=H1LnT72G
Received: from list by lists.xenproject.org with outflank-mailman.1493556.1693480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTUpo-0002Qi-Fs; Wed, 18 Nov 2026 01:51:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1493556.1693480; Wed, 18 Nov 2026 01:51:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTUpo-0002Qb-Cm; Wed, 18 Nov 2026 01:51:40 +0000
Received: by outflank-mailman (input) for mailman id 1493556;
 Wed, 18 Nov 2026 01:51:39 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Volodymyr_Babchuk@epam.com>) id 1xTUpm-0002QO-Rb
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 01:51:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTUpm-00H2dr-8H
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 02:51:38 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6afd0473-8faa-0a2a0a5109dd-0a2a45078e3e-48
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 02:51:38 +0100
Received: from [52.101.66.133]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6afd04a9-b4ea-0a2a45070019-346542851250-4
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 02:51:38 +0100
Received: from GV1PR03MB788477.eurprd03.prod.outlook.com
 (2603:10a6:150:805::10) by AS8PR03MB9119.eurprd03.prod.outlook.com
 (2603:10a6:20b:5b3::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Wed, 18 Nov
 2026 01:51:36 +0000
Received: from GV1PR03MB788477.eurprd03.prod.outlook.com
 ([fe80::c759:686b:939a:1544]) by GV1PR03MB788477.eurprd03.prod.outlook.com
 ([fe80::c759:686b:939a:1544%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 01:51:36 +0000
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
 b=lazxLLIDSb7aiWUdPhfsdU6yGpm6yEEJArBvlfwRMbmIvEadmiaU1ds0zfdrOcGVCPqjd5FEpazpNoZ/1n0HeuZ89c2FFnT/aeBwMT46g6YKPkwRt/iwZEmSvOxNHDUmXA12Y4ciVtnTCT+OvFuz3JYvp8pJQKWCCbPEYY5czoOBonkrS4b7ml9Q2qzaPbtQq5j+6Rq2AzsvDYgdS/ZXh0e68gGnteviueuvFxFKsCTjH7EgTq77IjBInKvT8QaeUTxzk9ggGJjnp5EB72JHDe2BkUT41MxdTM0WlXbtc13fdmu30TzhvbbXztfA1YB6j2lQj2jGCmEjq1D0sToykg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EoT0SB2DS9g0syYnwJ+CH73SuQyEN+E328OgRYzVKB0=;
 b=a7/CqDHDqncILxybzxHxYVHiuInbYWzyNndbo7pSAstcG7LYxzzyHONyikq9loKq0zP7OI6PqVq4kXvWQrU4kg7EB8l3Pw8zeXY9CDR/TcowWdB7iJh0H1MbGc5tcEZnbEkzH7NymMetBT8IvGYDt2zwAMtU9d8WyVab7s9U8hhvQALIJhn97fAzz2RhGfhPQB7Lf298Q11ImQthiMV63gq/5S9+KgIyaZUAgbM+So/6RHkyjidgc8sOrIgo0j39LP8IkflFZKGRkuPM46RdJDwkbgPeztqdKYkFQ07xN6aQJnqr3QKo1dJLlTxDruThoRWD2QWSNxsOWQ3E/eIUPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EoT0SB2DS9g0syYnwJ+CH73SuQyEN+E328OgRYzVKB0=;
 b=H1LnT72GN5ercRQmNghJfgE4uezWNPJhFbZZvCcumPY3hSjX0NbxtN1BA/4rivyyeLj0bhK8r/Y2MHPlY1Ct4zlHVCubNlJSl2N0qXH6O0JfDJWcJpW9jXIjBlA0yUk+auiiedzofJkPKa5zmRcbJg8uE8WBkJC6md/CpP1QC+0ras1xMSh+KDOEb7MsgyBOvLLstdg3CV/ilIVGgWEzShMuHM3JWXjlmPG5Sf6VQQ82rWJE0tSeXH/LcwLcfoC414seHh9jMY16BEvvKxjTRPnM4jS/ddnp0gkXKzCeHWbrg4/F9PyqskLL9sqfF+JFW7nWfb/DuSgmu8oGg0rn/Q==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Mykola Kvach <Mykola_Kvach@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger@xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v14 04/15] xen/percpu: defer freeing per-CPU areas after
 resume failures
Thread-Topic: [PATCH v14 04/15] xen/percpu: defer freeing per-CPU areas after
 resume failures
Thread-Index: AQHddi+rPrDcM3j2gUuDy+04RxtZEbczEk+A
Date: Wed, 18 Nov 2026 01:51:35 +0000
Message-ID: <87cxs2oqjc.fsf@epam.com>
References: <cover.1794873792.git.mykola_kvach@epam.com>
	<3b0a92602e8cbc2f4df6b376876903e93850be3f.1794873792.git.mykola_kvach@epam.com>
In-Reply-To:
 <3b0a92602e8cbc2f4df6b376876903e93850be3f.1794873792.git.mykola_kvach@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: mu4e 1.14.4; emacs 31.1
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB788477:EE_|AS8PR03MB9119:EE_
x-ms-office365-filtering-correlation-id: 2b8ff53a-c10e-4dfb-279c-08df45167aac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|42112799006|376014|1800799024|366016|22082099003|18002099003|261009223027099003|11063799006|56012099006|4143699003|261102123227099003|261026140227099003|261028144727099003|10067099003|261022105027099003|261021121427099003|261026121527099003|261022075727099003|38070700021;
x-microsoft-antispam-message-info:
 gjGa+9FgpKfDxBBrLwP5obPLdWGHrQYY3oyuAN322RqMFBBD645aXKOVYw+RijJzb1fYBW2eLKsFRknOjqWACuPu/H/WuAPvouVTKkfnF1zTjwk8LIlmeysBzF+tyoiyVBVJsCp9zvdZLBguDWjZOvG853MJgYpbmACwqLIqlJudOJWIhFW9yS2k9sAfT1pC25i++prCzzqxzSSFTwRJniR2sHWdS3rY7KtvKBcBN/Hn88AFajFJvhXC04ueuoxbmi9j+J4GCptr7IjVHK+RB4R5uX1/1uXZF0gLtjXwoHa91CT/Xm7KyZzAPGQtAqGLTXZ7GIiGCLxsCNPsIhXOdbOWiXdbZ1C6+L36YvcEBYzCD22L0rggdpee2yJPmT5Ab5WKXd+Eove8cUx7Z+ZvWRvGlnBM/M0YNu6NbJNi9COZeDLJykNW6fXvsD+pHFepA8ELRx9yKg33W0lYqUYxJB7rQG4KvvCtbvDNAP/EnBMoLOdrNE8niDsZXnzsPzvf4eWBDewfHgIb2yONoSN+mv3zFIEj8klAmUU/en1aIdoOij/oxRUlArwqFScoHj8viQJy9seI8EcxboYvi53yJgCZXNt/BdY7SW32z5/Tml8ksDFM50NyUT/Lo0NQXM2bsBipqiSK9gkLFDyhXetyXowNisza+6GZJR00lB0Z/VTjXorvg+SYYEAq57Bv47hu6Gvzgf9o/a+BABYi+AVgKeKcmbPGLPCQuPlM1CokhoY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB788477.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(42112799006)(376014)(1800799024)(366016)(22082099003)(18002099003)(261009223027099003)(11063799006)(56012099006)(4143699003)(261102123227099003)(261026140227099003)(261028144727099003)(10067099003)(261022105027099003)(261021121427099003)(261026121527099003)(261022075727099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?gkYr3eWPqBP03C9AF741W5los4zTCPvI6Xcykg1+U+p+iSMJAe8qFnWL1r?=
 =?iso-8859-1?Q?P51VggzkaZjvYkal6UtBMs/8loTf5gGdP8+TsYGStSdNs9KmeDs4r79cQT?=
 =?iso-8859-1?Q?ZhVp1WR6UZzA5zHhL1ryxm0GGgk2Y5lOHXBAK4XJ2wEK/w2RO6A8tChnR9?=
 =?iso-8859-1?Q?dmdpHNswVf/qSWnbdCt7piINtthmj4xkCkpfwg6hmDR9aZrNMxIioEcnAI?=
 =?iso-8859-1?Q?JsoWl/MeGVC0rfu9Z0/7gp42bcgQoEQm2vFK7LDdKv9RopE3Zd27EhyFTs?=
 =?iso-8859-1?Q?0RXjMsWmL8e/ntZiIKoglc74dbQOCZ1CzYLPJrvbEM4UtQyafD7bs+YiYC?=
 =?iso-8859-1?Q?jIUuknY79X/CFXX8sMwpXZw+vHqIkbwhRHwW9PXUtmrpee7e2GkSTlI+Pk?=
 =?iso-8859-1?Q?zVkibrGuFzyftk21DYQELbaQJa1OYdc2ll7015wUTiDdp4k0hiszqU67TJ?=
 =?iso-8859-1?Q?52l6C2+jKCmhIiNEHcLwSGhpnNiVJHlO3iUVboKpvcIgot8GO9TDTbjJWC?=
 =?iso-8859-1?Q?S3WLLnUGPQQjmuDqed2jo6uiVAWohIyfvZ9EEdsmMamejWWTnm+lOdQY7P?=
 =?iso-8859-1?Q?jjBDTFi0aO2Lw9Jov4LgfsRv03HpxPEhCRtkL8dYZYjRqwbvAxv6ujZ75W?=
 =?iso-8859-1?Q?4hQ2/FLxhj1BEdrJIOHaViFBzm/nwMgpvHCjg7YXNWlrwXa6m9VyAVTa8P?=
 =?iso-8859-1?Q?XmTUv8BU+jb/kEGnXxcn1OVFk2RBR68qq1n2Vfz0rdYlmorMe9O3cq0er6?=
 =?iso-8859-1?Q?ALnE4OcKzujMl1LWOJK+JUWLYAHVutp9Sf763v5U9wSAckz/UrU9GCZpqk?=
 =?iso-8859-1?Q?t7/Y87L/xurewtba+neytKA0gAiN8zW6s5AMmY/heE51mGenqOrjzQIy0F?=
 =?iso-8859-1?Q?AhZOYgX8NF5YUOLwikhxqu3egJ4sr+ZOtQeo3CcT8Iqj+h1e4EcpWWXhY0?=
 =?iso-8859-1?Q?SQCpv6V8LczuuxTfAR2vTA6oDqeMXtseKm03c74QDRqxfJ5OE7XO7Q1ZsU?=
 =?iso-8859-1?Q?cjRbIuoXIAWXgdzcK2ooSv33DoN+hhXMBkgZ/Tih9HEuZs4fwPevoz8nS6?=
 =?iso-8859-1?Q?quLywnUxeip+/n/a0Nqou8GnLCOZ6LfeeW9QlfmHYEaWuwHIQZM/P3HOSo?=
 =?iso-8859-1?Q?DAGHu7TlrhlDgKrtQodPR0IEdkQ+dXxYOdH63CQAahbHn13Q14rJt8/BU5?=
 =?iso-8859-1?Q?Z8aLQf0luUYrsL9y6dRcz+VI8iktaXfEgHxPAfeA14TFukwifu4t71KCVx?=
 =?iso-8859-1?Q?z4NEOQhcP7RjzbFMvbEfZRjWwps6yjFcXFt2DjOPxUIuhZsfBSJcfowgPb?=
 =?iso-8859-1?Q?73PHc1qvk5Q6JJdlHuOakgLrTB2Zo039yFWQfe5qAsBfMk/CbKAMSUz2zS?=
 =?iso-8859-1?Q?ppwqyPjj3Se5qPSSBGPbQFM5KuqtGCKtYyyeLOkDM/FORrXTg/q5WQF2Hl?=
 =?iso-8859-1?Q?OD86UaJGzRXqnM+wC3QXR2nGyY9QGorEKv5y1mpBu4JIK8qQ4qUnlVT61S?=
 =?iso-8859-1?Q?ViW4H1qVUB9duqvK7+p2gFMtZ8SiEs12/Dolls6zckkp5X1B8BD6P4DYBT?=
 =?iso-8859-1?Q?TTKWo0qXxuBrOMad/Hpw5XOjTJpcF+UE8tC4Mg20DiGQCwjKT5qFkdzI7R?=
 =?iso-8859-1?Q?CGH3BbpGpgmW5QQHZ4t6UE0Tn6kQXyXFry+496CAHejMQ+Uq0e3gfKQZAq?=
 =?iso-8859-1?Q?E+siM+cnFC7mNwefIaAq0BhY1dpv45/MARxZwGEQY2Boz9/BYGTilX5nnE?=
 =?iso-8859-1?Q?SqpRpvX5Mftofur+ISar+QTGare/l6SwCxW2s631+D8Z3gFhf3poB6cEGs?=
 =?iso-8859-1?Q?OoSyFhA94N7sWQixAujH+Hve7Ks8b68=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB788477.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b8ff53a-c10e-4dfb-279c-08df45167aac
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2026 01:51:35.9194
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gl4/2BsgS4Kl+/uH/vHMUWW3ir5ZBVPGqOmBZl+YOXiNGaImyHuIOVlCQEUJ+N3VkpEYE11VIlI9fwT1kWNWmDqc/IAtKxRQZxQvuCArgfw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9119
X-purgate-ID: tlsNG-ef75cf/1794966698-A7AD0AE4-BE742591/0/0
X-purgate-type: clean
X-purgate-size: 2896
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

CC'ed Juergen, because I have a question about cpupools.

Mykola Kvach <Mykola_Kvach@epam.com> writes:

> When a CPU fails to come back during system resume, cpu_up() sends
> CPU_UP_CANCELED. After trying the other CPUs, enable_nonboot_cpus()
> sends CPU_RESUME_FAILED for the same CPU.
>
> On architectures which do not park offline CPUs, both notifications
> queue free_percpu_area(). The release metadata, including the rcu_head,
> is stored in that CPU's per-CPU area. The first callback may already
> have freed the area when the second notification arrives, or the same
> rcu_head may be queued twice. The CPU_RESUME_FAILED callbacks also need
> the area to clean up timers and CPU-pool state.

A bit convoluted. As I see, problem is caused by the fact
CPU_UP_CANCELED is a terminal state in a "simple" CPU up sequence, but
is a transient state in a system resume sequence. As such, theoretically
other per_cpu callbacks might have a similar issue when they don't
expect one more "CPU state is bad" callback. I can see that
common/timer.c also tries to handle both callbacks as terminal
ones. Probably, you need a similar fix there as well.

Actually, I am not sure why do we need CPU_RESUME_FAILED in the first
place. As I can see, only cpupool handles it in a sensible way. Which
begs a question: why cpupool can't call cpupool_cpu_remove_forced() on
CPU_UP_CANCELED instead?



>
> Skip the per-CPU release for CPU_UP_CANCELED during resume. Let
> CPU_RESUME_FAILED release the area after the other cleanup callbacks.
>
> This prepares the common code for Arm system suspend. x86 parks offline
> CPUs, so the per-CPU notifier does not call free_percpu_area() for either
> CPU_UP_CANCELED or CPU_RESUME_FAILED.
>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Changes in V14:
> - Clarify that x86 skips free_percpu_area() for CPU_UP_CANCELED and
>   CPU_RESUME_FAILED.
> - Remove the blank line after fallthrough. No functional change.
>
> Changes in v13:
> - New patch.
> ---
>  xen/common/percpu.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/xen/common/percpu.c b/xen/common/percpu.c
> index f180f37253..757de111db 100644
> --- a/xen/common/percpu.c
> +++ b/xen/common/percpu.c
> @@ -82,6 +82,14 @@ static int cf_check cpu_percpu_callback(
>          break;
> =20
>      case CPU_UP_CANCELED:
> +        /*
> +         * On resume, CPU_RESUME_FAILED is sent after all CPUs have been
> +         * tried. Keep the area alive for its cleanup callbacks and let
> +         * that notification release it.
> +         */
> +        if ( system_state =3D=3D SYS_STATE_resume )
> +            break;
> +        fallthrough;
>      case CPU_DEAD:
>      case CPU_RESUME_FAILED:
>          if ( !park_offline_cpus && system_state !=3D SYS_STATE_suspend )

--=20
WBR, Volodymyr=

