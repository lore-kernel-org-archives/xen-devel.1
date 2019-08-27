Return-Path: <SRS0=wySQ=WX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A8D6C3A5A3
	for <xen-devel@archiver.kernel.org>; Tue, 27 Aug 2019 07:46:49 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E8312070B
	for <xen-devel@archiver.kernel.org>; Tue, 27 Aug 2019 07:46:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E8312070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2WAi-0004k0-3v; Tue, 27 Aug 2019 07:45:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=72vU=WX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i2WAh-0004jv-8I
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 07:45:43 +0000
X-Inumbo-ID: ab329bac-c89e-11e9-b95f-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ab329bac-c89e-11e9-b95f-bc764e2007e4;
 Tue, 27 Aug 2019 07:45:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A9C34B128;
 Tue, 27 Aug 2019 07:45:40 +0000 (UTC)
To: Paul Durrant <Paul.Durrant@citrix.com>
References: <20190730134419.2739-1-paul.durrant@citrix.com>
 <20190730134419.2739-4-paul.durrant@citrix.com>
 <1383f85e-bc08-c0be-bb02-f68b76ac1be5@suse.com>
 <0134b70d04b942b4b3ce65fd2340ff0c@AMSPEX02CL03.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1cf99941-56db-6906-4689-6027912dabf0@suse.com>
Date: Tue, 27 Aug 2019 09:45:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <0134b70d04b942b4b3ce65fd2340ff0c@AMSPEX02CL03.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 3/6] remove late (on-demand) construction of
 IOMMU page tables
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, JulienGrall <julien.grall@arm.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 IanJackson <Ian.Jackson@citrix.com>,
 VolodymyrBabchuk <Volodymyr_Babchuk@epam.com>,
 RogerPau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDguMjAxOSAxNzo0MSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+IFNlbnQ6IDA3IEF1Z3VzdCAyMDE5IDExOjMyCj4+
Cj4+IE9uIDMwLjA3LjIwMTkgMTU6NDQsIFBhdWwgRHVycmFudCB3cm90ZToKPj4+IEBAIC02MjUs
OCArNTQ4LDcgQEAgc3RhdGljIHZvaWQgaW9tbXVfZHVtcF9wMm1fdGFibGUodW5zaWduZWQgY2hh
ciBrZXkpCj4+PiAgICAgICAgb3BzID0gaW9tbXVfZ2V0X29wcygpOwo+Pj4gICAgICAgIGZvcl9l
YWNoX2RvbWFpbihkKQo+Pj4gICAgICAgIHsKPj4+IC0gICAgICAgIGlmICggaXNfaGFyZHdhcmVf
ZG9tYWluKGQpIHx8Cj4+PiAtICAgICAgICAgICAgIGRvbV9pb21tdShkKS0+c3RhdHVzIDwgSU9N
TVVfU1RBVFVTX2luaXRpYWxpemVkICkKPj4+ICsgICAgICAgIGlmICggIWlzX2lvbW11X2VuYWJs
ZWQoZCkgKQo+Pj4gICAgICAgICAgICAgICAgY29udGludWU7Cj4+Cj4+IFdoeSBkbyB5b3UgZHJv
cCB0aGUgaHdkb20gY2hlY2sgaGVyZT8KPiAKPiBCZWNhdXNlIGlzX2lvbW11X2VuYWJsZWQoKSBm
b3IgdGhlIGgvdyBkb21haW4gd2lsbCBhbHdheXMgYmUgdHJ1ZSBpZgo+IGlvbW11X2VuYWJsZWQg
aXMgdHJ1ZSwgc28gbm8gbmVlZCBmb3IgYSBzcGVjaWFsIGNhc2UuCgpCdXQgdGhlIGVmZmVjdCBv
ZiB0aGUgZXh0cmEgY2hlY2sgd2FzIHRvIF9za2lwXyBEb20wLiBJZiB5b3UgbWVhbiB0bwpjaGFu
Z2UgdGhpcywgdGhlbiB5b3Ugc2hvdWxkIHNheSBzbyAoYW5kIHdoeSkgaW4gdGhlIGRlc2NyaXB0
aW9uLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
