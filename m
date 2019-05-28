From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2] xen/swiotlb: don't initialize swiotlb
 twice on arm64
Date: Tue, 28 May 2019 19:50:02 -0400
Message-ID: <4cfc2555-8933-b036-7068-470c388a665f@oracle.com>
References: <alpine.DEB.2.21.1905281546410.16734@sstabellini-ThinkPad-T480s>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jUEB=T4=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1hVls1-0003aV-3K
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 23:51:05 +0000
In-Reply-To: <alpine.DEB.2.21.1905281546410.16734@sstabellini-ThinkPad-T480s>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>, konrad.wilk@oracle.com, jgross@suse.com
Cc: xen-devel@lists.xenproject.org, Julien.Grall@arm.com
List-Id: xen-devel@lists.xenproject.org

T24gNS8yOC8xOSA2OjQ4IFBNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gRnJvbTogU3Rl
ZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vc0B4aWxpbnguY29tPgo+Cj4gT24gYXJtNjQgc3dpb3Rs
YiBpcyBvZnRlbiAobm90IGFsd2F5cykgYWxyZWFkeSBpbml0aWFsaXplZCBieSBtZW1faW5pdC4K
PiBXZSBkb24ndCB3YW50IHRvIGluaXRpYWxpemUgaXQgdHdpY2UsIHdoaWNoIHdvdWxkIHRyaWdn
ZXIgYSBzZWNvbmQKPiBtZW1vcnkgYWxsb2NhdGlvbi4gTW9yZW92ZXIsIHRoZSBzZWNvbmQgbWVt
b3J5IHBvb2wgaXMgdHlwaWNhbGx5IG1hZGUgb2YKPiBoaWdoIHBhZ2VzIGFuZCBlbmRzIHVwIHJl
cGxhY2luZyB0aGUgb3JpZ2luYWwgbWVtb3J5IHBvb2wgb2YgbG93IHBhZ2VzLgo+IEFzIGEgc2lk
ZSBlZmZlY3Qgb2YgdGhpcyBjaGFuZ2UsIGl0IGlzIHBvc3NpYmxlIHRvIGhhdmUgbG93IHBhZ2Vz
IGluCj4gc3dpb3RsYi14ZW4gb24gYXJtNjQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0
YWJlbGxpbmkgPHN0ZWZhbm9zQHhpbGlueC5jb20+CgpIYXMgdGhpcyBiZWVuIHRlc3RlZCBvbiB4
ODY/CgotYm9yaXMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
