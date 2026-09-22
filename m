Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E534EC982FF
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 12:55:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428790.1651730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x901g-0008SC-OD; Tue, 22 Sep 2026 12:55:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428790.1651730; Tue, 22 Sep 2026 12:55:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x901g-0008S5-Ke; Tue, 22 Sep 2026 12:55:12 +0000
Received: by outflank-mailman (input) for mailman id 1428790;
 Tue, 22 Sep 2026 12:55:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <alex.brett@citrix.com>) id 1x901f-0008Rs-Cr
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 12:55:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x901e-00HLst-PP
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 14:55:10 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <alex.brett@citrix.com>)
 id 6ab27aa2-bab6-0a2a0a5309dd-0a2a450ca090-20
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 14:55:10 +0200
Received: from [52.101.43.59]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <alex.brett@citrix.com>)
 id 6ab27aac-f479-0a2a450c0019-34652b3bf27d-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 14:55:10 +0200
Received: from CH7PR03MB7859.namprd03.prod.outlook.com (2603:10b6:610:24f::20)
 by SJ0PR03MB5421.namprd03.prod.outlook.com (2603:10b6:a03:289::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Tue, 22 Sep
 2026 12:55:06 +0000
Received: from CH7PR03MB7859.namprd03.prod.outlook.com
 ([fe80::967:59c2:d16:1fcf]) by CH7PR03MB7859.namprd03.prod.outlook.com
 ([fe80::967:59c2:d16:1fcf%6]) with mapi id 15.21.0451.014; Tue, 22 Sep 2026
 12:55:06 +0000
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
 b=h+i2fPDUH683qhhcD7+UCmcWM+V2OUm+v9Pgae0lbL67d+OFuUkZFm5f46rbU6p91nmz7aASC2to2zMHvqr1BDnKPeL1Qo6R1SX25xaiODFN9DylVFdNR6AYmtvtJiiGLSd2n6w9pCZEVa7yQHftRr1/aMkdS4tyjZHLq4FrlvDIJcuMOvOlsJYD0watBd1uJ0qAPjd1AXNXQrCMV+bWjJrsLeAyWqoNQP7rxy0sn7IGpVy1wS3AjZY9Htl6RF3dBeKnhp3uUfRrekQNBLnsG2n1cwIbIum2iSRCO8mdEA+YBMdIGpG9Bfd79b/ML/e/NTNEvSnpWOto2umORTmZZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMvDmdURcCKCX8S8qDj2J5NhrZcfw0jh8u43/yP7kPE=;
 b=GdTebdoaRwl3p/ZhHMVKCr71swKtxljW22YNPmkNlXsdER6mftd5Hu/99XRApE6a/BVDjMsMGfCGGvvhoV7HUdXIiA63Q8mGKm+skjyUQdlbUuO2r8BCorNjBISyPzeDPHor/LaQ+Plj/fC/gOEo+pusgN2ZEpQ0ZVBNrPDOPBSHyLql6wmeSWoNm3iYaUaogflqhtJM2+ay1CLU6y3eK14CT8T5gGm6A6abyo47P81VSqefzqWaP/FYQrXzpAenqz6dN7jHLhI1WpgQCTBDJHQbAFZzoK2MfXmJ2yh2WGhXFuNYZht58zxR1Of+iy4x9ZgMv31jLvGIVSu6xaf8Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PMvDmdURcCKCX8S8qDj2J5NhrZcfw0jh8u43/yP7kPE=;
 b=V61M0xOjiX/wJCGcntXCZ/ApOnt7/Yaj5b9yKD1y231aQCSWTqVoeRZIqxXEqnvZ+3OVTLtFCr8x6UK8r0L1Chy2krjiUcRJud/6JNIRZH3VdizgVRlUw1Uu1PkXD9Puz55n9cA/ZZm0gQFGm7/3CXnLRKT/50YcQntd1b+eEDQ=
From: Alex Brett <alex.brett@citrix.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Xen Summit 2026 - "Nested Virt <-> WinPV drivers" design session
 notes
Thread-Topic: Xen Summit 2026 - "Nested Virt <-> WinPV drivers" design session
 notes
Thread-Index: AQHdSo9DZLcioeW9H02VyiyxNJb//w==
Date: Tue, 22 Sep 2026 12:55:06 +0000
Message-ID:
 <CH7PR03MB7859CFEDBB674323A1872211E3832@CH7PR03MB7859.namprd03.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH7PR03MB7859:EE_|SJ0PR03MB5421:EE_
x-ms-office365-filtering-correlation-id: 44e796d7-24c3-4456-cd54-08df18a8ba23
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|38070700021|3023799007|10067099003|56012099006|5023799004|11063799006|18002099003;
x-microsoft-antispam-message-info:
 ml0Lj9Z3C57jteK2i+ID4Jhserpe0kJtXe53wLjPnS2H0L37uzJFKfMVmI6SQr7ccG363+ASAUx5I0dP454Y/+jKkfP1VuavR7CEGNSxKAKukvfTaN1WqTVJwNtnG7XvYGGhhAjRZ6Fjj0sYmGCNHSSrNE9hiYOCShlGVbfhb1aCWLt8forIs1Yn6S3UXrCEfCRGOYtZYjH1Gh7oZX8hP2YNdZRCMm8dVPc16mvqV3s+fY1wWWX7haIPTXWTQ4PsFeg0N4nlXA+WsT4ARaPwbcIbRB2BQzr6GuD8ru44JjICl42+e7IvA+IYKwTZg8jn4v57Gkk3c+1WptfNWMUPEt7U5sJB3HX3DM2g6pxTUEOyl3FI3YrsjAuGHm3C8PXnvm5JO+Un7PPftatpS9MF714vcBjcvrDNd7D/nDQLsctHMlo1W0zbciF3roGgT2EDGk8R8kB7XAsy7syJ/CXzbmYJhGkLJ+UN5B/tHlGwxWddL8fFPXVj/Cp1NxB6Q86F+8hxVLqUhJGGyBMuA6WPKUo1nKLdo3EEKN6xg4pJbbdlwTgpS3ugyiV9H7wPl0gSC8hSe0Ap0JfSDcNBMfKo4bSQbH/gVnBeqO4hq9nc7l4Fe65nnlCSddd9P7oVR6fiDXLl4G/E6QYzSWvozfkbxb7QLgfmDKLtVSBUdI4+jzo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7859.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(38070700021)(3023799007)(10067099003)(56012099006)(5023799004)(11063799006)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?OxN7WKVMQGi8+0zjq7zpLXFtWbaey58otWKDGVDpLLzKyqdbL0uVK0gNjx?=
 =?iso-8859-1?Q?n+HvGcl/8YET3Lvyhz6aGqivFmhrlEnN+81soeKRxYTjPmpz2IyWlXoRHH?=
 =?iso-8859-1?Q?YAeGyzjJEhcQkG0GOYX4DvXXdIpPdewJ0MBe/6JlFQU3ywgZH6wccRw/Gi?=
 =?iso-8859-1?Q?7870OcrTj+IIgHjKQjFU2RkJ3Gh5N3Ny1luiCKcQc54Ms472FTEDykBfoW?=
 =?iso-8859-1?Q?SQNmZbS+5ecA7LAxBL+66xndr02SBMZ6i7LMfFhBbZ2Klyj58Iak19zMk1?=
 =?iso-8859-1?Q?3ffphbSQiTdLUbk+GD2VCdHzfKB2FFcnAGW+/65RLD16me8JxD/MQDkG22?=
 =?iso-8859-1?Q?teB5axyJfE2dvyWB8ZxI/oVhUw1fxjPwtUW+U5UUctp6V9dfcxMXUoUVEq?=
 =?iso-8859-1?Q?WZHCpt2TEP1ZZiYhgtAJvvzkWasCG9YzkVCmf7corVH4qzcZ6XqV2DSKRd?=
 =?iso-8859-1?Q?+xsWzdAhbUuihq0w4P8SXlKMoR/3dMNQFdhMRz9OtDRp6V/zK70wpMUXSS?=
 =?iso-8859-1?Q?Ix4RsiEfGtjKTE08zZvnLg5Wxs2YfBJka3bCquuQlhihiMCF1a/+lgcIqs?=
 =?iso-8859-1?Q?dxNpXxePQnzHMZMO0Mt1/VqLcIrbRvmgmgqgkQ3ugsb8Scg+Zno1WEYRq/?=
 =?iso-8859-1?Q?WieA4StFQpEEVoCmpbvwivRoZWiS/sz7B6Odv+Mjj3Ot78hcuq9+mTwsIP?=
 =?iso-8859-1?Q?uJ+UuwT9BZndxkY++FYedRyIyxbPDoRFmvJUJecgulFpCxj2X5gCKa+KbH?=
 =?iso-8859-1?Q?xKDlnMs/I7E1coSs9Ys/RHDg/TP8oZ0SfXNRk6r5gZOF0lwgfXHGNxrvTz?=
 =?iso-8859-1?Q?5ZlhnvN8XDRMMt7icGLPqgUsMTZjdjNa49SEapuTPuE2UUu+DIx4mX7EMj?=
 =?iso-8859-1?Q?ft+lqZmp8CG4nEKbgbm++eOOZcGS3ntYEVvrPhB3LY4H7kNl3mFQR3GHlW?=
 =?iso-8859-1?Q?D8IN3RzlsmUMvKg0zfpw1X6JxuSDjcE24/ZGEhLLGcgX+5cKdOL3gLyHzQ?=
 =?iso-8859-1?Q?3jqTI4nPZTvnThRb8JlSb0g7Qi4ssLIzDqLTYeFeL7GWGz1SMfEgo2zlaC?=
 =?iso-8859-1?Q?upWuQ0RgKvoVac9KvBpT89jLyjT2ya5zSD+1GyKvxYtPKhrGMskS6QQAbh?=
 =?iso-8859-1?Q?aJueAjkx91FFGUDAjCB/QT70DdEundmgoIEBeD/o1U/De2bgfWXY2X4zYI?=
 =?iso-8859-1?Q?WBkPplll/BzssCr1rtjm2DBloI2OwPWUAfx20RPG+a64Bbcmk3bYgT4IJQ?=
 =?iso-8859-1?Q?PsLTl3KmKo9NaSArViPlGcg/j5blrWlMUskYLKT+TmCMoJDJmrsSG0U4+N?=
 =?iso-8859-1?Q?EcDvwlW5Suk719DvTBMcMyBEkZ3AGQu+lTEm9uI2Oif0Q40N5kpA3FFxJk?=
 =?iso-8859-1?Q?xyIguUfafhHIQRPXrQAe1ZU9wX9v69wt7d049/yZii4KX++v11c2d9HeRg?=
 =?iso-8859-1?Q?0FKP4EHUYew9/7RUbRm40UOyKxgFQq3lb4ErjrVh97shCPojM1lVirGjTC?=
 =?iso-8859-1?Q?6M7oZeXZ1soMOWf2mnOU5TJTLmRH4kXY5K0stVCZs0PJY3evJBpr/btIkZ?=
 =?iso-8859-1?Q?bYvT2rnJnhOnQzwLJ7wIMeYSbmsT78wFdxxhdF4xsUhyEdXgg+LHpCeU00?=
 =?iso-8859-1?Q?BQb7uaXriIsri4JCbHIxuOmDzLYhdb1sCHIUYEOw/Ziv3G4aTUGMREViJd?=
 =?iso-8859-1?Q?gi8Afc3BKNi2LWEa7fuNM2fHfVOZcHx/ZUQSFZ/3CWA32gru285vD4LqVF?=
 =?iso-8859-1?Q?l/3OT4s0ELpxY7mibtd2s+oVr//YOk9CAE0+5Bxp2PI0vu?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7859.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44e796d7-24c3-4456-cd54-08df18a8ba23
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2026 12:55:06.5802
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CAkwflQfo/FlVJig2xaVDn+9TBGnhJGrWJFASyqPKLPadIB58fU3JwmaBxdyiLQghVQZUSgjwyn8L9PGuhFVjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5421
X-purgate-ID: tlsNG-d25034/1790081710-51538A5B-90F97B5E/0/0
X-purgate-type: clean
X-purgate-size: 3980

The following notes were taken during the design session on Thursday 17th=
=A0September (https://design-sessions.xenproject.org/uid/discussion/disc_bp=
kf1nkpeOyiAehjw4xN/view) titled "Nested Virt <-> WinPV drivers":=0A=
=0A=
This is an issue identified during XenServer's nested virt development.=0A=
With HyperV, your nominal Windows machine becomes an L2 guest as the root p=
artition under HyperV (~equivalent to Xen dom0). HyperV at L1 handles thing=
s from the L2 (flowing via Xen at L0).=0A=
Specifically this affects CPUID and VM(M)CALL operations - L1 handles these=
 and doesn't give the Xen parts that the PV drivers expect - consequence is=
 PV drivers are unable to communicate with Xen. 'Feature' of the design of =
nesting.=0A=
=0A=
A Viridian enlightenment allows L1 to provide information to L0 as to which=
 L2 is the root partition. A workaround was implemented using this where Xe=
n can modify the responses so the L2 still 'sees' Xen and can enable the dr=
ivers. This relies on a _currently_ invalid input to HyperV, but this may f=
ail in future so not a safe solution and not shippable.=0A=
=0A=
Tangent: Bromium. Different way of solving this problem, did all hypercalls=
 using the CPUID instruction (Intel doesn't permit you not to have an exit =
on CPUID, AMD permits you not to intercept but everyone does). ABI for CPUI=
D says nothing about high halves of the registers, so Bromium puts a magic =
constant in high half that L0 can recognise, or if not present the nominal =
L1 would still answer the normal CPUID.=0A=
=0A=
What are people's thoughts on such an approach?=0A=
=A0 Would it be restricted to root partition? Yes.=0A=
=A0=A0=0A=
HyperV doesn't seem to have good provision for nested virt on hypervisors t=
hat are not MS. Can we stick to just Viridian enlightenments in the nested =
case and avoid the problem?=0A=
=A0 Ideal world we'd do a full VMBus implementation and abandon the PV driv=
ers but we can't (potential legal issues with doing so. Might change if MS =
do an implementation in Linux which is rumoured, but no sign of this as thi=
ngs stand - would be complete replacement of I/O model and not practical in=
 the timeframe of the nested virt project). Could be looked into in future,=
 but not a short term solution.=0A=
