Return-Path: <SRS0=MgWH=SZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF030C10F14
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 10:55:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96B0520811
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 10:55:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96B0520811
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hIt4s-00089Y-IF; Tue, 23 Apr 2019 10:55:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Jhle=SZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hIt4r-00089D-B5
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2019 10:55:05 +0000
X-Inumbo-ID: 3eabcef4-65b6-11e9-a3a6-2f5c97fa70e5
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3eabcef4-65b6-11e9-a3a6-2f5c97fa70e5;
 Tue, 23 Apr 2019 10:55:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DF68FAE64;
 Tue, 23 Apr 2019 10:55:01 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org
Date: Tue, 23 Apr 2019 12:54:57 +0200
Message-Id: <20190423105457.17502-4-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190423105457.17502-1-jgross@suse.com>
References: <20190423105457.17502-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH 3/3] xen/swiotlb: remember having called
 xen_create_contiguous_region()
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
Cc: Juergen Gross <jgross@suse.com>, boris.ostrovsky@oracle.com,
 sstabellini@kernel.org, konrad.wilk@oracle.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW5zdGVhZCBvZiBhbHdheXMgY2FsbGluZyB4ZW5fZGVzdHJveV9jb250aWd1b3VzX3JlZ2lvbigp
IGluIGNhc2UgdGhlCm1lbW9yeSBpcyBETUEtYWJsZSBmb3IgdGhlIHVzZWQgZGV2aWNlLCBkbyBz
byBvbmx5IGluIGNhc2UgaXQgaGFzIGJlZW4KbWFkZSBETUEtYWJsZSB2aWEgeGVuX2NyZWF0ZV9j
b250aWd1b3VzX3JlZ2lvbigpIGJlZm9yZS4KClRoaXMgd2lsbCBhdm9pZCBhIGxvdCBvZiB4ZW5f
ZGVzdHJveV9jb250aWd1b3VzX3JlZ2lvbigpIGNhbGxzIGZvcgo2NC1iaXQgY2FwYWJsZSBkZXZp
Y2VzLgoKQXMgdGhlIG1lbW9yeSBpbiBxdWVzdGlvbiBpcyBvd25lZCBieSBzd2lvdGxiLXhlbiB0
aGUgUEdfb3duZXJfcHJpdl8xCmZsYWcgb2YgdGhlIGZpcnN0IGFsbG9jYXRlZCBwYWdlIGNhbiBi
ZSB1c2VkIGZvciByZW1lbWJlcmluZy4KClNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpn
cm9zc0BzdXNlLmNvbT4KLS0tCiBkcml2ZXJzL3hlbi9zd2lvdGxiLXhlbi5jIHwgOSArKysrKyst
LS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy94ZW4vc3dpb3RsYi14ZW4uYyBiL2RyaXZlcnMveGVuL3N3aW90bGIt
eGVuLmMKaW5kZXggNDNiNmU2NWFlMjU2Li5hNzJmMTgxZDhlMjAgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMveGVuL3N3aW90bGIteGVuLmMKKysrIGIvZHJpdmVycy94ZW4vc3dpb3RsYi14ZW4uYwpAQCAt
MzIxLDYgKzMyMSw3IEBAIHhlbl9zd2lvdGxiX2FsbG9jX2NvaGVyZW50KHN0cnVjdCBkZXZpY2Ug
Kmh3ZGV2LCBzaXplX3Qgc2l6ZSwKIAkJCXhlbl9mcmVlX2NvaGVyZW50X3BhZ2VzKGh3ZGV2LCBz
aXplLCByZXQsIChkbWFfYWRkcl90KXBoeXMsIGF0dHJzKTsKIAkJCXJldHVybiBOVUxMOwogCQl9
CisJCVNldFBhZ2VPd25lclByaXYxKHZpcnRfdG9fcGFnZShyZXQpKTsKIAl9CiAJbWVtc2V0KHJl
dCwgMCwgc2l6ZSk7CiAJcmV0dXJuIHJldDsKQEAgLTM0NCw5ICszNDUsMTEgQEAgeGVuX3N3aW90
bGJfZnJlZV9jb2hlcmVudChzdHJ1Y3QgZGV2aWNlICpod2Rldiwgc2l6ZV90IHNpemUsIHZvaWQg
KnZhZGRyLAogCS8qIENvbnZlcnQgdGhlIHNpemUgdG8gYWN0dWFsbHkgYWxsb2NhdGVkLiAqLwog
CXNpemUgPSAxVUwgPDwgKG9yZGVyICsgWEVOX1BBR0VfU0hJRlQpOwogCi0JaWYgKChkZXZfYWRk
ciArIHNpemUgLSAxIDw9IGRtYV9tYXNrKSAmJgotCSAgICAhV0FSTl9PTihyYW5nZV9zdHJhZGRs
ZXNfcGFnZV9ib3VuZGFyeShwaHlzLCBzaXplKSkpCi0JCXhlbl9kZXN0cm95X2NvbnRpZ3VvdXNf
cmVnaW9uKHBoeXMsIG9yZGVyKTsKKwlpZiAoUGFnZU93bmVyUHJpdjEodmlydF90b19wYWdlKHZh
ZGRyKSkpIHsKKwkJaWYgKCFXQVJOX09OKHJhbmdlX3N0cmFkZGxlc19wYWdlX2JvdW5kYXJ5KHBo
eXMsIHNpemUpKSkKKwkJCXhlbl9kZXN0cm95X2NvbnRpZ3VvdXNfcmVnaW9uKHBoeXMsIG9yZGVy
KTsKKwkJQ2xlYXJQYWdlT3duZXJQcml2MSh2aXJ0X3RvX3BhZ2UodmFkZHIpKTsKKwl9CiAKIAl4
ZW5fZnJlZV9jb2hlcmVudF9wYWdlcyhod2Rldiwgc2l6ZSwgdmFkZHIsIChkbWFfYWRkcl90KXBo
eXMsIGF0dHJzKTsKIH0KLS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
