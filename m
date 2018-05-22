From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v4 1/2] xen/PVH: Set up GS segment for stack
 canary
Date: Tue, 22 May 2018 12:20:28 -0400
Message-ID: <70aad5f3-67b9-b1fa-d39c-cfa8615f38da__27182.7569617473$1527005766$gmane$org@oracle.com>
References: <20180522035445.16911-1-boris.ostrovsky@oracle.com>
 <20180522035445.16911-2-boris.ostrovsky@oracle.com>
 <CAMzpN2iMrEqee+8yGP_qk-qAuXf+_o6vrOUSDTvX=8JAUDT5Fg@mail.gmail.com>
 <5B0421E502000078001C4B91@prv1-mh.provo.novell.com>
 <CAMzpN2gRvYMmaf2+Fpi2wkAV_rcH=uDfM8sQQaaGGK2U=7XqMA@mail.gmail.com>
 <5B04410D02000078001C4CC5@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qxnr=ij=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fL9yQ-0003O5-Vi
 for xen-devel@lists.xenproject.org; Tue, 22 May 2018 16:17:19 +0000
In-Reply-To: <5B04410D02000078001C4CC5@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, brgerst@gmail.com
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMjIvMjAxOCAxMjoxMCBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjIuMDUu
MTggYXQgMTc6MTUsIDxicmdlcnN0QGdtYWlsLmNvbT4gd3JvdGU6Cj4+IE9uIFR1ZSwgTWF5IDIy
LCAyMDE4IGF0IDk6NTcgQU0sIEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6
Cj4+Pj4+PiBPbiAyMi4wNS4xOCBhdCAxNTo0NSwgPGJyZ2Vyc3RAZ21haWwuY29tPiB3cm90ZToK
Pj4+PiBPbiBNb24sIE1heSAyMSwgMjAxOCBhdCAxMTo1NCBQTSwgQm9yaXMgT3N0cm92c2t5IDxi
b3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4gd3JvdGU6Cj4+Pj4+IEBAIC05OCw2ICsxMDEsMTIg
QEAgRU5UUlkocHZoX3N0YXJ0X3hlbikKPj4+Pj4gICAgICAgICAvKiA2NC1iaXQgZW50cnkgcG9p
bnQuICovCj4+Pj4+ICAgICAgICAgLmNvZGU2NAo+Pj4+PiAgMToKPj4+Pj4gKyAgICAgICAvKiBT
ZXQgYmFzZSBhZGRyZXNzIGluIHN0YWNrIGNhbmFyeSBkZXNjcmlwdG9yLiAqLwo+Pj4+PiArICAg
ICAgIG1vdiAkTVNSX0dTX0JBU0UsJWVjeAo+Pj4+PiArICAgICAgIG1vdiAkY2FuYXJ5LCAlcmF4
Cj4+Pj4+ICsgICAgICAgY2RxCj4+Pj4+ICsgICAgICAgd3Jtc3IKPj4+PiBDRFEgb25seSBzaWdu
LWV4dGVuZHMgRUFYIHRvIFJBWC4gIFdoYXQgeW91IHJlYWxseSB3YW50IGlzIHRvIG1vdmUgdGhl
Cj4+Pj4gaGlnaCAzMi1iaXRzIHRvIEVEWCAob3IgemVybyBFRFggaWYgd2UgY2FuIGd1YXJhbnRl
ZSBpdCBpcyBsb2FkZWQKPj4+PiBiZWxvdyA0RykuCj4+PiBXaGF0IHlvdSBkZXNjcmliZSBpcyBD
RFFFIChBVCZUIG5hbWU6IENMVEQpOyBDRFEgKEFUJlQ6IENMVFEpCj4+PiBzaWduLWV4dGVuZHMg
RUFYIHRvIEVEWDpFQVguCj4+IEJ1dCB0aGF0IHdvdWxkIHN0aWxsIGJlIHdyb25nLCBhcyBpdCB3
b3VsZCBzZXQgRURYIHRvIDB4RkZGRkZGRkYgaWYKPj4gdGhlIGtlcm5lbCB3YXMgbG9hZGVkIGJl
dHdlZW4gMkcgYW5kIDRHLiAgTG9va2luZyBjbG9zZXIgYXQgdGhlIGNvZGUsCj4+IHdlIGp1c3Qg
bGVmdCAzMi1iaXQgbW9kZSwgc28gd2UgbXVzdCBoYXZlIGJlZW4gbG9hZGVkIGJlbG93IDRHLAo+
PiB0aGVyZWZvcmUgRURYIG11c3QgYmUgemVyby4KPiBBaCwgeWVzLCBpbmRlZWQuCgoKV2UgYXJl
IGxvYWRpbmcgdmlydHVhbCBhZGRyZXNzIGZvciAkY2FuYXJ5IHNvIHdlIHdpbGwgYWx3YXlzIGhh
dmUgRURYCnNldCB0byAweGZmZmZmZmZmLiBJc24ndCB0aGF0IHdoYXQgd2Ugd2FudD8KCi1ib3Jz
aQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
