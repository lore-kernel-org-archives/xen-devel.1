Return-Path: <SRS0=Qyg3=43=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1DB0C10F27
	for <xen-devel@archiver.kernel.org>; Tue, 10 Mar 2020 15:49:09 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F02820866
	for <xen-devel@archiver.kernel.org>; Tue, 10 Mar 2020 15:49:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F02820866
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBh7r-0002QP-AS; Tue, 10 Mar 2020 15:48:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EhAh=43=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jBh7p-0002QA-Rr
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 15:48:57 +0000
X-Inumbo-ID: a655077d-62e6-11ea-add4-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a655077d-62e6-11ea-add4-12813bfff9fa;
 Tue, 10 Mar 2020 15:48:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5D97AAC42;
 Tue, 10 Mar 2020 15:48:56 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <8f1b522e-8667-c230-6671-7d70252634de@suse.com>
Message-ID: <7dceca7f-f0fc-a4a1-eb9b-0a69ab3f4df1@suse.com>
Date: Tue, 10 Mar 2020 16:48:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <8f1b522e-8667-c230-6671-7d70252634de@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH v2 2/9] x86/HVM: reduce vcpu.h include
 dependencies
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
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RHJvcCAjaW5jbHVkZS1zIG5vdCBuZWVkZWQgYnkgdGhlIGhlYWRlciBpdHNlbGYuIFB1dCB0aGUg
b25lcyBuZWVkZWQKaW50byB3aGljaGV2ZXIgb3RoZXIgZmlsZXMgYWN0dWFsbHkgbmVlZCB0aGVt
LgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgotLS0KdjI6
IFJlLWJhc2Ugb3ZlciBjaGFuZ2VzIHRvIHByZXZpb3VzIHBhdGNoLgoKLS0tIGEveGVuL2FyY2gv
eDg2L2NwdWlkLmMKKysrIGIveGVuL2FyY2gveDg2L2NwdWlkLmMKQEAgLTcsNiArNyw3IEBACiAj
aW5jbHVkZSA8YXNtL2h2bS9odm0uaD4KICNpbmNsdWRlIDxhc20vaHZtL25lc3RlZGh2bS5oPgog
I2luY2x1ZGUgPGFzbS9odm0vc3ZtL3N2bS5oPgorI2luY2x1ZGUgPGFzbS9odm0vdmlyaWRpYW4u
aD4KICNpbmNsdWRlIDxhc20vaHZtL3ZteC92bWNzLmg+CiAjaW5jbHVkZSA8YXNtL3BhZ2luZy5o
PgogI2luY2x1ZGUgPGFzbS9wcm9jZXNzb3IuaD4KLS0tIGEveGVuL2FyY2gveDg2L2h2bS9odm0u
YworKysgYi94ZW4vYXJjaC94ODYvaHZtL2h2bS5jCkBAIC02NSw2ICs2NSw3IEBACiAjaW5jbHVk
ZSA8YXNtL2h2bS9uZXN0ZWRodm0uaD4KICNpbmNsdWRlIDxhc20vaHZtL21vbml0b3IuaD4KICNp
bmNsdWRlIDxhc20vaHZtL2lvcmVxLmg+CisjaW5jbHVkZSA8YXNtL2h2bS92aXJpZGlhbi5oPgog
I2luY2x1ZGUgPGFzbS9odm0vdm1fZXZlbnQuaD4KICNpbmNsdWRlIDxhc20vYWx0cDJtLmg+CiAj
aW5jbHVkZSA8YXNtL210cnIuaD4KLS0tIGEveGVuL2FyY2gveDg2L2h2bS9oeXBlcmNhbGwuYwor
KysgYi94ZW4vYXJjaC94ODYvaHZtL2h5cGVyY2FsbC5jCkBAIC0yMyw2ICsyMyw3IEBACiAjaW5j
bHVkZSA8eGVuL25vc3BlYy5oPgogCiAjaW5jbHVkZSA8YXNtL2h2bS9zdXBwb3J0Lmg+CisjaW5j
bHVkZSA8YXNtL2h2bS92aXJpZGlhbi5oPgogCiAjaW5jbHVkZSA8cHVibGljL2h2bS9odm1fb3Au
aD4KICNpbmNsdWRlIDxwdWJsaWMvaHZtL3BhcmFtcy5oPgotLS0gYS94ZW4vYXJjaC94ODYvaHZt
L3ZpcmlkaWFuL3ByaXZhdGUuaAorKysgYi94ZW4vYXJjaC94ODYvaHZtL3ZpcmlkaWFuL3ByaXZh
dGUuaApAQCAtNCw2ICs0LDcgQEAKICNkZWZpbmUgWDg2X0hWTV9WSVJJRElBTl9QUklWQVRFX0gK
IAogI2luY2x1ZGUgPGFzbS9odm0vc2F2ZS5oPgorI2luY2x1ZGUgPGFzbS9odm0vdmlyaWRpYW4u
aD4KICNpbmNsdWRlIDxwdWJsaWMvaHZtL3BhcmFtcy5oPgogCiBpbnQgdmlyaWRpYW5fc3luaWNf
d3Jtc3Ioc3RydWN0IHZjcHUgKnYsIHVpbnQzMl90IGlkeCwgdWludDY0X3QgdmFsKTsKLS0tIGEv
eGVuL2FyY2gveDg2L21zci5jCisrKyBiL3hlbi9hcmNoL3g4Ni9tc3IuYwpAQCAtMjUsNiArMjUs
NyBAQAogI2luY2x1ZGUgPHhlbi9zY2hlZC5oPgogCiAjaW5jbHVkZSA8YXNtL2RlYnVncmVnLmg+
CisjaW5jbHVkZSA8YXNtL2h2bS92aXJpZGlhbi5oPgogI2luY2x1ZGUgPGFzbS9tc3IuaD4KICNp
bmNsdWRlIDxhc20vc2V0dXAuaD4KIAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS92Y3B1
LmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vdmNwdS5oCkBAIC0yMCw5ICsyMCw3IEBA
CiAjZGVmaW5lIF9fQVNNX1g4Nl9IVk1fVkNQVV9IX18KIAogI2luY2x1ZGUgPHhlbi90YXNrbGV0
Lmg+Ci0jaW5jbHVkZSA8YXNtL2h2bS9pby5oPgogI2luY2x1ZGUgPGFzbS9odm0vdmxhcGljLmg+
Ci0jaW5jbHVkZSA8YXNtL2h2bS92aXJpZGlhbi5oPgogI2luY2x1ZGUgPGFzbS9odm0vdm14L3Zt
Y3MuaD4KICNpbmNsdWRlIDxhc20vaHZtL3ZteC92dm14Lmg+CiAjaW5jbHVkZSA8YXNtL2h2bS9z
dm0vdm1jYi5oPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
