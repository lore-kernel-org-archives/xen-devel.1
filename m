Return-Path: <SRS0=LbOi=SU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4714C10F0E
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 16:32:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDC202183F
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 16:32:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDC202183F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hH9xH-0001zF-Kg; Thu, 18 Apr 2019 16:32:07 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tvKn=SU=citrix.com=prvs=004dc2360=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hH9xG-0001z1-HH
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 16:32:06 +0000
X-Inumbo-ID: 802a5459-61f7-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 802a5459-61f7-11e9-92d7-bc764e045a96;
 Thu, 18 Apr 2019 16:32:05 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,366,1549929600"; d="scan'208";a="83913760"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 18 Apr 2019 17:31:39 +0100
Message-ID: <20190418163158.11408-3-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
References: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 02/21] selecthost: Honour new $none_ok
 optional parameter
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
Message-ID: <20190418163139.aw8pD4suzUTQTe1hbg7lUataTmjfMF96dDi6gBm33es@z>

Tm8gZnVuY3Rpb25hbCBjaGFuZ2Ugd2l0aCBleGlzdGluZyBjYWxsZXJzLgoKU2lnbmVkLW9mZi1i
eTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogT3NzdGVzdC9U
ZXN0U3VwcG9ydC5wbSB8IDExICsrKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRp
b25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL09zc3Rlc3QvVGVzdFN1cHBvcnQu
cG0gYi9Pc3N0ZXN0L1Rlc3RTdXBwb3J0LnBtCmluZGV4IGVjODY3ZTRmLi4zOGMxN2Q2MCAxMDA2
NDQKLS0tIGEvT3NzdGVzdC9UZXN0U3VwcG9ydC5wbQorKysgYi9Pc3N0ZXN0L1Rlc3RTdXBwb3J0
LnBtCkBAIC0xMTI1LDkgKzExMjUsOSBAQCBzdWIgcG93ZXJfc3RhdGUgKCQkOyQpIHsKIAogIy0t
LS0tLS0tLS0gaG9zdCBzZWxlY3Rpb24gYW5kIHByb3BlcnRpZXMgLS0tLS0tLS0tLQogCi1zdWIg
c2VsZWN0aG9zdCAoJCk7Ci1zdWIgc2VsZWN0aG9zdCAoJCkgewotICAgIG15ICgkaWRlbnQpID0g
QF87CitzdWIgc2VsZWN0aG9zdCAoJDskKTsKK3N1YiBzZWxlY3Rob3N0ICgkOyQpIHsKKyAgICBt
eSAoJGlkZW50LCAkbm9uZV9vaykgPSBAXzsKICAgICAjIG11c3QgYmUgcnVuIG91dHNpZGUgdHJh
bnNhY3Rpb24KIAogICAgICMgJGlkZW50IGlzIDxpZGVudHNwZWM+CkBAIC0xMTU0LDcgKzExNTQs
MTAgQEAgc3ViIHNlbGVjdGhvc3QgKCQpIHsKICAgICAgICAgJHJ7JGlkZW50fT0gJG5hbWU7CiAg
ICAgfSBlbHNlIHsKICAgICAgICAgJG5hbWU9ICRyeyRpZGVudH07Ci0gICAgICAgIGRpZSAibm8g
c3BlY2lmaWVkICRpZGVudCIgdW5sZXNzIGRlZmluZWQgJG5hbWU7CisJaWYgKCFkZWZpbmVkICRu
YW1lKSB7CisJICAgIHJldHVybiB1bmRlZiBpZiAkbm9uZV9vazsKKwkgICAgZGllICJubyBzcGVj
aWZpZWQgJGlkZW50IjsKKwl9CiAgICAgfQogCiAgICAgbXkgJGhvPSB7Ci0tIAoyLjExLjAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
