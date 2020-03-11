Return-Path: <SRS0=Ft0f=44=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70826C10F27
	for <xen-devel@archiver.kernel.org>; Wed, 11 Mar 2020 09:25:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4882C20828
	for <xen-devel@archiver.kernel.org>; Wed, 11 Mar 2020 09:25:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4882C20828
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBxby-0004so-Qk; Wed, 11 Mar 2020 09:25:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Lkak=44=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jBxbx-0004sj-En
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2020 09:25:09 +0000
X-Inumbo-ID: 330efe64-637a-11ea-92cf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 330efe64-637a-11ea-92cf-bc764e2007e4;
 Wed, 11 Mar 2020 09:25:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E5239AB3D;
 Wed, 11 Mar 2020 09:25:06 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20200310072853.27567-1-jgross@suse.com>
 <20200310072853.27567-4-jgross@suse.com>
 <3e1435c3-8320-184b-d097-2a6db011e084@suse.com>
 <dc9222df-3525-f225-ad76-9489c0886fe1@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8ea39077-c616-c0b4-52b6-3c511ca4f064@suse.com>
Date: Wed, 11 Mar 2020 10:25:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <dc9222df-3525-f225-ad76-9489c0886fe1@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 3/6] xen: add
 process_pending_softirqs_norcu() for keyhandlers
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMDMuMjAyMCAwNzowNywgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAxMC4wMy4yMCAx
ODowMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDEwLjAzLjIwMjAgMDg6MjgsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvcGNpX2Ft
ZF9pb21tdS5jCj4+PiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvcGNpX2FtZF9p
b21tdS5jCj4+PiBAQCAtNTg3LDcgKzU4Nyw3IEBAIHN0YXRpYyB2b2lkIGFtZF9kdW1wX3AybV90
YWJsZV9sZXZlbChzdHJ1Y3QgcGFnZV9pbmZvKiBwZywgaW50IGxldmVsLAo+Pj4gICAgICAgICAg
IHN0cnVjdCBhbWRfaW9tbXVfcHRlICpwZGUgPSAmdGFibGVfdmFkZHJbaW5kZXhdOwo+Pj4gICAK
Pj4+ICAgICAgICAgICBpZiAoICEoaW5kZXggJSAyKSApCj4+PiAtICAgICAgICAgICAgcHJvY2Vz
c19wZW5kaW5nX3NvZnRpcnFzKCk7Cj4+PiArICAgICAgICAgICAgcHJvY2Vzc19wZW5kaW5nX3Nv
ZnRpcnFzX25vcmN1KCk7Cj4+Cj4+IEF0IHRoZSBleGFtcGxlIG9mIHRoaXMgLSB0aGUgcHJvcGVy
dHkgb2YgaG9sZGluZyBhbiBSQ1UgbG9jayBpcwo+PiBlbnRpcmVseSBpbnZpc2libGUgaGVyZSwg
YXMgaXQncyB0aGUgZ2VuZXJpYwo+PiBpb21tdV9kdW1wX3AybV90YWJsZSgpIHdoaWNoIGFjcXVp
cmVzIGl0LiBUaGlzIHN1Z2dlc3QgdG8gbWUgdGhhdAo+PiBnb2luZyBmb3J3YXJkIGJyZWFraW5n
IHRoaXMgaXMgZ29pbmcgdG8gYmUgdmVyeSBsaWtlbHkuIENvdWxkbid0Cj4+IHByb2Nlc3NfcGVu
ZGluZ19zb2Z0aXJxcygpIGV4Y2x1ZGUgUkNVIGhhbmRsaW5nIHdoZW4gZmluZGluZwo+PiBwcmVl
bXB0X2NvdW50KCkgdG8gcmV0dXJuIG5vbi16ZXJvPwo+IAo+IFRoaXMgY2FuIGJlIGRvbmUsIGJ1
dCB0aGVuIHRoZSBub24tZGVidWcgYnVpbGQgd291bGQgcmVxdWlyZSB0byBoYXZlCj4gbm9uLWVt
cHR5IHJjdSBsb2NrIGZ1bmN0aW9ucy4KCkkgZ3Vlc3MgSSBkb24ndCB1bmRlcnN0YW5kIC0gSSBz
ZWUgb25seSBvbmUgdmVyc2lvbiBvZiB0aGVtOgoKI2RlZmluZSByY3VfcmVhZF9sb2NrKHgpICAg
ICAgICh7ICgodm9pZCkoeCkpOyBwcmVlbXB0X2Rpc2FibGUoKTsgfSkKI2RlZmluZSByY3VfcmVh
ZF91bmxvY2soeCkgICAgICh7ICgodm9pZCkoeCkpOyBwcmVlbXB0X2VuYWJsZSgpOyB9KQoKU2Ft
ZSBmb3IgdGhlIHByZWVtcHQgY291bnQgYWRqdXN0bWVudCBvcGVyYXRpb25zLgoKSmFuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
