Return-Path: <SRS0=1d2Y=XW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B1D5C4360C
	for <xen-devel@archiver.kernel.org>; Fri, 27 Sep 2019 10:40:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED0FF20673
	for <xen-devel@archiver.kernel.org>; Fri, 27 Sep 2019 10:40:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="FBfqZkfg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED0FF20673
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDnfa-0001fo-Nt; Fri, 27 Sep 2019 10:40:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fvvD=XW=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iDnfZ-0001X2-Ba
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 10:40:13 +0000
X-Inumbo-ID: 2eed9c80-e113-11e9-9675-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by localhost (Halon) with ESMTPS
 id 2eed9c80-e113-11e9-9675-12813bfff9fa;
 Fri, 27 Sep 2019 10:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569580812;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=s+tSQwjR36AeadxFH1SMfYTF7k9gyCQ44bkfsksoQGQ=;
 b=FBfqZkfghSmH1ikOB6Q3qPSbGP0szzrCaPHJiafYI3sVYYBL2hB31fkc
 1ysjnyj3FhNcvFPcDflanVcnQYjWVeFgm2FXkTWaJCpcBVF10LmQP65T5
 WcNObQezsVCpCgvCThWBi5UTbCvtZvgdplBfAg1z+TKF2T6ZusV4nGyVF s=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: rq5k9vNSX7dA3SqW9DueMTInPsTPYO7ZWgwk7M7WCIO1TJivCNge9LxBGSc17IIHRmasKmmUGg
 iEumB26d7nKmOJsbh5QV8qpYBlPz6pERFHG5HOgzxGs/pRfzf3x8Hh4D+gmxiUh6BTrZrIVGsh
 ztNo3C0FfldQahABlG8D/I9MdHxgf816Q/6TUpU2ulWCqv46wLH3LJrskPrWWFfBVSQuYZlccZ
 OFxPPTnzMPyc3Azssg6SIZoqwUrbSqAr0BcqPWPvhU2+5x6BjDWSEVZmnQPxT3I5CibZNg/DQX
 LVs=
X-SBRS: 2.7
X-MesageID: 6396012
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,555,1559534400"; 
   d="scan'208";a="6396012"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23949.59145.294340.493306@mariner.uk.xensource.com>
Date: Fri, 27 Sep 2019 11:40:09 +0100
To: Juergen Gross <jgross@suse.com>
In-Reply-To: <20190927090048.28872-4-jgross@suse.com>
References: <20190927090048.28872-1-jgross@suse.com>
 <20190927090048.28872-4-jgross@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v1 3/6] libs: add libxenhypfs
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SnVlcmdlbiBHcm9zcyB3cml0ZXMgKCJbUEFUQ0ggdjEgMy82XSBsaWJzOiBhZGQgbGlieGVuaHlw
ZnMiKToKPiBBZGQgdGhlIG5ldyBsaWJyYXJ5IGxpYnhlbmh5cGZzIGZvciBhY2Nlc3MgdG8gdGhl
IGh5cGVydmlzb3IgZmlsZXN5c3RlbS4KClRoaXMgY29kZSBsb29rcyBhcyBleHBlY3RlZCB0byBt
ZS4KCkFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KCkl0
IGRvZXMgbWFrZSBtZSB0aGluZyB5b3UgaGF2ZSBoYWQgdG8gd3JpdGUgcmF0aGVyIGEgbG90IG9m
IHJhdGhlcgpib3JpbmcgKGFuZCBpbiBzb21lIGNhc2VzLCBmaWRkbHkpIGNvZGUuICBJJ20gbm90
IHN1cmUgdGhhdCBJIGhhdmUgYQpnb29kIGFuc3dlciB0byB0aGlzLiAgSW4gYW55IGNhc2UgaXQn
cyBub3QgeW91ciBmYXVsdCA6LSkuCgpSZWdhcmRzLApJYW4uCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
