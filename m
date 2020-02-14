Return-Path: <SRS0=bhav=4C=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7348AC2BA83
	for <xen-devel@archiver.kernel.org>; Fri, 14 Feb 2020 14:07:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F2B52082F
	for <xen-devel@archiver.kernel.org>; Fri, 14 Feb 2020 14:07:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="GEkde9xm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F2B52082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2bcX-000861-DW; Fri, 14 Feb 2020 14:07:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mp4I=4C=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1j2bcW-00085w-B6
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2020 14:07:04 +0000
X-Inumbo-ID: 45ffc608-4f33-11ea-ade5-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 45ffc608-4f33-11ea-ade5-bc764e2007e4;
 Fri, 14 Feb 2020 14:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581689223;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=mZYB7P1kTWD823NOwnUknr2Ob7VQeG3snSf4qEgkd/A=;
 b=GEkde9xm+ziM9/kCNBkL/3t1X7/rGkWKxKFIocYczYi1cl03mANThw8s
 +w3bewgwQm1LZ2UkKtHrEqIjywf43m30lpTMCvBFtlic0OHHR0PddRv41
 aCBer1O1+u1TaRsm7xf4f798RcLl7Ud9Ra65+SaXDpQI1qf3wzfqohCp5 k=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
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
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: gDM1c60KKWEMPytnll3P/39h3QZ0otXSOXL/x0ebPMk2n93hxG+EpLT84Q3hWnbuNW/u+Enjzr
 E7yY4qXzVrBhppoXTSpSABvzh0Xoe/dH16vEcCCP05WA2kpr19mBAiyp58sTwFcZmseZcLlDAl
 b7PuqK+49a9rnU9fm3U5pgYUP1rB/PygpriKq3bZvbWqf69HwVYHVK2hLcpj3npPNiJyszbLSG
 l6kbSn01Xm+e5GR+UAAucISMiEQaMQPWH1DPo/uhFLYb83/rx8cKev0iOucfddWjGfo0Cx70B3
 f04=
X-SBRS: 2.7
X-MesageID: 12640441
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,440,1574139600"; d="scan'208";a="12640441"
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
References: <20200211093527.6811-1-jgross@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <40df666d-246a-656a-94e5-00a85b9280fc@citrix.com>
Date: Fri, 14 Feb 2020 14:06:58 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200211093527.6811-1-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen: make sure stop_machine_run() is always
 called in a tasklet
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
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvMDIvMjAyMCAwOTozNSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBXaXRoIGNvcmUgc2No
ZWR1bGluZyBhY3RpdmUgaXQgaXMgbWFuZGF0b3J5IGZvciBzdG9wX21hY2hpbmVfcnVuKCkgdG8K
PiBiZSBjYWxsZWQgaW4gYSB0YXNrbGV0IG9ubHksIGFzIG90aGVyd2lzZSBhIHNjaGVkdWxpbmcg
ZGVhZGxvY2sgd291bGQKPiBvY2N1cjogc3RvcF9tYWNoaW5lX3J1bigpIGRvZXMgYSBjcHUgcmVu
ZGV6dm91cyBieSBhY3RpdmF0aW5nIGEgdGFza2xldAo+IG9uIGFsbCBvdGhlciBjcHVzLiBJbiBj
YXNlIHN0b3BfbWFjaGluZV9ydW4oKSB3YXMgbm90IGNhbGxlZCBpbiBhbiBpZGxlCj4gdmNwdSBp
dCB3b3VsZCBibG9jayBzY2hlZHVsaW5nIHRoZSBpZGxlIHZjcHUgb24gaXRzIHNpYmxpbmdzIHdp
dGggY29yZQo+IHNjaGVkdWxpbmcgYmVpbmcgYWN0aXZlLCByZXN1bHRpbmcgaW4gYSBoYW5nLgoK
SSBzdXBwb3NlIHJjdV9iYXJyaWVyKCkgaXMgZmluZSBkdWUgdG8gcHJvY2Vzc19wZW5kaW5nX3Nv
ZnRpcnFzKCkgYmVpbmcKY2FsbGVkIGluc2lkZT8gSSdtIGEgbGl0dGxlIGNvbmNlcm5lZCBieSBp
bXBvc2luZyBpc192Y3B1X2lkbGUoKSByZXN0cmljdGlvbgppbiB0aGF0IGNhc2UgYXMgcmN1X2Jh
cnJpZXIoKSBjb3VsZCBiZSB0ZWNobmljYWxseSBjYWxsZWQgZnJvbSBhIG5vbi10YXNrbGV0CmNv
bnRleHQuCgpJZ29yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
