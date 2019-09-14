Return-Path: <SRS0=7ja4=XJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BADC3C4CEC8
	for <xen-devel@archiver.kernel.org>; Sat, 14 Sep 2019 05:20:09 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 967332081B
	for <xen-devel@archiver.kernel.org>; Sat, 14 Sep 2019 05:20:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 967332081B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i90TY-0006V2-9X; Sat, 14 Sep 2019 05:20:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rDpt=XJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i90TX-0006Um-PF
 for xen-devel@lists.xenproject.org; Sat, 14 Sep 2019 05:19:59 +0000
X-Inumbo-ID: 44acdb30-d6af-11e9-95c0-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 44acdb30-d6af-11e9-95c0-12813bfff9fa;
 Sat, 14 Sep 2019 05:19:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C393EADAA;
 Sat, 14 Sep 2019 05:19:46 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Sat, 14 Sep 2019 07:19:41 +0200
Message-Id: <20190914051944.21409-2-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190914051944.21409-1-jgross@suse.com>
References: <20190914051944.21409-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v4 1/4] xen/sched: populate cpupool0 only after
 all cpus are up
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
Cc: Juergen Gross <jgross@suse.com>, Dario Faggioli <dfaggioli@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2ltcGxpZnkgY3B1cG9vbCBpbml0aWFsaXphdGlvbiBieSBwb3B1bGF0aW5nIGNwdXBvb2wwIHdp
dGggY3B1cyBvbmx5CmFmdGVyIGFsbCBjcHVzIGFyZSB1cC4gVGhpcyBhdm9pZHMgaGF2aW5nIHRv
IGNhbGwgdGhlIGNwdSBub3RpZmllcgpkaXJlY3RseSBmb3IgY3B1IDAuCgpXaXRoIHRoYXQgaW4g
cGxhY2UgdGhlcmUgaXMgbm8gbmVlZCB0byBjcmVhdGUgY3B1cG9vbDAgZWFybGllciwgc28KZG8g
dGhhdCBqdXN0IGJlZm9yZSBhc3NpZ25pbmcgdGhlIGNwdXMuIEluaXRpYWxpemUgZnJlZSBjcHVz
IHdpdGggYWxsCm9ubGluZSBjcHVzIGF0IHRoYXQgdGltZSBpbiBvcmRlciB0byBiZSBhYmxlIHRv
IGFkZCB0aGUgY3B1IG5vdGlmaWVyCmxhdGUsIHRvby4KClNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4g
R3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KUmV2aWV3ZWQtYnk6IERhcmlvIEZhZ2dpb2xpIDxkZmFn
Z2lvbGlAc3VzZS5jb20+Ci0tLQpWMTogbmV3IHBhdGNoCi0tLQogeGVuL2NvbW1vbi9jcHVwb29s
LmMgfCAxOCArKysrKysrKysrKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25z
KCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vY3B1cG9vbC5jIGIv
eGVuL2NvbW1vbi9jcHVwb29sLmMKaW5kZXggZjkwZTQ5NmVkYS4uY2FlYTViZDhiMyAxMDA2NDQK
LS0tIGEveGVuL2NvbW1vbi9jcHVwb29sLmMKKysrIGIveGVuL2NvbW1vbi9jcHVwb29sLmMKQEAg
LTc2MiwxOCArNzYyLDI4IEBAIHN0YXRpYyBzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgY3B1X25mYiA9
IHsKICAgICAubm90aWZpZXJfY2FsbCA9IGNwdV9jYWxsYmFjawogfTsKIAotc3RhdGljIGludCBf
X2luaXQgY3B1cG9vbF9wcmVzbXBfaW5pdCh2b2lkKQorc3RhdGljIGludCBfX2luaXQgY3B1cG9v
bF9pbml0KHZvaWQpCiB7CisgICAgdW5zaWduZWQgaW50IGNwdTsKICAgICBpbnQgZXJyOwotICAg
IHZvaWQgKmNwdSA9ICh2b2lkICopKGxvbmcpc21wX3Byb2Nlc3Nvcl9pZCgpOworCiAgICAgY3B1
cG9vbDAgPSBjcHVwb29sX2NyZWF0ZSgwLCAwLCAmZXJyKTsKICAgICBCVUdfT04oY3B1cG9vbDAg
PT0gTlVMTCk7CiAgICAgY3B1cG9vbF9wdXQoY3B1cG9vbDApOwotICAgIGNwdV9jYWxsYmFjaygm
Y3B1X25mYiwgQ1BVX09OTElORSwgY3B1KTsKICAgICByZWdpc3Rlcl9jcHVfbm90aWZpZXIoJmNw
dV9uZmIpOworCisgICAgc3Bpbl9sb2NrKCZjcHVwb29sX2xvY2spOworCisgICAgY3B1bWFza19j
b3B5KCZjcHVwb29sX2ZyZWVfY3B1cywgJmNwdV9vbmxpbmVfbWFwKTsKKworICAgIGZvcl9lYWNo
X2NwdSAoIGNwdSwgJmNwdXBvb2xfZnJlZV9jcHVzICkKKyAgICAgICAgY3B1cG9vbF9hc3NpZ25f
Y3B1X2xvY2tlZChjcHVwb29sMCwgY3B1KTsKKworICAgIHNwaW5fdW5sb2NrKCZjcHVwb29sX2xv
Y2spOworCiAgICAgcmV0dXJuIDA7CiB9Ci1wcmVzbXBfaW5pdGNhbGwoY3B1cG9vbF9wcmVzbXBf
aW5pdCk7CitfX2luaXRjYWxsKGNwdXBvb2xfaW5pdCk7CiAKIC8qCiAgKiBMb2NhbCB2YXJpYWJs
ZXM6Ci0tIAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
