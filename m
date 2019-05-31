Return-Path: <SRS0=e+jd=T7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EF27C04AB6
	for <xen-devel@archiver.kernel.org>; Fri, 31 May 2019 07:20:36 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEE4F23AC3
	for <xen-devel@archiver.kernel.org>; Fri, 31 May 2019 07:20:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DEE4F23AC3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWbpp-0008MO-0I; Fri, 31 May 2019 07:20:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=J+xl=T7=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hWbpn-0008MJ-MF
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 07:20:15 +0000
X-Inumbo-ID: 84ee20b6-8374-11e9-9549-c7d3e705f1a2
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 84ee20b6-8374-11e9-9549-c7d3e705f1a2;
 Fri, 31 May 2019 07:20:08 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=wei.liu2@citrix.com;
 spf=Pass smtp.mailfrom=wei.liu2@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 wei.liu2@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 wei.liu2@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: vZ/vfl2aWL/s2CrBoteUwRYksEByaVfCVcKUAHL+r/L7L0C9LKwCME3Jfwyqimk5UyqNI9Uekg
 QyY+0MYrqMjTsS+HXDmX8Ig34gUCd/4+8YpKfoxWA9ZZLIeLbZEKqavso5sj5z/7yfTo3/U3nq
 f8EDO5tH1IOUpds654nQ3M9asmbrkTU9/32zOEidozr3I67zQ/Pg3ESHZ95IoEUq8PCp/wEqWb
 22RcvvBK22nkB8FFw2j9Y3r9cgDfsq8dI/5VnfrwHVC2+LLZ4uKyXQN3hJcA6M1FCzW3hk2A91
 ZG8=
X-SBRS: 2.7
X-MesageID: 1142044
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,534,1549947600"; 
   d="scan'208";a="1142044"
Date: Fri, 31 May 2019 08:20:05 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Colin King <colin.king@canonical.com>
Message-ID: <20190531072005.GC25537@zion.uk.xensource.com>
References: <20190530190438.9571-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190530190438.9571-1-colin.king@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH] xen-netback: remove redundant assignment to
 err
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
Cc: Wei Liu <wei.liu2@citrix.com>, netdev@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org,
 "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190531072005.Y5RTzUbTcOytO7X8XfW1lDB5UtGkji4zrsH9-2L5Fps@z>

T24gVGh1LCBNYXkgMzAsIDIwMTkgYXQgMDg6MDQ6MzhQTSArMDEwMCwgQ29saW4gS2luZyB3cm90
ZToKPiBGcm9tOiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgo+IAo+
IFRoZSB2YXJpYWJsZSBlcnIgaXMgYXNzaWduZWQgd2l0aCB0aGUgdmFsdWUgLUVOT01FTSB0aGF0
IGlzIG5ldmVyCj4gcmVhZCBhbmQgaXQgaXMgcmUtYXNzaWduZWQgYSBuZXcgdmFsdWUgbGF0ZXIg
b24uICBUaGUgYXNzaWdubWVudCBpcwo+IHJlZHVuZGFudCBhbmQgY2FuIGJlIHJlbW92ZWQuCj4g
Cj4gQWRkcmVzc2VzLUNvdmVyaXR5OiAoIlVudXNlZCB2YWx1ZSIpCj4gU2lnbmVkLW9mZi1ieTog
Q29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KCkFja2VkLWJ5OiBXZWkg
TGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKCj4gLS0tCj4gIGRyaXZlcnMvbmV0L3hlbi1uZXRi
YWNrL2ludGVyZmFjZS5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQveGVuLW5ldGJhY2sv
aW50ZXJmYWNlLmMgYi9kcml2ZXJzL25ldC94ZW4tbmV0YmFjay9pbnRlcmZhY2UuYwo+IGluZGV4
IDc4MzE5ODg0NGRkNy4uMjQwZjc2MmIzNzQ5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbmV0L3hl
bi1uZXRiYWNrL2ludGVyZmFjZS5jCj4gKysrIGIvZHJpdmVycy9uZXQveGVuLW5ldGJhY2svaW50
ZXJmYWNlLmMKPiBAQCAtNjMzLDcgKzYzMyw3IEBAIGludCB4ZW52aWZfY29ubmVjdF9kYXRhKHN0
cnVjdCB4ZW52aWZfcXVldWUgKnF1ZXVlLAo+ICAJCQl1bnNpZ25lZCBpbnQgcnhfZXZ0Y2huKQo+
ICB7Cj4gIAlzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRhc2s7Cj4gLQlpbnQgZXJyID0gLUVOT01FTTsK
PiArCWludCBlcnI7Cj4gIAo+ICAJQlVHX09OKHF1ZXVlLT50eF9pcnEpOwo+ICAJQlVHX09OKHF1
ZXVlLT50YXNrKTsKPiAtLSAKPiAyLjIwLjEKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
