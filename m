Return-Path: <SRS0=LbOi=SU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 000A4C10F0E
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 16:32:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAE2A2183F
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 16:32:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAE2A2183F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hH9xU-0002IZ-Kc; Thu, 18 Apr 2019 16:32:20 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tvKn=SU=citrix.com=prvs=004dc2360=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hH9xR-0002CN-JH
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 16:32:17 +0000
X-Inumbo-ID: 86bfa75d-61f7-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 86bfa75d-61f7-11e9-92d7-bc764e045a96;
 Thu, 18 Apr 2019 16:32:15 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,366,1549929600"; d="scan'208";a="83913805"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 18 Apr 2019 17:31:41 +0100
Message-ID: <20190418163158.11408-5-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
References: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 04/21] alloc_resources: Support special
 abandonment values
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
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190418163141.WFP_-avrrGgqIG1dKDLgVyWa486FOz1Svn03hrEmNGA@z>

VGhpcyBnaXZlcyBhIHdheSBmb3IgdGhlIGNhbGxlcidzICRyZXNvdXJjZWNhbGwgdG8gc2lnbmFs
IHNvbWV0aGluZwppbnRlcmVzdGluZywgYmFjayB0byBpdHMgbWFpbiBsb29wLiAgVGhpcyBpcyB1
c2VmdWwgZm9yIGNhbGxpbmcKYnJva2VuLCBmb3IgZXhhbXBsZTogdGhhdCBjYW4ndCBiZSBkb25l
IHdpdGhpbiAkcmVzb3VyY2VjYWxsIGJlY2F1c2UKJHJlc291cmNlY2FsbCBvcGVyYXRlcyB3aXRo
aW4gdGhlIGFsbG9jYXRpb24gZGIgdHJhbnNhY3Rpb24gKHdoaWNoCm91Z2h0IHRvIGJlIHJvbGxl
ZCBiYWNrLi4uKQoKU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPElhbi5KYWNrc29uQGV1LmNp
dHJpeC5jb20+Ci0tLQogT3NzdGVzdC9FeGVjdXRpdmUucG0gfCAyMSArKysrKysrKysrKysrKy0t
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL09zc3Rlc3QvRXhlY3V0aXZlLnBtIGIvT3NzdGVzdC9FeGVjdXRpdmUucG0K
aW5kZXggMGQ4NTAyYjUuLmIyN2I4ZDI1IDEwMDY0NAotLS0gYS9Pc3N0ZXN0L0V4ZWN1dGl2ZS5w
bQorKysgYi9Pc3N0ZXN0L0V4ZWN1dGl2ZS5wbQpAQCAtNzM3LDcgKzczNyw4IEBAIHN1YiBhbGxv
Y19yZXNvdXJjZXMgewogICAgICMKICAgICAjICB2YWx1ZXMgb2YgJG9rCiAgICAgIyAgICAgICAg
ICAgIDAgIHJvbGxiYWNrLCB3YWl0IGFuZCB0cnkgYWdhaW4KLSAgICAjICAgICAgICAgICAgMSAg
Y29tbWl0LCBjb21wbGV0ZWQgb2sKKyAgICAjICAgICAgICAgICAgMSAgY29tbWl0LCBjb21wbGV0
ZWQgb2sgfSByZXR1cm4gdGhlCisgICAgIyAgICAgICAgICAgPjEgIHJvbGxiYWNrIGFuZCBhYmFu
ZG9uIH0gIHZhbHVlIG9mICRvawogICAgICMgICRib29raW5nbGlzdCBzaG91bGQgYmUgdW5kZWYg
b3IgYSBoYXNoIGZvciBtYWtpbmcgYSBib29raW5nCiAgICAgIwogICAgICMgJHJlc291cmNlY2Fs
bCBzaG91bGQgbm90IGxvb2sgYXQgdGFza3MubGl2ZQpAQCAtODU5LDEwICs4NjAsMTQgQEAgc3Vi
IGFsbG9jX3Jlc291cmNlcyB7CiAJCSAgICAjICRyZXNvdXJjZWNhbGwgaXRzZWxmIGZhaWxlZDog
Ym9tYiBvdXQgKGRvbid0IHJldHJ5KQogCQkgICAgJG9rPS0xOwogCQl9Ci0JCXJldHVybiBkYl9y
ZXRyeV9hYm9ydCgpIHVubGVzcyAkb2s+MDsKKwkJcmV0dXJuIGRiX3JldHJ5X2Fib3J0KCkgdW5s
ZXNzICRvaz09MTsKIAkgICAgfV0pOwogCi0JICAgIGlmICgkYm9va2luZ2xpc3QgJiYgJG9rIT0t
MSkgeworCSAgICBpZiAoJG9rPDAgfHwgJG9rPjEpIHsKKyAgICAgICAgICAgICAgICByZXR1cm4g
MTsKKwkgICAgfQorCisJICAgIGlmICgkYm9va2luZ2xpc3QpIHsKIAkJbXkgJXByc3RhcnQ7CiAJ
CWZvcmVhY2ggbXkgJGJvb2sgKEB7ICRib29raW5nbGlzdC0+e0Jvb2tpbmdzfSB9KSB7CiAJCSAg
ICBteSAkcHIgPSAkYm9vay0+e1Jlc299OwpAQCAtODkwLDggKzg5NSw2IEBAIHN1YiBhbGxvY19y
ZXNvdXJjZXMgewogCiAgICAgICAgICAgICBpZiAoJG9rPT0xKSB7CiAgICAgICAgICAgICAgICAg
cHJpbnQgJHFzZXJ2ICJ0aG91Z2h0LWRvbmVcbiIgb3IgZGllICQhOwotICAgICAgICAgICAgfSBl
bHNpZiAoJG9rPDApIHsKLSAgICAgICAgICAgICAgICByZXR1cm4gMTsKICAgICAgICAgICAgIH0g
ZWxzZSB7ICMgMAogICAgICAgICAgICAgICAgIGxvZ20oInJlc291cmNlIGFsbG9jYXRpb246IGRl
ZmVycmluZyIpOwogICAgICAgICAgICAgICAgIHByaW50ICRxc2VydiAidGhvdWdodC13YWl0XG4i
IG9yIGRpZSAkITsKQEAgLTkzNSw4ICs5MzgsMTIgQEAgRU5ECiAgICAgICAgICAgICAkb2s9IDA7
CiAgICAgICAgIH0KICAgICB9Ci0gICAgZGllIHVubGVzcyAkb2s9PTE7Ci0gICAgbG9nbSgicmVz
b3VyY2UgYWxsb2NhdGlvbjogc3VjY2Vzc2Z1bC4iKTsKKyAgICBpZiAoJG9rPT0xKSB7CisJbG9n
bSgicmVzb3VyY2UgYWxsb2NhdGlvbjogc3VjY2Vzc2Z1bC4iKTsKKyAgICB9IGVsc2UgeworCWxv
Z20oInJlc291cmNlIGFsbG9jYXRpb246IHJlc291cmNlY2FsbCByZXR1cm5lZCAoJG9rLC4uLiki
KTsKKyAgICB9CisgICAgcmV0dXJuICRvazsKIH0KIAogc3ViIHJlc291cmNlX2NoZWNrX2FsbG9j
YXRlZCAoJCQpIHsKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
