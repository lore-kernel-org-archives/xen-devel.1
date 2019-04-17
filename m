Return-Path: <SRS0=ZpmR=ST=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 616E1C10F12
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 10:09:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36494204FD
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 10:09:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36494204FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGhUp-0005Ay-QF; Wed, 17 Apr 2019 10:08:51 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fEre=ST=citrix.com=prvs=0036fbe7a=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hGhUp-0005At-EX
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 10:08:51 +0000
X-Inumbo-ID: cb5b9d92-60f8-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cb5b9d92-60f8-11e9-92d7-bc764e045a96;
 Wed, 17 Apr 2019 10:08:49 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,361,1549929600"; d="scan'208";a="83775604"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 17 Apr 2019 11:08:40 +0100
Message-ID: <20190417100840.13935-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH] debianhvm tests: Re-permute guest
 architecture
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190417100840.vxkC_41hY9tZu1_OwVC3hkxy5OwQB9eYMath0yk9wG4@z>

Rmlyc3RseSwgY2hhbmdlIHRoZSBzbW9rZSBmbGlnaHQgdG8gdXNlIGFtZDY0LCBub3QgaTM4Ni4K
U2Vjb25kbHksIG1ha2UgdGhlIG90aGVyIGZsaWdodHMgaGF2ZSBhIG1peHR1cmUgb2YgaTM4NiBh
bmQgYW1kNjQsIG5vdApqdXN0IGFtZDY0LgoKSXQgd2FzIGFsd2F5cyB3cm9uZyB0byB0ZXN0IG9u
bHkgb25lIGd1ZXN0IGFyY2hpdGVjdHVyZSBpbiB0aGUgbWFpbgpmbGlnaHRzLgoKVGhlIGNvbnRl
eHQgZm9yIGNoYW5naW5nIHRoZSBzbW9rZSBmbGlnaHQgaXMgdGhhdCB0aGVyZSBzZWVtcyB0byBi
ZSBhCnByb2JsZW0gYWZmZWN0aW5nIERlYmlhbiBpMzg2IGd1ZXN0cy4gIFRoaXMgaXMgcmF0aGVy
IGEgbnVpc2FuY2UgYnV0Cml0IGlzIG5vdCBhIFhlbiByZWdyZXNzaW9uIHNvIHdlIHByb2JhYmx5
IHdhbnQgdG8gZG8gYW4gYW1kNjQgZ3Vlc3QKaW5zdGVhZCBzbyB3ZSBoYXZlIHNvbWUgSFZNIHRl
c3RzIGluIHRoZSBzbW9rZSBmbGlnaHRzLgoKQ2hlY2tlZCB3aXRoIHN0YW5kYWxvbmUtZ2VuZXJh
dGUtZHVtcC1mbGlnaHQtcnVudmFycy4gIERpZmZlcmVuY2VzCmFyZSBhcyBmb2xsb3dzOgoKMS4g
R2VuZXJhbGx5LCB0byBjaGFuZ2UgdGhlIGd1ZXN0IGFyY2ggZnJvbSBhbWQ2NCB0byBpMzg2IGlu
OgoKICB0ZXN0LWFtZDY0LWFtZDY0LXhsLXFlbXV0LWRlYmlhbmh2bS17YW1kNjQsaTM4Nn0teHNt
CiAgdGVzdC1hbWQ2NC1hbWQ2NC14bC1xZW11dS1kZWJpYW5odm0te2FtZDY0LGkzODZ9LXhzbQog
IHRlc3QtYW1kNjQtaTM4Ni14bC1xZW11dC1kZWJpYW5odm0te2FtZDY0LGkzODZ9LXhzbQogIHRl
c3QtYW1kNjQtaTM4Ni14bC1xZW11dS1kZWJpYW5odm0te2FtZDY0LGkzODZ9LXhzbQoKVGhpcyBv
Y2N1cnMgaW4gYWxsIHRoZSB1c3VhbCBmbGlnaHRzLgoKMi4gVG8gY2hhbmdlIHRoZSBndWVzdCBh
cmNoIGZyb20gaTM4NiB0byBhbWQ2NCBpbjoKCiAgeGVuLXVuc3RhYmxlLXNtb2tlICAgdGVzdC1h
bWQ2NC1hbWQ2NC14bC1xZW11dS1kZWJpYW5odm0taTM4NgoKSW4gYWxsIGNhc2VzLCB0aGlzIGlt
cGxpZXMgYSB2YXJpZXR5IG9mIGNoYW5nZXMgdG8gcnVudmFycywgaW5jbHVkaW5nCnRoZSBJU08g
dG8gYmUgdXNlZCwgdGhlIGluc3RhbGwgdGltZW91dCwgZXRjLgoKVXN1YWxseSBJIHdvdWxkIGlu
dHJvZHVjZSBuZXcgam9icyBmaXJzdCwgYW5kIHRoZW4sIGFmdGVyIGFuIG92ZXJsYXAsCnJlbW92
ZSBvbGQgb25lcy4gIEJ1dCB0aGUgcmVncmVzc2lvbiwgZHVlIHRvIHRoZSBpMzg2IGh2bSBzdHJl
dGNoCnByb2JsZW0sIGlzIGFscmVhZHkgd2l0aCB1cy4KCkkgZXhwZWN0IHRoaXMgY2hhbmdlIHRv
IHVuYmxvY2sgdGhlIHhlbi11bnN0YWJsZS1zbW9rZSBmbGlnaHRzIGJ5CmRyb3BwaW5nIHRoZSBm
YWlsaW5nIGpvYiBhbmQgcmVwbGFjaW5nIGl0IHdpdGggYSBwYXNzaW5nIG9uZS4KClRoZSBvdGhl
ciBmbGlnaHRzIHdpbGwgbm93IHN0YXJ0IHRvIGZhaWwsIHRob3VnaC4gIEkgd2lsbCBuZWVkLApz
ZXBhcmF0ZWx5LCB0byBkZXZlbG9wIGEgd29ya2Fyb3VuZCBmb3IgdGhlIHN0cmV0Y2ggaTM4NiBo
dm0gZ3Vlc3QKYnVnLgoKQ0M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CkNDOiBKdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CkNDOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25A
ZXUuY2l0cml4LmNvbT4KLS0tCiBtYWtlLWZsaWdodCB8IDExICsrKysrKysrLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21h
a2UtZmxpZ2h0IGIvbWFrZS1mbGlnaHQKaW5kZXggOTJkYWNiMzUuLmM1NDExNDEyIDEwMDc1NQot
LS0gYS9tYWtlLWZsaWdodAorKysgYi9tYWtlLWZsaWdodApAQCAtMTE1LDcgKzExNSw3IEBAIGpv
Yl9jcmVhdGVfdGVzdF9maWx0ZXJfY2FsbGJhY2sgKCkgewogICAgICAgICB0ZXN0LWFtZDY0LWFt
ZDY0LWxpYnZpcnQpICAgICAgICAgICAgICAgICAgcmV0dXJuIDAgOzsKICAgICAgICAgdGVzdC1h
cm1oZi1hcm1oZi14bCkgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAwIDs7CiAgICAgICAg
IHRlc3QtYXJtNjQtYXJtNjQteGwteHNtKSAgICAgICAgICAgICAgICAgICByZXR1cm4gMCA7Owot
ICAgICAgICB0ZXN0LWFtZDY0LWFtZDY0LXhsLXFlbXV1LWRlYmlhbmh2bS1pMzg2KSAgcmV0dXJu
IDAgOzsKKyAgICAgICAgdGVzdC1hbWQ2NC1hbWQ2NC14bC1xZW11dS1kZWJpYW5odm0tYW1kNjQp
IHJldHVybiAwIDs7CiAgICAgICAgICopICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICByZXR1cm4gMSA7OwogICAgICAgZXNhYwogICAgICAgOzsKQEAgLTM1Miw4ICszNTIs
MTMgQEAgZG9faHZtX2RlYmlhbl9uZXN0ZWRfdGVzdHMgKCkgewogCiBicmFuY2hfZGViaWFuaHZt
X2FyY2ggKCkgewogICBjYXNlICRicmFuY2ggaW4KLSAgICB4ZW4tdW5zdGFibGUtc21va2UpIGVj
aG8gaTM4Njs7Ci0gICAgKikgZWNobyBhbWQ2NDs7CisgICAgeGVuLXVuc3RhYmxlLXNtb2tlKSBl
Y2hvIGFtZDY0OzsKKyAgICAqKQorICAgICAgc3RyaXB5IGRlYmlhbmh2bV9hcmNoIGFtZDY0IGkz
ODYgXAorICAgICAgICAgICAgIiR4c20iIHRydWUgXAorICAgICAgICAgICAgIiR0b29sc3RhY2si
IHhsIFwKKyAgICAgICAgICAgICIkc3R1YmRvbSIgJycKKyAgICAgIGVjaG8gJGRlYmlhbmh2bV9h
cmNoOzsKICAgZXNhYwogfQogCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
