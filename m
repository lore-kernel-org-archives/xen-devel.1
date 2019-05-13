Return-Path: <SRS0=55t9=TN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFEECC04AA7
	for <xen-devel@archiver.kernel.org>; Mon, 13 May 2019 16:25:11 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A26B208CA
	for <xen-devel@archiver.kernel.org>; Mon, 13 May 2019 16:25:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A26B208CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQDl5-0006ZH-BE; Mon, 13 May 2019 16:24:59 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=oEJ8=TN=citrix.com=prvs=029f63c82=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1hQDl4-0006ZC-4O
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 16:24:58 +0000
X-Inumbo-ID: a50c7a6c-759b-11e9-8980-bc764e045a96
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a50c7a6c-759b-11e9-8980-bc764e045a96;
 Mon, 13 May 2019 16:24:57 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,465,1549929600"; d="scan'208";a="89710128"
From: Lars Kurth <lars.kurth@citrix.com>
To: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@citrix.com>
Thread-Topic: [PATCH v2] docs/xl: Clarify documentation for mem-max and mem-set
Thread-Index: AQHU7fuU+4UovrpEyUCMf5Fq4f/3paZWX4OAgBLLKgCAAAgQAP//u9sA
Date: Mon, 13 May 2019 16:24:28 +0000
Message-ID: <B645202A-6968-46D8-A689-52518EBB912A@citrix.com>
References: <20190408110943.8987-1-george.dunlap@citrix.com>
 <ee29edd9-a23d-eb00-d403-1e8040bf3174@citrix.com>
 <20190513135930.GJ2798@zion.uk.xensource.com>
 <20190513142822.GO2798@zion.uk.xensource.com>
In-Reply-To: <20190513142822.GO2798@zion.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.9.190412
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <0374123ED56DD941AF2E4D52A2B7F6D7@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2] docs/xl: Clarify documentation for
 mem-max and mem-set
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Ian
 Jackson <Ian.Jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190513162428.Sl0OhOCdr6_xLdLJ3t3fOsgOuO51_CeROUsvuZIM7_o@z>

DQoNCu+7v09uIDEzLzA1LzIwMTksIDA4OjI4LCAiV2VpIExpdSIgPHdlaS5saXUyQGNpdHJpeC5j
b20+IHdyb3RlOg0KDQogICAgT24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMDI6NTk6MzBQTSArMDEw
MCwgV2VpIExpdSB3cm90ZToNCiAgICA+IE9uIFdlZCwgTWF5IDAxLCAyMDE5IGF0IDAzOjU5OjQx
UE0gKzAxMDAsIEdlb3JnZSBEdW5sYXAgd3JvdGU6DQogICAgPiA+IE9uIDQvOC8xOSAxMjowOSBQ
TSwgR2VvcmdlIER1bmxhcCB3cm90ZToNCiAgICA+ID4gPiBtZW0tc2V0IGlzIHRoZSBwcmltYXJ5
IGNvbW1hbmQgdGhhdCB1c2VycyB3aWxsIG5lZWQgdG8gdXNlIGFuZA0KICAgID4gPiA+IHVuZGVy
c3RhbmQuICBNb3ZlIGl0IGZpcnN0LCBhbmQgY2xhcmlmeSB0aGUgd29yZGluZzsgYWxzbyBzcGVj
aWZ5IHRoYXQNCiAgICA+ID4gPiB5b3UgY2FuJ3Qgc2V0IHRoZSB0YXJnZXQgaGlnaGVyIHRoYW4g
bWF4bWVtIGZyb20gdGhlIGRvbWFpbiBjb25maWcuDQogICAgPiA+ID4gDQogICAgPiA+ID4gbWVt
LW1heCBpcyBhY3R1YWxseSBhIHByZXR0eSB1c2VsZXNzIGNvbW1hbmQgYXQgdGhlIG1vbWVudC4g
IENsYXJpZnkNCiAgICA+ID4gPiB0aGF0IHVzZXJzIGFyZSBub3QgZXhwZWN0ZWQgdG8gdXNlIGl0
OyBhbmQgZG9jdW1lbnQgYWxsIG9mIGl0cyBxdWlya3kNCiAgICA+ID4gPiBiZWhhdmlvci4NCiAg
ICA+ID4gPiANCiAgICA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2Uu
ZHVubGFwQGNpdHJpeC5jb20+DQogICAgPiA+IA0KICAgID4gPiBXZWkgLyBJYW46IFBpbmc/DQog
ICAgPiA+IA0KICAgID4gPiBKdWVyZ2VuIHJlcGxpZWQgdG8gbXkgInJldmlldyBub3RlIiBjb21t
ZW50LCBub3QgdG8gYW55dGhpbmcgYWN0aW9uYWJsZQ0KICAgID4gPiBpbiB0aGUgcGF0Y2ggKG9y
IGNvbW1pdCBtZXNzYWdlKSBpdHNlbGYuDQogICAgPiANCiAgICA+IEFja2VkLWJ5OiBXZWkgTGl1
IDx3ZWkubGl1MkBjaXRyaXguY29tPg0KICAgID4gDQogICAgPiAoSSBhbHJlYWR5IHNhaWQgdGhp
cyBsb29rZWQgb2theSB0byBtZSBpbiB2MSkNCiAgICANCiAgICBJIGJlbGlldmUgTGFycycgUmIg
ZnJvbSB2MSBzdGlsbCBzdGFuZHMuDQoNClllcw0KTGFycw0KICAgIA0KDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
