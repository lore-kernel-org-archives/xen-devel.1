Return-Path: <SRS0=cwKM=24=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D533C33C8C
	for <xen-devel@archiver.kernel.org>; Tue,  7 Jan 2020 12:25:35 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AAC7206F0
	for <xen-devel@archiver.kernel.org>; Tue,  7 Jan 2020 12:25:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="YHxzIvTT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AAC7206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ionv8-0007e9-F3; Tue, 07 Jan 2020 12:25:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cF2B=24=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ionv7-0007e4-Nj
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 12:25:13 +0000
X-Inumbo-ID: bbc31312-3148-11ea-b56d-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bbc31312-3148-11ea-b56d-bc764e2007e4;
 Tue, 07 Jan 2020 12:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578399905;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OpbKJyitG19QvZedu5aSWFAs9EOaDDRflD6uYMuAv2A=;
 b=YHxzIvTT9+HsbGqCUq82ClgGvyVxpPa6FqWlfbbnflScHgD0Hog+HkVQ
 7CQ61peFI3rIX7Sxhmaos+XpSIUlU4S0LjfdX/fF8iWFEIpp0onoj+p5A
 ck3iLkmMGkXNcFRYfgkOUpJrF3vYUYdbjpB0X/rBSnoYl5dwskjZ/H7/q Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: vvqOuoz5BpfVkGO72OFB00FZQHq/f2Wh7ufeDfYEKqQRqL47rJB2e0v538J/7zIJ4T4xF2etv6
 JMa2VW/DmX6/w08BA7yZ1HLPb0aYD4MX5ru7cqeMjg2cg1OM17ixb/63VGl1e7YAPGcvmBVDIg
 3g3VMY9t6hbCeDkuCUIDCkAmh6vBBT/SKJ19PtC3ZEzLzHsef0xG+5/gGbxGmj/BmqC1QgydUm
 UCOqCNP4UK2qqAwcqPENUeFHLj7a1su9F2lRYfRV/CQnxxA+lxFTQEayOVwc6aIN/aIiGjAc5b
 NMM=
X-SBRS: 2.7
X-MesageID: 10560147
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,406,1571716800"; d="scan'208";a="10560147"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Tue, 7 Jan 2020 12:25:01 +0000
Message-ID: <20200107122501.15511-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/vmx: Shrink TASK_SWITCH's
 hvm_task_switch_reason reasons[]
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
Cc: Kevin Tian <kevin.tian@intel.com>, Jan Beulich <JBeulich@suse.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Tm8gbmVlZCB0byB1c2UgNC1ieXRlIGludGVnZXJzIHRvIHN0b3JlIHR3byBiaXRzIG9mIGluZm9y
bWF0aW9uLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbT4KLS0tCkNDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+CkNDOiBXZWkg
TGl1IDx3bEB4ZW4ub3JnPgpDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5j
b20+CkNDOiBKdW4gTmFrYWppbWEgPGp1bi5uYWthamltYUBpbnRlbC5jb20+CkNDOiBLZXZpbiBU
aWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvaHZtL3ZteC92bXgu
YyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jIGIveGVuL2FyY2gveDg2L2h2
bS92bXgvdm14LmMKaW5kZXggZjgzZjEwMjYzOC4uYjc5YmNhNzFhZCAxMDA2NDQKLS0tIGEveGVu
L2FyY2gveDg2L2h2bS92bXgvdm14LmMKKysrIGIveGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMK
QEAgLTM5NzgsNyArMzk3OCw3IEBAIHZvaWQgdm14X3ZtZXhpdF9oYW5kbGVyKHN0cnVjdCBjcHVf
dXNlcl9yZWdzICpyZWdzKQogICAgICAgICB2bXhfdXBkYXRlX2NwdV9leGVjX2NvbnRyb2wodik7
CiAgICAgICAgIGJyZWFrOwogICAgIGNhc2UgRVhJVF9SRUFTT05fVEFTS19TV0lUQ0g6IHsKLSAg
ICAgICAgc3RhdGljIGNvbnN0IGVudW0gaHZtX3Rhc2tfc3dpdGNoX3JlYXNvbiByZWFzb25zW10g
PSB7CisgICAgICAgIHN0YXRpYyBjb25zdCBpbnQ4X3QgcmVhc29uc1tdID0gewogICAgICAgICAg
ICAgVFNXX2NhbGxfb3JfaW50LCBUU1dfaXJldCwgVFNXX2ptcCwgVFNXX2NhbGxfb3JfaW50CiAg
ICAgICAgIH07CiAgICAgICAgIHVuc2lnbmVkIGludCBpbnN0X2xlbiwgc291cmNlOwotLSAKMi4x
MS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
