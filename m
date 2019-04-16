Return-Path: <SRS0=kbZc=SS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA5F6C10F13
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 13:58:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9FDE20643
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 13:58:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9FDE20643
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGObZ-0001vY-Ik; Tue, 16 Apr 2019 13:58:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FIV7=SS=citrix.com=prvs=002262b5c=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hGObY-0001vT-1t
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2019 13:58:32 +0000
X-Inumbo-ID: b5d78f5c-604f-11e9-b043-7fd2948454fc
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b5d78f5c-604f-11e9-b043-7fd2948454fc;
 Tue, 16 Apr 2019 13:58:28 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,358,1549929600"; d="scan'208";a="83688485"
To: Andrew Cooper <andrew.cooper3@citrix.com>, Tamas K Lengyel
 <tamas@tklengyel.com>, Alexandru Stefan ISAILA <aisaila@bitdefender.com>
References: <20190416084531.5084-1-aisaila@bitdefender.com>
 <CABfawhncF-r0ZYwd-V9D4UkpmqA22+kca5YTeuMVHm2A4xSCOg@mail.gmail.com>
 <55fc24f5-8f6e-08d5-3e9d-946de804d83b@citrix.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 mQINBFPqG+MBEACwPYTQpHepyshcufo0dVmqxDo917iWPslB8lauFxVf4WZtGvQSsKStHJSj
 92Qkxp4CH2DwudI8qpVbnWCXsZxodDWac9c3PordLwz5/XL41LevEoM3NWRm5TNgJ3ckPA+J
 K5OfSK04QtmwSHFP3G/SXDJpGs+oDJgASta2AOl9vPV+t3xG6xyfa2NMGn9wmEvvVMD44Z7R
 W3RhZPn/NEZ5gaJhIUMgTChGwwWDOX0YPY19vcy5fT4bTIxvoZsLOkLSGoZb/jHIzkAAznug
 Q7PPeZJ1kXpbW9EHHaUHiCD9C87dMyty0N3TmWfp0VvBCaw32yFtM9jUgB7UVneoZUMUKeHA
 fgIXhJ7I7JFmw3J0PjGLxCLHf2Q5JOD8jeEXpdxugqF7B/fWYYmyIgwKutiGZeoPhl9c/7RE
 Bf6f9Qv4AtQoJwtLw6+5pDXsTD5q/GwhPjt7ohF7aQZTMMHhZuS52/izKhDzIufl6uiqUBge
 0lqG+/ViLKwCkxHDREuSUTtfjRc9/AoAt2V2HOfgKORSCjFC1eI0+8UMxlfdq2z1AAchinU0
 eSkRpX2An3CPEjgGFmu2Je4a/R/Kd6nGU8AFaE8ta0oq5BSFDRYdcKchw4TSxetkG6iUtqOO
 ZFS7VAdF00eqFJNQpi6IUQryhnrOByw+zSobqlOPUO7XC5fjnwARAQABtCRHZW9yZ2UgVy4g
 RHVubGFwIDxkdW5sYXBnQHVtaWNoLmVkdT6JAlcEEwEKAEECGwMFCwkIBwMFFQoJCAsFFgID
 AQACHgECF4ACGQEWIQTXqBy2bTNXPzpOYFimNjwxBZC0bQUCXEowWQUJDCJ7dgAKCRCmNjwx
 BZC0beKvEACJ75YlJXd7TnNHgFyiCJkm/qPeoQ3sFGSDZuZh7SKcdt9+3V2bFEb0Mii1hQaz
 3hRqZb8sYPHJrGP0ljK09k3wf8k3OuNxziLQBJyzvn7WNlE4wBEcy/Ejo9TVBdA4ph5D0YaZ
 nqdsPmxe/xlTFuSkgu4ep1v9dfVP1TQR0e+JIBa/Ss+cKC5intKm+8JxpOploAHuzaPu0L/X
 FapzsIXqgT9eIQeBEgO2hge6h9Jov3WeED/vh8kA7f8c6zQ/gs5E7VGALwsiLrhr0LZFcKcw
 kI3oCCrB/C/wyPZv789Ra8EXbeRSJmTjcnBwHRPjnjwQmetRDD1t+VyrkC6uujT5jmgOBzaj
 KCqZ8PcMAssOzdzQtKmjUQ2b3ICPs2X13xZ5M5/OVs1W3TG5gkvMh4YoHi4ilFnOk+v3/j7q
 65FG6N0JLb94Ndi80HkIOQQ1XVGTyu6bUPaBg3rWK91Csp1682kD/dNVF3FKHrRLmSVtmEQR
 5rK0+VGc/FmR6vd4haKGWIRuPxzg+pBR77avIZpU7C7+UXGuZ5CbHwIdY8LojJg2TuUdqaVj
 yxmEZLOA8rVHipCGrslRNthVbJrGN/pqtKjCClFZHIAYJQ9EGLHXLG9Pj76opfjHij3MpR3o
 pCGAh6KsCrfrsvjnpDwqSbngGyEVH030irSk4SwIqZ7FwLkBDQRUWmc6AQgAzpc8Ng5Opbrh
 iZrn69Xr3js28p+b4a+0BOvC48NfrNovZw4eFeKIzmI/t6EkJkSqBIxobWRpBkwGweENsqnd
 0qigmsDw4N7J9Xx0h9ARDqiWxX4jr7u9xauI+CRJ1rBNO3VV30QdACwQ4LqhR/WA+IjdhyMH
 wj3EJGE61NdP/h0zfaLYAbvEg47/TPThFsm4m8Rd6bX7RkrrOgBbL/AOnYOMEivyfZZKX1vv
 iEemAvLfdk2lZt7Vm6X/fbKbV8tPUuZELzNedJvTTBS3/l1FVz9OUcLDeWhGEdlxqXH0sYWh
 E9+PXTAfz5JxKH+LMetwEM8DbuOoDIpmIGZKrZ+2fQARAQABiQNbBBgBCgAmAhsCFiEE16gc
 tm0zVz86TmBYpjY8MQWQtG0FAlxKMJ4FCQnQ/OQBKcBdIAQZAQoABgUCVFpnOgAKCRCyFcen
 x4Qb7cXrCAC0qQeEWmLa9oEAPa+5U6wvG1t/mi22gZN6uzQXH1faIOoDehr7PPESE6tuR/vI
 CTTnaSrd4UDPNeqOqVF07YexWD1LDcQG6PnRqC5DIX1RGE3BaSaMl2pFJP8y+chews11yP8G
 DBbxaIsTcHZI1iVIC9XLhoeegWi84vYc8F4ziADVfowbmbvcVw11gE8tmALCwTeBeZVteXjh
 0OELHwrc1/4j4yvENjIXRO+QLIgk43kB57Upr4tP2MEcs0odgPM+Q+oETOJ00xzLgkTnLPim
 C1FIW2bOZdTj+Uq6ezRS2LKsNmW+PRRvNyA5ojEbA/faxmAjMZtLdSSSeFK8y4SoCRCmNjwx
 BZC0bevWEACRu+GyQgrdGmorUptniIeO1jQlpTiP5WpVnk9Oe8SiLoXUhXXNj6EtzyLGpYmf
 kEAbki+S6WAKnzZd3shL58AuMyDxtFNNjNeKJOcl6FL7JPBIIgIp3wR401Ep+/s5pl3Nw8Ii
 157f0T7o8CPb54w6S1WsMkU78WzTxIs/1lLblSMcvyz1Jq64g4OqiWI85JfkzPLlloVf1rzy
 ebIBLrrmjhCE2tL1RONpE/KRVb+Q+PIs5+YcZ+Q1e0vXWA7NhTWFbWx3+N6WW6gaGpbFbopo
 FkYRpj+2TA5cX5zW148/xU5/ATEb5vdUkFLUFVy5YNUSyeBHuaf6fGmBrDc47rQjAOt1rmyD
 56MUBHpLUbvA6NkPezb7T6bQpupyzGRkMUmSwHiLyQNJQhVe+9NiJJvtEE3jol0JVJoQ9WVn
 FAzPNCgHQyvbsIF3gYkCYKI0w8EhEoH5FHYLoKS6Jg880IY5rXzoAEfPvLXegy6mhYl+mNVN
 QUBD4h9XtOvcdzR559lZuC0Ksy7Xqw3BMolmKsRO3gWKhXSna3zKl4UuheyZtubVWoNWP/bn
 vbyiYnLwuiKDfNAinEWERC8nPKlv3PkZw5d3t46F1Dx0TMf16NmP+azsRpnMZyzpY8BL2eur
 feSGAOB9qjZNyzbo5nEKHldKWCKE7Ye0EPEjECS1gjKDwbkBDQRUWrq9AQgA7aJ0i1pQSmUR
 6ZXZD2YEDxia2ByR0uZoTS7N0NYv1OjU8v6p017u0Fco5+Qoju/fZ97ScHhp5xGVAk5kxZBF
 DT4ovJd0nIeSr3bbWwfNzGx1waztfdzXt6n3MBKr7AhioB1m+vuk31redUdnhbtvN7O40MC+
 fgSk5/+jRGxY3IOVPooQKzUO7M51GoOg4wl9ia3H2EzOoGhN2vpTbT8qCcL92ZZZwkBRldoA
 Wn7c1hEKSTuT3f1VpSmhjnX0J4uvKZ1V2R7rooKJYFBcySC0wa8aTmAtAvLgfcpe+legOtgq
 DKzLuN45xzEjyjCiI521t8zxNMPJY9FiCPNv0sCkDwARAQABiQI8BBgBCgAmAhsMFiEE16gc
 tm0zVz86TmBYpjY8MQWQtG0FAlxKNJYFCQnQrVkACgkQpjY8MQWQtG2Xxg//RrRP+PFYuNXt
 9C5hec/JoY24TkGPPd2tMC9usWZVImIk7VlHlAeqHeE0lWU0LRGIvOBITbS9izw6fOVQBvCA
 Fni56S12fKLusWgWhgu03toT9ZGxZ9W22yfw5uThSHQ4y09wRWAIYvhJsKnPGGC2KDxFvtz5
 4pYYNe8Icy4bwsxcgbaSFaRh+mYtts6wE9VzyJvyfTqbe8VrvE+3InG5rrlNn51AO6M4Wv20
 iFEgYanJXfhicl0WCQrHyTLfdB5p1w+072CL8uryHQVfD0FcDe+J/wl3bmYze+aD1SlPzFoI
 MaSIXKejC6oh6DAT4rvU8kMAbX90T834Mvbc3jplaWorNJEwjAH/r+v877AI9Vsmptis+rni
 JwUissjRbcdlkKBisoUZRPmxQeUifxUpqgulZcYwbEC/a49+WvbaYUriaDLHzg9xisijHwD2
 yWV8igBeg+cmwnk0mPz8tIVvwi4lICAgXob7HZiaqKnwaDXs4LiS4vdG5s/ElnE3rIc87yru
 24n3ypeDZ6f5LkdqL1UNp5/0Aqbr3EiN7/ina4YVyscy9754l944kyHnnMRLVykg0v+kakj0
 h0RJ5LbfLAMM8M52KIA3y14g0Fb7kHLcOUMVcgfQ3PrN6chtC+5l6ouDIlSLR3toxH8Aam7E
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <92ff12b3-259f-d0d2-8ec7-e1554f5e4190@citrix.com>
Date: Tue, 16 Apr 2019 14:58:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <55fc24f5-8f6e-08d5-3e9d-946de804d83b@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5] x86/altp2m: Aggregate get entry and
 populate into common funcs
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
Cc: "wei.liu2@citrix.com" <wei.liu2@citrix.com>,
 "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190416135824.mTjV4ikwJqo792TvXKjwe5-c2LoYMR_miLzKJ9FwHQk@z>

