Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7E1AC10F14
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:26:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D16B20850
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:26:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D16B20850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEEAx-000811-KZ; Wed, 10 Apr 2019 14:26:07 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAb-00075X-5b
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:45 +0000
X-Inumbo-ID: 8630bb5e-5b9c-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8630bb5e-5b9c-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 14:25:43 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="83227726"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 10 Apr 2019 15:23:50 +0100
Message-ID: <20190410142408.22848-45-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 44/62] Debian:
 preseed_hook_installscript: New $atonce option
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
Message-ID: <20190410142350.N4m9niMj90aZ3Pm8LtCo6o8QNTf8AKroajU2Md-KSDU@z>

VGhpcyBydW5zIHRoZSBzY3JpcHQgcmlnaHQgYXdheSBhcyB3ZWxsIGFzIG1lcmVseSBpbnN0YWxs
aW5nIGl0LgoKU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJp
eC5jb20+Ci0tLQogT3NzdGVzdC9EZWJpYW4ucG0gfCA5ICsrKysrKy0tLQogMSBmaWxlIGNoYW5n
ZWQsIDYgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Pc3N0ZXN0
L0RlYmlhbi5wbSBiL09zc3Rlc3QvRGViaWFuLnBtCmluZGV4IDNhZmVhNjJiLi5kMWI1MmI1YiAx
MDA2NDQKLS0tIGEvT3NzdGVzdC9EZWJpYW4ucG0KKysrIGIvT3NzdGVzdC9EZWJpYW4ucG0KQEAg
LTE0ODIsMjAgKzE0ODIsMjMgQEAgc3ViIHByZXNlZWRfaG9va19jb21tYW5kICgkJCQkKSB7CiAg
ICAgcHVzaCBAeyAkcHJlc2VlZF9jbWRzeyRkaV9rZXl9IH0sICRjbWRfY21kOwogfQogCi1zdWIg
cHJlc2VlZF9ob29rX2luc3RhbGxzY3JpcHQgKCQkJCQkKSB7Ci0gICAgbXkgKCRobywgJHNmeCwg
JGluc3RhbGxlcl9kaXIsICRpbnN0YWxsZXJfbGVhZiwgJGRhdGEpID0gQF87CitzdWIgcHJlc2Vl
ZF9ob29rX2luc3RhbGxzY3JpcHQgKCQkJCQkOyQpIHsKKyAgICBteSAoJGhvLCAkc2Z4LCAkaW5z
dGFsbGVyX2RpciwgJGluc3RhbGxlcl9sZWFmLCAkZGF0YSwgJGF0b25jZSkgPSBAXzsKICAgICAj
IHRoZSBzcGVjaWZpZWQgc2NyaXB0IGlzIGluc3RhbGxlZCB2aWEgcGFydG1hbi9lYXJseV9jb21t
YW5kCiAgICAgbXkgJGluc3RhbGxlcl9wYXRobmFtZT0gIiRpbnN0YWxsZXJfZGlyLyRpbnN0YWxs
ZXJfbGVhZiI7CiAgICAgbXkgJHVybGZpbGU9ICRpbnN0YWxsZXJfcGF0aG5hbWU7CiAgICAgJHVy
bGZpbGUgPX4gcy9bXi1fMC05YS16XS8gc3ByaW50ZiAiWCUwMngiLCBvcmQoJCYpIC9nZTsKICAg
ICBteSAkdXJsPSBjcmVhdGVfd2ViZmlsZSgkaG8sICR1cmxmaWxlLCAkZGF0YSk7Ci0gICAgcHJl
c2VlZF9ob29rX2NvbW1hbmQoJGhvLCAncGFydG1hbi9lYXJseV9jb21tYW5kJywgJHNmeCwgPDxF
TkQpOworICAgIHByZXNlZWRfaG9va19jb21tYW5kKCRobywgJ3BhcnRtYW4vZWFybHlfY29tbWFu
ZCcsICRzZngsCisJCQkgPDxFTkQuKCRhdG9uY2U/PDxFTkRfQVRPTkNFOicnKSk7CiAjIS9iaW4v
c2gKIHNldCAtZXgKIG1rZGlyIC1wICckaW5zdGFsbGVyX2RpcicKICRwcmVzZWVkX3dnZXQgLU8g
JyRpbnN0YWxsZXJfcGF0aG5hbWUnICckdXJsJwogY2htb2QgK3ggJyRpbnN0YWxsZXJfcGF0aG5h
bWUnCiBFTkQKKyckaW5zdGFsbGVyX3BhdGhuYW1lJworRU5EX0FUT05DRQogfQogCiBzdWIgcHJl
c2VlZF9ob29rX292ZXJsYXkgKCQkJCQpIHsKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
