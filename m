Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD9D606A31C
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 03:58:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1490180.1691124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSnr9-0004iF-6h; Mon, 16 Nov 2026 03:58:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1490180.1691124; Mon, 16 Nov 2026 03:58:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSnr9-0004i8-2y; Mon, 16 Nov 2026 03:58:11 +0000
Received: by outflank-mailman (input) for mailman id 1490180;
 Mon, 16 Nov 2026 03:58:10 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Anandu.Padinhare@electrifex.com>) id 1xSnr8-0004i2-4a
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 03:58:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSnr7-009J1X-21
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 04:58:09 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Anandu.Padinhare@electrifex.com>)
 id 6afa7ee0-e002-0a2a0a5209dd-0a2a4502ed00-44
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 04:58:08 +0100
Received: from [3.110.59.166] (helo=repost.tmes-in.trendmicro.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Anandu.Padinhare@electrifex.com>)
 id 6afa7f4e-6ca4-0a2a45020019-036e3ba6edc3-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 04:58:08 +0100
Received: from 52.101.227.79_.trendmicro.com (unknown [172.26.44.244])
 by repost.tmes-in.trendmicro.com (Postfix) with SMTP id 1132EC000E15;
 Mon, 16 Nov 2026 03:58:06 +0000 (UTC)
Received: from MA0PR01CU009.outbound.protection.outlook.com (unknown
 [52.101.227.79])
 by repre.tmes-in.trendmicro.com (Trend Micro Email Security) with ESMTPS id
 96393C00042B; Mon, 16 Nov 2026 03:58:03 +0000 (UTC)
Received: from PNYPR01MB11444.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:2e4::9)
 by PNVPR01MB13824.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:347::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 03:58:00 +0000
Received: from PNYPR01MB11444.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::b5ca:719e:bc57:e90f]) by PNYPR01MB11444.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::b5ca:719e:bc57:e90f%7]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 03:58:00 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; none
X-TM-MAIL-RECEIVED-TIME: 1794801483.614000
X-TM-MAIL-UUID: deea930c-702e-4f50-a498-09ff01df3394
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=grtECFzZE9ZhZxMuHaflWsJvoSjjpbZ7BrBiknbs0kFq/bNPAET0SRPktEXayKVAFBbCMMWffMCKAq969EIdjSM71Wqw6ln77mcju6+1hIwMOpzyavu1Fm7dhFVh74vpd2AlJAGRvWB4f11m+Ub5HufSlbYy6kmFRUEeTpAJAECgnwLHWXpepX2SxRB2l3L3Od4WuKtp+pYI91AqGIWfEDjcdszNzgy/baPlwWbH2cEpxwD35qEvvUo1dUltCKxBDt+X1ub1Gg2Ga8AtnKfpSHnUbWkdOm+GumqJEY+qKCIHo16qj55YU8YxMPcLiC0GCKrIMShutX9Ynos7RITQgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e1H8qnZYHIxS30A0Z702RMZxS2ELfyffgl6T+qeBHRI=;
 b=Nk7I1HBtFG9otG/OoWm/G2IO3Dw0xJgoYD/QprHRgqtAVThC/wilE+IgUvxMlGCdDlDtiMKtZEypDJcbyuSWTlz7v1pdLUQT7AcM+6DP/aIRsOByQs3Xumxu+JqE9MWnaVO6ouFxeJrJmEN8yZfw4zOj9pgF8KQyLsuAs4G7U7hOMvH6sSk8yg3a4dlKka0ZXRoxQpLHWHyObtCbY5EJzfCioDO0J4MTrVw3bXXstnf1rhELvPoD81swBKiItr2gimlD1VefwKtMjN8wXnfx0dX3TO+3J6O8XpUEdtXANppFtOfcZH07S60L7qYMHLZ/GIFnhT280f+TIX7mPxb0ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=electrifex.com; dmarc=pass action=none
 header.from=electrifex.com; dkim=pass header.d=electrifex.com; arc=none
