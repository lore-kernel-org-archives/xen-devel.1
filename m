Return-Path: <SRS0=lSNx=W2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDCA9C3A5A4
	for <xen-devel@archiver.kernel.org>; Fri, 30 Aug 2019 08:04:24 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 933C621726
	for <xen-devel@archiver.kernel.org>; Fri, 30 Aug 2019 08:04:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 933C621726
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3bt9-0004Ep-Uk; Fri, 30 Aug 2019 08:04:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=D47i=W2=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1i3bt8-0004Ek-4w
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2019 08:04:06 +0000
X-Inumbo-ID: bb3bfccc-cafc-11e9-b95f-bc764e2007e4
Received: from mga09.intel.com (unknown [134.134.136.24])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bb3bfccc-cafc-11e9-b95f-bc764e2007e4;
 Fri, 30 Aug 2019 08:04:04 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Aug 2019 01:04:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,446,1559545200"; d="scan'208";a="175537930"
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.26])
 by orsmga008.jf.intel.com with ESMTP; 30 Aug 2019 01:04:01 -0700
Date: Fri, 30 Aug 2019 16:08:06 +0800
From: Chao Gao <chao.gao@intel.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190830080804.GA18477@gao-cwp>
References: <e184002b-f1f9-c1a1-4c58-1d4623538bd0@eikelenboom.it>
 <20190830020934.GA31575@gao-cwp>
 <9afe2162-da04-0291-a0bb-ced61871599e@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9afe2162-da04-0291-a0bb-ced61871599e@suse.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Sander Eikelenboom <linux@eikelenboom.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBBdWcgMzAsIDIwMTkgYXQgMDk6NDk6MDRBTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj5PbiAzMC4wOC4yMDE5IDA0OjA5LCBDaGFvIEdhbyB3cm90ZToKPj4gT24gRnJpLCBBdWcg
MzAsIDIwMTkgYXQgMDE6MDQ6NTRBTSArMDIwMCwgU2FuZGVyIEVpa2VsZW5ib29tIHdyb3RlOgo+
Pj4gTC5TLiwKPj4+Cj4+PiBXaGlsZSB0ZXN0aW5nIHhlbi11bnN0YWJsZSwgbXkgQU1EIHN5c3Rl
bSBjcmFzaGVzIGR1cmluZyBlYXJseSBib290IHdoaWxlIGxvYWRpbmcgbWljcm9jb2RlIHdpdGgg
YW4gIkVhcmx5IGZhdGFsIHBhZ2UgZmF1bHQiLgo+Pj4gUmV2ZXJ0aW5nIGNvbW1pdCBkZTQ1ZTNm
ZjM3YmIxNjAyNzk2MDU0YWZhYmZhNjI2ZWE1NjYxYzQ1ICJtaWNyb2NvZGUvYW1kOiBmaXggbWVt
b3J5IGxlYWsiIGZpeGVzIHRoZSBib290IGlzc3VlLgo+PiAKPj4gU29ycnkgZm9yIHRoaXMgaW5j
b252ZW5pZW5jZS4KPj4gCj4+IENvdWxkIHlvdSBhcHBseSB0aGUgcGF0Y2ggYXR0YWNoZWQgYW5k
IHRyeSBpdCBhZ2Fpbj8KPgo+SSdtIGluY2xpbmVkIHRvIHRha2UgdGhpcyBmaXggZXZlbiB3aXRo
b3V0IHdhaXRpbmcgZm9yIFNhbmRlcidzCj5mZWVkYmFjayAoYW5kIHNpbXBseSBpbXBseWluZyB5
b3VyIFMtby1iKS4KCkFjay4KClRoYW5rcwpDaGFvCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
