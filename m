From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 03/14] x86/cpu/vpmu: Add Hygon Dhyana and
 AMD Zen support for vPMU
Date: Fri, 15 Mar 2019 06:41:19 -0600
Message-ID: <5C8B9D6F020000780021F41C@prv1-mh.provo.novell.com>
References: <cover.1550647742.git.puwen@hygon.cn>
 <040f45bfbf35ade98027221680777cb96e561c65.1550647742.git.puwen@hygon.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=64UD=RS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h4m9N-0002ue-Bl
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2019 12:41:25 +0000
In-Reply-To: <040f45bfbf35ade98027221680777cb96e561c65.1550647742.git.puwen@hygon.cn>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Pu Wen <puwen@hygon.cn>
Cc: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjAyLjE5IGF0IDEwOjUwLCA8cHV3ZW5AaHlnb24uY24+IHdyb3RlOgo+IC0tLSBh
L3hlbi9hcmNoL3g4Ni9jcHUvdnBtdV9hbWQuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9jcHUvdnBt
dV9hbWQuYwo+IEBAIC01NDUsNiArNTQ1LDggQEAgaW50IF9faW5pdCBhbWRfdnBtdV9pbml0KHZv
aWQpCj4gICAgICBzd2l0Y2ggKCBjdXJyZW50X2NwdV9kYXRhLng4NiApCj4gICAgICB7Cj4gICAg
ICBjYXNlIDB4MTU6Cj4gKyAgICBjYXNlIDB4MTc6Cj4gKyAgICBjYXNlIDB4MTg6Cj4gICAgICAg
ICAgbnVtX2NvdW50ZXJzID0gRjE1SF9OVU1fQ09VTlRFUlM7Cj4gICAgICAgICAgY291bnRlcnMg
PSBBTURfRjE1SF9DT1VOVEVSUzsKPiAgICAgICAgICBjdHJscyA9IEFNRF9GMTVIX0NUUkxTOwoK
VW5sZXNzIHlvdSBrbm93IHdoYXQgQU1EIEZhbTE4IHdpbGwgbG9vayBsaWtlLCB5b3UgY2FuJ3Qg
ZG8gaXQKbGlrZSB0aGlzLiBGYW0xOCByZWFsbHkgbmVlZHMgdG8gYmUgZnVydGhlciBxdWFsaWZp
ZWQgYnkgYSB2ZW5kb3IKY2hlY2sgYXQgdGhpcyBwb2ludCBpbiB0aW1lLgoKSmFuCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
