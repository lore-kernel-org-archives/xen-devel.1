Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A66606A325
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 07:51:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1493894.1693615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTaRX-0001eU-R0; Wed, 18 Nov 2026 07:50:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1493894.1693615; Wed, 18 Nov 2026 07:50:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTaRX-0001eN-O8; Wed, 18 Nov 2026 07:50:59 +0000
Received: by outflank-mailman (input) for mailman id 1493894;
 Wed, 18 Nov 2026 07:50:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Anandu.Padinhare@electrifex.com>) id 1xTaRW-0001eD-FO
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 07:50:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTaRV-00DTlE-S5
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 08:50:57 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Anandu.Padinhare@electrifex.com>)
 id 6afd58df-bab6-0a2a0a5309dd-0a2a4506a6fe-4
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 08:50:57 +0100
Received: from [3.110.59.171] (helo=repost.tmes-in.trendmicro.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Anandu.Padinhare@electrifex.com>)
 id 6afd58df-195a-0a2a45060019-036e3baba92d-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 08:50:57 +0100
Received: from 52.101.225.116_.trendmicro.com (unknown [172.26.79.22])
 by repost.tmes-in.trendmicro.com (Postfix) with SMTP id B48C0C000896;
 Wed, 18 Nov 2026 07:50:54 +0000 (UTC)
Received: from PNYPR01CU001.outbound.protection.outlook.com (unknown
 [52.101.225.116])
 by repre.tmes-in.trendmicro.com (Trend Micro Email Security) with ESMTPS id
 5049CC000416; Wed, 18 Nov 2026 07:50:48 +0000 (UTC)
Received: from MA0PR01MB9217.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:cc::6)
 by PNYPR01MB11970.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:2d3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 07:50:45 +0000
Received: from MA0PR01MB9217.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c284:c893:95b6:d2a3]) by MA0PR01MB9217.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c284:c893:95b6:d2a3%5]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 07:50:45 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; none
X-TM-MAIL-RECEIVED-TIME: 1794988248.328000
X-TM-MAIL-UUID: ddb7de19-41f2-4593-8dda-0cd698fbf2eb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s84Ax9vJB2Uvw3aGUUhN+hTj+k5kMXaMEJRmGEhm4G/9RaZeBpa2pFIZHWVQLpFE+d+fd0o96KAWg0jaKD9JvwxalVkevR9vcvVvCHyCo/fXIA4cAzikz4RWfb7+TzMuWsGHdJYPNyT8pJiwkKrcqbpabz5drHwJ2KYRuDIivSqufnj3migzXWflU7ndbDnugC9BXE3B55Dw/2TV/BXZc/Zqylm2pZPPeIUIfi8qDkzOH3UN82x34D0qG9/TXspJptKdnUVNBrkultwKGNe6Ds+CPuymLbYabJcRfy18hYka79lyiR1pAWj552g7+syo4jB8PORxGKWuGcExOSxtuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eAqwBAZxtT41XLX8gnAx/glWYjHnLdFDvJ/MhBkF6Js=;
 b=hcls/Xo6qYO2eJzPLmugaOfWt6+Uyo32q1BVyddcbijJXoJ6A27vkT+I55X66p12jy57nWHEznO2HH7PWWhbogbiQsYQiEgCrqGrfBVj10prMyXmJM0FxoQs2ud/jseDj3e5wKKXK9UDF6OR9MYmt6dxtp6TtpzuMk/O6VAEAFut0YJSDxZcHY0CjPjxuu6uFMDq/LHYv1uaRrvjUHo4rpGkzafxOzDsS+/EgADPFO39Hkv5sselOSZqpTUbyy1VKEpgWdol8Crw71pndIq5Jj/sQduSIhhYfnojRBW0EXCE65ppBJn35tJs8fKgwdppcmfh92ORctHszwz4Jzvbww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=electrifex.com; dmarc=pass action=none
 header.from=electrifex.com; dkim=pass header.d=electrifex.com; arc=none
