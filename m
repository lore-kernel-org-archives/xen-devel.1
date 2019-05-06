Return-Path: <SRS0=pwZ6=TG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA8D6C04AAA
	for <xen-devel@archiver.kernel.org>; Mon,  6 May 2019 06:57:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6500206A3
	for <xen-devel@archiver.kernel.org>; Mon,  6 May 2019 06:57:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6500206A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNXZ0-0002pZ-BB; Mon, 06 May 2019 06:57:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XZcu=TG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hNXYm-0002HI-74
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 06:57:12 +0000
X-Inumbo-ID: 27acf987-6fcc-11e9-843c-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 27acf987-6fcc-11e9-843c-bc764e045a96;
 Mon, 06 May 2019 06:57:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 77F9FAF42;
 Mon,  6 May 2019 06:57:00 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  6 May 2019 08:56:43 +0200
Message-Id: <20190506065644.7415-45-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190506065644.7415-1-jgross@suse.com>
References: <20190506065644.7415-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH RFC V2 44/45] xen/sched: carve out freeing
 sched_item memory into dedicated function
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
Message-ID: <20190506065643.DcMBHFZXVGwvYq9-02EYAsBaGQhJPHwzBgOvllhSAKE@z>

V2UnbGwgbmVlZCBhIHdheSB0byBmcmVlIGEgc2NoZWRfaXRlbSBzdHJ1Y3R1cmUgd2l0aG91dCBz
aWRlIGVmZmVjdHMKaW4gYSBsYXRlciBwYXRjaC4KClNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jv
c3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tClJGQyBWMjogbmV3IHBhdGNoLCBjYXJ2ZWQgb3V0IGZy
b20gUkZDIFYxIHBhdGNoIDQ5Ci0tLQogeGVuL2NvbW1vbi9zY2hlZHVsZS5jIHwgMzYgKysrKysr
KysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0
aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hlZHVs
ZS5jIGIveGVuL2NvbW1vbi9zY2hlZHVsZS5jCmluZGV4IDQ5ZWQyYjU5MDAuLjQzMzZmMmJkZjgg
MTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vc2NoZWR1bGUuYworKysgYi94ZW4vY29tbW9uL3NjaGVk
dWxlLmMKQEAgLTI4MSwyNSArMjgxLDEwIEBAIHN0YXRpYyB2b2lkIHNjaGVkX3NwaW5fdW5sb2Nr
X2RvdWJsZShzcGlubG9ja190ICpsb2NrMSwgc3BpbmxvY2tfdCAqbG9jazIsCiAgICAgc3Bpbl91
bmxvY2tfaXJxcmVzdG9yZShsb2NrMSwgZmxhZ3MpOwogfQogCi1zdGF0aWMgdm9pZCBzY2hlZF9m
cmVlX2l0ZW0oc3RydWN0IHNjaGVkX2l0ZW0gKml0ZW0sIHN0cnVjdCB2Y3B1ICp2KQorc3RhdGlj
IHZvaWQgc2NoZWRfZnJlZV9pdGVtX21lbShzdHJ1Y3Qgc2NoZWRfaXRlbSAqaXRlbSkKIHsKICAg
ICBzdHJ1Y3Qgc2NoZWRfaXRlbSAqcHJldl9pdGVtOwogICAgIHN0cnVjdCBkb21haW4gKmQgPSBp
dGVtLT5kb21haW47Ci0gICAgc3RydWN0IHZjcHUgKnZpdGVtOwotICAgIHVuc2lnbmVkIGludCBj
bnQgPSAwOwotCi0gICAgLyogRG9uJ3QgY291bnQgdG8gYmUgcmVsZWFzZWQgdmNwdSwgbWlnaHQg
YmUgbm90IGluIHZjcHUgbGlzdCB5ZXQuICovCi0gICAgZm9yX2VhY2hfc2NoZWRfaXRlbV92Y3B1
ICggaXRlbSwgdml0ZW0gKQotICAgICAgICBpZiAoIHZpdGVtICE9IHYgKQotICAgICAgICAgICAg
Y250Kys7Ci0KLSAgICB2LT5zY2hlZF9pdGVtID0gTlVMTDsKLQotICAgIGlmICggY250ICkKLSAg
ICAgICAgcmV0dXJuOwotCi0gICAgaWYgKCBpdGVtLT52Y3B1ID09IHYgKQotICAgICAgICBpdGVt
LT52Y3B1ID0gdi0+bmV4dF9pbl9saXN0OwogCiAgICAgaWYgKCBkLT5zY2hlZF9pdGVtX2xpc3Qg
PT0gaXRlbSApCiAgICAgICAgIGQtPnNjaGVkX2l0ZW1fbGlzdCA9IGl0ZW0tPm5leHRfaW5fbGlz
dDsKQEAgLTMyMyw2ICszMDgsMjUgQEAgc3RhdGljIHZvaWQgc2NoZWRfZnJlZV9pdGVtKHN0cnVj
dCBzY2hlZF9pdGVtICppdGVtLCBzdHJ1Y3QgdmNwdSAqdikKICAgICB4ZnJlZShpdGVtKTsKIH0K
IAorc3RhdGljIHZvaWQgc2NoZWRfZnJlZV9pdGVtKHN0cnVjdCBzY2hlZF9pdGVtICppdGVtLCBz
dHJ1Y3QgdmNwdSAqdikKK3sKKyAgICBzdHJ1Y3QgdmNwdSAqdml0ZW07CisgICAgdW5zaWduZWQg
aW50IGNudCA9IDA7CisKKyAgICAvKiBEb24ndCBjb3VudCB0byBiZSByZWxlYXNlZCB2Y3B1LCBt
aWdodCBiZSBub3QgaW4gdmNwdSBsaXN0IHlldC4gKi8KKyAgICBmb3JfZWFjaF9zY2hlZF9pdGVt
X3ZjcHUgKCBpdGVtLCB2aXRlbSApCisgICAgICAgIGlmICggdml0ZW0gIT0gdiApCisgICAgICAg
ICAgICBjbnQrKzsKKworICAgIHYtPnNjaGVkX2l0ZW0gPSBOVUxMOworCisgICAgaWYgKCBpdGVt
LT52Y3B1ID09IHYgKQorICAgICAgICBpdGVtLT52Y3B1ID0gdi0+bmV4dF9pbl9saXN0OworCisg
ICAgaWYgKCAhY250ICkKKyAgICAgICAgc2NoZWRfZnJlZV9pdGVtX21lbShpdGVtKTsKK30KKwog
c3RhdGljIHZvaWQgc2NoZWRfaXRlbV9hZGRfdmNwdShzdHJ1Y3Qgc2NoZWRfaXRlbSAqaXRlbSwg
c3RydWN0IHZjcHUgKnYpCiB7CiAgICAgdi0+c2NoZWRfaXRlbSA9IGl0ZW07Ci0tIAoyLjE2LjQK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
