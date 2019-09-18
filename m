Return-Path: <SRS0=diO+=XN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2953C4CEC9
	for <xen-devel@archiver.kernel.org>; Wed, 18 Sep 2019 14:20:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0B9421924
	for <xen-devel@archiver.kernel.org>; Wed, 18 Sep 2019 14:20:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="auRIeZWm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0B9421924
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAaoQ-0000Sz-Sp; Wed, 18 Sep 2019 14:20:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XtMR=XN=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iAaoP-0000Hg-AG
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 14:20:05 +0000
X-Inumbo-ID: 67d39c0c-da1f-11e9-9637-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 67d39c0c-da1f-11e9-9637-12813bfff9fa;
 Wed, 18 Sep 2019 14:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568816404;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vDVXmZBkU0vZ3xRVVURrINhdkb12ehO+k1IbVA+e2rA=;
 b=auRIeZWmecbYTHTz698U2RZVo6X5yr+PabGLt+FTeOR9XCMVG32q/g4w
 eZaPzmWbidCuqbAYWti6aBvSQgYlw1HyZn6OaWshoSRDt+MnYqDadDSbV
 RiCgTmg90q2tLmsRJ4ExPu6F1XZNkLNJhTshRhC0PdYfzd4CywJPwu5MQ k=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: STjo2K8nU29fi4u9NZ6DVRBb2S9uzLlA8drdBpAsGsa3C6FB/V67Ta8+dOFT0zsjDX28hL9VMA
 HinaGKf+eQmplcLoBcXO+QBYkPQH6jC6id5uaO5C97GD35wEZFV8Kcdl6HGZhtIkMftr7i89zV
 EUh50/Ltg//bH5pNqndxyXFq0X5VlGFlepX0HXRjthN3lE4JorcFeMQ7+LOqEH9UPQTj/zDhRz
 l4aSbVwk07e7QBpGESedZUenQES8QbkaLpizVt7KtaE7SubzWArynZJHW/+U/fA7FLW/gbLro+
 sMc=
X-SBRS: 2.7
X-MesageID: 5730914
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,520,1559534400"; 
   d="scan'208";a="5730914"
Date: Wed, 18 Sep 2019 15:20:00 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20190918142000.GM1308@perard.uk.xensource.com>
References: <20190802153606.32061-1-anthony.perard@citrix.com>
 <20190802153606.32061-9-anthony.perard@citrix.com>
 <23937.4506.366843.383849@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <23937.4506.366843.383849@mariner.uk.xensource.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [PATCH 08/35] libxl: Replace
 libxl__qmp_initializations by ev_qmp calls
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBTZXAgMTcsIDIwMTkgYXQgMDY6MDI6MThQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gQW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIDA4LzM1XSBsaWJ4bDogUmVwbGFj
ZSBsaWJ4bF9fcW1wX2luaXRpYWxpemF0aW9ucyBieSBldl9xbXAgY2FsbHMiKToKPiA+IFNldHVw
IGEgdGltZW91dCBvZiAxMHMgZm9yIGFsbCB0aGUgY29tbWFuZHMuIEl0IHVzZWQgdG8gYmUgYWJv
dXQgNXMKPiA+IHBlciBjb21tYW5kcy4KPiAKPiBUaGlzIHBhdGNoIGlzIHF1aXRlIGhhcmQgdG8g
cmV2aWV3IGJlY2F1c2UgaXQgaXMgYQo+IHJld3JpdGUvcmVhcnJhbmdlbWVudCBhbmQgSSBjYW4n
dCBzZWUgd2hlcmUgYWxsIHRoZSBwaWVjZXMgY29tZSBmcm9tLgo+IAo+IEhvdyBoYXJkIHdvdWxk
IGl0IGJlIHRvIG1ha2UgYSBwcmUtcGF0Y2ggdG8gc2h1ZmZsZSB0aGUgY29kZSB0byB0aGUKPiBz
YW1lIHBsYWNlIGFzIGl0J3MgZ29pbmcsIGFuZCBjaGFuZ2UgdGhlIHZhcmlhYmxlIG5hbWVzIGV0
Yy4gPwoKSSB0aGluayB0aGF0IHdvdWxkIGJlIHBvc3NpYmxlLCB3aXRoIGEgZmV3IFhYWCBjb21t
ZW50cyBmb3Igc29tZQppbnRlcm1lZGlhcnkgY29kZS4KCkknbGwgZ2l2ZSBpdCBhIHRyeS4KCj4g
SWYgdGhhdCdzIGhhcmQgdGhlbiBJIGd1ZXNzIEkgY2FuIGdvIHRocm91Z2ggaXQgbGluZSBieSBs
aW5lLi4uCj4gCj4gVGhhbmtzLAo+IElhbi4KCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
