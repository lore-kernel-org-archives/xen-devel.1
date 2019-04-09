Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43E0EC10F13
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 03:11:00 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16AD621473
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 03:10:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16AD621473
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDh9p-0006Yx-Vj; Tue, 09 Apr 2019 03:10:45 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=X9g6=SL=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1hDh9o-0006Yh-Rq
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 03:10:44 +0000
X-Inumbo-ID: 0fde6f73-5a75-11e9-92d7-bc764e045a96
Received: from mga11.intel.com (unknown [192.55.52.93])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0fde6f73-5a75-11e9-92d7-bc764e045a96;
 Tue, 09 Apr 2019 03:10:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Apr 2019 20:10:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,327,1549958400"; d="scan'208";a="314264275"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by orsmga005.jf.intel.com with ESMTP; 08 Apr 2019 20:10:42 -0700
Received: from shsmsx154.ccr.corp.intel.com (10.239.6.54) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Mon, 8 Apr 2019 20:10:42 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.92]) by
 SHSMSX154.ccr.corp.intel.com ([169.254.7.149]) with mapi id 14.03.0415.000;
 Tue, 9 Apr 2019 11:10:39 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <JBeulich@suse.com>
Thread-Topic: [PATCH v4 1/4] x86: stop handling MSR_IA32_BNDCFGS
 save/restore in implementation code
Thread-Index: AQHU2m0TE2y5E9iTkU+hlM60kBqqgqYtCswAgAZDxiA=
Date: Tue, 9 Apr 2019 03:10:39 +0000
Message-ID:
 <AADFC41AFE54684AB9EE6CBC0274A5D19C9D56D0@SHSMSX104.ccr.corp.intel.com>
References: <20190314135125.1958-1-paul.durrant@citrix.com>
 <20190314135125.1958-2-paul.durrant@citrix.com>
 <5CA73C2E0200007800224D98@prv1-mh.provo.novell.com>
In-Reply-To: <5CA73C2E0200007800224D98@prv1-mh.provo.novell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMWQxMmY3OWUtM2Q2Mi00Zjc0LWE5ZDMtOTk0ZTNjZDk4ZDA5IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiQ3VCZnFNYytiZWJxMmJndVRyU3RcL0lIUk5XNVVZZnNEeFpXUU1iQ0o0QW0wczg4UUs3UGU0dnVwSkh6WWdKSFcifQ==
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v4 1/4] x86: stop handling MSR_IA32_BNDCFGS
 save/restore in implementation code
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
Cc: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190409031039.gkKumfEw8UVgjXiC64GchBXCA8uEDGzX4YwhAKnd0eA@z>

PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQ0KPiBTZW50OiBG
cmlkYXksIEFwcmlsIDUsIDIwMTkgNzozMCBQTQ0KPiANCj4gPj4+IE9uIDE0LjAzLjE5IGF0IDE0
OjUxLCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3RlOg0KPiA+IFNhdmluZyBhbmQgcmVz
dG9yaW5nIHRoZSB2YWx1ZSBvZiB0aGlzIE1TUiBpcyBjdXJyZW50bHkgaGFuZGxlZCBieQ0KPiA+
IGltcGxlbWVudGF0aW9uLXNwZWNpZmljIGNvZGUgZGVzcGl0ZSBpdCBiZWluZyBhcmNoaXRlY3R1
cmFsLiBUaGlzIHBhdGNoDQo+ID4gbW92ZXMgaGFuZGxpbmcgb2YgYWNjZXNzZXMgdG8gdGhpcyBN
U1IgZnJvbSBodm0uYyBpbnRvIHRoZSBtc3IuYywgdGh1cw0KPiA+IGFsbG93aW5nIHRoZSBjb21t
b24gTVNSIHNhdmUvcmVzdG9yZSBjb2RlIHRvIGhhbmRsZSBpdC4NCj4gPg0KPiA+IE5PVEU6IEJl
Y2F1c2Ugdm14X2dldC9zZXRfZ3Vlc3RfYm5kY2ZncygpIGNhbGwgdm14X3ZtY3NfZW50ZXIoKSwg
dGhlDQo+ID4gICAgICAgc3RydWN0IHZjcHUgcG9pbnRlciBwYXNzZWQgaW4sIGFuZCBoZW5jZSB0
aGUgdmNwdSBwb2ludGVyIHBhc3NlZCB0bw0KPiA+ICAgICAgIGd1ZXN0X3JkbXNyKCkgY2Fubm90
IGJlIGNvbnN0Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1
cnJhbnRAY2l0cml4LmNvbT4NCj4gPiAtLS0NCj4gPiBDYzogS2V2aW4gVGlhbiA8a2V2aW4udGlh
bkBpbnRlbC5jb20+DQo+ID4gQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4g
PiBDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCj4gPiBDYzog
V2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4NCj4gPiBDYzogIlJvZ2VyIFBhdSBNb25uw6ki
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gPiBDYzogSnVuIE5ha2FqaW1hIDxqdW4ubmFrYWpp
bWFAaW50ZWwuY29tPg0KPiA+DQo+ID4gdjQ6DQo+ID4gIC0gQ29zbWV0aWMgcmUtYXJyYW5nZW1l
bnRzIGFuZCBhbiBhZGRpdGlvbmFsIEFTU0VSVCByZXF1ZXN0ZWQgYnkgSmFuDQo+ID4NCj4gPiB2
MzoNCj4gPiAgLSBBZGRyZXNzIGZ1cnRoZXIgY29tbWVudHMgZnJvbSBKYW4NCj4gPiAgLSBEcm9w
cGVkIEtldmluJ3MgUi1iIGJlY2F1c2Ugb2YgY2hhbmdlIHRvIHZteC5jDQo+IA0KPiBLZXZpbiwN
Cj4gDQo+IHlvdSBtYXkgbm90IGhhdmUgbm90aWNlZCB0aGUgYWJvdmUuDQo+IA0KDQp5ZXMgaW5k
ZWVkLiBUaGFua3MgZm9yIHJlbWluZCENCg0KUmV2aWV3ZWQtYnk6IEtldmluIFRpYW4gPGtldmlu
LnRpYW5AaW50ZWwuY29tPg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
