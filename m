From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] [v2] xen: hypercall: fix out-of-bounds
	memcpy
Date: Mon, 5 Feb 2018 16:47:18 +0100
Message-ID: <CAK8P3a3Lj_cEc40vAe9LiX3RwvvKVvCxxYsMPxxHn0BcenQt7Q__38007.4818306186$1517845581$gmane$org@mail.gmail.com>
References: <20180205150340.328921-1-arnd@arndb.de>
 <5A7882EA02000078001A552D@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=4wt3=e7=gmail.com=arndbergmann@srs-us1.protection.inumbo.net>)
 id 1eiizJ-0004L8-BT
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2018 15:47:21 +0000
Received: by mail-ot0-x22f.google.com with SMTP id 73so18144340oti.12
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2018 07:47:19 -0800 (PST)
In-Reply-To: <5A7882EA02000078001A552D@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Laight <David.Laight@aculab.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Dan Carpenter <dan.carpenter@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBGZWIgNSwgMjAxOCBhdCA0OjE0IFBNLCBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Pj4+IE9uIDA1LjAyLjE4IGF0IDE2OjAzLCA8YXJuZEBhcm5kYi5kZT4g
d3JvdGU6Cj4+ICBpbnQgeGVuX2V2ZW50X2NoYW5uZWxfb3BfY29tcGF0KGludCBjbWQsIHZvaWQg
KmFyZykKPj4gIHsKPj4gLSAgICAgc3RydWN0IGV2dGNobl9vcCBvcDsKPj4gKyAgICAgc3RydWN0
IGV2dGNobl9vcCBvcCA9IHsgLmNtZCA9IGNtZCwgfTsKPj4gKyAgICAgc2l6ZV90IGxlbjsKPj4g
ICAgICAgaW50IHJjOwo+Pgo+PiAtICAgICBvcC5jbWQgPSBjbWQ7Cj4+IC0gICAgIG1lbWNweSgm
b3AudSwgYXJnLCBzaXplb2Yob3AudSkpOwo+PiAtICAgICByYyA9IF9oeXBlcmNhbGwxKGludCwg
ZXZlbnRfY2hhbm5lbF9vcF9jb21wYXQsICZvcCk7Cj4+IC0KPj4gLSAgICAgc3dpdGNoIChjbWQp
IHsKPj4gLSAgICAgY2FzZSBFVlRDSE5PUF9jbG9zZToKPj4gLSAgICAgY2FzZSBFVlRDSE5PUF9z
ZW5kOgo+PiAtICAgICBjYXNlIEVWVENITk9QX2JpbmRfdmNwdToKPj4gLSAgICAgY2FzZSBFVlRD
SE5PUF91bm1hc2s6Cj4+IC0gICAgICAgICAgICAgLyogbm8gb3V0cHV0ICovCj4+IC0gICAgICAg
ICAgICAgYnJlYWs7Cj4+ICsgICAgIGlmIChjbWQgPiBBUlJBWV9TSVpFKGV2dGNobm9wX2xlbikp
Cj4+ICsgICAgICAgICAgICAgcmV0dXJuIC1FTk9TWVM7Cj4KPj49IHBlcmhhcHM/CgpBcmdoLCBv
ZiBjb3Vyc2UuIFRoaXMgaXMgd2h5IEkgcHJlZmVycmVkIHRoZSBzd2l0Y2gvY2FzZSB2ZXJzaW9u
LCBJIGtuZXcKSSdkIHNjcmV3IHRoaXMgdXAgc29tZWhvdyA7LSkKCiAgICAgICBBcm5kCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
