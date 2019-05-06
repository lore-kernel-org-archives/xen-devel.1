Return-Path: <SRS0=pwZ6=TG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90D9AC04AAD
	for <xen-devel@archiver.kernel.org>; Mon,  6 May 2019 06:57:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C92B206A3
	for <xen-devel@archiver.kernel.org>; Mon,  6 May 2019 06:57:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C92B206A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNXYj-0002CA-QF; Mon, 06 May 2019 06:57:09 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XZcu=TG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hNXYf-00022u-FF
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 06:57:05 +0000
X-Inumbo-ID: 2758fdee-6fcc-11e9-843c-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2758fdee-6fcc-11e9-843c-bc764e045a96;
 Mon, 06 May 2019 06:57:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AC0F8ABC7;
 Mon,  6 May 2019 06:56:59 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  6 May 2019 08:56:40 +0200
Message-Id: <20190506065644.7415-42-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190506065644.7415-1-jgross@suse.com>
References: <20190506065644.7415-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH RFC V2 41/45] xen/sched: add a percpu resource
 index
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
Message-ID: <20190506065640._cXU703JgxXbBdyXanivFhQ9i5XhAjVVHhS_qFpVhlg@z>

QWRkIGEgcGVyY3B1IHZhcmlhYmxlIGhvbGRpbmcgdGhlIGluZGV4IG9mIHRoZSBjcHUgaW4gdGhl
IGN1cnJlbnQKc2NoZWRfcmVzb3VyY2Ugc3RydWN0dXJlLiBUaGlzIGluZGV4IGlzIHVzZWQgdG8g
Z2V0IHRoZSBjb3JyZWN0IHZjcHUKb2YgYSBzY2hlZF9pdGVtIG9uIGEgc3BlY2lmaWMgY3B1LgoK
Rm9yIG5vdyB0aGlzIGluZGV4IHdpbGwgYmUgemVybyBmb3IgYWxsIGNwdXMsIGJ1dCB3aXRoIGNv
cmUgc2NoZWR1bGluZwppdCB3aWxsIGJlIHBvc3NpYmxlIHRvIGhhdmUgaGlnaGVyIHZhbHVlcywg
dG9vLgoKU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgotLS0K
UkZDIFYyOiBuZXcgcGF0Y2ggKGNhcnZlZCBvdXQgZnJvbSBSRkMgVjEgcGF0Y2ggNDkpCi0tLQog
eGVuL2NvbW1vbi9zY2hlZHVsZS5jIHwgMTEgKysrKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA5
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9z
Y2hlZHVsZS5jIGIveGVuL2NvbW1vbi9zY2hlZHVsZS5jCmluZGV4IDhhODgyOGU3NzIuLjBkZTE5
OWNjYzkgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vc2NoZWR1bGUuYworKysgYi94ZW4vY29tbW9u
L3NjaGVkdWxlLmMKQEAgLTY4LDYgKzY4LDcgQEAgc3RhdGljIHZvaWQgcG9sbF90aW1lcl9mbih2
b2lkICpkYXRhKTsKIC8qIFRoaXMgaXMgZ2xvYmFsIGZvciBub3cgc28gdGhhdCBwcml2YXRlIGlt
cGxlbWVudGF0aW9ucyBjYW4gcmVhY2ggaXQgKi8KIERFRklORV9QRVJfQ1BVKHN0cnVjdCBzY2hl
ZHVsZXIgKiwgc2NoZWR1bGVyKTsKIERFRklORV9QRVJfQ1BVKHN0cnVjdCBzY2hlZF9yZXNvdXJj
ZSAqLCBzY2hlZF9yZXMpOworc3RhdGljIERFRklORV9QRVJfQ1BVKHVuc2lnbmVkIGludCwgc2No
ZWRfcmVzX2lkeCk7CiAKIC8qIFNjcmF0Y2ggc3BhY2UgZm9yIGNwdW1hc2tzLiAqLwogREVGSU5F
X1BFUl9DUFUoY3B1bWFza190LCBjcHVtYXNrX3NjcmF0Y2gpOwpAQCAtNzgsNiArNzksMTIgQEAg
ZXh0ZXJuIGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKl9fc3RhcnRfc2NoZWR1bGVyc19hcnJheVtd
LCAqX19lbmRfc2NoZWR1bGVyc19hcnIKIAogc3RhdGljIHN0cnVjdCBzY2hlZHVsZXIgX19yZWFk
X21vc3RseSBvcHM7CiAKK3N0YXRpYyBpbmxpbmUgc3RydWN0IHZjcHUgKnNjaGVkX2l0ZW0ydmNw
dV9jcHUoc3RydWN0IHNjaGVkX2l0ZW0gKml0ZW0sCisgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBjcHUpCit7CisgICAgcmV0dXJuIGl0
ZW0tPmRvbWFpbi0+dmNwdVtpdGVtLT5pdGVtX2lkICsgcGVyX2NwdShzY2hlZF9yZXNfaWR4LCBj
cHUpXTsKK30KKwogc3RhdGljIGlubGluZSBzdHJ1Y3Qgc2NoZWR1bGVyICpkb21fc2NoZWR1bGVy
KGNvbnN0IHN0cnVjdCBkb21haW4gKmQpCiB7CiAgICAgaWYgKCBsaWtlbHkoZC0+Y3B1cG9vbCAh
PSBOVUxMKSApCkBAIC0xODQ0LDcgKzE4NTEsNyBAQCBzdGF0aWMgdm9pZCBzY2hlZF9zbGF2ZSh2
b2lkKQogCiAgICAgcGNwdV9zY2hlZHVsZV91bmxvY2tfaXJxKGxvY2ssIGNwdSk7CiAKLSAgICBz
Y2hlZF9jb250ZXh0X3N3aXRjaCh2cHJldiwgbmV4dC0+dmNwdSwgbm93KTsKKyAgICBzY2hlZF9j
b250ZXh0X3N3aXRjaCh2cHJldiwgc2NoZWRfaXRlbTJ2Y3B1X2NwdShuZXh0LCBjcHUpLCBub3cp
OwogfQogCiAvKgpAQCAtMTkwMyw3ICsxOTEwLDcgQEAgc3RhdGljIHZvaWQgc2NoZWR1bGUodm9p
ZCkKIAogICAgIHBjcHVfc2NoZWR1bGVfdW5sb2NrX2lycShsb2NrLCBjcHUpOwogCi0gICAgdm5l
eHQgPSBuZXh0LT52Y3B1OworICAgIHZuZXh0ID0gc2NoZWRfaXRlbTJ2Y3B1X2NwdShuZXh0LCBj
cHUpOwogICAgIHNjaGVkX2NvbnRleHRfc3dpdGNoKHZwcmV2LCB2bmV4dCwgbm93KTsKIH0KIAot
LSAKMi4xNi40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
