From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v9 01/11] x86/cpu: Introduce
 vmce_save_vcpu_ctxt_one() func
Date: Fri, 29 Jun 2018 09:54:36 -0600
Message-ID: <5B36563C02000078001CF48B@prv1-mh.provo.novell.com>
References: <1530177936-28379-1-git-send-email-aisaila@bitdefender.com>
 <1530177936-28379-2-git-send-email-aisaila@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1530177936-28379-2-git-send-email-aisaila@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: aisaila@bitdefender.com
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI4LjA2LjE4IGF0IDExOjI1LCA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3Rl
Ogo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9jcHUvbWNoZWNrL3ZtY2UuYwo+ICsrKyBiL3hlbi9hcmNo
L3g4Ni9jcHUvbWNoZWNrL3ZtY2UuYwo+IEBAIC0zNDksNiArMzQ5LDIwIEBAIGludCB2bWNlX3dy
bXNyKHVpbnQzMl90IG1zciwgdWludDY0X3QgdmFsKQo+ICAgICAgcmV0dXJuIHJldDsKPiAgfQo+
ICAKPiArc3RhdGljIGludCB2bWNlX3NhdmVfdmNwdV9jdHh0X29uZShzdHJ1Y3QgdmNwdSAqdiwg
aHZtX2RvbWFpbl9jb250ZXh0X3QgKmgpCj4gKyB7Cj4gKyAgICBzdHJ1Y3QgaHZtX3ZtY2VfdmNw
dSBjdHh0Owo+ICsKPiArICAgIGN0eHQuY2FwcyA9IHYtPmFyY2gudm1jZS5tY2dfY2FwOwo+ICsg
ICAgY3R4dC5tY2lfY3RsMl9iYW5rMCA9IHYtPmFyY2gudm1jZS5iYW5rWzBdLm1jaV9jdGwyOwo+
ICsgICAgY3R4dC5tY2lfY3RsMl9iYW5rMSA9IHYtPmFyY2gudm1jZS5iYW5rWzFdLm1jaV9jdGwy
Owo+ICsgICAgY3R4dC5tY2dfZXh0X2N0bCA9IHYtPmFyY2gudm1jZS5tY2dfZXh0X2N0bDsKPiAr
Cj4gKyAgICBpZiAoIGh2bV9zYXZlX2VudHJ5KFZNQ0VfVkNQVSwgdi0+dmNwdV9pZCwgaCwgJmN0
eHQpICE9IDAgKQo+ICsgICAgICAgIHJldHVybiAxOwoKQWZhaWN0IGh2bV9zYXZlX2VudHJ5KCkg
Y2FuIHJldHVybiAwIGFuZCAtMSBhdCBwcmVzZW50LiBZb3UgY29udmVydAp0aGlzIHRvIDEgaGVy
ZS4gQ2FuIHlvdSBwbGVhc2Ugc2ltcGx5IGhhbmQgdGhyb3VnaCByZXR1cm4gdmFsdWVzLCBzbwp0
aGF0IGlmIGh2bV9zYXZlX2VudHJ5KCkgZXZlciBvYnRhaW5zIGEgbmV3IHBvc3NpYmxlIHJldHVy
biB2YWx1ZSwKdGhpcyB3aWxsIGJlIGhhbmRlZCB0aHJvdWdoIGZpbmQgd2l0aG91dCBoYXZpbmcg
dG8gdG91Y2ggdW5yZWxhdGVkIGNvZGU/Cgo+ICsgICAgcmV0dXJuIDA7CgpJIGRvbid0IHVuZGVy
c3RhbmQgYW55d2F5IHdoeSB5b3UgZGlkbid0IHBpY2sgdGhlIHNpbXBsZXIKCiAgICByZXR1cm4g
aHZtX3NhdmVfZW50cnkoVk1DRV9WQ1BVLCB2LT52Y3B1X2lkLCBoLCAmY3R4dCk7CgpKYW4KCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
