Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64CC9C10F14
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:26:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CC2120854
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:26:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CC2120854
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEEB1-0008CO-Ie; Wed, 10 Apr 2019 14:26:11 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAc-00078w-GP
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:46 +0000
X-Inumbo-ID: 86feb7f0-5b9c-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 86feb7f0-5b9c-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 14:25:45 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="83227746"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 10 Apr 2019 15:24:03 +0100
Message-ID: <20190410142408.22848-58-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 57/62] platforms: Honour suite in
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
Message-ID: <20190410142403.C8BnppH2yBFdLQyTwsQw09MoXPM_ZllOatlJuw5AoCs@z>

VGhlIGF2YWlsYWJsZSBwbGF0Zm9ybXMgbWF5IGRlcGVuZCBvbiB0aGUgc3VpdGUgdG8gYmUgdXNl
ZC4KCkFjdHVhbGx5IGltcGxlbWVudCB0aGF0IGZvciBIb3N0REI6OkV4ZWN1dGl2ZS4KRm9yIFN0
YXRpYywgd2UgbGVhdmUgaXQgdG8gdGhlIHVzZXIuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3Nv
biA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiBPc3N0ZXN0L0hvc3REQi9FeGVjdXRp
dmUucG0gfCA2ICsrKystLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Pc3N0ZXN0L0hvc3REQi9FeGVjdXRpdmUucG0gYi9Pc3N0
ZXN0L0hvc3REQi9FeGVjdXRpdmUucG0KaW5kZXggYmY2ZWM1N2QuLjdmZmNhNmM0IDEwMDY0NAot
LS0gYS9Pc3N0ZXN0L0hvc3REQi9FeGVjdXRpdmUucG0KKysrIGIvT3NzdGVzdC9Ib3N0REIvRXhl
Y3V0aXZlLnBtCkBAIC05OSwxOCArOTksMjAgQEAgU0VMRUNUIERJU1RJTkNUIGhvc3RmbGFnCiAg
ICAgICAgICAgIEZST00gaG9zdGZsYWdzIGgwCiAgICBXSEVSRSBFWElTVFMgKAogICAgICAgIFNF
TEVDVCAqCi0gICAgICAgICBGUk9NIGhvc3RmbGFncyBoMSwgaG9zdGZsYWdzIGgyLCBob3N0Zmxh
Z3MgaDMKKyAgICAgICAgIEZST00gaG9zdGZsYWdzIGgxLCBob3N0ZmxhZ3MgaDIsIGhvc3RmbGFn
cyBoMywgaG9zdGZsYWdzIGg0CiAgICAgICAgIFdIRVJFIGgwLmhvc3RuYW1lID0gaDEuaG9zdG5h
bWUKICAgICAgICAgICBBTkQgaDEuaG9zdG5hbWUgPSBoMi5ob3N0bmFtZQogICAgICAgICAgIEFO
RCBoMi5ob3N0bmFtZSA9IGgzLmhvc3RuYW1lCisgICAgICAgICAgQU5EIGgzLmhvc3RuYW1lID0g
aDQuaG9zdG5hbWUKICAgICAgICAgICBBTkQgaDEuaG9zdGZsYWcgPSA/CiAgICAgICAgICAgQU5E
IGgyLmhvc3RmbGFnID0gPwogICAgICAgICAgIEFORCBoMy5ob3N0ZmxhZyA9ICdwdXJwb3NlLXRl
c3QnCisgICAgICAgICAgQU5EIGg0Lmhvc3RmbGFnID0gPwogICAgKQogICAgQU5EIGhvc3RmbGFn
IGxpa2UgJ3BsYXRmb3JtLSUnOwogRU5ECiAKLSAgICAkcGxhdHNxLT5leGVjdXRlKCJibGVzc2Vk
LSRibGVzc2luZyIsICJhcmNoLSRhcmNoIik7CisgICAgJHBsYXRzcS0+ZXhlY3V0ZSgiYmxlc3Nl
ZC0kYmxlc3NpbmciLCAiYXJjaC0kYXJjaCIsICJzdWl0ZS0kc3VpdGUiKTsKIAogICAgIHdoaWxl
IChteSAoJHBsYXQpID0gJHBsYXRzcS0+ZmV0Y2hyb3dfYXJyYXkoKSkgewogCSRwbGF0ID1+IHMv
XnBsYXRmb3JtLS8vZyBvciBkaWU7Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
