Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2B5AC10F13
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 03:14:03 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75AB920674
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 03:14:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75AB920674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDhCo-00070l-Ms; Tue, 09 Apr 2019 03:13:50 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=X9g6=SL=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1hDhCn-00070W-7u
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 03:13:49 +0000
X-Inumbo-ID: 7d88f9db-5a75-11e9-92d7-bc764e045a96
Received: from mga09.intel.com (unknown [134.134.136.24])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7d88f9db-5a75-11e9-92d7-bc764e045a96;
 Tue, 09 Apr 2019 03:13:47 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Apr 2019 20:13:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,327,1549958400"; d="scan'208";a="314264784"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by orsmga005.jf.intel.com with ESMTP; 08 Apr 2019 20:13:43 -0700
Received: from fmsmsx112.amr.corp.intel.com (10.18.116.6) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Mon, 8 Apr 2019 20:13:43 -0700
Received: from shsmsx108.ccr.corp.intel.com (10.239.4.97) by
 FMSMSX112.amr.corp.intel.com (10.18.116.6) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Mon, 8 Apr 2019 20:13:43 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.92]) by
 SHSMSX108.ccr.corp.intel.com ([169.254.8.147]) with mapi id 14.03.0415.000;
 Tue, 9 Apr 2019 11:13:41 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] x86/IOMMU: abstract Intel-specific
 adjust_vtd_irq_affinities()
Thread-Index: AQHU7fyv7MXFaocwf0eAJPVHSvFbJaYzKGFQ
Date: Tue, 9 Apr 2019 03:13:40 +0000
Message-ID:
 <AADFC41AFE54684AB9EE6CBC0274A5D19C9D570C@SHSMSX104.ccr.corp.intel.com>
References: <5CAB2DAA02000078002254F3@prv1-mh.provo.novell.com>
In-Reply-To: <5CAB2DAA02000078002254F3@prv1-mh.provo.novell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNmJkNDA5MTgtOTY1My00OThiLTk5NjctYjIyY2MxZWZkYTBhIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiU1FZWStRejFCVUxIUHQxWXhYWDM1UTRXcXNRdCt3cDBERWJvdWU4blRYaWR5Q3UwaG44RVp5alJwd3diZnVPViJ9
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] x86/IOMMU: abstract Intel-specific
 adjust_vtd_irq_affinities()
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
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190409031340.RVl3gLH5RoyCNCKuV2eNYUuUMyJpN957EOYJ9w1Xuuo@z>

PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+IFNlbnQ6IE1v
bmRheSwgQXByaWwgOCwgMjAxOSA3OjE3IFBNCj4gCj4gVGhpcyBjYW4ndCBiZSBmb2xkZWQgaW50
byB0aGUgcmVzdW1lIGhvb2ssIGFzIHRoYXQgcnVucyBiZWZvcmUgYnJpbmdpbgo+IGJhY2sgdXAg
QVBzLCBidXQgdGhlIGFmZmluaXR5IGFkanVzdG1lbnQgd2FudHMgdG8gaGFwcGVuIHdpdGggYWxs
IENQVXMKPiBiYWNrIG9ubGluZS4gSGVuY2UgYSBzZXBhcmF0ZSBob29rIGlzIG5lZWRlZCBzdWNo
IHRoYXQgQU1EIGNhbiB0aGVuCj4gbGV2ZXJhZ2UgaXQgYXMgd2VsbC4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gCgpSZXZpZXdlZC1ieTogS2V2
aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
