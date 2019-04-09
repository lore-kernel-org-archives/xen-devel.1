Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B64FFC282CE
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 16:46:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F4C42084C
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 16:46:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F4C42084C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDtsi-0008Bw-V8; Tue, 09 Apr 2019 16:45:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+Yc4=SL=citrix.com=prvs=99536ed25=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hDtsh-0008As-8h
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 16:45:55 +0000
X-Inumbo-ID: f0d58ef8-5ae6-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f0d58ef8-5ae6-11e9-92d7-bc764e045a96;
 Tue, 09 Apr 2019 16:45:54 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,330,1549929600"; d="scan'208";a="83137622"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 9 Apr 2019 17:45:34 +0100
Message-ID: <20190409164542.30274-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190409164542.30274-1-anthony.perard@citrix.com>
References: <20190409164542.30274-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/9] libxl_internal: Remove lost comment
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
Message-ID: <20190409164534.FWVWx_telHZZZ3KKDK5U1WMe-Y-jGvVTZIYhpgaWhaU@z>

VGhhdCBjb21tZW50IGFzIGJlZW4gc2VwYXJhdGVkIGZyb20gdGhlIGZ1bmN0aW9uIGl0IGRlZmlu
ZXMgYnkKNDE5N2QzYWJiYjMwNTVkMzc5ODI1NGViN2JhMjM5YmZiNTgyNDM2MCwgYnV0IHRoZW4g
d2FzIG5vdCB1c2VmdWwKYW55bW9yZSB3aGVuIHRoZSBsaWJ4bF9fZGV2aWNlX2Rpc2tfYWRkKCkg
cHJvdG90eXBlIHdhcyByZW1vdmVkIGJ5CjIyZWE4YWQwMmU0NjVlMzJjZDQwODg3Yzc1MGI1NWMz
YTk5N2EyODguCgpTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRA
Y2l0cml4LmNvbT4KLS0tCiB0b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oIHwgNyAtLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy9saWJ4
bC9saWJ4bF9pbnRlcm5hbC5oIGIvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaAppbmRleCA0
NGUwMjIxMjg0Li45OGExZWU2MTU5IDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4bF9pbnRl
cm5hbC5oCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmgKQEAgLTI3NDQsMTMgKzI3
NDQsNiBAQCBzdHJ1Y3QgbGlieGxfX211bHRpZGV2IHsKICAqICAgICAgICAgICAgICAgICAgIERP
TkUuCiAgKi8KIAotLyogQU8gb3BlcmF0aW9uIHRvIGNvbm5lY3QgYSBkaXNrIGRldmljZSwgY2Fs
bGVkIGJ5Ci0gKiBsaWJ4bF9kZXZpY2VfZGlza19hZGQgYW5kIGxpYnhsX19hZGRfZGlza3MuIFRo
aXMgZnVuY3Rpb24gY2FsbHMKLSAqIGxpYnhsX193YWl0X2RldmljZV9jb25uZWN0aW9uIHRvIHdh
aXQgZm9yIHRoZSBkZXZpY2UgdG8KLSAqIGZpbmlzaCB0aGUgY29ubmVjdGlvbiAobWlnaHQgaW52
b2x2ZSBleGVjdXRpbmcgaG90cGx1ZyBzY3JpcHRzKS4KLSAqCi0gKiBPbmNlIGZpbmlzaGVkLCBh
b2Rldi0+Y2FsbGJhY2sgd2lsbCBiZSBleGVjdXRlZC4KLSAqLwogLyoKICAqIEFzIG9mIFhlbiA0
LjUgd2UgbWFpbnRhaW4gdmFyaW91cyBpbmZvcm1hdGlvbiwgaW5jbHVkaW5nIGhvdHBsdWcKICAq
IGRldmljZSBpbmZvcm1hdGlvbiwgaW4gSlNPTiBmaWxlcywgc28gdGhhdCB3ZSBjYW4gdXNlIHRo
aXMgSlNPTgotLSAKQW50aG9ueSBQRVJBUkQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
