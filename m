Return-Path: <SRS0=MgWH=SZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=FROM_EXCESS_BASE64,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3685C10F03
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 14:58:03 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDDE120674
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 14:58:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDDE120674
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hIwrf-0003Cf-Qm; Tue, 23 Apr 2019 14:57:43 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hJhn=SZ=citrix.com=prvs=009aac223=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hIwre-0003Ca-Dd
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2019 14:57:42 +0000
X-Inumbo-ID: 2409bf56-65d8-11e9-92d7-bc764e045a96
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2409bf56-65d8-11e9-92d7-bc764e045a96;
 Tue, 23 Apr 2019 14:57:41 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,386,1549929600"; d="scan'208";a="89179972"
Date: Tue, 23 Apr 2019 16:56:01 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <20190423145601.7qwu63sz2ycg5ywj@Air-de-Roger>
References: <20190423130416.68935-1-roger.pau@citrix.com>
 <c2e1612e-d6c2-ba46-b49e-4e0fe95a1d7e@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c2e1612e-d6c2-ba46-b49e-4e0fe95a1d7e@oracle.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 1/2] xen/pvh: set xen_domain_type to HVM
 in xen_pvh_init
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
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBBcHIgMjMsIDIwMTkgYXQgMDk6Mzc6NTFBTSAtMDQwMCwgQm9yaXMgT3N0cm92c2t5
IHdyb3RlOgo+IE9uIDQvMjMvMTkgOTowNCBBTSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4g
T3IgZWxzZSB4ZW5fZG9tYWluKCkgcmV0dXJucyBmYWxzZSBkZXNwaXRlIHhlbl9wdmggYmVpbmcg
c2V0Lgo+IAo+IElzIHRoaXMgbmV3IHhlbl9kb21haW4oKSBpbnZvY2F0aW9uIHNvbWV3aGVyZSBp
biBFRkkgaW5pdGlhbGl6YXRpb24gdGhhdAo+IHlvdSBhZGQgaW4gdGhlIHNlY29uZCBwYXRjaD8K
ClllcywgdGhlcmUncyBhIHhlbl9pbml0aWFsX2RvbWFpbigpIGNhbGwgaW4geGVuX2VmaV9wcm9i
ZSgpIHdoaWNoCndvdWxkIHJldHVybiBmYWxzZSB3aXRob3V0IHRoaXMgZml4LgoKPiBBc2tpbmcg
YmVjYXVzZSBJIGFtIHRyeWluZyB0byBmaWd1cmUgb3V0IHdoZXRoZXIgdGhpcyBuZWVkcyB0byBn
byB0bwo+IHN0YWJsZSB0cmVlLgoKSSdtIG5vdCBhd2FyZSBvZiB0aGlzIGJlaW5nIGFuIGlzc3Vl
IHdpdGhvdXQgdGhlIEVGSSBjb2RlIHRoYXQgSSBhZGQKaW4gcGF0Y2ggMiwgeGVuX2RvbWFpbl90
eXBlIHdvdWxkIGdldCBzZXQgc2xpZ2h0bHkgbGF0ZXIgaW4gdGhlIGJvb3QKcHJvY2Vzcy4KCkkg
Z3Vlc3MgYm90aCBwYXRjaGVzIHNob3VsZCBiZSBiYWNrcG9ydGVkIHRvIDQuMTkgc2luY2UgdGhh
dCdzIHRoZQpvbmx5IExUUyByZWxlYXNlIHRoYXQgaGFzIFBWSCBkb20wIHN1cHBvcnQgSUlSQywg
YW5kIGl0IHdvdWxkIGJlIGdvb2QKdG8gZ2V0IHRoaXMgZml4ZWQuCgpUaGFua3MsIFJvZ2VyLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
