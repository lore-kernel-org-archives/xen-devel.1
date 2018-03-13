From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v6 5/9] x86/mm: factor out pv_dec_linear_pt
Date: Tue, 13 Mar 2018 09:59:17 -0600
Message-ID: <5AA8036502000078001B11A4@prv-mh.provo.novell.com>
References: <20180213200408.5463-1-wei.liu2@citrix.com>
 <20180213200408.5463-6-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=c4be=gd=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1evmKl-0003Jm-SV
 for xen-devel@lists.xenproject.org; Tue, 13 Mar 2018 15:59:27 +0000
In-Reply-To: <20180213200408.5463-6-wei.liu2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjAyLjE4IGF0IDIxOjA0LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
TGluZWFyIHBhZ2UgdGFibGUgaXMgYSBQViBvbmx5IGZlYXR1cmUuIFRoZSBmdW5jdGlvbnMgdXNl
ZCB0byBoYW5kbGUKPiB0aGF0IHdpbGwgYmUgbW92ZWQuCgpCdXQgdGhlIGZ1bmN0aW9ucyBkZWFs
aW5nIHdpdGggbGluZWFyIHBhZ2UgdGFibGVzIGFyZSBhbGwgaGVscGVycyB0bwpQVi1vbmx5IGZ1
bmN0aW9ucy4gV2h5IGRvZXMgYW55IG9mIHRoaXMgbmVlZCB0byBiZWNvbWUgbm9uLQpzdGF0aWMg
b3IgZmFjdG9yZWQgb3V0PyBJdCBzaG91bGQgYWxsIGJlIG1vdmVkIGluIG9uZSBnby4KCj4gQEAg
LTcwLDYgKzcyLDkgQEAgc3RhdGljIGlubGluZSBpbnQgcHZfcHV0X2ZpbmFsX3BhZ2VfdHlwZShz
dHJ1Y3QgcGFnZV9pbmZvICpwYWdlLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHN0cnVjdCBwYWdlX2luZm8gKnB0cGcpCj4gIHsgQVNTRVJUX1VOUkVBQ0hBQkxF
KCk7IHJldHVybiAtRUlOVkFMOyB9Cj4gIAo+ICtzdGF0aWMgaW5saW5lIHZvaWQgcHZfZGVjX2xp
bmVhcl9wdChzdHJ1Y3QgcGFnZV9pbmZvICpwdHBnLCBzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlLAo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIHR5cGUp
IHt9CgpBbG9uZyB0aG9zZSBsaW5lcywgaWYgc3VjaCBhIHBsYWNlaG9sZGVyIHdhcyBpbmRlZWQg
bmVjZXNzYXJ5LCBpdApzaG91bGQgZ2FpbiBBU1NFUlRfVU5SRUFDSEFCTEUoKSBJIHRoaW5rLgoK
SmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
