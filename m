Return-Path: <SRS0=ZpmR=ST=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFA02C282DA
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 21:56:09 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B8522183E
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 21:56:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="RvEjuxSZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B8522183E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xilinx.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGsWy-0000MA-Ge; Wed, 17 Apr 2019 21:55:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6K1X=ST=xilinx.com=stefanos@srs-us1.protection.inumbo.net>)
 id 1hGsWx-0000LY-0I
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 21:55:47 +0000
X-Inumbo-ID: 8d5d3145-615b-11e9-92d7-bc764e045a96
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe52::619])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8d5d3145-615b-11e9-92d7-bc764e045a96;
 Wed, 17 Apr 2019 21:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9XtHHsSf8+CyJZFfB130bt6X8aUWP9Q5bHBDcZ9cjwM=;
 b=RvEjuxSZLv6I7BAeB+AvG7yOvI3xRQoo+wCHl5m8joA5SW5NlnX07mVbwGTOvZC8eqdCFX/ZniUnTaVBmxgU/ObRCZt4UjzP7dXkMVEVVtC8gynLxJSZTBE2+rPMUzO7XviYMsFB7iSI5WI8VA6haPzStHtnfNHQMqbui2lZ6Qs=
Received: from MWHPR0201CA0087.namprd02.prod.outlook.com
 (2603:10b6:301:75::28) by BN1PR02MB151.namprd02.prod.outlook.com
 (2a01:111:e400:20::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.1792.14; Wed, 17
 Apr 2019 21:55:43 +0000
Received: from CY1NAM02FT038.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::204) by MWHPR0201CA0087.outlook.office365.com
 (2603:10b6:301:75::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1813.11 via Frontend
 Transport; Wed, 17 Apr 2019 21:55:42 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; lists.xenproject.org; dkim=none (message not
 signed) header.d=none;lists.xenproject.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT038.mail.protection.outlook.com (10.152.74.217) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1771.16
 via Frontend Transport; Wed, 17 Apr 2019 21:55:42 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
 (envelope-from <stefano.stabellini@xilinx.com>)
 id 1hGsWr-00033J-H7; Wed, 17 Apr 2019 14:55:41 -0700
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <stefano.stabellini@xilinx.com>)
 id 1hGsWm-0000xH-Dd; Wed, 17 Apr 2019 14:55:36 -0700
Received: from xsj-pvapsmtp01 (mail.xilinx.com [149.199.38.66] (may be forged))
 by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id x3HLtUKL003000; 
 Wed, 17 Apr 2019 14:55:30 -0700
Received: from [172.19.2.220] (helo=localhost)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <stefanos@xilinx.com>)
 id 1hGsWg-0000rt-8E; Wed, 17 Apr 2019 14:55:30 -0700
