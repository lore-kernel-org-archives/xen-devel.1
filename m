Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06419C282DA
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 11:27:55 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD5342084C
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 11:27:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD5342084C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDoul-0000EY-7s; Tue, 09 Apr 2019 11:27:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+Yc4=SL=citrix.com=prvs=99536ed25=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hDouj-0000EF-94
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 11:27:41 +0000
X-Inumbo-ID: 7ae41bc6-5aba-11e9-a58f-47cb0e0853a9
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7ae41bc6-5aba-11e9-a58f-47cb0e0853a9;
 Tue, 09 Apr 2019 11:27:38 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,329,1549929600"; d="scan'208";a="83096398"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Tue, 9 Apr 2019 12:08:32 +0100
Message-ID: <20190409110844.14746-20-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190409110844.14746-1-anthony.perard@citrix.com>
References: <20190409110844.14746-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 19/31] OvmfPkg/XenPlatformPei: Introduce
 XenPvhDetected
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
Message-ID: <20190409110832.hQixeOnh2_rYtvHnx1gdtgtwcjUUk3qA8W1HSl09puc@z>

Q29udHJpYnV0ZWQtdW5kZXI6IFRpYW5vQ29yZSBDb250cmlidXRpb24gQWdyZWVtZW50IDEuMQpT
aWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4K
LS0tCiBPdm1mUGtnL1hlblBsYXRmb3JtUGVpL1BsYXRmb3JtLmggfCAgNSArKysrKwogT3ZtZlBr
Zy9YZW5QbGF0Zm9ybVBlaS9YZW4uYyAgICAgIHwgMTMgKysrKysrKysrKysrKwogMiBmaWxlcyBj
aGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvT3ZtZlBrZy9YZW5QbGF0Zm9y
bVBlaS9QbGF0Zm9ybS5oIGIvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9QbGF0Zm9ybS5oCmluZGV4
IGE1MjRjMjNhNDMuLmM1YTEzOWYwMTYgMTAwNjQ0Ci0tLSBhL092bWZQa2cvWGVuUGxhdGZvcm1Q
ZWkvUGxhdGZvcm0uaAorKysgYi9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1BsYXRmb3JtLmgKQEAg
LTEwNSw2ICsxMDUsMTEgQEAgWGVuSHZtbG9hZGVyRGV0ZWN0ZWQgKAogICBWT0lECiAgICk7CiAK
K0JPT0xFQU4KK1hlblB2aERldGVjdGVkICgKKyAgVk9JRAorICApOworCiBWT0lECiBBbWRTZXZJ
bml0aWFsaXplICgKICAgVk9JRApkaWZmIC0tZ2l0IGEvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9Y
ZW4uYyBiL092bWZQa2cvWGVuUGxhdGZvcm1QZWkvWGVuLmMKaW5kZXggYjM2ZWZmNTI0ZC4uMjNm
ZjMxMDJiNSAxMDA2NDQKLS0tIGEvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9YZW4uYworKysgYi9P
dm1mUGtnL1hlblBsYXRmb3JtUGVpL1hlbi5jCkBAIC0yMTcsNiArMjE3LDE5IEBAIFhlbkh2bWxv
YWRlckRldGVjdGVkICgKICAgcmV0dXJuIChtWGVuSHZtbG9hZGVySW5mbyAhPSBOVUxMKTsKIH0K
IAorQk9PTEVBTgorWGVuUHZoRGV0ZWN0ZWQgKAorICBWT0lECisgICkKK3sKKyAgLy8KKyAgLy8g
VGhpcyBmdW5jdGlvbiBzaG91bGQgb25seSBiZSB1c2VkIGFmdGVyIFhlbkNvbm5lY3QKKyAgLy8K
KyAgQVNTRVJUIChtWGVuSW5mby5WZXJzaW9uTWFqb3IgIT0gMCk7CisKKyAgcmV0dXJuIG1YZW5I
dm1sb2FkZXJJbmZvID09IE5VTEw7Cit9CisKIFZPSUQKIFhlblB1Ymxpc2hSYW1SZWdpb25zICgK
ICAgVk9JRAotLSAKQW50aG9ueSBQRVJBUkQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
