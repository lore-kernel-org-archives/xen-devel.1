Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51F1AC10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:26:00 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2911120854
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:26:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2911120854
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEEAc-00079h-R4; Wed, 10 Apr 2019 14:25:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAT-0006nP-Sy
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:37 +0000
X-Inumbo-ID: 81d4d174-5b9c-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 81d4d174-5b9c-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 14:25:36 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="83227724"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 10 Apr 2019 15:23:49 +0100
Message-ID: <20190410142408.22848-44-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 43/62] preseed_hook_installscript: Use
 partman/early_command, not preseed/
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
Message-ID: <20190410142349.yWZSSMoIo_XIHTGoM5FVoUeEf2lNwsDHbW2y0fOAA8c@z>

T24gaXNvLWJhc2VkIGluc3RhbGxzLCB3aXRoIHN0cmV0Y2gsIHByZXNlZWQvZWFybHlfY29tbWFu
ZCBydW5zIGJlZm9yZQp0aGUgbmV0d29yayBpcyB1cC4gIFRoaXMgY2F1c2VzIHRoZSBpbnN0YWxs
IHRvIGZhaWwuCgpPdXIgZXhpc3RpbmcgY2FsbCBzaXRlcyBhZGQgdGhpbmdzIHRvCiAgIC91c3Iv
bGliL2Jhc2UtaW5zdGFsbGVyLmQvCiAgIC9saWIvcGFydG1hbi9pbml0LmQvCmZvciB3aGljaCB0
aGlzIGlzIHN0aWxsIGVhcmx5IGVub3VnaC4KClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxp
YW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIE9zc3Rlc3QvRGViaWFuLnBtIHwgMyArKy0K
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9Pc3N0ZXN0L0RlYmlhbi5wbSBiL09zc3Rlc3QvRGViaWFuLnBtCmluZGV4IGY4ZmY0ZjQ2
Li4zYWZlYTYyYiAxMDA2NDQKLS0tIGEvT3NzdGVzdC9EZWJpYW4ucG0KKysrIGIvT3NzdGVzdC9E
ZWJpYW4ucG0KQEAgLTE0ODQsMTEgKzE0ODQsMTIgQEAgc3ViIHByZXNlZWRfaG9va19jb21tYW5k
ICgkJCQkKSB7CiAKIHN1YiBwcmVzZWVkX2hvb2tfaW5zdGFsbHNjcmlwdCAoJCQkJCQpIHsKICAg
ICBteSAoJGhvLCAkc2Z4LCAkaW5zdGFsbGVyX2RpciwgJGluc3RhbGxlcl9sZWFmLCAkZGF0YSkg
PSBAXzsKKyAgICAjIHRoZSBzcGVjaWZpZWQgc2NyaXB0IGlzIGluc3RhbGxlZCB2aWEgcGFydG1h
bi9lYXJseV9jb21tYW5kCiAgICAgbXkgJGluc3RhbGxlcl9wYXRobmFtZT0gIiRpbnN0YWxsZXJf
ZGlyLyRpbnN0YWxsZXJfbGVhZiI7CiAgICAgbXkgJHVybGZpbGU9ICRpbnN0YWxsZXJfcGF0aG5h
bWU7CiAgICAgJHVybGZpbGUgPX4gcy9bXi1fMC05YS16XS8gc3ByaW50ZiAiWCUwMngiLCBvcmQo
JCYpIC9nZTsKICAgICBteSAkdXJsPSBjcmVhdGVfd2ViZmlsZSgkaG8sICR1cmxmaWxlLCAkZGF0
YSk7Ci0gICAgcHJlc2VlZF9ob29rX2NvbW1hbmQoJGhvLCAnZWFybHlfY29tbWFuZCcsICRzZngs
IDw8RU5EKTsKKyAgICBwcmVzZWVkX2hvb2tfY29tbWFuZCgkaG8sICdwYXJ0bWFuL2Vhcmx5X2Nv
bW1hbmQnLCAkc2Z4LCA8PEVORCk7CiAjIS9iaW4vc2gKIHNldCAtZXgKIG1rZGlyIC1wICckaW5z
dGFsbGVyX2RpcicKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
