Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27294606A333
	for <xen-devel@archiver.kernel.org>; Sun, 22 Nov 2026 18:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=lNWmGSLJ
Received: from list by lists.xenproject.org with outflank-mailman.1499781.1696417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVCHu-0008EH-1X; Sun, 22 Nov 2026 18:27:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1499781.1696417; Sun, 22 Nov 2026 18:27:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVCHt-0008EA-Tf; Sun, 22 Nov 2026 18:27:41 +0000
Received: by outflank-mailman (input) for mailman id 1499781;
 Sun, 22 Nov 2026 18:27:40 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1xVCHs-0008Cz-AD
 for xen-devel@lists.xenproject.org; Sun, 22 Nov 2026 18:27:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVCHq-00GqbU-QA
 for xen-devel@lists.xenproject.org; Sun, 22 Nov 2026 19:27:38 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6b033369-2eae-0a2a0a5409dd-0a2a4501a9d0-44
 for <xen-devel@lists.xenproject.org>; Sun, 22 Nov 2026 19:27:38 +0100
Received: from [40.107.130.130]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6b03341a-5bcc-0a2a45010019-286b82821dc8-3
 for <xen-devel@lists.xenproject.org>; Sun, 22 Nov 2026 19:27:38 +0100
Received: from PAXPR03MB7531.eurprd03.prod.outlook.com (2603:10a6:102:1da::11)
 by AMBPR03MB594458.eurprd03.prod.outlook.com (2603:10a6:20b:78e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Sun, 22 Nov
 2026 18:27:36 +0000
Received: from PAXPR03MB7531.eurprd03.prod.outlook.com
 ([fe80::77bc:127a:5664:10e]) by PAXPR03MB7531.eurprd03.prod.outlook.com
 ([fe80::77bc:127a:5664:10e%4]) with mapi id 15.21.0639.012; Sun, 22 Nov 2026
 18:27:36 +0000
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
 b=TN5EsRM+xJoRHDbdHJEFBSxfVpzRyWXAkz9V4ZpBq0AtRkhbDHlQqX7E6p4aPyQyjmUDF0G/WY879AZWy98S+KsqBmSF27UGx4GfuUQcA8ztmuOGWs3mJJdxjmpbgH98gj0EH9hQVsMuNlsEkj0uZgven3udWu/64G3tt13VI2J16iA3e6563uzirqnSMZTSic1n2C1VWTue98oJEHfP+AebykTKC8JYY4jOKlKaR/94vyy85Zs6r7Z3rK9VZRpK2x0xIgj74j+adGmYz3I5P2/IrhbnBtlilRE0AVge8cjVMmCYXc4NdU0gDX/I2r27a7ioCF2yS4pTDnyqTLJlZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MV8taD8WHI8F8ejaX2vtOUb10ejO9/QpnpvGeskUiOY=;
 b=w1Kf3XknmC/k/471IgCBxNbisYWzP+28fli4rKliWbUMjW6jBDlLLzBK87cYTy3eOZJVwLcOFM4qOUtP6ZN9bIKMS2N9i5A5MHdqZZRH5GHNbuvgE67uqoV46Ls4Jkj+HLTHQo8aWQSKOqsPQn/1WpaT2EUsMN7yIza56GlZaOFd9FiSf3l2Mw4MzesIgkQEm4qqWotwvXohYx2HPAHOx1DrIJzxr3Pz2p45W/ipZcZvpgkXwrNgpYQPvb6ns/nMIGXyuvA8V4ptKmXAg/Sb/IKJ29kYnO3lnlpbqbcWMZ4ZAWo/msoaZKc3+F4emK2f+a4QXXg0RliS7khYvXnvXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MV8taD8WHI8F8ejaX2vtOUb10ejO9/QpnpvGeskUiOY=;
 b=lNWmGSLJul8YaHJB4hWiKeVThDpYq5YE3mj41Lcu2dbvEb3QxfxtmHMCnnCve+0Cwa7JWa/H7rSVbVLtZD+CjHUkcyMYl48jpe9LBU7mgDs6p+gXHBbvYH3cDhjIcw0X26kEdxpeGJfAt39y1Os4hhjD696QaXK5G4fsobqY0f9k7MVuDBH6JbL842uMZgPb0reTPu8qe7RjS2VGuaaDec8tfj4yhFNt+Ubit4TavyhWDOZMxm3BXewmWy6QuchLO+V3+0FXvNFkpC0YOWiEUPUGc9y14nuoR8giHz5XPkBftsA5wQL7jUtMEk+HcXIOw2ftB/3LPN9Nqwc1TiGyiA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger@xenproject.org>, Ross Lagerwall
	<ross.lagerwall@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] livepatch: drop const from heap pointers in struct payload
