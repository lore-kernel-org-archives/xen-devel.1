Return-Path: <SRS0=r7lW=VH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36C66C74A35
	for <xen-devel@archiver.kernel.org>; Wed, 10 Jul 2019 19:49:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04E2120645
	for <xen-devel@archiver.kernel.org>; Wed, 10 Jul 2019 19:49:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="JMZrp2bK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04E2120645
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hlIaW-00076m-91; Wed, 10 Jul 2019 19:49:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FlFr=VH=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hlIaU-00076d-Bf
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2019 19:49:10 +0000
X-Inumbo-ID: c8764cae-a34b-11e9-9b1c-67d989559c8e
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c8764cae-a34b-11e9-9b1c-67d989559c8e;
 Wed, 10 Jul 2019 19:49:09 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5C76F20645;
 Wed, 10 Jul 2019 19:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1562788149;
 bh=DcLEgxroRjp0Kjo0svoKFRJw1hWdZReT14OqEPhNfPk=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=JMZrp2bKqlU1WH7TYaTehClK37g5pSbxYQIdIgVBgTNA90gR3pd5Pg+CgcTIhjRL0
 RuNbZKVLFLYL6n/eebrdzus8zIf/SHCjxu8z3GOURWbn9ojsc1GgzDmsYoR3dJEphw
 ylKQCo+3Jv+vD1GY9Xia5RYElf0wSl0tDUEBdToo=
Date: Wed, 10 Jul 2019 14:49:07 -0500 (CDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Denis Obrezkov <denisobrezkov@gmail.com>
In-Reply-To: <25386cfa-d0b7-83fe-4d87-5af3459d54bd@gmail.com>
Message-ID: <alpine.DEB.2.21.1907101447440.12168@sstabellini-ThinkPad-T480s>
References: <25386cfa-d0b7-83fe-4d87-5af3459d54bd@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [GSoC-2019] About the crossbar and xen
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Hunyue Yau <hy-gsoc@hy-research.com>, Iain Hunter <drhunter95@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAxMCBKdWwgMjAxOSwgRGVuaXMgT2JyZXprb3Ygd3JvdGU6Cj4gSGVsbG8sCj4gCj4g
c28sIEkgdGhpbmsgSSB1bmRlcnN0b29kIHdoeSB1YXJ0IGRvZXNuJ3Qgd29yaywgdGhhdCdzIGJl
Y2F1c2UgYWxsIHRoZQo+IGlycXMgYXJlIHJvdXRlZCB0byB0aGUgY3Jvc3NiYXIgbm90IHRvIEdJ
Qywgc28sIHhlbiBjYW4ndCBkZWFsIHdpdGggdGhlbS4KPiAKPiBPbmUgdGhpbmcgSSBhbSBjb25j
ZXJuZWQgb2YgaXMgdGhlOgo+IAlpbnRlcnJ1cHQtY29udHJvbGxlckA0ODI4MTAwMCB7Cj4gCQlj
b21wYXRpYmxlID0gInRpLG9tYXA1LXd1Z2VuLW1wdSIsICJ0aSxvbWFwNC13dWdlbi1tcHUiOwo+
IAkJaW50ZXJydXB0LWNvbnRyb2xsZXI7Cj4gCQkjaW50ZXJydXB0LWNlbGxzID0gPDB4MDAwMDAw
MDM+Owo+IAkJcmVnID0gPDB4MDAwMDAwMDAgMHg0ODI4MTAwMCAweDAwMDAwMDAwIDB4MDAwMDEw
MDA+Owo+IAkJaW50ZXJydXB0LXBhcmVudCA9IDwweDAwMDAwMDAyPjsKPiAJCXBoYW5kbGUgPSA8
MHgwMDAwMDAwOD47Cj4gCX07Cj4gQW5kIHRoaXMgaXMgYW4gaW50ZXJydXB0LXBhcmVudCBmb3Ig
dGhlIGNyb3NzYmFyLiBTbywgaXQgaXMgbm90IGNsZWFyCj4gZm9yIG1lIGhvdyBpdCBwYXJ0aWNp
cGF0ZXMgaW4gaW50ZXJydXB0IHByb2Nlc3NpbmcuIEFueSB0aG91Z2h0cz8KPiAKPiBIZXJlIGlz
IG15IGRldmljZSB0cmVlOiBodHRwczovL3Bhc3RlYmluLmNvbS9YZWM1N0pjcgogCkhpIERlbmlz
LAoKSWYgeW91IGxvb2sgYXQgdGhlIEdJQyBub2RlIChjb21wYXRpYmxlID0gImFybSxjb3J0ZXgt
YTE1LWdpYyI7KSB0aGUKcGhhbmRsZSBpczoKCiAgcGhhbmRsZSA9IDwweDAwMDAwMDAyPjsKCkkg
dGhpbmsgdGhhdCBtZWFucyB0aGF0IGludGVycnVwdHMgZ28gdG8gdGhlIEdJQyB2aWEgQ3Jvc3Ni
YXI7IGkuZS4gdGhlCnBhcmVudCBpbnRlcnJ1cHQgY29udHJvbGxlciBvZiBDcm9zc2JhciBpcyB0
aGUgR0lDLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
