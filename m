Return-Path: <SRS0=pEfl=3T=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31C69C2D0DB
	for <xen-devel@archiver.kernel.org>; Thu, 30 Jan 2020 23:14:47 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F21B72083E
	for <xen-devel@archiver.kernel.org>; Thu, 30 Jan 2020 23:14:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="QRI/wlxZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F21B72083E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixJ0t-0008SZ-3Z; Thu, 30 Jan 2020 23:14:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JRg3=3T=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1ixJ0q-0008SU-VB
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 23:14:17 +0000
X-Inumbo-ID: 3c09a9f8-43b6-11ea-b211-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3c09a9f8-43b6-11ea-b211-bc764e2007e4;
 Thu, 30 Jan 2020 23:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580426056;
 h=to:cc:from:subject:message-id:date:mime-version:
 content-transfer-encoding;
 bh=5Y3OpPAx+2qwTr7Muo6DCu55qRRmaDXxZ5z35g0WSaw=;
 b=QRI/wlxZn+WZRbQ+AUCeD8Is0T6OpYKQC5iAY6YVxSNq0acaU4QnsXAb
 hNDmAY1wx0vAEqagpPU07FoiZ/h0d75HwyQCMXpGguM0229OhIDtCC09o
 Cix9NU0BuvZYN4KjFGjmb5mOU9JE/MkznOCNcPBojPBMJBp4Dpad8c151 Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: PGm2Ne06FXUWfhT+GezyA+yhsX97uXi/ANmJCbfESa3FytjgqgRCcNIHF/otByf/vOSR1ZkbcR
 qngs0gVFP5OQAlPReO7yNwg2yLablA2NxyW27QlOt6ClzZZPYVK/qJ1+uPx5U28Kw++NuSaXVj
 iNGBzS9tarcT+ILrbvNW2I3IYuu17NHLuVcPRkKrFILMUyHx8SLbMT1bSQ5T4fHMbMmvWU1Qk0
 OzPJrLaI8BRjQ7pcmHYpsIxtABOUkOE8glK2JOG/+izL4yqPF2Tj1bXhtrYq0kqI6lqD9E6lYj
 Q18=
X-SBRS: 2.7
X-MesageID: 12082895
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,383,1574139600"; d="scan'208";a="12082895"
To: xen-devel <xen-devel@lists.xenproject.org>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <9a84d6bd-2aa0-e97f-a517-3c51aabdfe27@citrix.com>
Date: Thu, 30 Jan 2020 23:14:12 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] Xen clocksource and PV shim
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SSB3YXMgZGVidWdnaW5nIGNvbnN0YW50IGZyZWV6ZXMgb2YgUFYgc2hpbSBvbiBBTUQgaGFyZHdh
cmUKYWZ0ZXIgZ29pbmcgb3V0IG9mIGEgbG9uZyBzdXNwZW5kLiBBcyBpdCB0dXJuZWQgb3V0IHRo
ZSByb290IGNhdXNlCm9mIHRoaXMgaXMgcGxhdGZvcm0gdGltZSBqdW1waW5nIGZvcndhcmQgdG8g
dGhlIGFtb3VudCBvZiB0aW1lCnNwZW50IGluIHN1c3BlbmRlZCBzdGF0ZS4gT24gSW50ZWwgdGhp
cyBpc3N1ZSBpcyBwYXBlcmVkIG92ZXIKYnkgQ09OU1RBTlRfVFNDIGJlaW5nIHNldCB3aGljaCBh
dm9pZHMgQ1BVIHRpbWUgc3luYyB3aXRoCnBsYXRmb3JtIHRpbWUuCgpVcG9uIGZ1cnRoZXIgZXhh
bWluYXRpb24gaXQgYXBwZWFycyB0aGF0IGp1bXBpbmcgaXMgYmFrZWQKaW50byB0aGUgaW1wbGVt
ZW50YXRpb24gb2YgTDAgWGVuIGFuZCB0aGVyZSBpcyBubyBzZWVtaW5nbHkKc3RyYWlnaHQgZm9y
d2FyZCB3YXkgdG8gZXh0cmFjdCBzdGFibGUgY29udGludW91cyByYXRlIG91dApvZiB3aGF0IHdl
IGhhdmUuCgpJIGV4cGVjdCB0aGlzIGlzIGEga25vd24gaXNzdWUgd2l0aCBYZW4gUFYgY2xvY2sg
YXMgSSBmb3VuZAp0aGlzIGFsbW9zdCBpbW1lZGlhdGVseTogaHR0cHM6Ly93aWtpLmRlYmlhbi5v
cmcvWGVuL0Nsb2Nrc291cmNlCkN1cnJlbnRseSBJIGRvbid0IHVuZGVyc3RhbmQgaG93IGluIHRo
YXQgY2FzZSBYZW4gY2xvY2sgc291cmNlCmNvdWxkIGJlIHN1aXRhYmxlIGFzIGEgcGxhdGZvcm0g
dGltZXIgZm9yIG5lc3RlZCBYZW4uCgpJcyBteSB1bmRlcnN0YW5kaW5nIG9mIHRoZSBzaXR1YXRp
b24gY29ycmVjdD8gQ291bGQgaXQgYmUKZml4ZWQgaW4gTDAgWGVuIG9yIGl0J3MgYWxyZWFkeSBi
YWNrZWQgaW50byB0aGUgQUJJPyBTaG91bGQKd2Uga2VlcCBYZW4gcGxhdGZvcm0gdGltZXIgaW4g
dGhlIHNvdXJjZSBjb2RlIHRoZW4/IERvZXMgdXNpbmcKYWx0ZXJuYXRpdmUgY2xvY2sgc291cmNl
IGZvciBQViBzaGltIG1ha2Ugc2Vuc2U/CgpJZ29yCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
