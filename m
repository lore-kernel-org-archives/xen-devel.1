Return-Path: <SRS0=LbOi=SU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D18B0C10F0E
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 16:32:24 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A99012183F
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 16:32:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A99012183F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hH9xM-00024I-Sa; Thu, 18 Apr 2019 16:32:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tvKn=SU=citrix.com=prvs=004dc2360=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hH9xK-00022D-W2
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 16:32:11 +0000
X-Inumbo-ID: 8354c13e-61f7-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8354c13e-61f7-11e9-92d7-bc764e045a96;
 Thu, 18 Apr 2019 16:32:10 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,366,1549929600"; d="scan'208";a="83913784"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 18 Apr 2019 17:31:53 +0100
Message-ID: <20190418163158.11408-17-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
References: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 16/21] ts-host-allocate-Executive: Break
 out $now and add a newline
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190418163153.getRCOj2ApgH8oidZbs3cIjF3kbI5rWCHRhiuxrj3ws@z>

UHJlcCB3b3JrLCBubyBmdW5jdGlvbmFsIGNoYW5nZS4KClNpZ25lZC1vZmYtYnk6IElhbiBKYWNr
c29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIHRzLWhvc3RzLWFsbG9jYXRlLUV4
ZWN1dGl2ZSB8IDQgKysrLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL3RzLWhvc3RzLWFsbG9jYXRlLUV4ZWN1dGl2ZSBiL3RzLWhv
c3RzLWFsbG9jYXRlLUV4ZWN1dGl2ZQppbmRleCAzZGExMzhiMS4uMzQyNWM4Y2UgMTAwNzU1Ci0t
LSBhL3RzLWhvc3RzLWFsbG9jYXRlLUV4ZWN1dGl2ZQorKysgYi90cy1ob3N0cy1hbGxvY2F0ZS1F
eGVjdXRpdmUKQEAgLTc1NiwxMiArNzU2LDE0IEBAIHN1YiBhdHRlbXB0X2FsbG9jYXRpb24gewog
CWxvZ20oImhvc3QgYWxsb2NhdGlvbjogc3VjY2Vzc2Z1bCwgcmVwb3J0aW5nIHRvIHBsYW5uZXIu
Iik7CiAgICAgfSBlbHNlIHsKIAlsb2dtKCJob3N0IGFsbG9jYXRpb246IHBsYW5uZWQgc3RhcnQg
aW4gJGJlc3QtPntTdGFydH0gc2Vjb25kcy4iKTsKKwogCW15ICRtYXh3YWl0ID0gJHJ7aG9zdGFs
bG9jX21heHdhaXRfbWF4fTsKKwlteSAkbm93ID0gdGltZSAvLyBkaWUgJCE7CiAJaWYgKGRlZmlu
ZWQgJG1heHdhaXQpIHsKIAkgICAgIyBXZSBxdWl0IGlmOgogCSAgICAjICAqIHdlIGhhdmUgYmVl
biB3YWl0aW5nIGF0IGxlYXN0ICRtYXh3YWl0LzIKIAkgICAgIyAgKiB3ZSBlc3RpbWF0ZSBpdCB3
aWxsIHRha2UgYXQgbGVhc3QgJG1heHdhaXQgb3ZlcmFsbAotCSAgICBteSAkd2FpdF9zb2ZhciA9
ICh0aW1lIC8vIGRpZSAkISkgLSAkYWxsb2Nfc3RhcnRfdGltZTsKKwkgICAgbXkgJHdhaXRfc29m
YXIgPSAkbm93IC0gJGFsbG9jX3N0YXJ0X3RpbWU7CiAJICAgIGRpZSAidGltZWQgb3V0OiAkd2Fp
dF9zb2ZhciwgJGJlc3QtPntTdGFydH0sICRtYXh3YWl0IgogICAgICAgICAgICAgICAgIGlmICR3
YWl0X3NvZmFyID4gJG1heHdhaXQvMgogCQkmJiAkd2FpdF9zb2ZhciArICRiZXN0LT57U3RhcnR9
ID4gJG1heHdhaXQ7Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
