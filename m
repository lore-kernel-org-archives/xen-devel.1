Return-Path: <SRS0=lSNx=W2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1D17C3A5A3
	for <xen-devel@archiver.kernel.org>; Fri, 30 Aug 2019 07:49:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C774B2341B
	for <xen-devel@archiver.kernel.org>; Fri, 30 Aug 2019 07:49:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C774B2341B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3beb-0002Cz-2m; Fri, 30 Aug 2019 07:49:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xdvb=W2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i3beZ-0002Cu-0Q
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2019 07:49:03 +0000
X-Inumbo-ID: a1ff81ea-cafa-11e9-8980-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a1ff81ea-cafa-11e9-8980-bc764e2007e4;
 Fri, 30 Aug 2019 07:49:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AD33CB01F;
 Fri, 30 Aug 2019 07:49:01 +0000 (UTC)
To: Chao Gao <chao.gao@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <e184002b-f1f9-c1a1-4c58-1d4623538bd0@eikelenboom.it>
 <20190830020934.GA31575@gao-cwp>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9afe2162-da04-0291-a0bb-ced61871599e@suse.com>
Date: Fri, 30 Aug 2019 09:49:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190830020934.GA31575@gao-cwp>
Content-Language: en-US
Subject: Re: [Xen-devel] [Xen-unstable] boot crash while loading AMD
 microcode due to commit "microcode/amd: fix memory leak"
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
Cc: Sander Eikelenboom <linux@eikelenboom.it>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDguMjAxOSAwNDowOSwgQ2hhbyBHYW8gd3JvdGU6Cj4gT24gRnJpLCBBdWcgMzAsIDIw
MTkgYXQgMDE6MDQ6NTRBTSArMDIwMCwgU2FuZGVyIEVpa2VsZW5ib29tIHdyb3RlOgo+PiBMLlMu
LAo+Pgo+PiBXaGlsZSB0ZXN0aW5nIHhlbi11bnN0YWJsZSwgbXkgQU1EIHN5c3RlbSBjcmFzaGVz
IGR1cmluZyBlYXJseSBib290IHdoaWxlIGxvYWRpbmcgbWljcm9jb2RlIHdpdGggYW4gIkVhcmx5
IGZhdGFsIHBhZ2UgZmF1bHQiLgo+PiBSZXZlcnRpbmcgY29tbWl0IGRlNDVlM2ZmMzdiYjE2MDI3
OTYwNTRhZmFiZmE2MjZlYTU2NjFjNDUgIm1pY3JvY29kZS9hbWQ6IGZpeCBtZW1vcnkgbGVhayIg
Zml4ZXMgdGhlIGJvb3QgaXNzdWUuCj4gCj4gU29ycnkgZm9yIHRoaXMgaW5jb252ZW5pZW5jZS4K
PiAKPiBDb3VsZCB5b3UgYXBwbHkgdGhlIHBhdGNoIGF0dGFjaGVkIGFuZCB0cnkgaXQgYWdhaW4/
CgpJJ20gaW5jbGluZWQgdG8gdGFrZSB0aGlzIGZpeCBldmVuIHdpdGhvdXQgd2FpdGluZyBmb3Ig
U2FuZGVyJ3MKZmVlZGJhY2sgKGFuZCBzaW1wbHkgaW1wbHlpbmcgeW91ciBTLW8tYikuIEFuZHJl
dyAtIHdoYXQgZG8geW91CnRoaW5rPwoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
