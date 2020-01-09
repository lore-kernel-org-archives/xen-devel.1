Return-Path: <SRS0=KXiY=26=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6ACFC3F68F
	for <xen-devel@archiver.kernel.org>; Thu,  9 Jan 2020 10:29:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A56D920678
	for <xen-devel@archiver.kernel.org>; Thu,  9 Jan 2020 10:29:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A56D920678
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipV3p-0000hr-Va; Thu, 09 Jan 2020 10:29:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=q+DX=26=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ipV3o-0000hm-35
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2020 10:29:04 +0000
X-Inumbo-ID: d656206a-32ca-11ea-a985-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d656206a-32ca-11ea-a985-bc764e2007e4;
 Thu, 09 Jan 2020 10:28:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C2AB269ECE;
 Thu,  9 Jan 2020 10:28:11 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200108170040.7728-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bed20854-b537-da48-e7f5-451887ee98db@suse.com>
Date: Thu, 9 Jan 2020 11:28:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200108170040.7728-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/boot: Rationalise stack handling during
 early boot
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

T24gMDguMDEuMjAyMCAxODowMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiAtLS0gYS94ZW4vYXJj
aC94ODYvZWZpL2VmaS1ib290LmgKPiArKysgYi94ZW4vYXJjaC94ODYvZWZpL2VmaS1ib290LmgK
PiBAQCAtMjQ5LDIzICsyNDksMjQgQEAgc3RhdGljIHZvaWQgX19pbml0IG5vcmV0dXJuIGVmaV9h
cmNoX3Bvc3RfZXhpdF9ib290KHZvaWQpCj4gICAgICAgICAgICAgICAgICAgICAib3IgICAgICQi
X19zdHJpbmdpZnkoWDg2X0NSNF9QR0UpIiwgJVtjcjRdXG5cdCIKPiAgICAgICAgICAgICAgICAg
ICAgICJtb3YgICAgJVtjcjRdLCAlJWNyNFxuXHQiCj4gICNlbmRpZgo+IC0gICAgICAgICAgICAg
ICAgICAgIm1vdmFicyAkX19zdGFydF94ZW4sICVbcmlwXVxuXHQiCj4gICAgICAgICAgICAgICAg
ICAgICAibGdkdCAgIGJvb3RfZ2R0ciglJXJpcClcblx0Igo+IC0gICAgICAgICAgICAgICAgICAg
Im1vdiAgICBzdGFja19zdGFydCglJXJpcCksICUlcnNwXG5cdCIKPiAgICAgICAgICAgICAgICAg
ICAgICJtb3YgICAgJVtkc10sICUlc3Ncblx0Igo+ICAgICAgICAgICAgICAgICAgICAgIm1vdiAg
ICAlW2RzXSwgJSVkc1xuXHQiCj4gICAgICAgICAgICAgICAgICAgICAibW92ICAgICVbZHNdLCAl
JWVzXG5cdCIKPiAgICAgICAgICAgICAgICAgICAgICJtb3YgICAgJVtkc10sICUlZnNcblx0Igo+
ICAgICAgICAgICAgICAgICAgICAgIm1vdiAgICAlW2RzXSwgJSVnc1xuXHQiCj4gLSAgICAgICAg
ICAgICAgICAgICAibW92bCAgICVbY3NdLCA4KCUlcnNwKVxuXHQiCj4gLSAgICAgICAgICAgICAg
ICAgICAibW92ICAgICVbcmlwXSwgKCUlcnNwKVxuXHQiCj4gLSAgICAgICAgICAgICAgICAgICAi
bHJldHEgICVbc3Rrb2ZmXS0xNiIKPiArCj4gKyAgICAgICAgICAgICAgICAgICAvKiBKdW1wIHRv
IGhpZ2hlciBtYXBwaW5ncy4gKi8KPiArICAgICAgICAgICAgICAgICAgICJtb3YgICAgc3RhY2tf
c3RhcnQoJSVyaXApLCAlJXJzcFxuXHQiCj4gKyAgICAgICAgICAgICAgICAgICAibW92YWJzICRf
X3N0YXJ0X3hlbiwgJVtyaXBdXG5cdCIKPiArICAgICAgICAgICAgICAgICAgICJwdXNoICAgJVtj
c11cblx0IgoKRWl0aGVyIHlvdSBuZWVkICVxW2NzXSBoZXJlIChhc3N1bWluZyBxIGdldHMgaWdu
b3JlZCBmb3IKaW1tZWRpYXRlIG9wZXJhbmRzLCB3aGljaCBJIGRpZG4ndCBjaGVjaykgb3IgLi4u
Cgo+ICsgICAgICAgICAgICAgICAgICAgInB1c2ggICAlW3JpcF1cblx0Igo+ICsgICAgICAgICAg
ICAgICAgICAgImxyZXRxIgo+ICAgICAgICAgICAgICAgICAgICAgOiBbcmlwXSAiPSZyIiAoZWZl
ci8qIGFueSBkZWFkIDY0LWJpdCB2YXJpYWJsZSAqLyksCj4gICAgICAgICAgICAgICAgICAgICAg
IFtjcjRdICIrJnIiIChjcjQpCj4gICAgICAgICAgICAgICAgICAgICA6IFtjcjNdICJyIiAoaWRs
ZV9wZ190YWJsZSksCj4gICAgICAgICAgICAgICAgICAgICAgIFtjc10gImlyIiAoX19IWVBFUlZJ
U09SX0NTKSwKCi4uLiB5b3UgbmVlZCB0byB1c2UganVzdCAiaSIgaGVyZSwgZm9yIHRoZXJlIG5v
dCBiZWluZyAzMi1iaXQKUFVTSCBmb3Jtcy4KCj4gLS0tIGEveGVuL2FyY2gveDg2L3NtcGJvb3Qu
Ywo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9zbXBib290LmMKPiBAQCAtNTU0LDcgKzU1NCw3IEBAIHN0
YXRpYyBpbnQgZG9fYm9vdF9jcHUoaW50IGFwaWNpZCwgaW50IGNwdSkKPiAgICAgICAgICBwcmlu
dGsoIkJvb3RpbmcgcHJvY2Vzc29yICVkLyVkIGVpcCAlbHhcbiIsCj4gICAgICAgICAgICAgICAg
IGNwdSwgYXBpY2lkLCBzdGFydF9laXApOwo+ICAKPiAtICAgIHN0YWNrX3N0YXJ0ID0gc3RhY2tf
YmFzZVtjcHVdOwo+ICsgICAgc3RhY2tfc3RhcnQgPSBzdGFja19iYXNlW2NwdV0gKyBTVEFDS19T
SVpFIC0gc2l6ZW9mKHN0cnVjdCBjcHVfaW5mbyk7Cj4gIAo+ICAgICAgLyogVGhpcyBncnVuZ2Ug
cnVucyB0aGUgc3RhcnR1cCBwcm9jZXNzIGZvciB0aGUgdGFyZ2V0ZWQgcHJvY2Vzc29yLiAqLwoK
RnVydGhlciBkb3duIHNtcF9wcmVwYXJlX2NwdXMoKSBoYXMKCiAgICBzdGFja19iYXNlWzBdID0g
c3RhY2tfc3RhcnQ7Cgp3aGljaCBJIHRoaW5rIHlvdSBuZWVkIHRvIGFsc28gYWRqdXN0IChvciBy
ZXBsYWNlLCBlLmcuIGJ5IGdpdmluZwpzdGFja19iYXNlW10gYW4gaW5pdGlhbGl6ZXIpLgoKSmFu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
