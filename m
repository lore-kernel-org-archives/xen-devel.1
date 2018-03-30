From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2] xl/libxl: add pvcalls support
Date: Fri, 30 Mar 2018 09:25:34 +0100
Message-ID: <20180330082534.raumpptl55dnwy7c@citrix.com>
References: <1522361220-11023-1-git-send-email-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=n90s=gu=citrix.com=prvs=62014e120=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1f1pLt-0001up-V2
 for xen-devel@lists.xenproject.org; Fri, 30 Mar 2018 08:25:37 +0000
Content-Disposition: inline
In-Reply-To: <1522361220-11023-1-git-send-email-sstabellini@kernel.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Stefano Stabellini <stefano@aporeto.com>, ian.jackson@eu.citrix.com, wei.liu2@citrix.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXIgMjksIDIwMTggYXQgMDM6MDc6MDBQTSAtMDcwMCwgU3RlZmFubyBTdGFiZWxs
aW5pIHdyb3RlOgo+IEFkZCBwdmNhbGxzIHN1cHBvcnQgdG8gbGlieGwgYW5kIHhsLiBDcmVhdGUg
dGhlIGFwcHJvcHJpYXRlIHB2Y2FsbHMKPiBlbnRyaWVzIGluIHhlbnN0b3JlLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3RlZmFub0BhcG9yZXRvLmNvbT4KCkFja2Vk
LWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKUGxlYXNlIGFsc28gc3VibWl0IGEg
ZG9jIHBhdGNoLgoKPiArI2luY2x1ZGUgImxpYnhsX29zZGVwcy5oIgo+ICsKPiArI2luY2x1ZGUg
ImxpYnhsX2ludGVybmFsLmgiCj4gKwo+ICtzdGF0aWMgaW50IGxpYnhsX19kZXZpY2VfcHZjYWxs
c2lmX3NldGRlZmF1bHQobGlieGxfX2djICpnYywgdWludDMyX3QgZG9taWQsCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGlieGxfZGV2aWNlX3B2Y2FsbHNp
ZiAqcHZjYWxsc2lmLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGJvb2wgaG90cGx1ZykKCkluZGVudGF0aW9uIG5lZWRzIGZpeGluZywgYnV0IHRoaXMgY2Fu
IGJlIGRvbmUgdXBvbiBjb21taXR0aW5nLgoKPiAgCj4gKyAgICBpZiAoIXhsdV9jZmdfZ2V0X2xp
c3QoY29uZmlnLCAicHZjYWxscyIsICZwdmNhbGxzaWZzX2RldnMsIDAsIDApKSB7Cj4gKyAgICAg
ICAgZF9jb25maWctPm51bV9wdmNhbGxzaWZzID0gMDsKPiArICAgICAgICBkX2NvbmZpZy0+cHZj
YWxsc2lmcyA9IE5VTEw7Cj4gKyAgICAgICAgd2hpbGUgKChidWYgPSB4bHVfY2ZnX2dldF9saXN0
aXRlbSAocHZjYWxsc2lmc19kZXZzLCBkX2NvbmZpZy0+bnVtX3B2Y2FsbHNpZnMpKSAhPSBOVUxM
KSB7Cj4gKyAgICAgICAgICAgIGxpYnhsX2RldmljZV9wdmNhbGxzaWYgKnB2Y2FsbHNpZjsKPiAr
ICAgICAgICAgICAgY2hhciAqYmFja2VuZCA9IE5VTEw7Cj4gKyAgICAgICAgICAgIGNoYXIgKnAs
ICpwMiwgKmJ1ZjI7Cj4gKyAgICAgICAgICAgIHB2Y2FsbHNpZiA9IEFSUkFZX0VYVEVORF9JTklU
KGRfY29uZmlnLT5wdmNhbGxzaWZzLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGRfY29uZmlnLT5udW1fcHZjYWxsc2lmcywKPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBsaWJ4bF9kZXZpY2VfcHZjYWxsc2lmX2luaXQpOwoKU2FtZSBoZXJlLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
