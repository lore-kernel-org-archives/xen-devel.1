Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 796C3C10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 12:20:18 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D9192083E
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 12:20:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D9192083E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hECCs-0002hC-6L; Wed, 10 Apr 2019 12:19:58 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=B5aJ=SM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hECCq-0002h6-KH
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 12:19:56 +0000
X-Inumbo-ID: f2c85b7f-5b8a-11e9-92d7-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f2c85b7f-5b8a-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 12:19:55 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 10 Apr 2019 06:17:54 -0600
Message-Id: <5CADDEF0020000780022635A@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Wed, 10 Apr 2019 06:17:52 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 <george.dunlap@citrix.com>
References: <5CADCC40020000780022621E@prv1-mh.provo.novell.com>
 <2930e42d-5ba2-abb7-0dd7-c9dabfc7ddfe@citrix.com>
 <4382b3ef-83e3-472d-0713-152a6192de6f@citrix.com>
In-Reply-To: <4382b3ef-83e3-472d-0713-152a6192de6f@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] x86/mem-sharing: statically initialize
 audit list head and lock
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Tamas K Lengyel <tamas@tklengyel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190410121752.MQgwdJCLxm0hywMeLnLjtqrbcRqH278cw0X3DvS516I@z>

Pj4+IE9uIDEwLjA0LjE5IGF0IDEzOjIwLCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKPiBPbiA0LzEwLzE5IDEyOjEzIFBNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBPbiAxMC8w
NC8yMDE5IDExOjU4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+IFRoZXJlJ3Mgbm8gbmVlZCB0byBl
eGVjdXRlIGFueSBpbnN0cnVjdGlvbnMgZm9yIGRvaW5nIHNvLgo+Pj4KPj4+IFNpZ25lZC1vZmYt
Ynk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4+IC0tLQo+Pj4gSSB3b25kZXIg
d2hldGhlciBtZW1fc2hhcmluZ19pbml0KCkgc2hvdWxkbid0IGdvIGF3YXkgYWx0b2dldGhlciB0
aGVuLgo+PiAKPj4gSSB2b3RlIGZvciByZW1vdmluZyBpdCBjb21wbGV0ZWx5LiAgVGhlIHByaW50
ayBpcyBhIG91dC1vZi1jaGFyYWN0ZXIKPj4gY29tcGFyZWQgdG8gb3RoZXIgc3Vic3lzdGVtcyBp
biBYZW4uCj4gCj4gKzEKCkluIGFueSBldmVudCBJJ2xsIHdhaXQgZm9yIFRhbWFzJ2VzIG9waW5p
b24uIFRoZXJlIG1pZ2h0IGJlIHBsYW5zIHRvIHB1dApmdXJ0aGVyIG1lYXQgaW50byB0aGUgZnVu
Y3Rpb24sIGFmdGVyIGFsbC4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
