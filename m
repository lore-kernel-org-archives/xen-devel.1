Return-Path: <SRS0=0dJu=SH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09CB8C10F0F
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 14:29:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCD7420989
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 14:29:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="McCoU0dr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCD7420989
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amd.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hCPpY-0007iI-FW; Fri, 05 Apr 2019 14:28:32 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sxIo=SH=amd.com=brian.woods@srs-us1.protection.inumbo.net>)
 id 1hCPpW-0007i7-Ux
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2019 14:28:31 +0000
X-Inumbo-ID: 1540a089-57af-11e9-92d7-bc764e045a96
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe4d::624])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1540a089-57af-11e9-92d7-bc764e045a96;
 Fri, 05 Apr 2019 14:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ul73lQKFp40iUCgtMlOBbfcHoNVdUAS/nSFAcyt/olo=;
 b=McCoU0draW4C7R47wE5wIeI8eghDeXSFcnPt12Oa9E35UdosLqGdEQBQ2mXIkCSdiwyimKeVLAOhCq65Jl38xSRuYhWzb05qFB+brzapPOuNNcbvz4Pt6+bPZ2BVGK9oar9EgZCxR+hlo3EFDpx7Z++lguZEm3LfGZzSyeS+1oM=
Received: from MWHPR12MB1597.namprd12.prod.outlook.com (10.172.56.10) by
 MWHPR12MB1440.namprd12.prod.outlook.com (10.169.206.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1771.16; Fri, 5 Apr 2019 14:28:25 +0000
Received: from MWHPR12MB1597.namprd12.prod.outlook.com
 ([fe80::4534:1959:55cb:fad4]) by MWHPR12MB1597.namprd12.prod.outlook.com
 ([fe80::4534:1959:55cb:fad4%6]) with mapi id 15.20.1750.017; Fri, 5 Apr 2019
 14:28:25 +0000
From: "Woods, Brian" <Brian.Woods@amd.com>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH 3/7] x86/ACPI: also parse AMD IOMMU tables
 early
Thread-Index: AQHU5XWrbgdXmsh3oUC6i2w7wf8TMaYtrLkA
Date: Fri, 5 Apr 2019 14:28:25 +0000
Message-ID: <4968ff55-e397-2af9-8aa3-bc32982a5db9@amd.com>
References: <5C9CDDAF020000780022282A@prv1-mh.provo.novell.com>
 <5C9CDF140200007800222844@prv1-mh.provo.novell.com>
In-Reply-To: <5C9CDF140200007800222844@prv1-mh.provo.novell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SN6PR1501CA0023.namprd15.prod.outlook.com
 (2603:10b6:805::36) To MWHPR12MB1597.namprd12.prod.outlook.com
 (2603:10b6:301:10::10)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Woods@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.77.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 93146f6b-8215-4d86-6131-08d6b9d2f68d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1440; 
x-ms-traffictypediagnostic: MWHPR12MB1440:
x-microsoft-antispam-prvs: <MWHPR12MB14407CF3BCB2165F46FE77A7E5510@MWHPR12MB1440.namprd12.prod.outlook.com>
x-forefront-prvs: 0998671D02
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(136003)(376002)(346002)(39860400002)(396003)(189003)(199004)(106356001)(66066001)(3846002)(105586002)(6116002)(229853002)(68736007)(6486002)(25786009)(6436002)(8936002)(81166006)(8676002)(81156014)(256004)(14444005)(14454004)(2906002)(97736004)(4326008)(478600001)(72206003)(52116002)(54906003)(316002)(110136005)(99286004)(36756003)(31686004)(5660300002)(558084003)(71190400001)(71200400001)(26005)(186003)(6246003)(86362001)(2616005)(11346002)(476003)(446003)(53936002)(76176011)(53546011)(6512007)(6506007)(386003)(102836004)(7736002)(31696002)(305945005)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1440;
 H:MWHPR12MB1597.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: zAljsydQOZSkrQD/PoR46CGMo2jXZW3t8TzMBhO8wbHqKrXwr2pPBkBN3qOsQJ8iBzVuLzDHLfjjSR5uWBlLpeSGkeAP7F/FpOSRUqK6jPLLFr/hZP2Xs0kUQaGSX7amRdZj7fO7HHwJk8sEO1cfysjaE9/+5ass+elrDxxrYMMz3OLkXq2ockmD5q/UJyY7L0TwQtyr16k7qZLlKfJqxha/wY0FZbgnaZYmaN9YmsoCVDndQI8Ve3sYNwei7UxlX9XuDcPosERXNLdQTEybPI4rC4Sgm4dt9Y7Wwkn33q4jVFSa4p7s8y4r+gCi5T11hJ5dQAnzgqyKXUg/TQ/ZjfIvZu9szy5B48qj+MzW68nYyjoE19FSVqNkUtCTe4qFQgTfxRyKgoUC159WO3DZdLE1RGNaKzUMyC5WzlrRrtw=
Content-ID: <9B83ADEADFF55447A456662E66FDDC59@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93146f6b-8215-4d86-6131-08d6b9d2f68d
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2019 14:28:25.4879 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1440
Subject: Re: [Xen-devel] [PATCH 3/7] x86/ACPI: also parse AMD IOMMU tables
 early
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 "Suthikulpanit, Suravee" <Suravee.Suthikulpanit@amd.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190405142825.1DK5ujee2jZLdhyvG4ilDxezt3ZDBYuk6jW6K7fQk6U@z>

T24gMy8yOC8xOSA5OjQ5IEFNLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gSW4gb3JkZXIgdG8gYmUg
YWJsZSB0byBpbml0aWFsaXplIHgyQVBJQyBtb2RlIHdlIG5lZWQgdG8gcGFyc2UNCj4gcmVzcGVj
dGl2ZSBBQ1BJIHRhYmxlcyBlYXJseS4gU3BsaXQgYW1kX2lvdl9kZXRlY3QoKSBpbnRvIHR3byBw
YXJ0cyBmb3INCj4gdGhpcyBwdXJwb3NlLCBhbmQgY2FsbCB0aGUgaW5pdGlhbCBwYXJ0IGVhcmxp
ZXIgb24uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+DQo+IA0KQWNrZWQtYnk6IEJyaWFuIFdvb2RzIDxicmlhbi53b29kc0BhbWQuY29tPg0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
