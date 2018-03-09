From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] x86/domctl: remove impossible condition
 in XEN_DOMCTL_getpageframeinfo3
Date: Fri, 09 Mar 2018 09:37:06 -0700
Message-ID: <5AA2C64202000078001B064C@prv-mh.provo.novell.com>
References: <20180309162343.19589-1-olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180309162343.19589-1-olaf@aepfle.de>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA5LjAzLjE4IGF0IDE3OjIzLCA8b2xhZkBhZXBmbGUuZGU+IHdyb3RlOgo+IC0tLSBh
L3hlbi9hcmNoL3g4Ni9kb21jdGwuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9kb21jdGwuYwo+IEBA
IC00MTUsMTQgKzQxNSwxMyBAQCBsb25nIGFyY2hfZG9fZG9tY3RsKAo+ICAKPiAgICAgIGNhc2Ug
WEVOX0RPTUNUTF9nZXRwYWdlZnJhbWVpbmZvMzoKPiAgICAgIHsKPiAtICAgICAgICB1bnNpZ25l
ZCBpbnQgbnVtID0gZG9tY3RsLT51LmdldHBhZ2VmcmFtZWluZm8zLm51bTsKPiArICAgICAgICB1
bnNpZ25lZCBsb25nIG51bSA9IGRvbWN0bC0+dS5nZXRwYWdlZnJhbWVpbmZvMy5udW07Cj4gICAg
ICAgICAgdW5zaWduZWQgaW50IHdpZHRoID0gaGFzXzMyYml0X3NoaW5mbyhjdXJyZCkgPyA0IDog
ODsKPiAgCj4gICAgICAgICAgLyogR2FtZXMgdG8gYWxsb3cgdGhpcyBjb2RlIGJsb2NrIHRvIGhh
bmRsZSBhIGNvbXBhdCBndWVzdC4gKi8KPiAgICAgICAgICB2b2lkIF9fdXNlciAqZ3Vlc3RfaGFu
ZGxlID0gZG9tY3RsLT51LmdldHBhZ2VmcmFtZWluZm8zLmFycmF5LnA7Cj4gIAo+IC0gICAgICAg
IGlmICggdW5saWtlbHkobnVtID4gWEVOX0dFVFBBR0VGUkFNRUlORk8zX01BWF9TSVpFKSB8fAo+
IC0gICAgICAgICAgICAgdW5saWtlbHkobnVtICE9IGRvbWN0bC0+dS5nZXRwYWdlZnJhbWVpbmZv
My5udW0pICkKPiArICAgICAgICBpZiAoIHVubGlrZWx5KG51bSA+IFhFTl9HRVRQQUdFRlJBTUVJ
TkZPM19NQVhfU0laRSkgKQoKSU1PIHRoaXMgZG9lc24ndCBpbXByb3ZlIGFueXRoaW5nLiBJZiB5
b3Ugd2FudGVkIHRoZSB0eXBlcyB0bwpyZW1haW4gaW4gc3luYyAoYW5kIGRvY3VtZW50IHRoYXQp
LCB5b3UnZCBuZWVkIHRvIHVzZSB0eXBlb2YoKS4KCkphbgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
