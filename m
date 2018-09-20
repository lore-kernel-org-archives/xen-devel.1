From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] x86/altp2m: Allow setting the #VE info
 page for an arbitrary VCPU
Date: Thu, 20 Sep 2018 02:33:49 -0600
Message-ID: <5BA35B6D02000078001EA2C2@prv1-mh.provo.novell.com>
References: <20180904045922.31609-1-apop@bitdefender.com>
 <CABfawh=xspBY1rz5jWNiaOomiT8teO=pMLR+axYxptHarqAi5Q@mail.gmail.com>
 <5ed49738-7653-197c-6206-d2b8fcd94cb5@bitdefender.com>
 <CABfawhnF8gftAOhByfb8cizyvOXbH-uHoX0vMpP18gA6etZ8Fw@mail.gmail.com>
 <d6e421a2-34b0-5f83-f985-5a1814bf3c8b@bitdefender.com>
 <CABfawhk6qTg=By4Dsy_hi_bZVsPEnJVmYHB6NDkTpzvHFGejPw@mail.gmail.com>
 <81c0e6f9-46b6-d956-1f16-70dfeb28aaaa@citrix.com>
 <CABfawhntiphM+xpiioW76AVy6gOXS4fA8P5jO7KYF_Rt6u9q7g@mail.gmail.com>
 <75ba39c8-228f-da7c-63df-24534e3a4271@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=gjef=mc=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g2uPJ-0000xG-Ar
 for xen-devel@lists.xenproject.org; Thu, 20 Sep 2018 08:33:53 +0000
In-Reply-To: <75ba39c8-228f-da7c-63df-24534e3a4271@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Adrian Pop <apop@bitdefender.com>, Sergej Proskurin <proskurin@sec.in.tum.de>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjA5LjE4IGF0IDEwOjExLCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4gQXJlIHRoZXJlIGFueSBpc3N1ZXMgcHJldmVudGluZyB0aGlzIHBhdGNoIHRvIGdvIGlu
PyBQb3NzaWJseSBtaXNzaW5nIGFja3M/CgpPaCwgYW5kIGJ0dyAtIGlycmVzcGVjdGl2ZSB3aGF0
IE1BSU5UQUlORVJTIHNheXMgLSBwYXRjaGVzIHRvIHRoaXMKZnVuY3Rpb24gd291bGQgYmV0dGVy
IGFsc28gYmUgQ2MtZWQgdG8gR2VvcmdlIGFzIHRoZSBtbSBtYWludGFpbmVyLgpFdmVuIG1vcmUg
c28gdGhhdCBJIHRoaW5rIGl0IGhhcyBiZWNvbWUgY2xlYXIgZnJvbSBwYXN0IGRpc2N1c3Npb25z
CnRoYXQgSSdtIG5vdCBnb2luZyB0byBhY2sgYW55IHBhdGNoZXMgdG8gdGhpcyBmdW5jdGlvbiwg
dGhlIGV4aXN0ZW5jZSAvCnBsYWNlbWVudCBvZiB3aGljaCBJIHF1ZXN0aW9uIGluIHRoZSBmaXJz
dCBwbGFjZS4gSXQncyBqdXN0IHRoYXQsIHdpdGgKcmVjZW50IGNsYXJpZmljYXRpb25zLCBJIHdv
bid0IG9iamVjdCB0byBhbnkgc3VjaCBhZGRpdGlvbnMgYW55bW9yZS4KCkphbgoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
