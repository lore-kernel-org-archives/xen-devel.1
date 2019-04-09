Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5F55C10F13
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 03:04:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A14920818
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 03:04:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A14920818
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDh35-0005Yn-DA; Tue, 09 Apr 2019 03:03:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=X9g6=SL=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1hDh33-0005Yh-O8
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 03:03:45 +0000
X-Inumbo-ID: 14312946-5a74-11e9-be50-7ba5d4208b59
Received: from mga17.intel.com (unknown [192.55.52.151])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 14312946-5a74-11e9-be50-7ba5d4208b59;
 Tue, 09 Apr 2019 03:03:41 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Apr 2019 20:03:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,327,1549958400"; d="scan'208";a="336154265"
Received: from fmsmsx104.amr.corp.intel.com ([10.18.124.202])
 by fmsmga005.fm.intel.com with ESMTP; 08 Apr 2019 20:03:40 -0700
Received: from fmsmsx163.amr.corp.intel.com (10.18.125.72) by
 fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Mon, 8 Apr 2019 20:03:40 -0700
Received: from shsmsx151.ccr.corp.intel.com (10.239.6.50) by
 fmsmsx163.amr.corp.intel.com (10.18.125.72) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Mon, 8 Apr 2019 20:03:40 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.92]) by
 SHSMSX151.ccr.corp.intel.com ([169.254.3.39]) with mapi id 14.03.0415.000;
 Tue, 9 Apr 2019 11:03:38 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Igor Druzhinin <igor.druzhinin@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] x86/vmx: Fixup removals from MSR load-lists
Thread-Index: AQHU6vSlNwC9RuX2LUiKFdcNaHP04KYzK0fw
Date: Tue, 9 Apr 2019 03:03:37 +0000
Message-ID:
 <AADFC41AFE54684AB9EE6CBC0274A5D19C9D567B@SHSMSX104.ccr.corp.intel.com>
References: <1554388929-20127-1-git-send-email-igor.druzhinin@citrix.com>
In-Reply-To: <1554388929-20127-1-git-send-email-igor.druzhinin@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYTFkMmM3NzctODBjNS00NGI3LThmMzMtMDBhYTAzNzFkZTdhIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiUDhNcGtEUVJub2Vya1QyQXNaMU1DTkFRRmM1QkRTcEUzUUJRdmFCQlF6d0NFdGtNYTFIS1wvckc0M0l2d0JJWEQifQ==
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] x86/vmx: Fixup removals from MSR load-lists
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
Cc: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, "jbeulich@suse.com" <jbeulich@suse.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190409030337.YYk2cCok4wLKXp1AwVuknK6cVDdTRn0aJW6QP8lN3zY@z>

PiBGcm9tOiBJZ29yIERydXpoaW5pbiBbbWFpbHRvOmlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb21d
Cj4gU2VudDogVGh1cnNkYXksIEFwcmlsIDQsIDIwMTkgMTA6NDIgUE0KPiAKPiBDb21taXQgZmQz
MmRjZmUgKCJ4ODYvdm14OiBEb24ndCBsZWFrIEVGRVIuTlhFIGludG8gZ3Vlc3QgY29udGV4dCIp
Cj4gaW50cm9kdWNlZCBhIHJlZ3Jlc3Npb24gb24gSGFycGVydG93biBhbmQgZWFybGllciBjb3Jl
cyAoR2VuIDEgVlQteCkKPiB3aGVyZSBhcyBzb29uIGFzIGd1ZXN0IEVGRVIgYmVjb21lcyBlcXVh
bCB0byBYZW4gRUZFUgo+IChhbG1vc3QgYW55IDY0LWJpdCBWTSkgc3RhbGUgdmVyc2lvbiBvZiBF
RkVSIGlzIGluY29ycmVjdGx5Cj4gbG9hZGVkIGludG8gYSBndWVzdCBjYXVzaW5nIGFsbW9zdCBp
bW1lZGlhdGUgZ3Vlc3QgZmFpbHVyZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBJZ29yIERydXpoaW5p
biA8aWdvci5kcnV6aGluaW5AY2l0cml4LmNvbT4KCkFja2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZp
bi50aWFuQGludGVsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
