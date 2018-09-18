From: "Jan Beulich" <JBeulich@suse.com>
Subject: Ping: [PATCH] x86: use alternatives for FS/GS base
 accesses
Date: Tue, 18 Sep 2018 06:42:29 -0600
Message-ID: <5BA0F2B502000078001E9711@prv1-mh.provo.novell.com>
References: <5B86C3B502000078001E32EC@prv1-mh.provo.novell.com>
 <20180830081303.fh62xdkkqbkflidp@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=xuki=ma=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g2FKr-0005ui-Ti
 for xen-devel@lists.xenproject.org; Tue, 18 Sep 2018 12:42:33 +0000
In-Reply-To: <20180830081303.fh62xdkkqbkflidp@citrix.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMwLjA4LjE4IGF0IDEwOjEzLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gV2VkLCBBdWcgMjksIDIwMTggYXQgMTA6MDM6MDFBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+IEVsaW1pbmF0ZXMgYSBjb3VwbGUgb2YgYnJhbmNoZXMgaW4gcGFydGljdWxhciBmcm9t
IHRoZSBjb250ZXh0IHN3aXRjaAo+PiBwYXRoLgo+PiAKPj4gU2lnbmVkLW9mZi1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IAo+IFJldmlld2VkLWJ5OiBXZWkgTGl1IDx3ZWku
bGl1MkBjaXRyaXguY29tPgoKQW5kcmV3PwoKVGhhbmtzLCBKYW4KCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
