From: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: Xen boot failure on QEMU (WAS: Re: [PATCH v3]
 xen:arm: Populate arm64 image header)
Date: Tue, 9 Oct 2018 09:58:14 +0100
Message-ID: <CAFEAcA-X5rYnFj=z=qmrcpHt+1bt3LUuQRbBG9F9U_0qXsve=w@mail.gmail.com>
References: <d71bafc616264a8abda66376bde7f5d2@dornerworks.com>
 <ff3ebbbb-93d7-e9d6-629c-d5ccec776c3c@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fvkn=mv=linaro.org=peter.maydell@srs-us1.protection.inumbo.net>)
 id 1g9nqe-0001E9-HR
 for xen-devel@lists.xenproject.org; Tue, 09 Oct 2018 08:58:36 +0000
Received: by mail-oi1-x244.google.com with SMTP id u197-v6so624857oif.5
 for <xen-devel@lists.xenproject.org>; Tue, 09 Oct 2018 01:58:35 -0700 (PDT)
In-Reply-To: <ff3ebbbb-93d7-e9d6-629c-d5ccec776c3c@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>, Andre Przywara <andre.przywara@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Amit Tomer <amittomer25@gmail.com>
List-Id: xen-devel@lists.xenproject.org

T24gOCBPY3RvYmVyIDIwMTggYXQgMTk6MDAsIEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFy
bS5jb20+IHdyb3RlOgo+IFBlciB0aGUgTGludXggYXJtNjQgYm9vdGluZyBwcm90b2NvbCBbMV0s
IHRoZSBsb2FkIG9mZnNldCBjYW4gZGVmaW5pdGVseSBiZQo+IDAuIFRoZSBib290bG9hZGVyICho
ZXJlIFFFTVUpIHNob3VsZCBub3QgYXNzdW1lIGEgc3BlY2lmaWMgdGV4dCBvZmZzZXQsCj4gTGlu
dXggYWN0dWFsbHkgcHJvdmlkZXMgYW4gb3B0aW9uIHRvIHJhbmRvbWl6ZSB0aGUgdGV4dCBvZmZz
ZXQgaW4gb3JkZXIgdG8KPiB0ZXN0IHRoYXQgYXNzdW1wdGlvbiAoc2VlIEFSTTY0X1JBTkRPTUla
RV9URVhUX09GRlNFVCkuCj4KPiBJIGhhdmUgQ0NlZCBTdGVmYW5vIGFuZCBQZXRlciB3aG8gY291
bGQgZ2l2ZSBtb3JlIGRldGFpbHMgb24gaG93IFFFTVUgaXMKPiBoYW5kbGluZyB0aGUgSW1hZ2Ug
cHJvdG9jb2wuCgpRRU1VJ3MgY29kZSB0byBoYW5kbGUgdGhpcyBpcyBpbiBody9hcm0vYm9vdC5j
L2xvYWRfYWFyY2g2NF9pbWFnZSgpLgpXZSBkbyBoYXZlIGNvZGUgdG8gaGFuZGxlIHJlYWRpbmcg
dGhlIHRleHQgb2Zmc2V0IGZyb20gdGhlIEltYWdlCmhlYWRlci4gVGhlIGVycm9yIG1lc3NhZ2UK
cm9tOiByZXF1ZXN0ZWQgcmVnaW9ucyBvdmVybGFwIChyb20gYm9vdGxvYWRlci4KZnJlZT0weDAw
MDAwMDAwNDAwZDAxNTAsIGFkZHI9MHgwMDAwMDAwMDQwMDAwMDAwKQoKc3VnZ2VzdHMgdGhhdCB3
ZSBoYXZlIGNvcnJlY3RseSBwdWxsZWQgdGhlIHRleHQgb2Zmc2V0IGZyb20gdGhlCkltYWdlIGZp
bGUsIGJ1dCBpdCBvdmVybGFwcyB3aXRoIHNvbWV0aGluZyBlbHNlLiBTcGVjaWZpY2FsbHksCmZv
ciB0aGUgdmlydCBib2FyZCB3ZSB3cml0ZSBvdXIgc3RhcnR1cCAiYm9vdGxvYWRlciIgKGFib3V0
CmEgZG96ZW4gaW5zbnMgb2YgYXNzZW1ibHkgdGhhdCBkbyB0aGUgam9iIG9mIGp1bXBpbmcgdG8g
dGhlIGtlcm5lbCkKYXQgdGhlIHZlcnkgYm90dG9tIG9mIFJBTSwgc28geW91IGNhbid0IHVzZSB0
aGF0IGJpdCBvZiBSQU0gZm9yCnRoZSBpbWFnZS4gSW4gdGhlb3J5IGJvb3QuYyBjb3VsZCBub3Rp
Y2UgdGhhdCB0aGUgaW1hZ2UgaXMgd2hlcmUKaXQgd291bGQgYnkgZGVmYXVsdCBwdXQgdGhlIGJv
b3Rsb2FkZXIgY29kZSBhbmQgbW92ZSB0aGF0IHNvbWV3aGVyZQplbHNlIChpdCBpcyBJSVJDIHBv
c2l0aW9uLWluZGVwZW5kZW50KSwgYnV0IHRoYXQgd291bGQgYmUgcXVpdGUKY29tcGxpY2F0ZWQg
Y29kZSBmb3IgYSBjb3JuZXIgY2FzZSwgYW5kIGl0IGRvZXNuJ3QgaGVscCB5b3Ugd2l0aApleGlz
dGluZyBkZXBsb3llZCB2ZXJzaW9ucyBvZiBRRU1VIGFueXdheS4KCnRoYW5rcwotLSBQTU0KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
