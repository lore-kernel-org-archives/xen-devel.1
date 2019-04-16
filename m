Return-Path: <SRS0=kbZc=SS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0A74C10F13
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 13:27:06 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DC1B20643
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 13:27:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YvK/Z34a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DC1B20643
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGO6v-0007bq-OL; Tue, 16 Apr 2019 13:26:53 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GH/2=SS=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1hGO6u-0007bl-LX
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2019 13:26:52 +0000
X-Inumbo-ID: 4aafa31b-604b-11e9-92d7-bc764e045a96
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4aafa31b-604b-11e9-92d7-bc764e045a96;
 Tue, 16 Apr 2019 13:26:51 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id w23so15988375lfc.9
 for <xen-devel@lists.xenproject.org>; Tue, 16 Apr 2019 06:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=AYdxn6drWCa60kX5gatiQXEpqEv4wV/d8Ny5bf0BCEs=;
 b=YvK/Z34azXoX7XgsUWGd+aIKrbft4/Uw1NUgng8m+wBkGVEl7wwCKs52GfvNQvlRSX
 rMF3tBdVIZjR5dbN4mwEGM3RGQntThGmx2u2ZAeaDz9n5CtYWMAq4Dc7g15aQZf784LD
 Ihe37E8Y4TYRm/NyGVVVXTNBd4v8bd5J9SaXWyhlZTQwKHLP9aS5jvBKmrEW0O6ZnvL0
 gYHbX0+BaTqj1aq3b/3dtZzH3m40ih/LLUosYcRCP0Ei5UXlTza4EzhoMB+LOnCX0hgb
 XcHX1+KwGPtbAl8aUjAultUmJBx/izBmPwYx4rSIedvdjVbS1SrAlnJFJvKxSK5NnsQQ
 O20Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=AYdxn6drWCa60kX5gatiQXEpqEv4wV/d8Ny5bf0BCEs=;
 b=hH9Og9mel6njOO/X9HJkttFSrIZ8vs4EKcSy6FLpntkZDuTBhX8JcYOfRwY/yZboYT
 q2mFfPQLaTVLWufBs+jtKBqsI5bGRWxPv7TRLhHkfNcWHaNZ/SJuc9q2Nbke+cIfkV9O
 u/tEVcNGta8gUaLldmcbqGIVL6mrNLUW9v6T0Nxm6XKNTsNTdO/+vGULhgmj5pv/m/2C
 Vj05w9GAPEd0rKNH5X2Zr9nTZDZub/MtMvdHqOy8TvHhwpXjaUdnbY+XZzUMvFlD7jWK
 sy9JYZC9cRqkMGOfRJZKu4vRnK0Mnq2UA28311Uh4HuBPJ1iPB4hPGiw6APpHZFxARQk
 sQsA==
X-Gm-Message-State: APjAAAVW5k7dZrckpw8XPe9s2Yi4gJjjKIRTSQcqp7ERtG3550MNKS39
 mzQci6TInTbHEZRr82vIGK8=
X-Google-Smtp-Source: APXvYqxoJYGeRRW7PTgR5cPKgFUkngWzfmHGf0tDC6rZToY6AXveBob8fP/U4dSJ9aWSjxeuggtLrg==
X-Received: by 2002:ac2:5326:: with SMTP id f6mr22518936lfh.100.1555421208940; 
 Tue, 16 Apr 2019 06:26:48 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id r3sm10466446ljr.7.2019.04.16.06.26.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Apr 2019 06:26:48 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1554718489-11318-1-git-send-email-olekstysh@gmail.com>
 <1554718489-11318-3-git-send-email-olekstysh@gmail.com>
 <3370f03e-3d4d-7d01-3783-6475b110860c@arm.com>
 <1c0b4b09-7d7b-97a7-eecd-b809ea79523c@gmail.com>
 <6ecca59b-48b5-b515-d273-6ab518bdbd00@arm.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <bad96170-c27f-c7a7-53b3-65db77a00276@gmail.com>
Date: Tue, 16 Apr 2019 16:26:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <6ecca59b-48b5-b515-d273-6ab518bdbd00@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V3 2/5] xen/arm: drivers: scif: Extend
 driver to handle other interfaces
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 sstabellini@kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190416132645.ynyo63Oh7Zo1vXG8Faz0naf8QhPCuoL48T0q89ayuRE@z>

