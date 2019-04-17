Return-Path: <SRS0=ZpmR=ST=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70707C282DA
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 11:40:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4953020656
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 11:40:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4953020656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGiv0-00052M-WC; Wed, 17 Apr 2019 11:39:58 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=f/qU=ST=citrix.com=prvs=0034167b4=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hGiuz-00052H-LX
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 11:39:57 +0000
X-Inumbo-ID: 85efe932-6105-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 85efe932-6105-11e9-92d7-bc764e045a96;
 Wed, 17 Apr 2019 11:39:56 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,361,1549929600"; d="scan'208";a="83780716"
Date: Wed, 17 Apr 2019 12:39:54 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Message-ID: <20190417113954.GW30543@zion.uk.xensource.com>
References: <20190415162809.23675-1-ian.jackson@eu.citrix.com>
 <20190415162809.23675-2-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190415162809.23675-2-ian.jackson@eu.citrix.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190417113954.dAyvGv3h8lxb7pDsPsQKZH1hWaQntCReOaswCm4_39c@z>

T24gTW9uLCBBcHIgMTUsIDIwMTkgYXQgMDU6Mjg6MDhQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gSW4gZDI5MGUzMjUxNzljY2VlOTY2Y2Q2NzlkMGZlZDQ4YmU2ZjRjYzFiNwo+ICAgImJ1
aWxkIHN5c3RlbTogZG9uJ3QgbGV0IGluc3RhbGwtc3R1YmRvbSBkZXBlbmQgb24gaW5zdGFsbC10
b29scyIKPiB0aGUgZGVwZW5kZW5jeSBvZiBpbnN0YWxsLXN0dWJkb20gb24gaW5zdGFsbC10b29s
cyB3YXMgcmVtb3ZlZC4KPiAKPiBIb3dldmVyLCB0aGlzIHdhcyBub3QgY29ycmVjdC4gICBzdHVi
ZG9tL01ha2VmaWxlIGNvbnRhaW5zIHRoaXM6Cj4gCj4gICAkKFhFTl9ST09UKS90b29scy9xZW11
LXhlbi10cmFkaXRpb25hbC1kaXI6Cj4gICAgICAgICQoTUFLRSkgREVTVERJUj0gLUMgJChYRU5f
Uk9PVCkvdG9vbHMgcWVtdS14ZW4tdHJhZGl0aW9uYWwtZGlyLWZpbmQKPiAKPiBBcyBJIGhhdmUg
d3JpdHRlbiBiZWZvcmU6Cj4gCj4gICBXaXRoIHJlY3Vyc2l2ZSBtYWtlLCBpdCBpcyBuZWNlc3Nh
cnkgZm9yIHRoZSBvdmVyYWxsIHN0cnVjdHVyZSBvZiB0aGUKPiAgIG1ha2VmaWxlcyB0byBzZXF1
ZW5jZSB0aGluZ3Mgc28gdGhhdCBlYWNoIGRpcmVjdG9yeSBpcyBlbnRlcmVkIGV4YWN0bHkKPiAg
IG9uY2UsIGJlZm9yZSBpdHMgZGVwZW5kZW50IGRpcmVjdG9yaWVzIGFyZSBlbnRlcmVkLiAgKEl0
IGlzIHBvc3NpYmxlCj4gICB0byB2aW9sYXRlIHRoaXMgcnVsZSB3aXRob3V0IGNyZWF0aW5nIHJh
Y2VzIGJ1dCBpdCBpcyB0cmlja3kgYW5kCj4gICBpbmFkdmlzYWJsZS4pCj4gCj4gU2luY2UgZDI5
MGUzMjUxNzljLCBpdCBjYW4gaGFwcGVuIHRoYXQgdGhlIGNvbW1hbmQgZm9yIHRoZQo+IHFlbXUt
eGVuLXRyYWRpdGlvbmFsLWRpci1maW5kIHJ1bGUgaXMgcnVuIHR3aWNlIHNpbXVsdGFuZW91c2x5
IC0gb25jZQo+IGFzIGEgcmVzdWx0IG9mICQoTUFLRSkgLUMgdG9vbHMgaW5zdGFsbCwgYW5kIG9u
Y2UgYXMgYSByZXN1bHQgb2YKPiAkKE1BS0UpIC1DIHN0dWJkb20gaW5zdGFsbC4gIElmIHlvdSBn
ZXQgdW5sdWNreSwgdGhpcyBjYXVzZXMgbG9zc2FnZS4KPiAoVGhpcyBqdXN0IGhhcHBlbmVkIHRv
IG1lIGluIGFuIG9zc3Rlc3QgZmxpZ2h0LikKPiAKPiBJbiBwcmluY2lwbGUgd2UgY291bGQgYWx0
ZXJuYXRpdmVseSBmaXggdGhpcyBieSBsaWZ0aW5nIHRoZSBjb21tYW5kcwo+IGluIHRoZSBxZW11
LXhlbi10cmFkaXRpb25hbC1kaXItZmluZCB0YXJnZXQgKGFuZCBwZXJoYXBzIG90aGVyIHRoaW5n
cwo+IHRvbykgaW50byB0aGUgdG9wbGV2ZWwgTWFrZWZpbGUsIGFzIHdhcyBkb25lIGZvciBtaW5p
LW9zLgo+IAo+IEJ1dCB0aGF0IHNlZW1zIG92ZXJraWxsIGdpdmVuIGhvdyBiYWQgdGhlIHN0dWJk
b20gYnVpbGQgc3lzdGVtIGlzLCBhbmQKPiB0aGUgZmFjdCB0aGF0IHdlIHRoaW5rIGF0IHNvbWUg
cG9pbnQgdGhpcyBxZW11LXRyYWQgd2lsbCBnbyBhd2F5Cj4gZW50aXJlbHkuICBBZGRpbmcgdGhl
IHRvb2xzIGRlcGVuZGVuY3kgYmFjayB0byB0aGUgc3R1YmRvbSBidWlsZCBpcwo+IGJ5IGFuZCBs
YXJnZSBnb29kIGVub3VnaC4KPiAKPiAoU29tZW9uZSB3aG8gcmVhbGx5IHdhbnRzIHRvIGJ1aWxk
IHN0dWJkb20gd2l0aG91dCB0b29scyBpcyB3ZWxjb21lIHRvCj4gZG8gdGhpcyBzZXBhcmF0aW9u
IGlmIHRoZXkgcmVhbGx5IHdhbnQgdG8uKQo+IAo+IENDOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NA
c3VzZS5jb20+Cj4gQ0M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gU2lnbmVkLW9m
Zi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CgpBY2tlZC1ieTog
V2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
