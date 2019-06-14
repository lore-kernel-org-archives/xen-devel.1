Return-Path: <SRS0=aUBB=UN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98E69C31E4B
	for <xen-devel@archiver.kernel.org>; Fri, 14 Jun 2019 17:52:25 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74C782183E
	for <xen-devel@archiver.kernel.org>; Fri, 14 Jun 2019 17:52:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74C782183E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbqMw-0001ul-R7; Fri, 14 Jun 2019 17:52:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PwC2=UN=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hbqMv-0001tw-Fv
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 17:52:05 +0000
X-Inumbo-ID: 1d6a061c-8ecd-11e9-afa5-8b6a9b7e3b28
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 1d6a061c-8ecd-11e9-afa5-8b6a9b7e3b28;
 Fri, 14 Jun 2019 17:52:02 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2FD21346;
 Fri, 14 Jun 2019 10:52:02 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 458A83F718;
 Fri, 14 Jun 2019 10:52:01 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 14 Jun 2019 18:51:44 +0100
Message-Id: <20190614175144.20046-10-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190614175144.20046-1-julien.grall@arm.com>
References: <20190614175144.20046-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH MM-PART3 v3 9/9] xen/arm: mm: Remove
 set_pte_flags_on_range()
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
Cc: Oleksandr_Tyshchenko@epam.com, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

