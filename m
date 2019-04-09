Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3194AC10F0E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 10:32:01 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04AD020830
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 10:32:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04AD020830
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDo2b-0003LM-TT; Tue, 09 Apr 2019 10:31:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zDjF=SL=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hDo2b-0003LH-Fb
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 10:31:45 +0000
X-Inumbo-ID: ab862d12-5ab2-11e9-a2c7-1f2757225632
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id ab862d12-5ab2-11e9-a2c7-1f2757225632;
 Tue, 09 Apr 2019 10:31:44 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF0E480D;
 Tue,  9 Apr 2019 03:31:43 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 439093F59C;
 Tue,  9 Apr 2019 03:31:42 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190402164238.1815-1-julien.grall@arm.com>
 <20190402164238.1815-3-julien.grall@arm.com>
 <68f3392e-9bc5-422b-787b-38f5a82c0fa0@citrix.com>
 <5CA467E30200007800224225@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <e623626e-e07f-fb05-f44b-7b298ea69e09@arm.com>
Date: Tue, 9 Apr 2019 11:31:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <5CA467E30200007800224225@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/4] xen/console: Don't treat NUL character
 as the end of the buffer
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190409103140.hcOH7rZTWe-2eEnNWDyvKigcsW176QL-qSKXun4Duc4@z>

SGksCgpPbiAwMy8wNC8yMDE5IDA4OjU5LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAwMi4w
NC4xOSBhdCAxOTo0OSwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+PiBPbiAw
Mi8wNC8yMDE5IDE3OjQyLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+PiBkaWZmIC0tZ2l0IGEveGVu
L2FyY2gvYXJtL2Vhcmx5X3ByaW50ay5jIGIveGVuL2FyY2gvYXJtL2Vhcmx5X3ByaW50ay5jCj4+
PiBpbmRleCA5NzQ2NmExMmIxLi4zNWE0N2M3MjI5IDEwMDY0NAo+Pj4gLS0tIGEveGVuL2FyY2gv
YXJtL2Vhcmx5X3ByaW50ay5jCj4+PiArKysgYi94ZW4vYXJjaC9hcm0vZWFybHlfcHJpbnRrLmMK
Pj4+IEBAIC0xNyw5ICsxNywxMCBAQAo+Pj4gICB2b2lkIGVhcmx5X3B1dGNoKGNoYXIgYyk7Cj4+
PiAgIHZvaWQgZWFybHlfZmx1c2godm9pZCk7Cj4+PiAgIAo+Pj4gLXZvaWQgZWFybHlfcHV0cyhj
b25zdCBjaGFyICpzKQo+Pj4gK3ZvaWQgZWFybHlfcHV0cyhjb25zdCBjaGFyICpzLCB1bnNpZ25l
ZCBpbnQgbnIpCj4+Cj4+IHNpemVfdCBoZXJlIGFuZCBlbHNld2hlcmUgcGxlYXNlLCBiZWNhdXNl
Li4uCj4+Cj4+PiBAQCAtNjY2LDE2ICs2NjQsMTYgQEAgc3RhdGljIGJvb2xfdCBjb25zb2xlX2xv
Y2tzX2J1c3RlZDsKPj4+ICAgCj4+PiAgIHN0YXRpYyB2b2lkIF9fcHV0c3RyKGNvbnN0IGNoYXIg
KnN0cikKPj4+ICAgewo+Pj4gKyAgICBzaXplX3QgbGVuID0gc3RybGVuKHN0cik7Cj4+PiArCj4+
PiAgICAgICBBU1NFUlQoc3Bpbl9pc19sb2NrZWQoJmNvbnNvbGVfbG9jaykpOwo+Pj4gICAKPj4+
IC0gICAgc2VyY29uX3B1dHMoc3RyKTsKPj4+IC0gICAgdmlkZW9fcHV0cyhzdHIpOwo+Pj4gKyAg
ICBzZXJjb25fcHV0cyhzdHIsIGxlbik7Cj4+PiArICAgIHZpZGVvX3B1dHMoc3RyLCBsZW4pOwo+
Pgo+PiAuLi4gdGhpcyBpbnRyb2R1Y2VzIGEgdHJ1bmNhdGlvbiBidWcgZm9yIDY0Yml0IGJ1aWxk
cy4KPj4KPj4gSSBkb24ndCBleHBlY3QgYSA0RyBidWZmZXIgdG8gYmUgcGFzc2VkLCBidXQgaXQg
aXMgbm90IHdvcnRoIGludHJvZHVjaW5nCj4+IHRoZSBwb3NzaWJpbGl0eSBmb3Igc3VjaCBhIHN1
YnRsZSBidWcgaW4gdGhlIGZpcnN0IHBsYWNlLgo+IAo+IEkgZG9uJ3QgZW50aXJlbHkgb2JqZWN0
IHRvIHdoYXQgeW91IHNheSwgYnV0IEkgYWxzbyBkb24ndCB0aGluawo+IHJ1bm5pbmcgaW50byBh
IHRydW5jYXRpb24gc2l0dWF0aW9uIGhlcmUgd291bGQgYmUgYW4gYWN0dWFsCj4gcHJvYmxlbTog
Q29uc2lkZXIgaG93IGxvbmcgaXQgd291bGQgdGFrZSB0byBnZXQgb3V0IHN1Y2ggYQo+IGdpYW50
IHN0cmluZywgbm90IHRvIHNwZWFrIG9mIGl0IGdvaW5nIHRvIHdyYXAgb3VyIGludGVybmFsIHJp
bmcKPiBidWZmZXJzIG1hbnkgdGltZXMuIExvb2tpbmcgYXQgaXQgZnJvbSB0aGF0IGFuZ2xlLCB0
cnVuY2F0aW9uCj4gbWF5IGFjdHVhbGx5IGJlbmVmaWNpYWwgaGVyZTsKClRydW5jYXRpb24gY291
bGQgYmUgZG9uZSBleHBsaWNpdGx5IGluICpfcHV0cyBmdW5jdGlvbnMgaWYgbmVjZXNzYXJ5LiBT
byBJIHdpbGwgCnN3aXRjaCB0byBzaXplX3QgYXMgc3VnZ2VzdGVkIGJ5IEFuZHJldy4KCj4gImxl
biIgbWF5IHdhbnQgdG8gYmUgdW5zaWduZWQgaW50Cj4gYXMgd2VsbCB0aGVuLiBkb19jb25zb2xl
X2lvKCkncyAiY291bnQiIGlzICJpbnQiIGFzIHdlbGwgKHNob3VsZAo+IHJlYWxseSBiZSAidW5z
aWduZWQgaW50IiBpbW8sIGp1c3QgbGlrZSAiY21kIikuCgpJIHdpbGwgbG9vayBhdCB3cml0aW5n
IGEgcGF0Y2ggdG8gc3dpdGNoIGRvX2NvbnNvbGVfaW8oKSB0byB1bnNpZ25lZCBpbnQuCgpDaGVl
cnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
