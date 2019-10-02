Return-Path: <SRS0=BXCD=X3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBEF3C35280
	for <xen-devel@archiver.kernel.org>; Wed,  2 Oct 2019 15:05:22 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2BD22133F
	for <xen-devel@archiver.kernel.org>; Wed,  2 Oct 2019 15:05:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2BD22133F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFgBc-0003un-3t; Wed, 02 Oct 2019 15:05:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bv4y=X3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iFgBa-0003ui-37
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 15:05:02 +0000
X-Inumbo-ID: 0113fc84-e526-11e9-9719-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 0113fc84-e526-11e9-9719-12813bfff9fa;
 Wed, 02 Oct 2019 15:05:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7A112ABBE;
 Wed,  2 Oct 2019 15:04:59 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20190930133238.49868-1-roger.pau@citrix.com>
 <20190930133238.49868-6-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <01650277-2d0c-e519-eda8-41736a7edfbb@suse.com>
Date: Wed, 2 Oct 2019 17:05:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190930133238.49868-6-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 05/10] ioreq: allow dispatching ioreqs to
 internal servers
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
Cc: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org,
 Paul Durrant <paul.durrant@citrix.com>, WeiLiu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDkuMjAxOSAxNTozMiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9odm0vaW9yZXEuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaW9yZXEuYwo+IEBA
IC0xNDgyLDcgKzE0ODIsMTYgQEAgaW50IGh2bV9zZW5kX2lvcmVxKGlvc2VydmlkX3QgaWQsIGlv
cmVxX3QgKnByb3RvX3AsIGJvb2wgYnVmZmVyZWQpCj4gICAgICBBU1NFUlQocyk7Cj4gIAo+ICAg
ICAgaWYgKCBidWZmZXJlZCApCj4gLSAgICAgICAgcmV0dXJuIGh2bV9zZW5kX2J1ZmZlcmVkX2lv
cmVxKHMsIHByb3RvX3ApOwo+ICsgICAgewo+ICsgICAgICAgIGlmICggbGlrZWx5KCFodm1faW9y
ZXFfaXNfaW50ZXJuYWwoaWQpKSApCj4gKyAgICAgICAgICAgIHJldHVybiBodm1fc2VuZF9idWZm
ZXJlZF9pb3JlcShzLCBwcm90b19wKTsKPiArCj4gKyAgICAgICAgQVNTRVJUX1VOUkVBQ0hBQkxF
KCk7Cj4gKyAgICAgICAgcmV0dXJuIFg4NkVNVUxfVU5IQU5ETEVBQkxFOwo+ICsgICAgfQo+ICsK
PiArICAgIGlmICggaHZtX2lvcmVxX2lzX2ludGVybmFsKGlkKSApCj4gKyAgICAgICAgcmV0dXJu
IHMtPmhhbmRsZXIocHJvdG9fcCwgcy0+ZGF0YSk7Cj4gIAo+ICAgICAgaWYgKCB1bmxpa2VseSgh
dmNwdV9zdGFydF9zaHV0ZG93bl9kZWZlcnJhbChjdXJyKSkgKQo+ICAgICAgICAgIHJldHVybiBY
ODZFTVVMX1JFVFJZOwoKV291bGRuJ3QgaXQgYmUgYmV0dGVyIHRvIGhhbmRsZSBpbnRlcm5hbCBv
bmVzIGZpcnN0LCBiZWZvcmUgZXZlbgpsb29raW5nIGF0IHRoZSAiYnVmZmVyZWQiIGlucHV0PyBU
aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIGJ1ZmZlcmVkCmFuZCBub24tYnVmZmVyZWQgZm9yIGV4dGVy
bmFsIG9uZXMgaXMgd2hldGhlciB0byB3YWl0IGZvciBhIHJlcGx5CmlpcmM7IHN1Y2ggYSBkaWZm
ZXJlbmNlIHNpbXBseSBkb2Vzbid0IGV4aXN0IGZvciBpbnRlcm5hbCBvbmVzLgoKSmFuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
