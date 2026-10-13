Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D84CA9EC5
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 02:32:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446642.1662729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGSIN-0003ha-DE; Tue, 13 Oct 2026 02:31:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446642.1662729; Tue, 13 Oct 2026 02:31:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGSIN-0003hR-89; Tue, 13 Oct 2026 02:31:15 +0000
Received: by outflank-mailman (input) for mailman id 1446642;
 Tue, 13 Oct 2026 02:31:14 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Volodymyr_Babchuk@epam.com>) id 1xGSIM-0003hL-It
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 02:31:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGSIL-00BXmE-7S
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 04:31:13 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6acd97b3-2eae-0a2a0a5409dd-0a2a4502b4ec-48
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 04:31:13 +0200
Received: from [52.101.66.81]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6acd97f0-6ca4-0a2a45020019-34654251faf0-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 04:31:13 +0200
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com (2603:10a6:803:113::29)
 by DBBPR03MB7131.eurprd03.prod.outlook.com (2603:10a6:10:1f4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 02:31:10 +0000
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48]) by VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48%4]) with mapi id 15.21.0496.020; Tue, 13 Oct 2026
 02:31:10 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=liuIdE0ovptn0Df0L5tXmFi11tm5mbbxLm2FoMDUE8Zx6KafqrDhO6QwKvFcTDEkifzpMJBY1WwyLJOepBIuV6Smu1+bRtxmtrbE4tkDra3mqNxJZ06Jw9E2Xk/ubjFof4eYN7oq7Jj8PYgIpxzPL/FrAydGs94MSojArvhYnf0s+ZHUoAtvxZoXRJyQYwaVJnFPKw0EIbm166gRxI092NNc+BS2se16uCbfydC4zD6eQKc9INIRBg9nBmrQnUFSHDtAsw91sReXItBKh4J/MAeljyanZdzruF81OZSy9zG/QvRg39+1eKzKZck1b76WZHrms9gEY7iEctM5p+JKFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ot9hhRh9OnXRZP4Ej2WBfGAjnd50GSuNZ4BtxnTZubQ=;
 b=rD1RKKTEd/AEEZ3xuSIFrGE2N+9OHpwLEVf1eHgZsRai70sJ2wQ5vGG3mqZdmFDLKeesZDl2Pe2BH0Gz2zs6mvw6FWLsX3JAsC75KGlFIQXgOCac3nlKVl4nWY12rXonfvadwHyyIqamKS9Y9IYE15Vb4CX2G4eGXTO7/ynFAwkPALO813dJm6588eOtdSVQJpiMG4Y/U2XHruk8w5ZHAXt4HxFh/11g7Kg+75nzLRZ5d+4828ca8TpongX5SCwovkpl9l7U/R60v2ujaZGUStlCDwmzsFegbzbPHAAAoNruxj/4mC83CpfatNpAnaIdcEWinyx1gHN9x+BInRZYFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ot9hhRh9OnXRZP4Ej2WBfGAjnd50GSuNZ4BtxnTZubQ=;
 b=PRmRUoPdQz5qV+0cRmm79r2xzZbb86tSAAwBJHXco1QDOj8nG0CxHVkgolGKrVB5AWVljK61akdvD6gTjRi6LwEN0xlzcTopM8SB/XNN8SdOAlREpCgx7dvrpmQLSEFprmDKhgQSC63c5kfp9GoNZ2XrvL+gAv3mwQzSlnA0qmtcTFp1wf71ituRm7LmcLczRwQZRFrd82iV8IasQ5SpH4gNQTGWcsxb6QAFpmvUX27SZBZXRp77uMkreyVnkaGskwkj3oDtCzcIeD0tDYn4oAhN/ylSDz61lC7lk7T+RNKP9aMHvUk5Nk1KTKsZpjfK3qjV92VihxwqfRxHgqyk3A==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Mykola Kvach <Mykola_Kvach@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger@xenproject.org>, Jens Wiklander
	<jenswi@kernel.org>
