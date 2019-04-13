Return-Path: <SRS0=mWk2=SP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44C47C10F14
	for <xen-devel@archiver.kernel.org>; Sat, 13 Apr 2019 16:23:57 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D34D208E3
	for <xen-devel@archiver.kernel.org>; Sat, 13 Apr 2019 16:23:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D34D208E3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hFLRK-0005FO-Mi; Sat, 13 Apr 2019 16:23:38 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lqlW=SP=citrix.com=prvs=9997e3fe6=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hFLRJ-0005F8-Bk
 for xen-devel@lists.xenproject.org; Sat, 13 Apr 2019 16:23:37 +0000
X-Inumbo-ID: 7cd49322-5e08-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7cd49322-5e08-11e9-92d7-bc764e045a96;
 Sat, 13 Apr 2019 16:23:36 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,345,1549929600"; d="scan'208";a="83508406"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Sat, 13 Apr 2019 17:22:11 +0100
Message-ID: <1555172532-23814-3-git-send-email-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1555172532-23814-1-git-send-email-andrew.cooper3@citrix.com>
References: <1555172532-23814-1-git-send-email-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/3] x86/msr: Definitions for
 MSR_INTEL_CORE_THREAD_COUNT
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190413162211.x4Ybes82DvvTQQn9SeUniwnpbYVqsZWv6RdJX4tEAaQ@z>