Thread-Topic: [PATCH] livepatch: drop const from heap pointers in struct
 payload
Thread-Index: AQHdeq8lOz4p8FRgEk6hOEZYO+ny4w==
Date: Sun, 22 Nov 2026 18:27:36 +0000
Message-ID:
 <e23d13361b9a42ef1c100efd46911169620dfa03.1795370395.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR03MB7531:EE_|AMBPR03MB594458:EE_
x-ms-office365-filtering-correlation-id: 86a8f59b-e7ec-40e6-6c72-08df48c64848
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|23010399003|1800799024|366016|376014|261021123027099003|261021121427099003|38070700021|11063799006|56012099006|10067099003|261102123227099003|260925022911599003|260925021911599003|260925021311599003|261009223027099003|18002099003|6133799003;
x-microsoft-antispam-message-info:
 6dxE+rV1NJPoEcioMtamemRRo5uUknjWNYtmcZyQbBreHu6EBdfL5Df13HCVCeVjrVFuKiwsIXd8aW+OaeNFfdQJ+f2DtZgfE+VGfqWtlN/4L+cjBP3qfVr7zx8C3Rra3eca/6lNRylLpLNqxNQHtrYdL/6n6jLBzpoqIjaNl5ZzoL5bAWz98rcH7wm+c+FWwLv5HYB9r7dOIpGBdNNvopyuqqW5uml5a7J5R13tco33Mv7pBpUW/WNUyOi2KN40vYU3PJdzNGU0bCUJY0lIYn0ULwog4PCt4K84jnaoA9kx47S7OueXMw/BmJPp9bLFUHveKMS3LWbEjQG8qYLNcjhPvor3dXGzuVgEr+VjETeX5NlWngOdSCBPWRAkJnth2/SseTh/hr7onr/yW2wi7D+fEgp9wLqq6PYCiiu8ZlcFFubndNLrwq80kqJLANjiazlgwpPjF9iP6r6BSiuhKj7e5f65hkjFKlbXVKKTTnPR9VwKGixQiAvieLHrerDZistiPcoWEV5DT1hFwKfIzPIsxKqnwrWhlJG0cYL7it3gDCOrjHooAqq/n8wg7KAKw6ujdUwrXAQVnR4GO/nt1WwguMSb5W3MgrCzM1jxwkPB8/Vg8aQ1g4EtURaKghCSFOcTHrkyyWIypsMQeQGrnzfb7S3uMdIoHUjXjrKpyVtoRAadBiRISS2hHGgzB1VpNTLUGIveQkOawka0vWK7eh/vwFvZX57noqW9k9seXno=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR03MB7531.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(23010399003)(1800799024)(366016)(376014)(261021123027099003)(261021121427099003)(38070700021)(11063799006)(56012099006)(10067099003)(261102123227099003)(260925022911599003)(260925021911599003)(260925021311599003)(261009223027099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?J1evhvJPDuU92ytXYlM3F7xGHI5kfuPKnMRkrfFU2IiQxQ+VY2HLEQASXo?=
 =?iso-8859-1?Q?c/3GDrr5rnHsPx5JELbtjBYfJPLHDiAIwEpAgOxhj2FWSuE00faLXJYgul?=
 =?iso-8859-1?Q?wKDP0aKxXjmsRpMcRB8+XtQPfCIdmZHebM9bgePOp9s/EgMhQiWSneHibt?=
 =?iso-8859-1?Q?JNWGvq7WFWjLTRt4bTb2lcA10x8H8Vuw5vPatYFthgxH9f7Dkdnjn4OYZO?=
 =?iso-8859-1?Q?pS+F9pwbiJBOASdfsH61u70lBzfORXXBJmBZvfjP66DYyxOZWEUQ2KP0M1?=
 =?iso-8859-1?Q?zpb8WxOXqw5vbf2lH2h/O9C3YrElhVH5Brc1vlrFS7cM+J58M99Cllt7CF?=
 =?iso-8859-1?Q?7oZL5ihwhicF5sCZszMkh3NoI7mNS1oCGP9o7SYiq3ObksThmVB0dT0YWx?=
 =?iso-8859-1?Q?+G/ms6XTQS57vHc5itw4PeGRCA8Npz91myXB5Npzzi5AYTm2jjVTf/HfT7?=
 =?iso-8859-1?Q?hZDpI/LLtpaM8JcLZv248dC7jIUPfOW5nGRMCo8gDxAMGxZfEYj2RZZejH?=
 =?iso-8859-1?Q?emUlag3LmMZh262p7jWRBFmbxRUQ/iFCqk85zBhq7t0rF/5h1U6o1nZu3u?=
 =?iso-8859-1?Q?ptXSuHVhiP6fgnZmif4xyV5jAYWFyYKRFTTuAKkxXEXzUayHqfZXfgQrW+?=
 =?iso-8859-1?Q?yRyBQ+TkBIB9cGrDmLGa4wVH6PaEenrF+Pws1UCSRWnL7uN8XkLQvVZGNt?=
 =?iso-8859-1?Q?sd3sD3F22WY94K/MNExScSwHYiw/y/k/yj2RwTYpcKUg5DYsbeTyFBMyEO?=
 =?iso-8859-1?Q?KjQ2fKLEp4YSORSwGx6tMW6HqjIzyhFb8kVkLbDEolfBMKG/zr3dg5pWTS?=
 =?iso-8859-1?Q?hzQbj6MUE6HQBtt6hGHZSliC5dtwb1VZvMNZs9OEbE76LvVgwnLLVgxjBk?=
 =?iso-8859-1?Q?idnckY5Rr1qQTBsmYKF7CF1hQwcI/hMicXDtGd2e1SruHwEFCBxerNXJJK?=
 =?iso-8859-1?Q?S6XtRe+FHEac7x7E2MYH/cTOsmYyp2E6eD1ICe0Xr7kD6Gz8M2Yluz6Idw?=
 =?iso-8859-1?Q?0g/RFMbmJpPmKowC8Obxx19pRvjMT/tF2sNZl7jCiEtrWZ17AAo5+krPiT?=
 =?iso-8859-1?Q?a1+jq9dN1dJiEp4OoKyInyFkdfKZTpYk4vF+aKu7ssFkloAtUc/odBcnvc?=
 =?iso-8859-1?Q?Rd/0dtTLeI1CvsuVimB4hYzmIUjiu/8XkiKl2c77agVgq5qGYMDeaAr0tR?=
 =?iso-8859-1?Q?/VaGT5dndoENzdUaCVV0DbpKHb12qrsyrDI/rrbPxqwxir1qBGdHZUrTFO?=
 =?iso-8859-1?Q?VRNxEcsY1g9DMnNz9jGouyNPJ2N5HceL4Uysj35YvcI+9usCi2EX5dto6d?=
 =?iso-8859-1?Q?g+kwhE4LyXoPCqFDu1f8xHeugW/+FMoO4Ogg0sJDUSd+DCyRAIHA93l7Zx?=
 =?iso-8859-1?Q?sDwayxaMVmcyqVW7amJe0aikhSTlb7Pn8Xp6ZTDYV0dj24/XbjrTSQImE6?=
 =?iso-8859-1?Q?bBZGTFk6DFjW27UXSqA12nFC1Mvqb0RWHRBrd+LQhBRj0ZGBgNI02T5xzP?=
 =?iso-8859-1?Q?jV4OMsQCO6/t7bOHKGiqs+1+yCpu0Zy4g9rVA6nNBFVNMX1MAMb7ILgIod?=
 =?iso-8859-1?Q?YiiJP2cueloFoo8puOqYylwtfpzCBOLT7zPkAPsGzAO1TBlUYjk1I2brlE?=
 =?iso-8859-1?Q?EocPxwEYDgkUBGKHFdAe4TpGWIwBaZhIb9Jw0YgbDEm9Rvajv7A3nLQJdV?=
 =?iso-8859-1?Q?jIIIP34CVLXA8kX6WgwTkEk0Tsk9nltnMqtXQw4oGjyZXQSYJYei1ElPSe?=
 =?iso-8859-1?Q?t0LnDGjQMV78wdHCRQ+7sF+H5rkodrSqC4/WCa5R88PzRQxcXVuDlvSMGr?=
 =?iso-8859-1?Q?lDpzZ5xXB44/r3DwDR74k1LTQXieoQQ=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR03MB7531.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86a8f59b-e7ec-40e6-6c72-08df48c64848
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2026 18:27:36.2810
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mAeA0MSG3B/K3jOn+QNGeLl547im3PesA6SA9Px3ZFf70ao0IB3F8yehcdIzcESlEmZ2MYTfbSUdZwSTxDHOE0twtTWsZZC5G9+9PZ2H0Rw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR03MB594458
X-purgate-ID: tlsNG-d62444/1795372058-CBD495FD-1BA49A48/0/0
X-purgate-type: clean
X-purgate-size: 3414
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

text_addr, symtab and strtab hold memory from vmalloc_xen() and
xmalloc(). Freeing them through xfree() and vfree(), which take
void *, casts away the const qualifier and violates MISRA C Rule 11.8.

Remove const from text_addr, symtab and strtab, so the pointers can be
passed to the deallocators directly.

rw_addr and ro_addr are left unchanged: they are interior pointers
of the text_addr mapping.

No functional changes.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Test CI pipeline:
https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/3100089161
---
 xen/common/livepatch.c              | 10 +++++-----
 xen/include/xen/livepatch_payload.h |  6 +++---
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index 38d0cf8635..edfbe580ff 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -250,7 +250,7 @@ static void free_payload_data(struct payload *payload)
     if ( !payload->pages )
         return;
=20
-    vfree((void *)payload->text_addr);
+    vfree(payload->text_addr);
=20
     payload->pages =3D 0;
=20
@@ -1133,8 +1133,8 @@ static void free_payload(struct payload *data)
     payload_cnt--;
     payload_version++;
     free_payload_data(data);
-    xfree((void *)data->symtab);
-    xfree((void *)data->strtab);
+    xfree(data->symtab);
+    xfree(data->strtab);
     xfree(data);
 }
