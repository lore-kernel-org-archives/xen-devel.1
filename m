From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/4] xen/arch: Switch local_save_flags() to
 being a static inline helper
Date: Mon, 26 Nov 2018 06:15:24 -0700
Message-ID: <5BFBF1EC02000078001FFFDA@prv1-mh.provo.novell.com>
References: <1542991976-6190-1-git-send-email-andrew.cooper3@citrix.com>
 <1542991976-6190-3-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1542991976-6190-3-git-send-email-andrew.cooper3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIzLjExLjE4IGF0IDE3OjUyLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9zeXN0ZW0uaAo+ICsrKyBiL3hlbi9pbmNs
dWRlL2FzbS14ODYvc3lzdGVtLmgKPiBAQCAtMjUzLDE0ICsyNTMsMTggQEAgc3RhdGljIGlubGlu
ZSB1bnNpZ25lZCBsb25nIGFycmF5X2luZGV4X21hc2tfbm9zcGVjKHVuc2lnbmVkIGxvbmcgaW5k
ZXgsCj4gIC8qIHVzZWQgd2hlbiBpbnRlcnJ1cHRzIGFyZSBhbHJlYWR5IGVuYWJsZWQgb3IgdG8g
c2h1dGRvd24gdGhlIHByb2Nlc3NvciAqLwo+ICAjZGVmaW5lIGhhbHQoKSAgICAgICAgICBhc20g
dm9sYXRpbGUgKCAiaGx0IiA6IDogOiAibWVtb3J5IiApCj4gIAo+IC0jZGVmaW5lIGxvY2FsX3Nh
dmVfZmxhZ3MoeCkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAtKHsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBcCj4gLSAgICBCVUlMRF9CVUdfT04oc2l6ZW9mKHgpICE9IHNpemVvZihsb25nKSk7ICAg
ICAgICAgICAgICAgICAgICAgXAo+IC0gICAgYXNtIHZvbGF0aWxlICggInB1c2hmIiBfX09TICIg
OyBwb3AiIF9fT1MgIiAlMCIgOiAiPWciICh4KSk7IFwKPiAtfSkKPiArc3RhdGljIGlubGluZSB1
bnNpZ25lZCBsb25nIGxvY2FsX3NhdmVfZmxhZ3Modm9pZCkKPiArewo+ICsgICAgdW5zaWduZWQg
bG9uZyBmbGFnczsKPiArCj4gKyAgICBhc20gdm9sYXRpbGUgKCAicHVzaGY7IHBvcCAlMDsiIDog
Ij1nIiAoZmxhZ3MpICk7Cj4gKwo+ICsgICAgcmV0dXJuIGZsYWdzOwo+ICt9CgpQcm92aWRlZCB0
aGlzIGRvZXNuJ3QgZGVmZWF0IHRoZSBjdXJyZW50IHBvc3NpYmlsaXR5IG9mIHRoZSBjb21waWxl
cgpQT1AtaW5nIGRpcmVjdGx5IGludG8gYSBzdGFjayB2YXJpYWJsZQpSZXZpZXdlZC1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKQXBhcnQgZnJvbSB0aGlzIEknbSBhIGxpdHRs
ZSBwdXp6bGVkIGJ5IHRoZSB1cHBlcmNhc2luZyBvZiBTQVZFIGluCnRoZSBBcm0gYXNtKCkgY29t
bWVudHMsIGJ1dCBJJ2xsIGxlYXZlIHRoYXQgdG8gdGhlIEFybSBtYWludGFpbmVycy4KCkphbgoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
