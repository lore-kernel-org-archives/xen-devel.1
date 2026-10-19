Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C79CCF2D6
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 08:51:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1454001.1667465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIj5M-00026S-V1; Mon, 19 Oct 2026 08:51:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1454001.1667465; Mon, 19 Oct 2026 08:51:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIj5M-00026L-Rh; Mon, 19 Oct 2026 08:51:12 +0000
Received: by outflank-mailman (input) for mailman id 1454001;
 Mon, 19 Oct 2026 08:51:12 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1xIj5M-00026F-DP
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 08:51:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xIj5L-002RQL-JD
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 10:51:11 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ad5d9e9-8faa-0a2a0a5109dd-0a2a4501ab78-48
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 10:51:11 +0200
Received: from [52.101.84.131]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ad5d9ff-5984-0a2a45010019-34655483f7ba-3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 10:51:11 +0200
Received: from AM9SPR01MB0028.eurprd03.prod.outlook.com
 (2603:10a6:20b:410::12) by MA9PR03MB772455.eurprd03.prod.outlook.com
 (2603:10a6:250:10f::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 08:51:09 +0000
Received: from AM9SPR01MB0028.eurprd03.prod.outlook.com
 ([fe80::851:da2d:b88a:1b50]) by AM9SPR01MB0028.eurprd03.prod.outlook.com
 ([fe80::851:da2d:b88a:1b50%6]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 08:51:09 +0000
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
 b=yuGo0YU/tcHSyA1+s957B/hAsO0vGfeRl/adiiMrorPyFnoGMSEaakqDO8ZI6pZ9J19UjfKRAG5gGBglv7zjGRw6lGtZMxIEi/N9oelmf/vDs9VJRDysio4DuiNzwyjIRaJCVy7GlWqm9FGhYIGKZrA+mNP3kveSvGIoIZ5XQutSyDpJpmHKjVikCQQBRqYjMsW0XcB9UoICFLIOYjAeNKQte8iGbXXUnJZdgOITLngOLKv9IWstkYoPkKUPBPBe0Be6LELqoB4NuivSc9hD+2IiuAyEPOLLwGRy3bzaVN9srtJemCcgyGazo8pkzDdkkB308gqQ8cAOr43PTyJxtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Au1W/bV9kIxJexDLUZli5znRmIy8HsNAjkfS8aFPemk=;
 b=eKV20Xv5+rKlnQuewuiuNbWfUMhwCXsIanS/sqR4O1poKH8e+56Lclo99OZS5FXI+7Jm8mOA6P50Yzwo1fivi/cWjZEtJ+yw11Y+5CM0wcRJlJHg9guINBoqwLSfxSbTLRxem0MBUKOjGOjSYDYgHxg8CmTQaK3wG7bnEJxoR1bO52c2lxebGhhYDwTavxwE+TxdJpjeYIgkVy2Freo9QAiQPCI8Arr6JDJY/eYzL4rkmJ6DTOO/LSTkDw12Ln68coTp/5c6mU0RLlqscEdOdA0l5qBE7KOPOkJTfejxZERVt8ChJaBEBwlLjbvRllwbA/CS/VJyh4iEBEX4wKt0Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Au1W/bV9kIxJexDLUZli5znRmIy8HsNAjkfS8aFPemk=;
 b=eXOxp4VWUCz0385KQ+/am913dN2gn99W/7ulDGyBwAzSPMZuqfGmyIkysiT9rovC5qIkmB+x5LDbQIxdihIAEtqKBJ1DJ2MXvFPBBZa/iXcMyt1k3LAMunaYhUY7u0BlXkgxxkVvITz4rTKOftQzjTUIvfDw/HcNd4DJBlbhucC/go6RJdhjxz6dKBaU995/lmn3DypnUTkAY3/adObBCM+ZBWJivtR6+RDXbuwXBHjtFNuoiRLyWqjzTmVLOSMniJz3rZzUxOK5CAPAFSQV/G9Og/w+yFS7diLHgSMxNP0pmo7X0xO9L1a0R3PPIrl36fZ9ttGggdijLqx+vzRKKw==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger@xenproject.org>
Subject: [PATCH v3] automation/eclair: generalize the noreturn
 function-pointer deviation
Thread-Topic: [PATCH v3] automation/eclair: generalize the noreturn
 function-pointer deviation
Thread-Index: AQHdX6b80imhcnqS7U2zknLLHn+kXg==
Date: Mon, 19 Oct 2026 08:51:09 +0000
Message-ID:
 <d0af5523cf21dc3d8da6cf0e765fb34a664f7f1c.1792399445.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9SPR01MB0028:EE_|MA9PR03MB772455:EE_
x-ms-office365-filtering-correlation-id: 396f3e49-a90a-4d55-aabc-08df2dbe1ec4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|42112799006|38070700021|56012099006|11063799006|261009223027099003|10067099003|18002099003|3023799007;
x-microsoft-antispam-message-info:
 CKTjBLThNb4rd52vVUPww2/p/S59oXwYVFt1xVUdqnWa/bHTlzg62v2nQ3zLC8bb+uozZgM94nJvSDErT8k97XX7XYXzq4geQIU3/qUPFwcpQRkMaOtQkkBejbiQukEca7bYLKbjDntGC79aQ6HIFa1ISAREAoiUh1EV0zpmxNjCFKn+xHTJMVqUhcYcDDGMIaFI1XVIEbJuodqbWL8i9ipuMTF4MvXUe8XlAl4v/+ecUD5DxhlSwXGeMso4g+Ztk41OPbPhBzJOPZkKsCyBBeK/GTr8tQF+lVZ8+jweFCUuaEcwlkhZO8SnOwpJxPWsaDrFjakqyaCwHQ8zH0uuQvBVPYerS94B1pCHUozHec3M9rJfAzQg+h/epr2UBfmMguNhKvqxDIYAlMfVmrII2ejZ8ZfGjsDohHc4rIMzPwXysR3q6AHy6kD0rUiUWUAY4cv7JpEbuwVIuRor2/VDQ9NKWBxHK0GSE4W/ww26HRhNOeMrxcTygLrWhHknN5d0U+1NlpkU7okXb8x8oYbMV031tsYV1vo+ZHT/YpcpBOlyTcA2foL0CZQIrNf9GK1C9yjEH+up++ueoI7cMom/y6MRvzAkMjMwJMyVHy6XYe431Jd3eCeJB0ieKLcTPLc1aiTw4UKK+L2l4jIdEqEDiMYmPaprRj4+uslX9Vk2IhIav05wuSH8Dlq0Ss6C7ppj/l9J8tSMnl/xfFRPKliC7WBExPF8xJKTmrdRAn/kDio=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9SPR01MB0028.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(42112799006)(38070700021)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?rEh0WsI5epBPp+OchmEhQF9TZ1+eRofHxGapqvuGqve4N71BFdY92kvQuN?=
 =?iso-8859-1?Q?ydfezsEw76Bdsxhr1AmhkOJm1MsTq1OedQ6jmJMgIm9gk73RLIGcX7zVbf?=
 =?iso-8859-1?Q?u3R5dBlTyMhK9ahCuONkYVIQuP6z0PSLbQ3J7kTdC8vtz0eXm/06ldku0Z?=
 =?iso-8859-1?Q?tIBLdafXp/4Tr4yHkvfjdaMQxH2k3KB0ThlxqkQJuajX9rw5/GezLXnlnq?=
 =?iso-8859-1?Q?qd2iaC7AAon0ySIkgaCqRv/Xo3PDvGF9KtrW7Y9pr4UEJFRf9BeKs8vBY6?=
 =?iso-8859-1?Q?7NoEajtMnFjTuWKLSGHYSNjpWysQbRuP3jOZ/jYEM+7OsvjQqtOr7l3kH4?=
 =?iso-8859-1?Q?Zyi9uut+chIc0nqaVBWceoCdi/0EhRI5aFH0JPJuNcZzYgKoOWMfG/qJvW?=
 =?iso-8859-1?Q?ok1phKjM5pWUS7IOXwKRPnVRPfsONyLnCdSf8fYKsel/5oQW0jRpaLhiqs?=
 =?iso-8859-1?Q?ZAdJVjMvLCp5BcF3NIJsRuySnJiiu869xWVhOZcDfCbous5c6HTStSOXYm?=
 =?iso-8859-1?Q?tPCxOgLHlWES5JJI7snJgywINOGD9873tKzjcbwcNYMBusKs23dFXV6OS2?=
 =?iso-8859-1?Q?LeYyYsQvM42KBJcB1+ArGZYFOcW+d0F9++VHwtnQa8nNYzztxAy+fMknuC?=
 =?iso-8859-1?Q?S9DRzHQ+yoTvPREJAcPkf1bcFNNhiiUON4a7NDhhHJmQSOGIAjDvSDndbc?=
 =?iso-8859-1?Q?RLGVnPbFfyQT0AoLPMtMMcp6LSLG19Z5+HRUZ220UF5AdLsXU0UoD/leQi?=
 =?iso-8859-1?Q?sI5OiNOVBzhdcD5tG7E91igl6BpX65fJep/p10aYPD+Vi2G7IIAv1FBWhb?=
 =?iso-8859-1?Q?ljht8F+wKA4pjiriS+KHMQ7sOPgmVjdzsjSe7lI2XYAaum683zSPn4SFfn?=
 =?iso-8859-1?Q?dce6RJFU6wah+FldHvFzRAZ6h3ZXhpa/8pxfSmh9tr4rux1FcLguzjAXDH?=
 =?iso-8859-1?Q?KTZW/pQTDo5QACmklYqSV7q0eAPyoPehNIJgELcTCgorA/qjD5+xIgVzAi?=
 =?iso-8859-1?Q?egJN5IwEOJWolTbu8NZYPcGbrTQFQub+yIGYDR7hqt7hbRMWCPk6y1IZfD?=
 =?iso-8859-1?Q?epcU8I67XDjlRMLTx2Q5cEvc88NVd4lvvtGhseh9i0w/KuCWkEsQXsVWwp?=
 =?iso-8859-1?Q?OYqjliRfUWFWS4mNZsdx2/qi0pSmfegM1Ub6awrmO5+e555iuHU9EfNj3r?=
 =?iso-8859-1?Q?FedommhGhEjNulXDTF4n9K8YKm8bTxAWGXIdXPcgdMcQKvjbIP6Z0KibVl?=
 =?iso-8859-1?Q?HEeKLDakU43bK7Pm9m/5rpRrrX2vRSfuJEYUlaOTaehxAimlOyXA1RI8Px?=
 =?iso-8859-1?Q?KJBag/PAmeezo3aQvovJ+CY0aophtV0aBcB6F5o6xkW2UNyNWC8gWgu3fC?=
 =?iso-8859-1?Q?q97vTM2hSKWkNvPOrl4QHPTSOENH0O5dQhIfpbmuohraF/6bdvRTlnBF23?=
 =?iso-8859-1?Q?q2scL1oj0GMrZL/pd23i++YW6j6Yejgb4XUyTnOR9Slz/eN7EhdYWaS6du?=
 =?iso-8859-1?Q?wrI6iaRTEZzkoJo2FHklCLikdxy27fvUFf2q1wTjp9QfAJa1+17qOK7gwN?=
 =?iso-8859-1?Q?IEgoWwa7pi99QiOgaN+TCN3i0mzbPRsYD0jdMKkEd9PWJ3I8js4km3XYQ2?=
 =?iso-8859-1?Q?bX7GQs1rT0VLT6PxSCZtVKQ0/qBe3YRbeqOk0adtYHguQuKMoS9E5y2tOs?=
 =?iso-8859-1?Q?VAIj0xfERObbpzVHBk2wn3Ui7znpuUnr71glItq4O5RYsdj//1EW2Oa/Ld?=
 =?iso-8859-1?Q?DlMYhMyJEGYrtKT41VB0/dJFXa7sMQuPeFpqGc0pDLT/eZouXz2JaVBn5C?=
 =?iso-8859-1?Q?JaC+aL0ITnh/1DUYLdUFr20MxpBcIq8=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9SPR01MB0028.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 396f3e49-a90a-4d55-aabc-08df2dbe1ec4
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2026 08:51:09.2555
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Dw4tdkoCv+29YXr7G4iHYVEiVx3mGMXtLX2BkNho63k9K3tHXqV9QWHtABqlV0/V3k70G9djm74Mwy7p1xMSiX2D+7KgYcPQ+u2F6DFidTc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA9PR03MB772455
X-purgate-ID: tlsNG-d62444/1792399871-BE27A757-15DCACE2/0/0
X-purgate-type: clean
X-purgate-size: 4926

The R11.1 safe cast only matched void noreturn (*)(void *). Accept a
conversion where noreturn is omitted and the signature is otherwise
compatible. canonical() covers typeof destinations, and
compatible_deep_unqualified keeps the parameter and return types aligned.

Discarding noreturn does not change the calling convention. Code after
the call is unreachable when every possible callee is noreturn. Leaving
that code in place is a tolerated Rule 2.1 violation. The full rationale
is in docs/misra/deviations.rst.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Changes in v3:
- Reworded the deviation text per Jan's review: "noreturn omitted but an
  otherwise compatible signature", "all of the possible callees", and a
  tolerated Rule 2.1 violation
- rules.rst: use '(void *)' spelling

Changes in v2:
- do not claim that discarding noreturn leaves compiler behavior unchanged
- write that code after the call is unreachable, and that Xen's behavior
  is the same (whether the compiler deletes that code or leaves it)
---
 automation/eclair_analysis/ECLAIR/deviations.ecl |  9 +++++----
 docs/misra/deviations.rst                        | 12 ++++++++----
 docs/misra/rules.rst                             |  8 +++++---
 3 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/=
eclair_analysis/ECLAIR/deviations.ecl
index 6cdb10a129..c7a800c62f 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -394,11 +394,12 @@ constant expressions are required.\""
 }
 -doc_end
=20
--doc_begin=3D"The conversion from 'void noreturn (*)(void *)' to 'void (*)=
(void *)' is safe
-because the semantics of the 'noreturn' attribute do not alter the calling=
 convention or behavior of the resulting code."
+-doc_begin=3D"The conversion from a noreturn function pointer to a functio=
n
+pointer with noreturn omitted but an otherwise compatible signature does
+not alter the calling convention."
 -config=3DMC3A2.R11.1,casts+=3D{safe,
-  "kind(bitcast)&&to(type(pointer(inner(return(builtin(void))&&all_param(1=
, pointer(builtin(void)))))))&&from(expr(skip(!syntactic(),
-   ref(property(noreturn)))))"}=20
+  "kind(bitcast)&&to(type(canonical(__function_pointer_types)))&&from(expr=
(skip(!syntactic(),
+   ref(property(noreturn)))))&&relation(compatible_deep_unqualified)"}
 -doc_end
