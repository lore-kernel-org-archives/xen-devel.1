Return-Path: <SRS0=fmWs=TY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38E93C072B5
	for <xen-devel@archiver.kernel.org>; Fri, 24 May 2019 14:01:09 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 154D520863
	for <xen-devel@archiver.kernel.org>; Fri, 24 May 2019 14:01:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 154D520863
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hUAkX-0002Ds-P3; Fri, 24 May 2019 14:00:45 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0saV=TY=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hUAkW-0002Dn-9h
 for xen-devel@lists.xenproject.org; Fri, 24 May 2019 14:00:44 +0000
X-Inumbo-ID: 51515a99-7e2c-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 51515a99-7e2c-11e9-8980-bc764e045a96;
 Fri, 24 May 2019 14:00:42 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=wei.liu2@citrix.com;
 spf=Pass smtp.mailfrom=wei.liu2@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 wei.liu2@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 wei.liu2@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: ojkMnJ9HILjtrd4CPYUJYX6okXtTKWBr4068fradyJ6B2oCmqrq1HAzcOAo4hPvRN/uzbnLgJY
 Q6rQG39V/sYorY8llq30OktGjbAOxkjRXg6Gmd5P4YcYHem4QyOa31a/2+WxgboUREeNggrV5z
 iGrQGSOmO8vHVlLGL3ewWvTefPgW9rh2G06vgB6YOwVLbVV7IJnKLu7CAeTMrDcGAxKA5GDq0U
 HoMLBwO4P3GNodRL0RRlLeU3A8BWeYR0RSLMK56X8zqEQJ9owzCfYbUNgvamt2pQmoLvJQBsyv
 kuk=
X-SBRS: 2.7
X-MesageID: 889782
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,507,1549947600"; 
   d="scan'208";a="889782"
Date: Fri, 24 May 2019 15:00:39 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190524140039.GB25144@zion.uk.xensource.com>
References: <5CE68CD30200007800231B01@prv1-mh.provo.novell.com>
 <5CE68FDB0200007800231B41@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CE68FDB0200007800231B41@prv1-mh.provo.novell.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH 5/5] tools/libxc: allow controlling the max
 C-state sub-state
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190524140039.VKd_G_BXAqtxftL1AGeSyevqtbgNxmeq1fXh5H4WpEM@z>

T24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgMDY6MTk6MzlBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gRnJvbTogUm9zcyBMYWdlcndhbGwgPHJvc3MubGFnZXJ3YWxsQGNpdHJpeC5jb20+Cj4g
Cj4gU2lnbmVkLW9mZi1ieTogUm9zcyBMYWdlcndhbGwgPHJvc3MubGFnZXJ3YWxsQGNpdHJpeC5j
b20+Cj4gCj4gTWFrZSBoYW5kbGluZyBpbiBkb19wbV9vcCgpIG1vcmUgaG9tb2dlbmVvdXM6IEJl
Zm9yZSBpbnRlcnByZXRpbmcKPiBvcC0+Y3B1aWQgYXMgc3VjaCwgaGFuZGxlIGFsbCBvcGVyYXRp
b25zIG5vdCBhY3Rpbmcgb24gYSBwYXJ0aWN1bGFyCj4gQ1BVLiBBbHNvIGV4cG9zZSB0aGUgc2V0
dGluZyB2aWEgeGVucG0uCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgoKQWNrZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