VGhpcyBpcyBhIG1vZGVsIHNwZWNpZmljIHJlZ2lzdGVyIHdoaWNoIGRldGFpbHMgdGhlIGN1cnJl
bnQgY29uZmlndXJhdGlvbgpjb3JlcyBhbmQgdGhyZWFkcyBpbiB0aGUgcGFja2FnZS4gIEJlY2F1
c2Ugb2YgaG93IEh5cGVydGhyZWFkIGFuZCBDb3JlCmNvbmZpZ3VyYXRpb24gd29ya3Mgd29ya3Mg
aW4gZmlybXdhcmUsIHRoZSBNU1IgaXQgaXMgZGUtZmFjdG8gY29uc3RhbnQgYW5kCndpbGwgcmVt
YWluIHVuY2hhbmdlZCB1bnRpbCB0aGUgbmV4dCBzeXN0ZW0gcmVzZXQuCgpJdCBpcyBhIHJlYWQg
b25seSBNU1IsIGFuZCBmb3Igbm93LCByZWplY3QgZ3Vlc3QgYXR0ZW1wdHMgdG8gcmVhZCBpdCwg
dG8gYXZvaWQKdGhlIHN5c3RlbSBzZXR0aW5nIGxlYWtpbmcgaW50byBndWVzdCBjb250ZXh0LiAg
RnVydGhlciBDUFVJRC9NU1Igd29yayBpcwpyZXF1aXJlZCBiZWZvcmUgd2UgY2FuIHN0YXJ0IHZp
cnR1YWxpc2luZyBhIGNvbnNpc3RlbnQgdG9wb2xvZ3kgdG8gdGhlIGd1ZXN0LgoKU2lnbmVkLW9m
Zi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0tCkNDOiBK
YW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+CkNDOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRy
aXguY29tPgpDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpPYnNl
cnZhbnQgcGVvcGxlIHdpbGwgbm90aWNlIHRoYXQgaW4gdGhlIGxhdGVzdCBTRE0gYXQgdGhlIHRp
bWUgb2Ygd3JpdGluZywKdmVyc2lvbiAwNjksIHRoaXMgTVNSIGlzIGxpc3RlZCBpbiBzaW5nbGUg
dGFibGUgZm9yIEhhc3dlbGwgZ2VuZXJhdGlvbiBYZW9uJ3MsCmFuZCB0aGF0IHRoZSB0aHJlYWQg
YW5kIGNvcmUgY291bnQgZmllbGRzIGFyZSB0aGUgd3Jvbmcgd2F5IGFyb3VuZC4KCkknbSBpbmZv
cm1lZCB0aGF0IHRoaXMgTVNSIGhhcyBleGlzdGVkIHNpbmNlIHRoZSBOZWhhbGVtIGVyYSAoZXhj
ZXB0IGZvciBzb21lCm9mIHRoZSBlYXJseSBpbi1vcmRlciBBdG9tcyksIGhhcyBoYWQgY29uc2lz
dGVudCBiZWhhdmlvdXIgaW4gdGhhdCB0aW1lLCBhbmQKdGhhdCB0aGUgZG9jdW1lbnRhdGlvbiB3
aWxsIGJlIGFkZHJlc3NlZCBpbiBmdXR1cmUgU0RNIHJldmlzaW9ucy4KLS0tCiB4ZW4vYXJjaC94
ODYvbXNyLmMgICAgICAgICAgICAgIHwgMiArKwogeGVuL2luY2x1ZGUvYXNtLXg4Ni9tc3ItaW5k
ZXguaCB8IDQgKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS94ZW4vYXJjaC94ODYvbXNyLmMgYi94ZW4vYXJjaC94ODYvbXNyLmMKaW5kZXggODE1ZDU5
OS4uOTQ4ZDA3ZCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L21zci5jCisrKyBiL3hlbi9hcmNo
L3g4Ni9tc3IuYwpAQCAtMTMxLDYgKzEzMSw3IEBAIGludCBndWVzdF9yZG1zcihjb25zdCBzdHJ1
Y3QgdmNwdSAqdiwgdWludDMyX3QgbXNyLCB1aW50NjRfdCAqdmFsKQogICAgIGNhc2UgTVNSX1BS
RURfQ01EOgogICAgIGNhc2UgTVNSX0ZMVVNIX0NNRDoKICAgICAgICAgLyogV3JpdGUtb25seSAq
LworICAgIGNhc2UgTVNSX0lOVEVMX0NPUkVfVEhSRUFEX0NPVU5UOgogICAgIGNhc2UgTVNSX1RT
WF9GT1JDRV9BQk9SVDoKICAgICAgICAgLyogTm90IG9mZmVyZWQgdG8gZ3Vlc3RzLiAqLwogICAg
ICAgICBnb3RvIGdwX2ZhdWx0OwpAQCAtMjY3LDYgKzI2OCw3IEBAIGludCBndWVzdF93cm1zcihz
dHJ1Y3QgdmNwdSAqdiwgdWludDMyX3QgbXNyLCB1aW50NjRfdCB2YWwpCiAgICAgewogICAgICAg
ICB1aW50NjRfdCByc3ZkOwogCisgICAgY2FzZSBNU1JfSU5URUxfQ09SRV9USFJFQURfQ09VTlQ6
CiAgICAgY2FzZSBNU1JfSU5URUxfUExBVEZPUk1fSU5GTzoKICAgICBjYXNlIE1TUl9BUkNIX0NB
UEFCSUxJVElFUzoKICAgICAgICAgLyogUmVhZC1vbmx5ICovCmRpZmYgLS1naXQgYS94ZW4vaW5j
bHVkZS9hc20teDg2L21zci1pbmRleC5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9tc3ItaW5kZXgu
aAppbmRleCAxMTUxMmQ0Li4zODlmOTVmIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2
L21zci1pbmRleC5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvbXNyLWluZGV4LmgKQEAgLTMy
LDYgKzMyLDEwIEBACiAjZGVmaW5lIEVGRVJfS05PV05fTUFTSwkJKEVGRVJfU0NFIHwgRUZFUl9M
TUUgfCBFRkVSX0xNQSB8IEVGRVJfTlggfCBcCiAJCQkJIEVGRVJfU1ZNRSB8IEVGRVJfRkZYU0Up
CiAKKyNkZWZpbmUgTVNSX0lOVEVMX0NPUkVfVEhSRUFEX0NPVU5UICAgICAweDAwMDAwMDM1Cisj
ZGVmaW5lIE1TUl9DVENfVEhSRUFEX01BU0sgICAgICAgICAgICAgMHgwMDAwZmZmZgorI2RlZmlu
ZSBNU1JfQ1RDX0NPUkVfTUFTSyAgICAgICAgICAgICAgIDB4ZmZmZjAwMDAKKwogLyogU3BlY3Vs
YXRpb24gQ29udHJvbHMuICovCiAjZGVmaW5lIE1TUl9TUEVDX0NUUkwJCQkweDAwMDAwMDQ4CiAj
ZGVmaW5lIFNQRUNfQ1RSTF9JQlJTCQkJKF9BQygxLCBVTEwpIDw8IDApCi0tIAoyLjEuNAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
