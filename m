From: Mirela Simonovic <mirela.simonovic@aggios.com>
Subject: Re: [PATCH 17/18] xen/arm: Resume Dom0 after Xen resumes
Date: Fri, 16 Nov 2018 12:29:49 +0100
Message-ID: <CAKPH-NiEnpDWwT65zwczx20hZcEN4qTayQXpO4=4iye2mcky3Q@mail.gmail.com>
References: <1542022244-22977-1-git-send-email-mirela.simonovic@aggios.com>
 <1542022244-22977-18-git-send-email-mirela.simonovic@aggios.com>
 <77c3d2c9-a1e0-a5b3-0a4e-fc6ea079b817@arm.com>
 <CAKPH-Ngdb_w+uHKFrMd_fF62pM0idQJie2RdKDtD8HbZyNV1WQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=0xxc=n3=aggios.com=mirela.simonovic@srs-us1.protection.inumbo.net>)
 id 1gNcK2-0005hC-6l
 for xen-devel@lists.xenproject.org; Fri, 16 Nov 2018 11:30:02 +0000
Received: by mail-qk1-x741.google.com with SMTP id m5so36780706qka.9
 for <xen-devel@lists.xenproject.org>; Fri, 16 Nov 2018 03:30:00 -0800 (PST)
In-Reply-To: <CAKPH-Ngdb_w+uHKFrMd_fF62pM0idQJie2RdKDtD8HbZyNV1WQ@mail.gmail.com>
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

T24gRnJpLCBOb3YgMTYsIDIwMTggYXQgMTE6MzMgQU0gTWlyZWxhIFNpbW9ub3ZpYwo8bWlyZWxh
LnNpbW9ub3ZpY0BhZ2dpb3MuY29tPiB3cm90ZToKPgo+IEhpIEp1bGllbiwKPgo+IE9uIFRodSwg
Tm92IDE1LCAyMDE4IGF0IDk6MzEgUE0gSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNv
bT4gd3JvdGU6Cj4gPgo+ID4gSGksCj4gPgo+ID4gT24gMTEvMTIvMTggMTE6MzAgQU0sIE1pcmVs
YSBTaW1vbm92aWMgd3JvdGU6Cj4gPiA+IFRoZSByZXN1bWUgb2YgRG9tMCBzaG91bGQgYWx3YXlz
IGZvbGxvdyBYZW4ncyByZXN1bWUuIFRoaXMgaXMKPiA+ID4gZG9uZSBieSB1bmJsb2NraW5nIHRo
ZSBmaXJzdCB2Q1BVIG9mIERvbTAuCj4gPgo+ID4gUGxlYXNlIGV4cGxhaW4gd2h5IHlvdSBhbHdh
eXMgbmVlZCB0byByZXN1bWUgRG9tMCBhZnRlcndhcmRzLgo+ID4KPgo+IFdlIGRvbid0IG5lZWQg
dG8sIGJ1dCB0aGF0IGlzIHdoYXQgaXMgcHJvbWlzZWQgaW4gdGhlIGRlc2lnbiBzcGVjLgo+CgpU
byBiZSBtb3JlIHNwZWNpZmljIC0gYSBkb21VIHRoYXQgZG9lc24ndCBkZXBlbmQgb24gZG9tMCBj
YW4gcmVzdW1lCmFuZCB3b3JrIGhhcHBpbHkgd2l0aG91dCBkb20wIGJlaW5nIHJlc3VtZWQsIGku
ZS4ganVzdCBYZW4gYW5kIGRvbVUKcmVzdW1lLiBTbyBwYXRjaCAiW1BBVENIIDE3LzE4XSB4ZW4v
YXJtOiBSZXN1bWUgRG9tMCBhZnRlciBYZW4KcmVzdW1lcyIgaXMgbm90IGEgbXVzdCAod2hlbiB0
aGVyZSBhcmUgbm8gUFYgZHJpdmVycyBpbnZvbHZlZCkuCgo+ID4gQ2hlZXJzLAo+ID4KPiA+IC0t
Cj4gPiBKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
