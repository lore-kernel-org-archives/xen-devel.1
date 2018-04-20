From: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH] xen-netfront: Fix hang on device removal
Date: Fri, 20 Apr 2018 08:41:25 -0400
Message-ID: <CAKf6xpsOZr85PHutrdL7QtfYuN+rN4SH6+1zy92P_oBKTv-EHA__46613.5568138727$1524228009$gmane$org@mail.gmail.com>
References: <20180228122323.3914-1-jandryuk@gmail.com>
 <1b07e839-5633-3b1e-1997-b86a891b2962@invisiblethingslab.com>
 <CAKf6xpuusCJ0DMJ_G3hG5pd9vd8rUBH=VPa4TCvaoptGto-=Zw@mail.gmail.com>
 <6ad676c8-476f-1181-1acd-985671f6c837@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zxds=hj=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1f9VM0-0006vp-6R
 for xen-devel@lists.xenproject.org; Fri, 20 Apr 2018 12:41:28 +0000
Received: by mail-lf0-x22c.google.com with SMTP id i18-v6so4954833lfc.7
 for <xen-devel@lists.xenproject.org>; Fri, 20 Apr 2018 05:41:26 -0700 (PDT)
In-Reply-To: <6ad676c8-476f-1181-1acd-985671f6c837@invisiblethingslab.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Simon Gaiser <simon@invisiblethingslab.com>
Cc: Eduardo Otubo <otubo@redhat.com>, Juergen Gross <jgross@suse.com>, netdev@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBBcHIgMTksIDIwMTggYXQgNDowOSBQTSwgU2ltb24gR2Fpc2VyCjxzaW1vbkBpbnZp
c2libGV0aGluZ3NsYWIuY29tPiB3cm90ZToKPiBKYXNvbiBBbmRyeXVrOgo+PiBPbiBUaHUsIEFw
ciAxOSwgMjAxOCBhdCAyOjEwIFBNLCBTaW1vbiBHYWlzZXIKPj4gPHNpbW9uQGludmlzaWJsZXRo
aW5nc2xhYi5jb20+IHdyb3RlOgo+Pj4gSmFzb24gQW5kcnl1azoKPj4+PiBBIHRvb2xzdGFjayBt
YXkgZGVsZXRlIHRoZSB2aWYgZnJvbnRlbmQgYW5kIGJhY2tlbmQgeGVuc3RvcmUgZW50cmllcwo+
Pj4+IHdoaWxlIHhlbi1uZXRmcm9udCBpcyBpbiB0aGUgcmVtb3ZhbCBjb2RlIHBhdGguICBJbiB0
aGF0IGNhc2UsIHRoZQo+Pj4+IGNoZWNrcyBmb3IgeGVuYnVzX3JlYWRfZHJpdmVyX3N0YXRlIHdv
dWxkIHJldHVybiBYZW5idXNTdGF0ZVVua25vd24sIGFuZAo+Pj4+IHhlbm5ldF9yZW1vdmUgd291
bGQgaGFuZyBpbmRlZmluaXRlbHkuICBUaGlzIGhhbmcgcHJldmVudHMgc3lzdGVtCj4+Pj4gc2h1
dGRvd24uCj4+Pj4KPj4+PiB4ZW5uZXRfcmVtb3ZlIG11c3QgYmUgYWJsZSB0byBoYW5kbGUgWGVu
YnVzU3RhdGVVbmtub3duLCBhbmQKPj4+PiBuZXRiYWNrX2NoYW5nZWQgbXVzdCBhbHNvIHdha2Ug
dXAgdGhlIHdha2VfcXVldWUgZm9yIHRoYXQgc3RhdGUgYXMgd2VsbC4KPj4+Pgo+Pj4+IEZpeGVz
OiA1YjU5NzFkZjNiYzIgKCJ4ZW4tbmV0ZnJvbnQ6IHJlbW92ZSB3YXJuaW5nIHdoZW4gdW5sb2Fk
aW5nIG1vZHVsZSIpCj4+Pgo+Pj4gSSB0aGluayB0aGlzIHNob3VsZCBnbyBpbnRvIHN0YWJsZSBz
aW5jZSBBRkFJSyB0aGUgaGFuZ2luZyBuZXR3b3JrCj4+PiBkZXZpY2UgY2FuIG9ubHkgYmUgZml4
ZWQgYnkgcmVib290aW5nIHRoZSBndWVzdC4gQUZBSUNTIHRoaXMgYWZmZWN0cyBhbGwKPj4+IDQu
KiBicmFuY2hlcyBzaW5jZSA1YjU5NzFkZjNiYzIgZ290IGJhY2twb3J0ZWQgdG8gdGhlbS4KPj4+
Cj4+PiBVcHN0cmVhbSBjb21taXQgYzJkMmU2NzM4YTIwOWYwZjlkZmZhMmRjOGU3MjkyZmM0NTM2
MGQ2MS4KPj4KPj4gU2ltb24sCj4+Cj4+IFllcywgSSBhZ3JlZS4gIEkgYWN0dWFsbHkgc3VibWl0
dGVkIHRoZSByZXF1ZXN0IHRvIHN0YWJsZSBlYXJsaWVyCj4+IHRvZGF5LCBzbyBob3BlZnVsbHkg
aXQgZ2V0cyBhZGRlZCBzb29uLgo+Cj4gT2ssIGdyZWF0LiAoSSBjaGVja2VkIHRoZSBzdGFibGUg
cGF0Y2ggcXVldWUsIGJ1dCBkaWRuJ3QgY2hlY2sgdGhlCj4gbWFpbGluZyBsaXN0IGFyY2hpdmUp
Lgo+Cj4+IEhhdmUgeW91IGV4cGVyaWVuY2VkIHRoaXMgaGFuZz8KPgo+IFllcywgaXQncyBhZmZl
Y3RpbmcgdGhlIGtlcm5lbCBzaGlwcGVkIGJ5IFF1YmVzIE9TIChzZWUgWzFdKS4KCk9rLCBpbnRl
cmVzdGluZy4gIEkgdHJhY2tlZCBkb3duIHRoaXMgYnVnIHdpdGggb2xkZXIgeGVudm0gdG9vbHMs
IGFuZApJIGRpZG4ndCBrbm93IGlmIGxpYnhsIHRvb2xzIHdlcmUgYWxzbyBhZmZlY3RlZC4KCkdy
ZWcgS0ggYWRkZWQgdGhlIHBhdGNoIHRvIHRoZSBzdGFibGUgcXVldWUsIHNvIGl0J3MgaW4gdGhl
IHByb2Nlc3MuCgpSZWdhcmRzLApKYXNvbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
