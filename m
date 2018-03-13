From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v6 7/9] x86/mm: provide put_page_type_ptpg{,
 _preemptible}
Date: Tue, 13 Mar 2018 10:10:11 -0600
Message-ID: <5AA805F302000078001B11D4@prv-mh.provo.novell.com>
References: <20180213200408.5463-1-wei.liu2@citrix.com>
 <20180213200408.5463-8-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=c4be=gd=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1evmVJ-0005XQ-Th
 for xen-devel@lists.xenproject.org; Tue, 13 Mar 2018 16:10:21 +0000
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
QW5kIHJlcGxhY2Ugb3Blbi1jb2RlZCBfcHV0X3BhZ2VfdHlwZSB3aGVyZSB0aGUgcGFyZW50IHRh
YmxlIHBhcmFtZXRlcgo+IGlzIG5vdCBudWxsLgo+IAo+IFRoaXMgaXMgaW4gcHJlcGFyYXRpb24g
Zm9yIGNvZGUgbW92ZW1lbnQgaW4gd2hpY2ggdmFyaW91cwo+IHB1dF9wYWdlX2Zyb21fbE5lIHdp
bGwgYmUgbW92ZWQgdG8gcHYvbW0uYy4KCkkgZGlzbGlrZSBib3RoIHRoZSBwcm9saWZlcmF0aW9u
IG9mIG5ldyBmdW5jdGlvbnMgaGVyZSBhbmQsIGFzCmluZGljYXRlZCBiZWZvcmUsIHRoZW0gYmVp
bmcgbm9uLXN0YXRpYyB3aGVuIHRoZXkncmUgdXNlZCBpbgpqdXN0IGEgc2luZ2xlIHNvdXJjZSBm
aWxlLiBCeSB0aGlzIHBvaW50IGluIHRoZSBzZXJpZXMgSSBoYXZlIHRvCmFkbWl0IEknbSBub3Qg
Y29udmluY2VkIG9mIHRoZSBkaXJlY3Rpb24gYWxsIHRoaXMgaXMgdGFraW5nLgoKSmFuCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