Date: Wed, 17 Apr 2019 14:55:30 -0700
From: Stefano Stabellini <stefano.stabellini@xilinx.com>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <28e234b7-7678-6064-37fb-7518756a3c12@arm.com>
Message-ID: <alpine.DEB.2.10.1904171441360.1370@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1902261501020.20689@sstabellini-ThinkPad-X260>
 <1551222427-21749-1-git-send-email-sstabellini@kernel.org>
 <5C766799020000780021AA28@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1904171359470.1370@sstabellini-ThinkPad-X260>
 <28e234b7-7678-6064-37fb-7518756a3c12@arm.com>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(7916004)(376002)(346002)(39850400004)(396003)(136003)(2980300002)(199004)(189003)(36386004)(76176011)(356004)(81166006)(53546011)(93886005)(76506005)(77096007)(126002)(23726003)(446003)(44832011)(58126008)(476003)(8676002)(11346002)(486006)(186003)(46406003)(4326008)(5660300002)(63266004)(9686003)(50466002)(426003)(336012)(6246003)(26005)(478600001)(8936002)(47776003)(6916009)(33716001)(57986006)(107886003)(229853002)(2906002)(106002)(81156014)(16586007)(9786002)(54906003)(305945005)(316002)(42866002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN1PR02MB151; H:xsj-pvapsmtpgw01; FPR:;
 SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9108e76e-4afd-4a00-51e4-08d6c37f6fd6
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600141)(711020)(4605104)(4709054)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:BN1PR02MB151; 
X-MS-TrafficTypeDiagnostic: BN1PR02MB151:
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BN1PR02MB151CD85661067F25BC56E96A0250@BN1PR02MB151.namprd02.prod.outlook.com>
X-Forefront-PRVS: 0010D93EFE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: v14CKdFz2NQ92TCE7MINLVKwrG9Ax69P/njWkJ3tiwW3bQDhsubHqLe9+uIdRXhipZs+Eb3fCvfEomEuO6LOYgY4PXgIKGb/wj2oeDi8sb/AYo5j9IRDuBoWxXUbwwp8CcElZzR9rrXNbY6VrEv3LyYb441GeKKgVEFbzvZgZLgx4eFMwDNu8JFccMmHvPBQJBgSOAJo9/2mwf5+DgBh+rqGi1cr4zkKbsQ/FY3WNqu9m0WyEvNECXdyvCwpXhh8iBAXaILKzpX8YKzEDP4Ui38Wsh9IdhVGT0oFvJqE97N84X4x55yoyxXFpX4td7kllv15U3RiA0VJ5bY1WlvetusQXkcVjwWQ0gbS2QBBUIzYnOyjqz544BKcOEUSDy00sY8yYkas76JmYP1qvgrEmOEKyIIzguPnPdrZYkEn2WQ=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2019 21:55:42.0240 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9108e76e-4afd-4a00-51e4-08d6c37f6fd6
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN1PR02MB151
Subject: Re: [Xen-devel] [PATCH 1/6] xen: extend XEN_DOMCTL_memory_mapping
 to handle cacheability
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
 Stefano Stabellini <stefanos@xilinx.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <JBeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190417215530.3Cdv-C2UbxqHDLtlQojLHgOnH4AnfXxEFLeMMZHcNP4@z>

T24gV2VkLCAxNyBBcHIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDQv
MTcvMTkgMTA6MTIgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+IE9uIFdlZCwgMjcg
RmViIDIwMTksIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4gPiA+ID4gPiBPbiAyNy4wMi4xOSBhdCAw
MDowNywgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPiA+IC0tLSBhL3hlbi9p
bmNsdWRlL3B1YmxpYy9kb21jdGwuaAo+ID4gPiA+ICsrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9k
b21jdGwuaAo+ID4gPiA+IEBAIC01NzEsMTIgKzU3MSwxNCBAQCBzdHJ1Y3QgeGVuX2RvbWN0bF9i
aW5kX3B0X2lycSB7Cj4gPiA+ID4gICAqLwo+ID4gPiA+ICAgI2RlZmluZSBEUENJX0FERF9NQVBQ
SU5HICAgICAgICAgMQo+ID4gPiA+ICAgI2RlZmluZSBEUENJX1JFTU9WRV9NQVBQSU5HICAgICAg
MAo+ID4gPiA+ICsjZGVmaW5lIENBQ0hFQUJJTElUWV9ERVZNRU0gICAgICAwIC8qIGRldmljZSBt
ZW1vcnksIHRoZSBkZWZhdWx0ICovCj4gPiA+ID4gKyNkZWZpbmUgQ0FDSEVBQklMSVRZX01FTU9S
WSAgICAgIDEgLyogbm9ybWFsIG1lbW9yeSAqLwo+ID4gPiA+ICAgc3RydWN0IHhlbl9kb21jdGxf
bWVtb3J5X21hcHBpbmcgewo+ID4gPiA+ICAgICAgIHVpbnQ2NF9hbGlnbmVkX3QgZmlyc3RfZ2Zu
OyAvKiBmaXJzdCBwYWdlIChodm0gZ3Vlc3QgcGh5cyBwYWdlKSBpbgo+ID4gPiA+IHJhbmdlICov
Cj4gPiA+ID4gICAgICAgdWludDY0X2FsaWduZWRfdCBmaXJzdF9tZm47IC8qIGZpcnN0IHBhZ2Ug
KG1hY2hpbmUgcGFnZSkgaW4gcmFuZ2UKPiA+ID4gPiAqLwo+ID4gPiA+ICAgICAgIHVpbnQ2NF9h
bGlnbmVkX3QgbnJfbWZuczsgICAvKiBudW1iZXIgb2YgcGFnZXMgaW4gcmFuZ2UgKD4wKSAqLwo+
ID4gPiA+ICAgICAgIHVpbnQzMl90IGFkZF9tYXBwaW5nOyAgICAgICAvKiBhZGQgb3IgcmVtb3Zl
IG1hcHBpbmcgKi8KPiA+ID4gPiAtICAgIHVpbnQzMl90IHBhZGRpbmc7ICAgICAgICAgICAvKiBw
YWRkaW5nIGZvciA2NC1iaXQgYWxpZ25lZCBzdHJ1Y3R1cmUKPiA+ID4gPiAqLwo+ID4gPiA+ICsg
ICAgdWludDMyX3QgY2FjaGVfcG9saWN5OyAgICAgIC8qIGNhY2hlYWJpbGl0eSBvZiB0aGUgbWVt
b3J5IG1hcHBpbmcKPiA+ID4gPiAqLwo+ID4gPiA+ICAgfTsKPiA+ID4gCj4gPiA+IEkgZG9uJ3Qg
dGhpbmsgREVWTUVNIGFuZCBNRU1PUlkgYXJlIGFueXdoZXJlIG5lYXIgZGVzY3JpcHRpdmUKPiA+
ID4gZW5vdWdoLCBub3IgLSBpZiB3ZSB3YW50IHN1Y2ggY29udHJvbCBhbnl3YXkgLSBmbGV4aWJs
ZSBlbm91Z2guIEkKPiA+ID4gdGhpbmsgd2hhdCB5b3Ugd2FudCBpcyB0byBhY3R1YWxseSBzcGVj
aWZ5IGNhY2hhYmlsaXR5LCBhbGxvd2luZyBvbgo+ID4gPiB4ODYgdG8gZS5nLiBtYXAgZnJhbWUg
YnVmZmVycyBvciBhbGlrZSBXQy4gVGhlIGF0dHJpYnV0ZSB0aGVuCj4gPiA+IHdvdWxkIChvYnZp
b3VzbHkgYW5kIG5lY2Vzc2FyaWx5KSBiZSBhcmNoaXRlY3R1cmUgc3BlY2lmaWMuCj4gPiAKPiA+
IFllcywgSSBhZ3JlZSB3aXRoIHdoYXQgeW91IHdyb3RlLCBhbmQgYWxzbyB3aXRoIHdoYXQgSnVs
aWVuIHdyb3RlLiBOb3cKPiA+IHRoZSBxdWVzdGlvbiBpcyBob3cgZG8geW91IGJvdGggdGhpbmsg
dGhpcyBzaG91bGQgbG9vayBsaWtlIGluIG1vcmUKPiA+IGRldGFpbHM6Cj4gPiAKPiA+IC0gYXJl
IHlvdSBPSyB3aXRoIHVzaW5nIG1lbW9yeV9wb2xpY3kgaW5zdGVhZCBvZiBjYWNoZV9wb2xpY3kg
bGlrZQo+ID4gICAgSnVsaWVuJ3Mgc3VnZ2VzdGVkIGFzIG5hbWUgZm9yIHRoZSBmaWVsZD8KPiA+
IC0gYXJlIHlvdSBPSyB3aXRoIHVzaW5nICNkZWZpbmVzIGZvciB0aGUgdmFsdWVzPwo+ID4gLSBz
aG91bGQgdGhlICNkZWZpbmVzIGZvciBib3RoIHg4NiBhbmQgQXJtIGJlIGRlZmluZWQgaGVyZSBv
ciBpbiBvdGhlcgo+ID4gICAgaGVhZGVycz8KPiA+IC0gd2hhdCB2YWx1ZXMgd291bGQgeW91IGxp
a2UgdG8gc2VlIGZvciB4ODY/Cj4gPiAKPiA+IEZvciBBcm0sIHRoZSBvbmVzIEkgY2FyZSBhYm91
dCBhcmU6Cj4gPiAKPiA+IC0gcDJtX21taW9fZGlyZWN0X2Rldgo+ID4gLSBwMm1fbW1pb19kaXJl
Y3RfYwo+IAo+IEZpcnN0IHN0ZXAgZmlyc3QuIFdoYXQgYXJlIHRoZSByZWFzb24gdG8gaGF2ZSBw
Mm1fbW1pb19kaXJlY3RfYz8gSXMgaXQgb25seQo+IGZvciBtZW1vcnkgc2hhcmluZyBiZXR3ZWVu
IERvbVUgYW5kIERvbTA/CgpObywgRG9tMC1Eb21VIHNoYXJpbmcgaXMgb25seSBhIG1pbm9yIHBv
c2l0aXZlIHNpZGUgZWZmZWN0LiBYaWxpbnggTVBTb0MKaGFzIHR3byBDb3J0ZXggUjUgY3B1cyBp
biBhZGRpdGlvbiB0byBmb3VyIENvcnRleCBBNTMgY3B1cyBvbiB0aGUgYm9hcmQuCkl0IGlzIGFs
c28gcG9zc2libGUgdG8gYWRkIGFkZGl0aW9uYWwgQ29ydGV4IE00IGNwdXMgYW5kIE1pY3JvYmxh
emUgY3B1cwppbiBmYWJyaWMuIFRoZXJlIGNvdWxkIGJlIGRvemVuIGluZGVwZW5kZW50IHByb2Nl
c3NvcnMuIFVzZXJzIG5lZWQgdG8KZXhjaGFuZ2UgZGF0YSBiZXR3ZWVuIHRoZSBoZXRlcm9nZW5l
b3VzIGNwdXMuIFRoZXkgdXN1YWxseSBzZXQgdXAgdGhlaXIKb3duIHJpbmcgc3RydWN0dXJlcyBv
dmVyIHNoYXJlZCBtZW1vcnksIG9yIHRoZXkgdXNlIE9wZW5BTVAuICBFaXRoZXIKd2F5LCB0aGV5
IG5lZWQgdG8gc2hhcmUgYSBjYWNoZWFibGUgbWVtb3J5IHJlZ2lvbiBiZXR3ZWVuIHRoZW0uICBU
aGUKTVBTb0MgaXMgdmVyeSBmbGV4aWJsZSBhbmQgdGhlIG1lbW9yeSByZWdpb24gY2FuIGNvbWUg
ZnJvbSBhIG11bHRpdHVkZQpvZiBzb3VyY2VzLCBpbmNsdWRpbmcgYSBwb3J0aW9uIG9mIG5vcm1h
bCBtZW1vcnksIG9yIGEgcG9ydGlvbiBvZiBhCnNwZWNpYWwgbWVtb3J5IGFyZWEgb24gdGhlIGJv
YXJkLiBUaGVyZSBhcmUgYSBjb3VwbGUgb2Ygc3BlY2lhbCBTUkFNCmJhbmtzIDY0SyBvciAyNTZL
IGxhcmdlIHRoYXQgY291bGQgYmUgdXNlZCBmb3IgdGhhdC4gQWxzbywgUFJBTSBjYW4gYmUKZWFz
aWx5IGFkZGVkIGluIGZhYnJpYyBhbmQgdXNlZCBmb3IgdGhlIHB1cnBvc2UuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
