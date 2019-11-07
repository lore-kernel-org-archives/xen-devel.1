Return-Path: <SRS0=uIE0=Y7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 271FEC43331
	for <xen-devel@archiver.kernel.org>; Thu,  7 Nov 2019 17:36:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A6C1207FA
	for <xen-devel@archiver.kernel.org>; Thu,  7 Nov 2019 17:36:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=eikelenboom.it header.i=@eikelenboom.it header.b="hFn9XmWm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A6C1207FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=eikelenboom.it
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSlhv-0002bF-UW; Thu, 07 Nov 2019 17:36:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Rrmt=Y7=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1iSlhu-0002bA-5W
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2019 17:36:30 +0000
X-Inumbo-ID: 20c41d86-0185-11ea-adbe-bc764e2007e4
Received: from server.eikelenboom.it (unknown [91.121.65.215])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 20c41d86-0185-11ea-adbe-bc764e2007e4;
 Thu, 07 Nov 2019 17:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8wYKPYMFCVObnF2w3tnaS49akdq+uxYmyzytPFGUUm8=; b=hFn9XmWmvqI4VvP33GWElkBjyd
 qDHSDzXUCxDJVjoKQmiyBLhUfPiSfvFpMceEj8dWv3bcVigpqT5Os/pT9+B+nNjv/AIQ4Lr2mrEcx
 EG/McOpYviojM3G7k9rvrGidJy/FrfckTi1HlUn9jcX7hU+GI0L/xFTdVPqB5fHdq6mo=;
Received: from ip4da85049.direct-adsl.nl ([77.168.80.73]:53104
 helo=[172.16.1.50]) by server.eikelenboom.it with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <linux@eikelenboom.it>)
 id 1iSlih-0003WL-19; Thu, 07 Nov 2019 18:37:19 +0100
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
References: <7e199416-1d95-19d1-57f8-cedb04e6101b@suse.com>
From: Sander Eikelenboom <linux@eikelenboom.it>
Message-ID: <dd532554-81aa-7ebf-30f9-0aed22403856@eikelenboom.it>
Date: Thu, 7 Nov 2019 18:36:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <7e199416-1d95-19d1-57f8-cedb04e6101b@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] OSStest priorities
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcvMTEvMjAxOSAxNzo0NCwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBIaSBJYW4sCj4gCj4g
aW4gdGhlIFhlbiBjb21tdW5pdHkgY2FsbCB3ZSBhZ3JlZWQgdG8gdHJ5IHRvIHNwZWVkIHVwIE9T
U3Rlc3QgZm9yCj4geGVuLXVuc3RhYmxlIGluIG9yZGVyIHRvIG1ha2UgYmV0dGVyIHByb2dyZXNz
IHdpdGggdGhlIDQuMTMgcmVsZWFzZS4KPiAKPiBDb3VsZCB5b3UgcGxlYXNlIHN1c3BlbmQgdGVz
dGluZyBmb3IgWGVuIDQuMTAgYW5kIG9sZGVyIChKYW4gYWdyZWVkIG9uCj4gdGhhdCksIGFuZCBk
aXNhYmxlIHRoZSBMaW51eCBrZXJuZWwgdGVzdHMgd2hpY2ggYXJlIGN1cnJlbnRseSBmYWlsaW5n
Cj4gKGluY2x1ZGluZyB0aGUgYmlzZWN0aW5nKT8KPiAKPiBUaGlzIHNob3VsZCBmcmVlIGxvdHMg
b2YgcmVzb3VyY2VzIGluIE9TU3Rlc3QgcmVkdWNpbmcgeGVuLXVuc3RhYmxlCj4gdGVzdCBsYXRl
bmNpZXMuCj4gCj4gCj4gSnVlcmdlbgo+IAo+IAoKVGhlIGZvbGxvd2luZyB0ZXN0cyBoYXZlIHF1
aXRlIGEgbG9uZyB0aW1lb3V0IGFuZCB3aWxsIGFsd2F5cyBmYWlsLAooYWx0aG91Z2ggbGFzdCB0
aW1lIEkgbWFudWFsbHkgY2hlY2tlZCB3aW5kb3dzIDEwIGFjdHVhbGx5IGluc3RhbGxlZCBmaW5l
Cm9uIGEgSFZNIG9uIG15IG1hY2hpbmUpLgoKIHRlc3QtYW1kNjQtYW1kNjQteGwtcWVtdXUtd2lu
MTAtaTM4NiAxMCB3aW5kb3dzLWluc3RhbGwgICAgICAgIGZhaWwgbmV2ZXIgcGFzcwogdGVzdC1h
bWQ2NC1pMzg2LXhsLXFlbXV0LXdpbjEwLWkzODYgMTAgd2luZG93cy1pbnN0YWxsICAgICAgICAg
ZmFpbCBuZXZlciBwYXNzCiB0ZXN0LWFtZDY0LWkzODYteGwtcWVtdXUtd2luMTAtaTM4NiAxMCB3
aW5kb3dzLWluc3RhbGwgICAgICAgICBmYWlsIG5ldmVyIHBhc3MKIHRlc3QtYW1kNjQtYW1kNjQt
eGwtcWVtdXQtd2luMTAtaTM4NiAxMCB3aW5kb3dzLWluc3RhbGwgICAgICAgIGZhaWwgbmV2ZXIg
cGFzcwoKcGVyaGFwcyBzdXNwZW5kaW5nIHRoZXNlIGluIGFsbCB0cmVlIHVudGlsIHRoZSB1bmRl
cmx5aW5nIGluc3RhbGwgaW1hZ2UgaXMgZml4ZWQKb3IgcmVwbGFjZWQsIHdvdWxkIGFsc28gZnJl
ZSBzb21lIG1vcmUgcmVzb3VyY2VzLCBhbHNvIGFmdGVyIHRoZSByZWxlYXNlLgoKLS0KU2FuZGVy
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
