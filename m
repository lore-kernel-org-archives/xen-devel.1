From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 2/6] x86/xpti: don't flush TLB twice when
 switching to 64-bit pv context
Date: Mon, 05 Mar 2018 09:49:19 -0700
Message-ID: <5A9D831F02000078001AEB7E@prv-mh.provo.novell.com>
References: <20180302081403.16953-1-jgross@suse.com>
 <20180302081403.16953-3-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=zn8f=f3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1estIn-0001DI-Du
 for xen-devel@lists.xenproject.org; Mon, 05 Mar 2018 16:49:29 +0000
In-Reply-To: <20180302081403.16953-3-jgross@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: andrew.cooper3@citrix.com, Dario Faggioli <dfaggioli@suse.com>, wei.liu2@citrix.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAyLjAzLjE4IGF0IDA5OjEzLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBAQCAt
NTA5LDkgKzUxMCwxNiBAQCB2b2lkIG1ha2VfY3IzKHN0cnVjdCB2Y3B1ICp2LCBtZm5fdCBtZm4p
Cj4gIAo+ICB2b2lkIHdyaXRlX3B0YmFzZShzdHJ1Y3QgdmNwdSAqdikKPiAgewo+IC0gICAgZ2V0
X2NwdV9pbmZvKCktPnJvb3RfcGd0X2NoYW5nZWQgPSB0aGlzX2NwdShyb290X3BndCkgJiYgaXNf
cHZfdmNwdSh2KSAmJgo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAh
aXNfcHZfMzJiaXRfdmNwdSh2KTsKPiAtICAgIHdyaXRlX2NyMyh2LT5hcmNoLmNyMyk7Cj4gKyAg
ICBpZiAoIHRoaXNfY3B1KHJvb3RfcGd0KSAmJiBpc19wdl92Y3B1KHYpICYmICFpc19wdl8zMmJp
dF92Y3B1KHYpICkKPiArICAgIHsKPiArICAgICAgICBnZXRfY3B1X2luZm8oKS0+cm9vdF9wZ3Rf
Y2hhbmdlZCA9IHRydWU7Cj4gKyAgICAgICAgYXNtIHZvbGF0aWxlICggIm1vdiAlMCwgJSVjcjMi
IDogOiAiciIgKHYtPmFyY2guY3IzKSA6ICJtZW1vcnkiICk7Cj4gKyAgICB9Cj4gKyAgICBlbHNl
Cj4gKyAgICB7Cj4gKyAgICAgICAgZ2V0X2NwdV9pbmZvKCktPnJvb3RfcGd0X2NoYW5nZWQgPSBm
YWxzZTsKCklzIHRoaXMgd3JpdGUgcmVhbGx5IG5lY2Vzc2FyeT8KCkphbgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
