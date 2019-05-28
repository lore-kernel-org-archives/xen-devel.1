Return-Path: <SRS0=r6zo=T4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DD05C04E84
	for <xen-devel@archiver.kernel.org>; Tue, 28 May 2019 10:33:37 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F1702075C
	for <xen-devel@archiver.kernel.org>; Tue, 28 May 2019 10:33:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F1702075C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVZQ1-0004XI-Hd; Tue, 28 May 2019 10:33:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=31/0=T4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hVZQ0-0004X7-FJ
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 10:33:20 +0000
X-Inumbo-ID: 00dc4330-8134-11e9-baca-f707ef87a1cd
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 00dc4330-8134-11e9-baca-f707ef87a1cd;
 Tue, 28 May 2019 10:33:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 012A7AE4D;
 Tue, 28 May 2019 10:33:15 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 28 May 2019 12:32:14 +0200
Message-Id: <20190528103313.1343-2-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190528103313.1343-1-jgross@suse.com>
References: <20190528103313.1343-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH 01/60] xen/sched: only allow schedulers with all
 mandatory functions available
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
 George Dunlap <george.dunlap@eu.citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190528103214.Oiwnp3tKtMRVt6V6IRL3bpKzxYjZhnIoxr4ZQ0vJiGQ@z>

U29tZSBmdW5jdGlvbnMgb2Ygc3RydWN0IHNjaGVkdWxlciBhcmUgbWFuZGF0b3J5LiBUZXN0IHRo
b3NlIGluIHRoZQpzY2hlZHVsZXIgaW5pdGlhbGl6YXRpb24gbG9vcCB0byBiZSBwcmVzZW50IGFu
ZCBkcm9wIHNjaGVkdWxlcnMgbm90CmNvbXBseWluZy4KClNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4g
R3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tClYxOiBuZXcgcGF0Y2gKLS0tCiB4ZW4vY29tbW9u
L3NjaGVkdWxlLmMgfCAyNiArKysrKysrKysrKysrKysrKysrKysrKysrLQogMSBmaWxlIGNoYW5n
ZWQsIDI1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS94ZW4vY29t
bW9uL3NjaGVkdWxlLmMgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKaW5kZXggNjZmMWUyNjExYi4u
NzJkOGJlMzkwNiAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9zY2hlZHVsZS5jCisrKyBiL3hlbi9j
b21tb24vc2NoZWR1bGUuYwpAQCAtMTcyNiw5ICsxNzI2LDMzIEBAIHZvaWQgX19pbml0IHNjaGVk
dWxlcl9pbml0KHZvaWQpCiAKICAgICBmb3IgKCBpID0gMDsgaSA8IE5VTV9TQ0hFRFVMRVJTOyBp
KyspCiAgICAgeworI2RlZmluZSBzY2hlZF90ZXN0X2Z1bmMoZikgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXAorICAgICAgICBpZiAoICFzY2hlZHVsZXJzW2ldLT5mICkgICAgICAgICAg
ICAgICAgICAgICAgICAgXAorICAgICAgICB7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXAorICAgICAgICAgICAgcHJpbnRrKCJzY2hlZHVsZXIgJXMgbWlz
c2VzIC4lcywgZHJvcHBlZFxuIiwgXAorICAgICAgICAgICAgICAgICAgIHNjaGVkdWxlcnNbaV0t
Pm9wdF9uYW1lLCAjZik7ICAgICAgICAgXAorICAgICAgICAgICAgc2NoZWR1bGVyc1tpXSA9IE5V
TEw7ICAgICAgICAgICAgICAgICAgICAgICAgXAorICAgICAgICB9CisKKyAgICAgICAgc2NoZWRf
dGVzdF9mdW5jKGluaXQpOworICAgICAgICBzY2hlZF90ZXN0X2Z1bmMoZGVpbml0KTsKKyAgICAg
ICAgc2NoZWRfdGVzdF9mdW5jKHBpY2tfY3B1KTsKKyAgICAgICAgc2NoZWRfdGVzdF9mdW5jKGFs
bG9jX3ZkYXRhKTsKKyAgICAgICAgc2NoZWRfdGVzdF9mdW5jKGZyZWVfdmRhdGEpOworICAgICAg
ICBzY2hlZF90ZXN0X2Z1bmMoc3dpdGNoX3NjaGVkKTsKKyAgICAgICAgc2NoZWRfdGVzdF9mdW5j
KGRvX3NjaGVkdWxlKTsKKworI3VuZGVmIHNjaGVkX3Rlc3RfZnVuYworCiAgICAgICAgIGlmICgg
c2NoZWR1bGVyc1tpXS0+Z2xvYmFsX2luaXQgJiYgc2NoZWR1bGVyc1tpXS0+Z2xvYmFsX2luaXQo
KSA8IDAgKQorICAgICAgICB7CisgICAgICAgICAgICBwcmludGsoInNjaGVkdWxlciAlcyBmYWls
ZWQgaW5pdGlhbGl6YXRpb24sIGRyb3BwZWRcbiIsCisgICAgICAgICAgICAgICAgICAgc2NoZWR1
bGVyc1tpXS0+b3B0X25hbWUpOwogICAgICAgICAgICAgc2NoZWR1bGVyc1tpXSA9IE5VTEw7Ci0g
ICAgICAgIGVsc2UgaWYgKCAhb3BzLm5hbWUgJiYgIXN0cmNtcChzY2hlZHVsZXJzW2ldLT5vcHRf
bmFtZSwgb3B0X3NjaGVkKSApCisgICAgICAgIH0KKworICAgICAgICBpZiAoIHNjaGVkdWxlcnNb
aV0gJiYgIW9wcy5uYW1lICYmCisgICAgICAgICAgICAgIXN0cmNtcChzY2hlZHVsZXJzW2ldLT5v
cHRfbmFtZSwgb3B0X3NjaGVkKSApCiAgICAgICAgICAgICBvcHMgPSAqc2NoZWR1bGVyc1tpXTsK
ICAgICB9CiAKLS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
