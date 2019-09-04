Return-Path: <SRS0=pR42=W7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7DB8C3A5A7
	for <xen-devel@archiver.kernel.org>; Wed,  4 Sep 2019 12:35:24 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADE212341D
	for <xen-devel@archiver.kernel.org>; Wed,  4 Sep 2019 12:35:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADE212341D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5UV7-0005GM-Qi; Wed, 04 Sep 2019 12:35:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Tt/v=W7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i5UV6-0005Fe-Jd
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 12:35:04 +0000
X-Inumbo-ID: 6a879184-cf10-11e9-abb0-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6a879184-cf10-11e9-abb0-12813bfff9fa;
 Wed, 04 Sep 2019 12:35:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 275ACB028;
 Wed,  4 Sep 2019 12:35:02 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: Lars Kurth <lars.kurth@citrix.com>
References: <C0345A39-5EF3-48D9-9AC0-9DA174CEA818@citrix.com>
Message-ID: <439228e9-0a69-7c8e-d217-b3e4a9124478@suse.com>
Date: Wed, 4 Sep 2019 14:35:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <C0345A39-5EF3-48D9-9AC0-9DA174CEA818@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Please propose agenda items for Thursday's
 community call
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDkuMjAxOSAyMDozNywgTGFycyBLdXJ0aCB3cm90ZToKPiBJIGhhdmUgbm90IGdvdHRl
biBhcm91bmQgdG8gZHJhZnQgYW4gYWdlbmRhIHlldC4gUGxlYXNlIHJlcGx5IHRvCj4gdGhpcyB0
aHJlYWQgd2l0aCBwb3NzaWJsZSBhZ2VuZGEgaXRlbXMuIEkgd2lsbCByZXBseSB0byB0aGlzCj4g
dGhyZWFkIHdpdGggbWVldGluZyBpbnZpdGUgYW5kIGRldGFpbHMgYXMgdXN1YWwKCldlbGwsIG9u
IG9uZSBoYW5kIEkgd291bGQgaGF2ZSB0d28gdG9waWNzOgoKLSB0aGUgcGVuZGluZyBBTUQgbWFp
bnRhaW5lcnNoaXAgY2hhbmdlcwotIHRoZSB2YXJpb3VzIHBlbmRpbmcgZm9sbG93LXVwcyBvZiBt
aW5lIHRvIFhTQXMgMjc1IC4uLiAyOTQKCkJ1dCBvdG9oIEkgd29uJ3QgYmUgYWJsZSB0byBhdHRl
bmQgbW9yZSB0aGFuIHRoZSBmaXJzdCBoYWxmIG9mCnRoZSBtZWV0aW5nIHRvbW9ycm93IChhbmQg
ZXZlbiB0aGlzIG92ZXJsYXBzIHdpdGggYW4gaW50ZXJuYWwKZXZlbnQgaGVyZSksIHBvc3NpYmx5
IGxlc3MgZGVwZW5kaW5nIG9uIHdlYXRoZXIuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
