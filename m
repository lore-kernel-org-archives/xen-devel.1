Return-Path: <SRS0=chTg=5F=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36BA2C4332B
	for <xen-devel@archiver.kernel.org>; Fri, 20 Mar 2020 13:40:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01AF420739
	for <xen-devel@archiver.kernel.org>; Fri, 20 Mar 2020 13:40:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="Ew3H+RRV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01AF420739
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jFHsq-0003tv-Qe; Fri, 20 Mar 2020 13:40:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EUly=5F=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jFHsp-0003tp-Kf
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2020 13:40:19 +0000
X-Inumbo-ID: 560bb348-6ab0-11ea-b34e-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 560bb348-6ab0-11ea-b34e-bc764e2007e4;
 Fri, 20 Mar 2020 13:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584711619;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=pKpXKWVG2gcKDxG3Lsw2cFkGY8rTqWGl0AE0INhKYsQ=;
 b=Ew3H+RRVoZR73KPYIptMmuik5Z5l3HGwskt+yRCLjikQfxYafzHREMck
 WZiYiogk11qgzz/q0UVt6Snj5+5yBIPYfciJu+CDrcvP1YYFC/vMPawzh
 MCgWlMbd/V6dsstBm4FvQ6Oq8357C83tnHwidfi8svP+icKDqsloIob0C I=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: UdQeipc1Pe9J3f0XuAlQK5rARnDFNSjKWynGe54Pm9g+YwCKTUYpmtkuuBJg+menI4Go7qelzt
 wd1+mGLQszWtPisEN33PUs8VQc8U+jrW+7saOlaquV1NdZn7JrxtW0nXXVUTexv68rkS171/9I
 WFZ86gKl6gbuNOaWjLW6Xwtllud/1fhn3PJTapH/O+EToDR4gte4XuJJTnlw9NkD2fuvqQvhcG
 6PlN051quHhN373s4F3u73BMnl0gl2DomYAXOTUSymTrR1BQmQYYl91afBkPVBVbJqACCo68Eu
 Zuo=
X-SBRS: 2.7
X-MesageID: 14553287
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,284,1580792400"; d="scan'208";a="14553287"
To: Jan Beulich <jbeulich@suse.com>
References: <20200319152622.31758-1-andrew.cooper3@citrix.com>
 <20200319152622.31758-5-andrew.cooper3@citrix.com>
 <5bc79b55-37c6-005f-2dd9-ac929d3627fb@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <65f58103-cb8e-3276-f8df-908cdbe152cd@citrix.com>
Date: Fri, 20 Mar 2020 13:40:14 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <5bc79b55-37c6-005f-2dd9-ac929d3627fb@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 4/6] x86/ucode: Rationalise startup and
 family/model checks
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
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAvMDMvMjAyMCAxMzozNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTkuMDMuMjAyMCAx
NjoyNiwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gRHJvcCBtaWNyb2NvZGVfaW5pdF97aW50ZWws
YW1kfSgpLCBleHBvcnQge2ludGVsLGFtZH1fdWNvZGVfb3BzLCBhbmQgdXNlIGEKPj4gc3dpdGNo
IHN0YXRlbWVudCBpbiBlYXJseV9taWNyb2NvZGVfaW5pdCgpIHJhdGhlciB0aGFuIHByb2Jpbmcg
ZWFjaCB2ZW5kb3IgaW4KPj4gdHVybi4gIFRoaXMgYWxsb3dzIHRoZSBtaWNyb2NvZGVfb3BzIHBv
aW50ZXIgdG8gYmVjb21lIGxvY2FsIHRvIGNvcmUuYy4KPj4KPj4gQXMgdGhlcmUgYXJlIG5vIGV4
dGVybmFsIHVzZXJzIG9mIG1pY3JvY29kZV9vcHMsIHRoZXJlIGlzIG5vIG5lZWQgZm9yCj4+IGNv
bGxlY3RfY3B1X2luZm8oKSB0byBpbXBsZW1lbnQgc2FuaXR5IGNoZWNrcy4gIE1vdmUgYXBwbGlj
YWJsZSBjaGVja3MgdG8KPj4gZWFybHlfbWljcm9jb2RlX2luaXQoKSBzbyB0aGV5IGFyZSBwZXJm
b3JtZWQgb25jZSwgcmF0aGVyIHRoYW4gcmVwZWF0ZWRseS4KPj4KPj4gSXRlbXMgdG8gbm90ZToK
Pj4gICogVGhlIEFNRCB1Y29kZSBkcml2ZXIgZG9lcyBoYXZlIGFuIHVwcGVyIGZhbWlsaXkgbGlt
aXQgb2YgMHgxNywgYXMgYSBzaWRlCj4+ICAgIGVmZmVjdCBvZiB0aGUgbG9naWMgaW4gdmVyaWZ5
X3BhdGNoX3NpemUoKSB3aGljaCBkb2VzIG5lZWQgdXBkYXRpbmcgZm9yCj4+ICAgIGVhY2ggbmV3
IG1vZGVsLgo+IEkgZG9uJ3Qgc2VlIHRoaXMgYmVpbmcgdGhlIGNhc2UsIGFuZCBoZW5jZSBJIHRo
aW5rIGl0IGlzIHRoaXMgcGF0Y2gKPiB3aGljaCBpbnRyb2R1Y2VzIHN1Y2ggYSByZXN0cmljdGlv
bi4gQXMgbG9uZyBhIHBhdGNoZXMgYXJlIGxlc3MKPiB0aGFuIDJrLCBhbGwgdW5zcGVjaWZpZWQg
ZmFtaWxpZXMgYXJlIHN1cHBvcnRlZCBieSB2ZXJpZnlfcGF0Y2hfc2l6ZSgpCj4gdGhyb3VnaCBp
dHMgZGVmYXVsdDogY2FzZSBsYWJlbC4gKEFyZ3VhYmx5IHRoZSBuYW1lIEYxWEhfTVBCX01BWF9T
SVpFCj4gZG9lc24ndCByZWFsbHkgZml0IGhvdyBpdCBpcyBiZWluZyB1c2VkLikKPgo+IEknbSBo
YXBweSBhYm91dCBhbGwgb3RoZXIgY2hhbmdlcyBtYWRlIGhlcmUuCgpMaW51eCBhY3R1YWxseSBo
YXMgYSBkaWZmZXJlbnQgYWxnb3JpdGhtIHdoaWNoIGRyb3BzIGxlbmd0aCByZXN0cmljdGlvbnMK
b24gRmFtMTVoIGFuZCBsYXRlciwgc28gdGhleSBnZXQgZm9yd2FyZCBjb21wYXRpYmlsaXR5IHRo
YXQgd2F5LgoKV291bGQgeW91IGJlIGhhcHB5IGlmIEkgZHJvcHBlZCBqdXN0IHRoaXMgYXNwZWN0
IG9mIHRoZSBwYXRjaCwgYW5kIGRlZmVyCkFNRCBhZGp1c3RtZW50cyB0byBhIGxhdGVyIHNldCBv
ZiBjaGFuZ2VzPwoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
