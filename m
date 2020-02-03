Return-Path: <SRS0=teC0=3X=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39568C35247
	for <xen-devel@archiver.kernel.org>; Mon,  3 Feb 2020 16:45:43 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 078A820838
	for <xen-devel@archiver.kernel.org>; Mon,  3 Feb 2020 16:45:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tc+CkG+4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 078A820838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyeqW-0002eh-RE; Mon, 03 Feb 2020 16:45:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GA6c=3X=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1iyeqV-0002ea-1q
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 16:45:11 +0000
X-Inumbo-ID: 8a44f4e2-46a4-11ea-a933-bc764e2007e4
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8a44f4e2-46a4-11ea-a933-bc764e2007e4;
 Mon, 03 Feb 2020 16:45:10 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z7so19035547wrl.13
 for <xen-devel@lists.xenproject.org>; Mon, 03 Feb 2020 08:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WzIe9jTJIohy51Yo9OuXEyMxh82Q23QQwUnyxUoEEjE=;
 b=tc+CkG+4ejyNBBYZJBceoQaOjRsUmlzHwt7Jr4Ne2LExYD2KnJCW/6dWEjwjtra92i
 CABf9tCmgeeCZta1g/IZ7bGz4hMeXK6WtFxu32zLXzZZ2WkkOJ0BdCsCSXxoCU24iOLf
 bsVMQM42aqe0AHtTLOc/cMBI3eoL77WJC52DX168T3plBPRS4mHxb/NcbMzsaY84S9pg
 dSG+ywgZ2ieKJtSB0US0n8/NQJMbM8SSVDfDr+dEAawymTqzk4A5Ha+xQgr81W3puK1X
 Zoi85zwk1cOFZG+yjvOc3O/A/XrXKnNniuaFlT+SmmBd5hIUGXydMkiL+PWcs7zi8o0b
 JpoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WzIe9jTJIohy51Yo9OuXEyMxh82Q23QQwUnyxUoEEjE=;
 b=C1sIJvPapfJxrcrEWVklQZxpnXtWTekwJPb6djMdwljUSCsy1kwTklKg0aF0pGttMB
 ZxUsIAtMw6edqfb3qhJxKOw/2CvZtwH7BG1PECOzCWGXBuRWkRbDFV5YBGcjPX8xwIpG
 9tlHef9YvUWGekj7nmW6XsCvAgOfPPkt2f7taSxarPrTxpu5AYzgCurAi4BgeaZln4kX
 O1kdEco7nXlcPcWRJPT3ydu44A2Oo4b4CMIMlRPmyOi9z0oceP8oT4EgeHYPJHwvZ2b2
 1ffc3RwwXg+xq7iGUhi6mvuO1KOyJyEBfkHmdYmLF9Ss5tmef0ftmRzsrmz1UW05kOLj
 HhDw==
X-Gm-Message-State: APjAAAX0m1Kspgn01MGn5SYLqo73keUKXzdxUqmRzcF4vysuwOuy9PxA
 iFV+afI76lot44hFCzyZ8SdUmLVaS97fw4vtVsk=
X-Google-Smtp-Source: APXvYqxWvCNgBXOmGpxdXZkbMP0yBhRpRo1Bg0NBgGxK8qZZVapPBwRYRx0ANJFskUI8hSUwADro3XMjwd59/CWcwg8=
X-Received: by 2002:adf:8b54:: with SMTP id v20mr12050189wra.390.1580748309276; 
 Mon, 03 Feb 2020 08:45:09 -0800 (PST)
MIME-Version: 1.0
References: <cover.1580746020.git.tamas.lengyel@intel.com>
 <b784bc7edf0c267e03100b30a0250454be37f59c.1580746020.git.tamas.lengyel@intel.com>
 <71886dfb-a1ca-71fb-6ff3-045cd972c568@suse.com>
In-Reply-To: <71886dfb-a1ca-71fb-6ff3-045cd972c568@suse.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Mon, 3 Feb 2020 09:44:32 -0700
Message-ID: <CABfawhmSa8swm8e_DnKqYbofxo5igdLznEbBTB8+HkgPCPh2_A@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH v7 1/7] x86/p2m: Allow p2m_get_page_from_gfn
 to return shared entries
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

