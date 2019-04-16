Return-Path: <SRS0=kbZc=SS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 099E1C10F13
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 19:35:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD02B206BA
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 19:35:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="E0cma/4S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD02B206BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGTr0-0003sm-LD; Tue, 16 Apr 2019 19:34:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VklA=SS=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hGTqz-0003s2-HF
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2019 19:34:49 +0000
X-Inumbo-ID: b248f400-607e-11e9-9096-d7f3b24bea35
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b248f400-607e-11e9-9096-d7f3b24bea35;
 Tue, 16 Apr 2019 19:34:48 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C27A520821;
 Tue, 16 Apr 2019 19:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1555443288;
 bh=TyZQtbiyYFihWsmE+c7spS46zmxg3Vl+aVeoH9NuFjA=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=E0cma/4SmvGT5yCRaTWzv/eavnvU66RvRlWgqq2jE+TUxjIk/hgl5xSzlJPpQGPh/
 lI8dt2IUV1flsc2hO8NJZp3IVc+BMjlSy3z/G9a24GThVFG7UgQP6wcWfpf6oxXOfR
 fUKkrvak3Q7gJG3f4u8Pb/TG7BIrLyWP7kFAlQrc=
Date: Tue, 16 Apr 2019 12:34:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <fce58921-fdab-bb6c-092d-3f9b8a9b1e56@arm.com>
Message-ID: <alpine.DEB.2.10.1904161232570.1370@sstabellini-ThinkPad-X260>
References: <20190329150934.17694-1-jgross@suse.com>
 <20190329150934.17694-2-jgross@suse.com>
 <dd8a9092-f175-b490-3820-d9aa100031fb@arm.com>
 <a2674c24-92bf-28bd-017c-fe250f7617c2@suse.com>
 <fce58921-fdab-bb6c-092d-3f9b8a9b1e56@arm.com>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH RFC 01/49] xen/sched: call
 cpu_disable_scheduler() via cpu notifier
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190416193447.vzrilg50oU79BfVz-np6ikSasB7CluXhxyqc-9oUGf4@z>

