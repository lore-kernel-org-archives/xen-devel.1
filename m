Return-Path: <SRS0=LPZd=2H=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40B35C43603
	for <xen-devel@archiver.kernel.org>; Tue, 17 Dec 2019 11:53:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B256207FF
	for <xen-devel@archiver.kernel.org>; Tue, 17 Dec 2019 11:53:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="gD3KBQZC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B256207FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihBPF-0005OC-4p; Tue, 17 Dec 2019 11:52:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DkcM=2H=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ihBPE-0005O7-KQ
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 11:52:48 +0000
X-Inumbo-ID: be8b138d-20c3-11ea-8eac-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id be8b138d-20c3-11ea-8eac-12813bfff9fa;
 Tue, 17 Dec 2019 11:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576583567;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=utkpE5fKygH7apYtFT0TNVIJLJtsMPaC/Nnxu0lHK+w=;
 b=gD3KBQZCTTaEGtejV9bhDpPRydnrrOKfhT27FDW3AK7CrhDlSAfeZlFi
 MLWQ6iAmtQznr8RiuWCQ0J23+B5KEEH+vHnbSdlAN5VL82mVyAd093C9R
 VmWwfKzCQOr0QwTPmtJCm9x8WMeyvjgsduKTWvX+lETgBHcGYB2HRjXiw 8=;
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
IronPort-SDR: 3/7ZCfId545CsRP0LXlgH2PvILUoJ1qtWcm9wtc//3W2IEXz+t608tAIU2ByhomJm68nWmHJcC
 CKI1WHl4vfd4cLXo7EL2vq+OUh2vHhsxBiHeLJ5GUg9mMDM5sgVMx4MflIXorCGBeNbG43eExV
 tDMJKwVweSJOJdF3PBsD23SzCP4z8ezUStOY9Y2ZygZKVcpX7DpgU1sNdoobrAfYHgWRlUxuAY
 iY9xVgldy6CuSH0UucgguG03Dq148LnZKK5vMD5htpMrMt78i1246BA3SM8qDuclvZO4Vlx0lK
 jK8=
X-SBRS: 2.7
X-MesageID: 10376336
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,325,1571716800"; d="scan'208";a="10376336"
Date: Tue, 17 Dec 2019 12:52:41 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20191217115241.GT11756@Air-de-Roger>
References: <20191213190436.24475-1-andrew.cooper3@citrix.com>
 <20191213190436.24475-3-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191213190436.24475-3-andrew.cooper3@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL03.citrite.net (10.69.22.127)
Subject: Re: [Xen-devel] [PATCH 2/6] x86/suspend: Don't bother saving %cr3,
 %ss or flags
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBEZWMgMTMsIDIwMTkgYXQgMDc6MDQ6MzJQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBUaGUgdHJhbXBvbGluZSBoYXMgYWxyZWFkeSBzZXQgdXAgdGhlIGlkbGUgcGFnZXRh
YmxlcyAod2hpY2ggYXJlIHRoZSBjb3JyZWN0Cj4gb25lcyB0byB1c2UpLCBhbmQgc2FuaXRpc2Vk
IHRoZSBmbGFncyBzdGF0ZS4KCkkgd29uZGVyIHdoeSBkbyB3ZSBoYXZlIHdha2V1cC5TIGFuZCB3
YWtldXBfcHJvdC5TLCBpdCB3b3VsZCBiZSBlYXNpZXIKdG8gZm9sbG93IGlmIGl0IGFsbCB3YXMg
aW4gdGhlIHNhbWUgZmlsZSBJTU8uCgo+IAo+IEZvciAlc3MsIF9fSFlQRVJWSVNPUl9EUzY0IGlz
IHRoZSBjb3JyZWN0IGRlc2NyaXB0b3IgdG8gcmVzdG9yZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IFJv
Z2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKVGhhbmtzLCBSb2dlci4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
