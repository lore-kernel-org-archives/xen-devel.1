Return-Path: <SRS0=7THE=S4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 985C9C43219
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 10:23:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70ACB206BA
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 10:23:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70ACB206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJy0L-0001CH-OD; Fri, 26 Apr 2019 10:22:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ufvn=S4=citrix.com=prvs=01289f4b5=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hJy0J-0001CC-W4
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 10:22:52 +0000
X-Inumbo-ID: 3cf6191c-680d-11e9-8e78-6f51b3b727ef
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3cf6191c-680d-11e9-8e78-6f51b3b727ef;
 Fri, 26 Apr 2019 10:22:48 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,397,1549929600"; d="scan'208";a="84487959"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 26 Apr 2019 11:22:45 +0100
Message-ID: <1556274165-31022-1-git-send-email-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/cpu: Use cpu_has_sep for configuring the
 SYSENTER MSRs
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 FionaLi-oc <fionali-oc@zhaoxin.com>, Wei Liu <wei.liu2@citrix.com>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190426102245.7nLFkNP3A0qMYoL9E_q8xOLqtloCWNnRx0k0wpaQEMQ@z>

Q3VycmVudGx5LCBjb25maWd1cmF0aW9uIG9mIHRoZSBTWVNFTlRFUiBNU1JzIGFyZSBiZWhpbmQg
YSB2ZW5kb3IgY2hlY2sgZm9yCkludGVsIGFuZCBDZW50YXVyLCBidXQgdGhpcyBtaXNzZXMgWmhh
b3hpbi4KClVzZSB0aGUgZmVhdHVyZSBiaXQsIHJhdGhlciB0aGFuIGEgdmVuZG9yIGNoZWNrLiAg
Y3B1X2hhc19zZXAgaXMgY2xlYXJlZCBlYXJseQpmb3IgQU1EIHByb2Nlc3NvcnMsIHdoaWNoIGNh
bid0IHVzZSBTWVNFTlRFUi9TWVNFWElUIHdoZW4gb3BlcmF0aW5nIGluIGxvbmcKbW9kZS4KClN1
Z2dlc3RlZC1ieTogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgpTaWduZWQtb2ZmLWJ5
OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KQ0M6IEphbiBC
ZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KQ0M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5j
b20+CkNDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KQ0M6IEZpb25h
TGktb2MgPGZpb25hbGktb2NAemhhb3hpbi5jb20+CgpQbGVhc2UgZG91YmxlIGNoZWNrIHRoYXQg
dGhpcyB3b3JrcyBmb3IgWmhhb3hpbi4gIEkndmUgdHJpZWQgSW50ZWwgYW5kIEFNRC4KLS0tCiB4
ZW4vYXJjaC94ODYvYWNwaS9zdXNwZW5kLmMgfCA2ICsrKystLQogeGVuL2FyY2gveDg2L3g4Nl82
NC90cmFwcy5jIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2FjcGkvc3VzcGVuZC5jIGIveGVu
L2FyY2gveDg2L2FjcGkvc3VzcGVuZC5jCmluZGV4IDllNjliZjIuLmJhOWQyZTEgMTAwNjQ0Ci0t
LSBhL3hlbi9hcmNoL3g4Ni9hY3BpL3N1c3BlbmQuYworKysgYi94ZW4vYXJjaC94ODYvYWNwaS9z
dXNwZW5kLmMKQEAgLTI3LDExICsyNywxMyBAQCB2b2lkIHNhdmVfcmVzdF9wcm9jZXNzb3Jfc3Rh
dGUodm9pZCkKICAgICByZG1zcmwoTVNSX1NIQURPV19HU19CQVNFLCBzYXZlZF9rZXJuZWxfZ3Nf
YmFzZSk7CiAgICAgcmRtc3JsKE1TUl9DU1RBUiwgc2F2ZWRfY3N0YXIpOwogICAgIHJkbXNybChN
U1JfTFNUQVIsIHNhdmVkX2xzdGFyKTsKLSAgICBpZiAoIGJvb3RfY3B1X2RhdGEueDg2X3ZlbmRv
ciAmIChYODZfVkVORE9SX0lOVEVMIHwgWDg2X1ZFTkRPUl9DRU5UQVVSKSApCisKKyAgICBpZiAo
IGNwdV9oYXNfc2VwICkKICAgICB7CiAgICAgICAgIHJkbXNybChNU1JfSUEzMl9TWVNFTlRFUl9F
U1AsIHNhdmVkX3N5c2VudGVyX2VzcCk7CiAgICAgICAgIHJkbXNybChNU1JfSUEzMl9TWVNFTlRF
Ul9FSVAsIHNhdmVkX3N5c2VudGVyX2VpcCk7CiAgICAgfQorCiAgICAgaWYgKCBjcHVfaGFzX3hz
YXZlICkKICAgICAgICAgc2F2ZWRfeGNyMCA9IGdldF94Y3IwKCk7CiB9CkBAIC01MSw3ICs1Myw3
IEBAIHZvaWQgcmVzdG9yZV9yZXN0X3Byb2Nlc3Nvcl9zdGF0ZSh2b2lkKQogICAgIHdyZ3NiYXNl
KHNhdmVkX2dzX2Jhc2UpOwogICAgIHdybXNybChNU1JfU0hBRE9XX0dTX0JBU0UsIHNhdmVkX2tl
cm5lbF9nc19iYXNlKTsKIAotICAgIGlmICggYm9vdF9jcHVfZGF0YS54ODZfdmVuZG9yICYgKFg4
Nl9WRU5ET1JfSU5URUwgfCBYODZfVkVORE9SX0NFTlRBVVIpICkKKyAgICBpZiAoIGNwdV9oYXNf
c2VwICkKICAgICB7CiAgICAgICAgIC8qIFJlY292ZXIgc3lzZW50ZXIgTVNScyAqLwogICAgICAg
ICB3cm1zcmwoTVNSX0lBMzJfU1lTRU5URVJfRVNQLCBzYXZlZF9zeXNlbnRlcl9lc3ApOwpkaWZm
IC0tZ2l0IGEveGVuL2FyY2gveDg2L3g4Nl82NC90cmFwcy5jIGIveGVuL2FyY2gveDg2L3g4Nl82
NC90cmFwcy5jCmluZGV4IDQ0YWY3NjUuLmNiNGJmMGEgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4
Ni94ODZfNjQvdHJhcHMuYworKysgYi94ZW4vYXJjaC94ODYveDg2XzY0L3RyYXBzLmMKQEAgLTMz
NCw3ICszMzQsNyBAQCB2b2lkIHN1YmFyY2hfcGVyY3B1X3RyYXBzX2luaXQodm9pZCkKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKHVuc2lnbmVkIGxvbmcpbHN0YXJfZW50ZXIp
OwogICAgIHN0dWJfdmEgKz0gb2Zmc2V0OwogCi0gICAgaWYgKCBib290X2NwdV9kYXRhLng4Nl92
ZW5kb3IgJiAoWDg2X1ZFTkRPUl9JTlRFTCB8IFg4Nl9WRU5ET1JfQ0VOVEFVUikgKQorICAgIGlm
ICggY3B1X2hhc19zZXAgKQogICAgIHsKICAgICAgICAgLyogU1lTRU5URVIgZW50cnkuICovCiAg
ICAgICAgIHdybXNybChNU1JfSUEzMl9TWVNFTlRFUl9FU1AsIHN0YWNrX2JvdHRvbSk7Ci0tIAoy
LjEuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
