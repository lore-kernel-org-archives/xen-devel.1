Return-Path: <SRS0=MKw+=S2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DB7EC10F11
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 06:47:10 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64D0D2148D
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 06:47:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64D0D2148D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJBgI-00005i-Fc; Wed, 24 Apr 2019 06:46:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0bKC=S2=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1hJBgG-00005Q-T0
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2019 06:46:56 +0000
X-Inumbo-ID: be198ebe-665c-11e9-9874-277eebb0ce35
Received: from mga12.intel.com (unknown [192.55.52.136])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id be198ebe-665c-11e9-9874-277eebb0ce35;
 Wed, 24 Apr 2019 06:46:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Apr 2019 23:46:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,388,1549958400"; d="scan'208";a="340264999"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by fmsmga005.fm.intel.com with ESMTP; 23 Apr 2019 23:46:52 -0700
Received: from fmsmsx118.amr.corp.intel.com (10.18.116.18) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Tue, 23 Apr 2019 23:46:51 -0700
Received: from shsmsx154.ccr.corp.intel.com (10.239.6.54) by
 fmsmsx118.amr.corp.intel.com (10.18.116.18) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Tue, 23 Apr 2019 23:46:51 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.92]) by
 SHSMSX154.ccr.corp.intel.com ([169.254.7.149]) with mapi id 14.03.0415.000;
 Wed, 24 Apr 2019 14:46:49 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2] x86/msr: Fix fallout from mostly c/s 832c180
Thread-Index: AQHU84NMblln6rItL0qD+10r1G/wzKZK69yw
Date: Wed, 24 Apr 2019 06:46:48 +0000
Message-ID:
 <AADFC41AFE54684AB9EE6CBC0274A5D19C9F96AE@SHSMSX104.ccr.corp.intel.com>
References: <1555329809-3248-1-git-send-email-andrew.cooper3@citrix.com>
In-Reply-To: <1555329809-3248-1-git-send-email-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMWE0ODQ0MGMtYmNhMi00ZWUzLWJkNTMtN2Y2M2FmNjBmNTI5IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiRlVLeXBCaXhtcEx1dzd2SGJCbFRwU0s0d3hRY1pwQlhVQ0FBRTJOaXlBcUc1eHJNK3QrUGcyRFN3VFA5TnRGZiJ9
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2] x86/msr: Fix fallout from mostly c/s
 832c180
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
Cc: Wei Liu <wei.liu2@citrix.com>, "Nakajima, Jun" <jun.nakajima@intel.com>,
 Jan Beulich <JBeulich@suse.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190424064648.xgyc9bAS3nTgy8ER9MG_XUOrgo5ZiU_yOHMopCWh410@z>

PiBGcm9tOiBBbmRyZXcgQ29vcGVyIFttYWlsdG86YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbV0N
Cj4gU2VudDogTW9uZGF5LCBBcHJpbCAxNSwgMjAxOSA4OjAzIFBNDQo+IA0KPiAgKiBGaXggdGhl
IHNoaW0gYnVpbGQgYnkgcHJvdmlkaW5nIGEgIUNPTkZJR19IVk0gZGVjbGFyYXRpb24gZm9yDQo+
ICAgIGh2bV9nZXRfZ3Vlc3RfYm5kY2ZncygpLCBhbmQgcmVtb3ZpbmcgdGhlIGludHJvZHVjZWQN
Cj4gICAgQVNTRVJUKGlzX2h2bV9kb21haW4oZCkpJ3MuICBUaGV5IGFyZSBuZWVkZWQgZm9yIERD
RSB0byBrZWVwIHRoZSBidWlsZA0KPiAgICB3b3JraW5nLiAgRnVydGhlcm1vcmUsIGluIHRoaXMg
d2F5LCB0aGUgcmlzayBvZiBydW50aW1lIHR5cGUgY29uZnVzaW9uIGlzDQo+ICAgIHJlbW92ZWQu
DQo+ICAqIFJldmVydCB0aGUgZGUtY29uc3QnaW5nIG9mIHRoZSB2Y3B1IHBvaW50ZXIgaW4gdm14
X2dldF9ndWVzdF9ibmRjZmdzKCkuDQo+ICAgIHZteF92bWNzX2VudGVyKCkgcmVhbGx5IGRvZXMg
bXV0YXRlIHRoZSB2Y3B1LCBhbmQgbWF5IGNhdXNlIGl0IHRvIHVuZGVyZ28NCj4gYQ0KPiAgICBm
dWxsIGRlL3Jlc2NoZWR1bGUsIHdoaWNoIGlzIGluIHZpb2xhdGlvbiBvZiB0aGUgQUJJIGRlc2Ny
aWJlZCBieQ0KPiAgICBodm1fZ2V0X2d1ZXN0X2JuZGNmZ3MoKS4gIGd1ZXN0X3JkbXNyKCkgd2Fz
IGFsd2F5cyBnb2luZyB0byBuZWVkIHRvIGxvc2UNCj4gICAgaXRzIGNvbnN0IHBhcmFtZXRlciwg
YW5kIHRoaXMgd2FzIHRoZSBjb3JyZWN0IHRpbWUgZm9yIGl0IHRvIGhhcHBlbi4NCj4gICogVGhl
IE1TUnMgaW4gdmNwdV9tc3JzIGFyZSBpbiBudW1lcmljIG9yZGVyLiAgUmUtcG9zaXRpb24gWFNT
IHRvIG1hdGNoLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4NCj4gUmV2aWV3ZWQtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJy
YW50QGNpdHJpeC5jb20+DQoNClJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGlu
dGVsLmNvbT4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
