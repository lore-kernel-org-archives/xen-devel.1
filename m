Return-Path: <SRS0=IYHG=ZK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96098C432C0
	for <xen-devel@archiver.kernel.org>; Mon, 18 Nov 2019 10:35:03 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7000A20730
	for <xen-devel@archiver.kernel.org>; Mon, 18 Nov 2019 10:35:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7000A20730
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWeMm-0000S4-SB; Mon, 18 Nov 2019 10:34:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=2ywg=ZK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iWeMk-0000Rz-PN
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2019 10:34:42 +0000
X-Inumbo-ID: 071ecc9c-09ef-11ea-a2d6-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 071ecc9c-09ef-11ea-a2d6-12813bfff9fa;
 Mon, 18 Nov 2019 10:34:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 82252B01E;
 Mon, 18 Nov 2019 10:34:40 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>
References: <0e47b56a-4e5d-e815-2e74-eab5da11f3d0@posteo.de>
 <4f9cb404-995a-1479-160a-1cf96815cb9d@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8d291d80-5cc2-b7da-4fd3-e530504279e8@suse.com>
Date: Mon, 18 Nov 2019 11:34:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <4f9cb404-995a-1479-160a-1cf96815cb9d@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Ryzen 3xxx works with Windows
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
Cc: AndrewCooper <andrew.cooper3@citrix.com>, Steven Haigh <netwiz@crc.id.au>,
 Andreas Kinzler <hfp@posteo.de>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMTEuMjAxOSAxODoxMywgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiAxMS8xNS8xOSA1
OjA2IFBNLCBBbmRyZWFzIEtpbnpsZXIgd3JvdGU6Cj4+IEhlbGxvIEFsbCwKPj4KPj4gSSBjb21w
YXJlZCB0aGUgQ1BVSUQgbGlzdGluZ3MgZnJvbSBSeXplbiAyNzAwWCAoYXR0YWNoZWQgYXMgdGFy
Lnh6KSB0bwo+PiAzNzAwWCBhbmQgZm91bmQgb25seSB2ZXJ5IGZldyBkaWZmZXJlbmNlcy4gSSBh
ZGRlZAo+Pgo+PiBjcHVpZCA9IFsgIjB4ODAwMDAwMDg6ZWN4PXh4eHh4eHh4eHh4eHh4eHgwMTAw
eHh4eHh4eHh4eHh4IiBdCj4+Cj4+IHRvIHhsLmNmZyBhbmQgdGhlbiBXaW5kb3dzIHJ1bnMgZ3Jl
YXQgd2l0aCAxNiB2Q1BVcy4gQ2luZWJlbmNoIFIxNSBzY29yZQo+PiBpcyA+MjA1MCB3aGljaCBp
cyBtb3JlIG9yIGxlc3MgdGhlIGJhcmUgbWV0YWwgdmFsdWUuCj4gCj4gQXdlc29tZS4gIEFueSBp
ZGVhIHdoYXQgdGhvc2UgYml0cyBkbz8KClRoYXQncyB0aGUgYXBpY19pZF9zaXplIGZpZWxkICh1
c2luZyB0aGUgbmFtaW5nIG9mCnhlbi9pbmNsdWRlL3hlbi9saWIveDg2L2NwdWlkLmgpLgoKSmFu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
