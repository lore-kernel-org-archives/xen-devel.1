From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 1/2] xen/PVH: Set up GS segment for stack
 canary
Date: Tue, 22 May 2018 10:32:53 -0600
Message-ID: <5B04463502000078001C4CEE__3026.21644591472$1527006716$gmane$org@prv1-mh.provo.novell.com>
References: <20180522035445.16911-1-boris.ostrovsky@oracle.com>
 <20180522035445.16911-2-boris.ostrovsky@oracle.com>
 <CAMzpN2iMrEqee+8yGP_qk-qAuXf+_o6vrOUSDTvX=8JAUDT5Fg@mail.gmail.com>
 <5B0421E502000078001C4B91@prv1-mh.provo.novell.com>
 <CAMzpN2gRvYMmaf2+Fpi2wkAV_rcH=uDfM8sQQaaGGK2U=7XqMA@mail.gmail.com>
 <5B04410D02000078001C4CC5@prv1-mh.provo.novell.com>
 <70aad5f3-67b9-b1fa-d39c-cfa8615f38da@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=qj7d=ij=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fLADb-0004m4-PR
 for xen-devel@lists.xenproject.org; Tue, 22 May 2018 16:32:59 +0000
In-Reply-To: <70aad5f3-67b9-b1fa-d39c-cfa8615f38da@oracle.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, brgerst@gmail.com, linux-kernel@vger.kernel.org, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIyLjA1LjE4IGF0IDE4OjIwLCA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+IHdy
b3RlOgo+IE9uIDA1LzIyLzIwMTggMTI6MTAgUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBP
biAyMi4wNS4xOCBhdCAxNzoxNSwgPGJyZ2Vyc3RAZ21haWwuY29tPiB3cm90ZToKPj4+IE9uIFR1
ZSwgTWF5IDIyLCAyMDE4IGF0IDk6NTcgQU0sIEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNv
bT4gd3JvdGU6Cj4+Pj4+Pj4gT24gMjIuMDUuMTggYXQgMTU6NDUsIDxicmdlcnN0QGdtYWlsLmNv
bT4gd3JvdGU6Cj4+Pj4+IE9uIE1vbiwgTWF5IDIxLCAyMDE4IGF0IDExOjU0IFBNLCBCb3JpcyBP
c3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPiAKPiB3cm90ZToKPj4+Pj4+IEBA
IC05OCw2ICsxMDEsMTIgQEAgRU5UUlkocHZoX3N0YXJ0X3hlbikKPj4+Pj4+ICAgICAgICAgLyog
NjQtYml0IGVudHJ5IHBvaW50LiAqLwo+Pj4+Pj4gICAgICAgICAuY29kZTY0Cj4+Pj4+PiAgMToK
Pj4+Pj4+ICsgICAgICAgLyogU2V0IGJhc2UgYWRkcmVzcyBpbiBzdGFjayBjYW5hcnkgZGVzY3Jp
cHRvci4gKi8KPj4+Pj4+ICsgICAgICAgbW92ICRNU1JfR1NfQkFTRSwlZWN4Cj4+Pj4+PiArICAg
ICAgIG1vdiAkY2FuYXJ5LCAlcmF4Cj4+Pj4+PiArICAgICAgIGNkcQo+Pj4+Pj4gKyAgICAgICB3
cm1zcgo+Pj4+PiBDRFEgb25seSBzaWduLWV4dGVuZHMgRUFYIHRvIFJBWC4gIFdoYXQgeW91IHJl
YWxseSB3YW50IGlzIHRvIG1vdmUgdGhlCj4+Pj4+IGhpZ2ggMzItYml0cyB0byBFRFggKG9yIHpl
cm8gRURYIGlmIHdlIGNhbiBndWFyYW50ZWUgaXQgaXMgbG9hZGVkCj4+Pj4+IGJlbG93IDRHKS4K
Pj4+PiBXaGF0IHlvdSBkZXNjcmliZSBpcyBDRFFFIChBVCZUIG5hbWU6IENMVEQpOyBDRFEgKEFU
JlQ6IENMVFEpCj4+Pj4gc2lnbi1leHRlbmRzIEVBWCB0byBFRFg6RUFYLgo+Pj4gQnV0IHRoYXQg
d291bGQgc3RpbGwgYmUgd3JvbmcsIGFzIGl0IHdvdWxkIHNldCBFRFggdG8gMHhGRkZGRkZGRiBp
Zgo+Pj4gdGhlIGtlcm5lbCB3YXMgbG9hZGVkIGJldHdlZW4gMkcgYW5kIDRHLiAgTG9va2luZyBj
bG9zZXIgYXQgdGhlIGNvZGUsCj4+PiB3ZSBqdXN0IGxlZnQgMzItYml0IG1vZGUsIHNvIHdlIG11
c3QgaGF2ZSBiZWVuIGxvYWRlZCBiZWxvdyA0RywKPj4+IHRoZXJlZm9yZSBFRFggbXVzdCBiZSB6
ZXJvLgo+PiBBaCwgeWVzLCBpbmRlZWQuCj4gCj4gV2UgYXJlIGxvYWRpbmcgdmlydHVhbCBhZGRy
ZXNzIGZvciAkY2FuYXJ5IHNvIHdlIHdpbGwgYWx3YXlzIGhhdmUgRURYCj4gc2V0IHRvIDB4ZmZm
ZmZmZmYuIElzbid0IHRoYXQgd2hhdCB3ZSB3YW50PwoKT2gsIHRoYXQncyByYXRoZXIgY29uZnVz
aW5nIC0gd2UncmUgc3RpbGwgcnVubmluZyBvbiB0aGUgbG93IDE6MQptYXBwaW5nIHdoZW4gd2Un
cmUgaGVyZS4gQnV0IHllcywgYnkgdGhlIHRpbWUgd2UgZW50ZXIgQyBjb2RlCih3aGVyZSB0aGUg
R1MgYmFzZSBzdGFydHMgdG8gbWF0dGVyKSB3ZSBvdWdodCB0byBiZSBvbiB0aGUgaGlnaAptYXBw
aW5ncyAtIGlmIG9ubHkgdGhlcmUgd2Fzbid0IHhlbl9wcmVwYXJlX3B2aCgpLgoKSmFuCgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
