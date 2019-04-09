Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59EA1C10F0E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 13:27:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2838520855
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 13:27:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QM9UKVa+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2838520855
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDqm0-00071v-IE; Tue, 09 Apr 2019 13:26:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PY99=SL=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1hDqlz-00071q-BU
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 13:26:47 +0000
X-Inumbo-ID: 1ef1f23b-5acb-11e9-92d7-bc764e045a96
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1ef1f23b-5acb-11e9-92d7-bc764e045a96;
 Tue, 09 Apr 2019 13:26:46 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id f18so14433218lja.10
 for <xen-devel@lists.xenproject.org>; Tue, 09 Apr 2019 06:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=CASyou2Sc1m+3jmTfHSR+07/UVxWLim07HVIVxer/F8=;
 b=QM9UKVa+z54hzoRQaRQutgkB4FNjCKrL8ToiG0FpPSWbfQijF3pORICjAGjxEb2cCS
 PfshY5ra6OlJmEGVOg9iiCYA8WawgErogRkPVvH3rQwEVtUsRl7eVMStKpIt7o8KrCXK
 5+Whw3iD4DhGa5yQ2BPelAhW8BR5xulGQMGj36ns5sdN1lP4OWw89gyuGfQke5ubQmy3
 3Kn7AhISpyzHpUsX6zsqhBBzLYp1BDOCdPKvA+njkGOAPoEBPX2b4lo2h568NJo8XrG5
 xfKuiiXinrqisOYQVTc9g/jzXJvNtF9Epa4ZvajIXd0AKZCiliLFhBGZP3XAVXKg4Baz
 8OAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=CASyou2Sc1m+3jmTfHSR+07/UVxWLim07HVIVxer/F8=;
 b=E/xd94wMboL1cAl9jF3VI4WrjbEhhRz2wgzXhpu7DkO3B/XzJN4hw1pRRPBq7GurOO
 pg3MtAnnK5yFYukZoCO7Y3lGOgsjOInFUOQNPbuw4O35iiRtvnOitchp0KVAX9JM8O46
 pOvxDmMrj5vwj5bblv6VEsFbzRMLQbvZgRy7/40HhydyCEoWpPNNWZjc3zQ6PgxK63UU
 JZ7UA1c9vjCOT6Fe3cZb4GBpIOf+dGMcQAp83VTCa5kjZfkRbjp/OmUJj9MhxTGvb1sr
 rMb/c8bFjvKS3Njy5wlu2jri0zi3Tv/hSarkeqlknEOvLQowDh5YHm9Q7AQgRBPwlPqY
 wcWQ==
X-Gm-Message-State: APjAAAV7dEeDNBPUMSb+TUTOhAoEFQrgar8+QZjrQeNeJWYky+bfUrZ0
 y84EM4AjvFd/ao6z91VvyyM=
X-Google-Smtp-Source: APXvYqy5Eo/vG8jxkKZDPJRcgp89sxGEhBJKfIbYIvyBM4tjgAdq2hAxBk5czCzxPJREKBBpYpGYbA==
X-Received: by 2002:a2e:9a02:: with SMTP id o2mr19358719lji.179.1554816404903; 
 Tue, 09 Apr 2019 06:26:44 -0700 (PDT)
Received: from [10.17.182.20] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 a16sm6555688lfl.86.2019.04.09.06.26.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Apr 2019 06:26:44 -0700 (PDT)
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 konrad.wilk@oracle.com, hverkuil@xs4all.nl, boris.ostrovsky@oracle.com
References: <20190409091546.9606-1-andr2000@gmail.com>
 <9b9ba6b9-f045-80e2-fe8a-595728fb1ec0@suse.com>
 <5bb8c828-b0ae-86c3-dacf-88bf6032dd6f@gmail.com>
 <303b7d57-1785-62b3-fac0-a3e947e691c4@suse.com>
