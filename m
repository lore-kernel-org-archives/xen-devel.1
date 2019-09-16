Return-Path: <SRS0=eqFR=XL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 340F6C49ED7
	for <xen-devel@archiver.kernel.org>; Mon, 16 Sep 2019 16:06:21 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B2C02184D
	for <xen-devel@archiver.kernel.org>; Mon, 16 Sep 2019 16:06:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B2C02184D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9tVl-0004uB-Ct; Mon, 16 Sep 2019 16:05:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZJ1s=XL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i9tVj-0004u6-C5
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 16:05:55 +0000
X-Inumbo-ID: dc39eedc-d89b-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dc39eedc-d89b-11e9-978d-bc764e2007e4;
 Mon, 16 Sep 2019 16:05:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6185AAE16;
 Mon, 16 Sep 2019 16:05:53 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190913192759.10795-1-andrew.cooper3@citrix.com>
 <20190913192759.10795-9-andrew.cooper3@citrix.com>
 <a48bd401-32e1-0b7e-4c0b-3509630652ce@suse.com>
 <da0e9474-1467-ef45-6946-256e8c3149d4@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c335e7af-8e23-14fc-1599-d14857ca0acf@suse.com>
Date: Mon, 16 Sep 2019 18:05:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <da0e9474-1467-ef45-6946-256e8c3149d4@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 08/10] tools/libxc: Rework
 xc_cpuid_apply_policy() to use {get, set}_cpu_policy()
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
Cc: Ian Jackson <Ian.Jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMDkuMjAxOSAxNzo0OSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxNi8wOS8yMDE5
IDEyOjE3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMTMuMDkuMjAxOSAyMToyNywgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IC1zdGF0aWMgdm9pZCBpbnRlbF94Y19jcHVpZF9wb2xpY3koY29u
c3Qgc3RydWN0IGNwdWlkX2RvbWFpbl9pbmZvICppbmZvLAo+Pj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBjb25zdCB1bnNpZ25lZCBpbnQgKmlucHV0LCB1bnNpZ25lZCBpbnQg
KnJlZ3MpCj4+PiAtewo+Pj4gLSAgICBzd2l0Y2ggKCBpbnB1dFswXSApCj4+PiAtICAgIHsKPj4+
IC0gICAgY2FzZSAweDAwMDAwMDA0Ogo+Pj4gLSAgICAgICAgLyoKPj4+IC0gICAgICAgICAqIEVB
WFszMToyNl0gaXMgTWF4aW11bSBDb3JlcyBQZXIgUGFja2FnZSAobWludXMgb25lKS4KPj4+IC0g
ICAgICAgICAqIFVwZGF0ZSB0byByZWZsZWN0IHZMQVBJQ19JRCA9IHZDUFVfSUQgKiAyLgo+Pj4g
LSAgICAgICAgICovCj4+PiAtICAgICAgICByZWdzWzBdID0gKCgocmVnc1swXSAmIDB4N2MwMDAw
MDB1KSA8PCAxKSB8IDB4MDQwMDAwMDB1IHwKPj4+IC0gICAgICAgICAgICAgICAgICAgKHJlZ3Nb
MF0gJiAweDNmZnUpKTsKPj4+IC0gICAgICAgIHJlZ3NbM10gJj0gMHgzZmZ1Owo+PiBJIHRoaW5r
IHlvdSB3YW50IHRvIG1lbnRpb24gdGhhdCB0aGUgcmVtb3ZhbCBvZiB0aGlzIG1hc2tpbmcgaXMK
Pj4gaW50ZW50aW9uYWwsIGZvciBpdCBsb29raW5nIGJvZ3VzLiBXaXRoIGFuIGFwcHJvcHJpYXRl
IGFkZGl0aW9uIHRvCj4+IHRoZSBkZXNjcmlwdGlvbgo+PiBSZXZpZXdlZC1ieTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IAo+IEFzIEkgc2FpZCBiZWZvcmUsIEkgZmFpbCB0byBz
ZWUgaG93IHRoYXQgaXNuJ3QgY292ZXJlZCBieSB0aGUgYmxhbmtldAo+ICJhbG1vc3QgYWxsIG9m
IHRoaXMgaXMgcmVkdW5kYW50IiBzdGF0ZW1lbnQuCgpIbW0sIHllcywgZmFpciBlbm91Z2ggLSBy
ZWNhbGN1bGF0ZV9jcHVpZF9wb2xpY3koKSBpbmRlZWQgaGFzIGJlZW4KemFwcGluZyB0aGlzIHRv
IHRoZSBsb3cgdGhyZWUgYml0cyBhbHJlYWR5LgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
