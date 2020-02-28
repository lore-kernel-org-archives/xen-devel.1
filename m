Return-Path: <SRS0=X6vN=4Q=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12EB5C3F2CD
	for <xen-devel@archiver.kernel.org>; Fri, 28 Feb 2020 16:29:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2DA0246A0
	for <xen-devel@archiver.kernel.org>; Fri, 28 Feb 2020 16:29:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2DA0246A0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7iVx-0006s3-Pv; Fri, 28 Feb 2020 16:29:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F9pE=4Q=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j7iVw-0006rx-G1
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 16:29:24 +0000
X-Inumbo-ID: 7a8fecbc-5a47-11ea-99a2-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7a8fecbc-5a47-11ea-99a2-12813bfff9fa;
 Fri, 28 Feb 2020 16:29:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 166DFACE8;
 Fri, 28 Feb 2020 16:29:23 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200219174354.84726-1-roger.pau@citrix.com>
 <20200219174354.84726-7-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <616f1cd4-e660-97a5-b326-12ca001bfb7d@suse.com>
Date: Fri, 28 Feb 2020 17:29:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200219174354.84726-7-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 6/7] xen/guest: prepare hypervisor ops to
 use alternative calls
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
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDIuMjAyMCAxODo0MywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMKPiArKysgYi94ZW4vYXJjaC94ODYvZ3Vlc3Qv
aHlwZXJ2L2h5cGVydi5jCj4gQEAgLTE5OSw3ICsxOTksNyBAQCBzdGF0aWMgdm9pZCBfX2luaXQg
ZTgyMF9maXh1cChzdHJ1Y3QgZTgyMG1hcCAqZTgyMCkKPiAgICAgICAgICBwYW5pYygiVW5hYmxl
IHRvIHJlc2VydmUgSHlwZXItViBoeXBlcmNhbGwgcmFuZ2VcbiIpOwo+ICB9Cj4gIAo+IC1zdGF0
aWMgY29uc3Qgc3RydWN0IGh5cGVydmlzb3Jfb3BzIG9wcyA9IHsKPiArc3RhdGljIGNvbnN0IHN0
cnVjdCBoeXBlcnZpc29yX29wcyBfX2luaXRkYXRhIG9wcyA9IHsKClRoaXMgbmVlZHMgdG8gYmUg
X19pbml0Y29uc3RyZWwgaW4gb3JkZXIgdG8gYXZvaWQgdHJpZ2dlcmluZwoocG9zc2libHkgb25s
eSBpbiB0aGUgZnV0dXJlKSBzZWN0aW9uIG1pc21hdGNoIHdhcm5pbmdzIHdpdGgKYXQgbGVhc3Qg
c29tZSBnY2MgdmVyc2lvbnMuIFdpdGggdGhpcyBhbmQgdGhlIG90aGVyIGluc3RhbmNlCmFkanVz
dGVkClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpKYW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
