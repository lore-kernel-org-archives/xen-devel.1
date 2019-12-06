Return-Path: <SRS0=WOnx=Z4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F781C43603
	for <xen-devel@archiver.kernel.org>; Fri,  6 Dec 2019 16:42:43 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 246F921835
	for <xen-devel@archiver.kernel.org>; Fri,  6 Dec 2019 16:42:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 246F921835
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1idGgP-0004IT-0m; Fri, 06 Dec 2019 16:42:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=z/5o=Z4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1idGgN-0004IO-Fo
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2019 16:42:19 +0000
X-Inumbo-ID: 5c69e1ef-1847-11ea-8394-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5c69e1ef-1847-11ea-8394-12813bfff9fa;
 Fri, 06 Dec 2019 16:42:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6C9BDB1A4;
 Fri,  6 Dec 2019 16:42:17 +0000 (UTC)
To: Julien Grall <julien@xen.org>
References: <aa92bd0c-f35c-2bf3-d665-4977f83bb0d5@suse.com>
 <8dc4166d-45c3-0a5c-8782-78de1b74ad36@xen.org>
 <271f8148-e74a-3d3b-375d-991d7cb9e475@suse.com>
 <eb8c5538-0a7b-fef5-01b6-6458b3b5d24c@xen.org>
 <dbfdc420-5755-5298-fc9c-7ac21a521d13@suse.com>
 <787c1ac3-a4b2-da01-b444-af030a5a49bc@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7716910a-b3ee-32f1-cdf7-def1a8f258f4@suse.com>
