Return-Path: <SRS0=MgWH=SZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B34F4C10F03
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 16:02:18 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BC24208E4
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 16:02:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BC24208E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hIxro-0000ov-GL; Tue, 23 Apr 2019 16:01:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VyzP=SZ=citrix.com=prvs=009f8e5a5=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hIxrn-0000oq-Su
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2019 16:01:55 +0000
X-Inumbo-ID: 1bdeaf6a-65e1-11e9-8bbf-13dc1c8a9a60
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1bdeaf6a-65e1-11e9-8bbf-13dc1c8a9a60;
 Tue, 23 Apr 2019 16:01:53 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,386,1549929600"; d="scan'208";a="84209854"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23743.14050.417630.678603@mariner.uk.xensource.com>
Date: Tue, 23 Apr 2019 17:01:38 +0100
To: Wei Liu <wei.liu2@citrix.com>
In-Reply-To: <20190417113954.GW30543@zion.uk.xensource.com>
References: <20190415162809.23675-1-ian.jackson@eu.citrix.com>
 <20190415162809.23675-2-ian.jackson@eu.citrix.com>
 <20190417113954.GW30543@zion.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 1/2] build system: make install-stubdom
 depend on install-tools again
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
Cc: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190423160138.HXf6d0SOzUK52igvJgNGZvHOtT5TnZ5w6E_7bQyVfu4@z>

V2VpIExpdSB3cml0ZXMgKCJSZTogW1BBVENIIDEvMl0gYnVpbGQgc3lzdGVtOiBtYWtlIGluc3Rh
bGwtc3R1YmRvbSBkZXBlbmQgb24gaW5zdGFsbC10b29scyBhZ2FpbiIpOgo+IE9uIE1vbiwgQXBy
IDE1LCAyMDE5IGF0IDA1OjI4OjA4UE0gKzAxMDAsIElhbiBKYWNrc29uIHdyb3RlOgo+ID4gSW4g
ZDI5MGUzMjUxNzljY2VlOTY2Y2Q2NzlkMGZlZDQ4YmU2ZjRjYzFiNwo+ID4gICAiYnVpbGQgc3lz
dGVtOiBkb24ndCBsZXQgaW5zdGFsbC1zdHViZG9tIGRlcGVuZCBvbiBpbnN0YWxsLXRvb2xzIgo+
ID4gdGhlIGRlcGVuZGVuY3kgb2YgaW5zdGFsbC1zdHViZG9tIG9uIGluc3RhbGwtdG9vbHMgd2Fz
IHJlbW92ZWQuCj4gPiAKPiA+IEhvd2V2ZXIsIHRoaXMgd2FzIG5vdCBjb3JyZWN0LiAgIHN0dWJk
b20vTWFrZWZpbGUgY29udGFpbnMgdGhpczoKPiA+IAo+ID4gICAkKFhFTl9ST09UKS90b29scy9x
ZW11LXhlbi10cmFkaXRpb25hbC1kaXI6Cj4gPiAgICAgICAgJChNQUtFKSBERVNURElSPSAtQyAk
KFhFTl9ST09UKS90b29scyBxZW11LXhlbi10cmFkaXRpb25hbC1kaXItZmluZAouLi4KPiBBY2tl
ZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClRoYW5rcy4gIFNpbmNlIHRoaXMg
aXMgcmVsYXRlZCB0byB1bmJsb2NraW5nIG9zc3Rlc3QgKGl0IGlzIGNhdXNpbmcKc3B1cmlvdXMg
YnVpbGQgZmFpbHVyZXMgaW4gdmFyaW91cyBwdXNoIGdhdGVzKSwgSSBoYXZlIHB1c2hlZCBpdC4K
ClVuZm9ydHVuYXRlbHkgSSB0aGluayB0aGlzIHBhdGNoIGlzIG5vdCBzdWl0YWJsZSBmb3IgYmFj
a3BvcnQgc28gdGhpcwpidWcgd2lsbCBjb250aW51ZSB0byB0cm91YmxlIHVzIGluIHN0YWJsZSBi
cmFuY2hlcyBmcm9tIDQuOSBvbndhcmRzLgoKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
