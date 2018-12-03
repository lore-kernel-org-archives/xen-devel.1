From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 01/25] xen/evtchn: expose
 evtchn_bind_ipi_vcpu0_domain for use within Xen
Date: Mon, 03 Dec 2018 09:20:08 -0700
Message-ID: <5C0557B80200007800202564@prv1-mh.provo.novell.com>
References: <1543627984-21394-1-git-send-email-christopher.w.clark@gmail.com>
 <1543627984-21394-2-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=czp0=om=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gTqxE-0005Mc-0D
 for xen-devel@lists.xenproject.org; Mon, 03 Dec 2018 16:20:16 +0000
In-Reply-To: <1543627984-21394-2-git-send-email-christopher.w.clark@gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, ross.philipson@gmail.com, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <voreekf@madingley.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAxLjEyLjE4IGF0IDAyOjMyLCA8Y2hyaXN0b3BoZXIudy5jbGFya0BnbWFpbC5jb20+
IHdyb3RlOgo+IEFsbG9jYXRlcyBhbiBJUEktYm91bmQgZXZlbnQgY2hhbm5lbCBvbiB2Y3B1MCBm
b3Igc3BlY2lmaWVkIGRvbWFpbi4KClBsZWFzZSBjYW4gc3VjaCBjaGFuZ2VzIHRvIGdlbmVyYWwg
Y29kZSBiZSBkb25lIGF0IHRoZSBwb2ludCB3aGVyZQp0aGV5J3JlIG5lZWRlZD8gCgo+IElzIGFi
bGUgdG8gYnlwYXNzIHRoZSBleGlzdGVuY2UgY2hlY2sgb24gdmNwdSBudW1iZXIgc2luY2UgdmNw
dSAwCj4gc2hvdWxkIGFsd2F5cyBleGlzdC4gQnlwYXNzIGlzIHJlcXVpcmVkIGF0IHRoZSBwb2lu
dCBvZiB1c2UgYnkgQXJnby4KCiJTaG91bGQiIGlzIG5vdCBhIHN1ZmZpY2llbnQgY3JpdGVyaWEu
IEFuZCB5b3UgbGVhdmUgb3BlbiB3aHkgc3VjaCBhCmJ5cGFzcyBtYXkgYmUgbmVlZGVkLgoKQXMg
YW4gYXNpZGUsIEkgcXVlc3Rpb24gYW55d2F5IGFueSBuZXcgaW50ZXJmYWNlIHNwZWNpYWwgY2Fz
aW5nCnZDUFUgMC4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
