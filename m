Return-Path: <SRS0=MmA3=SR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEE49C10F0E
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 22:18:37 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C22620854
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 22:18:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="vkGYMBEN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C22620854
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hG9vg-0000rC-JO; Mon, 15 Apr 2019 22:18:20 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1Ip/=SR=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hG9vf-0000r7-GK
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 22:18:19 +0000
X-Inumbo-ID: 5e94dfb1-5fcc-11e9-92d7-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5e94dfb1-5fcc-11e9-92d7-bc764e045a96;
 Mon, 15 Apr 2019 22:18:17 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8E5B220880;
 Mon, 15 Apr 2019 22:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1555366667;
 bh=jUiTHi83Own5aeaIpJ3K1zaXWWs2rXKYbECzClxLbvE=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=vkGYMBENDz41b0cTbff/zECpwR9+92JnhizzhUa+eH533BU3DmzR/g7Z1qwRU4G0l
 tlXR4JffKDsg/GEgAtiPxNEyV5EvaWlciVl51PafSBjavPQC4AXUDBMcyF8svffdyo
 ADlVRI0N+4uRpyL8sMYtG0iJxKTfXiJn8XyLqHrE=
Date: Mon, 15 Apr 2019 15:17:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Jan Beulich <JBeulich@suse.com>
In-Reply-To: <5C891FA4020000780021E3A0@prv1-mh.provo.novell.com>
Message-ID: <alpine.DEB.2.10.1904151515180.29275@sstabellini-ThinkPad-X260>
References: <20190218113600.9540-1-julien.grall@arm.com>
 <20190218113600.9540-9-julien.grall@arm.com>
 <5C891FA4020000780021E3A0@prv1-mh.provo.novell.com>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH for-next 8/9] xen: Introduce HAS_M2P config
 and use to protect mfn_to_gmfn call
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 oleksandr_tyshchenko@epam.com, Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190415221746.-lKLnBs8SU72wXcXZEzgelHl1zUnFTDkJ43PBhyiJ-w@z>

T24gV2VkLCAxMyBNYXIgMjAxOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPiBAQCAtMjE1LDYgKzIx
Niw5IEBAIHZvaWQgX19od2RvbV9pbml0IGlvbW11X2h3ZG9tX2luaXQoc3RydWN0IGRvbWFpbiAq
ZCkKPiA+ICAgICAgICAgIC8qIFVzZSB3aGlsZS1icmVhayB0byBhdm9pZCBjb21waWxlciB3YXJu
aW5nICovCj4gPiAgICAgICAgICB3aGlsZSAoIGlvbW11X2lvdGxiX2ZsdXNoX2FsbChkLCBmbHVz
aF9mbGFncykgKQo+ID4gICAgICAgICAgICAgIGJyZWFrOwo+ID4gKyNlbHNlCj4gPiArICAgICAg
ICByYyA9IC1FTk9TWVM7Cj4gCj4gLUVPUE5PVFNVUFAgcGxlYXNlLgoKVGhlIHBhdGNoIGlzIGZp
bmUgYnkgbWUgYW5kIEkgYW0gYWxzbyBmaW5lIHdpdGggSmFuJ3MgY29tbWVudHMuCgpJIG9ubHkg
d2FudCB0byBwb2ludCBvdXQgdGhhdCB3ZSBoYXZlbid0IGJlZW4gZW50aXJlbHkgY29uc2lzdGVu
dCB3aXRoCi1FTk9TWVMgYW5kL29yIC1FT1BOT1RTVVBQLiBXZSBoYXZlIGxvdHMgb2YgcGxhY2Vz
IHRoYXQgcmV0dXJuIC1FTk9TWVMuClNob3VsZCB3ZSBjaGFuZ2UgdGhlbSB0byAtRU9QTk9UU1VQ
UCBnb2luZyBmb3J3YXJkPwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
