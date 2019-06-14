Return-Path: <SRS0=aUBB=UN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D9A8C31E4C
	for <xen-devel@archiver.kernel.org>; Fri, 14 Jun 2019 05:46:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D8DF2133D
	for <xen-devel@archiver.kernel.org>; Fri, 14 Jun 2019 05:46:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D8DF2133D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbf2T-0003z4-Eh; Fri, 14 Jun 2019 05:46:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Qdkl=UN=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hbf2S-0003yp-9A
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 05:46:12 +0000
X-Inumbo-ID: b549d1a8-8e67-11e9-9fb6-ef8aaffef556
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b549d1a8-8e67-11e9-9fb6-ef8aaffef556;
 Fri, 14 Jun 2019 05:46:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 05224AF0B;
 Fri, 14 Jun 2019 05:46:07 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org
Date: Fri, 14 Jun 2019 07:46:02 +0200
Message-Id: <20190614054604.30101-2-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190614054604.30101-1-jgross@suse.com>
References: <20190614054604.30101-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v3 1/3] xen/swiotlb: fix condition for calling
 xen_destroy_contiguous_region()
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
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, stable@vger.kernel.org,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGNvbmRpdGlvbiBpbiB4ZW5fc3dpb3RsYl9mcmVlX2NvaGVyZW50KCkgZm9yIGRlY2lkaW5n
IHdoZXRoZXIgdG8KY2FsbCB4ZW5fZGVzdHJveV9jb250aWd1b3VzX3JlZ2lvbigpIGlzIHdyb25n
OiBpbiBjYXNlIHRoZSByZWdpb24gdG8KYmUgZnJlZWQgaXMgbm90IGNvbnRpZ3VvdXMgY2FsbGlu
ZyB4ZW5fZGVzdHJveV9jb250aWd1b3VzX3JlZ2lvbigpIGlzCnRoZSB3cm9uZyB0aGluZyB0byBk
bzogaXQgd291bGQgcmVzdWx0IGluIGluY29uc2lzdGVudCBtYXBwaW5ncyBvZgptdWx0aXBsZSBQ
Rk5zIHRvIHRoZSBzYW1lIE1GTi4gVGhpcyB3aWxsIGxlYWQgdG8gdmFyaW91cyBzdHJhbmdlCmNy
YXNoZXMgb3IgZGF0YSBjb3JydXB0aW9uLgoKSW5zdGVhZCBvZiBjYWxsaW5nIHhlbl9kZXN0cm95
X2NvbnRpZ3VvdXNfcmVnaW9uKCkgaW4gdGhhdCBjYXNlIGEKd2FybmluZyBzaG91bGQgYmUgaXNz
dWVkIGFzIHRoYXQgc2l0dWF0aW9uIHNob3VsZCBuZXZlciBvY2N1ci4KCkNjOiBzdGFibGVAdmdl
ci5rZXJuZWwub3JnClNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNv
bT4KUmV2aWV3ZWQtYnk6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5j
b20+ClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Ci0tLQpWMjog
YWx3YXlzIGlzc3VlIGEgd2FybmluZyBpbiBjYXNlIHhlbl9kZXN0cm95X2NvbnRpZ3VvdXNfcmVn
aW9uKCkKICAgIGlzbid0IGNhbGxlZCAoSmFuIEJldWxpY2gpCi0tLQogZHJpdmVycy94ZW4vc3dp
b3RsYi14ZW4uYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi9zd2lvdGxiLXhlbi5jIGIvZHJp
dmVycy94ZW4vc3dpb3RsYi14ZW4uYwppbmRleCBkNTNmMzQ5M2E2YjkuLjUwZmQ3ZGU1NDk2OSAx
MDA2NDQKLS0tIGEvZHJpdmVycy94ZW4vc3dpb3RsYi14ZW4uYworKysgYi9kcml2ZXJzL3hlbi9z
d2lvdGxiLXhlbi5jCkBAIC0zNjEsOCArMzYxLDggQEAgeGVuX3N3aW90bGJfZnJlZV9jb2hlcmVu
dChzdHJ1Y3QgZGV2aWNlICpod2Rldiwgc2l6ZV90IHNpemUsIHZvaWQgKnZhZGRyLAogCS8qIENv
bnZlcnQgdGhlIHNpemUgdG8gYWN0dWFsbHkgYWxsb2NhdGVkLiAqLwogCXNpemUgPSAxVUwgPDwg
KG9yZGVyICsgWEVOX1BBR0VfU0hJRlQpOwogCi0JaWYgKCgoZGV2X2FkZHIgKyBzaXplIC0gMSA8
PSBkbWFfbWFzaykpIHx8Ci0JICAgIHJhbmdlX3N0cmFkZGxlc19wYWdlX2JvdW5kYXJ5KHBoeXMs
IHNpemUpKQorCWlmICghV0FSTl9PTigoZGV2X2FkZHIgKyBzaXplIC0gMSA+IGRtYV9tYXNrKSB8
fAorCQkgICAgIHJhbmdlX3N0cmFkZGxlc19wYWdlX2JvdW5kYXJ5KHBoeXMsIHNpemUpKSkKIAkJ
eGVuX2Rlc3Ryb3lfY29udGlndW91c19yZWdpb24ocGh5cywgb3JkZXIpOwogCiAJeGVuX2ZyZWVf
Y29oZXJlbnRfcGFnZXMoaHdkZXYsIHNpemUsIHZhZGRyLCAoZG1hX2FkZHJfdClwaHlzLCBhdHRy
cyk7Ci0tIAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
