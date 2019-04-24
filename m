Return-Path: <SRS0=MKw+=S2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4F67C10F11
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 17:00:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD01121900
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 17:00:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD01121900
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJLFl-0007nY-9o; Wed, 24 Apr 2019 17:00:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8RIj=S2=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hJLFk-0007nN-9Z
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2019 17:00:12 +0000
X-Inumbo-ID: 6c1ccaee-66b2-11e9-ace0-d3443eb28cba
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 6c1ccaee-66b2-11e9-ace0-d3443eb28cba;
 Wed, 24 Apr 2019 17:00:11 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A9E115BE;
 Wed, 24 Apr 2019 10:00:11 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3FD433F557;
 Wed, 24 Apr 2019 10:00:10 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 24 Apr 2019 17:59:48 +0100
Message-Id: <20190424165955.23718-6-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190424165955.23718-1-julien.grall@arm.com>
References: <20190424165955.23718-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH 05/12] xen/arm: mm: Only increment mfn when
 valid in xen_pt_update
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
Message-ID: <20190424165948.Pn5kJ1QJ4wrNdxeY_LtfTzDA3AvGC5JE71ugJrTuhcE@z>

Q3VycmVudGx5LCB0aGUgTUZOIHdpbGwgYmUgaW5jcmVtZW50ZWQgZXZlbiBpZiBpdCBpcyBpbnZh
bGlkLiBUaGlzIHdpbGwKcmVzdWx0IHRvIGhhdmUgYSB2YWxpZCBNRk4gYWZ0ZXIgdGhlIGZpcnN0
IGl0ZXJhdGlvbi4KCldoaWxlIHRoaXMgaXMgbm90IGEgbWFqb3IgcHJvYmxlbSB0b2RheSwgdGhp
cyB3aWxsIGJlIGluIHRoZSBmdXR1cmUgaWYKdGhlIGNvZGUgZXhwZWN0IGFuIGludmFsaWQgTUZO
IGF0IGV2ZXJ5IGl0ZXJhdGlvbi4KClN1Y2ggYmVoYXZpb3IgaXMgcHJldmVudGVkIGJ5IGF2b2lk
aW5nIHRvIGluY3JlbWVudCBhbiBpbnZhbGlkIE1GTi4KClNpZ25lZC1vZmYtYnk6IEp1bGllbiBH
cmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Ci0tLQogeGVuL2FyY2gvYXJtL21tLmMgfCA1ICsr
KystCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEveGVuL2FyY2gvYXJtL21tLmMgYi94ZW4vYXJjaC9hcm0vbW0uYwppbmRleCBiNjEy
MTdhYmQwLi5lZWU3MTIyYzg4IDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vbW0uYworKysgYi94
ZW4vYXJjaC9hcm0vbW0uYwpAQCAtMTA0NiwxMSArMTA0NiwxNCBAQCBzdGF0aWMgaW50IHhlbl9w
dF91cGRhdGUoZW51bSB4ZW5tYXBfb3BlcmF0aW9uIG9wLAogCiAgICAgc3Bpbl9sb2NrKCZ4ZW5f
cHRfbG9jayk7CiAKLSAgICBmb3IoOyBhZGRyIDwgYWRkcl9lbmQ7IGFkZHIgKz0gUEFHRV9TSVpF
LCBtZm4gPSBtZm5fYWRkKG1mbiwgMSkpCisgICAgZm9yKCA7IGFkZHIgPCBhZGRyX2VuZDsgYWRk
ciArPSBQQUdFX1NJWkUgKQogICAgIHsKICAgICAgICAgcmMgPSB4ZW5fcHRfdXBkYXRlX2VudHJ5
KG9wLCBhZGRyLCBtZm4sIGZsYWdzKTsKICAgICAgICAgaWYgKCByYyApCiAgICAgICAgICAgICBi
cmVhazsKKworICAgICAgICBpZiAoICFtZm5fZXEobWZuLCBJTlZBTElEX01GTikgKQorICAgICAg
ICAgICAgbWZuID0gbWZuX2FkZChtZm4sIDEpOwogICAgIH0KIAogICAgIC8qCi0tIAoyLjExLjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
