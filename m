From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v6 7/9] x86/mm: provide put_page_type_ptpg{,
 _preemptible}
Date: Tue, 13 Mar 2018 10:17:21 -0600
Message-ID: <5AA807A102000078001B11FE@prv-mh.provo.novell.com>
References: <20180213200408.5463-1-wei.liu2@citrix.com>
 <20180213200408.5463-8-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=c4be=gd=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1evmcB-0005s9-Lb
 for xen-devel@lists.xenproject.org; Tue, 13 Mar 2018 16:17:27 +0000
In-Reply-To: <20180213200408.5463-8-wei.liu2@citrix.com>
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
QEAgLTI3MzYsOCArMjc0NCw4IEBAIGludCBwdXRfb2xkX2d1ZXN0X3RhYmxlKHN0cnVjdCB2Y3B1
ICp2KQo+ICAgICAgaWYgKCAhdi0+YXJjaC5vbGRfZ3Vlc3RfdGFibGUgKQo+ICAgICAgICAgIHJl
dHVybiAwOwo+ICAKPiAtICAgIHN3aXRjaCAoIHJjID0gX3B1dF9wYWdlX3R5cGUodi0+YXJjaC5v
bGRfZ3Vlc3RfdGFibGUsIHRydWUsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHYtPmFyY2gub2xkX2d1ZXN0X3B0cGcpICkKPiArICAgIHN3aXRjaCAoIHJjID0gcHV0X3BhZ2Vf
dHlwZV9wdHBnX3ByZWVtcHRpYmxlKHYtPmFyY2gub2xkX2d1ZXN0X3RhYmxlLAo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdi0+YXJjaC5vbGRfZ3Vl
c3RfcHRwZykgKQoKSGF2aW5nIGxvb2tlZCBicmllZmx5IGF0IHBhdGNoIDgsIGl0IGxvb2tzIGxp
a2UgdGhpcyAtIFBWIG9ubHkKYWZhaWN0IC0gZnVuY3Rpb24gaXMgdGhlIG9ubHkgdGhpbmcgbm90
IGJlaW5nIG1vdmVkIHRoZXJlLCBhbmQKaGVuY2UgdGhlIG9ubHkgcmVhc29uIHRvIGhhdmUgdGhl
IGhlbHBlcnMgeW91IGludHJvZHVjZSBoZXJlLgpQYXJ0IG9mIHlvdXIgcHJvYmxlbSBpcyB0aGF0
IGEgZmFpciBwYXJ0IG9mIGUuZy4gX3B1dF9wYWdlX3R5cGUoKQppcyBQVi1vbmx5LCBhbmQgaGVu
Y2Ugd291bGQgcGVyaGFwcyB3YW50IG1vdmluZyBvciAjaWZkZWYtaW5nLgoKSmFuCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