=20
@@ -1241,8 +1241,8 @@ static int livepatch_upload(struct xen_sysctl_livepat=
ch_upload *upload)
=20
     if ( rc && data )
     {
-        xfree((void *)data->symtab);
-        xfree((void *)data->strtab);
+        xfree(data->symtab);
+        xfree(data->strtab);
         xfree(data);
     }
=20
diff --git a/xen/include/xen/livepatch_payload.h b/xen/include/xen/livepatc=
h_payload.h
index c6dc7cb5fa..367fbbfcad 100644
--- a/xen/include/xen/livepatch_payload.h
+++ b/xen/include/xen/livepatch_payload.h
@@ -44,7 +44,7 @@ struct payload {
     bool reverted;                       /* Whether it was reverted. */
     bool safe_to_reapply;                /* Can apply safely after revert.=
 */
     struct list_head list;               /* Linked to 'payload_list'. */
-    const void *text_addr;               /* Virtual address of .text. */
+    void *text_addr;                     /* Virtual address of .text. */
     size_t text_size;                    /* .. and its size. */
     const void *rw_addr;                 /* Virtual address of .data. */
     size_t rw_size;                      /* .. and its size (if any). */
@@ -55,8 +55,8 @@ struct payload {
     const struct livepatch_func *funcs;  /* The array of functions to patc=
h. */
     struct livepatch_fstate *fstate;     /* State of patched functions. */
     unsigned int nfuncs;                 /* Nr of functions to patch. */
-    const struct livepatch_symbol *symtab; /* All symbols. */
-    const char *strtab;                  /* Pointer to .strtab. */
+    struct livepatch_symbol *symtab;     /* All symbols. */
+    char *strtab;                        /* Pointer to .strtab. */
     struct virtual_region region;        /* symbol, bug.frame patching and
                                             exception table (x86). */
     unsigned int nsyms;                  /* Nr of entries in .strtab and s=
ymbols. */
--=20
2.43.0

