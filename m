Return-Path: <SRS0=5Xtu=SY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 015B0C10F11
	for <xen-devel@archiver.kernel.org>; Mon, 22 Apr 2019 16:42:03 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C37A120674
	for <xen-devel@archiver.kernel.org>; Mon, 22 Apr 2019 16:42:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C37A120674
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hIc0c-0004BK-GQ; Mon, 22 Apr 2019 16:41:34 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tD/7=SY=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hIc0b-0004BF-Ph
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2019 16:41:33 +0000
X-Inumbo-ID: 7bbdcc50-651d-11e9-92d7-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 7bbdcc50-651d-11e9-92d7-bc764e045a96;
 Mon, 22 Apr 2019 16:41:31 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 69801374;
 Mon, 22 Apr 2019 09:41:31 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 354533F557;
 Mon, 22 Apr 2019 09:41:30 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 22 Apr 2019 17:41:06 +0100
Message-Id: <20190422164106.20331-1-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
Subject: [Xen-devel] [PATCH] xen/arm: Allow cleaning the directory even when
 CONFIG_EARLY_PRINTK is set
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
Cc: Andrew.Cooper3@citrix.com, Julien Grall <julien.grall@arm.com>,
 sstabellini@kernel.org, ian.jackson@eu.citrix.com, jbeulich@suse.com
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190422164106.B3WOr1UeePq0o3Tzr9wXwEUDzG1xNfOQxWvhxrscf3k@z>

Q09ORklHX0VBUkxZX1BSSU5USyBjYW4gb25seSBiZSBzZXQgd2hlbiBDT05GSUdfREVCVUcgaXMg
ZW5hYmxlZC4gSXQgY2FuCmJlIHF1aXRlIGNvbnZlbmllbnQgdG8gb25seSBtb2RpZnkgdGhlIHRh
cmdldC4KCkhvd2V2ZXIsIHRoZSB0YXJnZXQgY2xlYW4gd2lsbCBub3QgaW5jbHVkZSB0aGUgLmNv
bmZpZy4gVGhpcyBtZWFucwpDT05GSUdfREVCVUcgaXMgbm90IGVuYWJsZWQgYW5kIHRoZXJlZm9y
ZSBtYWtlIHdpbGwgdGhyb3cgYW4gZXJyb3IKcHJldmVudGluZyBjbGVhbiB0byBjb250aW51ZS4K
ClRoZSBjaGVjayBpcyBub3QgbW92ZWQgYXQgbGlua2luZyB0aW1lLgoKU2lnbmVkLW9mZi1ieTog
SnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCi0tLQoKVGhpcyBjb2RlIGlzIHBy
ZXR0eSBuYXN0eSwgYnV0IEkgaGF2ZW4ndCBmb3VuZCBhIGJldHRlciB3YXkgZm9yIGF2b2lkaW5n
CnRvIGNoZWNrIGlmIENPTkZJR19ERUJVRyBpcyBlbmFibGVkIHdoZW4gdGhlIHRhcmdldCBjbGVh
biBpcyBjYWxsZWQuCgpJZGVhbGx5IHdlIHdpbGwgd2FudCB0byBtb3ZlIENPTkZJR19FQVJMWV9Q
UklOVEsgaW4gS2NvbmZpZy4gSSBoYXZlbid0CmhhZCB0aW1lIHlldCB0byBsb29rIGF0IGl0IHBy
b3Blcmx5IHNvIGZhci4KLS0tCiB4ZW4vYXJjaC9hcm0vTWFrZWZpbGUgfCA1ICsrKysrCiB4ZW4v
YXJjaC9hcm0vUnVsZXMubWsgfCA3IC0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRp
b25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9NYWtlZmls
ZSBiL3hlbi9hcmNoL2FybS9NYWtlZmlsZQppbmRleCBjYjkwMmNiNmZlLi5mZWY1MDhjODM2IDEw
MDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vTWFrZWZpbGUKKysrIGIveGVuL2FyY2gvYXJtL01ha2Vm
aWxlCkBAIC0xMDEsNiArMTAxLDExIEBAIHByZWxpbmsubzogJChBTExfT0JKUykKIGVuZGlmCiAK
ICQoVEFSR0VUKS1zeW1zOiBwcmVsaW5rLm8geGVuLmxkcworaWZuZXEgKCQoQ09ORklHX0VBUkxZ
X1BSSU5USyksICkKK2lmbmVxICgkKENPTkZJR19ERUJVRyksIHkpCisJJChlcnJvciBDT05GSUdf
RUFSTFlfUFJJTlRLIGVuYWJsZWQgZm9yIG5vbi1kZWJ1ZyBidWlsZCkKK2VuZGlmCitlbmRpZgog
CSQoTEQpICQoTERGTEFHUykgLVQgeGVuLmxkcyAtTiBwcmVsaW5rLm8gXAogCSAgICAkKEJBU0VE
SVIpL2NvbW1vbi9zeW1ib2xzLWR1bW15Lm8gLW8gJChARCkvLiQoQEYpLjAKIAkkKE5NKSAtcGEg
LS1mb3JtYXQ9c3lzdiAkKEBEKS8uJChARikuMCBcCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0v
UnVsZXMubWsgYi94ZW4vYXJjaC9hcm0vUnVsZXMubWsKaW5kZXggZjI2NDU5MmFlZi4uMTIxNTA5
ODZjNSAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL1J1bGVzLm1rCisrKyBiL3hlbi9hcmNoL2Fy
bS9SdWxlcy5tawpAQCAtODAsMTEgKzgwLDQgQEAgQ0ZMQUdTLSQoRUFSTFlfUFJJTlRLKSArPSAt
REVBUkxZX1BSSU5US19CQVVEPSQoRUFSTFlfUFJJTlRLX0JBVUQpCiBDRkxBR1MtJChFQVJMWV9Q
UklOVEspICs9IC1ERUFSTFlfVUFSVF9CQVNFX0FERFJFU1M9JChFQVJMWV9VQVJUX0JBU0VfQURE
UkVTUykKIENGTEFHUy0kKEVBUkxZX1BSSU5USykgKz0gLURFQVJMWV9VQVJUX1JFR19TSElGVD0k
KEVBUkxZX1VBUlRfUkVHX1NISUZUKQogCi1lbHNlICMgIUNPTkZJR19ERUJVRwotCi1pZm5lcSAo
JChDT05GSUdfRUFSTFlfUFJJTlRLKSwpCi0jIEVhcmx5IHByaW50ayBpcyBkZXBlbmRhbnQgb24g
YSBkZWJ1ZyBidWlsZC4KLSQoZXJyb3IgQ09ORklHX0VBUkxZX1BSSU5USyBlbmFibGVkIGZvciBu
b24tZGVidWcgYnVpbGQpCi1lbmRpZgotCiBlbmRpZgotLSAKMi4xMS4wCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