Ck9uIDE2LjA0LjE5IDEyOjExLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgT2xla3NhbmRyLAoK
SGkgSnVsaWVuCgoKPgo+IE9uIDQvMTUvMTkgMTI6MzAgUE0sIE9sZWtzYW5kciB3cm90ZToKPj4K
Pj4gT24gMTQuMDQuMTkgMTk6NTUsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+IEhpIE9sZWtzYW5k
ciwKPj4KPj4gSGkgSnVsaWVuCj4+Cj4+Cj4+Pgo+Pj4gT24gNC84LzE5IDExOjE0IEFNLCBPbGVr
c2FuZHIgVHlzaGNoZW5rbyB3cm90ZToKPj4+PiBGcm9tOiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8
b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+Cj4+Pj4KPj4+PiBFeHRlbmQgZHJpdmVyIHRv
IGJlIGFibGUgdG8gaGFuZGxlIG90aGVyIFNDSUYoWCkgY29tcGF0aWJsZQo+Pj4+IGludGVyZmFj
ZXMgYXMgd2VsbC4gVGhlc2UgaW50ZXJmYWNlcyBoYXZlIGxvdCBpbiBjb21tb24sCj4+Pj4gYnV0
IG1vc3RseSBkaWZmZXIgaW4gb2Zmc2V0cyBhbmQgYml0cyBmb3Igc29tZSByZWdpc3RlcnMuCj4+
Pgo+Pj4gQ2FuIHlvdSBicmllZmx5IGV4cGxhaW4gaW4gdGhlIGNvbW1pdCBtZXNzYWdlIHdoYXQg
ZGlmZmVycz8KPj4KPj4gU3VyZQo+Pgo+Pgo+Pj4KPj4+IFsuLi5dCj4+Pgo+Pj4+IEBAIC02NSwx
MyArMTAwLDE2IEBAIHN0YXRpYyB2b2lkIHNjaWZfdWFydF9pbnRlcnJ1cHQoaW50IGlycSwgdm9p
ZCAKPj4+PiAqZGF0YSwgc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpCj4+Pj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgc2VyaWFsX3J4X2ludGVycnVwdChwb3J0LCByZWdzKTsKPj4+PiDC
oCDCoMKgwqDCoMKgwqDCoMKgwqAgLyogRXJyb3IgSW50ZXJydXB0ICovCj4+Pj4gLcKgwqDCoMKg
wqDCoMKgIGlmICggc3RhdHVzICYgU0NJRl9FUlJPUlMgKQo+Pj4+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHNjaWZfd3JpdGV3KHVhcnQsIFNDSUZfU0NGU1IsIH5TQ0lGX0VSUk9SUyk7Cj4+Pj4g
LcKgwqDCoMKgwqDCoMKgIGlmICggc2NpZl9yZWFkdyh1YXJ0LCBTQ0lGX1NDTFNSKSAmIFNDTFNS
X09SRVIgKQo+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNjaWZfd3JpdGV3KHVhcnQsIFND
SUZfU0NMU1IsIDApOwo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoIHN0YXR1cyAmIHBhcmFtcy0+
ZXJyb3JfbWFzayApCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2NpZl93cml0ZXcodWFy
dCwgcGFyYW1zLT5zdGF0dXNfcmVnLCAKPj4+PiB+cGFyYW1zLT5lcnJvcl9tYXNrKTsKPj4+PiAr
wqDCoMKgwqDCoMKgwqAgaWYgKCBwYXJhbXMtPm92ZXJydW5fcmVnICE9IHBhcmFtcy0+c3RhdHVz
X3JlZyApCj4+Pgo+Pj4gQmVsb3cgeW91IHdpbGwgd3JpdGUgdGhlIHNhbWUgcmVnaXN0ZXIgdHdp
Y2UgaWYgb3ZlcnJ1bl9yZWcgPT0gCj4+PiBzdGF0dXNfcmVnIChzZWUgc2NpZl91YXJ0X2luaXRf
cHJlaXJxKS4gV291bGQgdGhlcmUgYmUgYW55IGlzc3VlIGlmIAo+Pj4geW91IGRvIHRoZSBzYW1l
IGhlcmU/Cj4+Cj4+IEkgZGlkbid0IGV4cGVjdCBhbnkgaXNzdWUgdG8gd3JpdGUgdGhlIHNhbWUg
cmVnaXN0ZXIgdHdpY2UgZHVyaW5nIAo+PiBpbml0aWFsaXphdGlvbiB0byBzaW1wbGlmeSB0aGUg
Y29kZSwgdGhhdCB3aHkgSSBhZ3JlZWQgdG8gcmVtb3ZlIHRoZSAKPj4gY2hlY2sgaW4gVjEuCj4+
Cj4+IEJ1dCBJIGFtIG5vdCBzdXJlIGFib3V0IGRvaW5nIHNvIGhlcmUuIFdlIGNvdWxkIHNpbXBs
aWZ5IHRoZSBjb2RlIGJ5IAo+PiBqdXN0IHJlbW92aW5nICJpZiAoIHBhcmFtcy0+b3ZlcnJ1bl9y
ZWcgIT0gcGFyYW1zLT5zdGF0dXNfcmVnICkiLAo+Pgo+PiBidXQgd2Ugd291bGQgbmVlZCB0byBk
byBleHRyYSBvcGVyYXRpb24gZm9yIFNDSUZBIHdoaWNoIGhhcyAKPj4gb3ZlcnJ1bl9yZWcgPT0g
c3RhdHVzX3JlZy4KPj4KPj4gV2hhdCB3YXkgZG8geW91IHByZWZlcj8KPgo+IEl0IGlzIG5vdCBh
Ym91dCBwcmVmZXJlbmNlLCBpdCBpcyBhYm91dCBjb3JyZWN0bmVzcy4gSW4gbXkgcHJldmlvdXMg
Cj4gcmVwbHksIEkgcG9pbnRlZCBvdXQgdGhhdCB5b3UgZGVmaW5lIG92ZXJydW5fbWFzayBmb3Ig
U0NJRkEgYnV0IGl0IAo+IHdpbGwgbmV2ZXIgYmUgdXNlZC4gV2l0aG91dCBhbnkgZXhwbGFuYXRp
b24sIHRoZSBjb2RlIGxvb2tzIHByZXR0eSB3cm9uZy4KPgo+IExvb2tpbmcgYXQgdGhlIG5leHQg
cGF0Y2gsIHlvdSBnZXQgYXdheSBmcm9tIGFueSBwcm9ibGVtIHdpdGggU0NJRkEgCj4gYmVjYXVz
ZSB0aGUgb3ZlcnJ1bl9tYXNrIGlzIGEgc3Vic2V0IG9mIGVycm9yX21hc2suIEJ1dCBJIHN0aWxs
IGRvbid0IAo+IHNlZSB3aHkgdHJ5aW5nIHRvIHByZXZlbnQgdG8gd3JpdGUgYSBzZWNvbmQgdGlt
ZSBpcyBhbiBpc3N1ZSwgdGhlIG1vcmUgCj4gdGhlIExpbnV4IGRyaXZlciBkb2VzIG5vdCBzZWVt
IHRvIGRvIHRoaXMgZGFuY2UuCj4KPiBTbyBhdCBiZXN0LCB5b3UgbmVlZCB0byBleHBsYWluIGlu
IHRoZSBjb21taXQgbWVzc2FnZSB3aHkgeW91IHRyeSB0byAKPiBza2lwIHRoZSByZWdpc3RlciB3
aGVuIGl0IGlzIHRoZSBzYW1lLgoKSSBnb3QgeW91ciBwb2ludC4KCgpJIGNhbiBtYWtlIHRoZSBm
b2xsb3dpbmcgY2hhbmdlczoKCjEuIERyb3AgImlmICggcGFyYW1zLT5vdmVycnVuX3JlZyAhPSBw
YXJhbXMtPnN0YXR1c19yZWcgKSIgY2hlY2sgZXZlcnl3aGVyZS4KCjIuIFJlbW92ZSBvdmVycnVu
X2JpdCAoU0NBU1NSX09SRVIpIGZyb20gZXJyb3JfbWFzayBmb3IgU0NJRkEuCgpUaGlzIHdheSB3
ZSB3aWxsIGdldCBhIG11Y2ggY2xlYW5lciBjb2RlIHdoZXJlIG92ZXJydW5fbWFzayBpcyB1c2Vk
IGZvciAKYm90aCBpbnRlcmZhY2VzLgoKV2hhdCBkbyB5b3UgdGhpbms/CgoKPgo+IENoZWVycywK
PgotLSAKUmVnYXJkcywKCk9sZWtzYW5kciBUeXNoY2hlbmtvCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