=A0 HyperV knows about PCI and enables this for the root partition, but our=
 PV model uses hypercalls.=0A=
=0A=
Some questions to put to MS=0A=
=A0 Never found a situation where the root partition doesn't have an identi=
ty map=0A=
=0A=
Ballooning will break everything?=0A=
=A0 Apparently MS has an API to add/remove memory that may be a solution he=
re.=0A=
=A0 Ballooning implementation in PV drivers uses API.=0A=
=A0 Concern as to whether this API is designed for HyperV and not a nested =
case like this?=0A=
=A0 Tu would like to retain ballooning in the drivers. Andrew wants to make=
 it an admin choice (whereas currently it must be available even in dangero=
us cases). Interaction with ABI enumeration questions...=0A=
=0A=
We have the Xen PCI platform device in HVM domains.=0A=
=A0 Root partition will see this device, could we send hypercalls to it? In=
 principal maybe. Specific BAR for hypercalls where qemu tells the hypervis=
or a specific range? Would mean every hypercall goes into x86 emulate! Mayb=
e could have some sort of special flag?=0A=
=A0 What would benefit be over CPUID mechanism? Don't need to check it's th=
e root partition, can just do it by access to PCI device.=0A=
=A0 Wouldn't work for PVH.=0A=
=0A=
Could we do something with an MMIO range? Can't have a Xen specific driver =
use this as HyperV comes up before Xen drivers. Could declare in ACPI and t=
hen Windows knows a driver can bind to it?=0A=
=0A=
We only want the root partition to be doing PV I/O to L0, not any L2 guest.=
 In a virtio model it'd be down to HyperV/root partition which guest it pas=
ses the PCI device to.=0A=

