Return-Path: <SRS0=wySQ=WX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A22EBC3A5A3
	for <xen-devel@archiver.kernel.org>; Tue, 27 Aug 2019 06:14:03 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7ADA62173E
	for <xen-devel@archiver.kernel.org>; Tue, 27 Aug 2019 06:14:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7ADA62173E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2Ujf-0005ld-RO; Tue, 27 Aug 2019 06:13:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7YVi=WX=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i2Ujf-0005lY-1E
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 06:13:43 +0000
X-Inumbo-ID: d07d9ed2-c891-11e9-ae2c-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d07d9ed2-c891-11e9-ae2c-12813bfff9fa;
 Tue, 27 Aug 2019 06:13:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 289BFB647;
 Tue, 27 Aug 2019 06:13:40 +0000 (UTC)
To: Dongli Zhang <dongli.zhang@oracle.com>, xen-devel@lists.xenproject.org
References: <c45b306e-c67b-49f5-8fe8-3913557a8774@default>
From: Juergen Gross <jgross@suse.com>
Message-ID: <130ea0ab-4364-2b77-dc8d-b869e06d1768@suse.com>
Date: Tue, 27 Aug 2019 08:13:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c45b306e-c67b-49f5-8fe8-3913557a8774@default>
Content-Language: en-US
Subject: Re: [Xen-devel] Question on xen-netfront code to fix a potential
 ring buffer corruption
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
Cc: netdev@vger.kernel.org, Joe Jin <joe.jin@oracle.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMDguMTkgMTA6MzEsIERvbmdsaSBaaGFuZyB3cm90ZToKPiBIaSwKPiAKPiBXb3VsZCB5
b3UgcGxlYXNlIGhlbHAgY29uZmlybSB3aHkgdGhlIGNvbmRpdGlvbiBhdCBsaW5lIDkwOCBpcyAi
Pj0iPwo+IAo+IEluIG15IG9waW5pb24sIHdlIHdvdWxkIG9ubHkgaGl0ICJza2Jfc2hpbmZvKHNr
YiktPm5yX2ZyYWcgPT0gTUFYX1NLQl9GUkFHUyIgYXQKPiBsaW5lIDkwOC4KPiAKPiA4OTAgc3Rh
dGljIFJJTkdfSURYIHhlbm5ldF9maWxsX2ZyYWdzKHN0cnVjdCBuZXRmcm9udF9xdWV1ZSAqcXVl
dWUsCj4gODkxICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qgc2tfYnVm
ZiAqc2tiLAo+IDg5MiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHNr
X2J1ZmZfaGVhZCAqbGlzdCkKPiA4OTMgewo+IDg5NCAgICAgICAgIFJJTkdfSURYIGNvbnMgPSBx
dWV1ZS0+cngucnNwX2NvbnM7Cj4gODk1ICAgICAgICAgc3RydWN0IHNrX2J1ZmYgKm5za2I7Cj4g
ODk2Cj4gODk3ICAgICAgICAgd2hpbGUgKChuc2tiID0gX19za2JfZGVxdWV1ZShsaXN0KSkpIHsK
PiA4OTggICAgICAgICAgICAgICAgIHN0cnVjdCB4ZW5fbmV0aWZfcnhfcmVzcG9uc2UgKnJ4ID0K
PiA4OTkgICAgICAgICAgICAgICAgICAgICAgICAgUklOR19HRVRfUkVTUE9OU0UoJnF1ZXVlLT5y
eCwgKytjb25zKTsKPiA5MDAgICAgICAgICAgICAgICAgIHNrYl9mcmFnX3QgKm5mcmFnID0gJnNr
Yl9zaGluZm8obnNrYiktPmZyYWdzWzBdOwo+IDkwMQo+IDkwMiAgICAgICAgICAgICAgICAgaWYg
KHNrYl9zaGluZm8oc2tiKS0+bnJfZnJhZ3MgPT0gTUFYX1NLQl9GUkFHUykgewo+IDkwMyAgICAg
ICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgcHVsbF90byA9IE5FVEZST05UX1NLQl9D
Qihza2IpLT5wdWxsX3RvOwo+IDkwNAo+IDkwNSAgICAgICAgICAgICAgICAgICAgICAgICBCVUdf
T04ocHVsbF90byA8IHNrYl9oZWFkbGVuKHNrYikpOwo+IDkwNiAgICAgICAgICAgICAgICAgICAg
ICAgICBfX3Bza2JfcHVsbF90YWlsKHNrYiwgcHVsbF90byAtIHNrYl9oZWFkbGVuKHNrYikpOwo+
IDkwNyAgICAgICAgICAgICAgICAgfQo+IDkwOCAgICAgICAgICAgICAgICAgaWYgKHVubGlrZWx5
KHNrYl9zaGluZm8oc2tiKS0+bnJfZnJhZ3MgPj0gTUFYX1NLQl9GUkFHUykpIHsKPiA5MDkgICAg
ICAgICAgICAgICAgICAgICAgICAgcXVldWUtPnJ4LnJzcF9jb25zID0gKytjb25zOwo+IDkxMCAg
ICAgICAgICAgICAgICAgICAgICAgICBrZnJlZV9za2IobnNrYik7Cj4gOTExICAgICAgICAgICAg
ICAgICAgICAgICAgIHJldHVybiB+MFU7Cj4gOTEyICAgICAgICAgICAgICAgICB9Cj4gOTEzCj4g
OTE0ICAgICAgICAgICAgICAgICBza2JfYWRkX3J4X2ZyYWcoc2tiLCBza2Jfc2hpbmZvKHNrYikt
Pm5yX2ZyYWdzLAo+IDkxNSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNrYl9mcmFn
X3BhZ2UobmZyYWcpLAo+IDkxNiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJ4LT5v
ZmZzZXQsIHJ4LT5zdGF0dXMsIFBBR0VfU0laRSk7Cj4gOTE3Cj4gOTE4ICAgICAgICAgICAgICAg
ICBza2Jfc2hpbmZvKG5za2IpLT5ucl9mcmFncyA9IDA7Cj4gOTE5ICAgICAgICAgICAgICAgICBr
ZnJlZV9za2IobnNrYik7Cj4gOTIwICAgICAgICAgfQo+IDkyMQo+IDkyMiAgICAgICAgIHJldHVy
biBjb25zOwo+IDkyMyB9Cj4gCj4gCj4gVGhlIHJlYXNvbiB0aGF0IEkgYXNrIGFib3V0IHRoaXMg
aXMgYmVjYXVzZSBJIGFtIGNvbnNpZGVyaW5nIGJlbG93IHBhdGNoIHRvCj4gYXZvaWQgYSBwb3Rl
bnRpYWwgeGVuLW5ldGZyb250IHJpbmcgYnVmZmVyIGNvcnJ1cHRpb24uCj4gCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbmV0L3hlbi1uZXRmcm9udC5jIGIvZHJpdmVycy9uZXQveGVuLW5ldGZyb250
LmMKPiBpbmRleCA4ZDMzOTcwLi40OGEyMTYyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbmV0L3hl
bi1uZXRmcm9udC5jCj4gKysrIGIvZHJpdmVycy9uZXQveGVuLW5ldGZyb250LmMKPiBAQCAtOTA2
LDcgKzkwNiw3IEBAIHN0YXRpYyBSSU5HX0lEWCB4ZW5uZXRfZmlsbF9mcmFncyhzdHJ1Y3QgbmV0
ZnJvbnRfcXVldWUgKnF1ZXVlLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICBfX3Bza2JfcHVs
bF90YWlsKHNrYiwgcHVsbF90byAtIHNrYl9oZWFkbGVuKHNrYikpOwo+ICAgICAgICAgICAgICAg
ICAgfQo+ICAgICAgICAgICAgICAgICAgaWYgKHVubGlrZWx5KHNrYl9zaGluZm8oc2tiKS0+bnJf
ZnJhZ3MgPj0gTUFYX1NLQl9GUkFHUykpIHsKPiAtICAgICAgICAgICAgICAgICAgICAgICBxdWV1
ZS0+cngucnNwX2NvbnMgPSArK2NvbnM7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgcXVldWUt
PnJ4LnJzcF9jb25zID0gY29ucyArIHNrYl9xdWV1ZV9sZW4obGlzdCkgKyAxOwo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICBrZnJlZV9za2IobnNrYik7Cj4gICAgICAgICAgICAgICAgICAgICAg
ICAgIHJldHVybiB+MFU7Cj4gICAgICAgICAgICAgICAgICB9Cj4gCj4gCj4gSWYgdGhlcmUgaXMg
c2tiIGxlZnQgaW4gbGlzdCB3aGVuIHdlIHJldHVybiB+MFUsIHF1ZXVlLT5yeC5yc3BfY29ucyBt
YXkgYmUgc2V0Cj4gaW5jb3JyZWN0bHkuCgpTYSBiYXNpY2FsbHkgeW91IHdhbnQgdG8gY29uc3Vt
ZSB0aGUgcmVzcG9uc2VzIGZvciBhbGwgb3V0c3RhbmRpbmcgc2ticwppbiB0aGUgbGlzdD8KCj4g
Cj4gV2hpbGUgSSBhbSB0cnlpbmcgdG8gbWFrZSB1cCBhIGNhc2UgdGhhdCB3b3VsZCBoaXQgdGhl
IGNvcnJ1cHRpb24sIEkgY291bGQgbm90Cj4gZXhwbGFpbiB3aHkgKHVubGlrZWx5KHNrYl9zaGlu
Zm8oc2tiKS0+bnJfZnJhZ3MgPj0gTUFYX1NLQl9GUkFHUykpLCBidXQgbm90Cj4ganVzdCAiPT0i
LiBQZXJoYXBzIF9fcHNrYl9wdWxsX3RhaWwoKSBtYXkgZmFpbCBhbHRob3VnaCBwdWxsX3RvIGlz
IGxlc3MgdGhhbgo+IHNrYl9oZWFkbGVuKHNrYikuCgpJIGRvbid0IHRoaW5rIG5yX2ZyYWdzIGNh
biBiZSBsYXJnZXIgdGhhbiBNQVhfU0tCX0ZSQUdTLiBPVE9IIEkgZG9uJ3QKdGhpbmsgaXQgaHVy
dHMgdG8gaGF2ZSBhIHNhZmV0eSBuZXQgaGVyZSBpbiBvcmRlciB0byBhdm9pZCBwcm9ibGVtcy4K
Ck9yaWdpbmFsbHkgdGhpcyB3YXMgQlVHX09OKHNrYl9zaGluZm8oc2tiKS0+bnJfZnJhZ3MgPj0g
TUFYX1NLQl9GUkFHUykKc28gdGhhdCBtaWdodCBleHBsYWluIHRoZSAiPj0iLgoKCkp1ZXJnZW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
