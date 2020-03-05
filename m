Return-Path: <SRS0=M1Mj=4W=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 366CAC3F2D2
	for <xen-devel@archiver.kernel.org>; Thu,  5 Mar 2020 16:01:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03A8F2072D
	for <xen-devel@archiver.kernel.org>; Thu,  5 Mar 2020 16:01:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="XvalUX+x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03A8F2072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9sva-0002xy-D6; Thu, 05 Mar 2020 16:00:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KIN4=4W=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j9svY-0002xm-OB
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2020 16:00:48 +0000
X-Inumbo-ID: 79b3d80a-5efa-11ea-a610-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 79b3d80a-5efa-11ea-a610-12813bfff9fa;
 Thu, 05 Mar 2020 16:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583424046;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=b2Y9mFhO8l7VK7IdyoWZxSRmG8IfggBFBJelPwuWheg=;
 b=XvalUX+xYsYYkvdMhKVxbOBc32svgUZ+XhcuvALE+9IAm/tzaXeTAARv
 VFiZBxOSMtWr90wyWJd7hiO/zoZXf7fDpEcGviMy51t/aONO/+SzdoewX
 Ztb6Hxib7ZqvDzNEOELYrtVyTcFiEohfKfdnLpOolPvjLrn9tGBY21BRU I=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: JcNBobqwJcClBIsbLJ5lh21B4s/2cD3UqEBry30pX1tUgpb5Ayhi0WaZhQ9v9dd+wEwgiLwH3U
 4xnKOUpwKWyG0+Wa9U/biM+hyaZTDEXaER5ztKNm8zcAdpobV8pBXhYThOS5+g4WwJG6v3QKvk
 lpf/8K2isqWcGEr1Kd6NfyXRPwZK3fgvczjk4ntXeTGs1WztFjnnfHTUTnOVbHWM2LOcK2sEh0
 G7DJ7gdwIXUXX60QcNf8pc9hKQAHFyQSx2Sq6OSJHJaHhoIuzoA7bmwjX20iFWbTc2MoxksnQH
 lDs=
