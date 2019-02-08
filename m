From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH net-next] xen-netback: mark expected switch
 fall-through
Date: Fri, 8 Feb 2019 15:00:52 -0600
Message-ID: <f7c14978-f275-f6bd-6eb3-cc3e84e8c56a__2472.73355941928$1549659732$gmane$org@embeddedor.com>
References: <20190208195838.GA11878@embeddedor>
 <20190208.122152.2025054759290850260.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bdwH=QP=embeddedor.com=gustavo@srs-us1.protection.inumbo.net>)
 id 1gsDGb-0005fU-P7
 for xen-devel@lists.xenproject.org; Fri, 08 Feb 2019 21:00:57 +0000
Received: from cm12.websitewelcome.com (cm12.websitewelcome.com [100.42.49.8])
 by gateway23.websitewelcome.com (Postfix) with ESMTP id 79B7A7D66
 for <xen-devel@lists.xenproject.org>; Fri,  8 Feb 2019 15:00:54 -0600 (CST)
In-Reply-To: <20190208.122152.2025054759290850260.davem@davemloft.net>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Miller <davem@davemloft.net>
Cc: xen-devel@lists.xenproject.org, paul.durrant@citrix.com, wei.liu2@citrix.com, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

CgpPbiAyLzgvMTkgMjoyMSBQTSwgRGF2aWQgTWlsbGVyIHdyb3RlOgo+IEZyb206ICJHdXN0YXZv
IEEuIFIuIFNpbHZhIiA8Z3VzdGF2b0BlbWJlZGRlZG9yLmNvbT4KPiBEYXRlOiBGcmksIDggRmVi
IDIwMTkgMTM6NTg6MzggLTA2MDAKPiAKPj4gSW4gcHJlcGFyYXRpb24gdG8gZW5hYmxpbmcgLVdp
bXBsaWNpdC1mYWxsdGhyb3VnaCwgbWFyayBzd2l0Y2gKPj4gY2FzZXMgd2hlcmUgd2UgYXJlIGV4
cGVjdGluZyB0byBmYWxsIHRocm91Z2guCj4+Cj4+IFdhcm5pbmcgbGV2ZWwgMyB3YXMgdXNlZDog
LVdpbXBsaWNpdC1mYWxsdGhyb3VnaD0zCj4+Cj4+IFRoaXMgcGF0Y2ggaXMgcGFydCBvZiB0aGUg
b25nb2luZyBlZmZvcnRzIHRvIGVuYWJsaW5nCj4+IC1XaW1wbGljaXQtZmFsbHRocm91Z2guCj4+
Cj4+IFNpZ25lZC1vZmYtYnk6IEd1c3Rhdm8gQS4gUi4gU2lsdmEgPGd1c3Rhdm9AZW1iZWRkZWRv
ci5jb20+Cj4gCj4gQXBwbGllZC4KPiAKClRoYW5rcywgRGF2ZS4KCi0tCkd1c3Rhdm8KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
