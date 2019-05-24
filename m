From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/5] pci: use function generation macros for
 pci_config_{write, read}<size>
Date: Fri, 24 May 2019 03:10:03 -0600
Message-ID: <5CE7B4EB0200007800231EA9@prv1-mh.provo.novell.com>
References: <20190510161056.48648-1-roger.pau@citrix.com>
 <20190510161056.48648-3-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8EJT=TY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hU6DF-0002Y6-I1
 for xen-devel@lists.xenproject.org; Fri, 24 May 2019 09:10:05 +0000
In-Reply-To: <20190510161056.48648-3-roger.pau@citrix.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEwLjA1LjE5IGF0IDE4OjEwLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IFRoaXMgYXZvaWRzIGNvZGUgZHVwbGljYXRpb24gYmV0d2VlbiB0aGUgaGVscGVycy4KPiAKPiBO
byBmdW5jdGlvbmFsIGNoYW5nZSBpbnRlbmRlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQ
YXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