From: Oleksandr Andrushchenko <andr2000@gmail.com>
Message-ID: <e9b3a843-1b1f-94c2-e123-09fb26d89753@gmail.com>
Date: Tue, 9 Apr 2019 16:26:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <303b7d57-1785-62b3-fac0-a3e947e691c4@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/cameraif: add ABI for para-virtual
 camera
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
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNC85LzE5IDEyOjQ2IFBNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+IE9uIDA5LzA0LzIwMTkg
MTE6MzMsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOgo+PiBPbiA0LzkvMTkgMTI6Mjgg
UE0sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+PiBPbiAwOS8wNC8yMDE5IDExOjE1LCBPbGVrc2Fu
ZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToKPj4+PiBGcm9tOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+Cj4+Pj4KPj4+PiBUaGlzIGlzIHRo
ZSBBQkkgZm9yIHRoZSB0d28gaGFsdmVzIG9mIGEgcGFyYS12aXJ0dWFsaXplZAo+Pj4+IGNhbWVy
YSBkcml2ZXIgd2hpY2ggZXh0ZW5kcyBYZW4ncyByZWFjaCBtdWx0aW1lZGlhIGNhcGFiaWxpdGll
cyBldmVuCj4+Pj4gZnVydGhlciBlbmFibGluZyBpdCBmb3IgdmlkZW8gY29uZmVyZW5jaW5nLCBJ
bi1WZWhpY2xlIEluZm90YWlubWVudCwKPj4+PiBoaWdoIGRlZmluaXRpb24gbWFwcyBldGMuCj4+
Pj4KPj4+PiBUaGUgaW5pdGlhbCBnb2FsIGlzIHRvIHN1cHBvcnQgbW9zdCBuZWVkZWQgZnVuY3Rp
b25hbGl0eSB3aXRoIHRoZQo+Pj4+IGZpbmFsIGlkZWEgdG8gbWFrZSBpdCBwb3NzaWJsZSB0byBl
eHRlbmQgdGhlIHByb3RvY29sIGlmIG5lZWQgYmU6Cj4+Pj4KPj4+PiAxLiBQcm92aWRlIG1lYW5z
IGZvciBiYXNlIHZpcnR1YWwgZGV2aWNlIGNvbmZpZ3VyYXRpb246Cj4+Pj4gIMKgIC0gcGl4ZWwg
Zm9ybWF0cwo+Pj4+ICDCoCAtIHJlc29sdXRpb25zCj4+Pj4gIMKgIC0gZnJhbWUgcmF0ZXMKPj4+
PiAyLiBTdXBwb3J0IGJhc2ljIGNhbWVyYSBjb250cm9sczoKPj4+PiAgwqAgLSBjb250cmFzdAo+
Pj4+ICDCoCAtIGJyaWdodG5lc3MKPj4+PiAgwqAgLSBodWUKPj4+PiAgwqAgLSBzYXR1cmF0aW9u
Cj4+Pj4gMy4gU3VwcG9ydCBzdHJlYW1pbmcgY29udHJvbAo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1i
eTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28KPj4+PiA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29A
ZXBhbS5jb20+Cj4+Pj4gQ2M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPj4+PiBD
YzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgo+Pj4+IENj
OiBIYW5zIFZlcmt1aWwgPGh2ZXJrdWlsQHhzNGFsbC5ubD4KPj4+IEknbSBpbiBwcmluY2lwbGUg
ZmluZSB3aXRoIHRoaXMgcGF0Y2gsIGJ1dCBpdCBzaG91bGQgYmUgc2VudCBhcyBwYXJ0IG9mCj4+
PiBhIHNlcmllcyB1c2luZyB0aGF0IGhlYWRlci4gSW4gY2FzZSB0aGUgcmVsYXRlZCBkcml2ZXIg
aXNuJ3QgYWNjZXB0ZWQKPj4+IHdlJ2QgZW5kIHVwIHdpdGggYSBzdGFsZSBoZWFkZXIgZmlsZS4K
Pj4gSG0sIEkgYW0gZG9pbmcgdGhpcyBhcyBJIGRpZCBmb3IgdGhlIHJlc3Qgb2YgcHJvdG9jb2xz
IGJlZm9yZToKPj4gMS4gR2V0IHRoZSBwcm90b2NvbCBpbiBYZW4KPj4gMi4gR2V0IHRoZSBjb3B5
IGluIExpbnV4Cj4+IDMuIFVwc3RyZWFtIGRyaXZlciAodXNlIGhlYWRlcikKPiBTb3JyeSBmb3Ig
bm90IGhhdmluZyBkb25lIHRoZSByZXZpZXcgcHJvcGVybHkgaW4gdGhlIHBhc3QuIDstKQo+Cj4+
IEV2ZW4gaWYgdGhlIGRyaXZlciBpcyBub3QgYWNjZXB0ZWQgKGhvcGUgdGhpcyB3b24ndCBoYXBw
ZW4pCj4+IHRoZW4gdGhpcyBwYXRjaCBtYWtlcyBYZW4gYW5kIExpbnV4IHByb3Blcmx5IGFsaWdu
ZWQgYW55d2F5Lgo+PiBXaGljaCBpcyBJTU8gZ29vZAo+IEhhdmluZyBhbiB1bnVzZWQgaGVhZGVy
IGZpbGUgaXMgbm90IGdvb2QuCj4KPiBCZSBhc3N1cmVkIEknbSBnb2luZyB0byBnaXZlIHlvdSB0
aGUgbmVlZGVkIFJldmlld2VkLWJ5OiB0YWcgZm9yCj4gdGhlIHBhdGNoIGFkZGluZyB0aGUgaGVh
ZGVyIGluIGEgc2VyaWVzIHVzaW5nIGl0LgpPaywgc291bmRzIGdvb2QKPgo+Cj4gSnVlcmdlbgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
