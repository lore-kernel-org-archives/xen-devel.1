From: "van der Linden, Frank" <fllinden@amazon.com>
Subject: Re: [PATCH 1/1] x86/xen: Reset VCPU0 info pointer after
 shared_info remap
Date: Mon, 7 May 2018 19:12:22 +0000
Message-ID: <93859B55-41C2-4AF2-9CD7-C8A8AB11097F__20659.7931137823$1525720288$gmane$org@amazon.com>
References: <C508E5F5-024E-4F71-A91E-7BB0BE046F5D@amazon.com>
 <965354d1-e2e7-1764-a14e-bb4258b9ed13@oracle.com>
 <B3C02FE4-651D-4A89-90BB-78E389764688@amazon.com>
 <ab71bf69-5074-ca7d-ceb5-1b42b0a70457@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wlnj=h2=amazon.com=prvs=65821367d=fllinden@srs-us1.protection.inumbo.net>)
 id 1fFlYi-0003H9-8y
 for xen-devel@lists.xenproject.org; Mon, 07 May 2018 19:12:28 +0000
In-Reply-To: <ab71bf69-5074-ca7d-ceb5-1b42b0a70457@oracle.com>
Content-Language: en-US
Content-ID: <A27F10D3DA154B41A56CB4DB1BFAD916@amazon.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "jgross@suse.com" <jgross@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, stable <stable@vger.kernel.org>
List-Id: xen-devel@lists.xenproject.org

DQoNCu+7v09uIDUvNy8xOCwgMTE6NTQgQU0sICJCb3JpcyBPc3Ryb3Zza3kiIDxib3Jpcy5vc3Ry
b3Zza3lAb3JhY2xlLmNvbT4gd3JvdGU6DQoNCiAgICANCiAgICBPSywgZmFpciBlbm91Z2guIFRo
aXMgc2hvdWxkIGdvIHRvIHN0YWJsZSBhcyB3ZWxsIEkgdGhpbmsgKDQuMTIrKSwNCiAgICBjb3B5
aW5nIHRoZW0uDQogICAgDQogICAgUmV2aWV3ZWQtYnk6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMu
b3N0cm92c2t5QG9yYWNsZS5jb20+DQogICAgDQpHcmVhdCwgdGhhbmtzIEJvcmlzLg0KDQpGcmFu
aw0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
