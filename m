Return-Path: <SRS0=QKFq=WI=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBCF2C433FF
	for <xen-devel@archiver.kernel.org>; Mon, 12 Aug 2019 18:21:53 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EB532067D
	for <xen-devel@archiver.kernel.org>; Mon, 12 Aug 2019 18:21:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="ZjRigJPl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EB532067D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxEws-0004eg-7e; Mon, 12 Aug 2019 18:21:38 +0000
Received: from [172.99.69.81] (helo=us1-rack-iad1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gta3=WI=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hxEwq-0004eW-Sp
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2019 18:21:36 +0000
X-Inumbo-ID: 042bc638-bd2e-11e9-a228-0719648d03ac
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 042bc638-bd2e-11e9-a228-0719648d03ac;
 Mon, 12 Aug 2019 18:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565634095;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YyHNuPRyqaosd/+tWhz+df+oqb5irw6RFDbNkMo2spY=;
 b=ZjRigJPlVLqXdKt0yWAKXq8SbYz4TefIievPjpnyNuSRkTzphcBaHC7A
 MHTAyuqMf3XpykOu+Igb9VKVuN+H+jYBGY089dtRomE9FJ56/Vi1V/UXf
 AZjOiQGDLSgrSvXc9qm3V+304sxrvPDfungffxznZVspUXuv2Vz3w9kjd Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 0nxikEo/PLFB39haPvkHGO5iqtAqGZbZRGMSWHKawVdK+cyUvnRKzW7HTxl1sBoRZmqXddZSDL
 xCEbSa4nrDcuqd03ingt32JMntW89KUeVJaxnrRzgQGtMB6IHlnznPcsjBG1XM+uJQLdE4hkFD
 rdR5tzGk63aNx8qdq5T6t1TM4+agyfziE9L+t4vvX7ahKSD904jXPrflbFa2YUzYHs0MolmuOQ
 G2oXp55Wlw7X2jYtaVvcz8+eUeIq9GBjfMl+DFw/xujECebvXpM6UWuvSdOGdJD0aNuaBLuBsi
 o84=
X-SBRS: 2.7
X-MesageID: 4371888
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,378,1559534400"; 
   d="scan'208";a="4371888"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 12 Aug 2019 19:21:24 +0100
Message-ID: <20190812182125.18094-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190812182125.18094-1-andrew.cooper3@citrix.com>
References: <20190812182125.18094-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/desc: Move boot_gdtr into .rodata
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SXQgaXMgbmV2ZXIgd3JpdHRlbiB0by4KClRoaXMgd2FzIGFuIG92ZXJzaWdodCB3aGVuIGl0IHdh
cyBtb3ZlZCBmcm9tIGFzbSBpbnRvIEMuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBz
dXNlLmNvbT4KQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CkNDOiBSb2dlciBQYXUgTW9ubsOpIDxy
b2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvZGVzYy5jIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gveDg2L2Rlc2MuYyBiL3hlbi9hcmNoL3g4Ni9kZXNjLmMKaW5kZXggNDJjY2RjMmY4
Yy4uZGZlYjFiZWFhOCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2Rlc2MuYworKysgYi94ZW4v
YXJjaC94ODYvZGVzYy5jCkBAIC04OSw3ICs4OSw3IEBAIHNlZ19kZXNjX3QgYm9vdF9jb21wYXRf
Z2R0W1BBR0VfU0laRSAvIHNpemVvZihzZWdfZGVzY190KV0gPQogICogUmVmZXJlbmNlcyBib290
X2NwdV9nZHRfdGFibGUgZm9yIGEgc2hvcnQgcGVyaW9kLCB1bnRpbCB0aGUgQ1BVcyBzd2l0Y2gK
ICAqIG9udG8gdGhlaXIgcGVyLUNQVSBHRFRzLgogICovCi1zdHJ1Y3QgZGVzY19wdHIgYm9vdF9n
ZHRyID0geworY29uc3Qgc3RydWN0IGRlc2NfcHRyIGJvb3RfZ2R0ciA9IHsKICAgICAubGltaXQg
PSBMQVNUX1JFU0VSVkVEX0dEVF9CWVRFLAogICAgIC5iYXNlID0gKHVuc2lnbmVkIGxvbmcpKGJv
b3RfZ2R0IC0gRklSU1RfUkVTRVJWRURfR0RUX0VOVFJZKSwKIH07Ci0tIAoyLjExLjAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
