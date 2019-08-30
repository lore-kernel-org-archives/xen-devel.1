Return-Path: <SRS0=lSNx=W2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9827FC3A59B
	for <xen-devel@archiver.kernel.org>; Fri, 30 Aug 2019 13:42:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EC3521726
	for <xen-devel@archiver.kernel.org>; Fri, 30 Aug 2019 13:42:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EC3521726
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3hAU-0006Nl-0R; Fri, 30 Aug 2019 13:42:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xdvb=W2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i3hAT-0006Ne-HF
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2019 13:42:21 +0000
X-Inumbo-ID: fad9e8a6-cb2b-11e9-951b-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fad9e8a6-cb2b-11e9-951b-bc764e2007e4;
 Fri, 30 Aug 2019 13:42:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2C812B06B;
 Fri, 30 Aug 2019 13:42:16 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <793a54c4-902f-ca02-357f-5080f938e0d6@suse.com>
Message-ID: <148854d8-4911-8319-2d90-ad12201dd9c3@suse.com>
Date: Fri, 30 Aug 2019 15:42:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <793a54c4-902f-ca02-357f-5080f938e0d6@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH v2 3/3] x86: shrink video_{flags, mode} to {8,
 16} bits
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2UgcmVhbGx5IGRvbid0IG5lZWQgdGhlbSB0byBiZSBhbnkgd2lkZXIuCgpBbHNvIHJlbW92ZSB0
aGUgQyBsZXZlbCBkZWNsYXJhdGlvbiAoYW5kIGhlbmNlIGFsc28gdGhlIEdMT0JBTCkgb2YKdmlk
ZW9fbW9kZSBhbHRvZ2V0aGVyOyBpdCdzIHVzZWQgaW4gYXNzZW1ibHkgY29kZSBvbmx5LgoKU3Vn
Z2VzdGVkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Ci0tLQp2MjogTmV3LgoK
LS0tIGEveGVuL2FyY2gveDg2L2Jvb3Qvd2FrZXVwLlMKKysrIGIveGVuL2FyY2gveDg2L2Jvb3Qv
d2FrZXVwLlMKQEAgLTgyLDEwICs4Miw5IEBAIGJvZ3VzX3JlYWxfbWFnaWM6CiAKICAgICAgICAg
LmFsaWduIDQKIHJlYWxfbWFnaWM6ICAgICAubG9uZyAweDEyMzQ1Njc4Ci1HTE9CQUwodmlkZW9f
bW9kZSkKLSAgICAgICAgLmxvbmcgMAordmlkZW9fbW9kZTogICAgIC53b3JkIDAKIEdMT0JBTCh2
aWRlb19mbGFncykKLSAgICAgICAgLmxvbmcgMAorICAgICAgICAuYnl0ZSAwCiAKICAgICAgICAg
LmNvZGUzMgogCi0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvY29uZmlnLmgKKysrIGIveGVuL2lu
Y2x1ZGUvYXNtLXg4Ni9jb25maWcuaApAQCAtOTksNyArOTksOSBAQCBleHRlcm4gY2hhciB0cmFt
cG9saW5lX3JlYWxtb2RlX2VudHJ5W107CiBleHRlcm4gdW5zaWduZWQgaW50IHRyYW1wb2xpbmVf
eGVuX3BoeXNfc3RhcnQ7CiBleHRlcm4gdW5zaWduZWQgY2hhciB0cmFtcG9saW5lX2NwdV9zdGFy
dGVkOwogZXh0ZXJuIGNoYXIgd2FrZXVwX3N0YXJ0W107Ci1leHRlcm4gdW5zaWduZWQgaW50IHZp
ZGVvX21vZGUsIHZpZGVvX2ZsYWdzOworCitleHRlcm4gdW5zaWduZWQgY2hhciB2aWRlb19mbGFn
czsKKwogZXh0ZXJuIHVuc2lnbmVkIHNob3J0IGJvb3RfZWRpZF9jYXBzOwogZXh0ZXJuIHVuc2ln
bmVkIGNoYXIgYm9vdF9lZGlkX2luZm9bMTI4XTsKICNlbmRpZgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
