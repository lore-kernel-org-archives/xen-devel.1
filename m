From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH 06/12] xen/arm: mm: Sanity check any update
 of Xen page tables
Date: Tue, 7 May 2019 10:38:40 +0300
Message-ID: <11365b97-c8e5-a3f5-247b-822fc80e441a@gmail.com>
References: <20190424165955.23718-1-julien.grall@arm.com>
 <20190424165955.23718-7-julien.grall@arm.com>
 <7a6cb580-e4d7-7325-7797-d16ca0856c57@gmail.com>
 <ac720fde-f515-dd69-69d8-761f7f119d74@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DEOA=TH=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hNugX-0003tu-72
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 07:38:45 +0000
Received: by mail-lf1-x143.google.com with SMTP id u27so10786104lfg.10
 for <xen-devel@lists.xenproject.org>; Tue, 07 May 2019 00:38:43 -0700 (PDT)
In-Reply-To: <ac720fde-f515-dd69-69d8-761f7f119d74@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr_Tyshchenko@epam.com, sstabellini@kernel.org, Andrii_Anisov@epam.com
List-Id: xen-devel@lists.xenproject.org

SGVsbG8gSnVsaWVuLAoKT24gMDYuMDUuMTkgMjA6MDEsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBJ
dCBpcyBub3QgdW5yZWxhdGVkLCB0aGUgcGF0Y2ggaXMgbmVjZXNzYXJ5IHRvIG1ha2UgdGhpcyBw
YXRjaCB3b3Jrcy4gT3RoZXJ3aXNlIHlvdSB3aWxsIGhpdCB0aGUgQVNTRVJUKG1mbl9lcShtZm4s
IElOVkFMSURfTUZOKSkgYWZ0ZXIgb25lIGl0ZXJhdGlvbi4KCkknbSBkZWZpbml0ZWx5IG5vdCBz
YXlpbmcgaXQgaXMgdG90YWxseSBvZGQgaGVyZS4gSSdtIGp1c3QgZXhwcmVzcyBteSBvcGluaW9u
IHRoYXQgcGF0Y2hlcyB3aXRoIGZsYWdzIGludHJvZHVjdGlvbiBhbmQgaW1wbGVtZW50YXRpb24g
YmV0dGVyIGdvIG9uZSBhZnRlciBhbm90aGVyLgpCdXQgZm9yIHN1cmUgdGhpcyBjb21tZW50IGlz
IGEgbWlub3Igbm90ZSwgc28gaXQncyB1cCB0byB5b3U6KQoKQlRXLCB3aXRoIHRoZSBmaXhlZCBj
b25kaXRpb246CgpSZXZpZXdlZC1ieTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFt
LmNvbT4KCi0tIApTaW5jZXJlbHksCkFuZHJpaSBBbmlzb3YuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
