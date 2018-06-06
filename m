From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH v2 8/9] xen/gntdev: Implement dma-buf import
 functionality
Date: Wed, 6 Jun 2018 15:38:58 +0300
Message-ID: <8676e1d7-3179-5fc0-08fb-02373df4101b__23786.1882699237$1528288664$gmane$org@gmail.com>
References: <20180601114132.22596-1-andr2000@gmail.com>
 <20180601114132.22596-9-andr2000@gmail.com>
 <7ef4f26e-4225-ea7e-8183-9a6c3fe69345@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=yvez=iy=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1fQXiR-0007c0-Bl
 for xen-devel@lists.xenproject.org; Wed, 06 Jun 2018 12:39:03 +0000
Received: by mail-lf0-x244.google.com with SMTP id g21-v6so6880558lfb.4
 for <xen-devel@lists.xenproject.org>; Wed, 06 Jun 2018 05:39:01 -0700 (PDT)
In-Reply-To: <7ef4f26e-4225-ea7e-8183-9a6c3fe69345@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, jgross@suse.com, konrad.wilk@oracle.com
Cc: daniel.vetter@intel.com, matthew.d.roper@intel.com, dongwon.kim@intel.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMDUvMjAxOCAwMToyOCBBTSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+IE9uIDA2LzAx
LzIwMTggMDc6NDEgQU0sIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOgo+PiAgIC8qIC0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLSAqLwo+PiAgIAo+PiArc3RhdGljIGludAo+PiArZG1hYnVmX2ltcF9ncmFudF9mb3Jl
aWduX2FjY2VzcyhzdHJ1Y3QgcGFnZSAqKnBhZ2VzLCB1MzIgKnJlZnMsCj4+ICsJCQkJaW50IGNv
dW50LCBpbnQgZG9taWQpCj4+ICt7Cj4+ICsJZ3JhbnRfcmVmX3QgcHJpdl9ncmVmX2hlYWQ7Cj4+
ICsJaW50IGksIHJldDsKPj4gKwo+PiArCXJldCA9IGdudHRhYl9hbGxvY19ncmFudF9yZWZlcmVu
Y2VzKGNvdW50LCAmcHJpdl9ncmVmX2hlYWQpOwo+PiArCWlmIChyZXQgPCAwKSB7Cj4+ICsJCXBy
X2VycigiQ2Fubm90IGFsbG9jYXRlIGdyYW50IHJlZmVyZW5jZXMsIHJldCAlZFxuIiwgcmV0KTsK
Pj4gKwkJcmV0dXJuIHJldDsKPj4gKwl9Cj4+ICsKPj4gKwlmb3IgKGkgPSAwOyBpIDwgY291bnQ7
IGkrKykgewo+PiArCQlpbnQgY3VyX3JlZjsKPj4gKwo+PiArCQljdXJfcmVmID0gZ250dGFiX2Ns
YWltX2dyYW50X3JlZmVyZW5jZSgmcHJpdl9ncmVmX2hlYWQpOwo+PiArCQlpZiAoY3VyX3JlZiA8
IDApIHsKPj4gKwkJCXJldCA9IGN1cl9yZWY7Cj4+ICsJCQlwcl9lcnIoIkNhbm5vdCBjbGFpbSBn
cmFudCByZWZlcmVuY2UsIHJldCAlZFxuIiwgcmV0KTsKPj4gKwkJCWdvdG8gb3V0Owo+PiArCQl9
Cj4+ICsKPj4gKwkJZ250dGFiX2dyYW50X2ZvcmVpZ25fYWNjZXNzX3JlZihjdXJfcmVmLCBkb21p
ZCwKPj4gKwkJCQkJCXhlbl9wYWdlX3RvX2dmbihwYWdlc1tpXSksIDApOwo+PiArCQlyZWZzW2ld
ID0gY3VyX3JlZjsKPj4gKwl9Cj4+ICsKPj4gKwlyZXQgPSAwOwo+IHJldHVybiAwPwpNeSBiYWQs
IHRoYW5rIHlvdQo+PiArCj4+ICtvdXQ6Cj4+ICsJZ250dGFiX2ZyZWVfZ3JhbnRfcmVmZXJlbmNl
cyhwcml2X2dyZWZfaGVhZCk7Cj4+ICsJcmV0dXJuIHJldDsKPj4gK30KPj4gKwoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
