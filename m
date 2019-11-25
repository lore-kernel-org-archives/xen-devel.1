Return-Path: <SRS0=3bfR=ZR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD413C432C0
	for <xen-devel@archiver.kernel.org>; Mon, 25 Nov 2019 12:37:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2B0D20836
	for <xen-devel@archiver.kernel.org>; Mon, 25 Nov 2019 12:37:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2B0D20836
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZDbx-0006kX-K7; Mon, 25 Nov 2019 12:37:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7DUC=ZR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iZDbw-0006kP-Bc
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2019 12:37:00 +0000
X-Inumbo-ID: 3f81eda8-0f80-11ea-b08b-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3f81eda8-0f80-11ea-b08b-bc764e2007e4;
 Mon, 25 Nov 2019 12:36:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id ED0BEB414;
 Mon, 25 Nov 2019 12:36:47 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-users <xen-users@lists.xenproject.org>,
 xen-devel <xen-devel@lists.xenproject.org>, xen-announce@lists.xenproject.org
Message-ID: <dbc3758a-b787-0b3b-0686-1e312937da33@suse.com>
Date: Mon, 25 Nov 2019 13:36:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] Xen 4.13 RC2
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLAoKWGVuIDQuMTMgcmMzIGlzIHRhZ2dlZC4gWW91IGNhbiBjaGVjayB0aGF0IG91dCBm
cm9tIHhlbi5naXQ6CgpnaXQ6Ly94ZW5iaXRzLnhlbi5vcmcveGVuLmdpdCA0LjEzLjAtcmMzCgpG
b3IgeW91ciBjb252ZW5pZW5jZSB0aGVyZSBpcyBhbHNvIGEgdGFyYmFsbCBhdDoKaHR0cHM6Ly9k
b3dubG9hZHMueGVucHJvamVjdC5vcmcvcmVsZWFzZS94ZW4vNC4xMy4wLXJjMy94ZW4tNC4xMy4w
LXJjMy50YXIuZ3oKCkFuZCB0aGUgc2lnbmF0dXJlIGlzIGF0OgpodHRwczovL2Rvd25sb2Fkcy54
ZW5wcm9qZWN0Lm9yZy9yZWxlYXNlL3hlbi80LjEzLjAtcmMzL3hlbi00LjEzLjAtcmMzLnRhci5n
ei5zaWcKClBsZWFzZSBzZW5kIGJ1ZyByZXBvcnRzIGFuZCB0ZXN0IHJlcG9ydHMgdG8geGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnLgpXaGVuIHNlbmRpbmcgYnVnIHJlcG9ydHMsIHBsZWFz
ZSBDQyByZWxldmFudCBtYWludGFpbmVycyBhbmQgbWUKKGpncm9zc0BzdXNlLmNvbSkuCgpUaGVy
ZSB3aWxsIGJlIGEgWGVuIFRlc3QgRGF5IG9uIE5vdiAyOHRoLgoKU2VlIGluc3RydWN0aW9ucyBv
bjoKCmh0dHBzOi8vd2lraS54ZW5wcm9qZWN0Lm9yZy93aWtpL1hlbl80LjEzX1JDX3Rlc3RfaW5z
dHJ1Y3Rpb25zCmh0dHBzOi8vd2lraS54ZW5wcm9qZWN0Lm9yZy93aWtpL1hlbl9Qcm9qZWN0X1Rl
c3RfRGF5cwoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