From: Anandu Padinhare <Anandu.Padinhare@electrifex.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, "marmarek@invisiblethingslab.com"
	<marmarek@invisiblethingslab.com>, "dpsmith@apertussolutions.com"
	<dpsmith@apertussolutions.com>
Subject: [PATCH v2] EFI: avoid use-after-free when chaining config files
Thread-Topic: [PATCH v2] EFI: avoid use-after-free when chaining config files
Thread-Index: AQHddy+Hepvf1EdQf0uF+sW31Iftqw==
Date: Wed, 18 Nov 2026 07:50:45 +0000
Message-ID:
 <MA0PR01MB92175BB14F25D806EB78D171FD7A2@MA0PR01MB9217.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=electrifex.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0PR01MB9217:EE_|PNYPR01MB11970:EE_
x-ms-office365-filtering-correlation-id: 139dff46-c428-4111-334c-08df4548a6fb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|18002099003|17002099007|6133799003|3023799007|56012099006|261022115727099003|261026135527099003|261022075727099003|261028144727099003|261022113327099003|261021121427099003|10067099003|261021123027099003|261009223027099003|261021135927099003|261102123227099003|261021130227099003|38070700021|261021133027099003|261026140227099003|261026130827099003|261022105027099003|261026121527099003;
x-microsoft-antispam-message-info:
 NyCcepZ6GsmvOYDzPmlnJKsfL1WDqNVwYEs2l82riH0T8SkXLSpqEQ4XlJc6XjC7q8pBIAqplIovCJE7Te/cDIE5Yb8XF48+/qVyY0An2tSuVmaVpmOLvQpsgSj7N3SEMHIU6kgJUGbgSp8Pl97TSynh0827miteprua5AZDrqyBy6iouLmXulnEIpM5uO/cPlRfKMKxpipWUqf7Um4KbAtSPlhZgQJ56pTt7imiete/Nd5BnMP8RwU1IMIhHTGaso5JN/qrDPj4SAu4rsBirNDrKQcJaYFYE6U797JMuyU1lGflEireksktgu12tnIqhRjKBaqz1UVVd+so0k0rY+JA5+WwOam45X9140PSznCazg2Lquq1+5loX92Qsh0wKBABn9b/LvIJn5ITJaf2Th/Hb/bs3SyAsOZw1EYT3o9q3Aa3Bdkck81+7MGp4tjN18zmlhqv939v97i/BXx2cQKrF0TaY4vFi4xDaqMd2flVydOl1NmRNrAXspL5FyeR+N2qvRkqiSikK5SPv9t2bRECvBu4kcVNEB5jihWSvYDMhRxJipB0uxL+6df4mauudlGzVvpj0DiW0FUvNyNnfMXjq3vc2X1xJLZ51++3CGRZQvP99s5hz/gy/Yhl5ghlfRucEPfbzhFD3qRTaThFNMJc+Mz78AndozmFbrycxjwG1TDKKsjaciAABSR5+5SJITyRr+/Y0xXausSYh7fdBakmDCONEAYUF4JcRsvjmmM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0PR01MB9217.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(18002099003)(17002099007)(6133799003)(3023799007)(56012099006)(261022115727099003)(261026135527099003)(261022075727099003)(261028144727099003)(261022113327099003)(261021121427099003)(10067099003)(261021123027099003)(261009223027099003)(261021135927099003)(261102123227099003)(261021130227099003)(38070700021)(261021133027099003)(261026140227099003)(261026130827099003)(261022105027099003)(261026121527099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?9ZD/CW5cx2z6m8HuhUUhSXN+DjDxSQwYMgnrP9Bgzpfkv8m/h5s2RFb6jT?=
 =?iso-8859-1?Q?8J//alS/6BCrRlaebzXG/MjuKk3CHzSsFg/E4QXrJPs8qCUKikgBNWfNwI?=
 =?iso-8859-1?Q?pdE8wnJ2yGUyvSSD5bCWOUtnH2NyAYrXNmHlDiJeWcKAYZdm37pCFk3ziq?=
 =?iso-8859-1?Q?93dwyH7GbjofSZVvVzPg5SrARhe2A6OPEPLEHiwnzvGRDZNm5HgPS4Gp3x?=
 =?iso-8859-1?Q?Z4bErKTYY3QTsJwial58Q2dmUqxv8ylTUYnsxPG0uxtkHmu0/6BYf4R83y?=
 =?iso-8859-1?Q?5W1AGyJ73T4O16avc4thDoeNTC3SGCfNkqTIl47EBXbqO4JlWZwqt0ISzn?=
 =?iso-8859-1?Q?bXhXUjy9eaH1na+YSkn6bGW1VpGLrDv2nTET/SdxUaJQB2zIWyoSOpGfRl?=
 =?iso-8859-1?Q?06imQ9DWjwS99sblokIXrif89pRv+BpzReAxpmjjOX4g1qx8ArVpuI5Il9?=
 =?iso-8859-1?Q?xl8/ICzkcmUsV0D7VtySBFvqoAIF4kaJiLSfKRW2bT2DmP7yubr/U3mc7f?=
 =?iso-8859-1?Q?rkebL3HLqI9XQYQN1FyjhMJYRiYc0yJGr/9qhJ5nvPZU9pU6zEVRWU1Y7+?=
 =?iso-8859-1?Q?eVSNmz+QOZGjaCuwTEHgBIrtRGEgbdwCFq/5tvfl1d6T4TcaMXmZcY9VRT?=
 =?iso-8859-1?Q?p4CoTtOmWi8TAMQTIPJNHq254gieoqtRVVR1DZUNesBaLrNsYd/NWNUtqJ?=
 =?iso-8859-1?Q?3VoOEixqGxe81rAuT9z2V3pk7x9aTNTIxoj/Gm8tFpjEJE60bXWKMTSTUj?=
 =?iso-8859-1?Q?jlf2Prx2yI+yIT4qA2zS1NYhd+Z3y2GGgob7WFCFBxSZoBTS6mWOpXpS9p?=
 =?iso-8859-1?Q?FV6S7hewnLTmGEU6eRYURMKnip8iVNXTT+B2X21A3Tky0ih3HPnMr1U7W0?=
 =?iso-8859-1?Q?GlRDLgD2eWk9IDTjytlu94CCkciOBBXhm/QriwKJPr+o63XkLahK//Td5i?=
 =?iso-8859-1?Q?FJ0BHXs/stOiel9kWeeOl+7dIjr1g6NUPK6QtYSvYGbgfXcIIjAxEWn07r?=
 =?iso-8859-1?Q?g5A6xJ/LcdZGUT+sHoPvrpFfXFsvPTgcI3kHph/2Svd3byWcwpq4KT3hAw?=
 =?iso-8859-1?Q?HHExbIcKEcz32yDeMXh4T1dtHCE55IchFsHYAptiVmFT3G2rgUqTbMy+2n?=
 =?iso-8859-1?Q?qhSANCD/ku8q1hvtY3RL9okzwjLbwbvCiS8LHFbJE0CuKLAoUlkSoPZnve?=
 =?iso-8859-1?Q?0I6hf6OK7hmxo3kMvQ9cL02Eo6VIfvo8F2p3rz0p8WPMVI4OCp3qPai9Fh?=
 =?iso-8859-1?Q?P5YZyPh4TLSW3q7OBcNp7LPk7YaoHVDBdjRhcXF6crm3LLxBUoijcAEXsj?=
 =?iso-8859-1?Q?TZkULlM5bw8RmgLlPP3gh7ezPagQeh8K4+aMZZzlyjGafhZGFjFr8N/9CM?=
 =?iso-8859-1?Q?bKfUGz0abK5EWkS24ZmVhvxdA6FaPrghJMo3Fsvvotw8JhGsBGgZaQrPNC?=
 =?iso-8859-1?Q?rPr3vMLOko5aFvZ2Iccs++IILwdwEnzgOID50Zstbr4plkNaT8YOQ3L87N?=
 =?iso-8859-1?Q?uBQVRoE7vYIvZNo+9Wc6jIfdFGSIGBnc6Etnr8GMBgqKq5RS/I4qCAXS2x?=
 =?iso-8859-1?Q?5ZHgP3THCUz2mar3EvjsuxKc5UUxojVf+9ANCT6D81NbNOJfqbm/1Rkzvs?=
 =?iso-8859-1?Q?qW3LkSJBOJjWL3vWdilKz6KibWidnForg2tBV/9MEX3roLZb5PZg6zyXTR?=
 =?iso-8859-1?Q?hdlyDCvK96LitP2V6KNhUIu+lOCO9m1b9ZXrHfh6BuSTtG/T8cp+bRTPvb?=
 =?iso-8859-1?Q?otPv1+Mf0ciHMbluRZdvQE6/tU1UQyIWsAiV7F/A1YJ/PhA/vBDpjpO2/d?=
 =?iso-8859-1?Q?za8XLwePvfb2cKENMkqknQQPRiXLgYA=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	Fon8Er7QE94yoFYKFd4fcO/EHNaUTx20INFg14JFGL8zxYsdJqsPmUXsLZShrpKiNq8d8KCyeZLcR2WfLpUOJNdboI3CTGgZgoZXswfx8828iCsLNQNUSt6HuMZUSJYUEby2LmTadbHNRO//9sj1NRjsnogbvr1tVtOLOAparmxUzLDB5wXNVi9UnTx4c0sVjCs6g6tJR+HHdQust/LzTyuuQ28HOiYVy4g/3wlKLV9rVica0CDR/CtkZ+B0v6nuOm2QVRNKt24Y0vh/UbvaZj/1/UBqcjaDPyiRTiHFRuV29OXY/lzDnXEwVUhc/aVxVjLXpoZJRTdYdzGtTKhX5A==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	JeeAWAqJMPfPkm/UOLOQXbrU9gsArSRGnigRCWwmSTSO9nP9CYZs3UbPMJZiAzAp/3q5X74t7jNWXbQOiTrhAWV6lTJ9XMpVhrDhtLcsMqujZaLc7+j9blNzHbjOCGhvcVdqCvIrfiqa5xNsf6tE00p7/iV7ZiHae5YbCIr4ageTkXSbsrcAPI3PqC7H2C4U1XZeraj17WKwdbbxK42edqlTrdpVtk2YIBPsm/FaTOPw3w+saBPmwysomDrUmILpvbm411bFIJYdsFnfbmjNCrSx80GLi+hR1Z84PaNnm4WcjZ2Hyex7mc1Q7K6X5ITmAqLIPW6miAX80wA4Y/eBcpcfhh9prFB41tvxW7w8mJS9PdAEepVVUTRENwDPgpbyORrh8VQQtwCegRLfYmT0As+ImVQdYf5sS+Kro1Q68NwAY1M/8Jk1bp2/KVl+JTZn5XsfqtpZC0/8APq9+eqll88BAcdnfoNQGOTy9N+AbJAd9NJygPvg1+uv4k0LIEaXFk72lZRr0+PKjinDT+OT8lK0htpZXLxcIyHqRmgYoW4Rc0JbnV9/CEg1KtuIt/f2K2gWm99YefyjbEgCxNWVLz/wmGOgk8RP1QGv3vZ9otM=
X-OriginatorOrg: electrifex.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0PR01MB9217.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 139dff46-c428-4111-334c-08df4548a6fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2026 07:50:45.0806
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f2626450-e675-4872-bae6-db17376f7643
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8UUO1BdAoN/Xrzv+QE1G38HTlQB7I17UbuXtNtnSljlaExtAWX6MqFxkAqf7PzaOUezdhg8gnIDzpGrUFF370/YasLrg51nu3lk0VhYw95I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNYPR01MB11970
X-TM-AS-ERS: 52.101.225.116-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.2.1014-30326.005
X-TMASE-Result: 10--12.572100-7.000000
X-TMASE-MatchedRID: OGyXdhuZG8ld9p1fQ1RL+NwK3aKXLlLAF1k2re42Ig0oEQF9DEP4Haix
	kgS3tpr7IZmHO6cbqOXcEMUGI/gVCKJj866hwL+Q4JrOTY8E3wvYX6ZmLJfXIvFEuCV5HOca4NE
	1nLQcjpUMNun9RtgnU2ZgQD37FYFmx8vS9LM/i1WdYRN1L2Va2P0pMNf/rNc4E1gA8yAgksXFkD
	gU4bJS7WnxJeTQDkZbGjge8+vbQdt5S5cAWVPQWvtXnvRt8Io2ZK1SF2R3edhQuyTWcRlTdovPi
	Bq/iW91XoVOzritMy5YntqsTDleFQdyLySOlhsq8Atv+QYJmLENi5sB0+4vp8BJEPUuI2SqDQx1
	3VnqkRoF8LHyNn1d+ajRwskuq/nNXeYSaHdDv2Hl+kHcpOzp51HdSSkRFiZk1uiOEobtY6rooQk
	7tJHpeCS8kWuwOHSHwqMZFCdDzWH9kVXqkAXbsiojD85jfNIZqhSf773sopFxg7svMtapLrYURQ
	HAp3zKko22NvE5/u4Z8YX04kE1DrMg62789AiSGVcRqcXJACjO8IzqDt8HEA==
X-TMASE-XGENCLOUD: 07952a4d-a9ce-4c5e-a07c-40eeed21bdce-0-0-200-0
X-TM-Addin-Auth: x7TT9TfvAV3MRSpl/NkaHRXvKHgE57nj+yURX2LUMx8Uttc/AqdTvyTuljs
	EKAKugsetk8yrDO9o+FhjgPjqqX4iXUxdMJ35ByOe2jCMeJT0bnTR8aswL7Ek959RIxXcgnjV7m
	nIAl0c8YUnsM5D035B+Dyv7oiFdKojrAYB1OeQXrSyV3JwE0pjmxokEXsnTOsVRaJYvSc0x4p9D
	eDWd7gk406/w9BH6+oR/wLlbia7NGN4mBz1dd7TGZKDIwlK+aF24tngSDgm2ZVSSy0Lk1PooRyd
	qQcgWYfEsrgQOfviedA3Mbrq/iaEuOmyNsln1Zlqq8SN7A9SUCGQdjdERQ==.Dz6pJQNXuF48QU
	+h39KFOfQNQ0+E8ZvhxrxuqJpg68rljioGoyPGltOXPGK19zVatZtLuG8qtECpIl2lLVdjOJC6S
	0hYCw+fYuPomUmlCdAJnqERkgAaPD30uK3TReBQRLB+GTQ6EIsjy1Cs3WTp/qePfq6rFi8fjmz7
	k4vQHjbsqTy8itpolY1NzgY4FhXD4+18QD3w6oO0VVNN5CGJKUyh3UhCT6baHHySc7stGQsb8D8
	cL2wv9s3vZ80OBKz0ojKaR1dnIa9iZfDcvOkLewRS7Yio/Fq/zj2JRMsE+68li/xoKCiCEL7Tn+
	mSnbpjiqKOy2g5j2kzxVgQ/fKKjg==
X-TM-Addin-ProductCode: EMS
X-TM-Deliver-Signature: A8EC79521F3C1BDF0806599FEA970021
X-purgate-ID: tlsNG-16d1c6/1794988257-FC40377B-76CF7030/0/0
X-purgate-type: clean
X-purgate-size: 4907
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
Convert the file name before freeing the buffer, and duplicate a=0A=
section name taken from "default=3D" the first time round.  A=0A=
configuration relying on the stale pointer happening to refer to the=0A=
chained file's own "default=3D" value will now use the section named in=0A=
the original file instead.=0A=
=0A=
Fixes: 81da4016bfeb ("x86-64/EFI: allow chaining of config files")=0A=
Assisted-by: Claude=0A=
Signed-off-by: Anandu Padinhare <Anandu.Padinhare@electrifex.com>=0A=
---=0A=
v2:=0A=
 - Introduce _strdup() and use it (Jan).=0A=
 - Duplicate the section name only once, and only when it was taken from=0A=
   "default=3D" (Jan).=0A=
=0A=
Tested in QEMU booting xen.efi directly (x86 with OVMF and a PV Dom0,=0A=
Arm64 with AAVMF up to Dom0 construction): chaining with and without=0A=
"default=3D", across several levels and (x86 only) with the section given=
=0A=
on the command line; booting without "chain=3D" is unaffected.=0A=
=0A=
A pre-existing issue is left for a separate change: "chain=3D" has never=0A=
detected cycles, so a config file chaining to itself makes Xen loop=0A=
silently (unless the firmware garbles the freed name first, as Ubuntu's=0A=
OVMF does).  I can send a patch limiting the chaining depth, if so=0A=
desired.=0A=
=0A=
 xen/common/efi/boot.c | 29 ++++++++++++++++++++++++++++-=0A=
 1 file changed, 28 insertions(+), 1 deletion(-)=0A=
=0A=
diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c=0A=
index 89b5831691..6db3573030 100644=0A=
--- a/xen/common/efi/boot.c=0A=
+++ b/xen/common/efi/boot.c=0A=
@@ -285,6 +285,17 @@ static char *__init w2s(const union string *str)=0A=
     return str->s;=0A=
 }=0A=
 =0A=
