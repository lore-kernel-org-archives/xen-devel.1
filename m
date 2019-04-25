Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5220FC43218
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 13:42:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2767B206C0
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 13:42:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2767B206C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJee9-000090-Hy; Thu, 25 Apr 2019 13:42:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PBl1=S3=citrix.com=prvs=0115b8627=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hJee8-00008v-SZ
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 13:42:40 +0000
X-Inumbo-ID: fcdd07f8-675f-11e9-be81-2b195aa4068a
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fcdd07f8-675f-11e9-be81-2b195aa4068a;
 Thu, 25 Apr 2019 13:42:38 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,393,1549929600"; d="scan'208";a="89284850"
To: Jan Beulich <JBeulich@suse.com>, FionaLi-oc <fionali-oc@zhaoxin.com>
References: <1555663857-4173-1-git-send-email-fionali-oc@zhaoxin.com>
 <5CC1B46B0200007800229134@prv1-mh.provo.novell.com>
 <89dcdf84-214d-d100-e2a1-8bd151f215bd@citrix.com>
 <5CC1B818020000780022916A@prv1-mh.provo.novell.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <b4952c32-0162-7d92-ab11-825daae4dd06@citrix.com>
Date: Thu, 25 Apr 2019 14:42:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CC1B818020000780022916A@prv1-mh.provo.novell.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 2/2 v2] x86/acpi: Improve suspend and resume
 process for Zhaoxin CPU
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, cobechen@zhaoxin.com,
 Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190425134215.PEAMznBB3P2UKz1MMl3yJHP52LOeXjI2ndqnmiIeOgg@z>

T24gMjUvMDQvMjAxOSAxNDozNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjUuMDQuMTkg
YXQgMTU6MjUsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gT24gMjUvMDQv
MjAxOSAxNDoyMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+PiBPbiAxOS4wNC4xOSBhdCAxMDo1
MCwgPGZpb25hbGktb2NAemhhb3hpbi5jb20+IHdyb3RlOgo+Pj4+IC0tLSBhL3hlbi9hcmNoL3g4
Ni94ODZfNjQvdHJhcHMuYwo+Pj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni94ODZfNjQvdHJhcHMuYwo+
Pj4+IEBAIC0zMzQsNyArMzM0LDggQEAgdm9pZCBzdWJhcmNoX3BlcmNwdV90cmFwc19pbml0KHZv
aWQpCj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKHVuc2lnbmVkIGxv
bmcpbHN0YXJfZW50ZXIpOwo+Pj4+ICAgICAgc3R1Yl92YSArPSBvZmZzZXQ7Cj4+Pj4gIAo+Pj4+
IC0gICAgaWYgKCBib290X2NwdV9kYXRhLng4Nl92ZW5kb3IgJiAoWDg2X1ZFTkRPUl9JTlRFTCB8
IFg4Nl9WRU5ET1JfQ0VOVEFVUikgCj4+ICkKPj4+PiArICAgIGlmICggYm9vdF9jcHVfZGF0YS54
ODZfdmVuZG9yICYKPj4+PiArICAgICAgICAoWDg2X1ZFTkRPUl9JTlRFTCB8IFg4Nl9WRU5ET1Jf
Q0VOVEFVUiB8IFg4Nl9WRU5ET1JfU0hBTkdIQUkpICkKPj4+PiAgICAgIHsKPj4+PiAgICAgICAg
ICAvKiBTWVNFTlRFUiBlbnRyeS4gKi8KPj4+PiAgICAgICAgICB3cm1zcmwoTVNSX0lBMzJfU1lT
RU5URVJfRVNQLCBzdGFja19ib3R0b20pOwo+Pj4gSG93IGlzIHRoaXMgaHVuayByZWxhdGVkIHRv
IHRoZSB0aXRsZSBvZiB0aGUgY2hhbmdlPyBJIHRoaW5rIHRoZQo+Pj4gdGl0bGUgd2FudHMgdG8g
YmUgYWRqdXN0ZWQuCj4+Pgo+Pj4gRnVydGhlcm1vcmUgZm9yIGFsbCBvZiB0aGUgY2hhbmdlcyBk
b25lLCB3b3VsZG4ndCB3ZSBiZXR0ZXIKPj4+IHN3aXRjaCB0byB1c2UgY3B1X2hhc19zZXA/IGlu
aXRfYW1kKCkgYXMgd2VsbCBhcyBkZWZhdWx0X2luaXQoKQo+Pj4gYWxyZWFkeSBjbGVhciB0aGlz
IGZsYWcuIEFuZHJldywgdGhvdWdodHM/Cj4+IEkgd29uZGVyZWQgZXhhY3RseSB0aGF0IGFmdGVy
IHF1ZXVpbmcgdGhpcyBwYXRjaCwgYnV0IGRpZG4ndCBnZXQgYXJvdW5kCj4+IHRvIGV4cGVyaW1l
bnRpbmcuCj4+Cj4+IFdlIGhhdmUgdG8gYmUgYSBsaXR0bGUgY2FyZWZ1bCB3aXRoIHRoZSBvcmRl
cmluZyBvZiBvcGVyYXRpb25zLiAKPj4gY3B1X2hhc19zZXAgaXMgdmlzaWJsZSBpbiBDUFVJRCBi
dXQgbmVlZHMgY2xvYmJlcmluZyBpbiBBTUQvSHlnb24gYmVmb3JlCj4+IGNwdV9oYXNfc2VwIGlz
IHNhZmUgdG8gdXNlIChhbHRob3VnaCBmb3IgdGhlIE1TUnMsIGl0IHNob3VsZCBiZSBzYWZlKS4K
PiB0cmFwX2luaXQoKSAoYW5kIGhlbmNlIHBlcmNwdV90cmFwc19pbml0KCkpIHJ1bnMgYWZ0ZXIs
IGluCj4gcGFydGljdWxhciwgaW5pdF9zcGVjdWxhdGlvbl9taXRpZ2F0aW9ucygpLCB3aGljaCBt
ZWFucyBhbGwKPiBmZWF0dXJlIGNvbGxlY3Rpb24gYW5kIG1hc3NhZ2luZyBtdXN0IGhhdmUgaGFw
cGVuZWQuIFNvCj4gdW5sZXNzIHlvdSBleHBsaWNpdGx5IHNheSBvdGhlcndpc2UsIEknZCBsaWtl
IHRvIGFzayBGaW9uYUxpCj4gdG8gc3VibWl0IGEgdjIgd2l0aCB0aGF0IGNoYW5nZSAoYW5kIHdp
dGggdGhlIG90aGVyIGNvc21ldGljCj4gYWRqdXN0bWVudHMgY2FycmllZCBvdXQpLgoKSSdsbCBk
cm9wIHRoaXMgcGF0Y2ggZnJvbSB4ODYtbmV4dC7CoCBPdmVyYWxsLCBJIHRoaW5rIGEgY3B1X2hh
c19zZXAKYmFzZWQgc29sdXRpb24gd291bGQgYmUgcHJlZmVyYWJsZS4KCn5BbmRyZXcKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
