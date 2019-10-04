Return-Path: <SRS0=IlRI=X5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E329C4360C
	for <xen-devel@archiver.kernel.org>; Fri,  4 Oct 2019 10:40:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04F182133F
	for <xen-devel@archiver.kernel.org>; Fri,  4 Oct 2019 10:40:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04F182133F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGL0e-0001Ji-9S; Fri, 04 Oct 2019 10:40:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iHDm=X5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iGL0d-0001Jd-18
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 10:40:27 +0000
X-Inumbo-ID: 6002e192-e693-11e9-8c93-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6002e192-e693-11e9-8c93-bc764e2007e4;
 Fri, 04 Oct 2019 10:40:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4F568B18C;
 Fri,  4 Oct 2019 10:40:25 +0000 (UTC)
To: Igor Druzhinin <igor.druzhinin@citrix.com>
References: <1570110555-24287-1-git-send-email-igor.druzhinin@citrix.com>
 <1570110555-24287-3-git-send-email-igor.druzhinin@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4d82e6f6-e362-7fc0-efa9-d024088d9f9f@suse.com>
Date: Fri, 4 Oct 2019 12:40:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1570110555-24287-3-git-send-email-igor.druzhinin@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] efi/boot: make sure chosen mode is set
 even if firmware tell it is
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMTAuMjAxOSAxNTo0OSwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4gSWYgYSBib290bG9h
ZGVyIGlzIHVzaW5nIG5hdGl2ZSBkcml2ZXIgaW5zdGVhZCBvZiBFRkkgR09QIGl0IG1pZ2h0Cj4g
cmVzZXQgZ3JhcGhpY3MgbW9kZSB0byBiZSBkaWZmZXJlbnQgZnJvbSB3aGF0IGZpcm13YXJlIHRo
aW5rcyBpdAo+IGN1cnJlbnRseSBpcy4gU2V0IGNob3NlbiBtb2RlIHVuY29uZGl0aW9uYWxseSB0
byBmaXggdGhpcyBwb3NzaWJsZQo+IG1pc2FsaWdubWVudC4KPiAKPiBPYnNlcnZlZCB3aXRoIEVG
SSBHUlVCMiBjb21waWxlZCB3aXRoIGFsbCBwb3NzaWJsZSB2aWRlbyBkcml2ZXJzIHdoZXJlCj4g
bmF0aXZlIGRyaXZlcnMgdGFrZSBwcmlvcml0eSBvdmVyIGZpcm13YXJlLgoKSSBkb24ndCB0aGlu
ayB0aGlzIGNhc2UgY2FuIGhhcHBlbiB3aXRoIGp1c3QgcGxhaW4gRUZJLiBUaGVyZWZvcmUgLi4u
Cgo+IFNpZ25lZC1vZmYtYnk6IElnb3IgRHJ1emhpbmluIDxpZ29yLmRydXpoaW5pbkBjaXRyaXgu
Y29tPgo+IC0tLQo+ICB4ZW4vY29tbW9uL2VmaS9ib290LmMgfCAyICstCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4v
Y29tbW9uL2VmaS9ib290LmMgYi94ZW4vY29tbW9uL2VmaS9ib290LmMKPiBpbmRleCA5MzNkYjg4
Li40MDY3NzIxIDEwMDY0NAo+IC0tLSBhL3hlbi9jb21tb24vZWZpL2Jvb3QuYwo+ICsrKyBiL3hl
bi9jb21tb24vZWZpL2Jvb3QuYwo+IEBAIC0xMDUyLDcgKzEwNTIsNyBAQCBzdGF0aWMgdm9pZCBf
X2luaXQgZWZpX3NldF9nb3BfbW9kZShFRklfR1JBUEhJQ1NfT1VUUFVUX1BST1RPQ09MICpnb3As
IFVJTlROIGdvcAo+ICAgICAgVUlOVE4gaW5mb19zaXplOwo+ICAKPiAgICAgIC8qIFNldCBncmFw
aGljcyBtb2RlLiAqLwo+IC0gICAgaWYgKCBnb3BfbW9kZSA8IGdvcC0+TW9kZS0+TWF4TW9kZSAm
JiBnb3BfbW9kZSAhPSBnb3AtPk1vZGUtPk1vZGUgKQo+ICsgICAgaWYgKCBnb3BfbW9kZSA8IGdv
cC0+TW9kZS0+TWF4TW9kZSApCj4gICAgICAgICAgZ29wLT5TZXRNb2RlKGdvcCwgZ29wX21vZGUp
OwoKLi4uIHJhdGhlciB0aGFuIGRlbGV0aW5nIHRoZSByaWdodCBzaWRlIG9mIHRoZSAmJiBJJ2Qg
bGlrZSB0bwpzdWdnZXN0IHRvIGV4dGVuZCB0byB0byB0YWtlIGVmZmVjdCBvbmx5IHdoZW4gY29t
aW5nIHN0cmFpZ2h0CmZyb20gRUZJIChpLmUuIEVGSV9MT0FERVIgc2V0IGluIGVmaV9mbGFncyku
IFRoZSBjb21tZW50IHRoZW4Kc2hvdWxkIGJlIGV4dGVuZGVkIHRvIGV4cGxhaW4gd2h5IHRoaXMg
aXMuIChSZWFzb24gYmVpbmcgdGhhdApJJ2QgcHJlZmVyIHRvIGF2b2lkIG1vZGUgc3dpdGNoZXMg
dW5sZXNzIHRoZXkncmUgbmVlZGVkIGZvcgphIGNlcnRhaW4gcmVhc29uLikKCkphbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
