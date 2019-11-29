Return-Path: <SRS0=4rCt=ZV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BFB5C432C0
	for <xen-devel@archiver.kernel.org>; Fri, 29 Nov 2019 13:43:24 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E554921736
	for <xen-devel@archiver.kernel.org>; Fri, 29 Nov 2019 13:43:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E554921736
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iagY7-0004x2-8t; Fri, 29 Nov 2019 13:43:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iagY6-0004wx-Ji
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 13:43:06 +0000
X-Inumbo-ID: 2bacf92c-12ae-11ea-a3e7-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2bacf92c-12ae-11ea-a3e7-12813bfff9fa;
 Fri, 29 Nov 2019 13:43:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E56F6B308;
 Fri, 29 Nov 2019 13:43:04 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20191121185049.16666-1-liuwe@microsoft.com>
 <20191121185049.16666-5-liuwe@microsoft.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b7c3fb05-3d37-e1e8-36d6-76e561a42f02@suse.com>
Date: Fri, 29 Nov 2019 14:43:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191121185049.16666-5-liuwe@microsoft.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 4/8] x86: introduce hypervisor framework
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
Cc: Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <liuwe@microsoft.com>, Michael Kelley <mikelley@microsoft.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMTEuMjAxOSAxOTo1MCwgV2VpIExpdSB3cm90ZToKPiAtLS0gL2Rldi9udWxsCj4gKysr
IGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydmlzb3IuYwo+IEBAIC0wLDAgKzEsNDIgQEAKPiAr
LyoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKgo+ICsgKiBhcmNoL3g4Ni9ndWVzdC9oeXBlcnZpc29yLmMK
PiArICoKPiArICogU3VwcG9ydCBmb3IgZGV0ZWN0aW5nIGFuZCBydW5uaW5nIHVuZGVyIGEgaHlw
ZXJ2aXNvci4KPiArICoKPiArICogVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBj
YW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkKPiArICogaXQgdW5kZXIgdGhlIHRlcm1z
IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkKPiArICog
dGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24gMiBvZiB0aGUgTGlj
ZW5zZSwgb3IKPiArICogKGF0IHlvdXIgb3B0aW9uKSBhbnkgbGF0ZXIgdmVyc2lvbi4KPiArICoK
PiArICogVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQgaXQgd2ls
bCBiZSB1c2VmdWwsCj4gKyAqIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVu
IHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mCj4gKyAqIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNT
IEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gIFNlZSB0aGUKPiArICogR05VIEdlbmVyYWwgUHVi
bGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KPiArICoKPiArICogWW91IHNob3VsZCBoYXZl
IHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UKPiArICog
YWxvbmcgd2l0aCB0aGlzIHByb2dyYW07IElmIG5vdCwgc2VlIDxodHRwOi8vd3d3LmdudS5vcmcv
bGljZW5zZXMvPi4KPiArICoKPiArICogQ29weXJpZ2h0IChjKSAyMDE5IE1pY3Jvc29mdC4KPiAr
ICovCj4gKwo+ICsjaW5jbHVkZSA8eGVuL3R5cGVzLmg+Cj4gKwo+ICsjaW5jbHVkZSA8YXNtL2Nh
Y2hlLmg+Cj4gKyNpbmNsdWRlIDxhc20vZ3Vlc3QvaHlwZXJ2aXNvci5oPgo+ICsKPiArc3RhdGlj
IGNvbnN0IHN0cnVjdCBoeXBlcnZpc29yX29wcyBfX3JlYWRfbW9zdGx5ICpob3BzOwo+ICsKPiAr
Y29uc3Qgc3RydWN0IGh5cGVydmlzb3Jfb3BzICpoeXBlcnZpc29yX3Byb2JlKHZvaWQpCgpEZXNw
aXRlIG15IGVhcmxpZXIgYWNrIC0gX19pbml0PwoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
