From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen,
 cpu_hotplug: Prevent an out of bounds access
Date: Fri, 8 Mar 2019 18:16:38 +0100
Message-ID: <ca3cd95b-a07d-254d-1e42-5a36686a805d@suse.com>
References: <20190307054122.GB4517@kadam>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ygi8=RL=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1h2J6x-0007sS-SR
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2019 17:16:43 +0000
In-Reply-To: <20190307054122.GB4517@kadam>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dan Carpenter <dan.carpenter@oracle.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Alex Nixon <alex.nixon@citrix.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, kernel-janitors@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMDMvMjAxOSAwNjo0MSwgRGFuIENhcnBlbnRlciB3cm90ZToKPiBUaGUgImNwdSIgdmFy
aWFibGUgY29tZXMgZnJvbSB0aGUgc3NjYW5mKCkgc28gU21hdGNoIG1hcmtzIGl0IGFzCj4gdW50
cnVzdGVkIGRhdGEuICBXZSBjYW4ndCBwYXNzIGEgaGlnaGVyIHZhbHVlIHRoYW4gIm5yX2NwdV9p
ZHMiIHRvCj4gY3B1X3Bvc3NpYmxlKCkgb3IgaXQgcmVzdWx0cyBpbiBhbiBvdXQgb2YgYm91bmRz
IGFjY2Vzcy4KPiAKPiBGaXhlczogZDY4ZDgyYWZkNGM4ICgieGVuOiBpbXBsZW1lbnQgQ1BVIGhv
dHBsdWdnaW5nIikKPiBTaWduZWQtb2ZmLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVy
QG9yYWNsZS5jb20+CgpQdXNoZWQgdG8geGVuL3RpcC5naXQgZm9yLWxpbnVzLTUuMWEKCgpKdWVy
Z2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
