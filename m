Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A0CC88E7D
	for <xen-devel@archiver.kernel.org>; Tue, 15 Sep 2026 17:42:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1422002.1647612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6XB5-00062J-9p; Tue, 15 Sep 2026 17:42:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1422002.1647612; Tue, 15 Sep 2026 17:42:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6XB5-00062C-6J; Tue, 15 Sep 2026 17:42:43 +0000
Received: by outflank-mailman (input) for mailman id 1422002;
 Tue, 15 Sep 2026 17:42:42 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1x6XB4-000624-D9
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2026 17:42:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6XB3-00HYA8-QD
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2026 19:42:41 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6aa98391-2eae-0a2a0a5409dd-0a2a4503be64-0
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 19:42:41 +0200
Received: from [52.101.62.9]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6aa9838c-fae8-0a2a45030019-34653e095667-3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 19:42:37 +0200
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by DS2PR03MB8418.namprd03.prod.outlook.com (2603:10b6:8:32c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 17:42:33 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 17:42:33 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vPRURJwUI9cbGGOtBMdGPEurIWB/B1bwqvf1XO/wcKCfL5vePF8BTr+fVFyxtRMAb/zUEVk50ef/gkcJQVCn4K/7awWIZGLATYitCMG/yXpFVFGGsrLLoxS61v8gD8R8g7vi6IaG6Vlok+dQVdKec8bruNj7c2lmWjjSU+EbbXmhxarl6Q3UBZtGdhVpjvvqfV7lfuj3hZAZmfYIgOjS0xW3Y8GgrIrioFOyS4Hd/8t0iwXGeIQoYQ9QtjsTEM5Oyv2D/qJr/kdgwtWpsJ9gY7Pv4xZYJvY/B4F+sAen5ODte6s9xLjXN/QYT/o9fl0n2ybyh+XC4EnHvlcnqEpgVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p4gN79TQcPC5idfvpcfAo9WIw4i8UsGMHqTsnqefc7w=;
 b=NRZwooYzgo+fudkqNo6iO1/LbO3GNNZrLpydH7OCtuCIABbZJXT4T3E6KA/jHIleIYvDqI8l7gI/kS0dWQMc+nAKk3YT1Qyfr9PicBZbBmITcKDzId93xgTAnlb5crMEJt4s5nb7IYcGRf8GnyS8AxVenzQFGW9lkLOjj53/uvL6y75exk3QEoqaskMXYxTkzakdVK5SeZhHhtZA/BZkkd3uge5U+8/SLTQrgXiCAlJLOmGqBztNZ7thoChQv6WJh9VTATKfvYr06Wv7HE+oGUuxXtVbK0+vfOhx/MGHRrojD6eVAJBGIVLRZ29DuIzyzv75z3b0LGJpG4jeh/4E7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p4gN79TQcPC5idfvpcfAo9WIw4i8UsGMHqTsnqefc7w=;
 b=LQQfzW8b3Q3FGDji2/8XR//MfjZPakYAd1sxJMGZJHAAyXr8NHF089to4tcG7janaP7m31RMLne2mFF06mu25xfDMkgbokdtoS0z1TDSoy1KY2cILjX8P2irVq1ICc+jeltVteZFAqBkuGSUv3HGkbf4WpFNrLXYA9QPMUnBp20=
From: Kevin Lampis <kevin.lampis@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "jbeulich@suse.com" <jbeulich@suse.com>, "teddy.astie@vates.tech"
	<teddy.astie@vates.tech>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH Linux v2 7/7] xen: Add new Xen pv-op pte_get_and_clear.
Thread-Topic: [PATCH Linux v2 7/7] xen: Add new Xen pv-op pte_get_and_clear.
Thread-Index: AQHdQWMkTXxtUlg8hk+HuEHbfTb847bJVMcAgAaZYss=
Date: Tue, 15 Sep 2026 17:42:33 +0000
Message-ID:
 <BY1PR03MB7996E1DADE6C578C978BC9AFF3BA2@BY1PR03MB7996.namprd03.prod.outlook.com>
References: <20260910203113.462943-1-kevin.lampis@citrix.com>
 <20260910203113.462943-8-kevin.lampis@citrix.com>
 <a6ec6fb7-719f-4968-9b6f-0934ed61ea19@citrix.com>
