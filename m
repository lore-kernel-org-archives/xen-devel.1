Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46181C10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:26:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D61321741
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:26:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D61321741
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEEAq-0007j6-Le; Wed, 10 Apr 2019 14:26:00 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAY-0006yJ-Au
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:42 +0000
X-Inumbo-ID: 83d9408f-5b9c-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 83d9408f-5b9c-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 14:25:39 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="83227742"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 10 Apr 2019 15:24:02 +0100
Message-ID: <20190410142408.22848-57-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 56/62] platforms: Pass suite to
 get_arch_platforms
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
Message-ID: <20190410142402.rKvVJPlhsoQ66miYIhCXd2fqrBkjkI5_tCZvts4hGG8@z>

VGhlIGF2YWlsYWJsZSBwbGF0Zm9ybXMgbWF5IGRlcGVuZCBvbiB0aGUgc3VpdGUgdG8gYmUgdXNl
ZC4KCkZvciBub3cgd2UgdXNlICRkZWZzdWl0ZSBmcm9tIG1ha2UtZmxpZ2h0LCB3aGljaCBpcyBu
b3QgZW50aXJlbHkgcmlnaHQKYnV0IGl0IHdpbGwgZG8gZm9yIG5vdyBiZWNhdXNlIHdlIGRvbid0
IHVzZSBvdGhlciBzdWl0ZXMgbXVjaC4KCk5vIGZ1bmN0aW9uYWwgY2hhbmdlIHlldCBzaW5jZSBu
ZWl0aGVyIGltcGxlbWVudGF0aW9uIHVzZXMgaXQuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3Nv
biA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiBPc3N0ZXN0L0hvc3REQi9FeGVjdXRp
dmUucG0gfCA0ICsrLS0KIE9zc3Rlc3QvSG9zdERCL1N0YXRpYy5wbSAgICB8IDQgKystLQogY3Jp
LWdldHBsYXRmb3JtcyAgICAgICAgICAgIHwgMiArLQogbWFrZS1mbGlnaHQgICAgICAgICAgICAg
ICAgIHwgNCArKy0tCiA0IGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9Pc3N0ZXN0L0hvc3REQi9FeGVjdXRpdmUucG0gYi9Pc3N0ZXN0
L0hvc3REQi9FeGVjdXRpdmUucG0KaW5kZXggZDQyMjUwZjYuLmJmNmVjNTdkIDEwMDY0NAotLS0g
YS9Pc3N0ZXN0L0hvc3REQi9FeGVjdXRpdmUucG0KKysrIGIvT3NzdGVzdC9Ib3N0REIvRXhlY3V0
aXZlLnBtCkBAIC05MCw4ICs5MCw4IEBAIEVORAogICAgIHJldHVybiAkZmxhZ3M7CiB9CiAKLXN1
YiBnZXRfYXJjaF9wbGF0Zm9ybXMgKCQkKSB7Ci0gICAgbXkgKCRoZCwgJGJsZXNzaW5nLCAkYXJj
aCkgPSBAXzsKK3N1YiBnZXRfYXJjaF9wbGF0Zm9ybXMgKCQkJCkgeworICAgIG15ICgkaGQsICRi
bGVzc2luZywgJGFyY2gsICRzdWl0ZSkgPSBAXzsKIAogICAgIG15IEBwbGF0cyA9ICggKTsKICAg
ICBteSAkcGxhdHNxID0gJGRiaF90ZXN0cy0+cHJlcGFyZSg8PEVORCk7CmRpZmYgLS1naXQgYS9P
c3N0ZXN0L0hvc3REQi9TdGF0aWMucG0gYi9Pc3N0ZXN0L0hvc3REQi9TdGF0aWMucG0KaW5kZXgg
YWI5NTQyZGQuLjBjNmJlM2VlIDEwMDY0NAotLS0gYS9Pc3N0ZXN0L0hvc3REQi9TdGF0aWMucG0K
KysrIGIvT3NzdGVzdC9Ib3N0REIvU3RhdGljLnBtCkBAIC03Miw4ICs3Miw4IEBAIHN1YiBnZXRf
ZmxhZ3MgKCQkKSB7ICNtZXRob2QKICAgICByZXR1cm4gJGZsYWdzOwogfQogCi1zdWIgZ2V0X2Fy
Y2hfcGxhdGZvcm1zICgkJCkgewotICAgIG15ICgkaGQsICRibGVzc2luZywgJGFyY2gpID0gQF87
CitzdWIgZ2V0X2FyY2hfcGxhdGZvcm1zICgkJCQpIHsKKyAgICBteSAoJGhkLCAkYmxlc3Npbmcs
ICRhcmNoLCAkc3VpdGUpID0gQF87CiAKICAgICBteSAkcHJvcCA9ICJQbGF0Zm9ybXMiLnVjZmly
c3QoJGFyY2gpOwogCmRpZmYgLS1naXQgYS9jcmktZ2V0cGxhdGZvcm1zIGIvY3JpLWdldHBsYXRm
b3JtcwppbmRleCAyYmYxMzQ4My4uMmI4Y2VlMGIgMTAwNzU1Ci0tLSBhL2NyaS1nZXRwbGF0Zm9y
bXMKKysrIGIvY3JpLWdldHBsYXRmb3JtcwpAQCAtMjAsNiArMjAsNiBAQCBnZXRwbGF0Zm9ybXMg
KCkgewogICAgICAgICBwZXJsIC1lICcKICAgICAgICAgICAgICAgICB1c2UgT3NzdGVzdDsKICAg
ICAgICAgICAgICAgICBjc3JlYWRjb25maWcoKTsKLSAgICAgICAgICAgICAgICBwcmludCBqb2lu
ICIgIiwgJG1ob3N0ZGItPmdldF9hcmNoX3BsYXRmb3JtcygiJyRibGVzc2luZyciLCAiJyQxJyIp
IG9yIGRpZSAkITsKKyAgICAgICAgICAgICAgICBwcmludCBqb2luICIgIiwgJG1ob3N0ZGItPmdl
dF9hcmNoX3BsYXRmb3JtcygiJyRibGVzc2luZyciLCAiJyQxJyIsICInJDInIikgb3IgZGllICQh
OwogICAgICAgICAnCiB9CmRpZmYgLS1naXQgYS9tYWtlLWZsaWdodCBiL21ha2UtZmxpZ2h0Cmlu
ZGV4IDFlM2ViZDVjLi45MmRhY2IzNSAxMDA3NTUKLS0tIGEvbWFrZS1mbGlnaHQKKysrIGIvbWFr
ZS1mbGlnaHQKQEAgLTI3LDkgKzI3LDkgQEAgYnVpbGRmbGlnaHQ9JDQKIGZsaWdodD1gLi9jcy1m
bGlnaHQtY3JlYXRlICRibGVzc2luZyAkYnJhbmNoYAogCiAuIC4vY3JpLWNvbW1vbgotLiAuL2Ny
aS1nZXRwbGF0Zm9ybXMKIC4gLi9hcC1jb21tb24KIC4gLi9tZmktY29tbW9uCisuIC4vY3JpLWdl
dHBsYXRmb3JtcwogCiAjIE9sZGVyIHZlcnNpb25zIG9mIFhlbiBtYXkgbm90IGJ1aWxkIHdpdGgg
dGhlIGN1cnJlbnQgZGVmYXVsdC4gIE5vdGUKICMgdGhhdCBicmFuY2hlcyBvbGRlciB0aGFuIDQu
MyBtaWdodCBuZWVkIHNvbWV0aGluZyBldmVuIG9sZGVyIHRoYW4KQEAgLTYxMiw3ICs2MTIsNyBA
QCBkb19wdl9kZWJpYW5fdGVzdHMgKCkgewogCiAgIGZvciB4c20gaW4gJHhzbXMgOyBkbwogICAg
ICMgQmFzaWMgUFYgTGludXggdGVzdCB3aXRoIHhsCi0gICAgZm9yIHBsYXRmb3JtIGluICcnIGBn
ZXRwbGF0Zm9ybXMgJHhlbmFyY2hgIDsgZG8KKyAgICBmb3IgcGxhdGZvcm0gaW4gJycgYGdldHBs
YXRmb3JtcyAkeGVuYXJjaCAkZGVmc3VpdGVgIDsgZG8KIAogICAgICAgIyB4c20gdGVzdCBpcyBu
b3QgcGxhdGZvcm0gc3BlY2lmaWMKICAgICAgIGlmIFsgeCR4c20gPSB4dHJ1ZSAtYSB4JHBsYXRm
b3JtICE9IHggXTsgdGhlbgotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
