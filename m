Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD58CC10F0E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 09:18:47 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2AE12133D
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 09:18:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2AE12133D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDmtp-0004Ii-2H; Tue, 09 Apr 2019 09:18:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=piA2=SL=citrix.com=prvs=9957968d6=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hDmto-0004IY-IM
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 09:18:36 +0000
X-Inumbo-ID: 73b65712-5aa8-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 73b65712-5aa8-11e9-92d7-bc764e045a96;
 Tue, 09 Apr 2019 09:18:35 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,328,1549929600"; d="scan'208";a="83088134"
Date: Tue, 9 Apr 2019 10:18:32 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Message-ID: <20190409091832.GA2164@zion.uk.xensource.com>
References: <20190409091546.9606-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190409091546.9606-1-andr2000@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH] xen/cameraif: add ABI for para-virtual
 camera
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
Cc: jgross@suse.com, Wei Liu <wei.liu2@citrix.com>, konrad.wilk@oracle.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 linux-kernel@vger.kernel.org, hverkuil@xs4all.nl,
 xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBBcHIgMDksIDIwMTkgYXQgMTI6MTU6NDZQTSArMDMwMCwgT2xla3NhbmRyIEFuZHJ1
c2hjaGVua28gd3JvdGU6Cj4gRnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5k
cl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPgo+IAo+IFRoaXMgaXMgdGhlIEFCSSBmb3IgdGhlIHR3
byBoYWx2ZXMgb2YgYSBwYXJhLXZpcnR1YWxpemVkCj4gY2FtZXJhIGRyaXZlciB3aGljaCBleHRl
bmRzIFhlbidzIHJlYWNoIG11bHRpbWVkaWEgY2FwYWJpbGl0aWVzIGV2ZW4KPiBmdXJ0aGVyIGVu
YWJsaW5nIGl0IGZvciB2aWRlbyBjb25mZXJlbmNpbmcsIEluLVZlaGljbGUgSW5mb3RhaW5tZW50
LAo+IGhpZ2ggZGVmaW5pdGlvbiBtYXBzIGV0Yy4KPiAKPiBUaGUgaW5pdGlhbCBnb2FsIGlzIHRv
IHN1cHBvcnQgbW9zdCBuZWVkZWQgZnVuY3Rpb25hbGl0eSB3aXRoIHRoZQo+IGZpbmFsIGlkZWEg
dG8gbWFrZSBpdCBwb3NzaWJsZSB0byBleHRlbmQgdGhlIHByb3RvY29sIGlmIG5lZWQgYmU6Cj4g
Cj4gMS4gUHJvdmlkZSBtZWFucyBmb3IgYmFzZSB2aXJ0dWFsIGRldmljZSBjb25maWd1cmF0aW9u
Ogo+ICAtIHBpeGVsIGZvcm1hdHMKPiAgLSByZXNvbHV0aW9ucwo+ICAtIGZyYW1lIHJhdGVzCj4g
Mi4gU3VwcG9ydCBiYXNpYyBjYW1lcmEgY29udHJvbHM6Cj4gIC0gY29udHJhc3QKPiAgLSBicmln
aHRuZXNzCj4gIC0gaHVlCj4gIC0gc2F0dXJhdGlvbgo+IDMuIFN1cHBvcnQgc3RyZWFtaW5nIGNv
bnRyb2wKPiAKPiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3Nh
bmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+Cgp2NiB3YXMgcHVzaGVkIHllc3RlcmRheS4gSXMg
dGhlcmUgYW55dGhpbmcgbmV3IGluIHRoaXMgdmVyc2lvbj8KCldlaS4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
