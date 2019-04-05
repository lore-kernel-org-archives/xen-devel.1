Return-Path: <SRS0=0dJu=SH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80579C4360F
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 14:30:06 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AA4A206DD
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 14:30:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="ysRaA39S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4AA4A206DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amd.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hCPqA-0007nI-R2; Fri, 05 Apr 2019 14:29:10 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sxIo=SH=amd.com=brian.woods@srs-us1.protection.inumbo.net>)
 id 1hCPqA-0007n7-4b
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2019 14:29:10 +0000
X-Inumbo-ID: 2c4925b1-57af-11e9-92d7-bc764e045a96
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (unknown
 [40.107.69.41]) by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2c4925b1-57af-11e9-92d7-bc764e045a96;
 Fri, 05 Apr 2019 14:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cfGA+gTzRV3K9rWxHCl00WDlpdQHJwcwEraDNV7nBAk=;
 b=ysRaA39Sd1QLMaNbMg/MUwPWCi/rJlNiuP6qcgc4NTleVqBDuONQCTG2WTsgAFtVdk4vBeeizhul6ak4h7ofZSHc+E4pa0rZep/gdsdmmB90cRHZGFEwg29QmYCH1wtf1nTjGV7wBKJqBG70Nk6h8gXqFdhb3QnRPXxfz27Zm/c=
Received: from MWHPR12MB1597.namprd12.prod.outlook.com (10.172.56.10) by
 MWHPR12MB1440.namprd12.prod.outlook.com (10.169.206.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1771.16; Fri, 5 Apr 2019 14:29:07 +0000
Received: from MWHPR12MB1597.namprd12.prod.outlook.com
 ([fe80::4534:1959:55cb:fad4]) by MWHPR12MB1597.namprd12.prod.outlook.com
 ([fe80::4534:1959:55cb:fad4%6]) with mapi id 15.20.1750.017; Fri, 5 Apr 2019
 14:29:07 +0000
From: "Woods, Brian" <Brian.Woods@amd.com>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 4/7] x86/IOMMU: introduce init-ops structure
Thread-Index: AQHU5XXAV49xuWvAMES6p+ilCJMn4KYtrOsA
Date: Fri, 5 Apr 2019 14:29:07 +0000
Message-ID: <8d14b19f-4abf-7b5b-2f6e-44b21d83f7de@amd.com>
References: <5C9CDDAF020000780022282A@prv1-mh.provo.novell.com>
 <5C9CDF770200007800222847@prv1-mh.provo.novell.com>
In-Reply-To: <5C9CDF770200007800222847@prv1-mh.provo.novell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SN6PR1501CA0007.namprd15.prod.outlook.com
 (2603:10b6:805::20) To MWHPR12MB1597.namprd12.prod.outlook.com
 (2603:10b6:301:10::10)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Woods@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.77.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f250d884-c7af-45c1-9697-08d6b9d30f71
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1440; 
x-ms-traffictypediagnostic: MWHPR12MB1440:
x-microsoft-antispam-prvs: <MWHPR12MB14407429491E8B1EC03200DCE5510@MWHPR12MB1440.namprd12.prod.outlook.com>
x-forefront-prvs: 0998671D02
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(136003)(376002)(346002)(39860400002)(396003)(189003)(199004)(106356001)(66066001)(3846002)(105586002)(6116002)(229853002)(68736007)(6486002)(25786009)(6436002)(8936002)(81166006)(8676002)(81156014)(256004)(14454004)(2906002)(97736004)(4326008)(478600001)(72206003)(52116002)(54906003)(316002)(110136005)(99286004)(36756003)(31686004)(5660300002)(558084003)(71190400001)(71200400001)(26005)(186003)(6246003)(86362001)(2616005)(11346002)(476003)(446003)(53936002)(76176011)(53546011)(6512007)(6506007)(386003)(102836004)(7736002)(31696002)(305945005)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1440;
 H:MWHPR12MB1597.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5l84nXz/rnf9OghSJel8nkpcAFzR5LTArJ8eVDv9LSmf9tAQFRHlO+g/bk1F5PubiQxdfyQ8TAjCplWq9HFPp4wfh7w5CtYykn8G6hMuMcPCVls/72BC/nO+vn2+190wLxaNU7eD/vVu3Btva3Qu+oSkJMKFAQFaAzMIa0xV6A262WvU9YdQ8fXtwQ0yBR794sZouP6qykrTrgJeGallz8JlLKuH9njxkSH2lQe2YfYcP3DdrBDLJPKkHy13tkE1iua8Epn8qgNro44vd6oOaYsRirkyFW/UN8FQ0s4fJiMUNFBSx5ZvsA7MzxWpKZHIzQgPTIHTWaMJ+KNzAfSAr8VKOzMJN5qVBfVA245CCA4+IMbWvZ6/bYn9olBNpXK3k4cc+GPP/OUgtRy5PtayegunUzJ5c0OEx8cnVF/WlGw=
Content-ID: <22F92CDD8749914EAF1613360CE221B7@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f250d884-c7af-45c1-9697-08d6b9d30f71
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2019 14:29:07.1977 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1440
Subject: Re: [Xen-devel] [PATCH 4/7] x86/IOMMU: introduce init-ops structure
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>,
 "Suthikulpanit, Suravee" <Suravee.Suthikulpanit@amd.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190405142907.GEwAg_fFouWwlfVRl9dnQg-tqFQi8TaK5kiAV4Nyx6s@z>

T24gMy8yOC8xOSA5OjUxIEFNLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gRG8gYXdheSB3aXRoIHRo
ZSBDUFUgdmVuZG9yIGRlcGVuZGVuY3ksIGFuZCBzZXQgdGhlIGluaXQgb3BzIHBvaW50ZXINCj4g
YmFzZWQgb24gd2hhdCBBQ1BJIHRhYmxlcyBoYXZlIGJlZW4gZm91bmQuDQo+IA0KPiBBbHNvIHRh
a2UgdGhlIG9wcG9ydHVuaXR5IGFuZCBhZGQgX19yZWFkX21vc3RseSB0byBpb21tdV9vcHMuDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQoNCkFj
a2VkLWJ5OiBCcmlhbiBXb29kcyA8YnJpYW4ud29vZHNAYW1kLmNvbT4NCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
