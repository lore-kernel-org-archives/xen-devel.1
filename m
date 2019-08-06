Return-Path: <SRS0=jzL+=WC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDD99C31E40
	for <xen-devel@archiver.kernel.org>; Tue,  6 Aug 2019 13:35:35 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B72CD20C01
	for <xen-devel@archiver.kernel.org>; Tue,  6 Aug 2019 13:35:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B72CD20C01
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huzbs-0006hK-4L; Tue, 06 Aug 2019 13:34:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NkML=WC=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1huzbr-0006hF-HR
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2019 13:34:39 +0000
X-Inumbo-ID: eee27382-b84e-11e9-a892-a74c2aedecba
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eee27382-b84e-11e9-a892-a74c2aedecba;
 Tue, 06 Aug 2019 13:34:37 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: TjO7Qv1hgvglL7Zx2LWXpzGBcUqZr5yPNUpLFef9FCrVKVZEBnHpOyS9oZ8KnPwPPUIMm9xac7
 quWXFmPQQyIrwxO73wteLY8nOcpPycspMuk3Mwa/1Hx9LJI3eavLANbrJCOfCouZ/0Uyd4GpTm
 1Yey4l9ZBDBJvf23zJ2GCmyPuoeopGlLc+x0xbrvna+rkqQdeFWL0UaLt2yqUqNiD7sKHFg9sz
 D6dPCphrtiyh7qZYV/lfiaFM1sBtqmdhc/UJZ3nqV+53S6frDUhalTAyzALVROOtZjO97IC1dP
 a5g=
X-SBRS: 2.7
X-MesageID: 3915232
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,353,1559534400"; 
   d="scan'208";a="3915232"
Date: Tue, 6 Aug 2019 14:34:33 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Dario Faggioli <dfaggioli@suse.com>
Message-ID: <20190806133433.GN1242@perard.uk.xensource.com>
References: <156458463216.7075.10552410480716651842.stgit@Palanthas>
 <ab677cc1-1d65-ff4e-37b8-89e6c600c8fd@citrix.com>
 <c8a008e4cca343e8ac9928660057764b01b8ef2f.camel@suse.com>
 <20190806101204.GL1242@perard.uk.xensource.com>
 <9e4a30d293de17fe1711f1ceccfba3875175c059.camel@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9e4a30d293de17fe1711f1ceccfba3875175c059.camel@suse.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [PATCH 0/3] automation: build Xen in openSUSE
 Tumbleweed
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Doug Goldstein <cardoe@cardoe.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBBdWcgMDYsIDIwMTkgYXQgMDM6MTc6MjZQTSArMDIwMCwgRGFyaW8gRmFnZ2lvbGkg
d3JvdGU6Cj4gT24gVHVlLCAyMDE5LTA4LTA2IGF0IDExOjEyICswMTAwLCBBbnRob255IFBFUkFS
RCB3cm90ZToKPiA+IHdpdGggdGhvc2UgdHdvIEkgY291bGQgYnVpbGQgYSBxZW11IGluIHRoZSB0
dW1ibGV3ZWVkIGNvbnRhaW5lciwgYnV0Cj4gPiB0aGVyZSBhcmUgbWF5YmUgb3RoZXIgY29tbWl0
IG1pc3NpbmcuCj4gPiAKPiBZb3UgbWVhbiB0aGUgYnVpbGQgaXMgc3RpbGwgZmFpbGluZyBmb3Ig
eW91LCBidXQgbm90IGluIFFFTVU/CgpJIGhhdmUgYnVpbHQgUUVNVSBidXQgd2l0aG91dCBYZW4u
IFRoZSBjb250YWluZXIgSSB1c2VkIGRpZG4ndCBoYXZlIHRoZQpYZW4gbGlicmFyaWVzIGFuZCBJ
IGRpZG4ndCB0cnkgdG8gYnVpbGQgb3IgaW5zdGFsbCB0aGVtLgoKPiBJJ3ZlIGp1c3QgdHJpZWQs
IGFuZCB0aGUgb25seSBwcm9ibGVtIEknbSBzZWVpbmcgaXMgdGhlCj4gdGVzdC1jcHUtcG9saWN5
LmMgb25lIHRoYXQgaGFzIGFscmVhZHkgYmVlbiByZXBvcnRlZCwgYnV0IGlzIGJlbGlldmVkCj4g
dG8gYmUgYSBnY2MgcHJvYmxlbS4KClRoYW5rcyBmb3IgY29uZmlybWluZyBpdCBhbGwgd29ya3Mg
OikuCgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
