Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D377CA5FD9
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2026 08:35:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1438929.1657455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCYjK-00032I-FR; Fri, 02 Oct 2026 08:34:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1438929.1657455; Fri, 02 Oct 2026 08:34:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCYjK-00032B-CO; Fri, 02 Oct 2026 08:34:58 +0000
Received: by outflank-mailman (input) for mailman id 1438929;
 Fri, 02 Oct 2026 08:34:56 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1xCYjI-000325-D1
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 08:34:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCYjH-00Bgmw-5h
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 10:34:55 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6abf6ca3-e002-0a2a0a5209dd-0a2a45098314-32
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 10:34:55 +0200
Received: from [52.101.43.23]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6abf6cad-be1a-0a2a45090019-34652b17c1b0-3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 10:34:54 +0200
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by CH8PR03MB8324.namprd03.prod.outlook.com (2603:10b6:610:2ba::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.19; Fri, 2 Oct
 2026 08:34:50 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 08:34:50 +0000
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
 b=TWNTq6p9kVVdEK8yWl1qRTC0fu5zI0FSt2Xd5vCT48KkB4LU2u539fVdRRlhi5rQh5I+anzGgkeMPKIOBs8eyMhebVurX7piTJYZXFxXOPiXE1IB0UFYRKdq2JrI4HQmr4hjEzQDljMCEPWIObk/yGSYFMQRBgO5ar4j1nMDpZ/dDDVaSJEV6JbZCfEmnS6joX148A/mpkgu3+PLo71MbKoP+Hjg/OO4JzZlDyB+xufKcvooLzk+VSTHmNkbGzh/I7YChvFiio9qTmBqS/9m/PN1ujSVPcGh3m4NiNq9mbZEVqK8lW+f/92XirjYDCy16AmRERXfek7m6aZWY8cHpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ApjGMxKHWmTzuJfSdG8JwyGkpWEDkH7xvVBXJRDgdM=;
 b=P6o1a+PkNTUQGqUrIUIDLuVpb0+qtavYitXFfV1AJEZe7pkJCC2EeUHp5L61hUcgtqBNSNfEqVmBnaVJxgkmvdHIQo6czM4DRnNcpUnzCsJGo3kFA1AxwwmgQSC9m2jb1K8lXsI6qt3/7tztbq5qaj6ST7DfCty53GhmtM4wtDZA2lNTd0UpNYG8eDMlQba21fEEncYwkKnoSgGdUElBcwj42ljYiMp+RheqMUKotzGOBEfbFQDS7utAuyWSKkxEGxkUHivNhF16nG2gKxBIkw4erQXCqIUrhra2Nw8rQ6tLd+NZ7om5UwdrR7vQuXg/p5bvOHC95yUY08cvejSgUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ApjGMxKHWmTzuJfSdG8JwyGkpWEDkH7xvVBXJRDgdM=;
 b=vmsBPFHupQtqAim4svydhkSKN6rptqIrIbFZ79eo9Q/2db+9MFTIix0zK3su2xCkm3zH13KCIw3cvl9Q/dNLL1xkJjOVvfCTLsvmCiw4+R2VQRINHu7H0U8F9UMjVd9uFH9DuWoHnTYGNCYpFE1bWVu9ZeQjrg2cm7ZHO68mOVk=
From: Kevin Lampis <kevin.lampis@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, "teddy.astie@vates.tech"
	<teddy.astie@vates.tech>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 1/6] x86: Remove return value from UPDATE_ENTRY
Thread-Topic: [PATCH v3 1/6] x86: Remove return value from UPDATE_ENTRY
Thread-Index: AQHdUcyw+vB+FMChKUya9aL6N17n2rbpvOkAgAAvJJs=
Date: Fri, 2 Oct 2026 08:34:49 +0000
Message-ID:
 <BY1PR03MB799623147B668DE6406228E4F3892@BY1PR03MB7996.namprd03.prod.outlook.com>
References: <20261001174749.2275245-1-kevin.lampis@citrix.com>
 <20261001174749.2275245-2-kevin.lampis@citrix.com>
 <a91fef08-3a0a-4a71-9618-9d6d3e74112d@suse.com>
