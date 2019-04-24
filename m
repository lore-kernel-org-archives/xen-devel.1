Return-Path: <SRS0=MKw+=S2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6B0BC10F11
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 17:00:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A8712148D
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 17:00:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A8712148D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJLFf-0007mk-Rd; Wed, 24 Apr 2019 17:00:07 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8RIj=S2=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hJLFe-0007hF-Jq
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2019 17:00:06 +0000
X-Inumbo-ID: 67f92802-66b2-11e9-92d7-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 67f92802-66b2-11e9-92d7-bc764e045a96;
 Wed, 24 Apr 2019 17:00:04 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7332D374;
 Wed, 24 Apr 2019 10:00:04 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 579883F557;
 Wed, 24 Apr 2019 10:00:03 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 24 Apr 2019 17:59:43 +0100
Message-Id: <20190424165955.23718-1-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
Subject: [Xen-devel] [PATCH 00/12] xen/arm: Provide a generic function to
 update Xen PT
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
Cc: Oleksandr_Tyshchenko@epam.com, Julien Grall <julien.grall@arm.com>,
 sstabellini@kernel.org, Andrii_Anisov@epam.com
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190424165943.z9IlgHxmEJhGlk6LQjpLNF2lE07zCJNW6gjs2X7vJKU@z>

SGkgYWxsLAoKVGhpcyBpcyB0aGUgdGhpcmQgcGFydCBvZiB0aGUgYm9vdC9tZW1vcnkgcmV3b3Jr
IGZvciBYZW4gb24gQXJtLiBBdCB0aGUKbW9tZW50LCB0aGUgdXBkYXRlIHRvIFhlbiBQVCBpcyBz
Y2F0dGVyZWQgYWxsIGFyb3VuZCBtbS5jLiBUaGlzIG1ha2VzCmRpZmZpY3VsdCB0byByZXdvcmsg
WGVuIG1lbW9yeSBsYXlvdXQgb3IgZXZlbiBlbnN1cmluZyB3ZSBhcmUgZm9sbG93aW5nIHRoZQpB
cm0gQXJtIHByb3Blcmx5IChhbmQgd2UgYXJlIG5vdCBzbyBmYXIhKS4KClRoaXMgcGFydCBjb250
YWlucyBjb2RlIHRvIHByb3ZpZGUgYSBnZW5lcmljIGZ1bmN0aW9uIHRvIHVwZGF0ZSBYZW4gUFQu
CldoaWxlIEkgY291bGQgaGF2ZSBzdGFydGVkIGZyb20gc2NyYXRjaCwgSSBkZWNpZGVkIHRvIGJh
c2UgdGhlIG5ldyBmdW5jdGlvbgpvbiBjcmVhdGVfeGVuX2VudHJpZXMoKSAobm93IHJlbmFtZWQg
eGVuX3B0X3VwZGF0ZSgpKS4gVGhpcyBtYWtlcyBzbGlnaHRseQplYXNpZXIgdG8gZm9sbG93IHRo
ZSBjaGFuZ2VzLgoKSW4gdGhpcyBzZXJpZXMsIHRoZSBuZXcgZ2VuZXJpYyBmdW5jdGlvbiB3aWxs
IG9ubHkgc3VwcG9ydCAzcmQtbGV2ZWwgdXBkYXRlCmFuZCBjYW5ub3QgYmUgdXNlZCBpbiBlYXJs
eSBib290IChpLmUgYmVjYXVzZSB4ZW5oZWFwIGlzIGluaXRpYWxpemVkKS4KVGhpcyB3aWxsIGJl
IGV4dGVuZGVkIGluIGZvbGxvdy11cCBwYXRjaCB0byBhbGxvdyBtb3JlIHVzZSB3aXRoaW4gbW0u
Yy4KClRoZXJlIGFyZSBwcm9iYWJseSBzb21lIG9wdGltaXphdGlvbiBwb3NzaWJsZSBhcm91bmQg
dGhlIFRMQnMgZmx1c2guIEkgaGF2ZW4ndApsb29rZWQgYXQgaXQgc28gZmFyLgoKVGhlIGxhc3Qg
dHdvIHBhdGNoZXMgb2YgdGhpcyBzZXJpZXMgaXMgdG8gc2hvdyBob3cgZXhpc3RpbmcgY2FsbGVy
cyBjYW4gYmUKY29udmVydGVkLiBUaGVyZSBhcmUgbW9yZSBjb252ZXJzaW9uIHRvIGNvbWUgaW4g
Zm9sbG93LXVwIHNlcmllcy4KCkNoZWVycywKCkp1bGllbiBHcmFsbCAoMTIpOgogIHhlbi9hcm06
IGxwYWU6IEFkZCBhIG1hY3JvIHRvIGdlbmVyYXRlIG9mZnNldHMgZnJvbSBhbiBhZGRyZXNzCiAg
eGVuL2FybTogbW06IFJlbmFtZSBjcmVhdGVfeGVuX2VudHJpZXMoKSB0byB4ZW5fcHRfdXBkYXRl
KCkKICB4ZW4vYXJtOiBtbTogTW92ZSBvdXQgb2YgeGVuX3B0X3VwZGF0ZSgpIHRoZSBsb2dpYyB0
byB1cGRhdGUgYW4gZW50cnkKICB4ZW4vYXJtOiBtbTogSW50cm9kdWNlIF9QQUdFX1BSRVNFTlQg
YW5kIF9QQUdFX1BPUFVMQVRFCiAgeGVuL2FybTogbW06IE9ubHkgaW5jcmVtZW50IG1mbiB3aGVu
IHZhbGlkIGluIHhlbl9wdF91cGRhdGUKICB4ZW4vYXJtOiBtbTogU2FuaXR5IGNoZWNrIGFueSB1
cGRhdGUgb2YgWGVuIHBhZ2UgdGFibGVzCiAgeGVuL2FybTogbW06IFJld29yayB4ZW5fcHRfdXBk
YXRlX2VudHJ5IHRvIGF2b2lkIHVzZSB4ZW5tYXBfb3BlcmF0aW9uCiAgeGVuL2FybTogbW06IFJl
bW92ZSBlbnVtIHhlbm1hcF9vcGVyYXRpb24KICB4ZW4vYXJtOiBtbTogVXNlIHssIHVufW1hcF9k
b21haW5fcGFnZSgpIHRvIG1hcC91bm1hcCBYZW4gcGFnZS10YWJsZXMKICB4ZW4vYXJtOiBtbTog
UmV3b3JrIFhlbiBwYWdlLXRhYmxlcyB3YWxrIGR1cmluZyB1cGRhdGUKICB4ZW4vYXJtOiBtbTog
RG9uJ3Qgb3Blbi1jb2RlIFhlbiBQVCB1cGRhdGUgaW4ge3NldCwgY2xlYXJ9X2ZpeG1hcCgpCiAg
eGVuL2FybTogbW06IFJlbW92ZSBzZXRfcHRlX2ZsYWdzX29uX3JhbmdlKCkKCiB4ZW4vYXJjaC9h
cm0vbW0uYyAgICAgICAgICB8IDQyMSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0t
LS0tLS0tLS0tLS0KIHhlbi9hcmNoL2FybS9wMm0uYyAgICAgICAgIHwgIDIzICstLQogeGVuL2lu
Y2x1ZGUvYXNtLWFybS9scGFlLmggfCAgIDkgKwogeGVuL2luY2x1ZGUvYXNtLWFybS9wYWdlLmgg
fCAgIDkgKy0KIDQgZmlsZXMgY2hhbmdlZCwgMzA1IGluc2VydGlvbnMoKyksIDE1NyBkZWxldGlv
bnMoLSkKCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