T24gNC8xNi8xOSAyOjUxIFBNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IE9uIDE2LzA0LzIwMTkg
MTQ6NDQsIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPj4KPj4+IGRpZmYgLS1naXQgYS94ZW4vaW5j
bHVkZS9hc20teDg2L3AybS5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9wMm0uaAo+Pj4gaW5kZXgg
MjgwMWE4Y2NjYS4uOGRjNDM1MzY0NSAxMDA2NDQKPj4+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14
ODYvcDJtLmgKPj4+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvcDJtLmgKPj4+IEBAIC01MTQs
NiArNTE0LDIzIEBAIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyBtZm5fdG9fZ2ZuKHN0cnVj
dCBkb21haW4gKmQsIG1mbl90IG1mbikKPj4+ICAgICAgICAgIHJldHVybiBtZm5feChtZm4pOwo+
Pj4gIH0KPj4+Cj4+PiAraW50IGFsdHAybV9nZXRfZW50cnkoc3RydWN0IHAybV9kb21haW4gKmFw
Mm0sIGdmbl90IGdmbiwgbWZuX3QgKm1mbiwKPj4+ICsgICAgICAgICAgICAgICAgICAgICBwMm1f
dHlwZV90ICp0LCBwMm1fYWNjZXNzX3QgKmEsIGJvb2wgcHJlcG9wdWxhdGUpOwo+Pj4gKwo+Pj4g
K3N0YXRpYyBpbmxpbmUgaW50IGFsdHAybV9nZXRfZW50cnlfZGlyZWN0KHN0cnVjdCBwMm1fZG9t
YWluICphcDJtLAo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGdmbl90IGdmbiwgbWZuX3QgKm1mbiwKPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBwMm1fdHlwZV90ICp0LCBwMm1fYWNjZXNzX3QgKmEpCj4+PiArewo+Pj4g
KyAgICByZXR1cm4gYWx0cDJtX2dldF9lbnRyeShhcDJtLCBnZm4sIG1mbiwgdCwgYSwgZmFsc2Up
Owo+Pj4gK30KPj4+ICsKPj4+ICtzdGF0aWMgaW5saW5lIGludCBhbHRwMm1fZ2V0X2VudHJ5X3By
ZXBvcHVsYXRlKHN0cnVjdCBwMm1fZG9tYWluICphcDJtLAo+Pj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ2ZuX3QgZ2ZuLCBtZm5fdCAqbWZuLAo+Pj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcDJtX3R5cGVf
dCAqdCwgcDJtX2FjY2Vzc190ICphKQo+Pj4gK3sKPj4+ICsgICAgcmV0dXJuIGFsdHAybV9nZXRf
ZW50cnkoYXAybSwgZ2ZuLCBtZm4sIHQsIGEsIHRydWUpOwo+Pj4gK30KPj4gQXJlIHRoZXNlIHdy
YXBwZXJzIHJlYWxseSByZXF1aXJlZD8gSSBkb24ndCB0aGluayB0aGV5IGFkZCBhbnl0aGluZyB0
bwo+PiByZWFkYWJpbGl0eSwgaXQncyBqdXN0IHlldCBhbm90aGVyIGxheWVyIHRoYXQgZG9lcyBh
bG1vc3Qgbm90aGluZy4KPiAKPiBGcm9tIGEgcmVhZGFiaWxpdHkgcG9pbnQgb2YgdmlldywgYm9v
bGVhbiBwYXJhbWV0ZXJzIGFyZSBhYm91dCBhcyBvcGFxdWUKPiBhcyB0aGV5IGNvbWUuwqAgVGhl
IHNhbWUgZ29lcyBmb3IgYWxsIG90aGVyIHNjYWxhciBwYXJhbWV0ZXJzIHdoaWNoIGRvbid0Cj4g
aGF2ZSBhIG1uZW1vbmljLgo+IAo+IEZvciBzb21lb25lIHdobyBpcyBub3QgYW4gZXhwZXJ0IG9m
IHRoZSBpbnRyaWNhY2llcyBvZiB0aGUgc3Vic3lzdGVtLAo+IGhhdmluZyB0aGUgb3B0aW9ucyBz
cGVsdCBvdXQgaW4gd3JhcHBlcnMgbGlrZSB0aGlzIGlzIGV4dHJlbWVseSBoZWxwZnVsCj4gdG8g
cmVkdWNlIHRoZSBjb2duaXRpdmUgbG9hZCBvZiB0cnlpbmcgdG8gZm9sbG93IHRoZSBjb2RlLgoK
VGhpcyBpcyBleGFjdGx5IHdoeSBJIGRpZCBpdCB0aGlzIHdheS4KClRoZSBvdGhlciBwYXR0ZXJu
IEkgdGhpbmsgaXMgdG9sZXJhYmxlIGlzIGhhdmluZyBhICNkZWZpbmUgdG8gdXNlIGFzIGFuCmFy
Z3VtZW50OyBmb3IgZXhhbXBsZToKCiNkZWZpbmUgQVAyTUdFVF9wcmVwb3B1bGF0ZSB0cnVlCiNk
ZWZpbmUgQVAyTUdFVF9wZWVrICAgICAgICBmYWxzZQoKVGhlbiB5b3UgZ2V0OgoKICBtZm4gPSBh
bHRwMm1fZ2V0X2VudHJ5KC4uLiwgQVAyTUdFVF9wcmVwb3B1bGF0ZSk7CgpCdXQgdGhlbiB5b3Ug
cnVuIGludG8gbmFtZXNwYWNpbmcgaXNzdWVzIHdpdGggdGhlIHByZWZpeGVzLgoKSSB3b3VsZG4n
dCBvYmplY3QgdG8gZG9pbmcgaXQgdGhlIGFib3ZlIHdheSwgYnV0IEkgdGhpbmsgdGhlIHdyYXBw
ZXJzIGlzCnByb2JhYmx5IHNpbXBsZXIgYW5kIGNsZWFyZXIgZm9yIHRoaXMgY2FzZS4gIEkgZG8g
b2JqZWN0IHRvIHBhc3NpbmcgaW4KbmFrZWQgYm9vbGVhbnMuCgogLUdlb3JnZQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
