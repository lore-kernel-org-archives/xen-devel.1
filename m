Return-Path: <SRS0=fn8+=SK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCF35C10F13
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 12:48:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A284E20883
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 12:48:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A284E20883
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDThS-0001kn-JT; Mon, 08 Apr 2019 12:48:34 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PEQb=SK=citrix.com=prvs=994fb90f6=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hDThR-0001ki-UV
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 12:48:33 +0000
X-Inumbo-ID: 9dff3895-59fc-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9dff3895-59fc-11e9-92d7-bc764e045a96;
 Mon, 08 Apr 2019 12:48:33 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,325,1549929600"; d="scan'208";a="82997172"
Date: Mon, 8 Apr 2019 13:48:30 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20190408124830.GF1986@zion.uk.xensource.com>
References: <20190408115031.27127-1-wei.liu2@citrix.com>
 <20190408124357.GA3314@perard.uk.xensource.com>
 <20190408124515.GE1986@zion.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190408124515.GE1986@zion.uk.xensource.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH] gitlab-ci: use git clean -ffdx in build
 each commit test
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>,
 Doug Goldstein <cardoe@cardoe.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190408124830.I04z7P1NvK1xaDhGk4oWn-n5XR61eQMC_cNq8YhvfOo@z>

T24gTW9uLCBBcHIgMDgsIDIwMTkgYXQgMDE6NDU6MTVQTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBNb24sIEFwciAwOCwgMjAxOSBhdCAwMTo0Mzo1N1BNICswMTAwLCBBbnRob255IFBFUkFS
RCB3cm90ZToKPiA+IE9uIE1vbiwgQXByIDA4LCAyMDE5IGF0IDEyOjUwOjMxUE0gKzAxMDAsIFdl
aSBMaXUgd3JvdGU6Cj4gPiA+IFRoZSBidWlsZCBzY3JpcHQgaW52b2tlZCBpcyBkZXNpZ25lZCB0
byBydW4gaW4gYSBwcmlzdGluZSBjaGVja291dC4KPiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6
IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgYXV0b21hdGlv
bi9naXRsYWItY2kvYnVpbGQtZWFjaC1jb21taXQuc2ggfCAyICstCj4gPiA+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+ID4gCj4gPiA+IGRpZmYgLS1n
aXQgYS9hdXRvbWF0aW9uL2dpdGxhYi1jaS9idWlsZC1lYWNoLWNvbW1pdC5zaCBiL2F1dG9tYXRp
b24vZ2l0bGFiLWNpL2J1aWxkLWVhY2gtY29tbWl0LnNoCj4gPiA+IGluZGV4IDI3NWJjNzE5MDIu
Ljg3OTAyOGI1YTcgMTAwNzU1Cj4gPiA+IC0tLSBhL2F1dG9tYXRpb24vZ2l0bGFiLWNpL2J1aWxk
LWVhY2gtY29tbWl0LnNoCj4gPiA+ICsrKyBiL2F1dG9tYXRpb24vZ2l0bGFiLWNpL2J1aWxkLWVh
Y2gtY29tbWl0LnNoCj4gPiA+IEBAIC0xNSw0ICsxNSw0IEBAIGZpCj4gPiA+ICBlY2hvICJCdWls
ZGluZyAke0NJX0NPTU1JVF9CRUZPUkVfU0hBfS4uJHtDSV9DT01NSVRfU0hBfSIKPiA+ID4gIAo+
ID4gPiAgTk9OX1NZTUJPTElDX1JFRj0xIC4vYXV0b21hdGlvbi9zY3JpcHRzL2J1aWxkLXRlc3Qu
c2ggJHtDSV9DT01NSVRfQkVGT1JFX1NIQX0gJHtDSV9DT01NSVRfU0hBfSBcCj4gPiA+IC0gICAg
YmFzaCAtYyAibWFrZSAtajQgZGlzdGNsZWFuICYmIC4vYXV0b21hdGlvbi9zY3JpcHRzL2J1aWxk
Igo+ID4gPiArICAgIGJhc2ggLWMgImdpdCBjbGVhbiAtZmZkeCAmJiAuL2F1dG9tYXRpb24vc2Ny
aXB0cy9idWlsZCIKPiA+IAo+ID4gSXMgdGhpcyBtZWFuIHRoYXQgUUVNVSwgT1ZNRiwgU2VhQklP
UywgLi4uIGFyZSBnb2luZyB0byBiZSBjbG9ubmVkIGFnYWluCj4gPiBhbmQgYWdhaW4/IEJ1dCBt
YXliZSBpdCBkb2Vzbid0IG1hdHRlci4KPiAKPiBZZXMuIEJ1dCBJIGRvbid0IHRoaW5rIHRoYXQg
bWF0dGVycyBtdWNoLgoKQlRXLCBkaXN0Y2xlYW4gZGVsZXRlcyB0aG9zZSByZXBvc2l0b3JpZXMg
YXMgd2VsbC4gVGhlIG5hdHVyZSBvZiB0aGlzCnNwZWNpZmljIHRlc3QgbWVhbnMgaXQgaXMgYmVz
dCB0byBzdGFydCBpbiBhIHByaXN0aW5lIGVudmlyb25tZW50LApiZWNhdXNlIHdlIGNvdWxkIHBv
dGVudGlhbGx5IG1vdmUgdGhlIEhFQUQgb2YgYWxsIHRob3NlIHJlcG9zaXRvcmllcy4KCldlaS4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
