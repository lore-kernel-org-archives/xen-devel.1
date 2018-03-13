From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2] libxl: put RSDP for PVH guest near 4GB
Date: Tue, 13 Mar 2018 19:06:30 +0100
Message-ID: <054d3c3a-7434-d8f5-2ce7-bd278f75b2fc@suse.com>
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
 <28e7dced-0eba-09e8-1033-091380f7d062@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=duv2=gd=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1evoJr-0001to-IF
 for xen-devel@lists.xenproject.org; Tue, 13 Mar 2018 18:06:39 +0000
In-Reply-To: <28e7dced-0eba-09e8-1033-091380f7d062@oracle.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Sander Eikelenboom <linux@eikelenboom.it>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTMvMDMvMTggMTg6NTEsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPiAKPiAKPiBPbiAwMy8x
My8yMDE4IDAxOjI3IEFNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBPbiAxMi8wMy8xOCAyMDoy
NiwgU2FuZGVyIEVpa2VsZW5ib29tIHdyb3RlOgo+Pj4gSGkgSnVlcmdlbiwKPj4+Cj4+PiBJIGRv
bid0IGtub3cgYnkgd2hpY2ggdHJlZSB0aG9zZSBwYXRjaGVzIHNob3VsZCBhcnJpdmUgYXQgTGlu
dXMsCj4+PiBzbyBpIGNhbid0IGNoZWNrIGlmIHRoZXkgZmVsbCB0aHJvdWdoIHRoZSBjcmFja3Mg
c29tZXdoZXJlLCBidXQgNC4xNi1yYzUKPj4+IGhhc24ndCBnb3QgdGhlbSB5ZXQuCj4+Cj4+IFRo
ZXkgYXJlIHF1ZXVlZCBmb3IgNC4xNyBpbjoKPj4KPj4gZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L3RpcC90aXAuZ2l0IHg4Ni9ib290Cj4gCj4gCj4gSSBtYXkg
bm90IGJlIGxvb2tpbmcgYXQgdGhlIHJpZ2h0IHBsYWNlIGJ1dCBJIGRvbid0IHNlZSBpdCB0aGVy
ZToKPiAKPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90
aXAvdGlwLmdpdC90cmVlL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHZoLmM/aD14ODYvYm9vdAoK
QWFoLCBzZWVtcyBhcyBpZiBJbmdvIGhhcyBtZXJnZWQgdGhlIHBhdGNoZXMgaW50byB4ODYvbW0g
YW5kIHg4Ni9ib290CmhhcyBiZWVuIHJlLWluaXRlZCBhZ2Fpbi4gTG9vayBhdDoKCmh0dHBzOi8v
Z2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RpcC90aXAuZ2l0L3RyZWUv
YXJjaC94ODYveGVuL2VubGlnaHRlbl9wdmguYz9oPXg4Ni9tbQoKCkp1ZXJnZW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
