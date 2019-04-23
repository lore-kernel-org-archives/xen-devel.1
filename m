Return-Path: <SRS0=MgWH=SZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8638C282DD
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 22:20:25 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5780217D9
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 22:20:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="RP8aJbhG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5780217D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJ3ln-0004ep-E0; Tue, 23 Apr 2019 22:20:07 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1za8=SZ=protonmail.com=mathieu.tarral@srs-us1.protection.inumbo.net>)
 id 1hJ3ll-0004Po-E0
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2019 22:20:06 +0000
X-Inumbo-ID: f0a3a0b1-6615-11e9-92d7-bc764e045a96
Received: from mail1.protonmail.ch (unknown [185.70.40.18])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f0a3a0b1-6615-11e9-92d7-bc764e045a96;
 Tue, 23 Apr 2019 22:20:03 +0000 (UTC)
Date: Tue, 23 Apr 2019 22:19:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1556058002;
 bh=K2kJtFM6ABUcDmqBxQ0mfN0Lj39Rde5TkyYpn9YV03g=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=RP8aJbhGCk5MMNZS1Kk3iW/0bjxURYG9ys6PVO12guNH4TzR4HVyHLcepy1XPx/1r
 l1Urie2bFE4s98CJR+iCDHGd/7j20CW4hfO8WSkc1yNk2ZW5kyPWaq11GM8pw1GNA1
 VT55t2BUxwURAzD3v/TJ8CZlHx+1Oy1YSG5XK2jE=
To: Andrew Cooper <andrew.cooper3@citrix.com>
From: Mathieu Tarral <mathieu.tarral@protonmail.com>
Message-ID:
 <4bw3GEWrE8TR_TIqQfBK8r_F_ht2GYQau98zRmHh_QrhlPTjA1g_tXOKfEf1dJP6NrldST3z850PBzkXXAXpB4clS0cCEfXRXGD_muK8iCM=@protonmail.com>
In-Reply-To: <JtM5mkq2NGVy1FZByrNH__YS8zpSo5mWd7ksop9Ns7mUipPKalor78NIFupEwb6a_vjRT5QxTSepTr_o3wqnPuNXL9BLZn5-EXCJ8pezVIQ=@protonmail.com>
References: <YOhUr-yh3i9FqDqcdQqL11UtyVP7-YReXRJkQKBvuECQRZNHOrOcihig0vnBkLiEj4StXz6rFVftF7Zl4q14uG-CayajSBtGdke6doinhgI=@protonmail.com>
 <a04c5946-8c2a-72bd-0011-3cb53fd927be@citrix.com>
 <JtM5mkq2NGVy1FZByrNH__YS8zpSo5mWd7ksop9Ns7mUipPKalor78NIFupEwb6a_vjRT5QxTSepTr_o3wqnPuNXL9BLZn5-EXCJ8pezVIQ=@protonmail.com>
Feedback-ID: 7ARND6YmrAEqSXE0j3TLm6ZqYiFFaDDEkO_KW8fTUEW0kYwGM1KEsuPxEPVWH5YuEnR43INtqwIKH-usvnxVQQ==:Ext:ProtonMail
MIME-Version: 1.0
Subject: Re: [Xen-devel] VMI: singlestep event not received
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
Reply-To: Mathieu Tarral <mathieu.tarral@protonmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190423221955.yA1sYKYnhQCPFlpPM72aUsD4ewPiC9rgQqRehUOwmuY@z>

PiBBbHNvLCBpdCdzIG5vdCB0aGUgZmlyc3QgdGltZSBpJ20gaGF2aW5nIHRoaXMgYnVnLAo+IEkg
d2FzIGFscmVhZHkgd29ya2luZyBvbiBYZW4gNiBtb250aHMgYmVmb3JlOgo+IGh0dHBzOi8vZ2l0
aHViLmNvbS9saWJ2bWkvbGlidm1pL2lzc3Vlcy82MzYKCkkgZm9yZ290IHRvIGFkZCB0aGF0IEkg
d2FzIHJ1bm5pbmcgWGVuIGJhcmUtbWV0YWwgYXQgdGhhdCB0aW1lLApzbyB5ZXMsIHRoZSBidWcg
aXMgcmVwcm9kdWNpYmxlIHdpdGhvdXQgS1ZNIGFuZCBuZXN0ZWQgdmlydHVhbGl6YXRpb24uCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
