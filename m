From: Brian Gerst <brgerst@gmail.com>
Subject: Re: [PATCH v4 1/2] xen/PVH: Set up GS segment for stack
 canary
Date: Tue, 22 May 2018 11:15:07 -0400
Message-ID: <CAMzpN2gRvYMmaf2+Fpi2wkAV_rcH=uDfM8sQQaaGGK2U=7XqMA__31335.4200254709$1527002041$gmane$org@mail.gmail.com>
References: <20180522035445.16911-1-boris.ostrovsky@oracle.com>
 <20180522035445.16911-2-boris.ostrovsky@oracle.com>
 <CAMzpN2iMrEqee+8yGP_qk-qAuXf+_o6vrOUSDTvX=8JAUDT5Fg@mail.gmail.com>
 <5B0421E502000078001C4B91@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=npos=ij=gmail.com=brgerst@srs-us1.protection.inumbo.net>)
 id 1fL90I-0004pG-6o
 for xen-devel@lists.xenproject.org; Tue, 22 May 2018 15:15:10 +0000
Received: by mail-it0-x242.google.com with SMTP id q72-v6so410825itc.0
 for <xen-devel@lists.xenproject.org>; Tue, 22 May 2018 08:15:08 -0700 (PDT)
In-Reply-To: <5B0421E502000078001C4B91@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXkgMjIsIDIwMTggYXQgOTo1NyBBTSwgSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1
c2UuY29tPiB3cm90ZToKPj4+PiBPbiAyMi4wNS4xOCBhdCAxNTo0NSwgPGJyZ2Vyc3RAZ21haWwu
Y29tPiB3cm90ZToKPj4gT24gTW9uLCBNYXkgMjEsIDIwMTggYXQgMTE6NTQgUE0sIEJvcmlzIE9z
dHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+IHdyb3RlOgo+Pj4gQEAgLTk4LDYg
KzEwMSwxMiBAQCBFTlRSWShwdmhfc3RhcnRfeGVuKQo+Pj4gICAgICAgICAvKiA2NC1iaXQgZW50
cnkgcG9pbnQuICovCj4+PiAgICAgICAgIC5jb2RlNjQKPj4+ICAxOgo+Pj4gKyAgICAgICAvKiBT
ZXQgYmFzZSBhZGRyZXNzIGluIHN0YWNrIGNhbmFyeSBkZXNjcmlwdG9yLiAqLwo+Pj4gKyAgICAg
ICBtb3YgJE1TUl9HU19CQVNFLCVlY3gKPj4+ICsgICAgICAgbW92ICRjYW5hcnksICVyYXgKPj4+
ICsgICAgICAgY2RxCj4+PiArICAgICAgIHdybXNyCj4+Cj4+IENEUSBvbmx5IHNpZ24tZXh0ZW5k
cyBFQVggdG8gUkFYLiAgV2hhdCB5b3UgcmVhbGx5IHdhbnQgaXMgdG8gbW92ZSB0aGUKPj4gaGln
aCAzMi1iaXRzIHRvIEVEWCAob3IgemVybyBFRFggaWYgd2UgY2FuIGd1YXJhbnRlZSBpdCBpcyBs
b2FkZWQKPj4gYmVsb3cgNEcpLgo+Cj4gV2hhdCB5b3UgZGVzY3JpYmUgaXMgQ0RRRSAoQVQmVCBu
YW1lOiBDTFREKTsgQ0RRIChBVCZUOiBDTFRRKQo+IHNpZ24tZXh0ZW5kcyBFQVggdG8gRURYOkVB
WC4KCkJ1dCB0aGF0IHdvdWxkIHN0aWxsIGJlIHdyb25nLCBhcyBpdCB3b3VsZCBzZXQgRURYIHRv
IDB4RkZGRkZGRkYgaWYKdGhlIGtlcm5lbCB3YXMgbG9hZGVkIGJldHdlZW4gMkcgYW5kIDRHLiAg
TG9va2luZyBjbG9zZXIgYXQgdGhlIGNvZGUsCndlIGp1c3QgbGVmdCAzMi1iaXQgbW9kZSwgc28g
d2UgbXVzdCBoYXZlIGJlZW4gbG9hZGVkIGJlbG93IDRHLAp0aGVyZWZvcmUgRURYIG11c3QgYmUg
emVyby4KCi0tCkJyaWFuIEdlcnN0CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
