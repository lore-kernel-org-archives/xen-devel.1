Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D50CC79FBB
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 20:32:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1415427.1644866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4lRD-0004zh-5e; Thu, 10 Sep 2026 20:32:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1415427.1644866; Thu, 10 Sep 2026 20:32:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4lRD-0004za-2h; Thu, 10 Sep 2026 20:32:03 +0000
Received: by outflank-mailman (input) for mailman id 1415427;
 Thu, 10 Sep 2026 20:32:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1x4lRC-0004zT-BK
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 20:32:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4lRB-00792O-J8
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 22:32:01 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6aa313b8-8faa-0a2a0a5109dd-0a2a4502df32-36
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 22:32:01 +0200
Received: from [52.101.57.49]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6aa313c0-6ca4-0a2a45020019-34653931d529-3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 22:32:01 +0200
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by MN6PR03MB7768.namprd03.prod.outlook.com (2603:10b6:208:4f0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 20:31:56 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%6]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 20:31:55 +0000
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
 b=jBq84HX7s59uSUw9pbyAwqYB0xb6zKCcPqjWJDMVv4blaIWrMlT1s5bhHODJ97JLeccLyjy4bmQ4hPHIntnFsRcu0cbJNsVCjDmAlm794oYxUPy/Xij5d2soZ3AhEEnZ7VYLwv5wnr4KzLbhvzJYjjWhSkEyHNORGMY0Q/y1xRz4Li1+krQG+P0JtW8S6TpjX4YqmxKa31xLIOcL2r8QPhYINHnpPz9CyvslC/AAJpqvtLQzxZBsjsKMTCmUqNeObgRisa/yn7pCQ+S8C79W1VDqBEKxKc9YFV3BWOr8Im4VupOW3XMf0bEXHRBgp4IhD5RSwC05XCaUG8IBwk0bBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wEbDAkEb3nHY3MGtfzlFxQnDkuSHHnm0iH4vRZ7wVhg=;
 b=lat96BWnPUHQinL6bPWRm1lezFRmBGgxwqYo6wnp5pG+m3qBvCjZtvC6jJGjqwgd/Zy/lp0eoYNxppMYzjuLLQ2Rs45/oN8E69nNMrs+EG83rXP1HRXZ8RRMPalHUbVzeYz9lZCOpdeabNHqMlw9PFSv0xPgAM4CX6ahn5WO7hvKMVPJcg4mByB2NJV23ngCytX1/+ZxTxfywJ2tMt2fWkQTU83+KxK49a4MMgNOLmyKqCp0TD3ZclyoIUzAsLD3dDzqk+yzt6boX2XdBtni9giTSu0Kq+Z8yXEbkDk5pYTHzgx1VY//TGQJpw3oOABOZzyznHn4MlaaSJuzeF54+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wEbDAkEb3nHY3MGtfzlFxQnDkuSHHnm0iH4vRZ7wVhg=;
 b=XBGR4HCqRNPdIDorX+ILEaiorPQi23Ms5aQyXcfVGJ4wXkem6WVg58f7TMyQOH/pEMJW1OXcuKOLSPtbku5NYlUtilZqAOkgxLD0PFIV5Aef8aQX3gG6Yhme/6rVJJEJ15/8xMNVf0vq0K0++b5wQkyW0ntv9APeht9yH3pkS1A=
From: Kevin Lampis <kevin.lampis@citrix.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "jbeulich@suse.com" <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper@citrix.com>, "teddy.astie@vates.tech" <teddy.astie@vates.tech>
Subject: Re: [PATCH v2 0/7] unmap_page_range optimisation
Thread-Topic: [PATCH v2 0/7] unmap_page_range optimisation
Thread-Index: AQHdQWKKDMHR64CGkkKXV94EnNSEDbbIQ49z
Date: Thu, 10 Sep 2026 20:31:55 +0000
Message-ID:
 <BY1PR03MB7996A88B2AB0D4C088E5899FF3BF2@BY1PR03MB7996.namprd03.prod.outlook.com>
