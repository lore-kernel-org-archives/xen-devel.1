Return-Path: <SRS0=bbgy=YJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF2D9FA372A
	for <xen-devel@archiver.kernel.org>; Wed, 16 Oct 2019 10:19:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE1FD20650
	for <xen-devel@archiver.kernel.org>; Wed, 16 Oct 2019 10:19:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="ckjJv9Jv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE1FD20650
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKgOE-0007Ns-Rf; Wed, 16 Oct 2019 10:18:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GeLD=YJ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iKgOD-0007Nn-Eh
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2019 10:18:45 +0000
X-Inumbo-ID: 55191246-effe-11e9-93ad-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 55191246-effe-11e9-93ad-12813bfff9fa;
 Wed, 16 Oct 2019 10:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571221124;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ilnrqC7W5NTD3Y7EKLqkRNQP7dG+i1m7kmQflCOIdKs=;
 b=ckjJv9Jv85WhWVJEdoih1ZQL/nSkpKrg1mjl/7LYMi0BgWgXXV+zg0By
 eVo4suUNkiH3VUervbabft+TPVZ/nPZ+N42FYChVqHDNZICZw5p/b0xNR
 YbEH4/tDbbBmzuyWB8fZZVmJ6Wfh+dNM0m685LWoFRGMu6ejfYgceLrKn s=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: UuyLVcJe+DkjlRcOzFLSOR4qFWCt6Q/nPyHB+vX0moT+T7+SZnMMrGgSecW09bU3iMKrmuQp/p
 MJudE64ytFElmSBmGN/BneUombZCuHLovAdN/0/9zxh7WdTYFAnApjSV3zJLjRW0F83DOBhjFb
 Ic8V3N1OjPEnGMoNrW+di01CLod3OxEzIVRbnKX/NtYL8mtflb8g6UQ9HmpLTq+brKEfPW1MVn
 h6s0m5vOw3XZFG3XSrqd43ef+GCjk+m49AHpruhuXQKv4tzIerGX/MBS64GhHoTsxM4DBZHcCD
 gmM=
X-SBRS: 2.7
X-MesageID: 7272819
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,303,1566878400"; 
   d="scan'208";a="7272819"
Date: Wed, 16 Oct 2019 11:18:41 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Sander Eikelenboom <linux@eikelenboom.it>
Message-ID: <20191016101841.GF1138@perard.uk.xensource.com>
References: <e8c0d666-0d74-068a-0274-2ccd20159745@eikelenboom.it>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e8c0d666-0d74-068a-0274-2ccd20159745@eikelenboom.it>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Xen-devel] Xen-unstable 4.13.0-rc0 problem starting guest
 while trying to passthrough multiple pci devices
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
 Wei Liu <wl@xen.org>, Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q0MgbGlieGwgbWFpbnRhaW5lcnMKCk9uIFR1ZSwgT2N0IDE1LCAyMDE5IGF0IDA2OjAyOjMzUE0g
