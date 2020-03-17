Return-Path: <SRS0=G0Zv=5C=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 254F5C10F29
	for <xen-devel@archiver.kernel.org>; Tue, 17 Mar 2020 09:14:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F00AD205ED
	for <xen-devel@archiver.kernel.org>; Tue, 17 Mar 2020 09:14:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F00AD205ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jE8IW-000323-2a; Tue, 17 Mar 2020 09:14:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bptx=5C=suse.cz=mbenes@srs-us1.protection.inumbo.net>)
 id 1jE8IU-00031y-A5
 for xen-devel@lists.xenproject.org; Tue, 17 Mar 2020 09:14:02 +0000
X-Inumbo-ID: a32db960-682f-11ea-b8f0-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a32db960-682f-11ea-b8f0-12813bfff9fa;
 Tue, 17 Mar 2020 09:14:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0D09CAB7F;
 Tue, 17 Mar 2020 09:13:59 +0000 (UTC)
Date: Tue, 17 Mar 2020 10:13:57 +0100 (CET)
From: Miroslav Benes <mbenes@suse.cz>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <1b98d601-d9d9-879c-918c-737830d80ac5@oracle.com>
Message-ID: <alpine.LSU.2.21.2003171013420.21109@pobox.suse.cz>
References: <20200312142007.11488-1-mbenes@suse.cz>
 <20200312142007.11488-2-mbenes@suse.cz>
 <1b98d601-d9d9-879c-918c-737830d80ac5@oracle.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 1/2] x86/xen: Make the boot CPU idle task
 reliable
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
Cc: jgross@suse.com, sstabellini@kernel.org, jpoimboe@redhat.com,
 x86@kernel.org, linux-kernel@vger.kernel.org, live-patching@vger.kernel.org,
 mingo@redhat.com, bp@alien8.de, hpa@zytor.com, xen-devel@lists.xenproject.org,
 tglx@linutronix.de, jslaby@suse.cz
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAxNiBNYXIgMjAyMCwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgoKPiAKPiAKPiBPbiAz
LzEyLzIwIDEwOjIwIEFNLCBNaXJvc2xhdiBCZW5lcyB3cm90ZToKPiA+IC0tLSBhL2FyY2gveDg2
L3hlbi94ZW4taGVhZC5TCj4gPiArKysgYi9hcmNoL3g4Ni94ZW4veGVuLWhlYWQuUwo+ID4gQEAg
LTM1LDcgKzM1LDcgQEAgU1lNX0NPREVfU1RBUlQoc3RhcnR1cF94ZW4pCj4gPiAgCXJlcCBfX0FT
TV9TSVpFKHN0b3MpCj4gPiAgCj4gPiAgCW1vdiAlX0FTTV9TSSwgeGVuX3N0YXJ0X2luZm8KPiA+
IC0JbW92ICRpbml0X3RocmVhZF91bmlvbitUSFJFQURfU0laRSwgJV9BU01fU1AKPiA+ICsJbW92
ICRpbml0X3RocmVhZF91bmlvbitUSFJFQURfU0laRS1TSVpFT0ZfUFRSRUdTLCAlX0FTTV9TUAo+
IAo+IFRoaXMgaXMgaW5pdGlhbF9zdGFjaywgaXNuJ3QgaXQ/CgpJdCBpcy4gSSdsbCBjaGFuZ2Ug
aXQuCgpUaGFua3MKTWlyb3NsYXYKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
