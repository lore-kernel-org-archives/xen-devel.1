Return-Path: <SRS0=XxxO=ZA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E21DFA372C
	for <xen-devel@archiver.kernel.org>; Fri,  8 Nov 2019 15:24:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45AD62178F
	for <xen-devel@archiver.kernel.org>; Fri,  8 Nov 2019 15:24:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45AD62178F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iT67V-0006G2-Ty; Fri, 08 Nov 2019 15:24:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=PKBE=ZA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iT67U-0006Fo-7c
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2019 15:24:16 +0000
X-Inumbo-ID: cfe18982-023b-11ea-984a-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cfe18982-023b-11ea-984a-bc764e2007e4;
 Fri, 08 Nov 2019 15:24:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F2E6AB455;
 Fri,  8 Nov 2019 15:24:09 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <13e82227-1de3-fd48-bd0f-99f07fca21db@suse.com>
Message-ID: <2e8a579e-0c56-effd-4c40-c2060356df05@suse.com>
Date: Fri, 8 Nov 2019 16:24:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <13e82227-1de3-fd48-bd0f-99f07fca21db@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH v2 3/3] x86: provide Dom0 access to PPIN via
 XENPF_resource_op
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

SXQgd2FzIHJlcXVlc3RlZCB0aGF0IHdlIHByb3ZpZGUgYSB3YXkgaW5kZXBlbmRlbnQgb2YgdGhl
IE1DRSByZXBvcnRpbmcKaW50ZXJmYWNlIHRoYXQgRG9tMCBzb2Z0d2FyZSBjb3VsZCB1c2UgdG8g
Z2V0IGhvbGQgb2YgdGhlIHZhbHVlcyBmb3IKcGFydGljdWxhciBDUFVzLgoKU2lnbmVkLW9mZi1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgotLS0KdjI6IE5ldy4KClRCRDogSSBj
b3VsZG4ndCBpZGVudGlmeSBhbnkgc3VpdGFibGUgdXRpbGl0eSB1bmRlciB0b29scy9taXNjLyB0
aGF0IEkKICAgICB3b3VsZCBoYXZlIGZlbHQgbGlrZSBtYWtpbmcgdGhlIGZyb250ZW5kIG9mIHRo
aXMgZXh0ZW5zaW9uLgoKLS0tIGEveGVuL2FyY2gveDg2L3BsYXRmb3JtX2h5cGVyY2FsbC5jCisr
KyBiL3hlbi9hcmNoL3g4Ni9wbGF0Zm9ybV9oeXBlcmNhbGwuYwpAQCAtMzAsNiArMzAsNyBAQAog
I2luY2x1ZGUgPGFzbS9tdHJyLmg+CiAjaW5jbHVkZSA8YXNtL2lvX2FwaWMuaD4KICNpbmNsdWRl
IDxhc20vc2V0dXAuaD4KKyNpbmNsdWRlICJjcHUvbWNoZWNrL21jZS5oIgogI2luY2x1ZGUgImNw
dS9tdHJyL210cnIuaCIKICNpbmNsdWRlIDx4c20veHNtLmg+CiAKQEAgLTk0LDYgKzk1LDkgQEAg
dm9pZCBjaGVja19yZXNvdXJjZV9hY2Nlc3Moc3RydWN0IHJlc291cgogICAgICAgICBzd2l0Y2gg
KCBlbnRyeS0+dS5jbWQgKQogICAgICAgICB7CiAgICAgICAgIGNhc2UgWEVOX1JFU09VUkNFX09Q
X01TUl9SRUFEOgorICAgICAgICAgICAgaWYgKCBwcGluX21zciAmJiBlbnRyeS0+aWR4ID09IHBw
aW5fbXNyICkKKyAgICAgICAgICAgICAgICBicmVhazsKKyAgICAgICAgICAgIC8qIGZhbGwgdGhy
b3VnaCAqLwogICAgICAgICBjYXNlIFhFTl9SRVNPVVJDRV9PUF9NU1JfV1JJVEU6CiAgICAgICAg
ICAgICBpZiAoIGVudHJ5LT5pZHggPj4gMzIgKQogICAgICAgICAgICAgICAgIHJldCA9IC1FSU5W
QUw7CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