In-Reply-To: <a91fef08-3a0a-4a71-9618-9d6d3e74112d@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY1PR03MB7996:EE_|CH8PR03MB8324:EE_
x-ms-office365-filtering-correlation-id: 00abe321-cb19-4f42-b929-08df2060060c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|18002099003|22082099003|38070700021|4143699003|10067099003|56012099006|11063799006;
x-microsoft-antispam-message-info:
 yl2CK6c1Ih21lfGj4XOoC3Rn+pbX+k8286e2IIiyeKNLXn9NwYmT4xAQDAcifUEwa7Vn+kXEJpp0gFV8Zyi8cJ3O/W7nK75DWs6Gg+C3Wud0QayzkXg2VOaLMlXp/XVxEd/8k+q1zINbl2XNYC4S2ZjIKH96msObFaf8sjtb3WMQnb9kD0Vfz34QMzASZymeytQdQAWP5tEdEneCxA6HMIbfHrKInqKC0wiztcpNZiMTl4sQG68rycdl9R1onZjkG5iPfjOjgff15l/rKucDXZVNN0Is56mgyJC6IXDhYheJLlYiHZYaGl0XnkhJ28hdfDpPNZ92U2CNl7hTHy3iY/EqthAxyN1Bh+fCd5QurhpVSuWQ4GAgov/FNwjSwONKTw4gKONEl2gt5JDGizJ0zgRBHD01j/D8XnXfcj8rwPj5sYEOZxBMnq1Hp9grimj6JO6QE/UL7EORNINvEOyIS2l3B2d+tc1n6S2xbaeZEDWELzGLlIF2Td0d3VptGc7YcRS0VmL8jgujVTeqIBJGFMzLhbZuCKdu8Z+ShuHJeIRtb5ESraqhNLTcIGrmheh2MY0iFlgt9CQlWfPqHi0PPRk7wb2GUPni1mDy/c2py2RRPQe+naKSTlCqtsJfJ/XmJRQySIsuUFitGBMe5knIicDSMPTpTz6KFoKciV6U5diBZz2K6LGzjvwbMvBknaenlnjYAF5N3lkRD5J7NVmorA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(38070700021)(4143699003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?n7Bww2F4V/4JB4iJAQl4OoIc7Sth+1b9JQX6F3d/pU5cHvxdl8Xu/ejN9F?=
 =?iso-8859-1?Q?W/k6KLHaYTxPNcRWIFwEAPFkpj59izRRhcDS0TvvtC36cCtzEiQHYQU8l0?=
 =?iso-8859-1?Q?kqlYQBKMv93nptuP3kWmfdeI3GNda+VRib9RooCRJ168DSfRNddwqNF/b3?=
 =?iso-8859-1?Q?CAT5nUtR2EU6PV4OU+dCqpJgrY7YQx4GkJ984XjuHZatkvAGSA19sbwY6E?=
 =?iso-8859-1?Q?xZri3kdBDhWaLVIPx8Si83o6B0+z10bd+G9Xb/JiT7VzMjf3hjpRlp3010?=
 =?iso-8859-1?Q?na32sxEIwMQLsoJAz9QXbfqRrdm0Py5MBPz8oZV1BCHyA0RaCBKTvVp9+F?=
 =?iso-8859-1?Q?1BLakcXvuttr07QFnUc5BgtywKvmxhkzsFk6C0esm9zBsQPyTC1fJG+Vpd?=
 =?iso-8859-1?Q?3V8GULo84ov9KkG8lIts1Dio5qwdmkt+qUqKohFqUJB7ZXybrG7I7aP6dP?=
 =?iso-8859-1?Q?j8RhxL6HHGNjzki6UtMZDMqOTTwwkbfnfeCLQjn8714Bw7VzvwNH4hgCAG?=
 =?iso-8859-1?Q?T2wbfR5YI63L01zxDeG55Hj8VBbvyRKeFbVTtLw00c0CNlSqHmyxMNa0BO?=
 =?iso-8859-1?Q?iDx2mFcGcOw2pzqDyKTIgo4GkEJFYq4hm7Q0cQ10t09046fFqB5Z/+YfE9?=
 =?iso-8859-1?Q?cADkOV89JxjHTHE1orgqepVuaZBABL2JF4ugWRx4AAY+D5+PvttpifU6gm?=
 =?iso-8859-1?Q?F4zlyoQCWnr5tT2+uRIHOlDx5MPKk1kWxgSj8498B64rSW/wjd/Vao3+Ni?=
 =?iso-8859-1?Q?jJ9o651q+2my4rvQT44f7+hjkXP4mt2riDR4EnlGABKSdxb3ez8nJtlDzX?=
 =?iso-8859-1?Q?wePLdmQdhyFaQmeMdarnmvsv+LtOithutiY9+FlpGMc7LHHVPkvbotfAkT?=
 =?iso-8859-1?Q?qgQeJyz7/79zENI1UTaq9htBld9Nr+qOYT2DSRMooeeJvLHuPavNaIBuz6?=
 =?iso-8859-1?Q?VS60Shd5H6c6kgA6wllVEON4pPEC/hBXAOyTVVTfTYRD9lvG2FxgNS9Toj?=
 =?iso-8859-1?Q?pF99ZvuIASyywwVv3AT53ZjXNFbmRA74gcaW2wC/dlQCrWBh6GaCiYlAa9?=
 =?iso-8859-1?Q?sjgc76DhUgZ6EJDkqVNrWrRNtEJQ0NJN/Sph+M1lXVuzHlXToArWb7oWIw?=
 =?iso-8859-1?Q?fzyuFRs2anDMXPQ+7Sjx2DxBIVMedbTWz/b3k4yIyqkU2578tLd/k8ux4B?=
 =?iso-8859-1?Q?JSDpiI8Xb5BCq14YV0dAOoS1NGb1oo4n7nJT9+kuYl7n8OXMHxtWtbr7D7?=
 =?iso-8859-1?Q?nvInviuf2nOLlf85wwpnUX8jd4xLXE1YcnThdpW5GE8jde3YhAcMWxtXWI?=
 =?iso-8859-1?Q?voTApe8PBxARLDOuwLX8nVJdBi9Mp/sJwcNClI8SkcnaVIGys4fXqQh3Oa?=
 =?iso-8859-1?Q?AlUtG9zOKYMLwXnE2ihAgydpN6Lc+UlJcADwS09hsfLKam7cDV6jft57yg?=
 =?iso-8859-1?Q?0S6krzwz3E0XsYChWB+2H/Vgubsi7mN7CggO/zc1FXDYwam8gP3JvvQ2PD?=
 =?iso-8859-1?Q?h8ClzQ6pz8+RDnBZLfoBWH4hiN/nG1/jd4broinVhC+e6CR9hP07JAh6Uy?=
 =?iso-8859-1?Q?3B2bgKbnru+BUj8sWG5ADNwvuHuHdwdd3iMYeHNrlNYPnndsbKbd0CwUDn?=
 =?iso-8859-1?Q?VKhfUI0cdC7ptiDSHYkw7o3F3XW1IkSxibRX6ZF/tF1E027z8mQ3HPn32U?=
 =?iso-8859-1?Q?XSVaSCx5W/WkXDuKaQ8Uhz2JTFfI1d9ymlyRfAuUte56QKuz4vj77sPqSf?=
 =?iso-8859-1?Q?fBWklAyxhrhpQwyjwtAxQwMIQCjLy0qOc18AxUrJSrXDCA?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00abe321-cb19-4f42-b929-08df2060060c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2026 08:34:50.0045
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EB9tg4T7Iw08P9A7VA54f58M9TYKX04XM2lmfTRXyXiCb+tAObLIDjU/noF3SjspIWFrcx5TKHUm5PvTAI8YwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR03MB8324
X-purgate-ID: tlsNG-bad1c0/1790930095-BC8C9034-2C8DE437/0/0
X-purgate-type: clean
X-purgate-size: 201

>This was already committed, wasn't it?=0A=
=0A=
I'm aware of only one patch that was committed since last time=0A=
`[PATCH v2 1/7] x86: make UPDATE_ENTRY() allow for multiple operation flags=
`=

