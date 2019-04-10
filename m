Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0063C10F14
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:25:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C674720850
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:25:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C674720850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEEAU-0006or-87; Wed, 10 Apr 2019 14:25:38 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAO-0006aY-UQ
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:32 +0000
X-Inumbo-ID: 7eed128e-5b9c-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7eed128e-5b9c-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 14:25:31 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="83227713"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 10 Apr 2019 15:23:43 +0100
Message-ID: <20190410142408.22848-38-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 37/62] TestSupport: Provide
 target_getfile_root_stash
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
Message-ID: <20190410142343.Kx3ZGwgtYESqjgkWcElNkHOQvUYpjN7Y5O5S3rciY2o@z>

VGhpcyBjb252ZW5pZW50IGZ1bmN0aW9uIHNlbGVjdHMgYSBsb2NhbCBmaWxlbmFtZSBiYXNlZCBv
biBhIHRhcmdldApmaWxlbmFtZSwgYW5kIGNvcGllcyB0aGUgdGFyZ2V0IGZpbGUgdG8gdGhlIHNl
bGVjdGVkIHN0YXNoIGZpbGUuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tz
b25AZXUuY2l0cml4LmNvbT4KLS0tCiBPc3N0ZXN0L1Rlc3RTdXBwb3J0LnBtIHwgOSArKysrKysr
KysKIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Pc3N0ZXN0
L1Rlc3RTdXBwb3J0LnBtIGIvT3NzdGVzdC9UZXN0U3VwcG9ydC5wbQppbmRleCBhNTg3MGU0ZC4u
ZWM4NjdlNGYgMTAwNjQ0Ci0tLSBhL09zc3Rlc3QvVGVzdFN1cHBvcnQucG0KKysrIGIvT3NzdGVz
dC9UZXN0U3VwcG9ydC5wbQpAQCAtNjEsNiArNjEsNyBAQCBCRUdJTiB7CiAgICAgICAgICAgICAg
ICAgICAgICAgdGFyZ2V0X2NtZF9pbnB1dGZoX3Jvb3Qgc3NodWhvCiAgICAgICAgICAgICAgICAg
ICAgICAgdGFyZ2V0X2dldGZpbGUgdGFyZ2V0X2dldGZpbGVfcm9vdAogICAgICAgICAgICAgICAg
ICAgICAgIHRhcmdldF9wdXRmaWxlIHRhcmdldF9wdXRmaWxlX3Jvb3QKKwkJICAgICAgdGFyZ2V0
X2dldGZpbGVfcm9vdF9zdGFzaAogICAgICAgICAgICAgICAgICAgICAgIHRhcmdldF9wdXRmaWxl
Y29udGVudHNfc3Rhc2gKIAkJICAgICAgdGFyZ2V0X3B1dGZpbGVjb250ZW50c19yb290X3N0YXNo
CiAgICAgICAgICAgICAgICAgICAgICAgdGFyZ2V0X3B1dF9ndWVzdF9pbWFnZSB0YXJnZXRfZWRp
dGZpbGUKQEAgLTU1Myw2ICs1NTQsMTQgQEAgc3ViIHRhcmdldF9nZXRmaWxlX3Jvb3QgKCQkJCQp
IHsKICAgICBteSAoJGhvLCR0aW1lb3V0LCAkcnNyYywkbGRzdCkgPSBAXzsKICAgICB0Z2V0Zmls
ZWV4KCdyb290JywgQF8pOwogfQorc3ViIHRhcmdldF9nZXRmaWxlX3Jvb3Rfc3Rhc2ggKCQkJDsk
KSB7CisgICAgbXkgKCRobywkdGltZW91dCwkcnNyYywgJGxsZWFmKSA9IEBfOyAjID0+IGZ1bGwg
cGF0aCBvZiBsb2NhbCBmaWxlCisgICAgdGFyZ2V0X3NvbWVmaWxlX2xlYWYoXCRsbGVhZiwgJHJz
cmMsICRobyk7CisgICAgb3Blbl91bmlxdWVfc3Rhc2hmaWxlKFwkbGxlYWYpOyAjIGRpc2NhcmQg
ZmlsZWhhbmRsZSwgbGVhdmUgZmlsZQorICAgIG15ICRsZmlsZSA9ICIkc3Rhc2gvJGxsZWFmIjsK
KyAgICB0YXJnZXRfZ2V0ZmlsZV9yb290KCRobywkdGltZW91dCwkcnNyYywkbGZpbGUpOworICAg
IHJldHVybiAkbGZpbGU7Cit9CiAKIHN1YiB0cHV0ZmlsZWV4IHsKICAgICBteSAoJHJ1c2VyLCAk
aG8sJHRpbWVvdXQsICRsc3JjLCRyZHN0LCAkcnN5bmMpID0gQF87Ci0tIAoyLjExLjAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
