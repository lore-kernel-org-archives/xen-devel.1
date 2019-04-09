Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D17BC10F13
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 03:09:47 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 251F920883
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 03:09:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 251F920883
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDh8g-0005sD-CG; Tue, 09 Apr 2019 03:09:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=X9g6=SL=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1hDh8f-0005s8-6y
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 03:09:33 +0000
X-Inumbo-ID: e2ffac34-5a74-11e9-aaa4-afa642a231f1
Received: from mga04.intel.com (unknown [192.55.52.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e2ffac34-5a74-11e9-aaa4-afa642a231f1;
 Tue, 09 Apr 2019 03:09:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Apr 2019 20:09:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,327,1549958400"; d="scan'208";a="314264045"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by orsmga005.jf.intel.com with ESMTP; 08 Apr 2019 20:09:27 -0700
Received: from fmsmsx153.amr.corp.intel.com (10.18.125.6) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Mon, 8 Apr 2019 20:09:27 -0700
Received: from shsmsx154.ccr.corp.intel.com (10.239.6.54) by
 FMSMSX153.amr.corp.intel.com (10.18.125.6) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Mon, 8 Apr 2019 20:09:26 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.92]) by
 SHSMSX154.ccr.corp.intel.com ([169.254.7.149]) with mapi id 14.03.0415.000;
 Tue, 9 Apr 2019 11:09:24 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] VT-d: posted interrupts require interrupt remapping
Thread-Index: AQHU63145mJF/naJy0mp5oWt4E/goqYzLAOA
Date: Tue, 9 Apr 2019 03:09:24 +0000
Message-ID:
 <AADFC41AFE54684AB9EE6CBC0274A5D19C9D56B9@SHSMSX104.ccr.corp.intel.com>
References: <5CA6FD5D0200007800224C46@prv1-mh.provo.novell.com>
In-Reply-To: <5CA6FD5D0200007800224C46@prv1-mh.provo.novell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiY2RmM2I4MWMtYWZjZS00MDdkLTk1NzItNmU3NzI2MGZmMThjIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiMmNxZHR1YVBaN3JKREJUVTZcL0YwU3RvdzZnYjRXN09TUCtUdWVLUFRFU2lWMkV0YXhuckg3RjR2dkFISE1LVDIifQ==
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] VT-d: posted interrupts require interrupt
 remapping
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190409030924.afKu44wuGRGRTprw_H8PYZekBANTwn7fKUs3n7WwpUk@z>

PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+IFNlbnQ6IEZy
aWRheSwgQXByaWwgNSwgMjAxOSAzOjAyIFBNCj4gCj4gSW5pdGlhbGx5IEkgaGFkIGp1c3Qgbm90
aWNlZCB0aGUgdW5uZWNlc3NhcnkgaW5kaXJlY3Rpb24gaW4gdGhlIGNhbGwKPiBmcm9tIHBpX3Vw
ZGF0ZV9pcnRlKCkuIFRoZSBnZW5lcmljIHdyYXBwZXIgaGF2aW5nIGFuIGlvbW11X2ludHJlbWFw
Cj4gY29uZGl0aW9uYWwgbWFkZSBtZSBsb29rIGF0IHRoZSBzZXR1cCBjb2RlIHRob3VnaC4gU28g
Zmlyc3Qgb2YgYWxsCj4gZW5mb3JjZSB0aGUgbmVjZXNzYXJ5IGRlcGVuZGVuY3kuCj4gCj4gU2ln
bmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKQWNrZWQtYnk6IEtl
dmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