c2V0X3B0ZV9mbGFnc19vbl9yYW5nZSgpIGlzIHlldCBhbm90aGVyIGZ1bmN0aW9uIHRoYXQgd2ls
bCBvcGVuLWNvZGUKdXBkYXRlIHRvIGEgc3BlY2lmaWMgcmFuZ2UgaW4gdGhlIFhlbiBwYWdlLXRh
Ymxlcy4gSXQgY2FuIGJlIGNvbXBsZXRlbHkKZHJvcHBlZCBieSB1c2luZyBlaXRoZXIgbW9kaWZ5
X3hlbl9tYXBwaW5ncygpIG9yIGRlc3Ryb3lfeGVuX21hcHBpbmdzKCkuCgpOb3RlIHRoYXQgbW9k
aWZ5X3hlbl9tYXBwaW5ncygpIHdpbGwga2VlcCB0aGUgZmllbGQgJ3B4bicgY2xlYXJlZCBmb3IK
dGhlIGFsbCB0aGUgY2FzZXMuIFRoaXMgaXMgYmVjYXVzZSB0aGUgZmllbGQgaXMgUkVTMCBmb3Ig
dGhlIHN0YWdlLTEKaHlwZXJ2aXNvciBhcyBvbmx5IGEgc2luZ2xlIFZBIHJhbmdlIGlzIHN1cHBv
cnRlZCAoc2VlIEQ1LjQuNSBpbgpEREkwNDg3RC5iKS4KClNpZ25lZC1vZmYtYnk6IEp1bGllbiBH
cmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+ClJldmlld2VkLWJ5OiBBbmRyaWkgQW5pc292IDxh
bmRyaWlfYW5pc292QGVwYW0uY29tPgoKLS0tCiAgICBDaGFuZ2VzIGluIHYzOgogICAgICAgIC0g
VXBkYXRlIGNvbW1pdCBtZXNzYWdlIHRvIGV4cGxhaW4gd2h5IHRoZSBmaWVsZCAncHhuJyBpcwog
ICAgICAgIG5vdyBjbGVhcmVkLgoKICAgIENoYW5nZXMgaW4gdjI6CiAgICAgICAgLSBBZGQgbWlz
c2luZyBuZXdsaW5lIGluIHBhbmljCiAgICAgICAgLSBBZGQgQW5kcmlpJ3MgcmV2aWV3ZWQtYnkK
LS0tCiB4ZW4vYXJjaC9hcm0vbW0uYyB8IDU4ICsrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25z
KCspLCA0OCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vbW0uYyBiL3hl
bi9hcmNoL2FybS9tbS5jCmluZGV4IDQ2YmMzZDgwNzUuLjM1ZGMxZjdlNzEgMTAwNjQ0Ci0tLSBh
L3hlbi9hcmNoL2FybS9tbS5jCisrKyBiL3hlbi9hcmNoL2FybS9tbS5jCkBAIC0xMjU1LDUyICsx
MjU1LDYgQEAgaW50IG1vZGlmeV94ZW5fbWFwcGluZ3ModW5zaWduZWQgbG9uZyBzLCB1bnNpZ25l
ZCBsb25nIGUsIHVuc2lnbmVkIGludCBmbGFncykKICAgICByZXR1cm4geGVuX3B0X3VwZGF0ZShz
LCBJTlZBTElEX01GTiwgKGUgLSBzKSA+PiBQQUdFX1NISUZULCBmbGFncyk7CiB9CiAKLWVudW0g
bWcgeyBtZ19jbGVhciwgbWdfcm8sIG1nX3J3LCBtZ19yeCB9Owotc3RhdGljIHZvaWQgc2V0X3B0
ZV9mbGFnc19vbl9yYW5nZShjb25zdCBjaGFyICpwLCB1bnNpZ25lZCBsb25nIGwsIGVudW0gbWcg
bWcpCi17Ci0gICAgbHBhZV90IHB0ZTsKLSAgICBpbnQgaTsKLQotICAgIEFTU0VSVChpc19rZXJu
ZWwocCkgJiYgaXNfa2VybmVsKHAgKyBsKSk7Ci0KLSAgICAvKiBDYW4gb25seSBndWFyZCBpbiBw
YWdlIGdyYW51bGFyaXR5ICovCi0gICAgQVNTRVJUKCEoKHVuc2lnbmVkIGxvbmcpIHAgJiB+UEFH
RV9NQVNLKSk7Ci0gICAgQVNTRVJUKCEobCAmIH5QQUdFX01BU0spKTsKLQotICAgIGZvciAoIGkg
PSAocCAtIF9zdGFydCkgLyBQQUdFX1NJWkU7IAotICAgICAgICAgIGkgPCAocCArIGwgLSBfc3Rh
cnQpIC8gUEFHRV9TSVpFOyAKLSAgICAgICAgICBpKysgKQotICAgIHsKLSAgICAgICAgcHRlID0g
eGVuX3hlbm1hcFtpXTsKLSAgICAgICAgc3dpdGNoICggbWcgKQotICAgICAgICB7Ci0gICAgICAg
IGNhc2UgbWdfY2xlYXI6Ci0gICAgICAgICAgICBwdGUucHQudmFsaWQgPSAwOwotICAgICAgICAg
ICAgYnJlYWs7Ci0gICAgICAgIGNhc2UgbWdfcm86Ci0gICAgICAgICAgICBwdGUucHQudmFsaWQg
PSAxOwotICAgICAgICAgICAgcHRlLnB0LnB4biA9IDE7Ci0gICAgICAgICAgICBwdGUucHQueG4g
PSAxOwotICAgICAgICAgICAgcHRlLnB0LnJvID0gMTsKLSAgICAgICAgICAgIGJyZWFrOwotICAg
ICAgICBjYXNlIG1nX3J3OgotICAgICAgICAgICAgcHRlLnB0LnZhbGlkID0gMTsKLSAgICAgICAg
ICAgIHB0ZS5wdC5weG4gPSAxOwotICAgICAgICAgICAgcHRlLnB0LnhuID0gMTsKLSAgICAgICAg
ICAgIHB0ZS5wdC5ybyA9IDA7Ci0gICAgICAgICAgICBicmVhazsKLSAgICAgICAgY2FzZSBtZ19y
eDoKLSAgICAgICAgICAgIHB0ZS5wdC52YWxpZCA9IDE7Ci0gICAgICAgICAgICBwdGUucHQucHhu
ID0gMDsKLSAgICAgICAgICAgIHB0ZS5wdC54biA9IDA7Ci0gICAgICAgICAgICBwdGUucHQucm8g
PSAxOwotICAgICAgICAgICAgYnJlYWs7Ci0gICAgICAgIH0KLSAgICAgICAgd3JpdGVfcHRlKHhl
bl94ZW5tYXAgKyBpLCBwdGUpOwotICAgIH0KLSAgICBmbHVzaF94ZW5fdGxiX2xvY2FsKCk7Ci19
Ci0KIC8qIFJlbGVhc2UgYWxsIF9faW5pdCBhbmQgX19pbml0ZGF0YSByYW5nZXMgdG8gYmUgcmV1
c2VkICovCiB2b2lkIGZyZWVfaW5pdF9tZW1vcnkodm9pZCkKIHsKQEAgLTEzMDksOCArMTI2Mywx
MiBAQCB2b2lkIGZyZWVfaW5pdF9tZW1vcnkodm9pZCkKICAgICB1aW50MzJfdCBpbnNuOwogICAg
IHVuc2lnbmVkIGludCBpLCBuciA9IGxlbiAvIHNpemVvZihpbnNuKTsKICAgICB1aW50MzJfdCAq
cDsKKyAgICBpbnQgcmM7CiAKLSAgICBzZXRfcHRlX2ZsYWdzX29uX3JhbmdlKF9faW5pdF9iZWdp
biwgbGVuLCBtZ19ydyk7CisgICAgcmMgPSBtb2RpZnlfeGVuX21hcHBpbmdzKCh1bnNpZ25lZCBs
b25nKV9faW5pdF9iZWdpbiwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKHVuc2lnbmVk
IGxvbmcpX19pbml0X2VuZCwgUEFHRV9IWVBFUlZJU09SX1JXKTsKKyAgICBpZiAoIHJjICkKKyAg
ICAgICAgcGFuaWMoIlVuYWJsZSB0byBtYXAgUlcgdGhlIGluaXQgc2VjdGlvbiAocmMgPSAlZClc
biIsIHJjKTsKIAogICAgIC8qCiAgICAgICogRnJvbSBub3cgb24sIGluaXQgd2lsbCBub3QgYmUg
dXNlZCBmb3IgZXhlY3V0aW9uIGFueW1vcmUsCkBAIC0xMzI4LDcgKzEyODYsMTEgQEAgdm9pZCBm
cmVlX2luaXRfbWVtb3J5KHZvaWQpCiAgICAgZm9yICggaSA9IDA7IGkgPCBucjsgaSsrICkKICAg
ICAgICAgKihwICsgaSkgPSBpbnNuOwogCi0gICAgc2V0X3B0ZV9mbGFnc19vbl9yYW5nZShfX2lu
aXRfYmVnaW4sIGxlbiwgbWdfY2xlYXIpOworICAgIHJjID0gZGVzdHJveV94ZW5fbWFwcGluZ3Mo
KHVuc2lnbmVkIGxvbmcpX19pbml0X2JlZ2luLAorICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgKHVuc2lnbmVkIGxvbmcpX19pbml0X2VuZCk7CisgICAgaWYgKCByYyApCisgICAgICAgIHBh
bmljKCJVbmFibGUgdG8gcmVtb3ZlIHRoZSBpbml0IHNlY3Rpb24gKHJjID0gJWQpXG4iLCByYyk7
CisKICAgICBpbml0X2RvbWhlYXBfcGFnZXMocGEsIHBhICsgbGVuKTsKICAgICBwcmludGsoIkZy
ZWVkICVsZGtCIGluaXQgbWVtb3J5LlxuIiwgKGxvbmcpKF9faW5pdF9lbmQtX19pbml0X2JlZ2lu
KT4+MTApOwogfQotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