+static char *__init _strdup(const char *s)=0A=
+{=0A=
+    size_t len =3D strlen(s) + 1;=0A=
+    void *ptr;=0A=
+=0A=
+    if ( efi_bs->AllocatePool(EfiLoaderData, len, &ptr) !=3D EFI_SUCCESS )=
=0A=
+        return NULL;=0A=
+=0A=
+    return memcpy(ptr, s, len);=0A=
+}=0A=
+=0A=
 static bool __init match_guid(const EFI_GUID *guid1, const EFI_GUID *guid2=
)=0A=
 {=0A=
     return guid1->Data1 =3D=3D guid2->Data1 &&=0A=
@@ -1441,6 +1452,7 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE Imag=
eHandle,=0A=
     UINTN gop_mode =3D ~0;=0A=
     EFI_GRAPHICS_OUTPUT_PROTOCOL *gop =3D NULL;=0A=
     union string section =3D { NULL }, name;=0A=
+    bool section_in_cfg =3D false;=0A=
     bool base_video =3D false;=0A=
     const char *option_str;=0A=
     bool use_cfg_file;=0A=
@@ -1574,7 +1586,10 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE Ima=
geHandle,=0A=
         if ( section.w )=0A=
             w2s(&section);=0A=
         else=0A=
+        {=0A=
             section.s =3D get_value(&cfg, "global", "default");=0A=
+            section_in_cfg =3D true;=0A=
+        }=0A=
 =0A=
         for ( ; ; )=0A=
         {=0A=
@@ -1584,9 +1599,21 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE Ima=
geHandle,=0A=
             name.s =3D get_value(&cfg, "global", "chain");=0A=
             if ( !name.s )=0A=
                 break;=0A=
+            /*=0A=
+             * name.s, and section.s if it was taken from "default=3D", po=
int=0A=
+             * into the buffer freed below.  Copy them before freeing it.=
=0A=
+             */=0A=
+            name.w =3D s2w(&name);=0A=
+            if ( section_in_cfg && section.s )=0A=
+            {=0A=
+                section.s =3D _strdup(section.s);=0A=
+                if ( !section.s )=0A=
+                    blexit(L"Unable to allocate string buffer");=0A=
+            }=0A=
+            section_in_cfg =3D false;=0A=
             free_cfg();=0A=
             ensure_dir_handle(loaded_image, &dir_handle, &file_name);=0A=
-            if ( !read_file(dir_handle, s2w(&name), &cfg, NULL) )=0A=
+            if ( !read_file(dir_handle, name.w, &cfg, NULL) )=0A=
             {=0A=
                 PrintStr(L"Chained configuration file '");=0A=
                 PrintStr(name.w);=0A=
=0A=
base-commit: ab77da87e9b38022341eb6a54593e681485d203a=

