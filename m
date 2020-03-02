Return-Path: <SRS0=Vyxr=4T=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCEF9C3F2D1
	for <xen-devel@archiver.kernel.org>; Mon,  2 Mar 2020 13:52:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A19A22173E
	for <xen-devel@archiver.kernel.org>; Mon,  2 Mar 2020 13:52:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="NrChl1T6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A19A22173E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j8lTw-0001jW-Tt; Mon, 02 Mar 2020 13:51:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=McR1=4T=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1j8lTv-0001jR-Gl
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2020 13:51:39 +0000
X-Inumbo-ID: efc8be9a-5c8c-11ea-b122-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id efc8be9a-5c8c-11ea-b122-bc764e2007e4;
 Mon, 02 Mar 2020 13:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583157098;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=wamN0AIYToyfzsWcMKHb6wny3Pz3RaDg5dG/KPPOgeA=;
 b=NrChl1T6Th87Vsy4xY+IeMJLhD+Li7YiihEZ2Ds4dbYSwGBeApeaLbMG
 GMRTAdPp2b37J0iJoR61CUlRmfMEGIHOssG7t3AJHRXwT8mxIoMtWKort
 3DYrbAFm2Cv2KUDSLqtycGgYjuDsnQ4lWD8ziTlzyJbVMebnQwlApyN9a Y=;
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
IronPort-SDR: Duq2bs/W/LLjOsNR2kSD3b+Sgji2AuTDi2sqEKU4YcuaUlWjiNchvtqOTvWd2cqXZ+CYMZnlVX
 5ULkXoLbxVA69+4Z5yC4DA6a0hQcMTITa0HEd6vCgObBFaJDN8A06pxdYDzmyBs4/VBzTieZhE
 7B4I+SMKVxWbDIBHRf9XABGT8PEtt6utmRR1w3UeeAleRg9HrZIG6Eb7s88uEPEykiclgzJEoU
 93g0C3fhYmLwpwrTnpPWkPbjAvGpaaZXGlKiXrSXe/A+QN9s5inM1IERaK7IKP7iWZ3ipnlgXQ
 duU=
X-SBRS: 2.7
X-MesageID: 13447766
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,507,1574139600"; d="scan'208";a="13447766"
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <c9adeb2c-b580-f3d3-fba7-dd703b1efdfa@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <dc3ba72b-ae33-d5ae-f0b0-ad57985ab92f@citrix.com>
Date: Mon, 2 Mar 2020 13:51:34 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <c9adeb2c-b580-f3d3-fba7-dd703b1efdfa@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Core scheduling and cpu offlining
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Sergey
 Dyasli <sergey.dyasli@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIvMDMvMjAyMCAwODozOSwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBIaSBJZ29yLAo+IAo+