=20
 -doc_begin=3D"The conversion from a pointer to an incomplete type to unsig=
ned long does not lose any information, provided that the target type has e=
nough bits to store it."
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 6bcc2adf95..76be6b3251 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -392,10 +392,14 @@ Deviations related to MISRA C:2012 Rules:
      - Tagged as `safe` for ECLAIR.
=20
    * - R11.1
-     - The conversion from 'void noreturn (*)(...)' to 'void (*)(...)' is =
safe
-       because the semantics of the 'noreturn' attribute do not alter the =
calling
-       convention or behavior of the resulting code, parameters handling r=
emain
-       consistent.
+     - The conversion from a noreturn function pointer to a function point=
er
+       with noreturn omitted but an otherwise compatible signature does no=
t
+       alter the calling convention. The callee does not return, so code
+       following a call through the resulting pointer is unreachable. The
+       compiler may delete that unreachable code when it can see that all
+       of the possible callees are noreturn, or it may leave the code in
+       place. Xen's behavior is the same in either case. Code left in plac=
e
+       is a tolerated violation of Rule 2.1.
      - Tagged as `safe` for ECLAIR.
=20
    * - R11.2
diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index a59cf1782e..5f9fe4c860 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -435,9 +435,11 @@ maintainers if you want to suggest a change.
        and any other type
      - All conversions to integer types are permitted if the destination
        type has enough bits to hold the entire value. Conversions to bool
-       and void* are permitted. Conversions from 'void noreturn (*)(...)'
-       to 'void (*)(...)' are permitted. Conversions from [unsigned] long
-       or '(void *)' to a function pointer are permitted.
+       and '(void *)' are permitted. Conversions from a noreturn function
+       pointer to a function pointer with noreturn omitted but an otherwis=
e
+       compatible signature are permitted.
+       Conversions from [unsigned] long or '(void *)' to a function pointe=
r
+       are permitted.
        Example::
=20
            unsigned long func_addr =3D (unsigned long)&some_function;
--=20
2.43.0

