Return-Path: <SRS0=7Zzv=TJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDFD5C04AB1
	for <xen-devel@archiver.kernel.org>; Thu,  9 May 2019 15:42:11 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9214216C4
	for <xen-devel@archiver.kernel.org>; Thu,  9 May 2019 15:42:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9214216C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOlB4-0007ed-8K; Thu, 09 May 2019 15:41:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=L0k/=TJ=suse.com=vliaskovitis@srs-us1.protection.inumbo.net>)
 id 1hOlB3-0007eI-1Y
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 15:41:45 +0000
X-Inumbo-ID: f1d0946c-7270-11e9-a629-ef21cbbf74cc
Received: from smtp.nue.novell.com (unknown [195.135.221.5])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f1d0946c-7270-11e9-a629-ef21cbbf74cc;
 Thu, 09 May 2019 15:41:43 +0000 (UTC)
Received: from emea4-mta.ukb.novell.com ([10.120.13.87])
 by smtp.nue.novell.com with ESMTP (TLS encrypted);
 Thu, 09 May 2019 17:41:42 +0200
Received: from linux-nq5u.suse.de (nwb-a10-snat.microfocus.com [10.120.13.202])
 by emea4-mta.ukb.novell.com with ESMTP (NOT encrypted);
 Thu, 09 May 2019 16:41:34 +0100
From: Vasilis Liaskovitis <vliaskovitis@suse.com>
To: xen-devel@lists.xenproject.org
Date: Thu,  9 May 2019 17:41:27 +0200
Message-Id: <20190509154128.9196-4-vliaskovitis@suse.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190509154128.9196-1-vliaskovitis@suse.com>
References: <20190509154128.9196-1-vliaskovitis@suse.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 3/4] libxl: add libxl_get_parameters()
 function
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
Cc: jgross@suse.com, sstabellini@kernel.org, wei.liu2@citrix.com,
 vliaskovitis@suse.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com,
 ian.jackson@eu.citrix.com, tim@xen.org, jbeulich@suse.com,
 dgdegra@tycho.nsa.gov
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190509154127.08S0A6Wm82_g7XMyRxWhhbfxWdThzordiP3JvpnItn8@z>

QWRkIGEgbmV3IGxpYnhsIGZ1bmN0aW9uIHRvIGdldCBoeXBlcnZpc29yIHBhcmFtZXRlcnMuCgpT
aWduZWQtb2ZmLWJ5OiBWYXNpbGlzIExpYXNrb3ZpdGlzIDx2bGlhc2tvdml0aXNAc3VzZS5jb20+
Ci0tLQogdG9vbHMvbGlieGwvbGlieGwuYyB8IDE1ICsrKysrKysrKysrKysrKwogdG9vbHMvbGli
eGwvbGlieGwuaCB8ICAxICsKIDIgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsLmMgYi90b29scy9saWJ4bC9saWJ4bC5jCmluZGV4
IGVjNzE1NzRlOTkuLjEyNDAzM2U1YTMgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsLmMK
KysrIGIvdG9vbHMvbGlieGwvbGlieGwuYwpAQCAtNjY5LDYgKzY2OSwyMSBAQCBpbnQgbGlieGxf
c2V0X3BhcmFtZXRlcnMobGlieGxfY3R4ICpjdHgsIGNoYXIgKnBhcmFtcykKICAgICByZXR1cm4g
MDsKIH0KIAoraW50IGxpYnhsX2dldF9wYXJhbWV0ZXJzKGxpYnhsX2N0eCAqY3R4LCBjaGFyICpw
YXJhbXMsIGNoYXIgKnZhbHVlcykKK3sKKyAgICBpbnQgcmV0OworICAgIEdDX0lOSVQoY3R4KTsK
KworICAgIHJldCA9IHhjX2dldF9wYXJhbWV0ZXJzKGN0eC0+eGNoLCBwYXJhbXMsIHZhbHVlcyk7
CisgICAgaWYgKHJldCA8IDApIHsKKyAgICAgICAgTE9HRVYoRVJST1IsIHJldCwgImdldHRpbmcg
cGFyYW1ldGVycyIpOworICAgICAgICBHQ19GUkVFOworICAgICAgICByZXR1cm4gcmV0Oy8vRVJS
T1JfRkFJTDsKKyAgICB9CisgICAgR0NfRlJFRTsKKyAgICByZXR1cm4gMDsKK30KKwogc3RhdGlj
IGludCBmZF9zZXRfZmxhZ3MobGlieGxfY3R4ICpjdHgsIGludCBmZCwKICAgICAgICAgICAgICAg
ICAgICAgICAgIGludCBmY250bGdldG9wLCBpbnQgZmNudGxzZXRvcCwgY29uc3QgY2hhciAqZmws
CiAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgZmxhZ21hc2ssIGludCBzZXRfcCkKZGlmZiAt
LWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsLmggYi90b29scy9saWJ4bC9saWJ4bC5oCmluZGV4IGEz
OGU1Y2RiYTIuLjM2MGE3NTdhMDYgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsLmgKKysr
IGIvdG9vbHMvbGlieGwvbGlieGwuaApAQCAtMjMwNyw2ICsyMzA3LDcgQEAgaW50IGxpYnhsX3Nl
bmRfdHJpZ2dlcihsaWJ4bF9jdHggKmN0eCwgdWludDMyX3QgZG9taWQsCiBpbnQgbGlieGxfc2Vu
ZF9zeXNycShsaWJ4bF9jdHggKmN0eCwgdWludDMyX3QgZG9taWQsIGNoYXIgc3lzcnEpOwogaW50
IGxpYnhsX3NlbmRfZGVidWdfa2V5cyhsaWJ4bF9jdHggKmN0eCwgY2hhciAqa2V5cyk7CiBpbnQg
bGlieGxfc2V0X3BhcmFtZXRlcnMobGlieGxfY3R4ICpjdHgsIGNoYXIgKnBhcmFtcyk7CitpbnQg
bGlieGxfZ2V0X3BhcmFtZXRlcnMobGlieGxfY3R4ICpjdHgsIGNoYXIgKnBhcmFtcywgY2hhciAq
dmFsdWVzKTsKIAogdHlwZWRlZiBzdHJ1Y3QgbGlieGxfX3hlbl9jb25zb2xlX3JlYWRlciBsaWJ4
bF94ZW5fY29uc29sZV9yZWFkZXI7CiAKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
