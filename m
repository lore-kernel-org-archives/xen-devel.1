From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH][next] xen-netback: make function
	xenvif_rx_skb static
Date: Fri, 23 Feb 2018 17:32:48 +0000
Message-ID: <20180223173248.ltt2f5ek2bfzesxt@citrix.com>
References: <20180223171657.5748-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=se9o=fr=citrix.com=prvs=5854c8178=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1epHDN-0002Uf-02
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2018 17:32:57 +0000
Content-Disposition: inline
In-Reply-To: <20180223171657.5748-1-colin.king@canonical.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Colin King <colin.king@canonical.com>
Cc: Wei Liu <wei.liu2@citrix.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBGZWIgMjMsIDIwMTggYXQgMDU6MTY6NTdQTSArMDAwMCwgQ29saW4gS2luZyB3cm90
ZToKPiBGcm9tOiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgo+IAo+
IFRoZSBmdW5jdGlvbiB4ZW52aWZfcnhfc2tiIGlzIGxvY2FsIHRvIHRoZSBzb3VyY2UgYW5kIGRv
ZXMgbm90IG5lZWQKPiB0byBiZSBpbiBnbG9iYWwgc2NvcGUsIHNvIG1ha2UgaXQgc3RhdGljLgo+
IAo+IENsZWFucyB1cCBzcGFyc2Ugd2FybmluZzoKPiBkcml2ZXJzL25ldC94ZW4tbmV0YmFjay9y
eC5jOjQyMjo2OiB3YXJuaW5nOiBzeW1ib2wgJ3hlbnZpZl9yeF9za2InCj4gd2FzIG5vdCBkZWNs
YXJlZC4gU2hvdWxkIGl0IGJlIHN0YXRpYz8KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4g
S2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgoKQWNrZWQtYnk6IFdlaSBMaXUgPHdlaS5s
aXUyQGNpdHJpeC5jb20+CgpUaGFua3MKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