X-SBRS: 2.7
X-MesageID: 14099028
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,518,1574139600"; d="scan'208";a="14099028"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 5 Mar 2020 17:00:15 +0100
Message-ID: <20200305160015.60232-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH OSSTEST] make-flight: add dom0 PVH test
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
Cc: ian.jackson@eu.citrix.com, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWRkIGEgZG9tMCBQVkggdGVzdCwgdGhlIHRlc3QgdG8gYmUgcnVuIGlzIGxhdW5jaGluZyBhIFBW
IGd1ZXN0Cih0ZXN0LWRlYmlhbikuIE5vdGUgdGhlIFBWSCBkb20wIHRlc3RzIGFyZSBvbmx5IGVu
YWJsZWQgZm9yIFhlbiA+PQo0LjEzLgoKVGhlIHJ1bnZhciBkaWZmZXJlbmNlIGlzOgoKK3Rlc3Qt
YW1kNjQtYW1kNjQtZG9tMHB2aC14bC1hbWQgICBhbGxfaG9zdF9kaV92ZXJzaW9uIDIwMjAtMDIt
MTAKK3Rlc3QtYW1kNjQtYW1kNjQtZG9tMHB2aC14bC1pbnRlbCBhbGxfaG9zdF9kaV92ZXJzaW9u
IDIwMjAtMDItMTAKK3Rlc3QtYW1kNjQtYW1kNjQtZG9tMHB2aC14bC1hbWQgICBhbGxfaG9zdF9z
dWl0ZSAgICAgIHN0cmV0Y2gKK3Rlc3QtYW1kNjQtYW1kNjQtZG9tMHB2aC14bC1pbnRlbCBhbGxf
aG9zdF9zdWl0ZSAgICAgIHN0cmV0Y2gKK3Rlc3QtYW1kNjQtYW1kNjQtZG9tMHB2aC14bC1hbWQg
ICBhbGxfaG9zdGZsYWdzICAgICAgIGFyY2gtYW1kNjQsYXJjaC14ZW4tYW1kNjQsc3VpdGUtc3Ry
ZXRjaCxwdXJwb3NlLXRlc3QsaHZtLWFtZAordGVzdC1hbWQ2NC1hbWQ2NC1kb20wcHZoLXhsLWlu
dGVsIGFsbF9ob3N0ZmxhZ3MgICAgICAgYXJjaC1hbWQ2NCxhcmNoLXhlbi1hbWQ2NCxzdWl0ZS1z
dHJldGNoLHB1cnBvc2UtdGVzdCxodm0taW50ZWwKK3Rlc3QtYW1kNjQtYW1kNjQtZG9tMHB2aC14
bC1hbWQgICBhcmNoICAgICAgICAgICAgICAgIGFtZDY0Cit0ZXN0LWFtZDY0LWFtZDY0LWRvbTBw
dmgteGwtaW50ZWwgYXJjaCAgICAgICAgICAgICAgICBhbWQ2NAordGVzdC1hbWQ2NC1hbWQ2NC1k
b20wcHZoLXhsLWFtZCAgIGJ1aWxkam9iICAgICAgICAgICAgYnVpbGQtYW1kNjQKK3Rlc3QtYW1k
NjQtYW1kNjQtZG9tMHB2aC14bC1pbnRlbCBidWlsZGpvYiAgICAgICAgICAgIGJ1aWxkLWFtZDY0
Cit0ZXN0LWFtZDY0LWFtZDY0LWRvbTBwdmgteGwtYW1kICAgZGViaWFuX2FyY2ggICAgICAgICBh
bWQ2NAordGVzdC1hbWQ2NC1hbWQ2NC1kb20wcHZoLXhsLWludGVsIGRlYmlhbl9hcmNoICAgICAg
ICAgYW1kNjQKK3Rlc3QtYW1kNjQtYW1kNjQtZG9tMHB2aC14bC1hbWQgICBkZWJpYW5fa2Vybmtp
bmQgICAgIHB2b3BzCit0ZXN0LWFtZDY0LWFtZDY0LWRvbTBwdmgteGwtaW50ZWwgZGViaWFuX2tl
cm5raW5kICAgICBwdm9wcwordGVzdC1hbWQ2NC1hbWQ2NC1kb20wcHZoLXhsLWFtZCAgIGRlYmlh
bl9zdWl0ZSAgICAgICAgc3RyZXRjaAordGVzdC1hbWQ2NC1hbWQ2NC1kb20wcHZoLXhsLWludGVs
IGRlYmlhbl9zdWl0ZSAgICAgICAgc3RyZXRjaAordGVzdC1hbWQ2NC1hbWQ2NC1kb20wcHZoLXhs
LWFtZCAgIGtlcm5idWlsZGpvYiAgICAgICAgYnVpbGQtYW1kNjQtcHZvcHMKK3Rlc3QtYW1kNjQt
YW1kNjQtZG9tMHB2aC14bC1pbnRlbCBrZXJuYnVpbGRqb2IgICAgICAgIGJ1aWxkLWFtZDY0LXB2
b3BzCit0ZXN0LWFtZDY0LWFtZDY0LWRvbTBwdmgteGwtYW1kICAga2VybmtpbmQgICAgICAgICAg
ICBwdm9wcwordGVzdC1hbWQ2NC1hbWQ2NC1kb20wcHZoLXhsLWludGVsIGtlcm5raW5kICAgICAg
ICAgICAgcHZvcHMKK3Rlc3QtYW1kNjQtYW1kNjQtZG9tMHB2aC14bC1hbWQgICB0b29sc3RhY2sg
ICAgICAgICAgIHhsCit0ZXN0LWFtZDY0LWFtZDY0LWRvbTBwdmgteGwtaW50ZWwgdG9vbHN0YWNr
ICAgICAgICAgICB4bAordGVzdC1hbWQ2NC1hbWQ2NC1kb20wcHZoLXhsLWFtZCAgIHhlbl9ib290
X2FwcGVuZCAgICAgZG9tMD1wdmgsdmVyYm9zZQordGVzdC1hbWQ2NC1hbWQ2NC1kb20wcHZoLXhs
LWludGVsIHhlbl9ib290X2FwcGVuZCAgICAgZG9tMD1wdmgsdmVyYm9zZQoKU2lnbmVkLW9mZi1i
eTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQogbWFrZS1mbGln
aHQgfCAyNCArKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvbWFrZS1mbGlnaHQgYi9tYWtlLWZsaWdodAppbmRleCBi
MDg0MzFkYy4uMjNhODUzY2MgMTAwNzU1Ci0tLSBhL21ha2UtZmxpZ2h0CisrKyBiL21ha2UtZmxp
Z2h0CkBAIC03NTMsNiArNzUzLDE2IEBAIHRlc3RfbWF0cml4X2RvX29uZSAoKSB7CiAgICopICAg
ICAgICAgICAgICAgIHRlc3Rfc2hpbT15IDs7CiAgIGVzYWMKIAorICAjIFBWSCBkb20wIHRlc3Rz
IGZvciB2ZXJzaW9ucyA+PSA0LjEzIG9ubHkKKyAgY2FzZSAiJHhlbmJyYW5jaCIgaW4KKyAgeGVu
LTMuKi10ZXN0aW5nKSAgdGVzdF9kb20wcHZoPW4gOzsKKyAgeGVuLTQuPy10ZXN0aW5nKSAgdGVz
dF9kb20wcHZoPW4gOzsKKyAgeGVuLTQuMTAtdGVzdGluZykgdGVzdF9kb20wcHZoPW4gOzsKKyAg
eGVuLTQuMTEtdGVzdGluZykgdGVzdF9kb20wcHZoPW4gOzsKKyAgeGVuLTQuMTItdGVzdGluZykg
dGVzdF9kb20wcHZoPW4gOzsKKyAgKikgICAgICAgICAgICAgICAgdGVzdF9kb20wcHZoPXkgOzsK
KyAgZXNhYworCiAgICMgeGVuZCBQViBndWVzdCB0ZXN0IG9uIHg4NiBvbmx5CiAgIGlmIFsgeCR0
ZXN0X3hlbmQgPSB4eSAtYSBcKCAkZG9tMGFyY2ggPSAiaTM4NiIgLW8gJGRvbTBhcmNoID0gImFt
ZDY0IiBcKSBdOyB0aGVuCiAgICAgam9iX2NyZWF0ZV90ZXN0IHRlc3QtJHhlbmFyY2gka2Vybi0k
ZG9tMGFyY2gtcHYgdGVzdC1kZWJpYW4geGVuZCBcCkBAIC04NjEsNiArODcxLDIwIEBAIHRlc3Rf
bWF0cml4X2RvX29uZSAoKSB7CiAKICAgZmkKIAorICBpZiBbIHgkdGVzdF9kb20wcHZoID0geHkg
LWEgJHhlbmFyY2ggPSBhbWQ2NCAtYSAkZG9tMGFyY2ggPSBhbWQ2NCBdOyB0aGVuCisKKyAgICBm
b3IgY3B1dmVuZG9yIGluIGFtZCBpbnRlbDsgZG8KKworICAgICAgam9iX2NyZWF0ZV90ZXN0IHRl
c3QtJHhlbmFyY2gka2Vybi0kZG9tMGFyY2gtZG9tMHB2aC14bC0kY3B1dmVuZG9yIFwKKyAgICAg
ICAgICAgICAgICB0ZXN0LWRlYmlhbiB4bCAkeGVuYXJjaCAkZG9tMGFyY2ggJGRlYmlhbl9ydW52
YXJzIFwKKyAgICAgICAgICAgICAgICBhbGxfaG9zdGZsYWdzPSRtb3N0X2hvc3RmbGFncyxodm0t
JGNwdXZlbmRvciBcCisgICAgICAgICAgICAgICAgeGVuX2Jvb3RfYXBwZW5kPSdkb20wPXB2aCx2
ZXJib3NlJworCisgICAgZG9uZQorCisgIGZpCisKKwogICBpZiBbIHgkdGVzdF9zaGltID0geHkg
LWEgJHhlbmFyY2ggPSBhbWQ2NCBdOyB0aGVuCiAKICAgICBqb2JfY3JlYXRlX3Rlc3QgdGVzdC0k
eGVuYXJjaCRrZXJuLSRkb20wYXJjaC14bC1wdnNoaW0gXAotLSAKMi4yNS4wCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
