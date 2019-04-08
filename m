Return-Path: <SRS0=fn8+=SK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 050A3C10F14
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 14:27:53 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFBA020663
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 14:27:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFBA020663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDVFO-00020Q-U6; Mon, 08 Apr 2019 14:27:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RaUp=SK=citrix.com=prvs=994f31c19=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hDVFN-00020D-EO
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 14:27:41 +0000
X-Inumbo-ID: 75eb456e-5a0a-11e9-810a-c3f9ce638f03
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 75eb456e-5a0a-11e9-810a-c3f9ce638f03;
 Mon, 08 Apr 2019 14:27:39 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,325,1549929600"; d="scan'208";a="83010269"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <edk2-devel@lists.01.org>
Date: Mon, 8 Apr 2019 15:24:02 +0100
Message-ID: <20190408142408.30419-26-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190408142408.30419-1-anthony.perard@citrix.com>
References: <20190408142408.30419-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 25/31] OvmfPkg/PlatformBootManagerLib: Handle
 the absence of PCI bus on Xen PVH
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, Julien Grall <julien.grall@arm.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190408142402.MkY6Kif6XTM6i90qdaRqRYyVotaBxfbzDW_dHbGPaTc@z>

V2hlbiBydW5uaW5nIG9uIFBWSCB3aXRob3V0IFBDSSBidXMsIHRoZSBYZW5QbGF0Zm9ybVBlaSB3
aWxsIHNldApQY2RPdm1mSG9zdEJyaWRnZVBjaURldklkIHRvIFhFTl9QVkhfUENJX0hPU1RfQlJJ
REdFX0RFVklDRV9JRC4KCkNvbnRyaWJ1dGVkLXVuZGVyOiBUaWFub0NvcmUgQ29udHJpYnV0aW9u
IEFncmVlbWVudCAxLjEKU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVy
YXJkQGNpdHJpeC5jb20+Ci0tLQogT3ZtZlBrZy9MaWJyYXJ5L1BsYXRmb3JtQm9vdE1hbmFnZXJM
aWIvQmRzUGxhdGZvcm0uYyB8IDUgKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9Pdm1mUGtnL0xpYnJhcnkvUGxhdGZvcm1Cb290TWFuYWdlckxpYi9C
ZHNQbGF0Zm9ybS5jIGIvT3ZtZlBrZy9MaWJyYXJ5L1BsYXRmb3JtQm9vdE1hbmFnZXJMaWIvQmRz
UGxhdGZvcm0uYwppbmRleCAxMjMwM2ZiMGYxLi4xYTZkNDc3MzJlIDEwMDY0NAotLS0gYS9Pdm1m
UGtnL0xpYnJhcnkvUGxhdGZvcm1Cb290TWFuYWdlckxpYi9CZHNQbGF0Zm9ybS5jCisrKyBiL092
bWZQa2cvTGlicmFyeS9QbGF0Zm9ybUJvb3RNYW5hZ2VyTGliL0Jkc1BsYXRmb3JtLmMKQEAgLTEy
MTMsNiArMTIxMywxMSBAQCBQY2lBY3BpSW5pdGlhbGl6YXRpb24gKAogICAgICAgUGNpV3JpdGU4
IChQQ0lfTElCX0FERFJFU1MgKDAsIDB4MWYsIDAsIDB4NmEpLCAweDBiKTsgLy8gRwogICAgICAg
UGNpV3JpdGU4IChQQ0lfTElCX0FERFJFU1MgKDAsIDB4MWYsIDAsIDB4NmIpLCAweDBiKTsgLy8g
SAogICAgICAgYnJlYWs7CisgICAgY2FzZSBYRU5fUFZIX1BDSV9IT1NUX0JSSURHRV9ERVZJQ0Vf
SUQ6CisgICAgICAvLworICAgICAgLy8gVGhlcmUgYXJlIG5vIFBDSSBidXMgaW4gdGhpcyBjYXNl
LgorICAgICAgLy8KKyAgICAgIHJldHVybjsKICAgICBkZWZhdWx0OgogICAgICAgREVCVUcgKChF
RklfRF9FUlJPUiwgIiVhOiBVbmtub3duIEhvc3QgQnJpZGdlIERldmljZSBJRDogMHglMDR4XG4i
LAogICAgICAgICBfX0ZVTkNUSU9OX18sIG1Ib3N0QnJpZGdlRGV2SWQpKTsKLS0gCkFudGhvbnkg
UEVSQVJECgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
