Return-Path: <SRS0=pR42=W7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2C5BC3A5A7
	for <xen-devel@archiver.kernel.org>; Wed,  4 Sep 2019 08:40:43 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC9BB20870
	for <xen-devel@archiver.kernel.org>; Wed,  4 Sep 2019 08:40:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC9BB20870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5Qq8-0006ly-4j; Wed, 04 Sep 2019 08:40:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Tt/v=W7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i5Qq7-0006lq-Ch
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 08:40:31 +0000
X-Inumbo-ID: a683d538-ceef-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a683d538-ceef-11e9-978d-bc764e2007e4;
 Wed, 04 Sep 2019 08:40:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6837CADFE;
 Wed,  4 Sep 2019 08:40:29 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190829101846.21369-1-jgross@suse.com>
 <20190829101846.21369-6-jgross@suse.com>
 <87905a2d-acd5-90b7-1c40-bf81f5ac005b@suse.com>
 <75a52d2d-a482-c62d-8d30-b02aba00d349@suse.com>
 <2a7b100c-2403-6bf2-7a73-3f2b0a2461a4@suse.com>
 <2ff6e052-9e29-b121-800d-6fe0a0f14ee4@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <213ff1eb-1ced-5530-b46c-0e82cb8164a7@suse.com>
Date: Wed, 4 Sep 2019 10:40:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2ff6e052-9e29-b121-800d-6fe0a0f14ee4@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 5/5] xen: modify several static locks to
 unique names
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDkuMjAxOSAxMDoyNSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAwMy4wOS4xOSAx
NzowOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDAzLjA5LjIwMTkgMTc6MDMsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiBPbiAwMy4wOS4xOSAxNjo1MywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+
Pj4gT24gMjkuMDguMjAxOSAxMjoxOCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+Pj4gSW4gb3Jk
ZXIgdG8gaGF2ZSB1bmlxdWUgbmFtZXMgd2hlbiBkb2luZyBsb2NrIHByb2ZpbGluZyBzZXZlcmFs
IGxvY2FsCj4+Pj4+IGxvY2tzICJsb2NrIiBuZWVkIHRvIGJlIHJlbmFtZWQuCj4+Pj4KPj4+PiBC
dXQgdGhlc2UgYXJlIGFsbCBuYW1lZCBzaW1wbHkgImxvY2siIGZvciBhIGdvb2QgcmVhc29uLCBp
bmNsdWRpbmcKPj4+PiBiZWNhdXNlIHRoZXkncmUgYWxsIGZ1bmN0aW9uIHNjb3BlIHN5bWJvbHMg
KGFuZCB0eXBpY2FsbHkgdGhlCj4+Pj4gZnVuY3Rpb25zIGFyZSBhbGwgc3VmZmljaWVudGx5IHNo
b3J0KS4gVGhlIGlzc3VlIHN0ZW1zIGZyb20gdGhlCj4+Pj4gZHVhbCB1c2Ugb2YgIm5hbWUiIGlu
Cj4+Pj4KPj4+PiAjZGVmaW5lIF9MT0NLX1BST0ZJTEUobmFtZSkgeyAwLCAjbmFtZSwgJm5hbWUs
IDAsIDAsIDAsIDAsIDAgfQo+Pj4+Cj4+Pj4gc28gSSdkIHJhdGhlciBzdWdnZXN0IG1ha2luZyB0
aGlzIGEgZGVyaXZhdGlvbiBvZiBhIG5ldwo+Pj4+Cj4+Pj4gI2RlZmluZSBfTE9DS19QUk9GSUxF
X05BTUUobG9jaywgbmFtZSkgeyAwLCAjbmFtZSwgJmxvY2ssIDAsIDAsIDAsIDAsIDAgfQo+Pj4+
Cj4+Pj4gaWYgdGhlcmUncyBubyBvdGhlciAodHJhbnNwYXJlbnQpIHdheSBvZiBkaXNhbWJpZ3Vh
dGluZyB0aGUgbmFtZXMuCj4+Pgo+Pj4gVGhpcyB3aWxsIHJlcXVpcmUgdG8gdXNlIGEgZGlmZmVy
ZW50IERFRklORV9TUElOTE9DSygpIHZhcmlhbnQsIHNvIGUuZy4KPj4+IERFRklORV9TUElOTE9D
S19MT0NBTCgpLCB3aGljaCB3aWxsIHRoZW4gaW5jbHVkZSB0aGUgbmVlZGVkICJzdGF0aWMiIGFu
ZAo+Pj4gYWRkICJAPGZ1bmM+IiB0byB0aGUgbG9jayBwcm9maWxpbmcgbmFtZS4gSXMgdGhpcyBv
a2F5Pwo+Pgo+PiBUbyBiZSBmcmFuayAtIG5vdCByZWFsbHkuIEkgZGlzbGlrZSBib3RoLCBhbmQg
d291bGQgaGVuY2UgcHJlZmVyIHRvCj4+IHN0aWNrIHRvIHdoYXQgdGhlcmUgaXMgY3VycmVudGx5
LCB1bnRpbCBzb21lb25lIGludmVudHMgYSB0cmFuc3BhcmVudAo+PiB3YXkgdG8gZGlzYW1iaWd1
YXRlIHRoZXNlLiBJJ20gc29ycnkgZm9yIGJlaW5nIHVuaGVscGZ1bCBoZXJlLgo+IAo+IEkgdGhp
bmsgSSBoYXZlIGZvdW5kIGEgd2F5OiBJIGNvdWxkIGFkZCBfX0ZJTEVfXyBhbmQgX19MSU5FX18g
ZGF0YSB0bwo+IHN0cnVjdCBsb2NrX3Byb2ZpbGUuIEluIGxvY2tfcHJvZl9pbml0KCkgSSBjb3Vs
ZCBsb29rIGZvciBub24tdW5pcXVlCj4gbG9jayBuYW1lcyBhbmQgbWFyayB0aG9zZSB0byBiZSBw
cmludGVkIHdpdGggdGhlIF9fRklMRV9fIGFuZCBfX0xJTkVfXwo+IGRhdGEgYWRkZWQgdG8gdGhl
IG5hbWVzLgo+IAo+IFdvdWxkIHlvdSBiZSBmaW5lIHdpdGggdGhpcyBhcHByb2FjaD8KCkkgd291
bGQgYmUsIGJ1dCBJJ20gYWZyYWlkIEFuZHJldyB3b24ndCAoYXMgd2l0aCBhbnkgbmV3IHVzZXMg
b2YgX19MSU5FX18pLgpJIHdvbmRlciBpZiBfX2Z1bmNfXyBvciBfX0ZVTkNUSU9OX18gY291bGQg
YmUgdXNlZCAtIHRoZSBtYWluIHF1ZXN0aW9uIGlzCmhvdyB0aGV5IGJlaGF2ZSB3aGVuIHVzZWQg
b3V0c2lkZSBvZiBhIGZ1bmN0aW9uLiBJZiBlaXRoZXIgd291bGQgYmUgTlVMTAoocmF0aGVyIHRo
YW4gdHJpZ2dlcmluZyBhIGRpYWdub3N0aWMpLCBpdCBtaWdodCBiZSB1c2FibGUgaGVyZS4gT2Yg
Y291cnNlCnRoaXMgd291bGQgYmUgZnJhZ2lsZSBpZiBqdXN0IGJhc2VkIG9uIG9ic2VydmVkIChy
YXRoZXIgdGhhbiBkb2N1bWVudGVkKQpiZWhhdmlvci4KCkphbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
