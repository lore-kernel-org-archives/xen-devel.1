Return-Path: <SRS0=lvvB=2D=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C29AC43603
	for <xen-devel@archiver.kernel.org>; Fri, 13 Dec 2019 02:52:03 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 707962073B
	for <xen-devel@archiver.kernel.org>; Fri, 13 Dec 2019 02:52:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crc.id.au header.i=@crc.id.au header.b="FAJFeQpV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 707962073B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crc.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifb3Y-0000ps-EN; Fri, 13 Dec 2019 02:51:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xLeZ=2D=crc.id.au=netwiz@srs-us1.protection.inumbo.net>)
 id 1ifb3X-0000pS-Ob
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 02:51:51 +0000
X-Inumbo-ID: 7d41256a-1d53-11ea-a1e1-bc764e2007e4
Received: from mail.crc.id.au (unknown [2407:e400:b000:200::25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7d41256a-1d53-11ea-a1e1-bc764e2007e4;
 Fri, 13 Dec 2019 02:51:42 +0000 (UTC)
Received: from ws19.umd.com.au (2407-e400-b000-202-0-0-0-3-cpe.spintel.net.au
 [IPv6:2407:e400:b000:202::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.crc.id.au (Postfix) with ESMTPSA id C03FB2001C1;
 Fri, 13 Dec 2019 13:51:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crc.id.au; s=default;
 t=1576205498; bh=oNkpD8Te3z47PVxCsdRPkDzozUylQyRoH1KyXrGvMng=;
 h=From:To:Cc:Subject:Date;
 b=FAJFeQpVCF91OjtUc9/s73vO0FOm3j3jKgCKgWiztk+2dGraD2cqz3XcUeSmRR5PC
 0Vpoto5UTMtm5+XMbbUugnfnq4x6GZDIVSBw+Nb7NaH+4GDwe3q09Wui31XbXLaVkw
 OkDf+JMyZ1YKIkmuE6DNki04gs5uTQkeuXqN8ato=
From: Steven Haigh <netwiz@crc.id.au>
To: xen-devel@lists.xenproject.org
Date: Fri, 13 Dec 2019 13:51:33 +1100
Message-Id: <cover.1576204748.git.netwiz@crc.id.au>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/2] [PATCH-for-4.13] Work towards removing brctl
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Steven Haigh <netwiz@crc.id.au>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20191213025133.vn7ICb7pygs6LbGrGuVBHsgsdlBvAgcA1_zTsB4QSgY@z>

U3RhcnQgdXBkYXRpbmcgc2NyaXB0cyBmb3IgbmV0d29yayBmdW5jdGlvbmFsaXR5CgpUaGUgc2Ny
aXB0cyBmb3IgbmV0d29ya2luZyBpbiBYZW4gaGF2ZSBhIG1peHR1cmUgb2YgZm9ybWF0dGluZywK
dGFiIHNwYWNpbmcsIHNwYWNlIHNwYWNpbmcgaW5jb25zaXN0ZW5jaWVzLgoKV2UgYWxzbyBoYXZl
IGlzc3VlcyB3aGVyZSBDZW50T1MgOCBkb2VzIG5vdCBoYXZlIGJyY3RsIC0gYmVpbmcKcmVwbGFj
ZWQgd2l0aCBpcCAvIGJyaWRnZSBjb21tYW5kcy4KClRoaXMgc2VyaWVzIHN0YXJ0cyBjbGVhbmlu
ZyB1cCB3aGl0ZXNwYWNlIGFuZCBmb3JtYXR0aW5nLCBhcyB3ZWxsCmFzIHN0YXJ0cyBhZGRpbmcg
Y29uZGl0aW9uYWxzIGZvciB1c2luZyBicmN0bCAoaWYgcHJlc2VudCkgYnV0IHVzaW5nCmlwIGlm
IC91c3Ivc2Jpbi9icmN0bCBpcyBub3QgaW5zdGFsbGVkLgoKU3RldmVuIEhhaWdoICgyKToKICBU
aWR5IHVwIHdoaXRlc3BhY2UgYW5kIGZvcm1hdHRpbmcgaW4gZmlsZSB0byBiZSBjb25zaXN0ZW50
LgogIFVzZSBpcCBmb3IgYnJpZGdlIHJlbGF0ZWQgZnVuY3Rpb25zIHdoZXJlIGJyY3RsIGlzIG5v
dCBwcmVzZW50CgogdG9vbHMvaG90cGx1Zy9MaW51eC9jb2xvLXByb3h5LXNldHVwICAgICAgfCAg
MzAgKysrLS0KIHRvb2xzL2hvdHBsdWcvTGludXgvdmlmLWJyaWRnZSAgICAgICAgICAgIHwgIDE5
ICsrLQogdG9vbHMvaG90cGx1Zy9MaW51eC92aWYyICAgICAgICAgICAgICAgICAgfCAgMTIgKy0K
IHRvb2xzL2hvdHBsdWcvTGludXgveGVuLW5ldHdvcmstY29tbW9uLnNoIHwgMTUxICsrKysrKysr
KysrLS0tLS0tLS0tLS0KIDQgZmlsZXMgY2hhbmdlZCwgMTIxIGluc2VydGlvbnMoKyksIDkxIGRl
bGV0aW9ucygtKQoKLS0gCjIuMjQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
