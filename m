Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A86DC98321
	for <xen-devel@archiver.kernel.org>; Fri, 25 Sep 2026 17:47:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1434355.1654373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xAA0d-0007Bh-AS; Fri, 25 Sep 2026 17:46:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1434355.1654373; Fri, 25 Sep 2026 17:46:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xAA0d-0007BY-6x; Fri, 25 Sep 2026 17:46:55 +0000
Received: by outflank-mailman (input) for mailman id 1434355;
 Fri, 25 Sep 2026 17:46:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Volodymyr_Babchuk@epam.com>) id 1xAA0b-0007BQ-LW
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 17:46:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xAA0b-00APfT-2H
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 19:46:53 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6ab6b36d-e002-0a2a0a5209dd-0a2a45029038-48
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 19:46:53 +0200
Received: from [52.101.69.81]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6ab6b38c-6ca4-0a2a45020019-3465455165bc-3
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 19:46:52 +0200
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com (2603:10a6:803:113::29)
 by DB9PR03MB7786.eurprd03.prod.outlook.com (2603:10a6:10:2cf::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 17:46:51 +0000
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48]) by VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48%3]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 17:46:51 +0000
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
 b=XBRzGzV/3lqJOyqnHWsGauApe+mlcgpXQIlkT4zJILRjavBJylB8sCOM5UJKU+2rkulhlY1HV8S2EWxXzuYnF2ZR/5rat3+GUBB/7cqlpV2V2XTJ9QiP/ty5huSVs+Q5n+iFQRzGMXyzKMMDw2HtLouxLHpiB6Y0c7N5eTgBeCIqOPyyPKEkmyBhqVP2ZbWgOWh6ZPODs2PEZdHlJOu/mKJCVQ4agw17XKlBGUw6lcA0CljOf6X+jNA5Wjc65VfgdbfsbORqjuxtGkLQVSfbPEK9SUuDaKnHjNFqr74rg9cB/+mmGUGAcuIC4cBjhatdtCpGk/CZngDWGohq+sB6jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7iA1Ot+qwqpFwSGWN1pgI54yr7DMYK7p9RL28pq1J4Y=;
 b=E4JyECx8TbiVMrBANJ37uk6yy7kbIl/OXfmcP3QSTNntu8/yvpmHRhnFAbGXwu7zpdV3mt2kev47hQMoNXWLd1ErPMpVbcCLCciLvbg4EYo3AFc1JHOgg9NX0YRSvp7tyt3in0+b/73hLJuL1Qvqqx+1HveaKrEInXbAH8IS3rCP+Qguq+xMJ7lzd+IVdBlTM3jRT7P1bH22reoG3KhNBUS8aYnbk6ljkwipBzfrPUtjSnHji/tJ0dTU3dYSbDggfTnd1aQMzdQDnvRhetMcfju5AuAahCLr0MrsKTI1owCL+fjORq+3l3JCfSlAZh92qzBkANPIlXA+ZD2wIV7g8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7iA1Ot+qwqpFwSGWN1pgI54yr7DMYK7p9RL28pq1J4Y=;
 b=kxSIpai5s0v5Go7svJGDwueapE1fRg+CZmnwffUBriHFtWrROXYdjnhTGoi4MWHGT0K6h5FdkJXhSeiCyXzk+yty45V9Hl+E8QXk44nfRkVe4Fu2bEQiljfi5MMeeiw6dbYZJW8BL+DiZ8jr3WROuvAxFYCzKdZYmazlEnmG0Wt4RMC9I0vAUyCg4xmoXnL5XlcKazFT3E8yc5tKvAvgDXrDLVMroh6VFSQ8lyknwqDMAffr4sstOgp0trTAp/vxpig/ELqZefYUg6EkiP9oTB+6oyvyREjQfEIS7Rs2v/qnzzGwYd+iRAYY/MwBmOAib4KvWVMU9qO7aqT9v1pnHw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: Mykola Kvach <Mykola_Kvach@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v3 4/4] xen/arm: its: handle dma-noncoherent on GIC and
 ITS nodes