Subject: Re: [PATCH v6 1/4] xen/arm: handle irq_set_type() failures
Thread-Topic: [PATCH v6 1/4] xen/arm: handle irq_set_type() failures
Thread-Index: AQHdUDM172HH4zh0KU2n7bf3fDWjHw==
Date: Tue, 13 Oct 2026 02:31:10 +0000
Message-ID: <87se2awcuq.fsf@epam.com>
References: <cover.1790699282.git.mykola_kvach@epam.com>
	<1cc5a52b61d3ed8176b2a12f23f284a44a8a72d8.1790699282.git.mykola_kvach@epam.com>
In-Reply-To:
 <1cc5a52b61d3ed8176b2a12f23f284a44a8a72d8.1790699282.git.mykola_kvach@epam.com>
	(Mykola Kvach's message of "Tue, 29 Sep 2026 19:54:09 +0300")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: mu4e 1.14.3; emacs 30.2
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VE1PR03MB6078:EE_|DBBPR03MB7131:EE_
x-ms-office365-filtering-correlation-id: 2d98a68c-816f-4dbc-245c-08df28d20afe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|23010399003|7416014|376014|1800799024|366016|6133799003|18002099003|22082099003|10067099003|38070700021|11063799006|4143699003|261009223027099003|56012099006;
x-microsoft-antispam-message-info:
 tTOcxkOZYZ91UWcBN6KF6DDWRFOE/DI4f3FUllQNgDfVCvl4gAuwFuXizVBd2Cbw4SWk49+S4sg/pKdNxsSNnV17pi73smW143fvS/HHX9FkrPUSUNffU400x5tZkLdVwY/L37C/a5iYry8BiSAS4fgg1DJFZVQCMwvmzarQoyTZpJHzKRYruV7VHV1iVXhs4GTyGwZAhQ6uSZpWBRQQipUmSMAzJOiQSCDUjwi+dQEgIghaAMJnVNqVOIjXqZ3t5OG0OlJzEGWbT0uiWG0krbdBgr4g3+yilK0Qi2tsuukgip6yE0x0qBRhS41PruUiKSCdg0a+UED8g3JesuP32AXfNmibzvBR2fpb0Ipa2w1bXCeutWuLGhz5q6tlC8Z5t4nKaMVKcy5MFlHFn7Eu0rbV3YD+HuB8FbcL1aK2uHUVEdBUas+6Bfb2o93lA/yJx74fMd9F+Kgrs7QDGi/oqlbdSlaFBAtPn20jhj/zS/LQaMF9Kt4m/WOotN7LNnzf8uzJrJ1SzRqefNxpiUUR9ldWJdyNx/SqUVNmS3N8ed8u62avkAnRTN/uc5gzDe0CA4Du+U1bKdhSqP3z97YcLzgBaV5gsxORlnAx0ST5jJvmPdfbmPyWuhXLXG+lQPgYc+MSR90lrJioYt0O/il8WwK9e88JP7vlYsruNCf/cH8DubWJ+8Ymo5noQyPnJ8r2rGnleoOsHbizEni9aRn+aGu3cdCxppvpHhGfngo611I=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR03MB6078.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(23010399003)(7416014)(376014)(1800799024)(366016)(6133799003)(18002099003)(22082099003)(10067099003)(38070700021)(11063799006)(4143699003)(261009223027099003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?YEo/eubAjZQIJMt4tfoFwKkwyAmwzl7XmEXRIIBOYQ75BZOP937yIxMc4Z?=
 =?iso-8859-1?Q?ahtpNHBmBdUmWl9/Q0J2YbNIi9c9UxkcELeR8483gQpsmB0q80ZZXObchk?=
 =?iso-8859-1?Q?EdLmgd+NCXP3yr45fYwI9ptXEYebn/zx0B8YrSk3MVycb1l9HD0jZpA1fE?=
 =?iso-8859-1?Q?tUHpbMciOAE6UM/QAsJIzKZhPhrfUGTxU6zkttZI1gZ69U/735CzxWaDcp?=
 =?iso-8859-1?Q?jDzpeQR6jxvfOHgCQrPOqQz+Iq+9WcdhlYNIcOcJ9nproSDTguA/bqqYtr?=
 =?iso-8859-1?Q?yRp8yngpJJeSGZmaqOXNjfBS8NeNF5p10tJybfYZRuG+8dGHnFiRZfgJWP?=
 =?iso-8859-1?Q?cKP/DOAI37sxLPQeAO0xCkV7Ld0Tv2/8JB9jJnoMfrL1EjeXPO7jLQZ2rg?=
 =?iso-8859-1?Q?x9D/T8wJQEn60B8QJHmHU8oh8IP9bdX8ptVJzrs2Bdj1pJW73vvgArkUd1?=
 =?iso-8859-1?Q?5VVq7JfMJ8NG5LtQkew/8zK5bOzWTdRAVJ2chvRGfF8z77wcwGnW9s4U5M?=
 =?iso-8859-1?Q?n97uB6ZrwWhjPOQjjZg9n0CHEtay855Mstq2UkJB3/5AGwdQOuugdO7w/0?=
 =?iso-8859-1?Q?0Ksk/8NRelGRzuCNA7x0KLnHv8XVOupOPy+XT8XZKagmFRTUbLT7ETBTWP?=
 =?iso-8859-1?Q?FqIYFxdwWGeBcpIQ/bNavNJElFESOmVOIlndPBHNhSIoYT6N2yMNj0pUWJ?=
 =?iso-8859-1?Q?xnNcv9pkp333b9gP+bLA6DC4LDcq0VDiORPP3pEe5A396/y2OSLz5bMl5G?=
 =?iso-8859-1?Q?CfXbctS98mSibwYLr/5RtpPkQBVcWDHcVWtSE+Y5DM9v5RJEYG4jZxc7u7?=
 =?iso-8859-1?Q?l6FoJtGPku7Po6ifk9byxSBwWaBC/7xKaFacMjvLvfsmAoBSBI5iObV+rr?=
 =?iso-8859-1?Q?rEvEOzez5bzuV1NfctWCYuQ6e1Z9FStVAawbJPxXik2un1CnD13KIcv53I?=
 =?iso-8859-1?Q?XqE8h6xm3pBzKD0zG49A+ymOFdHLa7lTM+S4iloBqQGvwBoI5hwaCoVNJK?=
 =?iso-8859-1?Q?8Tuh2xKTE4a6Jau2AkxBO3pjBEFNowqagnOPzO4fuAkQAnGlEnsE92ZmNr?=
 =?iso-8859-1?Q?bOgTtZOS5139GS2/RanlPkWS/Izo0KzTwF/eCVUkF1ZX0FqiFQV26JZ04T?=
 =?iso-8859-1?Q?LnLBz5pt9+Lzy9KNAhUSshlwsjZ1Ss9m1RX4YULoeBSgXPyYAbO7kL3sxF?=
 =?iso-8859-1?Q?2P1L9AFcDJW8RSmqpqIAnE03ARO2OjqD5CZ6jK0JkUwn0//Z8RClDCPvB8?=
 =?iso-8859-1?Q?CW+tvC01gDqbjSGmN/SYdbSjrR3sOfWyXZPfj+K+ek+xCOK+1URDBaaBTn?=
 =?iso-8859-1?Q?fSOBtzeydRTMlMfILNhGya3eG06imFdmy96JEGNeOf22bZmpwOnIE7D6sF?=
 =?iso-8859-1?Q?ENnuFEgMENX4vkOV0v99Pd9WFf+QHr+CILRs+937QRkF6+5cnB67ItGDnL?=
 =?iso-8859-1?Q?M0mWYzkmcPqDbs15AQoBi16AhhRe7kuUK/lXzIVYNByHfnXlLBVfll4LKT?=
 =?iso-8859-1?Q?zhEb0xxSlR1YmYYKU7oZnx1pyJRLV/kY+UV0be37zbbujWJ+Io+ELUHjGr?=
 =?iso-8859-1?Q?/sbPZW1uPPkO+2QhG0P7eTfYNVe6eZJVNn0hXhTbQ3VXnLuPOnQwio7XPV?=
 =?iso-8859-1?Q?MbB1twddf+lJTbTMPmF5nxkHH1wkevLC8K9nMbU+lRvcsgnHvhcjAyd2hk?=
 =?iso-8859-1?Q?059NhQQxCTIEMQ1o7vmd3wdSXUZAn5F4ZljNsoCJRvsqfSYyRmiOAZbQxn?=
 =?iso-8859-1?Q?nIiFfO4yXQtZFPOKA80Q1ggV2QAy6j6Jtlakc/rdtsYiu0ytzUq3GSr+UY?=
 =?iso-8859-1?Q?xhdhLSEWKvDAEyoouuUQSfJ3JEm1EWY=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6078.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d98a68c-816f-4dbc-245c-08df28d20afe
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2026 02:31:10.2114
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BHsnS9sZiAJoAqedbd3fQkXaGdQTn+5cpGpOC/n5Udkh4IRGIBVIDN/sbF0HkjirXk5cOCnpb/XghPxWHgGCqriOKF4SS9PbFqVXRsZ+cw8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB7131
X-purgate-ID: tlsNG-720697/1791858673-672B12AC-91AB7E82/0/0
X-purgate-type: clean
X-purgate-size: 9252

Hi Mykola,

Mykola Kvach <mykola_kvach@epam.com> writes:

> Several Arm firmware initialization paths discard irq_set_type()'s return
> value, violating MISRA C Rule 17.7. If trigger configuration fails,
> initialization continues with an IRQ that was not configured as requested=
.
>
> GTDT and MADT retain rejected timer and maintenance INTIDs.
> check_timer_irq_cfg() and release_irq() later perform unconditional
> descriptor lookups on those values. Xen has no backing descriptors for
> INTIDs 1024 through 4095, so retaining one can cause an out-of-bounds
> access.
>
> Check the return value in the GTDT, MADT, SPCR, and FF-A paths. Store tim=
er
> INTIDs only after successful trigger configuration, make GTDT parsing
> failure fatal, and stop notification setup when trigger configuration
> fails. Keep the NS16550 and PL011 consoles available by falling back to
> polling, with a warning, if their IRQ trigger configuration fails.
>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Not sure that this is a good idea to leave R-b tags if you are doing
functional changes to the patches.

You can have my R-b though:

Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

> ---
> Changes in v6:
> - Fall back to polling with a warning when ACPI IRQ configuration fails
>   for NS16550 or PL011, preserving the console.
>
> Changes in v3:
> - Avoid partial state updates and simplify maintenance IRQ setup.
>
> Changes in v2:
> - New patch.
> ---
>  xen/arch/arm/gic-v2.c        | 15 +++++++++------
>  xen/arch/arm/gic-v3.c        | 15 +++++++++------
>  xen/arch/arm/tee/ffa_notif.c | 10 +++++++++-
>  xen/arch/arm/time.c          | 18 ++++++++++++++----
>  xen/drivers/char/ns16550.c   |  8 +++++++-
>  xen/drivers/char/pl011.c     | 12 ++++++++++--
>  6 files changed, 58 insertions(+), 20 deletions(-)
>
> diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
> index d05c574d88..87eda9d322 100644
> --- a/xen/arch/arm/gic-v2.c
> +++ b/xen/arch/arm/gic-v2.c
> @@ -1166,17 +1166,20 @@ gic_acpi_parse_madt_cpu(struct acpi_subtable_head=
er *header,
>      /* Read from APIC table and fill up the GIC variables */
>      if ( cpu_base_assigned =3D=3D 0 )
>      {
> +        int rc;
> +
> +        rc =3D irq_set_type(processor->vgic_interrupt,
> +                          processor->flags & ACPI_MADT_VGIC_IRQ_MODE ?
> +                          IRQ_TYPE_EDGE_BOTH : IRQ_TYPE_LEVEL_MASK);
> +
> +        if ( rc )
> +            return rc;
> +
>          cbase =3D processor->base_address;
>          csize =3D SZ_8K;
>          hbase =3D processor->gich_base_address;
>          vbase =3D processor->gicv_base_address;
>          gicv2_info.maintenance_irq =3D processor->vgic_interrupt;
> -
> -        if ( processor->flags & ACPI_MADT_VGIC_IRQ_MODE )
> -            irq_set_type(gicv2_info.maintenance_irq, IRQ_TYPE_EDGE_BOTH)=
;
> -        else
> -            irq_set_type(gicv2_info.maintenance_irq, IRQ_TYPE_LEVEL_MASK=
);
> -
>          cpu_base_assigned =3D 1;
>      }
>      else
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index acdac22953..b32a9b5009 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -1743,15 +1743,18 @@ gic_acpi_parse_madt_cpu(struct acpi_subtable_head=
er *header,
>      /* Read from APIC table and fill up the GIC variables */
>      if ( !cpu_base_assigned )
>      {
> +        int rc;
> +
> +        rc =3D irq_set_type(processor->vgic_interrupt,
> +                          processor->flags & ACPI_MADT_VGIC_IRQ_MODE ?
> +                          IRQ_TYPE_EDGE_BOTH : IRQ_TYPE_LEVEL_MASK);
> +
> +        if ( rc )
> +            return rc;
> +
>          cbase =3D processor->base_address;
>          vbase =3D processor->gicv_base_address;
>          gicv3_info.maintenance_irq =3D processor->vgic_interrupt;
> -
> -        if ( processor->flags & ACPI_MADT_VGIC_IRQ_MODE )
> -            irq_set_type(gicv3_info.maintenance_irq, IRQ_TYPE_EDGE_BOTH)=
;
> -        else
> -            irq_set_type(gicv3_info.maintenance_irq, IRQ_TYPE_LEVEL_MASK=
);
> -
>          cpu_base_assigned =3D 1;
>      }
>      else
> diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
> index 186e726412..c64bc39f03 100644
> --- a/xen/arch/arm/tee/ffa_notif.c
> +++ b/xen/arch/arm/tee/ffa_notif.c
> @@ -407,7 +407,15 @@ void ffa_notif_init(void)
>          irq =3D resp.a2;
>          notif_sri_irq =3D irq;
>          if ( irq >=3D NR_GIC_SGI )
> -            irq_set_type(irq, IRQ_TYPE_EDGE_RISING);
> +        {
> +            ret =3D irq_set_type(irq, IRQ_TYPE_EDGE_RISING);
> +            if ( ret )
> +            {
> +                printk(XENLOG_ERR "ffa: irq_set_type irq %u failed: erro=
r %d\n",
> +                       irq, ret);
> +                return;
> +            }
> +        }
>          ret =3D request_irq(irq, 0, notif_irq_handler, "FF-A notif", NUL=
L);
>          if ( ret )
>          {
> diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
> index be54b87438..ccfb76e20f 100644
> --- a/xen/arch/arm/time.c
> +++ b/xen/arch/arm/time.c
> @@ -60,20 +60,27 @@ static int __init arch_timer_acpi_init(struct acpi_ta=
ble_header *header)
>  {
>      u32 irq_type;
>      struct acpi_table_gtdt *gtdt;
> +    int rc;
> =20
>      gtdt =3D container_of(header, struct acpi_table_gtdt, header);
> =20
>      /* Initialize all the generic timer IRQ variable from GTDT table */
>      irq_type =3D acpi_get_timer_irq_type(gtdt->non_secure_el1_flags);
> -    irq_set_type(gtdt->non_secure_el1_interrupt, irq_type);
> +    rc =3D irq_set_type(gtdt->non_secure_el1_interrupt, irq_type);
> +    if ( rc )
> +        return rc;
>      timer_irq[TIMER_PHYS_NONSECURE_PPI] =3D gtdt->non_secure_el1_interru=
pt;
> =20
>      irq_type =3D acpi_get_timer_irq_type(gtdt->virtual_timer_flags);
> -    irq_set_type(gtdt->virtual_timer_interrupt, irq_type);
> +    rc =3D irq_set_type(gtdt->virtual_timer_interrupt, irq_type);
> +    if ( rc )
> +        return rc;
>      timer_irq[TIMER_VIRT_PPI] =3D gtdt->virtual_timer_interrupt;
> =20
>      irq_type =3D acpi_get_timer_irq_type(gtdt->non_secure_el2_flags);
> -    irq_set_type(gtdt->non_secure_el2_interrupt, irq_type);
> +    rc =3D irq_set_type(gtdt->non_secure_el2_interrupt, irq_type);
> +    if ( rc )
> +        return rc;
>      timer_irq[TIMER_HYP_PPI] =3D gtdt->non_secure_el2_interrupt;
> =20
>      return 0;
> @@ -81,7 +88,10 @@ static int __init arch_timer_acpi_init(struct acpi_tab=
le_header *header)
> =20
>  static void __init preinit_acpi_xen_time(void)
>  {
> -    acpi_table_parse(ACPI_SIG_GTDT, arch_timer_acpi_init);
> +    int rc =3D acpi_table_parse(ACPI_SIG_GTDT, arch_timer_acpi_init);
> +
> +    if ( rc )
> +        panic("Timer: Failed to configure interrupts from GTDT: %d\n", r=
c);
>  }
>  #else
>  static void __init preinit_acpi_xen_time(void) { }
> diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
> index 593d208483..cdda28879e 100644
> --- a/xen/drivers/char/ns16550.c
> +++ b/xen/drivers/char/ns16550.c
> @@ -1990,8 +1990,14 @@ static int __init ns16550_acpi_uart_init(const voi=
d *data)
>      uart->reg_width =3D spcr->serial_port.access_width;
> =20
>      /* The trigger/polarity information is not available in spcr. */
> -    irq_set_type(spcr->interrupt, IRQ_TYPE_LEVEL_HIGH);
>      uart->irq =3D spcr->interrupt;
> +    if ( irq_set_type(spcr->interrupt, IRQ_TYPE_LEVEL_HIGH) )
> +    {
> +        printk(XENLOG_WARNING
> +               "ns16550: unable to configure IRQ %u, using polling\n",
> +               spcr->interrupt);
> +        uart->irq =3D 0;
> +    }
> =20
>      uart->vuart.base_addr =3D uart->io_base;
>      uart->vuart.size =3D uart->io_size;
> diff --git a/xen/drivers/char/pl011.c b/xen/drivers/char/pl011.c
> index a336241033..612d457fe0 100644
> --- a/xen/drivers/char/pl011.c
> +++ b/xen/drivers/char/pl011.c
> @@ -347,6 +347,7 @@ static int __init pl011_acpi_uart_init(const void *da=
ta)
>  {
>      acpi_status status;
>      struct acpi_table_spcr *spcr =3D NULL;
> +    unsigned int irq;
>      int res;
>      bool sbsa;
> =20
> @@ -363,10 +364,17 @@ static int __init pl011_acpi_uart_init(const void *=
data)
>              spcr->interface_type =3D=3D ACPI_DBG2_SBSA_32);
> =20
>      /* trigger/polarity information is not available in spcr */
> -    irq_set_type(spcr->interrupt, IRQ_TYPE_LEVEL_HIGH);
> +    irq =3D spcr->interrupt;
> +    if ( irq_set_type(irq, IRQ_TYPE_LEVEL_HIGH) )
> +    {
> +        printk(XENLOG_WARNING
> +               "pl011: unable to configure IRQ %u, using polling\n",
> +               irq);
> +        irq =3D 0;
> +    }
> =20
>      /* TODO - mmio32 proper handling (for now set to true) */
> -    res =3D pl011_uart_init(spcr->interrupt, spcr->serial_port.address,
> +    res =3D pl011_uart_init(irq, spcr->serial_port.address,
>                            PAGE_SIZE, sbsa, true);
>      if ( res < 0 )
>      {

--=20
WBR, Volodymyr=

