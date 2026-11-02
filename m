Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EE6606A911
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 16:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=hj2IROJk
Received: from list by lists.xenproject.org with outflank-mailman.1468469.1677564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNueK-0004lm-Io; Mon, 02 Nov 2026 16:12:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468469.1677564; Mon, 02 Nov 2026 16:12:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNueK-0004lf-Fw; Mon, 02 Nov 2026 16:12:44 +0000
Received: by outflank-mailman (input) for mailman id 1468469;
 Mon, 02 Nov 2026 16:12:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xNueJ-0004lI-0V
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 16:12:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNueG-000Wgq-Et
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 17:12:40 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6ae8b666-2eae-0a2a0a5409dd-0a2a4507da74-32
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 17:12:40 +0100
Received: from [52.101.56.22]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6ae8b677-b4ea-0a2a45070019-346538163e39-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 17:12:40 +0100
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by BL1PR03MB6054.namprd03.prod.outlook.com (2603:10b6:208:312::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 16:12:37 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 16:12:37 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DyC03YxT2nfalZVmhJAvWCJ0vxRoG0UwvLE5Y3zqRGEjinOYs9Twyd3i0xoxLxtmnt0zYOj8etwrBVrNUOJzloaK0eclRMg6hBnqYgK7CRMLB3E/o2QGZUfy99HFVn88Vzi5XrAvgTIGEwAGrq6JQw6n7Pev120fsD/BBQMeNhp6+vGxJtrR3EUJjdW+tisW4/4HNI/CoYXahQwko5Qbnm/NX9QXjw8NO/xZn4X3u4sPNvqcAthFYKDZnGVdMh7yhRwCI5cC3Js8lvUlJ75CYnA5mZDy7vA3FEZsji2juz75vK23G9E+9CpA0/UTcdgK81q64R0rltMWy6UA3k+smA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8RoMvbCCA1f++QeWa/2B/0InoYavQTiFNIh2Id34LG8=;
 b=YCSCLqDoZvEJd0x3OaVNbOPe2uzKnR+gvmieuhtd/CexDCnkNgmylrUYwge0orOWpKzsnkuK9RvRWq1GOJzW9bd8oytyDmrsuWiFaGxSxyPQcJdl24o98JgiqrXyc8/Tpk6PaywFZdWzfD36Hm2kx7Lls41gH6AwqLacPBn06cwnpT0nLUsHNzOJ/kqaABhv05Hfk0NkMLnldByWv5wxWqcM54KZ5Am8axvKxZ8snfXPJQm9tHP7YZLH2KTTCebAIqW/wXEq7fHp9xreSIMFiYt3ePdELaHZFlzbJvbFlpiutG/nFbUeXm0c4lwp6eSGgk2M7keCFWuaXgIsedJmLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8RoMvbCCA1f++QeWa/2B/0InoYavQTiFNIh2Id34LG8=;
 b=hj2IROJkKnGYGuLMVcJ2Lm1HYwKSAonvn95bG5nIPpkImSUabf4c9wAVOdNlJLMyaHWWSAC7hIwRP4c21iJ7eW+R0dWOWTiUQL4PX3p5BIE4NfPkMB4ZgGJfDGG9M2X8l7LzWSWR5ngeX6mFQ/yR3NiOinIwLsgrwQVApXwEP7M=
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, =?Windows-1252?Q?Roger_Pau_Monn=E9?=
	<roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>, Jason Andryuk
	<jason.andryuk@amd.com>
Subject: Re: [PATCH] x86/svm: Adjust vNMI handling to update the cleanbit
Thread-Topic: [PATCH] x86/svm: Adjust vNMI handling to update the cleanbit
Thread-Index: AQHdatCVxv5aMy5E3UirptM0GAVt0LcazasAgAAmNnw=
Date: Mon, 2 Nov 2026 16:12:37 +0000
Message-ID:
 <CH8PR03MB82743DC59D48A031251F71AAF06A2@CH8PR03MB8274.namprd03.prod.outlook.com>
References: <20261102134621.1693316-1-andrew.cooper3@citrix.com>
 <0c81f171-7ffc-4a59-8f9e-69ad27371b96@citrix.com>
In-Reply-To: <0c81f171-7ffc-4a59-8f9e-69ad27371b96@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH8PR03MB8274:EE_|BL1PR03MB6054:EE_
x-ms-office365-filtering-correlation-id: c0db73f4-296e-4fb4-8e6e-08df38fc1cb6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|261102123227099003|56012099006|261021121427099003|38070700021|5023799004|4143699003|11063799006|261028144727099003|261009223027099003|261022075727099003|261022105027099003|261026140227099003|261026121527099003|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 uRYLpvmyaJVB4bsQHxriM7k51suR5DVBoi0r3hfXrWHP52A3ojPa9Ok6s1RQf+KC2sWEmNqQTMGV40KKZ/kmkNZdEvHQ6HekNkHJFJeyHmO88gK8h3rgUzQMERJL8tLzChdq1T4Gk3BARApEL/P1RyPD+WMDYLsufnIpK+4bC4y0xW/UPVM/tPv0BFcaK67nGVbJ0PsP/FhRdYmqMA/jL4vgzt9Z7hwyXBSgUzfJt6wAG1GYJvttVrL/sdw0mnwA6GRomsggr+DAV/z36O+2n9BXORhNYto5nWzU7Py3+5rcX616mo0e6nNeEbFk1NjZNzoUVArGt/Ze74MkIlEBKFXKAsucH2AkKXTY99FGp9LS/Tjjnmz25o+jaD/c60wZ+bH3JggoGaZpAy9rMJLSdNf/wo52xfACDnYpyVDhUuJ9njgZSYjBk9F9tw0kJ+Oiox2jy85tuDucBWxeW5rtguIYMCkt6gLWLCVMsxm6pGCeFlfEugznlbk1zAX2lmFtWfsfnQMxmDmO4v4f548oTCzO2zEZWqm4JzNxAigOOb0ijy8BDY2z5vZMMkhFQdX9jFGsyDA3TnO86s/kCx1JwLqjCHXRHvMLp1kLqTQCtOmYA8gcYOXGM9lANWsbP1Cx3OdRvQ0HD71R1NVUP6Gp66ae/+6CgSpNHwujpurx/dkZW85b+d2EeMc7EywZFgrJwsn05DsToRmpz9ldpjheaE1AJ7gPGg3e35hfkMj5cDg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(261102123227099003)(56012099006)(261021121427099003)(38070700021)(5023799004)(4143699003)(11063799006)(261028144727099003)(261009223027099003)(261022075727099003)(261022105027099003)(261026140227099003)(261026121527099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?v5HJ2BNSwzp0DPOMBDrRFTNru3vtdJDojo/KVsUslgOF3MuzxJBazYIe?=
 =?Windows-1252?Q?VKHOSNRFKq8ewj0VgzVtfizRAfPlsGaVyP7zQUjAWRSrGUtzPYjimktS?=
 =?Windows-1252?Q?+wDa3ZxPFBuDZtQOZhlUxLt4ihaRZoCbxA5T7XI21vqrGn8ES5LQGndJ?=
 =?Windows-1252?Q?UCp6MRRrvd++VySQMnhr25F+tCxNysiUhFAWMZP2n7nWYrMIYUr9jIoS?=
 =?Windows-1252?Q?8pEQbQuHIhwtx0usArWcqiC0kIzDS+30xJacfP6HLb/O8+0qP6P7ruq8?=
 =?Windows-1252?Q?9Mtq9gIkrxL2vLlPn50e/qg2LB6hn/fwyMwP7Krtc8tZWayEhSrpLIU3?=
 =?Windows-1252?Q?LadV/fy5yXLHccOeI+dZv27mScwhY5zT+JhlNqhjvqk+EyAatSSqZDgQ?=
 =?Windows-1252?Q?6w3azLIWvPvg7oYFWtl/NimZoN5P88N5bhEJzt92FWUaga3F0eAiBGVl?=
 =?Windows-1252?Q?gh1NbulY1ReOWIdzzYcMkfDnUJkXcqaGr2Cv5CfdmroABreJrwnIFjoK?=
 =?Windows-1252?Q?r4GrjXj9az3yyzxdmPM4v46o0Kl2sLL1V8gJ2820dQh+xFnk5d2Azk4i?=
 =?Windows-1252?Q?6ruqpUX4Ivme8erz4pJsVgbPNaqptGV2WrjkF4TorpSjaN0jNyATWmLv?=
 =?Windows-1252?Q?YMu3DtGWnHM/uB/suldbQUyn/bvOtsQHDh59DbeURb+dbEQMK4sKbJpA?=
 =?Windows-1252?Q?US7Wwz62+U4fw63MZmEl16IO2OIh/k8orfdG5lJ9q07bwkot+btyud28?=
 =?Windows-1252?Q?Ad961N8qy82HN1sOiBDBImEmzWU59hjtQAyTejj+SjEaiJZfNHs1mj3w?=
 =?Windows-1252?Q?II2RD0n7fHKNnLtW8QDhlT7NGbNKj8DV0Ksz5pp/pVOWWp0FHiC3UNzS?=
 =?Windows-1252?Q?Tr27JvT/MQrx1EHvdjiXSJXPRILE3y48P98y/e1EIQn8Xoq7JSP0Kkxe?=
 =?Windows-1252?Q?X+Uj5LqruMTVULxJvkRQ6Zooelcf2OzP08ghzaqR+Goq/7AVDAfLOy9+?=
 =?Windows-1252?Q?si6DNzJ9kkdVVEGZWJgHHAjf8GRpuvG6qVAvnLWQQy2lrJFgIDMZxdWj?=
 =?Windows-1252?Q?pETBOPLyKDJODOf5SpcvUApW6xlI4eDtrK3r96ft94gDeGFfTm0OWrO2?=
 =?Windows-1252?Q?EGTmQ0FRnsjjerI8HCdeJPihWZdgpW+NYhlCa0NwUO6ju9LyUY69dklj?=
 =?Windows-1252?Q?o/TD9t9v6K3kbu7y2R96e0ZXaoDrSbNKtGPc/S2BS4QnSdv/kv4kAri0?=
 =?Windows-1252?Q?1VnCeXz5aN3tn/GEJGbgHKvFsio6wJKyns8Y/1kV2rq6dGZfobgkhgbH?=
 =?Windows-1252?Q?liP56Tlg8fzE8xjtRfzw/6wCE6TnANX9lvwMXdafolanWx8c55yBuKfi?=
 =?Windows-1252?Q?G/IeJi3a3qBVQ8+Utdds3zXttXZcSGMZiWK3FXa90bJ3pwmPMMm6nveN?=
 =?Windows-1252?Q?O3y5tP8AClJNwLARSsh/u9GuivO5RNGr/yIbVL6/vUJRFfFTjh1fepIL?=
 =?Windows-1252?Q?udthrYMEAQGSt7koh1E1t0Nh1UuriNflVTJe7p9/c8Gug9aKMhwuu+ed?=
 =?Windows-1252?Q?Kx0v5CJyMjFmL4Xrz2YZvFXxwhADCcuBVJwvHJesa9ccvc0b5Fm/aBqZ?=
 =?Windows-1252?Q?KQb0vIHvDAmGb5D0MjVofmSObAQzUKKF6wn0pT/adTiMi6zu92QPTxKA?=
 =?Windows-1252?Q?O2aUS35Iy83tCd3WkNQATizVKa2hp1RQzQnt4w+K8aSUUKaOfMU3QdjC?=
 =?Windows-1252?Q?v94nYqdGQHp7VSghGrQU0o2UqBG/0P0X66lCg9ZIxaHWmI7Hl0ysEnMe?=
 =?Windows-1252?Q?jFzK0mJOrpkCoAKCLNDAkE92lZinIRzjX308wVZ0uBhgiwsKFR5L23y5?=
 =?Windows-1252?Q?CcL324lPcFo7nA=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0db73f4-296e-4fb4-8e6e-08df38fc1cb6
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2026 16:12:37.4201
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iB1Kd1hBeIgnZhj8CsE2mf/c5wk6kT9aIHFJJPFLHHIuJ06tbns4AE1AGcocLxf4RfsvSeb/lY56izKunYJP3G3fTedunivVaWIggBCvLoA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6054
X-purgate-ID: tlsNG-ef75cf/1793635960-356C2AE4-DEB0A44B/10/78276251493
X-purgate-type: spam
X-purgate-size: 3058
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> on behalf of And=
rew Cooper <andrew.cooper3@citrix.com>=0A=
> Sent: Monday, November 02, 2026 13:54=0A=
> To: Xen-devel <xen-devel@lists.xenproject.org>=0A=
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; Jan Beulich <jbeulich@suse=
.com>; Roger Pau Monn=E9 <roger@xenproject.org>; Teddy Astie <teddy.astie@v=
ates.tech>; Jason Andryuk <jason.andryuk@amd.com>=0A=
> Subject: Re: [PATCH] x86/svm: Adjust vNMI handling to update the cleanbit=
=0A=
>=0A=
>=0A=
> On 02/11/2026 1:46 pm, Andrew Cooper wrote:=0A=
> > Despite prior information to the contrary, APM Vol2 revision 3.46 Octob=
er 2026=0A=
> > has been adjusted to state that the vNMI fields in vINTR are covered by=
 the=0A=
> > TPR cleanbit.=0A=
> >=0A=
> > Adjust svm_inject_nmi() and svm_set_interrupt_shadow() to use vmcb_set_=
vintr()=0A=
> > rather than writing into the VMCB directly.=0A=
> >=0A=
> > In svm_inject_nmi(), fix an inefficiency from the introduction of vNMI.=
=A0 Move=0A=
> > the reading of vmcb_get_general1_intercepts() to the point at which it =
is=0A=
> > used; tt does not need reading on the case that vNMIs are enabled.=0A=
> >=0A=
> > Fixes: 86a203ab8d38 ("x86/svm: Support vNMI on capable hardware")=0A=
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>=0A=
> > ---=0A=
> > CC: Jan Beulich <jbeulich@suse.com>=0A=
> > CC: Roger Pau Monn=E9 <roger@xenproject.org>=0A=
> > CC: Teddy Astie <teddy.astie@vates.tech>=0A=
> > CC: Jason Andryuk <jason.andryuk@amd.com>=0A=
>=0A=
> I forgot the extra comment.=A0 This bug is hidden by:=0A=
>=0A=
> =A0 =A0 /* The exit may have updated the TPR: reflect this in the hardwar=
e=0A=
> vtpr */=0A=
> =A0 =A0 intr =3D vmcb_get_vintr(vmcb);=0A=
> =A0 =A0 intr.fields.tpr =3D=0A=
> =A0 =A0 =A0 =A0 (vlapic_get_reg(vlapic, APIC_TASKPRI) & 0xFF) >> 4;=0A=
> =A0 =A0 vmcb_set_vintr(vmcb, intr);=0A=
> }=0A=
>=0A=
> at the very end of the vmexit handler which unconditionally writes vINTR=
=0A=
> and hits the cleanbit.=0A=
>=0A=
> This is an absurd codepath.=A0 SVM has virtualised CR8 since the very=0A=
> beginning, and put in CR8_LEGACY for Windows to use even in 32bit mode,=
=0A=
> so the only path modifying TPR is a non-accelerated write to APIC_TPR.=A0=
=0A=
> =A0That path can be updated to modify vINTR, and this logic dropped.=0A=
>=0A=
> ~Andrew=0A=
=0A=
The APM says "(Offset 60h=9667h)" for this bit in the current and previous=
=0A=
versions. Perhaps that means that more or everything in that range may be=
=0A=
covered by this bit in future? In which case more extensive changes would b=
e=0A=
needed to avoid future breakage.=0A=
=0A=
On a related note, I see the APM says this:=0A=
=0A=
> If any VMCB fields (excluding explicitly uncached fields) have been modif=
ied,=0A=
> all clean bits that are undefined (within the scope of the hypervisor) mu=
st be=0A=
> cleared to zero.=0A=
=0A=
AFAICT Xen doesn't do this. Might that cause breakage in future?=0A=
=0A=
Ross=