References: <20260910202729.462828-1-kevin.lampis@citrix.com>
In-Reply-To: <20260910202729.462828-1-kevin.lampis@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY1PR03MB7996:EE_|MN6PR03MB7768:EE_
x-ms-office365-filtering-correlation-id: f9be0c28-942b-4635-31c8-08df0f7a8e2a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|10067099003|18002099003|22082099003|11063799006|56012099006|38070700021;
x-microsoft-antispam-message-info:
 dHarOKlTqxdTJyE8iThnomkzmDZRI3qKlnh+cEWpO4IeYSZHG9VZhCGZfqUV+n4maDoiI7rAymLXx6WF6vAGMIJvqD+p4w3TFT58uv3L5xzTzPW4Btv6JZVkG0oY9imdjYZtMfzao9dqmbrC0wDWUdjcVQvS1qnzutYBf9TbNkScgFivKuWCQPcsnoBewtZvb8CswYsA7u+HGWFaMjRXoMA/5hYXsxiRn+f3X4/qF9KwXYsgAc/0OBYR7+MTfLVRXXMV9pvsrrRB8VIskFN7cPSaNTXqSYOAl86a/gd3igWqMAftxQuCV8yptZVzMGOVSOnY1sKVhFON9FEmNwQPoD2xC3NKNKh0pHlfJBJOc/WuhDLtl8CK4u58BGpsBVpuOIr80fcKNkwTdfPq/2dEv5u7TfOIM9ZeTSHgumgVOSLLFPJwAC/14LRLamWocQ3rpyzAVYpgqUnykB6jmpI1mx3eD6BM8tGjkmBWV3p8mcONsx6M5MCs+DexsbHPJ3uPysJ93F/o7PL/ltu+kslOjrupp24J4LXkHHEor35tvtGW/xAMWntz6BGoCyJRzCppzVR+v8+6u7xstTx/mExJiCv/4TBvlGYcVwFhZwWhWmh+wWoUgEa2078++5DdpP0IwmeBdSEEYqsNd6e2aPrxXk0mhxejb1LpmcgfoGD9uqqOXFoNq/yT97zNhoB744VRAQuGk12mEindf9bnth9jPj9gxItLDhFaSU9UQ0xjHZY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(18002099003)(22082099003)(11063799006)(56012099006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?GfwLMaxoleZCZCdoSO4rAmISYaMWAoXGwONmcT1M8AkBRLQOwPwxHq5KJ2?=
 =?iso-8859-1?Q?ZbeTRmb7JegsS6Okq4s+uQN7Y3EVRoQI+xIxK2KQnp8oyDMAzgpswcRQZj?=
 =?iso-8859-1?Q?NDqk6HeURFzIBBQYXcUoorMxHza10upqWwH365OT7RKUmud/fX5gCXiTIp?=
 =?iso-8859-1?Q?AiRmqQuBdXRiZFTVMOJx4ayZhtuNOeHbuRhZ4kp1bLPDlI5SyGCRkTciUH?=
 =?iso-8859-1?Q?sSd9GtphbZ+DuyPDxDthwqzJBdBPfkso3I5D/sACspMHg2r001EysG3Xcv?=
 =?iso-8859-1?Q?iNX7EzzsheFMZKm7saGDPIdMPGQ3mcaIJqN0kmEBTN1qz2n0sEO3LvOwaJ?=
 =?iso-8859-1?Q?Y4qHG5NQE2mynBEzwGkVVPfmOwh1TlyLjvHPZ8Ajoq1rVKj4npE4jtZsuc?=
 =?iso-8859-1?Q?KUCdK9uk5dxLm+gbwOSFu9iSPNn75Ni9Fyt5+qIOkmz07XOviIkUeReSQu?=
 =?iso-8859-1?Q?0q3snMrdfJMlWz9KD3fSDpsDdCuD9PrfUwTeqXQkqdwdOPJ8PH8oUGMB2b?=
 =?iso-8859-1?Q?DVEcht09r4W99fU/MAlGwfw6yQvZrt3kmY4CX2nhaoZhTA6hyt1DPq/icH?=
 =?iso-8859-1?Q?f2VqMN/ieQZw/ID9+6pWz9H1wXfw85GXYWIHEcDY+W4MuNoXoTrejnJFat?=
 =?iso-8859-1?Q?imc54JKa+5anqgww4iPEGfFcAtxNMHczoYtbCHsk/SBllryDwOLRo/VeFM?=
 =?iso-8859-1?Q?QL6i8Eu6KuVb8yQue8brBwwquG41r25ae5hsOJSVnri16hIRd7Mg9SWI7r?=
 =?iso-8859-1?Q?nbjW+bZTEqvDj2OILMRZq+d9FLWJHEX01vvtFak2FzD+vg6tRsQJ4YgJdi?=
 =?iso-8859-1?Q?r8crVOlzrdC6Y/iHwb6vfv5TtOVmUFjh4BdFpjpxhhEfNECaIO5ulacPdI?=
 =?iso-8859-1?Q?FkS5w1KVeaUckzEhj62AjqK9voirtt0hBrG6uu5gykY7cTWqU/V3twNVTs?=
 =?iso-8859-1?Q?d96tgY0Tc0nnF01Ba0XVsWCh9mQ52XwQsw2fekcN1URn0eOZ86kRpuwk8s?=
 =?iso-8859-1?Q?1l14lasFx1dHoHMJztZXSIt4tv/usytzPCpNSkEXTnLG47VQ7bjcx50mzC?=
 =?iso-8859-1?Q?DGv+G6LlDBek6+lA86SzMdYpbtz9YDClRq2x8F2Nkdt4njifFZBFvOqG6f?=
 =?iso-8859-1?Q?ORFCwnzlHSuoM2o6NC4j13L32m1r9zwLboP0pyLg4diTOTRYW6QeJiL6mE?=
 =?iso-8859-1?Q?pzzwzDb/nK2lynw6wQh5o+g9U2oS/pfUEreFn66uQ1QzAntzLcaGA4ajeT?=
 =?iso-8859-1?Q?V4TAdesityGjQjr96/aWpccBQSYSRhjfm8H4/08YA4/I+oWU/PtN46+R0Q?=
 =?iso-8859-1?Q?LudquOToGqT5K7mA6VD1pTXB7zXKqlyq6FZYwzPNaNV5tHnKDpGDndgSOo?=
 =?iso-8859-1?Q?goC11mgiHPfAQkV9BlnhOn41dm/v0sI7sB9tOGMmjvfMzOc0y1TgW4CTWB?=
 =?iso-8859-1?Q?89JJI2bwID1YxOJEa9X8qmogO+EB2e/849n01XHELbcNLBic1fu7z/7h7w?=
 =?iso-8859-1?Q?Gg3pX5torKB2nN2qXp1KMuHxbzigIbTim05lX/V0yA8RAdNUSO1b1ThR+H?=
 =?iso-8859-1?Q?O7MeDjZfFDDF2fAewy8D4a3NMqfH42zdC1i7iPQ9HHazhnS+bPTS8oZvaj?=
 =?iso-8859-1?Q?opOi0V2m/HdLEwoQM0ngpZJ0cz5Hcpubd0K5ReIj5oJp1FIMfyjLSjGW2t?=
 =?iso-8859-1?Q?AI4049wPI8vmtYYdXaG/0x0mr9ephRgjW2TWgw4S3IA5b3PXLyVOhRmIL2?=
 =?iso-8859-1?Q?RvqwI4C9wIomn0C7x8Nz1HeZnwxM3JVmsB5+gTgOmOb/vS?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9be0c28-942b-4635-31c8-08df0f7a8e2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2026 20:31:55.5064
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r8+AiTAwQaiP7wHHQBV96WAMBl+17BjOvH1Sz+qEETO1z68x8EvbBJwfb9JfLkwL00xuAe8Bw+wgdOrBp3LkRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR03MB7768
X-purgate-ID: tlsNG-720697/1789072321-F2AB52AC-2D3CD40D/0/0
X-purgate-type: clean
X-purgate-size: 94

Sorry git send-email stopped in the middle of sending. I sent the v2 patch =
series again.=

