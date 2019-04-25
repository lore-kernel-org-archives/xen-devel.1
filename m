Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48FEFC43219
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 15:51:22 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F4AB2077C
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 15:51:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F4AB2077C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJgeV-0002ss-HS; Thu, 25 Apr 2019 15:51:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JXZu=S3=citrix.com=prvs=011b70836=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hJgeU-0002s7-D3
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 15:51:10 +0000
X-Inumbo-ID: f095de9a-6771-11e9-be76-9337133c23b6
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f095de9a-6771-11e9-be76-9337133c23b6;
 Thu, 25 Apr 2019 15:51:08 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,394,1549929600"; d="scan'208";a="84415685"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 25 Apr 2019 16:50:54 +0100
Message-ID: <20190425155056.23145-5-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190425155056.23145-1-ian.jackson@eu.citrix.com>
References: <20190425155056.23145-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 4/6] Debian: preferred arch: Honour
 LinuxKernPreferredArchInfo
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
Message-ID: <20190425155054.RNIP8fQgQ7Om3NlGaSlWOBvCXzrWRRZ76TmowvoXx00@z>

Tm90aGluZyBzZXRzIHRoaXMgeWV0LgoKU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5q
YWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogT3NzdGVzdC9EZWJpYW4ucG0gfCAzOCArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDM4IGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9Pc3N0ZXN0L0RlYmlhbi5wbSBiL09zc3Rlc3QvRGViaWFu
LnBtCmluZGV4IDYwMGYxOGIxLi5hZGRhYWFkMiAxMDA2NDQKLS0tIGEvT3NzdGVzdC9EZWJpYW4u
cG0KKysrIGIvT3NzdGVzdC9EZWJpYW4ucG0KQEAgLTEzMzQsNiArMTMzNCw0NCBAQCBFTkQKIAlw
cmVzZWVkX2hvb2tfY29tbWFuZCgkaG8sICdsYXRlX2NvbW1hbmQnLCAkc2Z4LCAkY21kcyk7CiAg
ICAgfSk7CiAKKyAgICBteSAka2Vybl9hcmNoX2luZm8gPSAkeG9wdHN7TGludXhLZXJuUHJlZmVy
cmVkQXJjaEluZm99OworICAgICMgTGludXhLZXJuUHJlZmVycmVkQXJjaEluZm8gY29udGFpbnMK
KyAgICAjICAgIEtlcm5lbF9EZWJpYW4gICAgIHRoZSBEZWJpYW4gYXJjaCBmb3IgdGhlIGtlcm5l
bCB3ZSB3b3VsZCBwcmVmZXIKKyAgICBteSAka2Vybl9hcmNoID0gJGtlcm5fYXJjaF9pbmZvLT57
S2VybmVsX0RlYmlhbn07CisgICAgaWYgKCRrZXJuX2FyY2ggJiYKKwkkaG8tPntGbGFnc317ImFy
Y2gtJHJ7YXJjaH0ifSAmJiAhJGhvLT57RmxhZ3N9eyJhcmNoLSRrZXJuX2FyY2gifSkgeworCSMg
V2UgY2hlY2sgdGhlIGZsYWcgZm9yICRye2FyY2h9IGJlY2F1c2UgZm9yIHZhcmlvdXMgcmVhc29u
cworCSMgaXQgbWF5IG5vdCBiZSBzZXQuICBGb3IgZXhhbXBsZSwgaW4gc3RhbmRhbG9uZSBtb2Rl
IGl0IGlzCisJIyBjdXJyZW50bHkgbm90IG5vcm1hbGx5IG5lY2Vzc2FyeSB0byBzZXQgYW55IGFy
Y2ggaG9zdGZsYWdzLgorCSMgSW4gdGhhdCBzaXR1YXRpb24gd2UgYmV0IHRoYXQgdGhlIGtlcm4g
YXJjaCBjYW4gYmUgdXNlZDsKKwkjIHRoaXMgaXMgYSBnb29kIGJldCBiZWNhdXNlIGN1cnJlbnRs
eSB0aGlzIGlzIHVzZWQgZm9yCisJIyBydW5uaW5nIGFtZDY0IGtlcm5lbHMgd2l0aCBpMzg2IHVz
ZXJsYW5kIGFuZCBob3N0cyB0aGF0IGNhbgorCSMgZG8gb25seSBpMzg2IGFyZSBmYWlybHkgcmFy
ZSwgZXNwZWNpYWxseSBzZXJ2ZXIgaG9zdHMuCisJIyBJZiB0aGlzIGNhdXNlcyBhIHByb2JsZW0s
IHNldHRpbmcgdGhlIGkzODYgaG9zdCBmbGFnIHdpbGwKKwkjIChzb21ld2hhdCBjb3VudGVyaW50
dWl0aXZlbHkpIGNhdXNlIHRoaXMgY2hlY2sgdG8gbWlzcworCSMgdGhlIGFtZDY0IGhvc3QgZmxh
ZworCWxvZ20oIk5PVCB1c2luZyAka2Vybl9hcmNoIGtlcm5lbCAoZmxhZ3Mgc2F5IG5vdCBzdXBw
b3J0ZWQgYnkgaG9zdCkiKTsKKwkka2Vybl9hcmNoID0gdW5kZWY7CisgICAgfQorICAgIGlmICgk
a2Vybl9hcmNoKSB7CisJbG9nbSgiVXNpbmcgJGtlcm5fYXJjaCBrZXJuZWwgZm9yICRye2FyY2h9
IHVzZXJsYW5kIik7CisJcHJlc2VlZF9ob29rX2NvbW1hbmQoJGhvLCAnbGF0ZV9jb21tYW5kJywg
JHNmeCwgPDxFTkQpOworIyEvYmluL3NoCitzZXQgLWV4Citpbi10YXJnZXQgc2ggLXhlYyAnCisg
ICAgIyB0aGUgJHJ7YXJjaH0ga2VybmVscyBlbmQgdXAgYmVpbmcgdGhlIGRlZmF1bHQgc28gc2h1
ZmZsZSB0aGVtCisgICAgIyB3aGVyZSB1cGRhdGUtZ3J1YiB3aWxsIG5vdCBmaW5kIHRoZW0KKyAg
ICBmb3IgZiBpbiAvYm9vdC92bWxpbnUqOyBkbworICAgICAgICBkcGtnLWRpdmVydCAtLXJlbmFt
ZSAtLWRpdmVydCAiL2Jvb3QvfmRpc2FibGV+XCR7ZiMjKi99IiAiXCRmIgorICAgIGRvbmUKKyAg
ICBkcGtnIC0tYWRkLWFyY2hpdGVjdHVyZSAka2Vybl9hcmNoCisgICAgYXB0LWdldCB1cGRhdGUK
KyAgICBhcHQtZ2V0IGluc3RhbGwgLWYgLXkgbGludXgtaW1hZ2UtJGtlcm5fYXJjaAorICAgIHVw
ZGF0ZS1ncnViCisnCitFTkQKKyAgICB9CisKICAgICBpZiAoICRoby0+e0ZsYWdzfXsnbmVlZC11
Ym9vdC1ib290c2NyJ30gKSB7CiAJbXkgQGJvb3RhcmdzID0gdWJvb3RfY29tbW9uX2tlcm5lbF9i
b290YXJncygkaG8pOwogCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
