From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH net-next] xen-netfront: mark expected switch
 fall-through
Date: Tue, 16 Apr 2019 09:52:42 -0500
Message-ID: <6641fe7a-b1a2-bd2d-9c4e-7dbc00fec015__39154.4950705551$1555426427$gmane$org@embeddedor.com>
References: <20190415211141.GA1732@embeddedor>
 <0169c220-8a56-f1cb-1922-d17ea56b1427@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/X9o=SS=embeddedor.com=gustavo@srs-us1.protection.inumbo.net>)
 id 1hGPS6-0006nx-Vv
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2019 14:52:51 +0000
Received: from cm13.websitewelcome.com (cm13.websitewelcome.com [100.42.49.6])
 by gateway20.websitewelcome.com (Postfix) with ESMTP id 46B34400D9EA7
 for <xen-devel@lists.xenproject.org>; Tue, 16 Apr 2019 09:52:48 -0500 (CDT)
In-Reply-To: <0169c220-8a56-f1cb-1922-d17ea56b1427@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, "David S. Miller" <davem@davemloft.net>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>, netdev@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

CgpPbiA0LzE2LzE5IDI6MTcgQU0sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gT24gMTUvMDQvMjAx
OSAyMzoxMSwgR3VzdGF2byBBLiBSLiBTaWx2YSB3cm90ZToKPj4gSW4gcHJlcGFyYXRpb24gdG8g
ZW5hYmxpbmcgLVdpbXBsaWNpdC1mYWxsdGhyb3VnaCwgbWFyayBzd2l0Y2gKPj4gY2FzZXMgd2hl
cmUgd2UgYXJlIGV4cGVjdGluZyB0byBmYWxsIHRocm91Z2guCj4+Cj4+IFRoaXMgcGF0Y2ggZml4
ZXMgdGhlIGZvbGxvd2luZyB3YXJuaW5nOgo+Pgo+PiBkcml2ZXJzL25ldC94ZW4tbmV0ZnJvbnQu
YzogSW4gZnVuY3Rpb24g4oCYbmV0YmFja19jaGFuZ2Vk4oCZOgo+PiBkcml2ZXJzL25ldC94ZW4t
bmV0ZnJvbnQuYzoyMDM4OjY6IHdhcm5pbmc6IHRoaXMgc3RhdGVtZW50IG1heSBmYWxsIHRocm91
Z2ggWy1XaW1wbGljaXQtZmFsbHRocm91Z2g9XQo+PiAgICBpZiAoZGV2LT5zdGF0ZSA9PSBYZW5i
dXNTdGF0ZUNsb3NlZCkKPj4gICAgICAgXgo+PiBkcml2ZXJzL25ldC94ZW4tbmV0ZnJvbnQuYzoy
MDQxOjI6IG5vdGU6IGhlcmUKPj4gICBjYXNlIFhlbmJ1c1N0YXRlQ2xvc2luZzoKPj4gICBefn5+
Cj4+Cj4+IFdhcm5pbmcgbGV2ZWwgMyB3YXMgdXNlZDogLVdpbXBsaWNpdC1mYWxsdGhyb3VnaD0z
Cj4+Cj4+IE5vdGljZSB0aGF0LCBpbiB0aGlzIHBhcnRpY3VsYXIgY2FzZSwgdGhlIGNvZGUgY29t
bWVudCBpcyBtb2RpZmllZAo+PiBpbiBhY2NvcmRhbmNlIHdpdGggd2hhdCBHQ0MgaXMgZXhwZWN0
aW5nIHRvIGZpbmQuCj4+Cj4+IFRoaXMgcGF0Y2ggaXMgcGFydCBvZiB0aGUgb25nb2luZyBlZmZv
cnRzIHRvIGVuYWJsZQo+PiAtV2ltcGxpY2l0LWZhbGx0aHJvdWdoLgo+Pgo+PiBTaWduZWQtb2Zm
LWJ5OiBHdXN0YXZvIEEuIFIuIFNpbHZhIDxndXN0YXZvQGVtYmVkZGVkb3IuY29tPgo+IAo+IFJl
dmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gCgpUaGFua3MsIEp1
ZXJnZW4uCi0tCkd1c3Rhdm8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
