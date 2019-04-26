Return-Path: <SRS0=7THE=S4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3EC5C43219
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 16:41:36 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABBEA20693
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 16:41:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABBEA20693
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hK3uf-000848-6L; Fri, 26 Apr 2019 16:41:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6UZT=S4=citrix.com=prvs=0129f9400=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hK3ud-00083p-UV
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 16:41:23 +0000
X-Inumbo-ID: 200fcf27-6842-11e9-843c-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 200fcf27-6842-11e9-843c-bc764e045a96;
 Fri, 26 Apr 2019 16:41:22 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,398,1549929600"; d="scan'208";a="84519668"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 26 Apr 2019 17:39:49 +0100
Message-ID: <20190426164002.22381-3-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190426164002.22381-1-ian.jackson@eu.citrix.com>
References: <20190426164002.22381-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 02/15] TestSupport: target_var: Use
 host_V for host variables
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
Message-ID: <20190426163949.iLjOnG6p6I1b6zW_u-ppdU7Q3KlBZDbbymzSJ9N0dpU@z>

Q2hhbmdlIGB0YXJnZXRfdmFyJyB0byBzZXQgYElERU5UX1YnIHJhdGhlciB0aGFuIGp1c3QgVi4g
IEZvcgpjb21wYXRpYmlsaXR5IHdpdGggb2xkZXIgZmxpZ2h0cyBhbmQgb2xkZXIgZmxpZ2h0IGNv
bnN0cnVjdGlvbiwKbG9vayBmb3IgcGxhaW4gViB0b28gd2hlbiBsb29raW5nIHVwIHRoZSB2YXJp
YWJsZS4KCkFuZCwgd2Ugbm93IGxvb2sgYXQgYWxsX2hvc3RfViBiZWZvcmUgVi4gIFRoaXMgaGFz
IG5vIGZ1bmN0aW9uYWwKY2hhbmdlIHdpdGggZXhpc3RpbmcgZmxpZ2h0cywgYmVjYXVzZSBleGlz
dGluZyBmbGlnaHRzIG9ubHkgaGF2ZQogIGFsbF9ob3N0X3N1aXRlCiAgYWxsX2hvc3RfZGlfdmVy
c2lvbgogIGFsbF9ob3N0X29zCmFuZCB3ZSBuZXZlciBzZXQgdGhlIGNvcnJlc3BvbmRpbmcgViBm
b3JtIG9mIHRob3NlIHZhcmlhYmxlcy4KClNvIHdpdGggZXhpc3RpbmcgZmxpZ2h0cyB0aGUgb25s
eSBmdW5jdGlvbmFsIGNoYW5nZSBpcyBhIGNoYW5nZSB0bwpzeW50aCBydW52YXJzLCB0byBhZGQg
SE9TVF8gdG8gdGhlIG5hbWUuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tz
b25AZXUuY2l0cml4LmNvbT4KLS0tCiBPc3N0ZXN0L1Rlc3RTdXBwb3J0LnBtIHwgNCArKy0tCiAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL09zc3Rlc3QvVGVzdFN1cHBvcnQucG0gYi9Pc3N0ZXN0L1Rlc3RTdXBwb3J0LnBtCmluZGV4
IGZjYmRlMGEyLi42YWI2NGQ1NiAxMDA2NDQKLS0tIGEvT3NzdGVzdC9UZXN0U3VwcG9ydC5wbQor
KysgYi9Pc3N0ZXN0L1Rlc3RTdXBwb3J0LnBtCkBAIC0yNDY1LDggKzI0NjUsNyBAQCBzdWIgZ3Vl
c3RfYXdhaXQgKCQkKSB7CiAKIHN1YiB0YXJnZXRfdmFyX3ByZWZpeCAoJCkgewogICAgIG15ICgk
aG8pID0gQF87Ci0gICAgaWYgKGV4aXN0cyAkaG8tPntHdWVzdH0pIHsgcmV0dXJuICRoby0+e0d1
ZXN0fS4nXyc7IH0KLSAgICByZXR1cm4gJyc7CisgICAgcmV0dXJuIChleGlzdHMgJGhvLT57R3Vl
c3R9ID8gJGhvLT57R3Vlc3R9IDogJGhvLT57SWRlbnR9KS4nXyc7CiB9CiAKIHN1YiB0YXJnZXRf
dmFyICgkJCkgewpAQCAtMjQ3Nyw2ICsyNDc2LDcgQEAgc3ViIHRhcmdldF92YXIgKCQkKSB7CiAJ
cHVzaCBAcHJlZml4ZXMsICdhbGxfZ3Vlc3RfJzsKICAgICB9IGVsc2UgewogCXB1c2ggQHByZWZp
eGVzLCAnYWxsX2hvc3RfJzsKKwlwdXNoIEBwcmVmaXhlcywgJyc7CiAgICAgfQogICAgIGZvcmVh
Y2ggbXkgJHByZWZpeCAoQHByZWZpeGVzKSB7CiAJbXkgJHYgPSAkcnsgJHByZWZpeC4kdm4gfTsK
LS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
