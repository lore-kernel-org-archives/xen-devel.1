Return-Path: <SRS0=0dJu=SH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A94B1C4360F
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 14:31:49 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 755C7206DD
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 14:31:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="Mvp5lJrw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 755C7206DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amd.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hCPrs-0008VT-9M; Fri, 05 Apr 2019 14:30:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sxIo=SH=amd.com=brian.woods@srs-us1.protection.inumbo.net>)
 id 1hCPrr-0008VN-I3
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2019 14:30:55 +0000
X-Inumbo-ID: 6b3e0703-57af-11e9-92d7-bc764e045a96
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (unknown
 [40.107.77.42]) by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6b3e0703-57af-11e9-92d7-bc764e045a96;
 Fri, 05 Apr 2019 14:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7WF8DMUWerzVr7bppbJfSFSxWTynLF7GNVRE8y8LPK0=;
 b=Mvp5lJrwGghbRsUbOS/ycHgy17BoLB+szDBes7HDrPiw+d2ObocQbC54VgpoFwThpVyeXc0Szc6h/PLS/5pviif0wsXO0g+5bVvFJuOM6UbFMo42kLqXvLFHOdtW6WwdYU5GA9J6FAaF51m5XIkDMnZeycJdr5YMC7xX7aRl/Xo=
Received: from MWHPR12MB1597.namprd12.prod.outlook.com (10.172.56.10) by
 MWHPR12MB1872.namprd12.prod.outlook.com (10.175.52.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1750.22; Fri, 5 Apr 2019 14:30:52 +0000
Received: from MWHPR12MB1597.namprd12.prod.outlook.com
 ([fe80::4534:1959:55cb:fad4]) by MWHPR12MB1597.namprd12.prod.outlook.com
 ([fe80::4534:1959:55cb:fad4%6]) with mapi id 15.20.1750.017; Fri, 5 Apr 2019
 14:30:52 +0000
From: "Woods, Brian" <Brian.Woods@amd.com>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 7/7] x86/IOMMU: initialize iommu_ops in
 vendor-independent code
Thread-Index: AQHU5XYsMR+38kXM7UeqaA33i8bEhqYtrWeA
Date: Fri, 5 Apr 2019 14:30:52 +0000
Message-ID: <9311df16-9ce1-387b-0c61-e31d9e4c0faf@amd.com>
References: <5C9CDDAF020000780022282A@prv1-mh.provo.novell.com>
 <5C9CE0270200007800222881@prv1-mh.provo.novell.com>
In-Reply-To: <5C9CE0270200007800222881@prv1-mh.provo.novell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SN4PR0701CA0010.namprd07.prod.outlook.com
 (2603:10b6:803:28::20) To MWHPR12MB1597.namprd12.prod.outlook.com
 (2603:10b6:301:10::10)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Woods@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.77.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 39154d8f-1d91-48e2-51b5-08d6b9d34e36
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1872; 
x-ms-traffictypediagnostic: MWHPR12MB1872:
x-microsoft-antispam-prvs: <MWHPR12MB1872910E651BE27E99ECE9B8E5510@MWHPR12MB1872.namprd12.prod.outlook.com>
x-forefront-prvs: 0998671D02
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(346002)(366004)(376002)(396003)(136003)(189003)(199004)(52116002)(256004)(36756003)(478600001)(5660300002)(386003)(81166006)(26005)(8936002)(71190400001)(81156014)(53546011)(71200400001)(53936002)(14454004)(76176011)(102836004)(54906003)(110136005)(6506007)(105586002)(99286004)(229853002)(72206003)(7736002)(66066001)(106356001)(305945005)(6486002)(6512007)(4326008)(97736004)(6116002)(31686004)(6246003)(25786009)(316002)(8676002)(3846002)(6436002)(446003)(11346002)(186003)(476003)(486006)(2906002)(2616005)(558084003)(31696002)(86362001)(68736007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1872;
 H:MWHPR12MB1597.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ypaX9DjmU+P+1Qd/DQAQGhudBKb9oEi48/KQh/qdOaT2/tBeQ7Ug+/815wm/fETRjPcDPqtei/Rk3mmwy0lEHvOVK/NNE6AnyHUtlO7oTt8YDUo1iSuyEaMKLcoAiIQOXygI1xrdH11S5t4JZGs9ItEgd8W+KANmKTQBfNk16BDg5F81SUs/dDirHKueqx1rFz3q54KzJ/cNVtPnVLHzXpGA+Mk+w6P7HjIKSheLJz3ki0yv0OoF2gpHqrBy0s02g4GtCUPLFfWulkdju61m9Hslq1J3o5E+YyLe3kvUVE4iHbHG4HlqZSafumNP1LcbVJv+k+g08EzqiWQO2OixUanZPi0xVOFq/rHGzAiLTrVN8CzJS7zNmqYEdK6mpNtKIAJyvd8GXQMvz8FpP3aZ1MO0XGo5CQSlvBt3qew168o=
Content-ID: <95EEFC832361204981AE4E53E1C19480@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39154d8f-1d91-48e2-51b5-08d6b9d34e36
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2019 14:30:52.4057 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1872
Subject: Re: [Xen-devel] [PATCH 7/7] x86/IOMMU: initialize iommu_ops in
 vendor-independent code
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 "Suthikulpanit, Suravee" <Suravee.Suthikulpanit@amd.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190405143052.2K3LEZJV1BAZowMkRg9n-_20q8-097wOQ04BKIzGrF4@z>

T24gMy8yOC8xOSA5OjU0IEFNLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gTW92ZSB0aGlzIGludG8g
aW9tbXVfaGFyZHdhcmVfc2V0dXAoKSBhbmQgbWFrZSB0aGF0IGZ1bmN0aW9uIG5vbi0NCj4gaW5s
aW5lLiBNb3ZlIGl0cyBkZWNsYXJhdGlvbiBpbnRvIGNvbW1vbiBjb2RlLg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiANCg0KQWNrZWQtYnk6
IEJyaWFuIFdvb2RzIDxicmlhbi53b29kc0BhbWQuY29tPg0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
