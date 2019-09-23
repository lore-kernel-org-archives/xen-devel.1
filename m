Return-Path: <SRS0=YB+K=XS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2B7AC4CEC4
	for <xen-devel@archiver.kernel.org>; Mon, 23 Sep 2019 15:50:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA7FA205F4
	for <xen-devel@archiver.kernel.org>; Mon, 23 Sep 2019 15:50:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA7FA205F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCQbr-0006iF-M3; Mon, 23 Sep 2019 15:50:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XN81=XS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iCQbp-0006i4-O9
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 15:50:41 +0000
X-Inumbo-ID: e4c26f38-de19-11e9-9601-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id e4c26f38-de19-11e9-9601-12813bfff9fa;
 Mon, 23 Sep 2019 15:50:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0F998AE55;
 Mon, 23 Sep 2019 15:50:40 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-32-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <05069a81-3e6c-50d4-148c-1b41e7f66628@suse.com>
Date: Mon, 23 Sep 2019 17:50:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190914085251.18816-32-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 31/47] xen/sched: modify
 cpupool_domain_cpumask() to be an unit mask
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQuMDkuMjAxOSAxMDo1MiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiAtLS0gYS94ZW4vY29t
bW9uL2NwdXBvb2wuYwo+ICsrKyBiL3hlbi9jb21tb24vY3B1cG9vbC5jCj4gQEAgLTM2LDI2ICsz
NiwzNSBAQCBzdGF0aWMgREVGSU5FX1NQSU5MT0NLKGNwdXBvb2xfbG9jayk7Cj4gIAo+ICBERUZJ
TkVfUEVSX0NQVShzdHJ1Y3QgY3B1cG9vbCAqLCBjcHVwb29sKTsKPiAgCj4gK3N0YXRpYyB2b2lk
IGZyZWVfY3B1cG9vbF9zdHJ1Y3Qoc3RydWN0IGNwdXBvb2wgKmMpCj4gK3sKPiArICAgIGlmICgg
YyApCj4gKyAgICB7Cj4gKyAgICAgICAgZnJlZV9jcHVtYXNrX3ZhcihjLT5yZXNfdmFsaWQpOwo+
ICsgICAgICAgIGZyZWVfY3B1bWFza192YXIoYy0+Y3B1X3ZhbGlkKTsKPiArICAgIH0KPiArICAg
IHhmcmVlKGMpOwo+ICt9Cj4gKwo+ICBzdGF0aWMgc3RydWN0IGNwdXBvb2wgKmFsbG9jX2NwdXBv
b2xfc3RydWN0KHZvaWQpCj4gIHsKPiAgICAgIHN0cnVjdCBjcHVwb29sICpjID0geHphbGxvYyhz
dHJ1Y3QgY3B1cG9vbCk7Cj4gIAo+IC0gICAgaWYgKCAhYyB8fCAhemFsbG9jX2NwdW1hc2tfdmFy
KCZjLT5jcHVfdmFsaWQpICkKPiArICAgIGlmICggIWMgKQo+ICsgICAgICAgIHJldHVybiBOVUxM
Owo+ICsKPiArICAgIHphbGxvY19jcHVtYXNrX3ZhcigmYy0+Y3B1X3ZhbGlkKTsKPiArICAgIHph
bGxvY19jcHVtYXNrX3ZhcigmYy0+cmVzX3ZhbGlkKTsKPiArCj4gKyAgICBpZiAoICFjLT5jcHVf
dmFsaWQgfHwgIWMtPnJlc192YWxpZCApCgpJIGd1ZXNzIGNvbXBpbGVycyAob3Igb3RoZXIgc3Rh
dGljIGFuYWx5c2lzIHRvb2xzKSBtYXkgd2FybiBhYm91dAp0aGlzIGZvciBOUl9DUFVTIDw9IDIg
KiBCSVRTX1BFUl9MT05HIGJ1aWxkcy4gVGhlIGludGVudGlvbiByZWFsbHkKaXMgZm9yIHlvdSB0
byBjaGVjayB6YWxsb2NfY3B1bWFza192YXIoKSdzIHJldHVybiB2YWx1ZTsgcGVyaGFwcwppdCBz
aG91bGQgZ2V0IFtoYXZlIGJlZW5dIG1hcmtlZCAiX19tdXN0X2NoZWNrIi4KCkphbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
