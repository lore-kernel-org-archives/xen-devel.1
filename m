From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 4/5] x86: move declaration of the
 exception_table to C
Date: Mon, 29 Jan 2018 09:46:28 -0700
Message-ID: <5A6F5DF402000078001A37C8@prv-mh.provo.novell.com>
References: <20180129122643.13008-1-roger.pau@citrix.com>
 <20180129122643.13008-5-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=763w=ey=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1egCZr-0008Cb-Ns
 for xen-devel@lists.xenproject.org; Mon, 29 Jan 2018 16:46:39 +0000
In-Reply-To: <20180129122643.13008-5-roger.pau@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI5LjAxLjE4IGF0IDEzOjI2LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IFRoaXMgbWFrZXMgdGhlIGNvZGUgY2xlYW5lciBiZWNhdXNlIHRoZXJlJ3Mgbm8gbmVlZCB0byBk
ZWNsYXJlIHRoZQo+IGV4Y2VwdGlvbl90YWJsZSBpbiBhc3NlbWJseSwgYW5kIGFsc28gZml4ZXMg
dGhlIGZvbGxvd2luZyBlcnJvciB3aGVuCj4gdXNpbmcgY2xhbmcncyBpbnRlZ3JhdGVkIGFzc2Vt
YmxlcjoKPiAKPiBlbnRyeS5TOjgzNDoxNTogZXJyb3I6IHVuZXhwZWN0ZWQgdG9rZW4gaW4gJy5y
ZXB0JyBkaXJlY3RpdmUKPiAgICAgICAgIC5yZXB0IDMyIC0gKCguIC0gZXhjZXB0aW9uX3RhYmxl
KSAvIDgpCj4gICAgICAgICAgICAgICBeCj4gZW50cnkuUzo4MzY6MTQ6IGVycm9yOiB1bm1hdGNo
ZWQgJy5lbmRyJyBkaXJlY3RpdmUKPiAgICAgICAgIC5lbmRyCj4gICAgICAgICAgICAgIF4KPiAK
PiBUaGlzIHNob3VsZCBiZSBhIG5vbi1mdW5jdGlvbmFsIGNoYW5nZS4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
