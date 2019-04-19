Return-Path: <SRS0=iVlm=SV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5CBBC282DA
	for <xen-devel@archiver.kernel.org>; Fri, 19 Apr 2019 08:51:48 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9A8B21855
	for <xen-devel@archiver.kernel.org>; Fri, 19 Apr 2019 08:51:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9A8B21855
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hHPF0-0000Ks-1D; Fri, 19 Apr 2019 08:51:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=affJ=SV=zhaoxin.com=fionali-oc@srs-us1.protection.inumbo.net>)
 id 1hHPEz-0000KL-8y
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2019 08:51:25 +0000
X-Inumbo-ID: 4a3a6322-6280-11e9-b136-17e1f9976794
Received: from ZXSHCAS1.zhaoxin.com (unknown [203.148.12.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4a3a6322-6280-11e9-b136-17e1f9976794;
 Fri, 19 Apr 2019 08:51:18 +0000 (UTC)
Received: from zxbjmbx1.zhaoxin.com (10.29.252.163) by ZXSHCAS1.zhaoxin.com
 (10.28.252.161) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1261.35; Fri, 19 Apr
 2019 16:51:06 +0800
Received: from localhost.localdomain (10.29.8.62) by zxbjmbx1.zhaoxin.com
 (10.29.252.163) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1261.35; Fri, 19 Apr
 2019 16:51:05 +0800
From: FionaLi-oc <fionali-oc@zhaoxin.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 19 Apr 2019 16:50:57 +0800
Message-ID: <1555663857-4173-1-git-send-email-fionali-oc@zhaoxin.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.29.8.62]
X-ClientProxiedBy: zxbjmbx1.zhaoxin.com (10.29.252.163) To
 zxbjmbx1.zhaoxin.com (10.29.252.163)
Subject: [Xen-devel] [PATCH 2/2 v2] x86/acpi: Improve suspend and resume
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
Message-ID: <20190419085057.wx5ab7sj3JsTt3ETHRTkUFQR5MD2-jW6YTt5-PwNawA@z>

V2hlbiBleGVjdXRpbmcgU1lTRVhJVCBvciBTWVNFTlRSWSBpbiBaaGFveGluIENQVSwgQ1BVIG5l
ZWRzIHRvCnNhdmUgb3IgcmVzdG9yZSBhIHNldCBvZiBNU1JzLgoKU2lnbmVkLW9mZi1ieTogRmlv
bmFMaS1vYyA8ZmlvbmFsaS1vY0B6aGFveGluLmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvYWNwaS9z
dXNwZW5kLmMgfCA2ICsrKystLQogeGVuL2FyY2gveDg2L3g4Nl82NC90cmFwcy5jIHwgMyArKy0K
IDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL3g4Ni9hY3BpL3N1c3BlbmQuYyBiL3hlbi9hcmNoL3g4Ni9hY3BpL3N1
c3BlbmQuYwppbmRleCA5ZTY5YmYyLi5iMGVmMWMyIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYv
YWNwaS9zdXNwZW5kLmMKKysrIGIveGVuL2FyY2gveDg2L2FjcGkvc3VzcGVuZC5jCkBAIC0yNyw3
ICsyNyw4IEBAIHZvaWQgc2F2ZV9yZXN0X3Byb2Nlc3Nvcl9zdGF0ZSh2b2lkKQogICAgIHJkbXNy
bChNU1JfU0hBRE9XX0dTX0JBU0UsIHNhdmVkX2tlcm5lbF9nc19iYXNlKTsKICAgICByZG1zcmwo
TVNSX0NTVEFSLCBzYXZlZF9jc3Rhcik7CiAgICAgcmRtc3JsKE1TUl9MU1RBUiwgc2F2ZWRfbHN0
YXIpOwotICAgIGlmICggYm9vdF9jcHVfZGF0YS54ODZfdmVuZG9yICYgKFg4Nl9WRU5ET1JfSU5U
RUwgfCBYODZfVkVORE9SX0NFTlRBVVIpICkKKyAgICBpZiAoIGJvb3RfY3B1X2RhdGEueDg2X3Zl
bmRvciAmCisgICAgICAgIChYODZfVkVORE9SX0lOVEVMIHwgWDg2X1ZFTkRPUl9DRU5UQVVSIHwg
WDg2X1ZFTkRPUl9TSEFOR0hBSSkgKQogICAgIHsKICAgICAgICAgcmRtc3JsKE1TUl9JQTMyX1NZ
U0VOVEVSX0VTUCwgc2F2ZWRfc3lzZW50ZXJfZXNwKTsKICAgICAgICAgcmRtc3JsKE1TUl9JQTMy
X1NZU0VOVEVSX0VJUCwgc2F2ZWRfc3lzZW50ZXJfZWlwKTsKQEAgLTUxLDcgKzUyLDggQEAgdm9p
ZCByZXN0b3JlX3Jlc3RfcHJvY2Vzc29yX3N0YXRlKHZvaWQpCiAgICAgd3Jnc2Jhc2Uoc2F2ZWRf
Z3NfYmFzZSk7CiAgICAgd3Jtc3JsKE1TUl9TSEFET1dfR1NfQkFTRSwgc2F2ZWRfa2VybmVsX2dz
X2Jhc2UpOwogCi0gICAgaWYgKCBib290X2NwdV9kYXRhLng4Nl92ZW5kb3IgJiAoWDg2X1ZFTkRP
Ul9JTlRFTCB8IFg4Nl9WRU5ET1JfQ0VOVEFVUikgKQorICAgIGlmICggYm9vdF9jcHVfZGF0YS54
ODZfdmVuZG9yICYKKyAgICAgICAgKFg4Nl9WRU5ET1JfSU5URUwgfCBYODZfVkVORE9SX0NFTlRB
VVIgfCBYODZfVkVORE9SX1NIQU5HSEFJKSApCiAgICAgewogICAgICAgICAvKiBSZWNvdmVyIHN5
c2VudGVyIE1TUnMgKi8KICAgICAgICAgd3Jtc3JsKE1TUl9JQTMyX1NZU0VOVEVSX0VTUCwgc2F2
ZWRfc3lzZW50ZXJfZXNwKTsKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni94ODZfNjQvdHJhcHMu
YyBiL3hlbi9hcmNoL3g4Ni94ODZfNjQvdHJhcHMuYwppbmRleCA0NGFmNzY1Li42NTA2ZDZhIDEw
MDY0NAotLS0gYS94ZW4vYXJjaC94ODYveDg2XzY0L3RyYXBzLmMKKysrIGIveGVuL2FyY2gveDg2
L3g4Nl82NC90cmFwcy5jCkBAIC0zMzQsNyArMzM0LDggQEAgdm9pZCBzdWJhcmNoX3BlcmNwdV90
cmFwc19pbml0KHZvaWQpCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICh1bnNp
Z25lZCBsb25nKWxzdGFyX2VudGVyKTsKICAgICBzdHViX3ZhICs9IG9mZnNldDsKIAotICAgIGlm
ICggYm9vdF9jcHVfZGF0YS54ODZfdmVuZG9yICYgKFg4Nl9WRU5ET1JfSU5URUwgfCBYODZfVkVO
RE9SX0NFTlRBVVIpICkKKyAgICBpZiAoIGJvb3RfY3B1X2RhdGEueDg2X3ZlbmRvciAmCisgICAg
ICAgIChYODZfVkVORE9SX0lOVEVMIHwgWDg2X1ZFTkRPUl9DRU5UQVVSIHwgWDg2X1ZFTkRPUl9T
SEFOR0hBSSkgKQogICAgIHsKICAgICAgICAgLyogU1lTRU5URVIgZW50cnkuICovCiAgICAgICAg
IHdybXNybChNU1JfSUEzMl9TWVNFTlRFUl9FU1AsIHN0YWNrX2JvdHRvbSk7Ci0tIAoxLjguMy4x
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
