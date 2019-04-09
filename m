Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCE71C10F13
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 03:06:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEC8B20818
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 03:06:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEC8B20818
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDh5i-0005id-TK; Tue, 09 Apr 2019 03:06:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iHqD=SL=zhaoxin.com=fionali-oc@srs-us1.protection.inumbo.net>)
 id 1hDh5h-0005iY-PK
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 03:06:29 +0000
X-Inumbo-ID: 74b1e0da-5a74-11e9-be71-73406346db6d
Received: from ZXSHCAS1.zhaoxin.com (unknown [203.148.12.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 74b1e0da-5a74-11e9-be71-73406346db6d;
 Tue, 09 Apr 2019 03:06:26 +0000 (UTC)
Received: from zxbjmbx1.zhaoxin.com (10.29.252.163) by ZXSHCAS1.zhaoxin.com
 (10.28.252.161) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1261.35; Tue, 9 Apr
 2019 11:06:17 +0800
Received: from localhost.localdomain (10.29.8.62) by zxbjmbx1.zhaoxin.com
 (10.29.252.163) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1261.35; Tue, 9 Apr
 2019 11:06:16 +0800
From: FionaLi-oc <fionali-oc@zhaoxin.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 9 Apr 2019 11:06:15 +0800
Message-ID: <1554779175-3593-1-git-send-email-fionali-oc@zhaoxin.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.29.8.62]
X-ClientProxiedBy: zxbjmbx1.zhaoxin.com (10.29.252.163) To
 zxbjmbx1.zhaoxin.com (10.29.252.163)
Subject: [Xen-devel] [PATCH 1/2] acpi/cpufreq: Support CPU frequency driver
 for Zhaoxin cpu
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
Cc: wei.liu2@citrix.com, andrew.cooper3@citrix.com, cobechen@zhaoxin.com,
 FionaLi-oc <fionali-oc@zhaoxin.com>, jbeulich@suse.com, roger.pau@citrix.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190409030615.ge69D5YDPqWqzFla10wL6ZwkpR5B039g496XpbLOenY@z>

SW1wbGVtZW50YXRpb24gb2YgWmhhb3hpbiBDUFUgZnJlcXVlbmN5IGlzIGNvbXBhdGlibGUgd2l0
aCBJbnRlbC4KWmhhb3hpbiBDUFUgYWxzbyBzdXBwb3J0cyBFU1QuCgpTaWduZWQtb2ZmLWJ5OiBG
aW9uYUxpLW9jIDxmaW9uYWxpLW9jQHpoYW94aW4uY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9hY3Bp
L2NwdWZyZXEvY3B1ZnJlcS5jIHwgMTQgKysrKysrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA5
IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2
L2FjcGkvY3B1ZnJlcS9jcHVmcmVxLmMgYi94ZW4vYXJjaC94ODYvYWNwaS9jcHVmcmVxL2NwdWZy
ZXEuYwppbmRleCA4NDRhYjg1Li45ZDg2ZmEwIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvYWNw
aS9jcHVmcmVxL2NwdWZyZXEuYworKysgYi94ZW4vYXJjaC94ODYvYWNwaS9jcHVmcmVxL2NwdWZy
ZXEuYwpAQCAtNjAsNyArNjAsOCBAQCBzdGF0aWMgaW50IGNoZWNrX2VzdF9jcHUodW5zaWduZWQg
aW50IGNwdWlkKQogewogICAgIHN0cnVjdCBjcHVpbmZvX3g4NiAqY3B1ID0gJmNwdV9kYXRhW2Nw
dWlkXTsKIAotICAgIGlmIChjcHUtPng4Nl92ZW5kb3IgIT0gWDg2X1ZFTkRPUl9JTlRFTCB8fAor
ICAgIGlmICgoY3B1LT54ODZfdmVuZG9yICE9IFg4Nl9WRU5ET1JfSU5URUwgJiYKKyAgICAgICAg
Y3B1LT54ODZfdmVuZG9yICE9IFg4Nl9WRU5ET1JfU0hBTkdIQUkpIHx8CiAgICAgICAgICFjcHVf
aGFzKGNwdSwgWDg2X0ZFQVRVUkVfRUlTVCkpCiAgICAgICAgIHJldHVybiAwOwogCkBAIC02MDAs
NyArNjAxLDggQEAgYWNwaV9jcHVmcmVxX2NwdV9pbml0KHN0cnVjdCBjcHVmcmVxX3BvbGljeSAq
cG9saWN5KQogCiAgICAgLyogQ2hlY2sgZm9yIEFQRVJGL01QRVJGIHN1cHBvcnQgaW4gaGFyZHdh
cmUKICAgICAgKiBhbHNvIGNoZWNrIGZvciBib29zdCBzdXBwb3J0ICovCi0gICAgaWYgKGMtPng4
Nl92ZW5kb3IgPT0gWDg2X1ZFTkRPUl9JTlRFTCAmJiBjLT5jcHVpZF9sZXZlbCA+PSA2KQorICAg
IGlmICgoYy0+eDg2X3ZlbmRvciA9PSBYODZfVkVORE9SX0lOVEVMICYmIGMtPmNwdWlkX2xldmVs
ID49IDYpIHx8CisgICAgICAgIChjLT54ODZfdmVuZG9yID09IFg4Nl9WRU5ET1JfU0hBTkdIQUkp
KQogICAgICAgICBvbl9zZWxlY3RlZF9jcHVzKGNwdW1hc2tfb2YoY3B1KSwgZmVhdHVyZV9kZXRl
Y3QsIHBvbGljeSwgMSk7CiAKICAgICAvKgpAQCAtNjQ2LDcgKzY0OCw4IEBAIHN0YXRpYyBpbnQg
X19pbml0IGNwdWZyZXFfZHJpdmVyX2luaXQodm9pZCkKICAgICBpbnQgcmV0ID0gMDsKIAogICAg
IGlmICgoY3B1ZnJlcV9jb250cm9sbGVyID09IEZSRVFDVExfeGVuKSAmJgotICAgICAgICAoYm9v
dF9jcHVfZGF0YS54ODZfdmVuZG9yID09IFg4Nl9WRU5ET1JfSU5URUwpKQorICAgICAgICAoKGJv
b3RfY3B1X2RhdGEueDg2X3ZlbmRvciA9PSBYODZfVkVORE9SX0lOVEVMKSB8fAorICAgICAgICAg
KGJvb3RfY3B1X2RhdGEueDg2X3ZlbmRvciA9PSBYODZfVkVORE9SX1NIQU5HSEFJKSkpCiAgICAg
ICAgIHJldCA9IGNwdWZyZXFfcmVnaXN0ZXJfZHJpdmVyKCZhY3BpX2NwdWZyZXFfZHJpdmVyKTsK
ICAgICBlbHNlIGlmICgoY3B1ZnJlcV9jb250cm9sbGVyID09IEZSRVFDVExfeGVuKSAmJgogICAg
ICAgICAoYm9vdF9jcHVfZGF0YS54ODZfdmVuZG9yID09IFg4Nl9WRU5ET1JfQU1EKSkKQEAgLTY2
MCw5ICs2NjMsMTAgQEAgaW50IGNwdWZyZXFfY3B1X2luaXQodW5zaWduZWQgaW50IGNwdWlkKQog
ewogICAgIGludCByZXQ7CiAKLSAgICAvKiBDdXJyZW50bHkgd2Ugb25seSBoYW5kbGUgSW50ZWwg
YW5kIEFNRCBwcm9jZXNzb3IgKi8KKyAgICAvKiBDdXJyZW50bHkgd2Ugb25seSBoYW5kbGUgSW50
ZWwsIEFNRCBhbmQgU2hhbmdIYWkgcHJvY2Vzc29yICovCiAgICAgaWYgKCAoYm9vdF9jcHVfZGF0
YS54ODZfdmVuZG9yID09IFg4Nl9WRU5ET1JfSU5URUwgKSB8fAotICAgICAgICAgKGJvb3RfY3B1
X2RhdGEueDg2X3ZlbmRvciA9PSBYODZfVkVORE9SX0FNRCApICkKKyAgICAgICAgIChib290X2Nw
dV9kYXRhLng4Nl92ZW5kb3IgPT0gWDg2X1ZFTkRPUl9BTUQgKSB8fAorICAgICAgICAgKGJvb3Rf
Y3B1X2RhdGEueDg2X3ZlbmRvciA9PSBYODZfVkVORE9SX1NIQU5HSEFJICkgKQogICAgICAgICBy
ZXQgPSBjcHVmcmVxX2FkZF9jcHUoY3B1aWQpOwogICAgIGVsc2UKICAgICAgICAgcmV0ID0gLUVG
QVVMVDsKLS0gCjEuOC4zLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
