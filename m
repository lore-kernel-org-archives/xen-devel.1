Return-Path: <SRS0=IYHG=ZK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8666C432C0
	for <xen-devel@archiver.kernel.org>; Mon, 18 Nov 2019 16:11:25 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61807206DA
	for <xen-devel@archiver.kernel.org>; Mon, 18 Nov 2019 16:11:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="Ojd22T4Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61807206DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=posteo.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWjcH-0000HC-RT; Mon, 18 Nov 2019 16:11:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=e2Is=ZK=posteo.de=hfp@srs-us1.protection.inumbo.net>)
 id 1iWjcG-0000H7-Rr
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2019 16:11:05 +0000
X-Inumbo-ID: 03df48de-0a1e-11ea-a2d9-12813bfff9fa
Received: from mout02.posteo.de (unknown [185.67.36.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 03df48de-0a1e-11ea-a2d9-12813bfff9fa;
 Mon, 18 Nov 2019 16:11:02 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
 by mout02.posteo.de (Postfix) with ESMTPS id 370F92400FE
 for <xen-devel@lists.xenproject.org>; Mon, 18 Nov 2019 17:11:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
 t=1574093461; bh=bCU6XOePl7A+VrsJCoxeTpf+E8PJRzcNuj5r0590He4=;
 h=From:Subject:To:Date:From;
 b=Ojd22T4ZM6mtODg4ZK5lNd8FGAJbCPNhpnY7mgqQeln7cFmFmF2id/EGVQG9f0IAb
 C0FgJjn71lpvqt7HbdV+P+/s4sbJsxJSx3U2z8Q6CZNQuYgU7A9/c73nAHe86O9isD
 evcn3koN29vPQSNSx7zYIz04TKRJIJqfOPS2jF+ecH5Lw+aR6QKQq2FpArb35jX/lk
 IFoz9M/661pMtVXGve1CFuE/nRS4C1PFYOOWMwNPJZ7DFtwig07g+9NwmsqUb/VlEN
 StPW9jpUhKOeYFWbJWJDFZQm14J8UsfsrPWHr4szRMuR21SL4ANDVoIdQwZw4NR36X
 n+javv+ePJm2Q==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 47Gv800ksPz9rxV;
 Mon, 18 Nov 2019 17:10:54 +0100 (CET)
From: Andreas Kinzler <hfp@posteo.de>
To: George Dunlap <george.dunlap@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Steven Haigh <netwiz@crc.id.au>
References: <0e47b56a-4e5d-e815-2e74-eab5da11f3d0@posteo.de>
 <4f9cb404-995a-1479-160a-1cf96815cb9d@citrix.com>
Message-ID: <be40e4d0-f03f-a855-a93a-031abed36c81@posteo.de>
Date: Mon, 18 Nov 2019 17:11:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMTEuMjAxOSAxODoxMywgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiAxMS8xNS8xOSA1
OjA2IFBNLCBBbmRyZWFzIEtpbnpsZXIgd3JvdGU6Cj4+IEhlbGxvIEFsbCwKPj4KPj4gSSBjb21w
YXJlZCB0aGUgQ1BVSUQgbGlzdGluZ3MgZnJvbSBSeXplbiAyNzAwWCAoYXR0YWNoZWQgYXMgdGFy
Lnh6KSB0bwo+PiAzNzAwWCBhbmQgZm91bmQgb25seSB2ZXJ5IGZldyBkaWZmZXJlbmNlcy4gSSBh
ZGRlZAo+Pgo+PiBjcHVpZCA9IFsgIjB4ODAwMDAwMDg6ZWN4PXh4eHh4eHh4eHh4eHh4eHgwMTAw
eHh4eHh4eHh4eHh4IiBdCj4+Cj4+IHRvIHhsLmNmZyBhbmQgdGhlbiBXaW5kb3dzIHJ1bnMgZ3Jl
YXQgd2l0aCAxNiB2Q1BVcy4gQ2luZWJlbmNoIFIxNSBzY29yZQo+PiBpcyA+MjA1MCB3aGljaCBp
cyBtb3JlIG9yIGxlc3MgdGhlIGJhcmUgbWV0YWwgdmFsdWUuCj4gQXdlc29tZS4gIEFueSBpZGVh
IHdoYXQgdGhvc2UgYml0cyBkbz8KCiBGcm9tIHRoZSBBTUQgQVBNIChodHRwczovL3d3dy5hbWQu
Y29tL3N5c3RlbS9maWxlcy9UZWNoRG9jcy8yNDU5NC5wZGYpOgoKQVBJQyBJRCBzaXplLiBUaGUg
bnVtYmVyIG9mIGJpdHMgaW4gdGhlIGluaXRpYWwgQVBJQzIwW0FwaWNJZF0gdmFsdWUgCnRoYXQg
aW5kaWNhdGUgY29yZSBJRCB3aXRoaW4gYSBwcm9jZXNzb3IuIEEgemVybyB2YWx1ZSBpbmRpY2F0
ZXMgdGhhdCAKbGVnYWN5IG1ldGhvZHMgbXVzdCBiZSB1c2VkIHRvIGRlcml2ZSB0aGUgbWF4aW11
bSBudW1iZXIgb2YgY29yZXMuIFRoZSAKc2l6ZSBvZiB0aGlzIGZpZWxkIGRldGVybWluZXMgdGhl
IG1heGltdW0gbnVtYmVyIG9mIGNvcmVzIChNTkMpIHRoYXQgdGhlIApwcm9jZXNzb3IgY291bGQg
dGhlb3JldGljYWxseSBzdXBwb3J0LCBub3QgdGhlIGFjdHVhbCBudW1iZXIgb2YgY29yZXMgCnRo
YXQgYXJlIGFjdHVhbGx5IGltcGxlbWVudGVkIG9yIGVuYWJsZWQgb24gdGhlIHByb2Nlc3Nvciwg
YXMgaW5kaWNhdGVkIApieSBDUFVJRCBGbjgwMDBfMDAwOF9FQ1hbTkNdLgppZiAoQXBpY0lkQ29y
ZUlkU2l6ZVszOjBdID09IDApewogICAvLyBVc2VkIGJ5IGxlZ2FjeSBkdWFsLWNvcmUvc2luZ2xl
LWNvcmUgcHJvY2Vzc29ycwogICBNTkMgPSBDUFVJRCBGbjgwMDBfMDAwOF9FQ1hbTkNdICsgMTsK
fSBlbHNlIHsKICAgLy8gdXNlIEFwaWNJZENvcmVJZFNpemVbMzowXSBmaWVsZAogICBNTkMgPSAo
MiBeIEFwaWNJZENvcmVJZFNpemVbMzowXSk7Cn0KClRoZSB2YWx1ZSBwcm9ncmFtbWVkIGluIDI3
MDBYIGlzIDQsIG9uIDM3MDBYIGl0IGlzIDcuIFNlZSBteSBkdW1wIGluIApodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTktMDkvbXNnMDIxODku
aHRtbAoKUGxlYXNlIG5vdGUgdGhhdCB0aGUgdmFsdWUgaXMgYW4gZXhwb25lbnQgLSB0aGF0IG1l
YW5zIE1OQyBpcyBwcm9ncmFtbWVkIAphcyAxNiBmb3IgMjcwMFggYW5kIDEyOCBmb3IgMzcwMFgu
CgpSZWdhcmRzIEFuZHJlYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