Date: Fri, 6 Dec 2019 17:42:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <787c1ac3-a4b2-da01-b444-af030a5a49bc@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] cmdline: treat hyphens and underscores the
 same
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMTIuMjAxOSAxNzoyMCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDA2
LzEyLzIwMTkgMTY6MDYsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBPbiAwNi4xMi4yMDE5IDE1OjQ2
LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+PiBPbiAwNS8xMi8yMDE5IDE2OjUwLCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+PiBPbiAwNS4xMi4yMDE5IDE3OjI3LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+
Pj4+IE9uIDA1LzEyLzIwMTkgMTU6MzMsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gKy8qCj4+
Pj4+PiArICogU3RyaW5nIGNvbXBhcmlzb24gZnVuY3Rpb25zIG1vc3RseSBtYXRjaGluZyBzdHJj
bXAoKSAvIHN0cm5jbXAoKSwKPj4+Pj4+ICsgKiBleGNlcHQgdGhhdCB0aGV5IHRyZWF0ICctJyBh
bmQgJ18nIGFzIG1hdGNoaW5nIG9uZSBhbm90aGVyLgo+Pj4+Pj4gKyAqLwo+Pj4+Pj4gK3N0YXRp
YyBpbnQgX3N0cmNtcChjb25zdCBjaGFyICpzMSwgY29uc3QgY2hhciAqczIpCj4+Pj4+Cj4+Pj4+
IEkgdGhvdWdodCB3ZSB3ZXJlIHRyeWluZyB0byBhdm9pZCBuZXcgZnVuY3Rpb24gbmFtZSB3aXRo
IGxlYWRpbmcgXz8KPj4+Pgo+Pj4+IFdlJ3JlIHRyeWluZyB0byBhdm9pZCBuZXcgbmFtZSBzcGFj
ZSB2aW9sYXRpb25zLiBTdWNoIGFyZQo+Pj4+IC0gaWRlbnRpZmllcnMgc3RhcnRpbmcgd2l0aCB0
d28gdW5kZXJzY29yZXMsCj4+Pj4gLSBpZGVudGlmaWVycyBzdGFydGluZyB3aXRoIGFuIHVuZGVy
c2NvcmUgYW5kIGFuIHVwcGVyIGNhc2UgbGV0dGVyLAo+Pj4+IC0gaWRlbnRpZmllcnMgb2Ygbm9u
LXN0YXRpYyBzeW1ib2xzIHN0YXJ0aW5nIHdpdGggYW4gdW5kZXJzY29yZS4KPj4+Cj4+PiBJIGFt
IG5vdCBzdXJlIHRvIHVuZGVyc3RhbmQgd2h5IG5vbi1zdGF0aWMgc3ltYm9scyBvbmx5LiBUaGlz
IHdvdWxkCj4+PiBwcmV2ZW50IHlvdSB0byB1c2UgdGhlIHRoZSBub24tc3RhdGljIHN5bWJvbCBp
ZiB5b3UgaGFwcGVuIHRvIHJlLXVzZSB0aGUKPj4+IHNhbWUgbmFtZS4KPj4KPj4gSSdtIGFmcmFp
ZCBJIGRvbid0IHVuZGVyc3RhbmQuIEFueXdheSAtIHdoYXQgSSd2ZSBsaXN0ZWQgYWJvdmUgaXMK
Pj4gd2hhdCB0aGUgbGFuZ3VhZ2Ugc3RhbmRhcmQgbWFuZGF0ZXMuCj4gQUZBSVUsIGZvciBhIGdp
dmVuIHVuaXQsIHRoZXJlIGlzIG9ubHkgb25lIHBvb2wgb2YgaWRlbnRpZmllcnMuIFNvIHlvdSAK
PiBjb3VsZCBub3QgaGF2ZSBhbiBpZGVudGlmaWVyIHVzZWQgYXQgdGhlIHNhbWUgdGltZSBieSBh
IG5vbi1zdGF0aWMgYW5kIGEgCj4gc3RhdGljIHN5bWJvbCAodGhhdCdzIGV4Y2x1c2luZyB0aGUg
d2VhayBhdHRyaWJ1dGUpLiBTbyBpdCBmZWVscyAKPiBzbGlnaHRseSBzdHJhbmdlIHRvIG9ubHkg
Y292ZXIgdGhlIG5vbi1zdGF0aWMgc3ltYm9scy4KCkkgZ3Vlc3MgSSdtIHN0aWxsIG5vdCBnZXR0
aW5nIHlvdXIgcG9pbnQuIFdoYXQgdGhlIGFib3ZlIHRlbGxzCnVzIGlzIHRoYXQgc3RhdGljIHN5
bWJvbHMgbWF5IHN0YXJ0IHdpdGggYW4gdW5kZXJzY29yZSAoYnV0Cm5vdCBmb2xsb3dlZCBieSBh
bm90aGVyIG9uZSBvciBhbiB1cHBlcmNhc2UgbGV0dGVyKS4gTm9uLXN0YXRpYwpzeW1ib2xzIG1h
eSBub3QuCgo+Pj4gQW55d2F5LCBob3cgYWJvdXQgY2FsbGluZyBpdCBjbWRsaW5lX3N0cm5jbXAo
KT8gVGhpcyB3b3VsZCBiZSBlYXNpZXIgdG8KPj4+IHNwb3QgbWlzdXNlIG9uIHJldmlldyAoaS5l
IHVzaW5nIHN0cm5jbXAoKSByYXRoZXIgdGhhbiBfc3RybmNtcCgpKS4KPj4KPj4gV2UgYWxyZWFk
eSBoYXZlIGNtZGxpbmVfc3RyY21wKCksIG9yIGVsc2UgSSB3b3VsZCBpbmRlZWQgaGF2ZSB1c2Vk
Cj4+IHRoaXMgcHJlZml4LiBObyBwcmVmaXggKG90aGVyIHRoYW4gdGhlIGxvbmUgdW5kZXJzY29y
ZSkgc2VlbWVkIHRoZQo+PiBuZXh0IGJlc3Qgb3B0aW9uLgo+IAo+IEFzIHdlIHBhcnNlIGFuIG9w
dGlvbiwgaG93IGFib3V0IG9wdF9zdHJuY21wKCk/CgpJJ2Qgc3RpbGwgbGlrZSBfc3RybmNtcCgp
IGJldHRlciBoZXJlLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
