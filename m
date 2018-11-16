From: Mirela Simonovic <mirela.simonovic@aggios.com>
Subject: Re: [PATCH 17/18] xen/arm: Resume Dom0 after Xen resumes
Date: Fri, 16 Nov 2018 11:33:47 +0100
Message-ID: <CAKPH-Ngdb_w+uHKFrMd_fF62pM0idQJie2RdKDtD8HbZyNV1WQ@mail.gmail.com>
References: <1542022244-22977-1-git-send-email-mirela.simonovic@aggios.com>
 <1542022244-22977-18-git-send-email-mirela.simonovic@aggios.com>
 <77c3d2c9-a1e0-a5b3-0a4e-fc6ea079b817@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=0xxc=n3=aggios.com=mirela.simonovic@srs-us1.protection.inumbo.net>)
 id 1gNbRo-0001BO-Fj
 for xen-devel@lists.xenproject.org; Fri, 16 Nov 2018 10:34:00 +0000
Received: by mail-qk1-x742.google.com with SMTP id y16so36580947qki.7
 for <xen-devel@lists.xenproject.org>; Fri, 16 Nov 2018 02:33:58 -0800 (PST)
In-Reply-To: <77c3d2c9-a1e0-a5b3-0a4e-fc6ea079b817@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Xen Devel <xen-devel@lists.xen.org>, Davorin Mista <dm@aggios.com>, Saeed Nowshadi <saeed.nowshadi@xilinx.com>, xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini <stefano.stabellini@xilinx.com>
List-Id: xen-devel@lists.xenproject.org

SGkgSnVsaWVuLAoKT24gVGh1LCBOb3YgMTUsIDIwMTggYXQgOTozMSBQTSBKdWxpZW4gR3JhbGwg
PGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPgo+IEhpLAo+Cj4gT24gMTEvMTIvMTggMTE6
MzAgQU0sIE1pcmVsYSBTaW1vbm92aWMgd3JvdGU6Cj4gPiBUaGUgcmVzdW1lIG9mIERvbTAgc2hv
dWxkIGFsd2F5cyBmb2xsb3cgWGVuJ3MgcmVzdW1lLiBUaGlzIGlzCj4gPiBkb25lIGJ5IHVuYmxv
Y2tpbmcgdGhlIGZpcnN0IHZDUFUgb2YgRG9tMC4KPgo+IFBsZWFzZSBleHBsYWluIHdoeSB5b3Ug
YWx3YXlzIG5lZWQgdG8gcmVzdW1lIERvbTAgYWZ0ZXJ3YXJkcy4KPgoKV2UgZG9uJ3QgbmVlZCB0
bywgYnV0IHRoYXQgaXMgd2hhdCBpcyBwcm9taXNlZCBpbiB0aGUgZGVzaWduIHNwZWMuCgo+IENo
ZWVycywKPgo+IC0tCj4gSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
