From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH] PCI: Mark expected switch fall-throughs
Date: Wed, 20 Mar 2019 15:23:41 -0500
Message-ID: <141bfdeb-6340-141c-7216-ba1ad8540ff7__28940.1228934125$1553113476$gmane$org@embeddedor.com>
References: <20190320182715.GA9406@embeddedor>
 <20190320201335.GD251185@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=m5Fq=RX=embeddedor.com=gustavo@srs-us1.protection.inumbo.net>)
 id 1h6hkW-0002Pd-8u
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2019 20:23:44 +0000
Received: from cm12.websitewelcome.com (cm12.websitewelcome.com [100.42.49.8])
 by gateway32.websitewelcome.com (Postfix) with ESMTP id 2ED89F567E
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2019 15:23:43 -0500 (CDT)
In-Reply-To: <20190320201335.GD251185@google.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Kees Cook <keescook@chromium.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAzLzIwLzE5IDM6MTMgUE0sIEJqb3JuIEhlbGdhYXMgd3JvdGU6Cj4gT24gV2VkLCBNYXIg
MjAsIDIwMTkgYXQgMDE6Mjc6MTVQTSAtMDUwMCwgR3VzdGF2byBBLiBSLiBTaWx2YSB3cm90ZToK
ClsuLl0KCj4+Cj4+IFdhcm5pbmcgbGV2ZWwgMyB3YXMgdXNlZDogLVdpbXBsaWNpdC1mYWxsdGhy
b3VnaD0zCj4+Cj4+IFRoaXMgcGF0Y2ggaXMgcGFydCBvZiB0aGUgb25nb2luZyBlZmZvcnRzIHRv
IGVuYWJsZQo+PiAtV2ltcGxpY2l0LWZhbGx0aHJvdWdoLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBH
dXN0YXZvIEEuIFIuIFNpbHZhIDxndXN0YXZvQGVtYmVkZGVkb3IuY29tPgo+IAo+IEFwcGxpZWQg
dG8gcGNpL21pc2MgZm9yIHY1LjIsIHRoYW5rcyEKPiAKCkF3ZXNvbWUhCgpUaGFua3MKLS0KR3Vz
dGF2bwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
