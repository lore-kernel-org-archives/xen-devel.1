Return-Path: <SRS0=LbOi=SU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 278B0C10F0E
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 16:32:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 044832183F
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 16:32:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 044832183F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hH9xP-000287-FH; Thu, 18 Apr 2019 16:32:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tvKn=SU=citrix.com=prvs=004dc2360=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hH9xN-00025i-O2
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 16:32:13 +0000
X-Inumbo-ID: 83ee2663-61f7-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 83ee2663-61f7-11e9-92d7-bc764e045a96;
 Thu, 18 Apr 2019 16:32:11 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,366,1549929600"; d="scan'208";a="83913792"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 18 Apr 2019 17:31:43 +0100
Message-ID: <20190418163158.11408-7-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
References: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 06/21] starvation: Teach archaeologists
 about starved job state
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
Message-ID: <20190418163143.dVIYgk4raSLChWp9N31dsRt7i5q2jamw-YXkgHghTfM@z>

c2ctcmVwb3J0LWZsaWdodCBpcyBhIGJpdCBhd2t3YXJkLiAgSXQgdGhpbmtzIG1vc3RseSBhYm91
dCBzdGVwCnN0YXR1cywgbm90IGpvYiBzdGF0dXMuICBTbywgd2hlbiBqdXN0aWZ5aW5nLCBpZiB3
ZSBkb24ndCBmaW5kIGEgc3RlcCwKYW5kIHRoZSBqb2Igc3RhdGUgaXMgc3RhcnZlZCwgd2UgdHJl
YXQgdGhlIHN0ZXAgYXMgc3RhcnZlZC4KCklmIHRoZXJlIGFyZSBvbmx5IHN0YXJ2ZWQgc3RlcHMs
IHRoZW4gd2UgZG9uJ3QgaGF2ZSBldmlkZW5jZSB0aGF0IHRoaXMKaXMgYSByZWdyZXNzaW9uLCBi
ZWNhdXNlIHRoZSB0ZXN0IHdhc24ndCBydW4gaW4gdGhlIGJhc2VsaW5lLgoKSWYgdGhlcmUgYXJl
IG90aGVyIHN0ZXBzIHdlIGxvb2sgYXQgdGhvc2UgaW5zdGVhZC4KClNpZ25lZC1vZmYtYnk6IElh
biBKYWNrc29uIDxJYW4uSmFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIE9zc3Rlc3QvRXhlY3V0
aXZlLnBtIHwgIDQgKystLQogc2ctcmVwb3J0LWZsaWdodCAgICAgfCAxMSArKysrKysrKysrKwog
MiBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL09zc3Rlc3QvRXhlY3V0aXZlLnBtIGIvT3NzdGVzdC9FeGVjdXRpdmUucG0KaW5kZXgg
YjI3YjhkMjUuLmE5ZjlhYzc4IDEwMDY0NAotLS0gYS9Pc3N0ZXN0L0V4ZWN1dGl2ZS5wbQorKysg
Yi9Pc3N0ZXN0L0V4ZWN1dGl2ZS5wbQpAQCAtMzYyLDggKzM2Miw4IEBAIEVORAogCSAgICBDb250
ZW50ID0+IChqb2luICIgfCAiLCBAY29udGVudCksCiAJICAgIENvbG91ckF0dHIgPT4gImJnY29s
b3I9XCIkZmFpbGNvbG91clwiIiwKIAl9OwotICAgIH0gZWxzaWYgKCRzdGF0dXMgZXEgJ2Jsb2Nr
ZWQnKSB7Ci0gICAgICAgIHJldHVybiAkc2luZ2xlLT4oImJsb2NrZWQiLCAkcHVycGxlKSwKKyAg
ICB9IGVsc2lmICgkc3RhdHVzIGVxICdibG9ja2VkJyBvciAkc3RhdHVzIGVxICdzdGFydmVkJykg
eworICAgICAgICByZXR1cm4gJHNpbmdsZS0+KCRzdGF0dXMsICRwdXJwbGUpLAogICAgIH0gZWxz
aWYgKCRzdGF0dXMgZXEgJ3F1ZXVlZCcpIHsKICAgICAgICAgcmV0dXJuICRzaW5nbGUtPigiKCRz
dGF0dXMpIiwgJGdyZXlfZGFyayksCiAgICAgfSBlbHNpZiAoJHN0YXR1cyBlcSAncHJlcGFyaW5n
JykgewpkaWZmIC0tZ2l0IGEvc2ctcmVwb3J0LWZsaWdodCBiL3NnLXJlcG9ydC1mbGlnaHQKaW5k
ZXggMjY3N2M0NzkuLjZjNDgxZjZmIDEwMDc1NQotLS0gYS9zZy1yZXBvcnQtZmxpZ2h0CisrKyBi
L3NnLXJlcG9ydC1mbGlnaHQKQEAgLTE2MCw2ICsxNjAsMTAgQEAgc3ViIGZpbmRhZmxpZ2h0ICgk
JCQkJCkgewogICAgICAgICByZXR1cm4gdW5kZWY7CiAgICAgfQogCisgICAgbXkgJGpjaGVja3E9
IGRiX3ByZXBhcmUoPDxFTkQpOworICAgICAgICBTRUxFQ1Qgc3RhdHVzIEZST00gam9icyBXSEVS
RSBmbGlnaHQ9PyBBTkQgam9iPT8KK0VORAorCiAgICAgbXkgJGNoZWNrcT0gZGJfcHJlcGFyZSg8
PEVORCk7CiAgICAgICAgIFNFTEVDVCBzdGF0dXMgRlJPTSBzdGVwcyBXSEVSRSBmbGlnaHQ9PyBB
TkQgam9iPT8gQU5EIHRlc3RpZD0/CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IEFORCBzdGF0dXMhPSdza2lwJwpAQCAtMzE3LDYgKzMyMSwxMSBAQCBFTkQKICAgICAgICAgaWYg
KCFkZWZpbmVkICR3aHlub3QgJiYgZGVmaW5lZCAkam9iKSB7CiAgICAgICAgICAgICAkY2hlY2tx
LT5leGVjdXRlKCR0ZmxpZ2h0LCAkam9iLCAkdGVzdGlkKTsKICAgICAgICAgICAgICgkY2hrc3Qp
ID0gJGNoZWNrcS0+ZmV0Y2hyb3dfYXJyYXkoKTsKKwkgICAgaWYgKCFkZWZpbmVkICRjaGtzdCkg
eworCQkkamNoZWNrcS0+ZXhlY3V0ZSgkdGZsaWdodCwgJGpvYik7CisJCW15ICgkamNoa3N0KSA9
ICRqY2hlY2txLT5mZXRjaHJvd19hcnJheSgpOworCQkkY2hrc3QgPSAkamNoa3N0IGlmICRqY2hr
c3QgZXEgJ3N0YXJ2ZWQnOworCSAgICB9CiAgICAgICAgIH0KICAgICAgICAgJHdoeW5vdD0gJHN1
Yi0+KCR0ZmxpZ2h0LCAkY2hrc3QpIGlmICFkZWZpbmVkICR3aHlub3Q7CiAgICAgICAgIGlmICgh
ZGVmaW5lZCAkd2h5bm90KSB7CkBAIC04NjEsNiArODcwLDggQEAgRU5ECiAgICAgICAgICAgICAg
ICAgbXkgJHRibG9ja2VyID0gJHN0IGVxICdmYWlsJyA/ICdyZWdyZXNzaW9uJyA6ICRzdDsKICAg
ICAgICAgICAgICAgICBteSAkdHByaW9yaXR5ID0gJGotPntqb2J9ID1+IG0vXmJ1aWxkLyA/IDYw
MCA6IDEwMDsKIAkJJHJ0dXA9IFsgJHRwcmlvcml0eSwgJHRibG9ja2VyLCAiUkVHUi4gdnMuIiwg
JGNoa2ZsaWdodCBdOworCSAgICB9IGVsc2lmICgkY2hrc3QgZXEgJ3N0YXJ2ZWQnKSB7ICMgYWN0
dWFsbHksIHRoZSBqb2Igd2FzICdzdGFydmVkJworCQkkcnR1cD0gWyA1MCwgJycsICJzdGFydmVk
IGluIiwgJGNoa2ZsaWdodCBdOwogCSAgICB9IGVsc2UgewogCQkkcnR1cD0gWyAxNzAsICcnLCAi
JGNoa3N0IGluIiwgJGNoa2ZsaWdodCBdOwogCSAgICB9Ci0tIAoyLjExLjAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
