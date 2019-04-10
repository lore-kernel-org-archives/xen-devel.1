Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76206C10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:25:49 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BF1020850
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:25:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BF1020850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEEAR-0006ir-Pp; Wed, 10 Apr 2019 14:25:35 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAN-0006X8-EE
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:31 +0000
X-Inumbo-ID: 7dd1db0e-5b9c-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7dd1db0e-5b9c-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 14:25:29 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="83227708"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 10 Apr 2019 15:23:40 +0100
Message-ID: <20190410142408.22848-35-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 34/62] TestSupport: Move `stashed files'
 and `next_unique_name' earlier
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
Message-ID: <20190410142340.5pD6eJwzndH_DzbZo-lt_hXGJ8ChaTwdwDVLHCkekUA@z>

V2UgYXJlIGdvaW5nIHRvIG1ha2UgbW9yZSB1c2Ugb2YgdGhpcyBpbiBpbnRlcnZlbmluZyBjb2Rl
LgoKUHVyZSBjb2RlIG1vdGlvbi4KClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFj
a3NvbkBldS5jaXRyaXguY29tPgotLS0KIE9zc3Rlc3QvVGVzdFN1cHBvcnQucG0gfCA3OCArKysr
KysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDM5IGluc2VydGlvbnMoKyksIDM5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL09z
c3Rlc3QvVGVzdFN1cHBvcnQucG0gYi9Pc3N0ZXN0L1Rlc3RTdXBwb3J0LnBtCmluZGV4IDQxZjZm
NWY4Li5jZTM0NjA5NyAxMDA2NDQKLS0tIGEvT3NzdGVzdC9UZXN0U3VwcG9ydC5wbQorKysgYi9P
c3N0ZXN0L1Rlc3RTdXBwb3J0LnBtCkBAIC0zMDAsNiArMzAwLDQ1IEBAIHN1YiBnZXRfZmlsZWNv
bnRlbnRzICgkOyQpIHsKICAgICByZXR1cm4gJGRhdGE7CiB9CiAKKyMtLS0tLS0tLS0tIHN0YXNo
ZWQgZmlsZXMgLS0tLS0tLS0tLQorCitzdWIgbmV4dF91bmlxdWVfbmFtZSAoJCkgeworICAgIG15
ICgkZm5yZWYpID0gQF87CisgICAgbXkgJG51bSA9ICQkZm5yZWYgPX4gcy9cKyhbMS05XVxkKikk
Ly8gPyAkMSA6IDA7CisgICAgJCRmbnJlZiAuPSAnKycuKCRudW0rMSk7Cit9CisKK3N1YiBvcGVu
X3VuaXF1ZV9zdGFzaGZpbGUgKCQpIHsKKyAgICBteSAoJGxlYWZyZWYpID0gQF87CisgICAgbXkg
JGRoOworICAgIGZvciAoOzspIHsKKyAgICAgICAgbXkgJGRmPSAkJGxlYWZyZWY7CisgICAgICAg
ICRkaD0gbmV3IElPOjpGaWxlICIkc3Rhc2gvJGRmIiwgT19SRFdSfE9fRVhDTHxPX0NSRUFUOwor
ICAgICAgICBsYXN0IGlmICRkaDsKKyAgICAgICAgZGllICIkZGYgJCEiIHVubGVzcyAkIT09JkVF
WElTVDsKKyAgICAgICAgbmV4dF91bmlxdWVfbmFtZSAkbGVhZnJlZjsKKyAgICB9CisgICAgcmV0
dXJuICRkaDsKK30KKworc3ViIGdldF9zdGFzaGVkICgkJCkgeworICAgIG15ICgkcGFyYW0sICRv
dGhlcmZsaWdodGpvYikgPSBAXzsgCisgICAgIyBtYXkgYmUgcnVuIG91dHNpZGUgdHJhbnNhY3Rp
b24sIG9yIHdpdGggZmxpZ2h0cyBsb2NrZWQKKyAgICBteSAoJG9mbGlnaHQsICRvam9iKSA9IG90
aGVyZmxpZ2h0am9iKCRvdGhlcmZsaWdodGpvYik7CisgICAgbXkgJHBhdGg9IGdldF9ydW52YXIo
JHBhcmFtLCAkb3RoZXJmbGlnaHRqb2IpOworICAgIGRpZSAiJHBhdGggJCYgIiBpZgorICAgICAg
ICAkcGF0aCA9fiBtLFteLSsuXzAtOWEtekEtWi9dLCBvcgorICAgICAgICAkcGF0aCA9fiBtL1wu
XC4vOworICAgIHJldHVybiAiJGN7U3Rhc2h9LyRvZmxpZ2h0LyRvam9iLyRwYXRoIjsKK30KKwor
c3ViIGNvbXByZXNzX3N0YXNoZWQoJCkgeworICAgIG15ICgkcGF0aCkgPSBAXzsKKyAgICByZXR1
cm4gdW5sZXNzIC1lICIkc3Rhc2gvJHBhdGgiOworICAgIG15ICRyPSBzeXN0ZW0gJ2d6aXAnLCct
OXZmJywnLS0nLCIkc3Rhc2gvJHBhdGgiOworICAgIGRpZSAiJHIgJCEiIGlmICRyOworfQorCiAj
LS0tLS0tLS0tLSBydW52YXJzIC0tLS0tLS0tLS0KIAogc3ViIHN0b3JlX3J1bnZhciAoJCQpIHsK
QEAgLTU5NywxMiArNjM2LDYgQEAgc3ViIHRhcmdldF9maWxlX2V4aXN0cyAoJCQpIHsKICAgICBk
aWUgIiRyZmlsZSAkb3V0ID8iOwogfQogCi1zdWIgbmV4dF91bmlxdWVfbmFtZSAoJCkgewotICAg
IG15ICgkZm5yZWYpID0gQF87Ci0gICAgbXkgJG51bSA9ICQkZm5yZWYgPX4gcy9cKyhbMS05XVxk
KikkLy8gPyAkMSA6IDA7Ci0gICAgJCRmbnJlZiAuPSAnKycuKCRudW0rMSk7Ci19Ci0KIG91ciAk
dGFyZ2V0X2VkaXRmaWxlX2NhbmNlbF9leGNlcHRpb24gPQogICAgIGJsZXNzIHsgfSwgJ09zc3Rl
c3Q6OlRlc3RTdXBwb3J0OjpUYXJnZXRFZGl0ZmlsZUNhbmNlbEV4Y2VwdGlvbic7CiAKQEAgLTEz
NjksMzkgKzE0MDIsNiBAQCBzdWIgaG9zdG5hbWVwYXRoICgkKSB7CiAgICAgam9pbiAnXycsIHJl
dmVyc2UgQGw7CiB9CiAKLSMtLS0tLS0tLS0tIHN0YXNoZWQgZmlsZXMgLS0tLS0tLS0tLQotCi1z
dWIgb3Blbl91bmlxdWVfc3Rhc2hmaWxlICgkKSB7Ci0gICAgbXkgKCRsZWFmcmVmKSA9IEBfOwot
ICAgIG15ICRkaDsKLSAgICBmb3IgKDs7KSB7Ci0gICAgICAgIG15ICRkZj0gJCRsZWFmcmVmOwot
ICAgICAgICAkZGg9IG5ldyBJTzo6RmlsZSAiJHN0YXNoLyRkZiIsIE9fUkRXUnxPX0VYQ0x8T19D
UkVBVDsKLSAgICAgICAgbGFzdCBpZiAkZGg7Ci0gICAgICAgIGRpZSAiJGRmICQhIiB1bmxlc3Mg
JCE9PSZFRVhJU1Q7Ci0gICAgICAgIG5leHRfdW5pcXVlX25hbWUgJGxlYWZyZWY7Ci0gICAgfQot
ICAgIHJldHVybiAkZGg7Ci19Ci0KLXN1YiBnZXRfc3Rhc2hlZCAoJCQpIHsKLSAgICBteSAoJHBh
cmFtLCAkb3RoZXJmbGlnaHRqb2IpID0gQF87IAotICAgICMgbWF5IGJlIHJ1biBvdXRzaWRlIHRy
YW5zYWN0aW9uLCBvciB3aXRoIGZsaWdodHMgbG9ja2VkCi0gICAgbXkgKCRvZmxpZ2h0LCAkb2pv
YikgPSBvdGhlcmZsaWdodGpvYigkb3RoZXJmbGlnaHRqb2IpOwotICAgIG15ICRwYXRoPSBnZXRf
cnVudmFyKCRwYXJhbSwgJG90aGVyZmxpZ2h0am9iKTsKLSAgICBkaWUgIiRwYXRoICQmICIgaWYK
LSAgICAgICAgJHBhdGggPX4gbSxbXi0rLl8wLTlhLXpBLVovXSwgb3IKLSAgICAgICAgJHBhdGgg
PX4gbS9cLlwuLzsKLSAgICByZXR1cm4gIiRje1N0YXNofS8kb2ZsaWdodC8kb2pvYi8kcGF0aCI7
Ci19Ci0KLXN1YiBjb21wcmVzc19zdGFzaGVkKCQpIHsKLSAgICBteSAoJHBhdGgpID0gQF87Ci0g
ICAgcmV0dXJuIHVubGVzcyAtZSAiJHN0YXNoLyRwYXRoIjsKLSAgICBteSAkcj0gc3lzdGVtICdn
emlwJywnLTl2ZicsJy0tJywiJHN0YXNoLyRwYXRoIjsKLSAgICBkaWUgIiRyICQhIiBpZiAkcjsK
LX0KLQogIy0tLS0tLS0tLS0gb3RoZXIgc3R1ZmYgLS0tLS0tLS0tLQogCiBzdWIgY29tbW9uX3Rv
b2xzdGFjayAoJCkgewotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