IGNvdWxkIHlvdSBwbGVhc2UgdGVzdCB0aGUgYXR0YWNoZWQgcGF0Y2ggd2hldGhlciBpdCBmaXhl
cyB5b3VyIHByb2JsZW0KPiB3aXRoIGNwdSBvZmZsaW5pbmc/CgpJdCdzIGNlcnRhaW5seSBiZXR0
ZXIgYW5kIGRvZXNuJ3QgY2F1c2Ugd2F0Y2hkb2cgaGl0IGFzIGJlZm9yZSBidXQgSSByYW4KdGhl
IGZvbGxvd2luZyBzY3JpcHQgdG8gdmVyaWZ5OgoKd2hpbGUgdHJ1ZQpkbwogICAgZm9yIGkgaW4g
YHNlcSAxIDYzYDsgZG8geGVuLWhwdG9vbCBjcHUtb2ZmbGluZSAkaTsgZG9uZQogICAgZm9yIGkg
aW4gYHNlcSAxIDYzYDsgZG8geGVuLWhwdG9vbCBjcHUtb25saW5lICRpOyBkb25lCmRvbmUKCi4u
LiBhbmQgZ290IHRoaXMgYSBsaXR0bGUgYml0IGxhdGVyIChub3RlIHRoZSBzYW1lIHNjcmlwdCB3
b3JrcyBmaW5lIGluIHRocmVhZCBtb2RlKToKCihYRU4pIFsgIDI4Mi4xOTkxMzRdIEFzc2VydGlv
biAnIXByZWVtcHRfY291bnQoKScgZmFpbGVkIGF0IHByZWVtcHQuYzozNgooWEVOKSBbICAyODIu
MTk5MTQyXSAtLS0tWyBYZW4tNC4xMy4wICB4ODZfNjQgIGRlYnVnPXkgICBOb3QgdGFpbnRlZCBd
LS0tLQooWEVOKSBbICAyODIuMTk5MTQ3XSBDUFU6ICAgIDAKKFhFTikgWyAgMjgyLjE5OTE1MF0g
UklQOiAgICBlMDA4Ols8ZmZmZjgyZDA4MDIyODgxNz5dIEFTU0VSVF9OT1RfSU5fQVRPTUlDKzB4
MWYvMHg1OAooWEVOKSBbICAyODIuMTk5MTU5XSBSRkxBR1M6IDAwMDAwMDAwMDAwMTAyMDIgICBD
T05URVhUOiBoeXBlcnZpc29yCihYRU4pIFsgIDI4Mi4xOTkxNjVdIHJheDogZmZmZjgyZDA4MDVj
NzAyNCAgIHJieDogMDAwMDAwMDAwMDAwMDAwMCAgIHJjeDogMDAwMDAwMDAwMDAwMDAwMAooWEVO
KSBbICAyODIuMTk5MTcwXSByZHg6IDAwMDAwMDAwMDAwMDAwMDAgICByc2k6IDAwMDAwMDAwMDAw
MDI2Y2QgICByZGk6IGZmZmY4MmQwODA0YjNhYWMKKFhFTikgWyAgMjgyLjE5OTE3NV0gcmJwOiBm
ZmZmODMwMDkyMGJmZTkwICAgcnNwOiBmZmZmODMwMDkyMGJmZTkwICAgcjg6ICBmZmZmODMwNDJm
MjFmZmUwCihYRU4pIFsgIDI4Mi4xOTkxODBdIHI5OiAgMDAwMDAwMDAwMDAwMDAwMSAgIHIxMDog
MzMzMzMzMzMzMzMzMzMzMyAgIHIxMTogMDAwMDAwMDAwMDAwMDAwMQooWEVOKSBbICAyODIuMTk5
MTg1XSByMTI6IGZmZmY4MmQwODA1Y2RiMDAgICByMTM6IDAwMDAwMDAwMDAwMDAwMDAgICByMTQ6
IGZmZmY4MmQwODA1YzcyNTAKKFhFTikgWyAgMjgyLjE5OTE5Ml0gcjE1OiAwMDAwMDAwMDAwMDAw
MDAwICAgY3IwOiAwMDAwMDAwMDgwMDUwMDNiICAgY3I0OiAwMDAwMDAwMDAwMzUwNmUwCihYRU4p
IFsgIDI4Mi4xOTkyNTJdIGNyMzogMDAwMDAwMDA5MjBiMDAwMCAgIGNyMjogMDAwMDdmMGZmZjk2
NzAwMAooWEVOKSBbICAyODIuMTk5MjU2XSBmc2I6IDAwMDA3ZjBmZmY5NTc3NDAgICBnc2I6IGZm
ZmY4ODgyMWUwMDAwMDAgICBnc3M6IDAwMDAwMDAwMDAwMDAwMDAKKFhFTikgWyAgMjgyLjE5OTI2
MV0gZHM6IDAwMDAgICBlczogMDAwMCAgIGZzOiAwMDAwICAgZ3M6IDAwMDAgICBzczogZTAxMCAg
IGNzOiBlMDA4CihYRU4pIFsgIDI4Mi4xOTkyNjhdIFhlbiBjb2RlIGFyb3VuZCA8ZmZmZjgyZDA4
MDIyODgxNz4gKEFTU0VSVF9OT1RfSU5fQVRPTUlDKzB4MWYvMHg1OCk6CihYRU4pIFsgIDI4Mi4x
OTkyNzJdICA1MiBkMSA4MyAzYyAxMCAwMCA3NCAwMiA8MGY+IDBiIDQ4IDg5IGUwIDQ4IDBkIGZm
IDdmIDAwIDAwIDhiIDQwIGMxIDQ4IGMxCihYRU4pIFsgIDI4Mi4xOTkyODddIFhlbiBzdGFjayB0
cmFjZSBmcm9tIHJzcD1mZmZmODMwMDkyMGJmZTkwOgooWEVOKSBbICAyODIuMTk5MjkwXSAgICBm
ZmZmODMwMDkyMGJmZWEwIGZmZmY4MmQwODAyNDI2ODAgZmZmZjgzMDA5MjBiZmVmMCBmZmZmODJk
MDgwMjdhMTcxCihYRU4pIFsgIDI4Mi4xOTkyOTddICAgIGZmZmY4MmQwODAyNDI2MzUgMDAwMDAw
MDAyYjNiZjAwMCBmZmZmODMwNDJiYjFmMDAwIGZmZmY4MzA0MmJiMWYwMDAKKFhFTikgWyAgMjgy
LjE5OTMwNF0gICAgZmZmZjgzMDQyYmIxZjAwMCAwMDAwMDAwMDAwMDAwMDAwIGZmZmY4MmQwODA1
ZWM2MjAgMDAwMDAwMDAwMDAwMDAwMAooWEVOKSBbICAyODIuMTk5MzExXSAgICBmZmZmODMwMDky
MGJmZDYwIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDdmZmM2MzMwMDFiMCAwMDAwMDAwMDAwMzA1MDAw
CihYRU4pIFsgIDI4Mi4xOTkzMTddICAgIGZmZmY4ODgyMTJiZDI4YTggMDAwMDdmZmM2MzMwMDFi
MCBmZmZmZmZmZmZmZmZmZmYyIDAwMDAwMDAwMDAwMDAyODYKKFhFTikgWyAgMjgyLjE5OTMyNF0g
ICAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAgMDAw
MDAwMDAwMDAwMDAwMAooWEVOKSBbICAyODIuMTk5MzI5XSAgICBmZmZmZmZmZjgxMDAxNDZhIDAw
MDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMCBkZWFkYmVlZmRlYWRmMDBkCihYRU4pIFsg
IDI4Mi4xOTkzMzVdICAgIDAwMDAwMTAwMDAwMDAwMDAgZmZmZmZmZmY4MTAwMTQ2YSAwMDAwMDAw
MDAwMDBlMDMzIDAwMDAwMDAwMDAwMDAyODYKKFhFTikgWyAgMjgyLjE5OTM0Ml0gICAgZmZmZmM5
MDA0Mjk3N2Q3MCAwMDAwMDAwMDAwMDBlMDJiIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAw
MDAwMAooWEVOKSBbICAyODIuMTk5MzQ3XSAgICAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAw
MDAwMDAgMDAwMGUwMTAwMDAwMDAwMCBmZmZmODMwNDJiYjFmMDAwCihYRU4pIFsgIDI4Mi4xOTkz
NTNdICAgIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDM1MDZlMCAwMDAwMDAwMDAwMDAwMDAw
IDAwMDAwMDAwMDAwMDAwMDAKKFhFTikgWyAgMjgyLjE5OTM1OV0gICAgMDAwMDA0MDAwMDAwMDAw
MCAwMDAwMDAwMDAwMDAwMDAwCihYRU4pIFsgIDI4Mi4xOTkzNjRdIFhlbiBjYWxsIHRyYWNlOgoo
WEVOKSBbICAyODIuMTk5MzY4XSAgICBbPGZmZmY4MmQwODAyMjg4MTc+XSBSIEFTU0VSVF9OT1Rf
SU5fQVRPTUlDKzB4MWYvMHg1OAooWEVOKSBbICAyODIuMTk5Mzc1XSAgICBbPGZmZmY4MmQwODAy
NDI2ODA+XSBGIGRvX3NvZnRpcnErMHg5LzB4MTUKKFhFTikgWyAgMjgyLjE5OTM4MV0gICAgWzxm
ZmZmODJkMDgwMjdhMTcxPl0gRiBhcmNoL3g4Ni9kb21haW4uYyNpZGxlX2xvb3ArMHhiNC8weGNi
CihYRU4pIFsgIDI4Mi4xOTkzODRdCihYRU4pIFsgIDI4Mi40Mzg5OThdCihYRU4pIFsgIDI4Mi40
NDA5OTFdICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioKKFhFTikgWyAg
MjgyLjQ0NjQ1OV0gUGFuaWMgb24gQ1BVIDA6CihYRU4pIFsgIDI4Mi40NDk3NDVdIEFzc2VydGlv
biAnIXByZWVtcHRfY291bnQoKScgZmFpbGVkIGF0IHByZWVtcHQuYzozNgooWEVOKSBbICAyODIu
NDU2MTU2XSAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqCihYRU4pIFsg
IDI4Mi40NjE2MjFdCgpJZ29yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
