Return-Path: <SRS0=w8Ow=ZH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7D91C432C3
	for <xen-devel@archiver.kernel.org>; Fri, 15 Nov 2019 11:17:52 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FB932072B
	for <xen-devel@archiver.kernel.org>; Fri, 15 Nov 2019 11:17:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="mXY0dHgG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FB932072B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=posteo.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVZba-0007bF-Sq; Fri, 15 Nov 2019 11:17:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Up3T=ZH=posteo.de=hfp@srs-us1.protection.inumbo.net>)
 id 1iVZbZ-0007bA-E7
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 11:17:33 +0000
X-Inumbo-ID: 8354bc66-0799-11ea-a266-12813bfff9fa
Received: from mout01.posteo.de (unknown [185.67.36.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8354bc66-0799-11ea-a266-12813bfff9fa;
 Fri, 15 Nov 2019 11:17:30 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
 by mout01.posteo.de (Postfix) with ESMTPS id 0E2FA16005C
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2019 12:17:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
 t=1573816649; bh=4+TlpcDd2n3ppbP6kdfCJYbJDNUuSGLMwfYOyvUZ+9g=;
 h=Subject:To:Cc:From:Date:From;
 b=mXY0dHgGLZKWMPLqlXSjsinXN9sE/mI6I9cTvkLiG/1indo9Veno7E/sHPjJmf820
 4zfd6yCWXa6QJv6l7MHN8584od5FwdBegVtJRbcNFCoP9cuYND1m8OqyKcjGmWPD4g
 cgZ9hXgF6xZ0/88yRfZhzUocY/ZNufPv+Y7mPk/jFgwr+SJ1QZSYKGSWOsBBM8ggLv
 O2Qe2F7ywpfgLg5/ikNAaTWJfa1rCWerbtTysE3jRV5Z0+XyDM1cNfEDrht+4JlsTI
 oqucio+xWslWLnmH+6AvQBj+cMQWMjYGXpCdjzv94efxeqb6MYpqgQFHe3Jvl03hsD
 gfP7qE950mVBw==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 47Dwml0Svpz6tm5;
 Fri, 15 Nov 2019 12:17:26 +0100 (CET)
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <20191115105739.20333-1-george.dunlap@citrix.com>
From: Andreas Kinzler <hfp@posteo.de>
Message-ID: <50a66402-4354-cbfc-b3b9-058b4cd37498@posteo.de>
Date: Fri, 15 Nov 2019 12:17:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191115105739.20333-1-george.dunlap@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH RFC] x86: Add hack to disable "Fake HT" mode
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Steven Haigh <netwiz@crc.id.au>,
 Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMTEuMjAxOSAxMTo1NywgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBDaGFuZ2VzZXQgY2Ey
ZWVlOTJkZjQ0ICgieDg2LCBodm06IEV4cG9zZSBob3N0IGNvcmUvSFQgdG9wb2xvZ3kgdG8gSFZN
Cj4gZ3Vlc3RzIikgYXR0ZW1wdGVkIHRvICJmYWtlIHVwIiBhIHRvcG9sb2d5IHdoaWNoIHdvdWxk
IGluZHVjZSBndWVzdAo+IG9wZXJhdGluZyBzeXN0ZW1zIHRvIG5vdCB0cmVhdCB2Y3B1cyBhcyBz
aWJsaW5nIGh5cGVydGhyZWFkcy4gIFRoaXMKPiBpbnZvbHZlZCAoYW1vbmcgb3RoZXIgdGhpbmdz
KSBhY3R1YWxseSByZXBvcnRpbmcgaHlwZXJ0aHJlYWRpbmcgYXMKPiBhdmFpbGFibGUsIGJ1dCBn
aXZpbmcgdmNwdXMgZXZlcnkgb3RoZXIgQVBJQ0lELiAgVGhlIHJlc3VsdGluZyBjcHUKPiBmZWF0
dXJlc2V0IGlzIGludmFsaWQsIGJ1dCBtb3N0IG9wZXJhdGluZyBzeXN0ZW1zIG9uIG1vc3QgaGFy
ZHdhcmUKPiBtYW5hZ2VkIHRvIGNvcGUgd2l0aCBpdC4KPiAKPiBVbmZvcnR1bmF0ZWx5LCBXaW5k
b3dzIHJ1bm5pbmcgb24gbW9kZXJuIEFNRCBoYXJkd2FyZSAtLSBpbmNsdWRpbmcKPiBSeXplbiAz
eHh4IHNlcmllcyBwcm9jZXNzb3JzLCBhbmQgcmVwb3J0ZWRseSBFUFlDICJSb21lIiBjcHVzIC0t
IGdldHMKPiBjb25mdXNlZCBieSB0aGUgcmVzdWx0aW5nIGNvbnRyYWRpY3RvcnkgZmVhdHVyZSBi
aXRzIGFuZCBjcmFzaGVzCj4gZHVyaW5nIGluc3RhbGxhdGlvbi4gIChMaW51eCBndWVzdHMgaGF2
ZSBzbyBmYXIgY29udGludWVkIHRvIGNvcGUuKQoKSSBkbyBub3QgdW5kZXJzdGFuZCBhIGNlbnRy
YWwgcG9pbnQ6IE5vIG1hdHRlciB3aHkgYW5kL29yIGhvdyBhIGZha2UgCnRvcG9sb2d5IGlzIHBy
ZXNlbnRlZCBieSBYZW4sIHdoeSBkaWQgdGhlIG9sZGVyIGdlbmVyYXRpb24gUnl6ZW4gMnh4eCAK
d29yayBhbmQgUnl6ZW4gM3h4eCBkb2Vzbid0PyBXaGF0IGlzIHRoZSBjaGFuZ2UgaW4gQU1EKCEp
IG5vdCBYZW4gdGhhdCAKY2F1c2VzIHRoZSBvbmUgdG8gd29yayBhbmQgdGhlIG90aGVyIHRvIGZh
aWw/CgpSZWdhcmRzIEFuZHJlYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
