Return-Path: <SRS0=q1ly=3F=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F1FFC33CB1
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jan 2020 16:36:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C707206D9
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jan 2020 16:36:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=tklengyel.com header.i=@tklengyel.com header.b="jIgWWcOU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C707206D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tklengyel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1is87T-0003dD-Pu; Thu, 16 Jan 2020 16:35:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rOjP=3F=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1is87R-0003d8-Mm
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 16:35:41 +0000
X-Inumbo-ID: 363417ea-387e-11ea-a2eb-bc764e2007e4
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 363417ea-387e-11ea-a2eb-bc764e2007e4;
 Thu, 16 Jan 2020 16:35:31 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1579192532; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=Wx+ZjO0vsjPR1aocVoakW/99JDZ54y9uOj/lts6N8fw=;
 b=jIgWWcOUGA0Xs7fvKJyIaE8SZ0IDhS5OavM0KcGWbCO9et4Oi5w/7AzXxnJuYHz4f8L3xsjA
 ArgFIhBMnjEPSkqnvvHk4yHrasKvDd9Ibu5wPRCqF6C8JZA681e26SYJsK65IPFYZELLkNK3
 UBio0oOYZRGIjQTWBqzqo5H9cho=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mxa.mailgun.org with ESMTP id 5e2090ce.7fe46662b630-smtp-out-n03;
 Thu, 16 Jan 2020 16:35:26 -0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id t2so19838412wrr.1
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jan 2020 08:35:25 -0800 (PST)
X-Gm-Message-State: APjAAAWNdW+eLlKmj0MlQpm+xvrxqFTk+Cg8Hd3FaDjam6TzPHjWeRH4
 mOtDIksNAVhoUKrbyHlb8YN+fzbNmG9YTH75bck=
X-Google-Smtp-Source: APXvYqzpIxjpRRoolUYHzIv74/vcMDp4nrIxU7w6uvyOtwt9I8dp8+ZuxmRQMvdH19xsgCZsfaQv3FfFQkk/CdtBFgI=
X-Received: by 2002:adf:9c8f:: with SMTP id d15mr4261774wre.390.1579192524133; 
 Thu, 16 Jan 2020 08:35:24 -0800 (PST)
MIME-Version: 1.0
References: <cover.1578503483.git.tamas.lengyel@intel.com>
 <4e285f09f6c68deccf009b16c86898a78e349997.1578503483.git.tamas.lengyel@intel.com>
 <b0ceeb51-62ca-9d03-1caa-b258182991ec@suse.com>