KzAyMDAsIFNhbmRlciBFaWtlbGVuYm9vbSB3cm90ZToKPiBIaSBBbnRob255LAo+IAo+IFdoaWxl
IHRlc3RpbmcgeGVuLXVuc3RhYmxlIDQuMTMuMC1yYzAgSSByYW4gaW4gdG8gdGhlIGZvbGxvd2lu
ZyBpc3N1ZToKPiAKPiBXaGVuIHBhc3NpbmcgdGhyb3VnaCBhbGwgOCBmdW5jdGlvbnMgb2YgYSBw
Y2koZSkgZGV2aWNlIEkgY2FuJ3Qgc3RhcnQgdGhlIGd1ZXN0IGFueW1vcmUsIG5vdGUgdGhhdCB0
aGUgdHJvdWJsZSBvbmx5IHN0YXJ0cyBhdCAwOjk6MC4zLCBub3QgYXQgMDo5OjAuMDoKPiAJbGli
eGw6IGVycm9yOiBsaWJ4bF9xbXAuYzoxMjcwOnFtcF9ldl9jb25uZWN0OiBEb21haW4gMzpGYWls
ZWQgdG8gY29ubmVjdCB0byBRTVAgc29ja2V0IC92YXIvcnVuL3hlbi9xbXAtbGlieGwtMzogUmVz
b3VyY2UgdGVtcG9yYXJpbHkgdW5hdmFpbGFibGUKPiAJbGlieGw6IGVycm9yOiBsaWJ4bF9wY2ku
YzoxNzAyOmRldmljZV9wY2lfYWRkX2RvbmU6IERvbWFpbiAzOmxpYnhsX19kZXZpY2VfcGNpX2Fk
ZCAgZmFpbGVkIGZvciBQQ0kgZGV2aWNlIDA6OTowLjMgKHJjIC0zKQo+IAlsaWJ4bDogZXJyb3I6
IGxpYnhsX3FtcC5jOjEyNzA6cW1wX2V2X2Nvbm5lY3Q6IERvbWFpbiAzOkZhaWxlZCB0byBjb25u
ZWN0IHRvIFFNUCBzb2NrZXQgL3Zhci9ydW4veGVuL3FtcC1saWJ4bC0zOiBSZXNvdXJjZSB0ZW1w
b3JhcmlseSB1bmF2YWlsYWJsZQo+IAlsaWJ4bDogZXJyb3I6IGxpYnhsX3BjaS5jOjE3MDI6ZGV2
aWNlX3BjaV9hZGRfZG9uZTogRG9tYWluIDM6bGlieGxfX2RldmljZV9wY2lfYWRkICBmYWlsZWQg
Zm9yIFBDSSBkZXZpY2UgMDo5OjAuNCAocmMgLTMpCj4gCWxpYnhsOiBlcnJvcjogbGlieGxfcW1w
LmM6MTI3MDpxbXBfZXZfY29ubmVjdDogRG9tYWluIDM6RmFpbGVkIHRvIGNvbm5lY3QgdG8gUU1Q
IHNvY2tldCAvdmFyL3J1bi94ZW4vcW1wLWxpYnhsLTM6IFJlc291cmNlIHRlbXBvcmFyaWx5IHVu
YXZhaWxhYmxlCj4gCWxpYnhsOiBlcnJvcjogbGlieGxfcGNpLmM6MTcwMjpkZXZpY2VfcGNpX2Fk
ZF9kb25lOiBEb21haW4gMzpsaWJ4bF9fZGV2aWNlX3BjaV9hZGQgIGZhaWxlZCBmb3IgUENJIGRl
dmljZSAwOjk6MC41IChyYyAtMykKPiAJbGlieGw6IGVycm9yOiBsaWJ4bF9xbXAuYzoxMjcwOnFt
cF9ldl9jb25uZWN0OiBEb21haW4gMzpGYWlsZWQgdG8gY29ubmVjdCB0byBRTVAgc29ja2V0IC92
YXIvcnVuL3hlbi9xbXAtbGlieGwtMzogUmVzb3VyY2UgdGVtcG9yYXJpbHkgdW5hdmFpbGFibGUK
PiAJbGlieGw6IGVycm9yOiBsaWJ4bF9wY2kuYzoxNzAyOmRldmljZV9wY2lfYWRkX2RvbmU6IERv
bWFpbiAzOmxpYnhsX19kZXZpY2VfcGNpX2FkZCAgZmFpbGVkIGZvciBQQ0kgZGV2aWNlIDA6OTow
LjYgKHJjIC0zKQo+IAlsaWJ4bDogZXJyb3I6IGxpYnhsX3FtcC5jOjEyNzA6cW1wX2V2X2Nvbm5l
Y3Q6IERvbWFpbiAzOkZhaWxlZCB0byBjb25uZWN0IHRvIFFNUCBzb2NrZXQgL3Zhci9ydW4veGVu
L3FtcC1saWJ4bC0zOiBSZXNvdXJjZSB0ZW1wb3JhcmlseSB1bmF2YWlsYWJsZQo+IAlsaWJ4bDog
ZXJyb3I6IGxpYnhsX3BjaS5jOjE3MDI6ZGV2aWNlX3BjaV9hZGRfZG9uZTogRG9tYWluIDM6bGli
eGxfX2RldmljZV9wY2lfYWRkICBmYWlsZWQgZm9yIFBDSSBkZXZpY2UgMDo5OjAuNyAocmMgLTMp
Cj4gCWxpYnhsOiBlcnJvcjogbGlieGxfY3JlYXRlLmM6MTYwOTpkb21jcmVhdGVfYXR0YWNoX2Rl
dmljZXM6IERvbWFpbiAzOnVuYWJsZSB0byBhZGQgcGNpIGRldmljZXMKPiAJbGlieGw6IGVycm9y
OiBsaWJ4bF9kb21haW4uYzoxMTc3OmxpYnhsX19kZXN0cm95X2RvbWlkOiBEb21haW4gMzpOb24t
ZXhpc3RhbnQgZG9tYWluCj4gCWxpYnhsOiBlcnJvcjogbGlieGxfZG9tYWluLmM6MTEzMTpkb21h
aW5fZGVzdHJveV9jYWxsYmFjazogRG9tYWluIDM6VW5hYmxlIHRvIGRlc3Ryb3kgZ3Vlc3QKPiAJ
bGlieGw6IGVycm9yOiBsaWJ4bF9kb21haW4uYzoxMDU4OmRvbWFpbl9kZXN0cm95X2NiOiBEb21h
aW4gMzpEZXN0cnVjdGlvbiBvZiBkb21haW4gZmFpbGVkCj4gCj4gV2hlbiBvbmx5IHBhc3Npbmcg
dGhyb3VnaCB0aGUgZmlyc3QgZnVuY3Rpb25zIDA6OTowLjAgdG8gMDo5OjAuMiwgdGhlIGd1ZXN0
IHN0YXJ0cy4KClRoYW5rcyBmb3IgdGVzdGluZy4gSSBndWVzcyBzdGFydGluZyBtdWx0aXBsZSBj
b25uZWN0aW9ucyBhdCBvbmNlLCBhbmQKaG9wZSBRRU1VIGlzIGdvaW5nIHRvIHNlcmlhbGl6ZSBp
dCwgaXNuJ3QgZ29pbmcgdG8gd29yay4gSSdsbCByZXdvcmsKdGhhdCBwYXRoIGluIHRoZSBjb2Rl
IHNvIHRoYXQgZWFjaCBwY2kgZGV2aWNlL2Z1bmN0aW9ucyB3aWxsIGJlIGRvbmUgb25lCmF0IGEg
dGltZSwgbGlrZSBiZWZvcmUuCgpDaGVlcnMsCgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
