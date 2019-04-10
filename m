Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04B42C10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:27:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1DCB20830
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:27:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1DCB20830
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEEC4-0001zD-Hx; Wed, 10 Apr 2019 14:27:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEC2-0001wC-Ks
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:27:14 +0000
X-Inumbo-ID: 82380648-5b9c-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 82380648-5b9c-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 14:25:37 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="83227717"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 10 Apr 2019 15:23:45 +0100
Message-ID: <20190410142408.22848-40-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 39/62] preseed_base: chmod ssh host
 private keys to placate sshd
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
Message-ID: <20190410142345.-4TzjycYGRos5T_Q_k7JESRhfTvUuJ_Wk9n4CJJaIfY@z>

T3RoZXJ3aXNlOgogIENvdWxkIG5vdCBsb2FkIGhvc3Qga2V5OiAvZXRjL3NzaC9zc2hfaG9zdF9l
Y2RzYV9rZXkKICBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBA
QEBAQEBAQEBAQEBAQAogIEAgICAgICAgICBXQVJOSU5HOiBVTlBST1RFQ1RFRCBQUklWQVRFIEtF
WSBGSUxFISAgICAgICAgICBACiAgQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBA
QEBAQEBAQEBAQEBAQEBAQEBAQEBAQEAKICBQZXJtaXNzaW9ucyAwNjQwIGZvciAnL2V0Yy9zc2gv
c3NoX2hvc3RfZWQyNTUxOV9rZXknIGFyZSB0b28gb3Blbi4KICBJdCBpcyByZWNvbW1lbmRlZCB0
aGF0IHlvdXIgcHJpdmF0ZSBrZXkgZmlsZXMgYXJlIE5PVCBhY2Nlc3NpYmxlIGJ5IG90aGVycy4K
ICBUaGlzIHByaXZhdGUga2V5IHdpbGwgYmUgaWdub3JlZC4KICBrZXlfbG9hZF9wcml2YXRlOiBi
YWQgcGVybWlzc2lvbnMKICBDb3VsZCBub3QgbG9hZCBob3N0IGtleTogL2V0Yy9zc2gvc3NoX2hv
c3RfZWQyNTUxOV9rZXkKClRoaXMgc2VlbXMgdG8gc3RhcnQgaGFwcGVuaW5nIHdpdGggc3RyZXRj
aC4gIFByZXN1bWFibHkgc3RyZXRjaCBpcwptb3JlIGFubm95aW5nbHkgcGlja3kgdGhhbiBqZXNz
aWUuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNv
bT4KLS0tCiBPc3N0ZXN0L0RlYmlhbi5wbSB8IDggKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA4
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Pc3N0ZXN0L0RlYmlhbi5wbSBiL09zc3Rlc3Qv
RGViaWFuLnBtCmluZGV4IGFmZjVhY2Q1Li5kNzZkZDAzZCAxMDA2NDQKLS0tIGEvT3NzdGVzdC9E
ZWJpYW4ucG0KKysrIGIvT3NzdGVzdC9EZWJpYW4ucG0KQEAgLTg3MSw2ICs4NzEsMTQgQEAgRU5E
CiAJcHJlc2VlZF9ob29rX292ZXJsYXkoJGhvLCAkc2Z4LCAkc3JjZGlyLCAkdGZpbGVuYW1lKTsK
ICAgICB9KTsKIAorICAgICMgSG9zdCBwcml2YXRlIGtleXMgaW4gdGhlIG92ZXJsYXlzIGhhdmUg
dG8gYmUgZ3JvdXAtcmVhZGFibGUKKyAgICAjIGF0IGxlYXN0LCBvciBuby1vbmUgY2FuIHVzZSB0
aGVtLiAgQnV0IHNzaCBpcyB2ZXJ5IGZ1c3N5LgorICAgIHByZXNlZWRfaG9va19jb21tYW5kKCRo
bywgJ2xhdGVfY29tbWFuZCcsICRzZngsIDw8RU5EKTsKKyMhL2Jpbi9zaAorc2V0IC1leAorY2ht
b2QgNjAwIC90YXJnZXQvZXRjL3NzaC9zc2hfaG9zdF8qX2tleSB8fDoKK0VORAorCiAgICAgbXkg
JHByZXNlZWQgPSA8PCJFTkQiOwogZC1pIGRlYmlhbi1pbnN0YWxsZXIvbG9jYWxlIHN0cmluZyBl
bl9HQgogZC1pIGNvbnNvbGUta2V5bWFwcy1hdC9rZXltYXAgc2VsZWN0IGdiCi0tIAoyLjExLjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
