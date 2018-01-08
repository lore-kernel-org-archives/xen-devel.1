From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC v1 06/74] tools/libelf: fix elf notes
 check for PVH guest
Date: Mon, 08 Jan 2018 09:02:43 -0700
Message-ID: <5A53A433020000780019C4F8@prv-mh.provo.novell.com>
References: <20180104130625.28605-1-wei.liu2@citrix.com>
 <20180104130625.28605-7-wei.liu2@citrix.com>
 <5A4E4A30020000780019B179@prv-mh.provo.novell.com>
 <20180108153446.wunklij2kxshog6s@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=dk2s=ed=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eYZt0-0007oD-Qp
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2018 16:02:54 +0000
In-Reply-To: <20180108153446.wunklij2kxshog6s@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: wei.liu2@citrix.com
Cc: Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA4LjAxLjE4IGF0IDE2OjM0LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gVGh1LCBKYW4gMDQsIDIwMTggYXQgMDc6Mzc6MjBBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+ID4+PiBPbiAwNC4wMS4xOCBhdCAxNDowNSwgPHdlaS5saXUyQGNpdHJpeC5jb20+IHdy
b3RlOgo+PiBJJ20gYWxzbyBzdXJwcmlzZWQgdGhhdCBJIGNhbid0IGZpbmQgYW55IHVzZSBvZiBh
bnkgb2YgdGhlIHRocmVlCj4+IHZhbHVlcyBjaGVja2VkIGluIGxpYnhjLgo+IAo+IExpYnhjIGRl
bGVnYXRlcyB0aGUgd29yayB0byBsaWJlbGYgQUlVSS4KCkJ1dCBsaWJlbGYgZG9lc24ndCBpdHNl
bGYgZG8gYW55dGhpbmcgd2l0aCBlLmcuIHhlbl92ZXIsIGFmYWljcy4KCkphbgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