T24gTW9uLCBGZWIgMywgMjAyMCBhdCA5OjI0IEFNIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6Cj4KPiBPbiAwMy4wMi4yMDIwIDE3OjEyLCBUYW1hcyBLIExlbmd5ZWwgd3Jv
dGU6Cj4gPiBUaGUgb3duZXIgZG9tYWluIG9mIHNoYXJlZCBwYWdlcyBpcyBkb21fY293LCB1c2Ug
dGhhdCBmb3IgZ2V0X3BhZ2UKPiA+IG90aGVyd2lzZSB0aGUgZnVuY3Rpb24gZmFpbHMgdG8gcmV0
dXJuIHRoZSBjb3JyZWN0IHBhZ2UgdW5kZXIgc29tZQo+ID4gc2l0dWF0aW9ucy4gVGhlIGNoZWNr
IGlmIGRvbV9jb3cgc2hvdWxkIGJlIHVzZWQgd2FzIG9ubHkgcGVyZm9ybWVkIGluCj4gPiBhIHN1
YnNldCBvZiB1c2UtY2FzZXMuIEZpeGluZyB0aGUgZXJyb3IgYW5kIHNpbXBsaWZ5aW5nIHRoZSBl
eGlzdGluZyBjaGVjawo+ID4gc2luY2Ugd2UgY2FuJ3QgaGF2ZSBhbnkgc2hhcmVkIGVudHJpZXMg
d2l0aCBkb21fY293IGJlaW5nIE5VTEwuCj4KPiBCZXR0ZXIsIHRoYW5rcy4KPgo+ID4gU2lnbmVk
LW9mZi1ieTogVGFtYXMgSyBMZW5neWVsIDx0YW1hcy5sZW5neWVsQGludGVsLmNvbT4KPiA+IC0t
LQo+ID4gdjc6IHVwZGF0ZSBjb21taXQgbWVzc2FnZQo+ID4gLS0tCj4gPiAgeGVuL2FyY2gveDg2
L21tL3AybS5jIHwgMTQgKysrKysrKystLS0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNl
cnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94
ODYvbW0vcDJtLmMgYi94ZW4vYXJjaC94ODYvbW0vcDJtLmMKPiA+IGluZGV4IGRlZjEzZjY1N2Iu
LjAwN2ZlZjcyMGQgMTAwNjQ0Cj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvbW0vcDJtLmMKPiA+ICsr
KyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYwo+ID4gQEAgLTU3NSwxMSArNTc1LDEyIEBAIHN0cnVj
dCBwYWdlX2luZm8gKnAybV9nZXRfcGFnZV9mcm9tX2dmbigKPiA+ICAgICAgICAgICAgICAgICAg
aWYgKCBmZG9tID09IE5VTEwgKQo+ID4gICAgICAgICAgICAgICAgICAgICAgcGFnZSA9IE5VTEw7
Cj4gPiAgICAgICAgICAgICAgfQo+ID4gLSAgICAgICAgICAgIGVsc2UgaWYgKCAhZ2V0X3BhZ2Uo
cGFnZSwgcDJtLT5kb21haW4pICYmCj4gPiAtICAgICAgICAgICAgICAgICAgICAgIC8qIFBhZ2Ug
Y291bGQgYmUgc2hhcmVkICovCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICghZG9tX2NvdyB8
fCAhcDJtX2lzX3NoYXJlZCgqdCkgfHwKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICFnZXRf
cGFnZShwYWdlLCBkb21fY293KSkgKQo+ID4gLSAgICAgICAgICAgICAgICBwYWdlID0gTlVMTDsK
PiA+ICsgICAgICAgICAgICBlbHNlCj4gPiArICAgICAgICAgICAgewo+ID4gKyAgICAgICAgICAg
ICAgICBzdHJ1Y3QgZG9tYWluICpkID0gIXAybV9pc19zaGFyZWQoKnQpID8gcDJtLT5kb21haW4g
OiBkb21fY293Owo+ID4gKyAgICAgICAgICAgICAgICBpZiAoICFnZXRfcGFnZShwYWdlLCBkKSAp
Cj4KPiBUaGVyZSdzIHN0aWxsIGEgYmxhbmsgbGluZSBtaXNzaW5nIGJldHdlZW4gdGhlc2UgdHdv
IGxpbmVzIGFuZCAuLi4KPgo+ID4gKyAgICAgICAgICAgICAgICAgICAgcGFnZSA9IE5VTEw7Cj4g
PiArICAgICAgICAgICAgfQo+ID4gICAgICAgICAgfQo+ID4gICAgICAgICAgcDJtX3JlYWRfdW5s
b2NrKHAybSk7Cj4gPgo+ID4gQEAgLTU5NSw4ICs1OTYsOSBAQCBzdHJ1Y3QgcGFnZV9pbmZvICpw
Mm1fZ2V0X3BhZ2VfZnJvbV9nZm4oCj4gPiAgICAgIG1mbiA9IGdldF9nZm5fdHlwZV9hY2Nlc3Mo
cDJtLCBnZm5feChnZm4pLCB0LCBhLCBxLCBOVUxMKTsKPiA+ICAgICAgaWYgKCBwMm1faXNfcmFt
KCp0KSAmJiBtZm5fdmFsaWQobWZuKSApCj4gPiAgICAgIHsKPiA+ICsgICAgICAgIHN0cnVjdCBk
b21haW4gKmQgPSAhcDJtX2lzX3NoYXJlZCgqdCkgPyBwMm0tPmRvbWFpbiA6IGRvbV9jb3c7Cj4g
PiAgICAgICAgICBwYWdlID0gbWZuX3RvX3BhZ2UobWZuKTsKPgo+IC4uLiBzaW1pbGFybHkgYmV0
d2VlbiB0aGVzZSB0d28uIEFzIGluZGljYXRlZCBiZWZvcmUsIHdpdGggdGhlbQo+IGFkZGVkCj4g
UmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiBkZXNwaXRlIG1l
IHN0aWxsIHRoaW5raW5nIHRoYXQgdGhlIHRpdGxlIHN1Z2dlc3RzIG1vcmUgb2YgYQo+IHByb2Js
ZW0gdGhhbiB0aGVyZSByZWFsbHkgd2FzLiAoT2YgY291cnNlIGFkZGluZyB0aGUgbWlzc2luZwo+
IGJsYW5rIGxpbmVzIG91Z2h0IHRvIGJlIGVhc3kgZW5vdWdoIHdoaWxlIGNvbW1pdHRpbmcuKQoK
VGhhbmtzLCBJIGRpZCBmb3Jnb3QgdG8gYWRkIHRob3NlIGV4dHJhIGxpbmVzLiBUbyBtZSB0aGlz
IGxvb2tzIGZpbmUKYXMtaXMgc28gaXQganVzdCBkb2Vzbid0IGNvbWUgdG8gbWluZCBuYXR1cmFs
bHkuCgpUYW1hcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