In-Reply-To: <a6ec6fb7-719f-4968-9b6f-0934ed61ea19@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY1PR03MB7996:EE_|DS2PR03MB8418:EE_
x-ms-office365-filtering-correlation-id: eb2847da-ac02-4e2e-1e41-08df1350b965
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|6133799003|18002099003|22082099003|38070700021|4143699003|10067099003|11063799006|56012099006;
x-microsoft-antispam-message-info:
 5nVsYgAZoXGYUrLJj6+3HSK5bOXqRHvohEs2E3NxqfoASR8bqrq8o2yOBnvq1Jlz0tESIx1fvMoR9Jvl4K+vbvukuTJAuIyO0uT5itZ2EQ+I5jj/Z0n+Gokd482n8vzyeU6boW0dephKoQKtBf41dODMP8xEE0faZSJ7GOKSoLLgf+aziUcyU6PvC2D9r/zFzE6JhNA2XSSx4jTXwCu2vpsVO1/DIia0gYX2ZRNDC+0FB7BENBXGtEIq92/p1VKqS3qzZZ3Aji+I0kqs9o+72mgFhepuYgUX6eRGcZch1GIk2Nyy4cHgBBiKWFhdZqpgRoT8jqr1PFBgHBluQ0C8t8zRTA/aoLy7FhwbUX9Wdt/oRFwdLt9RCj944uD8HJKMeoR9jwV9SYD7YQRFeTq20KFb6q+Ff/e8DCTdYjbvB1ICHxuRdsAaACQjmWQjVV7FxXN2TJSO8HQ9OwBIMXXdHHHGddieUNSrFjjasNwHt5C87OE28/Je29soUujeImLhv4ah9iynCvNTHJJIFB1mNxulczmPkvx0AO/E1j+Q8/XFEdVuQGGjlbnQtOw4ecKxUB9tvBcEvTMjVRxW1yV99O1lsKurHXYoWnFl+NBtQIX2X1ZBk+tgdbwUGszoYFpfqZzFkneF+SPeoAEg7SGEPWWF3/p1UBmqI8b/a9ctew5AVgehD3Y9VWTLAPq7kBhRu/MW+3hUVWz50H8u9AefsMQLy9kfPeI/I3cwJDi/dOg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(6133799003)(18002099003)(22082099003)(38070700021)(4143699003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?vnjQDTeuVN8Tl8ekJ5WBHwZ31GpSFR9Qj1h2FEwViELJKn0aDerDlsIQgA?=
 =?iso-8859-1?Q?roqdTXU8pG2M/l7H6zJaHXLO+Rfsn9wP8Y/J1/EQW1z0z6fe7sXjRJ1zFb?=
 =?iso-8859-1?Q?+vEOmpgI6KnCTz+cNBwxDhuIXntg5LIkZzOlECwViUjjVRpKkx2I/YHZZQ?=
 =?iso-8859-1?Q?Q7LuCmzImkG/q+4mAY8HKGegTQpWVJ3Gv4JUprEiVsCesLbJVD2ZfBxRYE?=
 =?iso-8859-1?Q?AFkhu+eCtvlVXnrVHAk9pf634MPd4m+PgopiEgoh2FAuYEn3qAr889RtVs?=
 =?iso-8859-1?Q?+mERbqgU4ioxwbwa2j2QR9H0vAwBAhgVKrUf15aw+O6M7lnoyU11d+3Nh1?=
 =?iso-8859-1?Q?2CJmwCfEc1ohtwrx4IO9bDVebaUPwYHcl6Cj/VcMkiNVRq+pdPU1QVXTWP?=
 =?iso-8859-1?Q?uzQ3lYdNuLsGUqjhmvuLan1yk1bvWrOGd/19MORquqvqI5QdlZe7isTEfb?=
 =?iso-8859-1?Q?/bRkcvUeJtwh9tWo+9eG6UwE7u2ciOKuwGl3OTEr4D2cQF4lLV6FnLPXXn?=
 =?iso-8859-1?Q?U9xy+W5LfFaVaS1f7GTyyBSCrFJgXZQEWlLBEPpwrHcIfd0PG0EHJ4WK98?=
 =?iso-8859-1?Q?IKSLTrvnPh76hGAIioVx6Q74NIm7P+nrZRvlH7CswxksCSQ5Rw4UkTt5bx?=
 =?iso-8859-1?Q?XkFlzlwyNCjqLaqhVOXBfECiZ5dLkGHjaEaW0arJaXbKUVLyxeUNGYqRQE?=
 =?iso-8859-1?Q?6v5S87DApEITOyGU51Dv3KN606Il3YvzViFXEu5j/u/az5NoU9mRXZWKuL?=
 =?iso-8859-1?Q?FO0HAspHRYAf7Q/+4RcISsQbUSOB7Q8I8+VOpNtikBDVs9mzz1nYBJiDdG?=
 =?iso-8859-1?Q?vgD/6Lwkuz6oBnYNJgocjKcF9Snm4b2VyiZe6JgqTlWZ6KiLHokw65JTjN?=
 =?iso-8859-1?Q?8K9JCcQAWv1Ocb8YDnk9nTFWiUgViuyZ6Hj+FLtryGbbTJumDL9QkD13cP?=
 =?iso-8859-1?Q?ZpO/ygq79I+JFq6e5DmuryJ+H3oTN5RzeoldbwCl0mZcv6zAAIbctxO4qh?=
 =?iso-8859-1?Q?nHvG4j66qbM/kh1XVNKUzwlJ9+OdOJg9p6e7rpRuuLFV6rLe9utM3L3Q4A?=
 =?iso-8859-1?Q?CB88nr7XTa7EIDGDyT3k2Rdit8WhC1QDDVWQyLQc2pt3PLF1CnqWo7zHx2?=
 =?iso-8859-1?Q?/8yZuSsm1ypEctzas/EC38A7L71EG+Ng/cWCMV5/nKb6V5UDAK2+y0MuPU?=
 =?iso-8859-1?Q?yFNmCGlPAoI0cC0RWpzfbLWGA6+0lqIboGcLPWrac6BRcU8XkjhAGf7Z99?=
 =?iso-8859-1?Q?Dhdw3SImGBE9zSeI243uxLrvv0ntv7w7OGVHD4PsIEa6w+Nz+BT1Nij3Qd?=
 =?iso-8859-1?Q?wPa6ENxiKCT96LDSzqsq4SYoKlEDXN0ASDW7Ik8SvoSG0oEqnVraEH+B43?=
 =?iso-8859-1?Q?xpO9zsi2Fm6vCLzQuuoxJk7plxJ4ytAOj9Vibq3cQVFmv8jYSnmFamCCBp?=
 =?iso-8859-1?Q?JurrJp7ODQo6b9FbwIJF327fFXLhGwt033NJPTw8TkbH+7IuMPQqJfQR8s?=
 =?iso-8859-1?Q?PZTEr2Nleyg85cHL9uWwNAXAtGhfH0PNxfFg1He7xyzTAh2GIS7waGus57?=
 =?iso-8859-1?Q?RNkiirZs6HCJLa/RYMPZ/S0C9zVef3kpcC23T1mV2bduVg+VrIIffi4OQD?=
 =?iso-8859-1?Q?kirsiWdoynDJVJha6+VRovdDypNnfOoBk6DKMxsFg542fK5eN1WSl5rKrR?=
 =?iso-8859-1?Q?nyled/ol6roLFm2JViTunlvP/R19VGQ4BO7MquP6E79mKHvc6HIkTO0X8g?=
 =?iso-8859-1?Q?/GQ8oNjaZsSjbHO7w11qPOZNo8Wp9T0EgLexyL291dlqdM?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb2847da-ac02-4e2e-1e41-08df1350b965
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2026 17:42:33.8604
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xRU2VsoLh49Dwv3re3oXuukliP7TAQL+JwlHPC8ybPP/ha/3WWpB3RYgQN05gOb50kcol6eS82vgjaqOpVKEFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR03MB8418
X-purgate-ID: tlsNG-33051d/1789494157-766FB4E9-654F565A/0/0
X-purgate-type: clean
X-purgate-size: 3288

>> diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/para=
virt.h=0A=
>> index 0591aa38fd85..0a3a286c46f0 100644=0A=
>> --- a/arch/x86/include/asm/paravirt.h=0A=
>> +++ b/arch/x86/include/asm/paravirt.h=0A=
>> @@ -373,6 +373,11 @@ static inline void set_pmd(pmd_t *pmdp, pmd_t pmd)=
=0A=
>>=A0=A0=A0=A0=A0=A0=A0 PVOP_VCALL2(pv_ops, mmu.set_pmd, pmdp, native_pmd_v=
al(pmd));=0A=
>>=A0 }=0A=
>>=A0=0A=
>> +static inline pte_t pte_get_and_clear(pte_t *ptep)=0A=
>> +{=0A=
>> +=A0=A0=A0=A0 return (pte_t){PVOP_CALL1(pte_t, mmu.pte_get_and_clear, pt=
ep)};=0A=
>> +}=0A=
>> +=0A=
>>=A0 static inline pmd_t __pmd(pmdval_t val)=0A=
>>=A0 {=0A=
>>=A0=A0=A0=A0=A0=A0=A0 return (pmd_t) { PVOP_ALT_CALLEE1(pmdval_t, pv_ops,=
 mmu.make_pmd, val,=0A=
>> diff --git a/arch/x86/include/asm/paravirt_types.h b/arch/x86/include/as=
m/paravirt_types.h=0A=
>> index b4c4a23e77a1..1bd4c19450b5 100644=0A=
>> --- a/arch/x86/include/asm/paravirt_types.h=0A=
>> +++ b/arch/x86/include/asm/paravirt_types.h=0A=
>> @@ -135,6 +135,7 @@ struct pv_mmu_ops {=0A=
>>=A0=A0=A0=A0=A0=A0=A0 /* Pagetable manipulation functions */=0A=
>>=A0=A0=A0=A0=A0=A0=A0 void (*set_pte)(pte_t *ptep, pte_t pteval);=0A=
>>=A0=A0=A0=A0=A0=A0=A0 void (*set_pmd)(pmd_t *pmdp, pmd_t pmdval);=0A=
>> +=A0=A0=A0=A0 pte_t (*pte_get_and_clear)(pte_t *ptep);=0A=
>>=A0=0A=
>>=A0=A0=A0=A0=A0=A0=A0 pte_t (*ptep_modify_prot_start)(struct vm_area_stru=
ct *vma, unsigned long addr,=0A=
>>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pte_t *ptep);=0A=
>> diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtab=
le.h=0A=
>> index ac295ca6c92f..b0d7d6520984 100644=0A=
>> --- a/arch/x86/include/asm/pgtable.h=0A=
>> +++ b/arch/x86/include/asm/pgtable.h=0A=
>> @@ -58,6 +58,7 @@ extern pmdval_t early_pmd_flags;=0A=
>>=A0 #include <asm/paravirt.h>=0A=
>>=A0 #else=A0 /* !CONFIG_PARAVIRT_XXL */=0A=
>>=A0 #define set_pte(ptep, pte)=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 native_set_p=
te(ptep, pte)=0A=
>> +#define pte_get_and_clear(ptep)=A0=A0=A0=A0=A0 native_ptep_get_and_clea=
r(ptep)=0A=
>>=A0=0A=
>>=A0 #define set_pte_atomic(ptep, pte)=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \=0A=
>>=A0=A0=A0=A0=A0=A0=A0 native_set_pte_atomic(ptep, pte)=0A=
>> @@ -1243,7 +1244,7 @@ bool ptep_clear_flush_young(struct vm_area_struct =
*vma,=0A=
>>=A0 static inline pte_t ptep_get_and_clear(struct mm_struct *mm, unsigned=
 long addr,=0A=
>>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pte_t *ptep)=0A=
>>=A0 {=0A=
>> -=A0=A0=A0=A0 pte_t pte =3D native_ptep_get_and_clear(ptep);=0A=
>> ++=A0=A0=A0 pte_t pte =3D pte_get_and_clear(ptep);=0A=
>=0A=
>This looks like a typo, on a path you didn't compile.=0A=
=0A=
I don't understand what you mean here.=0A=
=0A=
If `CONFIG_PARAVIRT_XXL` is not set then `pte_get_and_clear()` is replaced=
=0A=
with `native_ptep_get_and_clear()` by the preprocessor.=0A=
=0A=
If `CONFIG_PARAVIRT_XXL` is set then we jump through the pv-op machinery=0A=
starting in arch/x86/include/asm/paravirt.h:pte_get_and_clear().=

