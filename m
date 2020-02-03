Return-Path: <SRS0=teC0=3X=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48541C35247
	for <xen-devel@archiver.kernel.org>; Mon,  3 Feb 2020 15:26:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B8CE20721
	for <xen-devel@archiver.kernel.org>; Mon,  3 Feb 2020 15:26:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B8CE20721
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iydcF-0002SD-Gn; Mon, 03 Feb 2020 15:26:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=BfOp=3X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iydcD-0002S8-VF
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 15:26:21 +0000
X-Inumbo-ID: 87bbe696-4699-11ea-8e6f-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 87bbe696-4699-11ea-8e6f-12813bfff9fa;
 Mon, 03 Feb 2020 15:26:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7A558B232;
 Mon,  3 Feb 2020 15:26:20 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200117105358.607910-1-anthony.perard@citrix.com>
 <20200117105358.607910-13-anthony.perard@citrix.com>
 <e704f28b-818f-8f92-53a8-c9c804805aff@suse.com>
 <20200203135726.GD2306@perard.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d83a892c-7e5a-8da8-14a6-84878bdd6d9a@suse.com>
Date: Mon, 3 Feb 2020 16:26:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200203135726.GD2306@perard.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH v2 12/12] xen/build: have the root
 Makefile generates the CFLAGS
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDIuMjAyMCAxNDo1NywgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gT24gVGh1LCBKYW4g
MzAsIDIwMjAgYXQgMDM6MzM6MTVQTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDE3
LjAxLjIwMjAgMTE6NTMsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+Pj4gK2lmbmVxICgkKENPTkZJ
R19DQ19JU19DTEFORykseSkKPj4+ICsjIENsYW5nIGRvZXNuJ3QgdW5kZXJzdGFuZCB0aGlzIGNv
bW1hbmQgbGluZSBhcmd1bWVudCwgYW5kIGRvZXNuJ3QgYXBwZWFyIHRvCj4+PiArIyBoYXZlIGFu
IHN1aXRhYmxlIGFsdGVybmF0aXZlLiAgVGhlIHJlc3VsdGluZyBjb21waWxlZCBiaW5hcnkgZG9l
cyBmdW5jdGlvbiwKPj4+ICsjIGJ1dCBoYXMgYW4gZXhjZXNzaXZlbHkgbGFyZ2Ugc3ltYm9sIHRh
YmxlLgo+Pj4gK0NGTEFHUyArPSAtV2EsLS1zdHJpcC1sb2NhbC1hYnNvbHV0ZQo+Pj4gK2VuZGlm
Cj4+PiArCj4+PiArQUZMQUdTLXkgICAgICAgICAgICAgICAgKz0gLURfX0FTU0VNQkxZX18KPj4K
Pj4gV2h5IG5vdCBqdXN0IEFGTEFHUz8gSSB0aGluayBpbiBhIG92ZXJoYXVsIGxpa2Ugd2hhdCB5
b3UgZG8sCj4+IGFub21hbGllcyBsaWtlIHRoaXMgb25lIHdvdWxkIGJldHRlciBiZSBlbGltaW5h
dGVkLiBUaGUgLXkKPj4gZm9ybXMgc2hvdWxkIGJlIGFkZGVkIGludG8gdGhlIGJhc2UgdmFyaWFi
bGVzIChsaWtlIHlvdSBkbyAuLi4KPiAKPiBJIHdhbnRlZCB0byBhdm9pZCB0b28gbXVjaCBtb2Rp
ZmljYXRpb24sIGFuZCBtb3N0bHkgd2FudCB0byBtb3ZlIHRoZSBjb2RlCj4gYXJvdW5kLiBTbyBp
dCB3b3VsZCBiZSBlYXNpZXIgdG8gY2hlY2sgdGhhdCB0aGUgY29tbWl0IGRvZXNuJ3QgaW50cm9k
dWNlCj4gZXJyb3JzLiAgU28sIGlmIHlvdXIgYXJlIGZpbmUgd2l0aCBwYXRjaCB0aGF0IG1vdmUg
Y29kZSBhbmQgbW9kaWZ5IGl0LAo+IEknbGwgZml4IHNvbWUgb2YgdGhlIG9kZGl0aWVzLiAoT3Ig
SSBjYW4gaGF2ZSBhbm90aGVyIHBhdGNoIGZvciBpdC4pCgpXaXRoIHN1Y2ggZXh0cmEgYWRqdXN0
bWVudHMgYXQgbGVhc3QgYnJpZWZseSBtZW50aW9uZWQgaW4gdGhlCmRlc2NyaXB0aW9uLCBmb2xk
aW5nIGluIGlzIGZpbmUgYXMgZmFyIGFzIEknbSBjb25jZXJuZWQuCgpKYW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
