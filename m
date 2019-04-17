Return-Path: <SRS0=ZpmR=ST=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5A5FC282DA
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 16:38:19 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D5F02173C
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 16:38:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D5F02173C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGnZU-0005C6-7x; Wed, 17 Apr 2019 16:38:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fEre=ST=citrix.com=prvs=0036fbe7a=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hGnZS-0005BK-VT
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 16:38:02 +0000
X-Inumbo-ID: 29ddeab0-612f-11e9-ad9d-37b765385a21
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 29ddeab0-612f-11e9-ad9d-37b765385a21;
 Wed, 17 Apr 2019 16:38:00 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,362,1549929600"; d="scan'208";a="83816811"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 17 Apr 2019 17:37:52 +0100
Message-ID: <20190417163752.994-6-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190417163752.994-1-ian.jackson@eu.citrix.com>
References: <20190417163752.994-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH v2 5/5] Debian: Work around Debian
 stretch bug with disk device names
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
Message-ID: <20190417163752.6-PxsbExNgUmcvQB2SE4NsaYipd5Juz85Fk16lo8kMM@z>

VGhlIERlYmlhbiBzdHJldGNoIGkzODYgaW5zdGFsbGVyIGRvZXMgbm90IGhhdmUgWGVuIFBWLW9u
LUhWTSBkcml2ZXJzLgpXaGVuIHdlIHJ1biB0aGUgSFZNIGd1ZXN0IGluc3RhbGxlciwgaXQgdGhl
cmVmb3JlIHNlZXMgL2Rldi9zZGEgKHRoZQplbXVsYXRlZCBJREUpLiAgQnV0IHRoZSBib290ZWQg
c3lzdGVtICpoYXMqIHRoZSBkcml2ZXJzIGFuZCBzZWVzCi9kZXYveHZkYS4KClRoZSBEZWJpYW4g
aW5zdGFsbGVyIGlzIHN1cHBvc2VkIHRvIHB1dCBVVUlEPSBpbiB0aGUgYm9vdGxvYWRlciBjb25m
aWcKYW5kIHNvIG9uIGluIHRoZSBpbnN0YWxsZWQgc3lzdGVtLiAgSG93ZXZlciwgdGhpcyBkb2Vz
IG5vdCB3b3JrIGR1ZSB0bwphIGJ1ZyAoRGViaWFuICM4NTIzMjMpLiAgV29yayBhcm91bmQgaXQu
CgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4K
LS0tCiBPc3N0ZXN0L0RlYmlhbi5wbSB8IDE5ICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBj
aGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvT3NzdGVzdC9EZWJpYW4ucG0g
Yi9Pc3N0ZXN0L0RlYmlhbi5wbQppbmRleCA0MWFhMjhiMC4uNjAwZjE4YjEgMTAwNjQ0Ci0tLSBh
L09zc3Rlc3QvRGViaWFuLnBtCisrKyBiL09zc3Rlc3QvRGViaWFuLnBtCkBAIC04OTMsNiArODkz
LDIzIEBAIEVORAogCiAgICAgcHJlc2VlZF9zc2goJGhvLCAkc2Z4KTsKIAorICAgIGlmICgkc3Vp
dGUgPX4gbS9zdHJldGNoLykgeworCSMgRGViaWFuICM4NTIzMjMuICBPbiBzdHJldGNoIGkzODYg
SFZNIHRoZSBkaXNrIGRldmljZSBpcyBzZGEKKwkjIGluIHRoZSBpbnN0YWxsZXIgZW52aXJvbm1l
bnQgYW5kIHh2ZGEgaW4gdGhlIGluc3RhbGxlZAorCSMgc3lzdGVtLiAgVGhpcyBpc24ndCBzdXBw
b3NlZCB0byBtYXR0ZXIgYmVjYXVzZSB0aGUgaW5zdGFsbGVkCisJIyBzeXN0ZW0gaXMgc3VwcG9z
ZWQgdG8gaGF2ZSByb290PVVVSUQ9Li4uIGluIGl0cyBncnViLmNmZywKKwkjIGJ1dCBkdWUgdG8g
YSBidWcgdGhlIHJlbGV2YW50IHVkZXYgcnVsZXMgYXJlIG5vdCByZXJ1bgorCSMgYmV0d2VlbiB0
aGUgZnMgYmxvY2sgZGV2IGdldHRpbmcgaXRzIHV1aWQgYW5kIHJ1bm5pbmcKKwkjIGdydWIgaW5z
dGFsbC4gIFJlcnVuIHRoZSB1ZGV2IHJ1bGVzIGhlcmUuICBJbiBhIG1vbWVudAorCSMgd2Ugd2ls
bCByZXRyaWdnZXIgdGhlIHVwZGF0ZS1ncnViLi4uCisJcHJlc2VlZF9ob29rX2NvbW1hbmQoJGhv
LCAnbGF0ZV9jb21tYW5kJywgJycsIDw8J0VORCcpOworIyEvYmluL3NoCitzZXQgLWV4CisKK3Vk
ZXZhZG0gdHJpZ2dlcgorRU5ECisgICAgfQorCiAgICAgcHJlc2VlZF9ob29rX2NvbW1hbmQoJGhv
LCAnbGF0ZV9jb21tYW5kJywgJycsIDw8J0VORCcpOwogIyEvYmluL3NoCiBzZXQgLWV4CkBAIC05
MDIsNiArOTE5LDggQEAgaWYgWyAtZiAvdGFyZ2V0JGdydWIgXSA7IHRoZW4KICAgICBpbi10YXJn
ZXQgc2VkIC1pIFwKICAgICAgICAgJ3MvXlwoR1JVQl9DTURMSU5FX0xJTlVYX0RFRkFVTFQ9Ii4q
XClcYnF1aWV0XGJcKC4qIlwpJC9cMVwyL2cnIFwKICAgICAgICAgJGdydWIKKyAgICAjIG5lZWRl
ZCBmb3IgdGhlIHJlbW92YWwgb2YgInF1aWV0IiB0byB0YWtlIGVmZmVjdCBidXQKKyAgICAjIGFs
c28gdG8gcGljayB1cCB0aGUgIzg1MjMyMyB3b3JrYXJvdW5kIChzZWUgYWJvdmUpLgogICAgIGlu
LXRhcmdldCB1cGRhdGUtZ3J1YgogZmkKIEVORAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
