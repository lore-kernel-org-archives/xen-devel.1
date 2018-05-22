From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 1/2] xen/PVH: Set up GS segment for stack
 canary
Date: Tue, 22 May 2018 10:10:53 -0600
Message-ID: <5B04410D02000078001C4CC5__39721.9913699248$1527005382$gmane$org@prv1-mh.provo.novell.com>
References: <20180522035445.16911-1-boris.ostrovsky@oracle.com>
 <20180522035445.16911-2-boris.ostrovsky@oracle.com>
 <CAMzpN2iMrEqee+8yGP_qk-qAuXf+_o6vrOUSDTvX=8JAUDT5Fg@mail.gmail.com>
 <5B0421E502000078001C4B91@prv1-mh.provo.novell.com>
 <CAMzpN2gRvYMmaf2+Fpi2wkAV_rcH=uDfM8sQQaaGGK2U=7XqMA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=qj7d=ij=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fL9sJ-00031W-B5
 for xen-devel@lists.xenproject.org; Tue, 22 May 2018 16:10:59 +0000
In-Reply-To: <CAMzpN2gRvYMmaf2+Fpi2wkAV_rcH=uDfM8sQQaaGGK2U=7XqMA@mail.gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: brgerst@gmail.com
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIyLjA1LjE4IGF0IDE3OjE1LCA8YnJnZXJzdEBnbWFpbC5jb20+IHdyb3RlOgo+IE9u
IFR1ZSwgTWF5IDIyLCAyMDE4IGF0IDk6NTcgQU0sIEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6Cj4+Pj4+IE9uIDIyLjA1LjE4IGF0IDE1OjQ1LCA8YnJnZXJzdEBnbWFpbC5j
b20+IHdyb3RlOgo+Pj4gT24gTW9uLCBNYXkgMjEsIDIwMTggYXQgMTE6NTQgUE0sIEJvcmlzIE9z
dHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+IHdyb3RlOgo+Pj4+IEBAIC05OCw2
ICsxMDEsMTIgQEAgRU5UUlkocHZoX3N0YXJ0X3hlbikKPj4+PiAgICAgICAgIC8qIDY0LWJpdCBl
bnRyeSBwb2ludC4gKi8KPj4+PiAgICAgICAgIC5jb2RlNjQKPj4+PiAgMToKPj4+PiArICAgICAg
IC8qIFNldCBiYXNlIGFkZHJlc3MgaW4gc3RhY2sgY2FuYXJ5IGRlc2NyaXB0b3IuICovCj4+Pj4g
KyAgICAgICBtb3YgJE1TUl9HU19CQVNFLCVlY3gKPj4+PiArICAgICAgIG1vdiAkY2FuYXJ5LCAl
cmF4Cj4+Pj4gKyAgICAgICBjZHEKPj4+PiArICAgICAgIHdybXNyCj4+Pgo+Pj4gQ0RRIG9ubHkg
c2lnbi1leHRlbmRzIEVBWCB0byBSQVguICBXaGF0IHlvdSByZWFsbHkgd2FudCBpcyB0byBtb3Zl
IHRoZQo+Pj4gaGlnaCAzMi1iaXRzIHRvIEVEWCAob3IgemVybyBFRFggaWYgd2UgY2FuIGd1YXJh
bnRlZSBpdCBpcyBsb2FkZWQKPj4+IGJlbG93IDRHKS4KPj4KPj4gV2hhdCB5b3UgZGVzY3JpYmUg
aXMgQ0RRRSAoQVQmVCBuYW1lOiBDTFREKTsgQ0RRIChBVCZUOiBDTFRRKQo+PiBzaWduLWV4dGVu
ZHMgRUFYIHRvIEVEWDpFQVguCj4gCj4gQnV0IHRoYXQgd291bGQgc3RpbGwgYmUgd3JvbmcsIGFz
IGl0IHdvdWxkIHNldCBFRFggdG8gMHhGRkZGRkZGRiBpZgo+IHRoZSBrZXJuZWwgd2FzIGxvYWRl
ZCBiZXR3ZWVuIDJHIGFuZCA0Ry4gIExvb2tpbmcgY2xvc2VyIGF0IHRoZSBjb2RlLAo+IHdlIGp1
c3QgbGVmdCAzMi1iaXQgbW9kZSwgc28gd2UgbXVzdCBoYXZlIGJlZW4gbG9hZGVkIGJlbG93IDRH
LAo+IHRoZXJlZm9yZSBFRFggbXVzdCBiZSB6ZXJvLgoKQWgsIHllcywgaW5kZWVkLgoKSmFuCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