T24gTW9uLCAxIEFwciAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGksCj4gCj4gT24gNC8x
LzE5IDEwOjQwIEFNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+ID4gT24gMDEvMDQvMjAxOSAxMToy
MSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gPiBIaSwKPiA+ID4gCj4gPiA+IE9uIDMvMjkvMTkg
MzowOCBQTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiA+ID4gPiBjcHVfZGlzYWJsZV9zY2hlZHVs
ZXIoKSBpcyBiZWluZyBjYWxsZWQgZnJvbSBfX2NwdV9kaXNhYmxlKCkgdG9kYXkuCj4gPiA+ID4g
VGhlcmUgaXMgbm8gbmVlZCB0byBleGVjdXRlIGl0IG9uIHRoZSBjcHUganVzdCBiZWluZyBkaXNh
YmxlZCwgc28gdXNlCj4gPiA+ID4gdGhlIENQVV9ERUFEIGNhc2Ugb2YgdGhlIGNwdSBub3RpZmll
ciBjaGFpbi4gTW92aW5nIHRoZSBjYWxsIG91dCBvZgo+ID4gPiA+IHN0b3BfbWFjaGluZSgpIGNv
bnRleHQgaXMgZmluZSwgYXMgd2UganVzdCBuZWVkIHRvIGhvbGQgdGhlIGRvbWFpbiBSQ1UKPiA+
ID4gPiBsb2NrIGFuZCBuZWVkIHRoZSBzY2hlZHVsZXIgcGVyY3B1IGRhdGEgdG8gYmUgc3RpbGwg
YWxsb2NhdGVkLgo+ID4gPiA+IAo+ID4gPiA+IEFkZCBhbm90aGVyIGhvb2sgZm9yIENQVV9ET1dO
X1BSRVBBUkUgdG8gYmFpbCBvdXQgZWFybHkgaW4gY2FzZQo+ID4gPiA+IGNwdV9kaXNhYmxlX3Nj
aGVkdWxlcigpIHdvdWxkIGZhaWwuIFRoaXMgd2lsbCBhdm9pZCBjcmFzaGVzIGluIHJhcmUKPiA+
ID4gPiBjYXNlcyBmb3IgY3B1IGhvdHBsdWcgb3Igc3VzcGVuZC4KPiA+ID4gPiAKPiA+ID4gPiBX
aGlsZSBhdCBpdCByZW1vdmUgYSBzdXBlcmZsdW91cyBzbXBfbWIoKSBpbiB0aGUgQVJNIF9fY3B1
X2Rpc2FibGUoKQo+ID4gPiA+IGluY2FybmF0aW9uLgo+ID4gPiAKPiA+ID4gVGhpcyBpcyBub3Qg
b2J2aW91cyB3aHkgdGhlIHNtcF9tYigpIGlzIHN1cGVyZmx1b3VzLiBDYW4geW91IHBsZWFzZQo+
ID4gPiBwcm92aWRlIG1vcmUgZGV0YWlscyBvbiB3aHkgdGhpcyBpcyBub3QgbmVjZXNzYXJ5Pwo+
ID4gCj4gPiBjcHVtYXNrX2NsZWFyX2NwdSgpIHNob3VsZCBhbHJlYWR5IGhhdmUgdGhlIG5lZWRl
ZCBzZW1hbnRpY3MsIG5vPwo+ID4gSXQgaXMgYmFzZWQgb24gY2xlYXJfYml0KCkgd2hpY2ggaXMg
ZGVmaW5lZCB0byBiZSBhdG9taWMuCj4gCj4gYXRvbWljaXR5IGRvZXMgbm90IG1lYW4gdGhlIHN0
b3JlL2xvYWQgY2Fubm90IGJlIHJlLW9yZGVyZWQgYnkgdGhlIENQVS4gWW91Cj4gd291bGQgbmVl
ZCBhIGJhcnJpZXIgdG8gcHJldmVudCByZS1vcmRlcmluZy4KPiAKPiBjcHVtYXNrX2NsZWFyX2Nw
dSgpIGFuZCBjbGVhcl9iaXQoKSBkb2VzIG5vdCBjb250YWluIGFueSBiYXJyaWVyLCBzbwo+IHN0
b3JlL2xvYWQgY2FuIGJlIHJlLW9yZGVyZWQuCj4gCj4gSSBzZWUgd2UgaGF2ZSBzaW1pbGFyIHNt
cF9tYigpIGJhcnJpZXIgaW4gX19jcHVfZGllKCkuIFNhZGx5LCB0aGVyZSBhcmUgbm8KPiBkb2N1
bWVudGF0aW9uIGluIHRoZSBjb2RlIHdoeSB0aGUgYmFycmllciBpcyBoZXJlLiBUaGUgbG9ncyBk
b24ndCBoZWxwIGVpdGhlci4KPiAKPiBUaGUgYmFycmllciBoZXJlIHdpbGwgZW5zdXJlIHRoYXQg
dGhlIGxvYWQvc3RvcmUgcmVsYXRlZCB0byBkaXNhYmxpbmcgdGhlIENQVQo+IGFyZSBzZWVuIGJl
Zm9yZSBhbnkgbG9hZC9zdG9yZSBoYXBwZW5pbmcgYWZ0ZXIgdGhlIHJldHVybi4gQWx0aG91Z2gs
IEkgYW0gbm90Cj4gc3VyZSB3aHkgdGhpcyBpcyBuZWNlc3NhcnkuCj4gCj4gU3RlZmFubywgRG8g
eW91IHJlbWVtYmVyIHRoZSByYXRpb25hbGU/CgovbWUgZG9pbmcgc29tZSBhcmNoZW9sb2d5CgpJ
IGFtIHByZXR0eSBzdXJlIGl0IHdhcyBtZWFudCB0byBhY2NvbXBhbnkgdGhlIGNwdW1hc2tfY2xl
YXJfY3B1IGNhbGwuIEkKdGhpbmsgd2Ugc2hvdWxkIGtlZXAgaXQgaW4gX19jcHVfZGlzYWJsZSBy
aWdodCBhZnRlciBjcHVtYXNrX2NsZWFyX2NwdS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