Thread-Topic: [PATCH v3 4/4] xen/arm: its: handle dma-noncoherent on GIC and
 ITS nodes
Thread-Index: AQHdSqtNhuAYUgdtlEG2grNEEh5N0w==
Date: Fri, 25 Sep 2026 17:46:51 +0000
Message-ID: <878q4pz0j9.fsf@epam.com>
References: <cover.1790089161.git.mykola_kvach@epam.com>
	<cefba96267535739ecb851e6080da51a3d745e3f.1790089161.git.mykola_kvach@epam.com>
	<874ifg4xoq.fsf@epam.com>
	<CAGeoDV8dv9c2mz7zLKc_e4NveXW9t2sKhUqrp_wtL+pvhFcEdA@mail.gmail.com>
In-Reply-To:
 <CAGeoDV8dv9c2mz7zLKc_e4NveXW9t2sKhUqrp_wtL+pvhFcEdA@mail.gmail.com>	(Mykola
 Kvach's message of "Thu, 24 Sep 2026 09:48:42 +0300")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: mu4e 1.14.3; emacs 30.2
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VE1PR03MB6078:EE_|DB9PR03MB7786:EE_
x-ms-office365-filtering-correlation-id: cf34264a-866b-4646-52e0-08df1b2cfae3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|23010399003|1800799024|366016|376014|38070700021|4143699003|6133799003|10067099003|11063799006|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info:
 l1YK2NxJMrtywExe93RCwYStv4IXSZMSedHHOQYKRFIJFSdql5kTU9ZK099UKtoKptp58/WuhjK09m8bNGTJqVBkduaKbONuddXtryv+Apsxd2pv2ZSAkM2MbtrFSWNZJVo3HHBwSJZLVz+kkJEAMU33ckCW1W0rcuqkA8jdEtaWDnbKujT/nknKbk3j1by56sG0pZuGzIB2AVe4YnmAE4XLv+s8z5SyT5NXYO4ipixoN3b6bkW+5HjVbEIP3MKpsP7xGsRXBwflrNFSUvNbIYAiCKrzWI7FQNltdzk3ZmYYoHP8bWFkm/ar9z+h9Z4X84S5QUqQvbK/uVnc2CALsRklLViNRCvXmR3LR1IkPa5EPmR+IHq/92owjJEaYUuE7P2ypWtz8Sk4QghaMxrXjf8iz1J28iS56IFa2dymUop1j+MMzFrB+7nHLE+4O/LkGpoUzGPogqOz1VsO1swNG4NQH90pgNbmvveA3uu+3Wv5YnuBGCMTos5gEo5sQvWSY7az6a454fOk8FQubHfKM6GxNzNk/iGAEi8Pv8Y6eJCdtk5lghChnbLv2pQ2NgPRYzzDxdKEUuegBVl8yeIs932adpQfa5rCRTLiT91K09v4YcU1GMseGr993OVKuori6Z5NSwQXhFIMsL7nZ67AG88WnS3kNL0fcshfzh1HmG9fUkdTKokQGaIvxZ4xURYXP+RrrPg+QDQylJos/pL2zmN4TvFvQvhfKLIqH5cmYhQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR03MB6078.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(23010399003)(1800799024)(366016)(376014)(38070700021)(4143699003)(6133799003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eWkvT0lIamk1LzFJdlhBREZyZHl3MVZzRHhWV3ZKVkNYVWtRSlZVSVcvT0Jj?=
 =?utf-8?B?dkY2K29FYkp1SXJWdVhwVkVydVE2Mm4weHJ2Q2FVTExkaU5qMlFObmNKUjJz?=
 =?utf-8?B?ZjVQbVV4S0w3eUFLTGs5TWRiUWFCK0tzK29XMVBoc2gzWDZEeWs2a2ZIUkVo?=
 =?utf-8?B?L3FnWDJadGZoTzdMTGNQTklKMUFGcjBBSWJxeGM2b3Uxa3JjZWFwd05ya0tL?=
 =?utf-8?B?aktMVWxoSnZybVcydU5Qd2tITWxnVEw4ODA0N1lsamRVczhVVytXb1RhOUp0?=
 =?utf-8?B?QktYU0VLZWthMEhwK3FVSFU5em52L3h6ck4xSHZlb1ZtbFk2YStTclhLM2l5?=
 =?utf-8?B?dmhYcHh3eDJQellMM0xSMTRBYmFnSGlGeWpTb1hLc2s0WjkxbDlwTkd1VkVP?=
 =?utf-8?B?UmZjbkhXVnI2K2hOdVFzNjlQY25rbDlsT3UwVmVEVFpHcDdiOHIweWJLUlhv?=
 =?utf-8?B?MVdvZ2dpcmR6dUg2dEcwR0pJZWlsbGlCZHJWaEt1ejREU09MU2ttZGdxZkRH?=
 =?utf-8?B?M2JVdU4yeVEweVVkTGMrb3BSYmdnRk90cjZMWk8yeEU0aVcxeWdNNS9uejI3?=
 =?utf-8?B?blp3NGcvRTRVVEh0MGd0NGRqNG9wNUpsb0haSzV5NHo3N2xvMEg3SlV3dFNN?=
 =?utf-8?B?c29hcHJ6WXRlRUNwM3lJL2p3ZmR1amozdU9LTW1nQU40RjRFZS9Qb0M4K3lO?=
 =?utf-8?B?c0NHTWQxRTA5dFRESUZyaGZxalB0ZGxqY09RRjFZck8zZ2xTNzdvd2tQMUpl?=
 =?utf-8?B?c0crVXpnVlZkVjZOc1lJWmp2ZWdPM2ZsbVhNS1JiTEsxYU82WG9LbmJTbUlY?=
 =?utf-8?B?blV3UjNhWldtTy90bXVmQ0JkMStYaExxaTRKeUt5MUV0UExFOGJEbVVUOTZW?=
 =?utf-8?B?OGZTcyt4c3VsZEN1WmsrRmtuL3VoY2Z5b1YzZU1qb2F5aGFHeDRkMldFeFVT?=
 =?utf-8?B?TE83QW9YWVBrWTNzNlRxdXkreEVvTlk2RWlveUNlWnJ2Slp3cWZDQ0ZXMGZO?=
 =?utf-8?B?Q0k4RTZ4UjFmeFRXWXZIQmtFckJ2L1YrVFh6UnFrMHd0b2hCNGhpYStGRWh3?=
 =?utf-8?B?d1dpWkdDb2tWQ0NRK3R2L242YmdLNC9CdUg2aURYUmljK0IvbHVSWDB5QVQ5?=
 =?utf-8?B?N2o0Tk5rYmxtWkxxQ3d5dGZXVytVeFQ5bkNTM1dacnhkWWRSMWNiNXZMTmd6?=
 =?utf-8?B?TGU5VStBZmVVRW9wMmh0YVNHOWE1THdjOUVoMnBNdDN6dHNuM3BKTVdDNi92?=
 =?utf-8?B?NWM3Ri9BQ0JaVkljTmxqR2xmUVptOG9rYzFmWURVQ1VnWWVYK3FodGtRUWcx?=
 =?utf-8?B?SjZpeDdVQkxuWVlkY1ZtQWllbUlFYVQ3T1M0VFo1aW1wOFdvejlKY1J6Y1M2?=
 =?utf-8?B?UGRHQzhuOCtsSnFGREoyeXNjUzJodEZyOHQ4SWp4OUdhS2s3dEQvbmxOVVlj?=
 =?utf-8?B?Qm83N0dxSkRrdHBiWXVWOVhEQ09YeEhmb3k2OGQ4eEMycS9IK2YyTHVaUVc0?=
 =?utf-8?B?bUJXdWhKNEF2N3FaeG1FenRzMkxvMWFScmNoVFZyVUVML2wzUGk3d0RGMGIr?=
 =?utf-8?B?RjNaZ2VmR1pzSzVEUS9yZG54ZmxuNGJWaXU5bVlPaytxVm1zVEFDNmppU1cz?=
 =?utf-8?B?U0NaUlpVWWhGeVpYTSs2K0hYcGI4SnV5eUZxcGkxSGFFSDJmMkIzNklLQmVS?=
 =?utf-8?B?WHVzSzA1Y2EwMGY4L1lXN1hEankwRU55NXJ1UDgra1BibmR4UkNOMnIyT1NF?=
 =?utf-8?B?aW9TR3pjbmpFOExhVld2NkJTVDJoYlBXeFpnclJCMzZyWFg4Tnp3ZzVKY29z?=
 =?utf-8?B?dXhReDZ1NisxdWl1RlZRM2N0QTJCaUlCVVdPZW5vOTlRUjh4b1JESk1QL05M?=
 =?utf-8?B?eE8ya2FpdG41M05KeFdxZDJvS1lPcmVXL294S01MNDBvUVpJTGR6L0ZTWHRS?=
 =?utf-8?B?dUxZbm93VmFvZGNWdnhCblBIekdSRElxR09OMnRXRWdMQ0YxcWFyN0VESTMx?=
 =?utf-8?B?bndRSVNmZmU0Znl4Vm9PM3FTQUMyUExXYVd3UDA0Sy9IdllQQ2dpcXBHakc4?=
 =?utf-8?B?S2dNcG16eXNJUFVEWWpDblFNazUwRndaZ1lJb0R2UW5kK1RHbXZWYlJhc3Zi?=
 =?utf-8?B?WDk5Q0ZiOFJKOU9adHpDd0V5NVN4QWZuY25wQUc3SVNlR0o1UGdhQ0p4d3k3?=
 =?utf-8?B?SG9FT0FpK2dmU2UzeEp5L2U2US9mc0hPYmwzRFJmdXYwRW5BRlJHbGRTN25h?=
 =?utf-8?B?ZTA5RDdtcDVIcE9EanNxQ1N0YlBLcGY0QnRrT2hPTEtFSzVpdkY3MFIrd3Zk?=
 =?utf-8?B?Q0xpSXpaQXhudXQ3MkZzTEZKOFRzS1liZER5a3dsdHlVMU9WNFRXd0I5QXdx?=
 =?utf-8?Q?EzRFgzJjQMw5yrPM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7B5CB31D305CFC4984C51CDA8CBFAD4B@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6078.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf34264a-866b-4646-52e0-08df1b2cfae3
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2026 17:46:51.0987
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dVBUd/uKkSiNwkdnSSsbroJtc3JWlVJkXiK3s+GcXNe/+iQHOY4WxqPvW77RMi8vVyTqTCMr2ealDdKOvAS8nJMmrbNt5aMUIlaNumvyJuQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7786
X-purgate-ID: tlsNG-720697/1790358413-F3CBA2AC-C910DC72/0/0
X-purgate-type: clean
X-purgate-size: 7346

SGkNCg0KTXlrb2xhIEt2YWNoIDx4YWtlcC5hbWF0b3BAZ21haWwuY29tPiB3cml0ZXM6DQoNCj4g
T24gV2VkLCBTZXAgMjMsIDIwMjYgYXQgMzozMOKAr0FNIFZvbG9keW15ciBCYWJjaHVrDQo+IDxW
b2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT4gd3JvdGU6DQo+Pg0KPj4gSGksDQo+Pg0KPj4gTXlr
b2xhIEt2YWNoIDxteWtvbGFfa3ZhY2hAZXBhbS5jb20+IHdyaXRlczoNCj4+DQo+PiA+IFRoZSBE
VCBkbWEtbm9uY29oZXJlbnQgcHJvcGVydHkgZGVzY3JpYmVzIHRoZSBidXMgY29oZXJlbmN5IG9m
IHRoZQ0KPj4gPiBkZXZpY2UgcmVwcmVzZW50ZWQgYnkgdGhlIG5vZGUuIE9uIGFuIElUUyBzdWJu
b2RlLCB0aGF0IGlzIG1lbW9yeQ0KPj4gPiBhY2Nlc3NlZCBieSB0aGF0IElUUy4gQWRkIEdJQ1Yz
X1FVSVJLX01FTV9OQ19OUyB0byB0aGUgY29ycmVzcG9uZGluZw0KPj4gPiBob3N0X2l0cyBhbmQg
dXNlIGl0IHdoZW4gcHJvZ3JhbW1pbmcgR0lUU19DQkFTRVIgYW5kIEdJVFNfQkFTRVI8bj4uDQo+
PiA+DQo+PiA+IE9uIHRoZSB0b3AtbGV2ZWwgR0lDIG5vZGUsIHRoZSBwcm9wZXJ0eSBkZXNjcmli
ZXMgdGhlIFJlZGlzdHJpYnV0b3Igc2lkZQ0KPj4gPiBvZiB0aGUgTFBJIHBhdGguIENvbGxlY3Qg
aXQgaW4gZ2ljdjNfbHBpX2luaXRfaG9zdF9scGlzKCkgYW5kIGFwcGx5IGl0DQo+PiA+IG9ubHkg
dG8gdGhlIGhvc3QgTFBJIHBvbGljeSB1c2VkIHdoZW4gYWxsb2NhdGluZyB0aGUgcHJvcGVydHkg
YW5kDQo+PiA+IHBlbmRpbmcgdGFibGVzIGFuZCB3aGVuIHByb2dyYW1taW5nIEdJQ1JfUFJPUEJB
U0VSIGFuZCBHSUNSX1BFTkRCQVNFUi4NCj4+ID4gTWFyayB0aGUgZnVuY3Rpb24gaW5pdC1vbmx5
IGJlY2F1c2UgZmlybXdhcmUgYXR0cmlidXRlcyBhcmUgY29sbGVjdGVkDQo+PiA+IG9ubHkgZHVy
aW5nIGJvb3QuDQo+PiA+DQo+PiA+IERvIG5vdCBpbmhlcml0IHRoZSBwcm9wZXJ0eSBiZXR3ZWVu
IHBhcmVudCBhbmQgY2hpbGQgbm9kZXM6IElUUy1ub2RlDQo+PiA+IG5vbi1jb2hlcmVuY3kgZG9l
cyBub3QgY2hhbmdlIHRoZSBnbG9iYWwgaG9zdCBMUEkgcG9saWN5LCBhbmQgR0lDLW5vZGUNCj4+
ID4gbm9uLWNvaGVyZW5jeSBkb2VzIG5vdCBjaGFuZ2UgcGVyLUlUUyBxdWlya19mbGFncy4NCj4+
ID4NCj4+ID4gQUNQSSBpcyB1bmNoYW5nZWQ7IHRoaXMgcGF0Y2ggb25seSBjb25zdW1lcyB0aGUg
RFQgZG1hLW5vbmNvaGVyZW50DQo+PiA+IHByb3BlcnR5Lg0KPj4gPg0KPj4gPiBTaWduZWQtb2Zm
LWJ5OiBNeWtvbGEgS3ZhY2ggPG15a29sYV9rdmFjaEBlcGFtLmNvbT4NCg0KUmV2aWV3ZWQtYnk6
IFZvbG9keW15ciBCYWJjaHVrIDx2b2xvZHlteXJfYmFiY2h1a0BlcGFtLmNvbT4NCg0KPj4gPiAt
LS0NCj4+ID4gQ2hhbmdlcyBpbiB2MzoNCj4+ID4gLSBLZWVwIHRoZSBJVFMgaW5pdCBhbm5vdGF0
aW9ucyB3aXRoIHRoZSBlYXJsaWVyIGluaXRpYWxpemF0aW9uIHBhdGNoLg0KPj4gPiAtIERyb3Ag
dGhlIHJlZHVuZGFudCBhZ2dyZWdhdGUgaG9zdC1MUEktZmxhZ3MgbWVzc2FnZS4NCj4+ID4NCj4+
ID4gQ2hhbmdlcyBpbiB2MjoNCj4+ID4gLSBTcGxpdCB2MSdzIGRtYS1ub25jb2hlcmVudCBoYW5k
bGluZyBpbnRvIGV4cGxpY2l0IElUUy1ub2RlIGFuZCBHSUMtbm9kZQ0KPj4gPiAgIHNjb3Blcy4N
Cj4+ID4gLSBBcHBseSBhbiBJVFMgc3Vibm9kZSBwcm9wZXJ0eSBvbmx5IHRvIHRoZSBtYXRjaGlu
ZyBob3N0X2l0cw0KPj4gPiAgIHF1aXJrX2ZsYWdzLg0KPj4gPiAtIENvbGxlY3QgdGhlIHRvcC1s
ZXZlbCBHSUMgcHJvcGVydHkgZnJvbSBnaWMtdjMtbHBpLmMgYmVmb3JlIGhvc3QgTFBJDQo+PiA+
ICAgYWxsb2NhdGlvbnMgdXNlIGhvc3RfbHBpX2ZsYWdzLg0KPj4gPiAtLS0NCj4+ID4gIHhlbi9h
cmNoL2FybS9naWMtdjMtaXRzLmMgfCAxNyArKysrKysrKysrKysrKysrKw0KPj4gPiAgeGVuL2Fy
Y2gvYXJtL2dpYy12My1scGkuYyB8IDIwICsrKysrKysrKysrKysrKysrKystDQo+PiA+ICAyIGZp
bGVzIGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4+ID4NCj4+ID4g
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9naWMtdjMtaXRzLmMgYi94ZW4vYXJjaC9hcm0vZ2lj
LXYzLWl0cy5jDQo+PiA+IGluZGV4IGY1MjIzMmNhNDAuLjY3MzRmOTRlN2MgMTAwNjQ0DQo+PiA+
IC0tLSBhL3hlbi9hcmNoL2FybS9naWMtdjMtaXRzLmMNCj4+ID4gKysrIGIveGVuL2FyY2gvYXJt
L2dpYy12My1pdHMuYw0KPj4gPiBAQCAtMTM5LDYgKzEzOSwyMSBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGl0c19xdWlyayAqX19pbml0IGdpY3YzX2l0c19maW5kX3F1aXJrKA0KPj4gPiAgICAgIHJl
dHVybiBOVUxMOw0KPj4gPiAgfQ0KPj4gPg0KPj4gPiArc3RhdGljIHZvaWQgX19pbml0IGdpY3Yz
X2l0c19jb2xsZWN0X2Z3X2F0dHJzKHN0cnVjdCBob3N0X2l0cyAqaHdfaXRzKQ0KPj4gPiArew0K
Pj4gPiArICAgIC8qDQo+PiA+ICsgICAgICogQW4gSVRTIHN1Ym5vZGUgcHJvcGVydHkgZGVzY3Jp
YmVzIG1lbW9yeSB0cmFuc2FjdGlvbnMgbWFkZSBieSB0aGF0IElUUy4NCj4+ID4gKyAgICAgKiBE
byBub3QgaW5oZXJpdCBpdCBpbnRvIHRoZSBnbG9iYWwgaG9zdCBMUEkvUmVkaXN0cmlidXRvciBw
b2xpY3kuDQo+PiA+ICsgICAgICovDQo+PiA+ICsgICAgaWYgKCAhaHdfaXRzLT5kdF9ub2RlIHx8
DQo+PiA+ICsgICAgICAgICAhZHRfcHJvcGVydHlfcmVhZF9ib29sKGh3X2l0cy0+ZHRfbm9kZSwg
ImRtYS1ub25jb2hlcmVudCIpICkNCj4+ID4gKyAgICAgICAgcmV0dXJuOw0KPj4gPiArDQo+PiA+
ICsgICAgaHdfaXRzLT5xdWlya19mbGFncyB8PSBHSUNWM19RVUlSS19NRU1fTkNfTlM7DQo+PiA+
ICsgICAgcHJpbnRrKCJHSUN2MzogSVRTIEAlIyJQUklwYWRkciIgbWFya2VkIGRtYS1ub25jb2hl
cmVudFxuIiwNCj4+ID4gKyAgICAgICAgICAgaHdfaXRzLT5hZGRyKTsNCj4+ID4gK30NCj4+ID4g
Kw0KPj4gPiAgc3RhdGljIHZvaWQgX19pbml0IGdpY3YzX2l0c19jb2xsZWN0X3F1aXJrcyhzdHJ1
Y3QgaG9zdF9pdHMgKmh3X2l0cykNCj4+ID4gIHsNCj4+ID4gICAgICBjb25zdCBzdHJ1Y3QgaXRz
X3F1aXJrICpxdWlyayA9IGdpY3YzX2l0c19maW5kX3F1aXJrKGh3X2l0cyk7DQo+PiA+IEBAIC0x
NDksNiArMTY0LDggQEAgc3RhdGljIHZvaWQgX19pbml0IGdpY3YzX2l0c19jb2xsZWN0X3F1aXJr
cyhzdHJ1Y3QgaG9zdF9pdHMgKmh3X2l0cykNCj4+ID4gICAgICAgICAgZ2ljdjNfbHBpX3VwZGF0
ZV9ob3N0X2ZsYWdzKHF1aXJrLT5scGlfZmxhZ3MpOw0KPj4gPiAgICAgICAgICBwcmludGsoIkdJ
Q3YzOiBlbmFibGluZyB3b3JrYXJvdW5kIGZvciBJVFM6ICVzXG4iLCBxdWlyay0+ZGVzYyk7DQo+
PiA+ICAgICAgfQ0KPj4gPiArDQo+PiA+ICsgICAgZ2ljdjNfaXRzX2NvbGxlY3RfZndfYXR0cnMo
aHdfaXRzKTsNCj4+ID4gIH0NCj4+ID4NCj4+ID4gIHVpbnQ2NF90IGdpY3YzX21lbV9nZXRfY2Fj
aGVhYmlsaXR5KHVpbnQzMl90IGZsYWdzKQ0KPj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJt
L2dpYy12My1scGkuYyBiL3hlbi9hcmNoL2FybS9naWMtdjMtbHBpLmMNCj4+ID4gaW5kZXggYWNj
ZmQ0OGE3NC4uMWNmNDk0MzBlYSAxMDA2NDQNCj4+ID4gLS0tIGEveGVuL2FyY2gvYXJtL2dpYy12
My1scGkuYw0KPj4gPiArKysgYi94ZW4vYXJjaC9hcm0vZ2ljLXYzLWxwaS5jDQo+PiA+IEBAIC03
LDcgKzcsOSBAQA0KPj4gPiAgICogQ29weXJpZ2h0IChDKSAyMDE2LDIwMTcgLSBBUk0gTHRkDQo+
PiA+ICAgKi8NCj4+ID4NCj4+ID4gKyNpbmNsdWRlIDx4ZW4vYWNwaS5oPg0KPj4gPiAgI2luY2x1
ZGUgPHhlbi9jcHUuaD4NCj4+ID4gKyNpbmNsdWRlIDx4ZW4vZGV2aWNlX3RyZWUuaD4NCj4+ID4g
ICNpbmNsdWRlIDx4ZW4vaW5pdC5oPg0KPj4gPiAgI2luY2x1ZGUgPHhlbi9saWIuaD4NCj4+ID4g
ICNpbmNsdWRlIDx4ZW4vbW0uaD4NCj4+ID4gQEAgLTEwMiw2ICsxMDQsMjAgQEAgdm9pZCBfX2lu
aXQgZ2ljdjNfbHBpX3VwZGF0ZV9ob3N0X2ZsYWdzKHVpbnQzMl90IGZsYWdzKQ0KPj4gPiAgICAg
IGhvc3RfbHBpX2ZsYWdzIHw9IGZsYWdzOw0KPj4gPiAgfQ0KPj4gPg0KPj4gPiArc3RhdGljIHZv
aWQgX19pbml0IGdpY3YzX2xwaV9jb2xsZWN0X2Z3X2F0dHJzKHZvaWQpDQo+PiA+ICt7DQo+PiA+
ICsgICAgLyoNCj4+ID4gKyAgICAgKiBBIHRvcC1sZXZlbCBHSUMgbm9kZSBwcm9wZXJ0eSBkZXNj
cmliZXMgdGhlIFJlZGlzdHJpYnV0b3Igc2lkZSBvZiB0aGUNCj4+ID4gKyAgICAgKiBMUEkgcGF0
aC4gRG8gbm90IGluaGVyaXQgaXQgaW50byBwZXItSVRTIHBvbGljeS4NCj4+ID4gKyAgICAgKi8N
Cj4+ID4gKyAgICBpZiAoICFhY3BpX2Rpc2FibGVkIHx8DQo+PiA+ICsgICAgICAgICAhZHRfcHJv
cGVydHlfcmVhZF9ib29sKGR0X2ludGVycnVwdF9jb250cm9sbGVyLCAiZG1hLW5vbmNvaGVyZW50
IikgKQ0KPj4gPiArICAgICAgICByZXR1cm47DQo+PiA+ICsNCj4+ID4gKyAgICBnaWN2M19scGlf
dXBkYXRlX2hvc3RfZmxhZ3MoR0lDVjNfUVVJUktfTUVNX05DX05TKTsNCj4+ID4gKyAgICBwcmlu
dGsoIkdJQ3YzOiBSZWRpc3RyaWJ1dG9ycyBtYXJrZWQgZG1hLW5vbmNvaGVyZW50XG4iKTsNCj4+
ID4gK30NCj4+ID4gKw0KPj4gPiAgc3RhdGljIHVuaW9uIGhvc3RfbHBpICpnaWNfZ2V0X2hvc3Rf
bHBpKHVpbnQzMl90IHBscGkpDQo+PiA+ICB7DQo+PiA+ICAgICAgdW5pb24gaG9zdF9scGkgKmJs
b2NrOw0KPj4gPiBAQCAtNDQzLDcgKzQ1OSw3IEBAIGludGVnZXJfcGFyYW0oIm1heF9scGlfYml0
cyIsIG1heF9scGlfYml0cyk7DQo+PiA+ICAgKiB0byB0aGUgcGFnZSB3aXRoIHRoZSBhY3R1YWwg
InVuaW9uIGhvc3RfbHBpIiBlbnRyaWVzLiBPdXIgTFBJIGxpbWl0DQo+PiA+ICAgKiBhdm9pZHMg
ZXhjZXNzaXZlIG1lbW9yeSB1c2FnZS4NCj4+ID4gICAqLw0KPj4gPiAtaW50IGdpY3YzX2xwaV9p
bml0X2hvc3RfbHBpcyh1bnNpZ25lZCBpbnQgaG9zdF9scGlfYml0cykNCj4+ID4gK2ludCBfX2lu
aXQgZ2ljdjNfbHBpX2luaXRfaG9zdF9scGlzKHVuc2lnbmVkIGludCBob3N0X2xwaV9iaXRzKQ0K
Pj4NCj4+IFNwdXJpb3VzIGNoYW5nZT8NCj4NCj4gVGhpcyBpcyBpbnRlbnRpb25hbC4gVGhpcyBw
YXRjaCBhZGRzIGEgY2FsbCB0byB0aGUgX19pbml0IGhlbHBlcg0KPiBnaWN2M19scGlfY29sbGVj
dF9md19hdHRycygpLiBnaWN2M19scGlfaW5pdF9ob3N0X2xwaXMoKSBpcyBvbmx5DQo+IGNhbGxl
ZCBkdXJpbmcgYm9vdCwgZnJvbSBnaWN2M19pdHNfaW5pdCgpLCBzbyBJIG1hcmtlZCBpdCBfX2lu
aXQNCj4gYXMgd2VsbC4NCg0KTWFrZXMgc2Vuc2UsIHRoYW5rIHlvdS4NCg0KLS0gDQpXQlIsIFZv
bG9keW15cg==

