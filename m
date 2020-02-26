Return-Path: <SRS0=wQWC=4O=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 273B7C4BA10
	for <xen-devel@archiver.kernel.org>; Wed, 26 Feb 2020 11:34:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9C9220637
	for <xen-devel@archiver.kernel.org>; Wed, 26 Feb 2020 11:34:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="fxgotDJQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9C9220637
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6uxL-0001Ee-40; Wed, 26 Feb 2020 11:34:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GoNq=4O=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1j6uxJ-0001Dv-Vx
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 11:34:22 +0000
X-Inumbo-ID: e2e9856a-588b-11ea-93fd-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e2e9856a-588b-11ea-93fd-12813bfff9fa;
 Wed, 26 Feb 2020 11:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582716843;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C6RLXrG/xUrSOlFLkn4n87JES4eaBiUlHD4DzmcAIuI=;
 b=fxgotDJQFDr7WWMdPv6VMs/3WLoRKOTbixRI7BGA5cEqE2WWYvQR0fKj
 eJqycPuBLZq3t8HcqF2+xx3JcUpzzkMthH9H2+O5pwnB1Pnw6OwsOJ4Fx
 cyvNmG9mPtMmTCyExqxfFi2nlf1NTYfU49eet7X0O8zjKsbn5R3AGYEl+ Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: AsJBmG3ZsZn8CDQEsGuE4AEq0Jvo4WPtmlpN3h+jvyjwICTnngBbiSWNL5tjKDrE8EksthiXcM
 b2bWt5bNI/rflUhZJiQpWKtfPjmnksW3QyAjLIwlLAlam/9yBTrZiCt2ZkSNfAEuBNlv8l1VrT
 uiK3Uw4ta88lY4VHx7d5bic7K3yxx5Z0Xs5GZBAgyTs2VUrlqHl8mQ3ttX2SZ7tb2IT9gND8ct
 qAQYcD+P/kNwX+AFvfxmHzez82+xEViIOyhEqwhasRNv69YuZ0eWqax6PKPVHi/P4R78E9MFkE
 U8w=
X-SBRS: 2.7
X-MesageID: 13211003
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,487,1574139600"; d="scan'208";a="13211003"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 26 Feb 2020 11:33:33 +0000
Message-ID: <20200226113355.2532224-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200226113355.2532224-1-anthony.perard@citrix.com>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH v3 01/23] xen/include: remove include of
 Config.mk
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SXQgaXNuJ3QgbmVjZXNzYXJ5IHRvIGluY2x1ZGUgQ29uZmlnLm1rIGhlcmUgYmVjYXVzZSB0aGlz
IE1ha2VmaWxlIGlzCm9ubHkgdXNlZCBieSB4ZW4vUnVsZXMubWsgd2hpY2ggYWxyZWFkeSBpbmNs
dWRlcyBDb25maWcubWsuCgpTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5w
ZXJhcmRAY2l0cml4LmNvbT4KUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4KLS0tCiB4ZW4vaW5jbHVkZS9NYWtlZmlsZSB8IDIgLS0KIDEgZmlsZSBjaGFuZ2VkLCAy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL01ha2VmaWxlIGIveGVuL2lu
Y2x1ZGUvTWFrZWZpbGUKaW5kZXggZmRlMGNhMDEzMTIxLi40MzNiYWQ5MDU1YjIgMTAwNjQ0Ci0t
LSBhL3hlbi9pbmNsdWRlL01ha2VmaWxlCisrKyBiL3hlbi9pbmNsdWRlL01ha2VmaWxlCkBAIC0x
LDUgKzEsMyBAQAotaW5jbHVkZSAkKFhFTl9ST09UKS9Db25maWcubWsKLQogaWZuZXEgKCQoQ09O
RklHX0NPTVBBVCksKQogCiBjb21wYXQtYXJjaC0kKENPTkZJR19YODYpIDo9IHg4Nl8zMgotLSAK
QW50aG9ueSBQRVJBUkQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
