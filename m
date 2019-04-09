Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8195AC10F13
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 03:10:11 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57ED620883
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 03:10:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57ED620883
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDh94-0005uF-LN; Tue, 09 Apr 2019 03:09:58 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iHqD=SL=zhaoxin.com=fionali-oc@srs-us1.protection.inumbo.net>)
 id 1hDh93-0005u8-Kz
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 03:09:57 +0000
X-Inumbo-ID: f122aa5a-5a74-11e9-92d7-bc764e045a96
Received: from ZXSHCAS2.zhaoxin.com (unknown [203.148.12.82])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f122aa5a-5a74-11e9-92d7-bc764e045a96;
 Tue, 09 Apr 2019 03:09:54 +0000 (UTC)
Received: from zxbjmbx1.zhaoxin.com (10.29.252.163) by ZXSHCAS2.zhaoxin.com
 (10.28.252.162) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1261.35; Tue, 9 Apr
 2019 11:09:50 +0800
Received: from localhost.localdomain (10.29.8.62) by zxbjmbx1.zhaoxin.com
 (10.29.252.163) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1261.35; Tue, 9 Apr
 2019 11:09:49 +0800
From: FionaLi-oc <fionali-oc@zhaoxin.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 9 Apr 2019 11:09:48 +0800
Message-ID: <1554779388-3769-1-git-send-email-fionali-oc@zhaoxin.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.29.8.62]
X-ClientProxiedBy: zxbjmbx1.zhaoxin.com (10.29.252.163) To
 zxbjmbx1.zhaoxin.com (10.29.252.163)
Subject: [Xen-devel] [PATCH 2/2] x86/acpi: Improve suspend and resume
 process for Zhaoxin CPU
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
Message-ID: <20190409030948.ESvY9YwjqxoB4pgQmqFc01T97TDoptJ1LQWIelx0-tE@z>

V2hlbiBleGVjdXRpbmcgU1lTRVhJVCBvciBTWVNFTlRSWSBpbiBaaGFveGluIENQVSwgQ1BVIG5l
ZWRzIHRvCnNhdmUgb3IgcmVzdG9yZSBhIHNldCBvZiBNU1JzLgoKU2lnbmVkLW9mZi1ieTogRmlv
bmFMaS1vYyA8ZmlvbmFsaS1vY0B6aGFveGluLmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvYWNwaS9z
dXNwZW5kLmMgfCA2ICsrKystLQogeGVuL2FyY2gveDg2L3g4Nl82NC90cmFwcy5jIHwgMyArKy0K
IDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL3g4Ni9hY3BpL3N1c3BlbmQuYyBiL3hlbi9hcmNoL3g4Ni9hY3BpL3N1
c3BlbmQuYwppbmRleCAwMGU2MDEyLi5iY2ZmNjcyIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYv
YWNwaS9zdXNwZW5kLmMKKysrIGIveGVuL2FyY2gveDg2L2FjcGkvc3VzcGVuZC5jCkBAIC0yOCw3
ICsyOCw4IEBAIHZvaWQgc2F2ZV9yZXN0X3Byb2Nlc3Nvcl9zdGF0ZSh2b2lkKQogICAgIHJkbXNy
bChNU1JfQ1NUQVIsIHNhdmVkX2NzdGFyKTsKICAgICByZG1zcmwoTVNSX0xTVEFSLCBzYXZlZF9s
c3Rhcik7CiAgICAgaWYgKCBib290X2NwdV9kYXRhLng4Nl92ZW5kb3IgPT0gWDg2X1ZFTkRPUl9J
TlRFTCB8fAotICAgICAgICAgYm9vdF9jcHVfZGF0YS54ODZfdmVuZG9yID09IFg4Nl9WRU5ET1Jf
Q0VOVEFVUiApCisgICAgICAgICBib290X2NwdV9kYXRhLng4Nl92ZW5kb3IgPT0gWDg2X1ZFTkRP
Ul9DRU5UQVVSIHx8CisgICAgICAgICBib290X2NwdV9kYXRhLng4Nl92ZW5kb3IgPT0gWDg2X1ZF
TkRPUl9TSEFOR0hBSSApCiAgICAgewogICAgICAgICByZG1zcmwoTVNSX0lBMzJfU1lTRU5URVJf
RVNQLCBzYXZlZF9zeXNlbnRlcl9lc3ApOwogICAgICAgICByZG1zcmwoTVNSX0lBMzJfU1lTRU5U
RVJfRUlQLCBzYXZlZF9zeXNlbnRlcl9laXApOwpAQCAtNTMsNyArNTQsOCBAQCB2b2lkIHJlc3Rv
cmVfcmVzdF9wcm9jZXNzb3Jfc3RhdGUodm9pZCkKICAgICB3cm1zcmwoTVNSX1NIQURPV19HU19C
QVNFLCBzYXZlZF9rZXJuZWxfZ3NfYmFzZSk7CiAKICAgICBpZiAoIGJvb3RfY3B1X2RhdGEueDg2
X3ZlbmRvciA9PSBYODZfVkVORE9SX0lOVEVMIHx8Ci0gICAgICAgICBib290X2NwdV9kYXRhLng4
Nl92ZW5kb3IgPT0gWDg2X1ZFTkRPUl9DRU5UQVVSICkKKyAgICAgICAgIGJvb3RfY3B1X2RhdGEu
eDg2X3ZlbmRvciA9PSBYODZfVkVORE9SX0NFTlRBVVIgfHwKKyAgICAgICAgIGJvb3RfY3B1X2Rh
dGEueDg2X3ZlbmRvciA9PSBYODZfVkVORE9SX1NIQU5HSEFJICkKICAgICB7CiAgICAgICAgIC8q
IFJlY292ZXIgc3lzZW50ZXIgTVNScyAqLwogICAgICAgICB3cm1zcmwoTVNSX0lBMzJfU1lTRU5U
RVJfRVNQLCBzYXZlZF9zeXNlbnRlcl9lc3ApOwpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3g4
Nl82NC90cmFwcy5jIGIveGVuL2FyY2gveDg2L3g4Nl82NC90cmFwcy5jCmluZGV4IGJmNzg3MGUu
LjMwZDcwMTIgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni94ODZfNjQvdHJhcHMuYworKysgYi94
ZW4vYXJjaC94ODYveDg2XzY0L3RyYXBzLmMKQEAgLTMzNSw3ICszMzUsOCBAQCB2b2lkIHN1YmFy
Y2hfcGVyY3B1X3RyYXBzX2luaXQodm9pZCkKICAgICBzdHViX3ZhICs9IG9mZnNldDsKIAogICAg
IGlmICggYm9vdF9jcHVfZGF0YS54ODZfdmVuZG9yID09IFg4Nl9WRU5ET1JfSU5URUwgfHwKLSAg
ICAgICAgIGJvb3RfY3B1X2RhdGEueDg2X3ZlbmRvciA9PSBYODZfVkVORE9SX0NFTlRBVVIgKQor
ICAgICAgICAgYm9vdF9jcHVfZGF0YS54ODZfdmVuZG9yID09IFg4Nl9WRU5ET1JfQ0VOVEFVUiB8
fAorICAgICAgICAgYm9vdF9jcHVfZGF0YS54ODZfdmVuZG9yID09IFg4Nl9WRU5ET1JfU0hBTkdI
QUkgKQogICAgIHsKICAgICAgICAgLyogU1lTRU5URVIgZW50cnkuICovCiAgICAgICAgIHdybXNy
bChNU1JfSUEzMl9TWVNFTlRFUl9FU1AsIHN0YWNrX2JvdHRvbSk7Ci0tIAoxLjguMy4xCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
