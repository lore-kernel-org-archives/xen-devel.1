Return-Path: <SRS0=b7Gi=SO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81DD3C10F0E
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 13:43:06 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 509D72084D
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 13:43:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=tklengyel.com header.i=@tklengyel.com header.b="rLOblfcP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 509D72084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tklengyel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEwS6-0008O9-PR; Fri, 12 Apr 2019 13:42:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=flRE=SO=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hEwS5-0008N3-0G
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2019 13:42:45 +0000
X-Inumbo-ID: d9381a5a-5d28-11e9-92d7-bc764e045a96
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d9381a5a-5d28-11e9-92d7-bc764e045a96;
 Fri, 12 Apr 2019 13:42:43 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1555076563; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=zOSDYx9fSMJpHQj3l/XdXum3AwyepDeMnQtTjIq4oAs=;
 b=rLOblfcPA7wpKBJOYM49FANbpS+Gjd3lCNJFYYU9J4lpawZeuWu+aSMgI23HnMNZG2D/RcnZ
 m9Gl2dW0S1i1xABm4zqZOCvOTuAZ35HZTxcddeCqyqHzYveWnWaHrIdEuwr9Y+tvcjE+N4+w
 CmhVhaGbz15wxnj4m7Gz6g+rwT4=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mxa.mailgun.org with ESMTP id 5cb095b5.7f18e3d872b0-smtp-out-n02;
 Fri, 12 Apr 2019 13:42:13 -0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id 4so11310097wmf.1
 for <xen-devel@lists.xenproject.org>; Fri, 12 Apr 2019 06:42:12 -0700 (PDT)
X-Gm-Message-State: APjAAAVQfrLo4DNwct5JViRIevU9jM9yu5aniSIVPFG+rdFL2fhFFS7d
 Q+KJH87Uk7Yuk/8Xsed2o1lwcf0rH+G74vzJGIo=
X-Google-Smtp-Source: APXvYqw6Fm9hixocXDhSgB0yNkwlKOgWxklBCQyOtg7xa3av9Hx+SoYPi9eH/lzcfFxgkOYqj1rxRvskCTfuafD8y1E=
X-Received: by 2002:a1c:80cd:: with SMTP id b196mr10920843wmd.84.1555076532205; 
 Fri, 12 Apr 2019 06:42:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190412042930.2867-1-tamas@tklengyel.com>
 <5CB07CB30200007800226E07@prv1-mh.provo.novell.com>
In-Reply-To: <5CB07CB30200007800226E07@prv1-mh.provo.novell.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 12 Apr 2019 07:41:35 -0600
X-Gmail-Original-Message-ID: <CABfawhnByKWejmUUdCaCEpoE-TmdzwvQ=jVZxkz+mS8YuTRsfQ@mail.gmail.com>
Message-ID:
 <CABfawhnByKWejmUUdCaCEpoE-TmdzwvQ=jVZxkz+mS8YuTRsfQ@mail.gmail.com>
To: Jan Beulich <JBeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH 1/2] x86/mem_sharing: reorder when pages are
 unlocked and released
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190412134135.gtl-F47oZuH8fhE00RkMdWzPSef1veecnZRxAQv2CgI@z>

