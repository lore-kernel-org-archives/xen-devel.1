Return-Path: <SRS0=9cJ5=WZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D4C1C3A59F
	for <xen-devel@archiver.kernel.org>; Thu, 29 Aug 2019 15:43:49 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 336572166E
	for <xen-devel@archiver.kernel.org>; Thu, 29 Aug 2019 15:43:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 336572166E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3MaI-0000HY-VL; Thu, 29 Aug 2019 15:43:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=C/xl=WZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i3MaH-0000HT-Mi
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 15:43:37 +0000
X-Inumbo-ID: c39ea790-ca73-11e9-ae6b-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c39ea790-ca73-11e9-ae6b-12813bfff9fa;
 Thu, 29 Aug 2019 15:43:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 17D53ADFB;
 Thu, 29 Aug 2019 15:43:34 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien.grall@arm.com>
References: <20190819142651.11058-1-julien.grall@arm.com>
 <20190819142651.11058-3-julien.grall@arm.com>
 <675bd338-791e-90f5-5c5a-d621268cb6a6@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e68c193a-e5fd-ba8a-86ca-e42d1227b9c2@suse.com>
Date: Thu, 29 Aug 2019 17:43:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <675bd338-791e-90f5-5c5a-d621268cb6a6@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 2/2] xen/domain: Use typesafe gfn in
 map_vcpu_info
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMDguMjAxOSAxNjoxNiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxOS8wOC8yMDE5
IDE1OjI2LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9w
dWJsaWMvdmNwdS5oIGIveGVuL2luY2x1ZGUvcHVibGljL3ZjcHUuaAo+PiBpbmRleCAzNjIzYWY5
MzJmLi5kYzRjNmE3MmEwIDEwMDY0NAo+PiAtLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvdmNwdS5o
Cj4+ICsrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy92Y3B1LmgKPj4gQEAgLTE4Miw3ICsxODIsNyBA
QCBERUZJTkVfWEVOX0dVRVNUX0hBTkRMRSh2Y3B1X3NldF9zaW5nbGVzaG90X3RpbWVyX3QpOwo+
PiAgICovCj4+ICAjZGVmaW5lIFZDUFVPUF9yZWdpc3Rlcl92Y3B1X2luZm8gICAxMCAgLyogYXJn
ID09IHZjcHVfcmVnaXN0ZXJfdmNwdV9pbmZvX3QgKi8KPj4gIHN0cnVjdCB2Y3B1X3JlZ2lzdGVy
X3ZjcHVfaW5mbyB7Cj4+IC0gICAgdWludDY0X3QgbWZuOyAgICAvKiBtZm4gb2YgcGFnZSB0byBw
bGFjZSB2Y3B1X2luZm8gKi8KPj4gKyAgICB1aW50NjRfdCBtZm47ICAgIC8qIGdmbiBvZiBwYWdl
IHRvIHBsYWNlIHZjcHVfaW5mbyAqLwo+IAo+IEkgd29uZGVyIGlmIHdlIGNhbiBkbyBzb21lIF9f
WEVOX0lOVEVSRkFDRV9WRVJTSU9OX18gbWFnaWMgaGVyZSB0bwo+IHByb3Blcmx5IGNoYW5nZSB0
aGUgbmFtZSB0byBnZm4uCj4gCj4gTGVhdmluZyBpdCBhcyBtZm4gaXMgZ29pbmcgdG8gYmUgYW4g
b25nb2luZyBzb3VyY2Ugb2YgY29uZnVzaW9uLgoKVGhpcyB3b3VsZCBiZSBwcmV0dHkgbmljZSBp
bmRlZWQuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
