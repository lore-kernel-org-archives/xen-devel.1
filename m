From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v11 5/9] xen/x86: use DECLARE_BOUNDS as
 required
Date: Thu, 07 Mar 2019 01:40:17 -0700
Message-ID: <5C80D8F1020000780021C55F@prv1-mh.provo.novell.com>
References: <alpine.DEB.2.10.1903051433230.17552@sstabellini-ThinkPad-X260>
 <1551825512-8975-5-git-send-email-sstabellini@kernel.org>
 <5C7FE846020000780021C2BA@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1903061300510.17248@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9kmr=RK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h1oZm-0001Ei-7E
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2019 08:40:26 +0000
In-Reply-To: <alpine.DEB.2.10.1903061300510.17248@sstabellini-ThinkPad-X260>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Stefano Stabellini <stefanos@xilinx.com>, Andrew Cooper <andrew.cooper3@citrix.com>, george.dunlap@citrix.com, Julien Grall <julien.grall@arm.com>, ian.jackson@citrix.com, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA2LjAzLjE5IGF0IDIyOjA1LCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6
Cj4gT24gV2VkLCA2IE1hciAyMDE5LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gPj4+IE9uIDA1LjAz
LjE5IGF0IDIzOjM4LCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4+ID4gQEAgLTYw
MCw3ICs2MDIsOSBAQCBzdGF0aWMgdm9pZCBub2lubGluZSBpbml0X2RvbmUodm9pZCkKPj4gPiAg
ICAgIHVucmVnaXN0ZXJfaW5pdF92aXJ0dWFsX3JlZ2lvbigpOwo+PiA+ICAKPj4gPiAgICAgIC8q
IFplcm8gdGhlIC5pbml0IGNvZGUgYW5kIGRhdGEuICovCj4+ID4gLSAgICBmb3IgKCB2YSA9IF9f
aW5pdF9iZWdpbjsgdmEgPCBfcChfX2luaXRfZW5kKTsgdmEgKz0gUEFHRV9TSVpFICkKPj4gPiAr
ICAgIGZvciAoIHZhID0gKGNoYXIgKilfX2luaXRfYmVnaW47Cj4+ID4gKyAgICAgICAgICBpbml0
X2x0KHZhLCBfX2luaXRfZW5kKTsKPj4gPiArICAgICAgICAgIHZhICs9IFBBR0VfU0laRSApCj4+
IAo+PiBJcyB0aGUgbGluZSB3cmFwcGluZyByZWFsbHkgbmVlZGVkIGhlcmU/Cj4gCj4gSXQgd291
bGQgZW5kIGF0IDgwIGNoYXJhY3RlcnMgZXhhY3RseSBvdGhlcndpc2UuIEkgYW0gaGFwcHkgdG8g
ZG8gYXMgeW91Cj4gcHJlZmVyLgoKQW5kIDgwIGNoYXJhY3RlcnMgaXMgd2hhdCB3ZSBwZXJtaXQu
CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
