Return-Path: <SRS0=OGpy=UX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0C9DC43613
	for <xen-devel@archiver.kernel.org>; Mon, 24 Jun 2019 13:18:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C4CD20820
	for <xen-devel@archiver.kernel.org>; Mon, 24 Jun 2019 13:18:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C4CD20820
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfOrF-0008J9-Va; Mon, 24 Jun 2019 13:18:05 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Snzw=UX=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hfOrE-0008J4-Ds
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2019 13:18:04 +0000
X-Inumbo-ID: 7e506d1a-9682-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7e506d1a-9682-11e9-8980-bc764e045a96;
 Mon, 24 Jun 2019 13:18:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8D1B7AFB7;
 Mon, 24 Jun 2019 13:18:01 +0000 (UTC)
To: Zhenzhong Duan <zhenzhong.duan@oracle.com>, linux-kernel@vger.kernel.org
References: <1561294903-6166-1-git-send-email-zhenzhong.duan@oracle.com>
 <1561294903-6166-3-git-send-email-zhenzhong.duan@oracle.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <9e60cea2-a15f-b816-9049-f22be14c04b2@suse.com>
Date: Mon, 24 Jun 2019 15:18:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1561294903-6166-3-git-send-email-zhenzhong.duan@oracle.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH 3/6] x86: Add nopv parameter to disable PV
 extensions
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
Cc: sstabellini@kernel.org, mingo@kernel.org, bp@alien8.de, hpa@zytor.com,
 xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, tglx@linutronix.de
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMDYuMTkgMTU6MDEsIFpoZW56aG9uZyBEdWFuIHdyb3RlOgo+IEluIHZpcnR1YWxpemF0
aW9uIGVudmlyb25tZW50LCBQViBleHRlbnNpb25zIChkcml2ZXJzLCBpbnRlcnJ1cHRzLAo+IHRp
bWVycywgZXRjKSBhcmUgZW5hYmxlZCBpbiB0aGUgbWFqb3JpdHkgb2YgdXNlIGNhc2VzIHdoaWNo
IGlzIHRoZQo+IGJlc3Qgb3B0aW9uLgo+IAo+IEhvd2V2ZXIsIGluIHNvbWUgY2FzZXMgKGtleGVj
IG5vdCBmdWxseSB3b3JraW5nLCBiZW5jaG1hcmtpbmcpCj4gd2Ugd2FudCB0byBkaXNhYmxlIFBW
IGV4dGVuc2lvbnMuIEFzIHN1Y2ggaW50cm9kdWNlIHRoZQo+ICdub3B2JyBwYXJhbWV0ZXIgdGhh
dCB3aWxsIGRvIGl0Lgo+IAo+IFRoZXJlIGlzIGFscmVhZHkgJ3hlbl9ub3B2JyBwYXJhbWV0ZXIg
Zm9yIFhFTiBwbGF0Zm9ybSBidXQgbm90IGZvcgo+IG90aGVycy4gJ3hlbl9ub3B2JyBjYW4gdGhl
biBiZSByZW1vdmVkIHdpdGggdGhpcyBjaGFuZ2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogWmhlbnpo
b25nIER1YW4gPHpoZW56aG9uZy5kdWFuQG9yYWNsZS5jb20+Cj4gQ2M6IHhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwo+IC0tLQo+ICAgRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9rZXJu
ZWwtcGFyYW1ldGVycy50eHQgfCAgNCArKysrCj4gICBhcmNoL3g4Ni9rZXJuZWwvY3B1L2h5cGVy
dmlzb3IuYyAgICAgICAgICAgICAgICB8IDExICsrKysrKysrKysrCj4gICAyIGZpbGVzIGNoYW5n
ZWQsIDE1IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9hZG1p
bi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQgYi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRl
L2tlcm5lbC1wYXJhbWV0ZXJzLnR4dAo+IGluZGV4IDEzOGY2NjYuLmIzNTJmMzYgMTAwNjQ0Cj4g
LS0tIGEvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQKPiAr
KysgYi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dAo+IEBA
IC01MjY4LDYgKzUyNjgsMTAgQEAKPiAgIAkJCWltcHJvdmUgdGltZXIgcmVzb2x1dGlvbiBhdCB0
aGUgZXhwZW5zZSBvZiBwcm9jZXNzaW5nCj4gICAJCQltb3JlIHRpbWVyIGludGVycnVwdHMuCj4g
ICAKPiArCW5vcHY9CQlbWDg2XQo+ICsJCQlEaXNhYmxlcyB0aGUgUFYgb3B0aW1pemF0aW9ucyBm
b3JjaW5nIHRoZSBndWVzdCB0byBydW4KPiArCQkJYXMgZ2VuZXJpYyBndWVzdCB3aXRoIG5vIFBW
IGRyaXZlcnMuCj4gKwo+ICAgCXhpcmMycHNfY3M9CVtORVQsUENNQ0lBXQo+ICAgCQkJRm9ybWF0
Ogo+ICAgCQkJPGlycT4sPGlycV9tYXNrPiw8aW8+LDxmdWxsX2R1cGxleD4sPGRvX3NvdW5kPiw8
bG9ja3VwX2hhY2s+Wyw8aXJxMj5bLDxpcnEzPlssPGlycTQ+XV1dCj4gZGlmZiAtLWdpdCBhL2Fy
Y2gveDg2L2tlcm5lbC9jcHUvaHlwZXJ2aXNvci5jIGIvYXJjaC94ODYva2VybmVsL2NwdS9oeXBl
cnZpc29yLmMKPiBpbmRleCA0NzljYTQ3Li40ZjJjODc1IDEwMDY0NAo+IC0tLSBhL2FyY2gveDg2
L2tlcm5lbC9jcHUvaHlwZXJ2aXNvci5jCj4gKysrIGIvYXJjaC94ODYva2VybmVsL2NwdS9oeXBl
cnZpc29yLmMKPiBAQCAtODUsMTAgKzg1LDIxIEBAIHN0YXRpYyB2b2lkIF9faW5pdCBjb3B5X2Fy
cmF5KGNvbnN0IHZvaWQgKnNyYywgdm9pZCAqdGFyZ2V0LCB1bnNpZ25lZCBpbnQgc2l6ZSkKPiAg
IAkJCXRvW2ldID0gZnJvbVtpXTsKPiAgIH0KPiAgIAo+ICtzdGF0aWMgYm9vbCBub3B2Owo+ICtz
dGF0aWMgX19pbml0IGludCB4ZW5fcGFyc2Vfbm9wdihjaGFyICphcmcpCj4gK3sKPiArCW5vcHYg
PSB0cnVlOwo+ICsJcmV0dXJuIDA7Cj4gK30KPiArZWFybHlfcGFyYW0oIm5vcHYiLCB4ZW5fcGFy
c2Vfbm9wdik7Cj4gKwo+ICAgdm9pZCBfX2luaXQgaW5pdF9oeXBlcnZpc29yX3BsYXRmb3JtKHZv
aWQpCj4gICB7Cj4gICAJY29uc3Qgc3RydWN0IGh5cGVydmlzb3JfeDg2ICpoOwo+ICAgCj4gKwlp
ZiAobm9wdikKPiArCQlyZXR1cm47Cj4gKwoKT2gsIHRoaXMgaXMgbm8gZ29vZCBpZGVhLgoKVGhl
cmUgYXJlIGd1ZXN0IHR5cGVzIHdoaWNoIGp1c3Qgd29uJ3Qgd29yayB3aXRob3V0IHB2IGludGVy
ZmFjZXMsIGxpa2UKWGVuIFBWIGFuZCBYZW4gUFZILiBMZXR0aW5nIHRoZW0gZmFpbCBkdWUgdG8g
anVzdCBhIHdyb25nIGNvbW1hbmQgbGluZQpwYXJhbWV0ZXIgaXMgbm90IG5pY2UsIGVzcGVjaWFs
bHkgYXMgdGhlIGZhaWx1cmUgbWlnaHQgYmUgdmVyeSBoYXJkIHRvCnRyYWNrIGRvd24gdG8gdGhl
IGlzc3VlIGZvciB0aGUgdXNlci4KCkkgZ3Vlc3MgeW91IGNvdWxkIGFkZCBhICJpZ25vcmVfbm9w
diIgbWVtYmVyIHRvIHN0cnVjdCBoeXBlcnZpc29yX3g4NgpzZXQgdG8gdHJ1ZSBmb3IgdGhlIG1l
bnRpb25lZCBndWVzdCB0eXBlcyBhbmQgY2FsbCB0aGUgZGV0ZWN0IGZ1bmN0aW9ucwpvbmx5IGlm
IG5vcHYgaXMgZmFsc2Ugb3IgaWdub3JlX25vcHYgaXMgdHJ1ZS4KCgpKdWVyZ2VuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
