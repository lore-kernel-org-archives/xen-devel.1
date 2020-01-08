Return-Path: <SRS0=xJ9Z=25=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA18BC00523
	for <xen-devel@archiver.kernel.org>; Wed,  8 Jan 2020 10:43:55 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 844DF205F4
	for <xen-devel@archiver.kernel.org>; Wed,  8 Jan 2020 10:43:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 844DF205F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ip8oN-0000Wr-W2; Wed, 08 Jan 2020 10:43:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Mkji=25=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ip8oM-0000Wi-Ei
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 10:43:38 +0000
X-Inumbo-ID: b470760c-3203-11ea-b56d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b470760c-3203-11ea-b56d-bc764e2007e4;
 Wed, 08 Jan 2020 10:43:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 83F4AAEFB;
 Wed,  8 Jan 2020 10:43:27 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Wed,  8 Jan 2020 11:43:24 +0100
Message-Id: <20200108104324.16928-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH] xen/spinlock: disable spinlock debugging in
 console_force_unlock()
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Y29uc29sZV9mb3JjZV91bmxvY2soKSBtaWdodCByZXN1bHQgaW4gc3Vic2VxdWVudCBBU1NFUlQo
KSB0cmlnZ2VyaW5nCndoZW4gQ09ORklHX0RFQlVHX0xPQ0tTIHdhcyBhY3RpdmUuIEF2b2lkIHRo
YXQgYnkgY2FsbGluZwpzcGluX2RlYnVnX2Rpc2FibGUoKSBpbiBjb25zb2xlX2ZvcmNlX3VubG9j
aygpIGFuZCBtYWtlIHRoZSBzcGlubG9jawpkZWJ1ZyBhc3NlcnRpb25zIHRyaWdnZXIgb25seSBp
ZiBzcGluX2RlYnVnIHdhcyBhY3RpdmUuCgpTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxq
Z3Jvc3NAc3VzZS5jb20+Ci0tLQogeGVuL2NvbW1vbi9zcGlubG9jay5jICAgICAgfCAyICstCiB4
ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGUuYyB8IDEgKwogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3NwaW5sb2Nr
LmMgYi94ZW4vY29tbW9uL3NwaW5sb2NrLmMKaW5kZXggZWQ2OWYwYTRkMi4uMmEwNmRlM2U2YSAx
MDA2NDQKLS0tIGEveGVuL2NvbW1vbi9zcGlubG9jay5jCisrKyBiL3hlbi9jb21tb24vc3Bpbmxv
Y2suYwpAQCAtODUsNyArODUsNyBAQCBzdGF0aWMgdm9pZCBnb3RfbG9jayh1bmlvbiBsb2NrX2Rl
YnVnICpkZWJ1ZykKIAogc3RhdGljIHZvaWQgcmVsX2xvY2sodW5pb24gbG9ja19kZWJ1ZyAqZGVi
dWcpCiB7Ci0gICAgQVNTRVJUKGRlYnVnLT5jcHUgPT0gc21wX3Byb2Nlc3Nvcl9pZCgpKTsKKyAg
ICBBU1NFUlQoYXRvbWljX3JlYWQoJnNwaW5fZGVidWcpIDw9IDAgfHwgZGVidWctPmNwdSA9PSBz
bXBfcHJvY2Vzc29yX2lkKCkpOwogICAgIGRlYnVnLT5jcHUgPSBTUElOTE9DS19OT19DUFU7CiB9
CiAKZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL2NoYXIvY29uc29sZS5jIGIveGVuL2RyaXZlcnMv
Y2hhci9jb25zb2xlLmMKaW5kZXggYjMxZDc4OWE1ZC4uNGJjYmJmYTdkNiAxMDA2NDQKLS0tIGEv
eGVuL2RyaXZlcnMvY2hhci9jb25zb2xlLmMKKysrIGIveGVuL2RyaXZlcnMvY2hhci9jb25zb2xl
LmMKQEAgLTEwNzcsNiArMTA3Nyw3IEBAIHZvaWQgY29uc29sZV91bmxvY2tfcmVjdXJzaXZlX2ly
cXJlc3RvcmUodW5zaWduZWQgbG9uZyBmbGFncykKIHZvaWQgY29uc29sZV9mb3JjZV91bmxvY2so
dm9pZCkKIHsKICAgICB3YXRjaGRvZ19kaXNhYmxlKCk7CisgICAgc3Bpbl9kZWJ1Z19kaXNhYmxl
KCk7CiAgICAgc3Bpbl9sb2NrX2luaXQoJmNvbnNvbGVfbG9jayk7CiAgICAgc2VyaWFsX2ZvcmNl
X3VubG9jayhzZXJjb25faGFuZGxlKTsKICAgICBjb25zb2xlX2xvY2tzX2J1c3RlZCA9IDE7Ci0t
IAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