T24gRnJpLCBBcHIgMTIsIDIwMTkgYXQgNTo1NSBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gPj4+IE9uIDEyLjA0LjE5IGF0IDA2OjI5LCA8dGFtYXNAdGtsZW5n
eWVsLmNvbT4gd3JvdGU6Cj4gPiBQYXRjaCAwNTAyZTBhZGFlMiAieDg2OiBjb3JyZWN0IGluc3Rh
bmNlcyBvZiBQR0NfYWxsb2NhdGVkIGNsZWFyaW5nIiBpbnRyb2R1Y2VkCj4gPiBncmFiYmluZyBl
eHRyYSByZWZlcmVuY2VzIGZvciBwYWdlcyB0aGF0IGRyb3AgcmVmZXJlbmNlcyB0aWVkIHRvIFBH
Q19hbGxvY2F0ZWQuCj4gPiBIb3dldmVyLCB0aGUgd2F5IHRoZXNlIGV4dHJhIHJlZmVyZW5jZXMg
d2VyZSBncmFiYmVkIHdlcmUgaW5jb3JyZWN0LCByZXN1bHRpbmcKPiA+IGluIGJvdGggc2hhcmVf
cGFnZXMgYW5kIHVuc2hhcmVfcGFnZXMgZmFpbGluZy4KPgo+IEknbSBzb3JyeSBmb3IgdGhpcy4K
Ckl0J3MgbXkgYmFkIGZvciBub3QgY2F0Y2hpbmcgaXQgZWFybGllciB3aGVuIEkgYWNrZWQgaXQu
IFJlYWRpbmcgdGhlCnBhdGNoIGl0IGxvb2tlZCBmaW5lIGFuZCBtYWRlIHNlbnNlIGJ1dCBldmlk
ZW50bHkgdGhhdCdzIG5vIHN1YnN0aXR1dGUKZm9yIGFjdHVhbGx5IHRlc3RpbmcgaXQuCgo+Cj4g
PiBAQCAtOTg0LDcgKzk3Niw3IEBAIHN0YXRpYyBpbnQgc2hhcmVfcGFnZXMoc3RydWN0IGRvbWFp
biAqc2QsIGdmbl90IHNnZm4sIHNocl9oYW5kbGVfdCBzaCwKPiA+ICAgICAgICAgICAqIERvbid0
IGNoYW5nZSB0aGUgdHlwZSBvZiBybWFwIGZvciB0aGUgY2xpZW50IHBhZ2UuICovCj4gPiAgICAg
ICAgICBybWFwX2RlbChnZm4sIGNwYWdlLCAwKTsKPiA+ICAgICAgICAgIHJtYXBfYWRkKGdmbiwg
c3BhZ2UpOwo+ID4gLSAgICAgICAgcHV0X3BhZ2VfYW5kX3R5cGUoY3BhZ2UpOwo+ID4gKyAgICAg
ICAgcHV0X2NvdW50Kys7Cj4KPiBTaW5jZSB0aGlzIHNpdHMgaW4gYSB3aGlsZSgpLCAuLi4KPgo+
ID4gQEAgLTEwMDIsNyArOTk0LDkgQEAgc3RhdGljIGludCBzaGFyZV9wYWdlcyhzdHJ1Y3QgZG9t
YWluICpzZCwgZ2ZuX3Qgc2dmbiwgc2hyX2hhbmRsZV90IHNoLAo+ID4gICAgICAvKiBGcmVlIHRo
ZSBjbGllbnQgcGFnZSAqLwo+ID4gICAgICBpZih0ZXN0X2FuZF9jbGVhcl9iaXQoX1BHQ19hbGxv
Y2F0ZWQsICZjcGFnZS0+Y291bnRfaW5mbykpCj4gPiAgICAgICAgICBwdXRfcGFnZShjcGFnZSk7
Cj4gPiAtICAgIHB1dF9wYWdlKGNwYWdlKTsKPiA+ICsKPiA+ICsgICAgd2hpbGUocHV0X2NvdW50
LS0pCj4gPiArICAgICAgICBwdXRfcGFnZV9hbmRfdHlwZShjcGFnZSk7Cj4KPiAuLi4gcHV0X2Nv
dW50IG1heSBiZSB6ZXJvIGJlZm9yZSB0aGlzIHdoaWxlKCkuIEF0IHdoaWNoIHBvaW50IHRoZQo+
IGVhcmxpZXIgcHV0X3BhZ2UoKSB3b3VsZCBzdGlsbCBiZSB1bnNhZmUuCgpUaGUgcGFnZSBzaG91
bGQgaGF2ZSBhdCBsZWFzdCBvbmUgcmVmZXJlbmNlIGl0IGdvdCBiZWZvcmUgd2hlbiB0aGUKcGFn
ZSB3ZW50IHRocm91Z2ggcGFnZV9tYWtlX3NoYXJhYmxlIGZ1bmN0aW9uLiBXZSBhbHNvIHZlcmlm
aWVkIHRoYXQKdGhlIHBhZ2UgaXMgc3RpbGwgc2hhcmFibGUgc28gdGhhdCByZWZlcmVuY2UgaXMg
c3RpbGwgdGhlcmUsIHNvIHRoaXMKY291bnQgaXMgYXQgbGVhc3QgMS4gV2UgY291bGQgY2VydGFp
bmx5IGFkZCBhbiBBU1NFUlQocHV0X2NvdW50KQpiZWZvcmUgdGhvdWdoLgoKPgo+IEFsc28sIGRl
c3BpdGUgdGhlIGlmKCkgaW4gY29udGV4dCBzdWdnZXN0aW5nIHRoZSBzdHlsZSB5b3UgdXNlZCwK
PiB0aGUgcmVzdCBvZiB0aGUgZnVuY3Rpb24gbG9va3MgdG8gdXNlIHByb3BlciBYZW4gc3R5bGUs
IHNvIHdvdWxkCj4geW91IHBsZWFzZSBhZGQgdGhlIHRocmVlIG1pc3NpbmcgYmxhbmtzIHRvIHRo
ZSB3aGlsZSgpIHlvdSBhZGQ/CgpBY2suCgpUaGFua3MsClRhbWFzCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
