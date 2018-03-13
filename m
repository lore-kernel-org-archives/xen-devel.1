From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2] libxl: put RSDP for PVH guest near 4GB
Date: Tue, 13 Mar 2018 13:51:15 -0400
Message-ID: <28e7dced-0eba-09e8-1033-091380f7d062@oracle.com>
References: <20171201141407.21993-1-jgross@suse.com>
 <cfa0d19b-ace7-4d41-7889-ec9ff6eef85a@suse.com>
 <20180118103330.6ampgvc5ovejzyfp@citrix.com>
 <18edbc21-6661-a236-9369-d3f603b2a03a@oracle.com>
 <CAFLBxZYaoUzqH4OGnn56qjX8KzAWWSVJqToWqRLncVC+kLxvZg@mail.gmail.com>
 <20180124105453.xlaech23qkl6ebni@MacBook-Pro-de-Roger.local>
 <ee015869-6b7d-c12a-4f2f-266c8bccb2d8@suse.com>
 <fc33fe29-9e99-56e5-e064-7fefd28f7fe7@oracle.com>
 <CAFLBxZb=a3wC_i49FJ2sk3g73p6WQxyGR_qBR2P3rNu-4-7QgQ@mail.gmail.com>
 <dbf149c4-15f1-9374-0eb5-7317d9c6f76e@suse.com>
 <CAFLBxZYLBLbvEk2LRuT6U1vNSyUoam+vT_AR4CLEtc8oB1Qewg@mail.gmail.com>
 <912d7e14-5836-d2aa-ccde-cb5b232bcc34@eikelenboom.it>
 <003c1ebc-ab90-0a0b-7938-bbd1647662c0@suse.com>
 <541daacf-7dcb-1f30-ff37-2463a9f4c8f5@eikelenboom.it>
 <5160714b-9aac-f582-a53e-bcf335519e98@eikelenboom.it>
 <935bc435-b6fe-984f-79fd-27ecf6e8c349@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=y1u+=gd=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1evoEo-0001b9-NB
 for xen-devel@lists.xenproject.org; Tue, 13 Mar 2018 18:01:26 +0000
In-Reply-To: <935bc435-b6fe-984f-79fd-27ecf6e8c349@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, Sander Eikelenboom <linux@eikelenboom.it>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwMy8xMy8yMDE4IDAxOjI3IEFNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+IE9uIDEyLzAz
LzE4IDIwOjI2LCBTYW5kZXIgRWlrZWxlbmJvb20gd3JvdGU6Cj4+IEhpIEp1ZXJnZW4sCj4+Cj4+
IEkgZG9uJ3Qga25vdyBieSB3aGljaCB0cmVlIHRob3NlIHBhdGNoZXMgc2hvdWxkIGFycml2ZSBh
dCBMaW51cywKPj4gc28gaSBjYW4ndCBjaGVjayBpZiB0aGV5IGZlbGwgdGhyb3VnaCB0aGUgY3Jh
Y2tzIHNvbWV3aGVyZSwgYnV0IDQuMTYtcmM1Cj4+IGhhc24ndCBnb3QgdGhlbSB5ZXQuCj4gCj4g
VGhleSBhcmUgcXVldWVkIGZvciA0LjE3IGluOgo+IAo+IGdpdDovL2dpdC5rZXJuZWwub3JnL3B1
Yi9zY20vbGludXgva2VybmVsL2dpdC90aXAvdGlwLmdpdCB4ODYvYm9vdAoKCkkgbWF5IG5vdCBi
ZSBsb29raW5nIGF0IHRoZSByaWdodCBwbGFjZSBidXQgSSBkb24ndCBzZWUgaXQgdGhlcmU6Cgpo
dHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90aXAvdGlwLmdp
dC90cmVlL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHZoLmM/aD14ODYvYm9vdAoKLWJvcmlzCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
