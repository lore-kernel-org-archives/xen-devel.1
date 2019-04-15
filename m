Return-Path: <SRS0=MmA3=SR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D597AC10F0E
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 16:28:47 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE80F2087C
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 16:28:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE80F2087C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hG4Sz-0007Ug-8b; Mon, 15 Apr 2019 16:28:21 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Tbw4=SR=citrix.com=prvs=001b8ac9c=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hG4Sx-0007UQ-50
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 16:28:19 +0000
X-Inumbo-ID: 79824356-5f9b-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 79824356-5f9b-11e9-92d7-bc764e045a96;
 Mon, 15 Apr 2019 16:28:17 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,354,1549929600"; d="scan'208";a="83602165"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 15 Apr 2019 17:28:08 +0100
Message-ID: <20190415162809.23675-2-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190415162809.23675-1-ian.jackson@eu.citrix.com>
References: <20190415162809.23675-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/2] build system: make install-stubdom depend
 on install-tools again
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
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190415162808.yDU_RAObN7hAFRnbbrz4zALdBelqn38qJehVUWhOnSg@z>

SW4gZDI5MGUzMjUxNzljY2VlOTY2Y2Q2NzlkMGZlZDQ4YmU2ZjRjYzFiNwogICJidWlsZCBzeXN0
ZW06IGRvbid0IGxldCBpbnN0YWxsLXN0dWJkb20gZGVwZW5kIG9uIGluc3RhbGwtdG9vbHMiCnRo
ZSBkZXBlbmRlbmN5IG9mIGluc3RhbGwtc3R1YmRvbSBvbiBpbnN0YWxsLXRvb2xzIHdhcyByZW1v
dmVkLgoKSG93ZXZlciwgdGhpcyB3YXMgbm90IGNvcnJlY3QuICAgc3R1YmRvbS9NYWtlZmlsZSBj
b250YWlucyB0aGlzOgoKICAkKFhFTl9ST09UKS90b29scy9xZW11LXhlbi10cmFkaXRpb25hbC1k
aXI6CiAgICAgICAkKE1BS0UpIERFU1RESVI9IC1DICQoWEVOX1JPT1QpL3Rvb2xzIHFlbXUteGVu
LXRyYWRpdGlvbmFsLWRpci1maW5kCgpBcyBJIGhhdmUgd3JpdHRlbiBiZWZvcmU6CgogIFdpdGgg
cmVjdXJzaXZlIG1ha2UsIGl0IGlzIG5lY2Vzc2FyeSBmb3IgdGhlIG92ZXJhbGwgc3RydWN0dXJl
IG9mIHRoZQogIG1ha2VmaWxlcyB0byBzZXF1ZW5jZSB0aGluZ3Mgc28gdGhhdCBlYWNoIGRpcmVj
dG9yeSBpcyBlbnRlcmVkIGV4YWN0bHkKICBvbmNlLCBiZWZvcmUgaXRzIGRlcGVuZGVudCBkaXJl
Y3RvcmllcyBhcmUgZW50ZXJlZC4gIChJdCBpcyBwb3NzaWJsZQogIHRvIHZpb2xhdGUgdGhpcyBy
dWxlIHdpdGhvdXQgY3JlYXRpbmcgcmFjZXMgYnV0IGl0IGlzIHRyaWNreSBhbmQKICBpbmFkdmlz
YWJsZS4pCgpTaW5jZSBkMjkwZTMyNTE3OWMsIGl0IGNhbiBoYXBwZW4gdGhhdCB0aGUgY29tbWFu
ZCBmb3IgdGhlCnFlbXUteGVuLXRyYWRpdGlvbmFsLWRpci1maW5kIHJ1bGUgaXMgcnVuIHR3aWNl
IHNpbXVsdGFuZW91c2x5IC0gb25jZQphcyBhIHJlc3VsdCBvZiAkKE1BS0UpIC1DIHRvb2xzIGlu
c3RhbGwsIGFuZCBvbmNlIGFzIGEgcmVzdWx0IG9mCiQoTUFLRSkgLUMgc3R1YmRvbSBpbnN0YWxs
LiAgSWYgeW91IGdldCB1bmx1Y2t5LCB0aGlzIGNhdXNlcyBsb3NzYWdlLgooVGhpcyBqdXN0IGhh
cHBlbmVkIHRvIG1lIGluIGFuIG9zc3Rlc3QgZmxpZ2h0LikKCkluIHByaW5jaXBsZSB3ZSBjb3Vs
ZCBhbHRlcm5hdGl2ZWx5IGZpeCB0aGlzIGJ5IGxpZnRpbmcgdGhlIGNvbW1hbmRzCmluIHRoZSBx
ZW11LXhlbi10cmFkaXRpb25hbC1kaXItZmluZCB0YXJnZXQgKGFuZCBwZXJoYXBzIG90aGVyIHRo
aW5ncwp0b28pIGludG8gdGhlIHRvcGxldmVsIE1ha2VmaWxlLCBhcyB3YXMgZG9uZSBmb3IgbWlu
aS1vcy4KCkJ1dCB0aGF0IHNlZW1zIG92ZXJraWxsIGdpdmVuIGhvdyBiYWQgdGhlIHN0dWJkb20g
YnVpbGQgc3lzdGVtIGlzLCBhbmQKdGhlIGZhY3QgdGhhdCB3ZSB0aGluayBhdCBzb21lIHBvaW50
IHRoaXMgcWVtdS10cmFkIHdpbGwgZ28gYXdheQplbnRpcmVseS4gIEFkZGluZyB0aGUgdG9vbHMg
ZGVwZW5kZW5jeSBiYWNrIHRvIHRoZSBzdHViZG9tIGJ1aWxkIGlzCmJ5IGFuZCBsYXJnZSBnb29k
IGVub3VnaC4KCihTb21lb25lIHdobyByZWFsbHkgd2FudHMgdG8gYnVpbGQgc3R1YmRvbSB3aXRo
b3V0IHRvb2xzIGlzIHdlbGNvbWUgdG8KZG8gdGhpcyBzZXBhcmF0aW9uIGlmIHRoZXkgcmVhbGx5
IHdhbnQgdG8uKQoKQ0M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KQ0M6IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+ClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4u
amFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIE1ha2VmaWxlIHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvTWFrZWZpbGUg
Yi9NYWtlZmlsZQppbmRleCBkOTU5Y2Q1YjQ3Li44MjlhYzYzNzQxIDEwMDY0NAotLS0gYS9NYWtl
ZmlsZQorKysgYi9NYWtlZmlsZQpAQCAtMTI3LDcgKzEyNyw3IEBAIGluc3RhbGwtdG9vbHM6IGlu
c3RhbGwtdG9vbHMtcHVibGljLWhlYWRlcnMKIAkkKE1BS0UpIC1DIHRvb2xzIGluc3RhbGwKIAog
LlBIT05ZOiBpbnN0YWxsLXN0dWJkb20KLWluc3RhbGwtc3R1YmRvbTogbWluaS1vcy1kaXIgaW5z
dGFsbC10b29scy1wdWJsaWMtaGVhZGVycworaW5zdGFsbC1zdHViZG9tOiBtaW5pLW9zLWRpciBp
bnN0YWxsLXRvb2xzCiAJJChNQUtFKSAtQyBzdHViZG9tIGluc3RhbGwKIGlmZXEgKHg4Nl82NCwk
KFhFTl9UQVJHRVRfQVJDSCkpCiAJWEVOX1RBUkdFVF9BUkNIPXg4Nl8zMiAkKE1BS0UpIC1DIHN0
dWJkb20gaW5zdGFsbC1ncnViCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
