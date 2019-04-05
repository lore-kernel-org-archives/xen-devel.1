Return-Path: <SRS0=0dJu=SH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7DADC282DA
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 17:58:34 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF58C2063F
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 17:58:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF58C2063F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hCT6e-0000f1-NA; Fri, 05 Apr 2019 17:58:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8q43=SH=citrix.com=prvs=991ec766c=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hCT6c-0000eY-GT
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2019 17:58:22 +0000
X-Inumbo-ID: 6604721d-57cc-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6604721d-57cc-11e9-92d7-bc764e045a96;
 Fri, 05 Apr 2019 17:58:20 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,313,1549929600"; d="scan'208";a="82881060"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 5 Apr 2019 18:58:10 +0100
Message-ID: <20190405175811.7446-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190405175811.7446-1-anthony.perard@citrix.com>
References: <20190405175811.7446-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/3] libxl: Constify src of device_compare_fn_t
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190405175810.Nl-9KxKJIIYdBMKT4-gskf6JtCZe5rsMT0VqosExXJs@z>

QWxsIGZ1bmN0aW9ucyBsaWJ4bF9kZXZpY2VfKl9jb3B5IHdoaWNoIGltcGxlbWVudHMgZGV2aWNl
X2NvbXBhcmVfZm5fdAphbHJlYWR5IGhhdmUgdGhlIGBzcmMnIHBhcmFtZXRlciBkZWZpbmVkIHdp
dGggY29uc3QuCgpTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRA
Y2l0cml4LmNvbT4KLS0tCiB0b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
dG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaCBiL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFs
LmgKaW5kZXggYzc1Yzk4MTU2YS4uMzRkYzg4NjUwNSAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwv
bGlieGxfaW50ZXJuYWwuaAorKysgYi90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oCkBAIC0z
NzI2LDcgKzM3MjYsNyBAQCB0eXBlZGVmIGludCAoKmRldmljZV9zZXRfZGVmYXVsdF9mbl90KShs
aWJ4bF9fZ2MgKiwgdWludDMyX3QsIHZvaWQgKiwgYm9vbCk7CiB0eXBlZGVmIGludCAoKmRldmlj
ZV90b19kZXZpY2VfZm5fdCkobGlieGxfX2djICosIHVpbnQzMl90LCB2b2lkICosCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGlieGxfX2RldmljZSAqKTsKIHR5cGVkZWYg
dm9pZCAoKmRldmljZV9pbml0X2ZuX3QpKHZvaWQgKik7Ci10eXBlZGVmIHZvaWQgKCpkZXZpY2Vf
Y29weV9mbl90KShsaWJ4bF9jdHggKiwgdm9pZCAqLCB2b2lkICopOwordHlwZWRlZiB2b2lkICgq
ZGV2aWNlX2NvcHlfZm5fdCkobGlieGxfY3R4ICosIHZvaWQgKmRzdCwgY29uc3Qgdm9pZCAqc3Jj
KTsKIHR5cGVkZWYgdm9pZCAoKmRldmljZV9kaXNwb3NlX2ZuX3QpKHZvaWQgKik7CiB0eXBlZGVm
IGludCAoKmRldmljZV9jb21wYXJlX2ZuX3QpKGNvbnN0IHZvaWQgKiwgY29uc3Qgdm9pZCAqKTsK
IHR5cGVkZWYgdm9pZCAoKmRldmljZV9tZXJnZV9mbl90KShsaWJ4bF9jdHggKiwgdm9pZCAqLCB2
b2lkICopOwotLSAKQW50aG9ueSBQRVJBUkQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
