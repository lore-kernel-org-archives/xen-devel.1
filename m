Return-Path: <SRS0=7ja4=XJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE808C49ED6
	for <xen-devel@archiver.kernel.org>; Sat, 14 Sep 2019 08:54:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B914020717
	for <xen-devel@archiver.kernel.org>; Sat, 14 Sep 2019 08:54:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B914020717
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i93oY-000080-M6; Sat, 14 Sep 2019 08:53:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rDpt=XJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i93oW-0008W8-Ua
 for xen-devel@lists.xenproject.org; Sat, 14 Sep 2019 08:53:52 +0000
X-Inumbo-ID: 127e46ee-d6cd-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 127e46ee-d6cd-11e9-b299-bc764e2007e4;
 Sat, 14 Sep 2019 08:53:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 17E59B670;
 Sat, 14 Sep 2019 08:53:07 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Sat, 14 Sep 2019 10:52:43 +0200
Message-Id: <20190914085251.18816-40-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190914085251.18816-1-jgross@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v3 39/47] xen/sched: reject switching smt on/off
 with core scheduling active
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlbiBjb3JlIG9yIHNvY2tldCBzY2hlZHVsaW5nIGFyZSBhY3RpdmUgZW5hYmxpbmcgb3IgZGlz
YWJsaW5nIHNtdCBpcwpub3QgcG9zc2libGUgYXMgdGhhdCB3b3VsZCByZXF1aXJlIGEgbWFqb3Ig
aG9zdCByZWNvbmZpZ3VyYXRpb24uCgpBZGQgYSBib29sIHNjaGVkX2Rpc2FibGVfc210X3N3aXRj
aGluZyB3aGljaCB3aWxsIGJlIHNldCBmb3IgY29yZSBvcgpzb2NrZXQgc2NoZWR1bGluZy4KClNp
Z25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KQWNrZWQtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tClYxOgotIG5ldyBwYXRjaApWMjoKLSBF
QlVTWSBhcyByZXR1cm4gY29kZSAoSmFuIEJldWxpY2gsIERhcmlvIEZhZ2dpb2xpKQotIF9fcmVh
ZF9tb3N0bHkgZm9yIHNjaGVkX2Rpc2FibGVfc210X3N3aXRjaGluZyAoSmFuIEJldWxpY2gpCi0t
LQogeGVuL2FyY2gveDg2L3N5c2N0bC5jICAgfCA1ICsrKysrCiB4ZW4vY29tbW9uL3NjaGVkdWxl
LmMgICB8IDEgKwogeGVuL2luY2x1ZGUveGVuL3NjaGVkLmggfCAxICsKIDMgZmlsZXMgY2hhbmdl
ZCwgNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3N5c2N0bC5jIGIv
eGVuL2FyY2gveDg2L3N5c2N0bC5jCmluZGV4IDUwYmUwYzcyMmEuLmUyZWY2MGQyZTcgMTAwNjQ0
Ci0tLSBhL3hlbi9hcmNoL3g4Ni9zeXNjdGwuYworKysgYi94ZW4vYXJjaC94ODYvc3lzY3RsLmMK
QEAgLTIwNiw2ICsyMDYsMTEgQEAgbG9uZyBhcmNoX2RvX3N5c2N0bCgKICAgICAgICAgICAgICAg
ICByZXQgPSAtRU9QTk9UU1VQUDsKICAgICAgICAgICAgICAgICBicmVhazsKICAgICAgICAgICAg
IH0KKyAgICAgICAgICAgIGlmICggc2NoZWRfZGlzYWJsZV9zbXRfc3dpdGNoaW5nICkKKyAgICAg
ICAgICAgIHsKKyAgICAgICAgICAgICAgICByZXQgPSAtRUJVU1k7CisgICAgICAgICAgICAgICAg
YnJlYWs7CisgICAgICAgICAgICB9CiAgICAgICAgICAgICBwbHVnID0gb3AgPT0gWEVOX1NZU0NU
TF9DUFVfSE9UUExVR19TTVRfRU5BQkxFOwogICAgICAgICAgICAgZm4gPSBzbXRfdXBfZG93bl9o
ZWxwZXI7CiAgICAgICAgICAgICBoY3B1ID0gX3AocGx1Zyk7CmRpZmYgLS1naXQgYS94ZW4vY29t
bW9uL3NjaGVkdWxlLmMgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKaW5kZXggZTM2MGM5ZWM5Zi4u
ZTViNzY3OGRjMCAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9zY2hlZHVsZS5jCisrKyBiL3hlbi9j
b21tb24vc2NoZWR1bGUuYwpAQCAtNTcsNiArNTcsNyBAQCBpbnRlZ2VyX3BhcmFtKCJzY2hlZF9y
YXRlbGltaXRfdXMiLCBzY2hlZF9yYXRlbGltaXRfdXMpOwogCiAvKiBOdW1iZXIgb2YgdmNwdXMg
cGVyIHN0cnVjdCBzY2hlZF91bml0LiAqLwogc3RhdGljIHVuc2lnbmVkIGludCBfX3JlYWRfbW9z
dGx5IHNjaGVkX2dyYW51bGFyaXR5ID0gMTsKK2Jvb2wgX19yZWFkX21vc3RseSBzY2hlZF9kaXNh
YmxlX3NtdF9zd2l0Y2hpbmc7CiBjb25zdCBjcHVtYXNrX3QgKnNjaGVkX3Jlc19tYXNrID0gJmNw
dW1hc2tfYWxsOwogCiAvKiBDb21tb24gbG9jayBmb3IgZnJlZSBjcHVzLiAqLwpkaWZmIC0tZ2l0
IGEveGVuL2luY2x1ZGUveGVuL3NjaGVkLmggYi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaAppbmRl
eCBmMjc2ZWM5Mzk4Li5lOTQzYjA2NjQ2IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS94ZW4vc2No
ZWQuaAorKysgYi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaApAQCAtMTA0MCw2ICsxMDQwLDcgQEAg
c3RhdGljIGlubGluZSBib29sIGlzX3hlbnN0b3JlX2RvbWFpbihjb25zdCBzdHJ1Y3QgZG9tYWlu
ICpkKQogfQogCiBleHRlcm4gYm9vbCBzY2hlZF9zbXRfcG93ZXJfc2F2aW5nczsKK2V4dGVybiBi
b29sIHNjaGVkX2Rpc2FibGVfc210X3N3aXRjaGluZzsKIAogZXh0ZXJuIGVudW0gY3B1ZnJlcV9j
b250cm9sbGVyIHsKICAgICBGUkVRQ1RMX25vbmUsIEZSRVFDVExfZG9tMF9rZXJuZWwsIEZSRVFD
VExfeGVuCi0tIAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