In-Reply-To: <b0ceeb51-62ca-9d03-1caa-b258182991ec@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 16 Jan 2020 09:34:48 -0700
X-Gmail-Original-Message-ID: <CABfawhkk=rNdUgdLker_miiwobJNwt5R10ZZfC4__mQW_NqEeA@mail.gmail.com>
Message-ID: <CABfawhkk=rNdUgdLker_miiwobJNwt5R10ZZfC4__mQW_NqEeA@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH v4 12/18] x86/mem_sharing: Enable
 mem_sharing on first memop
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
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gMTYsIDIwMjAgYXQgOToxOCBBTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gMDguMDEuMjAyMCAxODoxNCwgVGFtYXMgSyBMZW5neWVsIHdy
b3RlOgo+ID4gSXQgaXMgd2FzdGVmdWwgdG8gcmVxdWlyZSBzZXBhcmF0ZSBoeXBlcmNhbGxzIHRv
IGVuYWJsZSBzaGFyaW5nIG9uIGJvdGggdGhlCj4gPiBwYXJlbnQgYW5kIHRoZSBjbGllbnQgZG9t
YWluIGR1cmluZyBWTSBmb3JraW5nLiBUbyBzcGVlZCB0aGluZ3MgdXAgd2UgZW5hYmxlCj4gPiBz
aGFyaW5nIG9uIHRoZSBmaXJzdCBtZW1vcCBpbiBjYXNlIGl0IHdhc24ndCBhbHJlYWR5IGVuYWJs
ZWQuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogVGFtYXMgSyBMZW5neWVsIDx0YW1hcy5sZW5neWVs
QGludGVsLmNvbT4KPiA+IC0tLQo+ID4gIHhlbi9hcmNoL3g4Ni9tbS9tZW1fc2hhcmluZy5jIHwg
MzYgKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0KPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgMjIgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL3g4Ni9tbS9tZW1fc2hhcmluZy5jIGIveGVuL2FyY2gveDg2L21tL21lbV9zaGFy
aW5nLmMKPiA+IGluZGV4IDNmMzZjZDZiYmMuLmI4YTkyMjhlY2YgMTAwNjQ0Cj4gPiAtLS0gYS94
ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYwo+ID4gKysrIGIveGVuL2FyY2gveDg2L21tL21l
bV9zaGFyaW5nLmMKPiA+IEBAIC0xNDEyLDYgKzE0MTIsMjQgQEAgc3RhdGljIGludCByYW5nZV9z
aGFyZShzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgZG9tYWluICpjZCwKPiA+ICAgICAgcmV0dXJu
IHJjOwo+ID4gIH0KPiA+Cj4gPiArc3RhdGljIGlubGluZSBpbnQgbWVtX3NoYXJpbmdfY29udHJv
bChzdHJ1Y3QgZG9tYWluICpkLCBib29sIGVuYWJsZSkKPiA+ICt7Cj4gPiArICAgIGlmICggZW5h
YmxlICkKPiA+ICsgICAgewo+ID4gKyAgICAgICAgaWYgKCB1bmxpa2VseSghaXNfaHZtX2RvbWFp
bihkKSkgKQo+ID4gKyAgICAgICAgICAgIHJldHVybiAtRU5PU1lTOwo+Cj4gLUVPUE5PVFNVUFAg
b3Igc29tZSBzdWNoIHBsZWFzZS4gRU5PU1lTIGhhcyBhIHZlcnkgc3BlY2lmaWMgbWVhbmluZywK
PiB3aGljaCAoYWNjb3JkaW5nIHRvIG15IHVuZGVyc3RhbmRpbmcpIGRvZXNuJ3QgYXBwbHkgaGVy
ZS4KPgo+ID4gKyAgICAgICAgaWYgKCB1bmxpa2VseSghaGFwX2VuYWJsZWQoZCkpICkKPiA+ICsg
ICAgICAgICAgICByZXR1cm4gLUVOT0RFVjsKPgo+IERvZXNuJ3QgdGhpcyBhbGxvdyBkcm9wcGlu
ZyB0aGUgSEFQIGNoZWNrIGZyb20KPiBtZW1fc2hhcmluZ19lbmFibGVkKGQpPwoKWWVzLCBsb29r
cyBsaWtlIGl0IGNvdWxkIGJlIGRyb3BwZWQgZnJvbSB0aGVyZS4KCj4KPiA+ICsgICAgICAgIGlm
ICggdW5saWtlbHkoaXNfaW9tbXVfZW5hYmxlZChkKSkgKQo+ID4gKyAgICAgICAgICAgIHJldHVy
biAtRVhERVY7Cj4gPiArICAgIH0KPiA+ICsKPiA+ICsgICAgZC0+YXJjaC5odm0ubWVtX3NoYXJp
bmcuZW5hYmxlZCA9IGVuYWJsZTsKPiA+ICsgICAgcmV0dXJuIDA7Cj4gPiArfQo+ID4gKwo+ID4g
IGludCBtZW1fc2hhcmluZ19tZW1vcChYRU5fR1VFU1RfSEFORExFX1BBUkFNKHhlbl9tZW1fc2hh
cmluZ19vcF90KSBhcmcpCj4gPiAgewo+ID4gICAgICBpbnQgcmM7Cj4gPiBAQCAtMTQzMywxMCAr
MTQ1MSw4IEBAIGludCBtZW1fc2hhcmluZ19tZW1vcChYRU5fR1VFU1RfSEFORExFX1BBUkFNKHhl
bl9tZW1fc2hhcmluZ19vcF90KSBhcmcpCj4gPiAgICAgIGlmICggcmMgKQo+ID4gICAgICAgICAg
Z290byBvdXQ7Cj4gPgo+ID4gLSAgICAvKiBPbmx5IEhBUCBpcyBzdXBwb3J0ZWQgKi8KPiA+IC0g
ICAgcmMgPSAtRU5PREVWOwo+ID4gLSAgICBpZiAoICFtZW1fc2hhcmluZ19lbmFibGVkKGQpICkK
PiA+IC0gICAgICAgIGdvdG8gb3V0Owo+ID4gKyAgICBpZiAoICFtZW1fc2hhcmluZ19lbmFibGVk
KGQpICYmIChyYyA9IG1lbV9zaGFyaW5nX2NvbnRyb2woZCwgdHJ1ZSkpICkKPiA+ICsgICAgICAg
IHJldHVybiByYzsKPgo+IFBlcmhhcHMgYWxyZWFkeSBpbiBwYXRjaCA2LCBkb2Vzbid0IHRoaXMg
ZWxpbWluYXRlIHRoZSBuZWVkIGZvciB0aGUKPiBpbmRpdmlkdWFsIG1lbV9zaGFyaW5nX2VuYWJs
ZWQoKSBjaGVja3MgaW4gdGhlIGNhc2UgYmxvY2tzPwoKWWVzIGl0IGRvZXMuIEkgdGhpbmsgSSB3
YXMgcGxhbm5pbmcgb24gcmVtb3ZpbmcgdGhvc2UgY2hlY2tzIGJ1dCBpdApzbGlwcGVkIG15IG1p
bmQuCgo+Cj4gPiBAQCAtMTcwMywxOCArMTcxOSwxMCBAQCBpbnQgbWVtX3NoYXJpbmdfZG9tY3Rs
KHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCB4ZW5fZG9tY3RsX21lbV9zaGFyaW5nX29wICptZWMp
Cj4gPiAgewo+ID4gICAgICBpbnQgcmM7Cj4gPgo+ID4gLSAgICAvKiBPbmx5IEhBUCBpcyBzdXBw
b3J0ZWQgKi8KPiA+IC0gICAgaWYgKCAhaGFwX2VuYWJsZWQoZCkgKQo+ID4gLSAgICAgICAgcmV0
dXJuIC1FTk9ERVY7Cj4gPiAtCj4gPiAtICAgIHN3aXRjaCAoIG1lYy0+b3AgKQo+ID4gKyAgICBz
d2l0Y2goIG1lYy0+b3AgKQo+Cj4gUGxlYXNlIGRvbid0IGNvcnJ1cHQgcHJvcGVyIFhlbiBzdHls
ZS4KCkFjay4KClRoYW5rcyEKVGFtYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