From: Anandu Padinhare <Anandu.Padinhare@electrifex.com>
To: "jbeulich@suse.com" <jbeulich@suse.com>, "marmarek@invisiblethingslab.com"
	<marmarek@invisiblethingslab.com>, "dpsmith@apertussolutions.com"
	<dpsmith@apertussolutions.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: [PATCH] EFI: avoid use-after-free when chaining config files
Thread-Topic: [PATCH] EFI: avoid use-after-free when chaining config files
Thread-Index: AQHddX1tQ+fu8I3FBUK/zOgMqZ8Scg==
Date: Mon, 16 Nov 2026 03:58:00 +0000
Message-ID:
 <PNYPR01MB1144475DAC5E2D3611133EADFFD7C2@PNYPR01MB11444.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=electrifex.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PNYPR01MB11444:EE_|PNVPR01MB13824:EE_
x-ms-office365-filtering-correlation-id: 199aa0f8-4d77-441b-5c5f-08df4395ced2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|38070700021|10067099003|56012099006|261026135527099003|261026121527099003|261026140227099003|261026130827099003|261028144727099003|261021135927099003|261021133027099003|261021130227099003|261022115727099003|261022113327099003|261022105027099003|261022075727099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|17002099007|6133799003;
x-microsoft-antispam-message-info:
 L/8OSdMArSs+PXO8D/Ha2yVEO+ikotm3soAtE8+qt3mt1twTXh95McksX0cIXukuGe4m077AUCOFRRBer0KEhC6CZ029OvqkzmdXn8v+u2dWIdzqwU9t804HvODV9VXGIYLfG3oOcOqJXL9LkgOEnnNDsjTVogtti3VrRhxWfg1wL5CooX0Pr+RWTdnm0N/Qa8utvevlE6zb2HKNqWuM6+wIJILgu7BIY0ISsRw2R3Krd/gddihc/u3M+LOtAIlfNaF24960FJINWmTjIAjmwGNfomPaig8fIAQ7bl83FDUGftQZd+X+2PuWANlc41hmoAwvp3BQBr2aNlq0X6M8v7gKa/MnA7jz9i7KblBg1fH9OL3ZGUP3mif0EFbBC4CjKboZNcT/V2y7DpCM45Rjx9Hy+q2e+y2uVAiMn+UgsUEgECf6vVT1Y8eHK3yAEh7Rhb8r0a4Ugxfi7eN1ZQk4ocucAUT3RvkasQh0meXlg92u2mCqaPqys4k5xZbHkW5Dq90gPgTUQEGkFlaGIrCklID9aZsGE0XzdLzmC/zRatD4iiwAWWikIwEwhDJ99g9p1zEBEmDlCkRRH2xDagSR5WmIiniU6wWF/C81LxuB8pvoDem2hOgSE4KHtxCpC/uvdNolKuU/lr9MEhcJQeLZHytYnyHwqo6gGb1jk1qJiuP4HvXViDgIf7XXzivNbSx6YytCVmQ6rcXFvVu7PzB1MQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PNYPR01MB11444.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(38070700021)(10067099003)(56012099006)(261026135527099003)(261026121527099003)(261026140227099003)(261026130827099003)(261028144727099003)(261021135927099003)(261021133027099003)(261021130227099003)(261022115727099003)(261022113327099003)(261022105027099003)(261022075727099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(17002099007)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?V/CIWEpPA9pH/GjyWd0adUiue1sPHoVROSrt8QrQ3b/2Hdj8Bhs/9XOXdX?=
 =?iso-8859-1?Q?R9LXa7R6cZNAsYDiqYIgBpqFVq8yN4NpreOxCFlJOIm9krwByIrL0os20C?=
 =?iso-8859-1?Q?DA4+RqeSNSpCHJ7Qzvg7A5gT32AuY2E0azdRf3bkeT6lC0osxh+Wf1eD+R?=
 =?iso-8859-1?Q?4OarAUKbjDeU6vutky7DAQCOduKMtnvvIryCRTAtV2Bg2pnFVRr04ErT7o?=
 =?iso-8859-1?Q?00/no0WleBSjHGVh3s3Lu+jKolpVh9ROfAa4Plo5gEPAjPAr0KRpcbR1fM?=
 =?iso-8859-1?Q?89oMqw/wouX28gH0uvEPGJ/tElhNAwFwKtWgzVaty+6Sl/IgJiUS4DfQwU?=
 =?iso-8859-1?Q?k32QIgrXO8/TYyCmtByl0E3nMw66r+oWH8x3e24Ni3k7Ws+B5GRjFFdCz0?=
 =?iso-8859-1?Q?52LRt60mekhi1B0jG9Z1fOdCAp5CxM6VIo7kDEHhH6qzsSQQKfR6JKm+Gd?=
 =?iso-8859-1?Q?VRDibRNPawarZlWWWvBOjndoRBytq1yC2CzzYLl3zMHwksMojb/Bfca0dO?=
 =?iso-8859-1?Q?xuR5D7GHpv9VFxS+OVOyxgp2jaNUAaFfoWwtDVAjQggHneOcVInzGoQrH9?=
 =?iso-8859-1?Q?SRQOMYE0FlCP1TCp4u3hnfHTZJaKnFR7yGe0oS4clzhpL1Uf1QoEN0jCDh?=
 =?iso-8859-1?Q?tXXSr48uwsX5qbNYE5lOAQQUYGJBtQrW/+Gxw1rCfOqOrCjED6xnsICXF+?=
 =?iso-8859-1?Q?DfldCQIEbcVl99VkfqqwyUYRZr6Tj7ny+iKpVd7OOI8HSLPMw65egKzD0X?=
 =?iso-8859-1?Q?kZHg0u0t9ybd1mPROCopXxCeFqhn4TodVY8JkTB4u1Ux1yjnVVGIwJCJl/?=
 =?iso-8859-1?Q?iBdceAZR+6cpcUcOIBX7RTIH0ecaTpsS21b/lRE4f9Jn2Ci5zTJNRIIxdh?=
 =?iso-8859-1?Q?0d5GMROeLR/d6wryc8dfxucUceLD2qZmB9tHXJhBc4RWqkTco0ogXBghV/?=
 =?iso-8859-1?Q?SIPbHpsd5VHjpHPhbhk4itcXTZt17AZ9DJ1GS+kcpBEw04bkGR945E08DU?=
 =?iso-8859-1?Q?U4IB6ST6SfAqw2Sg5g7F4uiJVAzX0rYENqtnZcMCPqXb2lAivQ9HnmzQ11?=
 =?iso-8859-1?Q?0qbdwoRzzC2JnxxUq+JZpJwXPUYpSlZcje3fx53vbhE7rCJEpZ6+L0YBjc?=
 =?iso-8859-1?Q?l5K7Kw4e3XxpmMVzXbr3DgSj47Oh8MyNFV1b3UVdqAc8qJ3S0ER/pGlheP?=
 =?iso-8859-1?Q?k7rCudi3pujk7VGQwQOciswGLA5Nfps5E2iQ/YtTv2VoDqlDvOmOYIWaV/?=
 =?iso-8859-1?Q?zSRVUxcbNh9myBBKuIjrmcTl4NDWX8pN8YxQZorqz9gAltWW5snGq7AbZs?=
 =?iso-8859-1?Q?Z+qbzUZuW7uxRLWA5mbm6skCp5Jya/xV38xmGRfbvyU3gtT6UFHNacLqKQ?=
 =?iso-8859-1?Q?uAx97iIp3U8/Y7DjiojzWyiYDnc2L3mKZD/RtQNmahfjhuH2eZJuwEnNN6?=
 =?iso-8859-1?Q?HzbZ+zICLC1He2k5eJHxRm+kEt53eBnUREMUmpw9CWgJPWjKWHmUD4wdP+?=
 =?iso-8859-1?Q?Uo+yHXunKNSIfZnIlmEgmlHjCnv+rNdN8G8GhC1n1LTmAFOgfEA4Z87fXp?=
 =?iso-8859-1?Q?2k+xgqb5pwhsoplzrMKwwFnooDvKKuYTlyMbMsbGUEm93To6FSPBHqQG0y?=
 =?iso-8859-1?Q?uNPPDB84WyxNDZ9Xzad0qvwzW24+POt23ywfkGrJZvrXT0Ngfemeu/GoZc?=
 =?iso-8859-1?Q?i6Zof6k/P3hLwZE74SN/swwpwosUq7V0GvHt1xwuItsxjwJCGLdW+fFQLZ?=
 =?iso-8859-1?Q?4KsdhXGG25TUJLRfsRK9DbO3ZG7mQCBg2cHvd/BnEzB3GYe8CjLXmlJgD5?=
 =?iso-8859-1?Q?NNbwK8IncQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	GvnKLZvZhmbrg6mZUx4RZUwvdvjom/wKglyY4P2ZHeq5ayBXmQSgbzg/6JWrQUl3hcVyFHESrTCjuY/S8mtpo8k9RfTXc41Ftbnb04YJxDARy09UeVQ0rv/4/V1BZHPnz7KjAwat3iuwnslMtqiRJjAZPOMk0Y/jsVwP6Nym0hpcS9abam9kER58zPkWS3ty24bZVtUBgFXyC09epjrSacDQkQNBUjhtzBpC3RmV+bpaCv5142rQIBtCWZdxQFiY3ErRLLRDWTiIVUAKtbi5KAG81Z316eQOMNVkOdu2w3OYjk8q2wwcSuqBOVYbBn50T5bNOdgDM6BsWn2HdEI/FA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Qz7c8AcBw34e0nTNmZaD6CKBw6F3DllZr1OjMCa2Rw7U1Ub8GKyW1hd1SpEUsRuM3wDNGwtBX8Q2KGVsRbRJJyZ0ES41Ts9BUZD1EbrzyrnX/F3bFeVXYMP6vGecctKC0g1VM8tIAW94uhXMC+c93MsCaqPZGABeJIhFP3fkPAZcWHse3xC7DheV/DOKLY7xM5ckQLLC7B8t9nUvW/c/MhSJLRno66wfud6ISPgiFgdMRLdEaS6njIHkW1QJHQjFlHFZOy4mQxQ/FWlViZUT17utB8aPNtfOwsAVeRpLqqqDC5dP+0EQE9EK6nGvE0C6L+oxvAfUcLfKqnOy+b8ko4GZHr5/VYry5pkFVyLBwEu9RYqh/M7F48XJSTUk9sC5sUSZHLlFXCxHKPrJucpzcH1Yg6XHjQoNGT4+0or/hIAQOqYYUXsyg1Y0DRVfKj0BGgMb2QtCKPQrKyatYvUBV+eYjQ+IYRlBYVF/2W4jW08S49QKUsnSu4plYbpwdEvT0QlpNof9nadFtps/oS6MvgbYa9WotAB7HdY1m7EYVz6v7/rdg4zFVu0lbHT/ZZ1+5+0JdXTZIlTwgdQN4qMQzr5nr5+I3Vty0jb9VZyKO2M=
X-OriginatorOrg: electrifex.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PNYPR01MB11444.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 199aa0f8-4d77-441b-5c5f-08df4395ced2
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2026 03:58:00.8463
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f2626450-e675-4872-bae6-db17376f7643
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HRWgNWdxeC6OIPzeGyR/KOnEFhP/UzfaVvOoTlahezQsw3QEoHKVRKwyq6r0GVoIij8YRaR99xc4qo+1ITTohgYaoBEqBRlsFlgd4d/sxqA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNVPR01MB13824
X-TM-AS-ERS: 52.101.227.79-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.2.1014-30322.004
X-TMASE-Result: 10--16.934600-7.000000
X-TMASE-MatchedRID: OGyXdhuZG8ld9p1fQ1RL+NwK3aKXLlLAF1k2re42Ig0oEQF9DEP4Haix
	kgS3tpr7IZmHO6cbqOXcEMUGI/gVCKJj866hwL+Q4JrOTY8E3wvYX6ZmLJfXIvFEuCV5HOca4NE
	1nLQcjpUMNun9RtgnU/dLCdxMBlGBCqzLRV65cMedYRN1L2Va2IM+VZimfMfOaRF2k6q/y/JmKc
	C+ZgZo3QX/qC69skJNQ7fg8UIF6gGjWP9KjsHBbFo/1P3BDpl/wBLtKYu8bEuDFMKfNkiHsKXic
	Gonyj1pDZz1KFOz+pvVaBNDVrszJL2KMNqfxJkCUlO0zoIcpU6BhoFVhcfc6xxNrvNTirQwc94f
	zTs3NgtfGGngAdSHGxHQG3dIpjWk0bKbAkjZTQvk+QJ4zu017VHdSSkRFiZk1uiOEobtY6rooQk
	7tJHpeCS8kWuwOHSHwqMZFCdDzWH9kVXqkAXbsiojD85jfNIZqhSf773sopFxg7svMtapLrYURQ
	HAp3zKlExlQIQeRG0=
X-TMASE-XGENCLOUD: 1f4a89d3-adaa-4bfc-be0f-e4a39a9dfd03-0-0-200-0
X-TM-Addin-Auth: Ys80ussbttZgvA0IlI1LBMG1RcoR+Tv2vOnF8NJitTEX3/9pgDTk6HuRtIu
	AvxRCOc1w4trqMiWPSTyFgvFJtAQKljyNcmZIoQbyxHGQyW12Az4RKQqlJpYSaUovlCvobxwSlf
	kDbZ3nHNHuy3qq+48MdhBfB74WQB0R0Os+nDcQWjBksPWdVDcrNdFl1/lRDKb0oVcEcQIZhlODn
	gIZP2Ih8HQpqFpWAJbGkl3WXxdT+jI5U9V3zCyst8CzqnmaYJLyZo8tsC1ArK8n93DOlLN6Vg9C
	fMKj+MCNAhH5IG3wJGN3TIY2MVJHNYWvoa89+rtmeC+xcQHXSIqwEVDWTA==.F5A7djGllGMVfy
	ycTd4VNDwKgCWMl34eu0RL5gQbd+5mE/6YvU9g7o/EMXk5DtQJLfLvHGohGJ3R9vpItBALxUpLW
	COSywlugA57nBxPoFRDbiG1L2Ehr5otuxySM+DifNb7Hjn8d4JaFmkyKU9SHs8dT0f6B+7Tl489
	riif/Kp2iBKYC6DLHS6JmBL3rz/tmchZ43W2OpJoXVMfkAfcZCvUzP808rFVaQCFg/DX0H75J4u
	3YgRP7LPB+by9q/kEG7cM9mN+ilYPMLQ9VXSdmACNwId5f7rKZJDfaa7MzlBuJPYc0K/LwYtWr+
	9MBiOntKGfirLF6YEz3eZWdunSwA==
X-TM-Addin-ProductCode: EMS
X-TM-Deliver-Signature: C2D816BF1C2C365364BC36269301209F
X-purgate-ID: tlsNG-720697/1794801488-672B12AC-CF8EE228/0/0
X-purgate-type: clean
X-purgate-size: 4075
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When following "chain=3D", efi_start() frees the buffer holding the=0A=
current config file (if it was allocated) and only afterwards converts=0A=
the chained file's name, which points into that buffer, with s2w().=0A=
The section name, when taken from "default=3D", also points there and is=0A=
used for the subsequent lookups in the chained file.=0A=
=0A=
read_file() may well get back the very pages just freed (as observed=0A=
with OVMF), so the section name may end up referring to arbitrary text=0A=
of the chained file, selecting the wrong section (or none).  With=0A=
firmware overwriting freed memory (e.g. Ubuntu's OVMF 2025.11, which=0A=
fills it with 0xAF), even the file name is garbage, and loading the=0A=
chained file fails with "Open failed for ...: Invalid parameter".=0A=
=0A=
Convert the file name before freeing the buffer, and copy the section=0A=
name.  A configuration relying on the stale pointer happening to refer=0A=
to the chained file's own "default=3D" value will now use the section=0A=
named in the original file instead.=0A=
=0A=
Fixes: 81da4016bfeb ("x86-64/EFI: allow chaining of config files")=0A=
Assisted-by: Claude=0A=
Signed-off-by: Anandu Padinhare <Anandu.Padinhare@electrifex.com>=0A=
---=0A=
Tested in QEMU, booting xen.efi directly: on x86 (i440fx, Ubuntu=0A=
OVMF 2025.11) with a Linux PV Dom0, on Arm64 (virt, AAVMF 2025.11,=0A=
cross-built) up to Dom0 construction with a dummy kernel.  Before the=0A=
patch, every test chaining from a config file read from disk failed=0A=
("Open failed for ..." on x86, "Chained configuration file '...'not=0A=
found." with a truncated name on Arm64).  With it, "kernel=3D", "options=3D=
"=0A=
and "ramdisk=3D" (x86) or "dtb=3D" (Arm64) come from the chained file, also=
=0A=
across several levels; with the section given on the xen.efi command=0A=
line (x86, started from the UEFI shell) the right section was used too.=0A=
Booting without "chain=3D" is unaffected.  A build fixing only the file=0A=
name showed the chained file loaded into the same pages as the freed=0A=
one, with the section name then taken from its text.=0A=
=0A=
For simplicity the section name is also copied when it came from the=0A=
command line (and hence isn't in the buffer).  The copies aren't freed:=0A=
they are EfiLoaderData, which Xen uses as ordinary RAM after=0A=
ExitBootServices() anyway.  Not tested on real hardware.=0A=
=0A=
 xen/common/efi/boot.c | 17 ++++++++++++++++-=0A=
 1 file changed, 16 insertions(+), 1 deletion(-)=0A=
=0A=
diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c=0A=
index 89b5831691..fccde265a4 100644=0A=
--- a/xen/common/efi/boot.c=0A=
+++ b/xen/common/efi/boot.c=0A=
@@ -1584,9 +1584,24 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE Ima=
geHandle,=0A=
             name.s =3D get_value(&cfg, "global", "chain");=0A=
             if ( !name.s )=0A=
                 break;=0A=
+            /*=0A=
+             * name.s, and section.s if it came from "default=3D", point i=
nto=0A=
+             * the buffer freed below.  Copy both before freeing it.=0A=
+             */=0A=
+            name.w =3D s2w(&name);=0A=
+            if ( section.s )=0A=
+            {=0A=
+                size_t len =3D strlen(section.s) + 1;=0A=
+                void *ptr;=0A=
+=0A=
+                if ( efi_bs->AllocatePool(EfiLoaderData, len,=0A=
+                                          &ptr) !=3D EFI_SUCCESS )=0A=
+                    blexit(L"Unable to allocate string buffer");=0A=
+                section.s =3D memcpy(ptr, section.s, len);=0A=
+            }=0A=
             free_cfg();=0A=
             ensure_dir_handle(loaded_image, &dir_handle, &file_name);=0A=
-            if ( !read_file(dir_handle, s2w(&name), &cfg, NULL) )=0A=
+            if ( !read_file(dir_handle, name.w, &cfg, NULL) )=0A=
             {=0A=
                 PrintStr(L"Chained configuration file '");=0A=
                 PrintStr(name.w);=0A=
=0A=
base-commit: 97bf370375113caf92fccf04e2877fc6b5ff887f=

