Return-Path: <SRS0=qr0R=ZD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 768EFC43331
	for <xen-devel@archiver.kernel.org>; Mon, 11 Nov 2019 15:35:36 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C05E2190F
	for <xen-devel@archiver.kernel.org>; Mon, 11 Nov 2019 15:35:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C05E2190F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUBiY-0007eH-FF; Mon, 11 Nov 2019 15:35:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SdMF=ZD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iUBiX-0007eC-1E
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2019 15:35:01 +0000
X-Inumbo-ID: d1d6f4fc-0498-11ea-a214-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d1d6f4fc-0498-11ea-a214-12813bfff9fa;
 Mon, 11 Nov 2019 15:34:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7429BB1FC;
 Mon, 11 Nov 2019 15:34:58 +0000 (UTC)
To: Sander Eikelenboom <linux@eikelenboom.it>
References: <03d0387a-fe11-866e-81dc-f4055374b0cd@eikelenboom.it>
 <55c0bc58-32bb-79da-b75f-a20946dac94f@suse.com>
 <55f3c0e3-7da7-f1ad-37cd-e5febdda4b09@eikelenboom.it>
 <1a8ea591-1ad9-514d-00ca-bd153f540d28@suse.com>
 <1df09247-dcb6-3587-7d86-978b08bbf77d@eikelenboom.it>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <314a686c-55cb-e236-ee08-9b1f4d3c9878@suse.com>
Date: Mon, 11 Nov 2019 16:35:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <1df09247-dcb6-3587-7d86-978b08bbf77d@eikelenboom.it>
Content-Language: en-US
Subject: Re: [Xen-devel] Xen-unstable: AMD-Vi: update_paging_mode Try to
 access pdev_list without aquiring pcidevs_lock.
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzEuMTAuMjAxOSAyMTo0OCwgU2FuZGVyIEVpa2VsZW5ib29tIHdyb3RlOgo+ICAgICAtIFRo
ZSB1c2IzIGNvbnRyb2xsZXIgbWFsZnVuY3Rpb25pbmcgc2VlbXMgaW5kZWVkIHRvIGJlIGEgc2Vw
YXJhdGUgaXNzdWUgKHdoaWNoIHNlZW1zIHVuZm9ydHVuYXRlLCAKPiAgICAgICBiZWNhdXNlIGEg
YmlzZWN0IHNlZW1zIHRvIGJlY29tZSBldmVuIG5hc3RpZXIgd2l0aCBhbGwgdGhlIGludGVydHdp
bmVkIHBjaS1wYXNzdGhyb3VnaCBpc3N1ZXMpLgo+ICAgICAgIAo+ICAgICAgIFBlcmhhcHMgdGhp
cyBvbmUgaXMgdGhlbiByZWxhdGVkIHRvIHRoZSBvbmx5ICpvbmNlKiBvY2N1cmluZyBtZXNzYWdl
OiAKPiAgICAgICAgICAgKFhFTikgWzIwMTktMTAtMzEgMjA6Mzk6MzAuNzQ2XSBBTUQtVmk6IElO
VkFMSURfREVWX1JFUVVFU1QgMDAwMDA4MDAgOGEwMDAwMDAgZjgwMDA4NDAgMDAwMDAwZmQKPiAg
ICAgIAo+ICAgICAgIFdoaWxlIGluIHRoZSBndWVzdCBpdCBpcyBlbmRsZXNzbHkgcmVwZWF0aW5n
Ogo+ICAgICAgICAgICBbICAyMzEuMzg1NTY2XSB4aGNpX2hjZCAwMDAwOjAwOjA1LjA6IE1heCBu
dW1iZXIgb2YgZGV2aWNlcyB0aGlzIHhIQ0kgaG9zdCBzdXBwb3J0cyBpcyAzMi4KPiAgICAgICAg
ICAgWyAgMjMxLjQwNzM1MV0gdXNiIHVzYjEtcG9ydDI6IGNvdWxkbid0IGFsbG9jYXRlIHVzYl9k
ZXZpY2UKCkknbSB1bmNlcnRhaW4gd2hldGhlciB0aGVyZSdzIGEgY29ycmVsYXRpb246IFRoZSBk
ZXZpY2UgdGhlIFhlbgptZXNzYWdlIGlzIGFib3V0IGlzIDA4OjAwLjA7IHBsZWFzZSBsZXQgdXMg
a25vdyB3aGF0IGtpbmQgb2YgZGV2aWNlCnRoYXQgaXMgKHRoZSBoeXBlcnZpc29yIGxvZyBhbG9u
ZSBkb24ndCBhbGxvdyBtZSB0byBndWVzcykuCgpUaGUgc3BlY2lmaWMgdHlwZSBpcyBkZXNjcmli
ZWQgYXMgIlBvc3RlZCB3cml0ZSB0byB0aGUgSW50ZXJydXB0L0VPSQpyYW5nZSBmcm9tIGFuIEkv
TyBkZXZpY2UgdGhhdCBoYXMgSW50Q3RsPTAwYiBpbiB0aGUgZGV2aWNl4oCZcyBEVEUuIgpUaGlz
IHdvdWxkIG1ha2UgbWUgZ3Vlc3MgMWIwMGMxNmJkZiAoIkFNRC9JT01NVTogcHJlLWZpbGwgYWxs
IERURXMKcmlnaHQgYWZ0ZXIgdGFibGUgYWxsb2NhdGlvbiIpIGlzIHRoZSBjdWxwcml0IGhlcmUs
IGFuZCBJIG1heSBuZWVkCnRvIGhhbmQgeW91IGEgZGVidWdnaW5nIHBhdGNoIHRvIGdhaW4gc29t
ZSBpbnNpZ2h0LiBCdXQgbGV0IG1lIGZpcnN0CnRha2UgYSBsb29rIGF0IHN1ZmZpY2llbnRseSB2
ZXJib3NlIGxzcGNpIG91dHB1dCBmcm9tIHRoYXQgc3lzdGVtLgoKSmFuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
