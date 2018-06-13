From: Juergen Gross <jgross@suse.com>
Subject: Re: x86's stac()/clac() use in privcmd_call()
Date: Wed, 13 Jun 2018 10:10:55 +0200
Message-ID: <edff1ae4-7d72-2194-18d7-b01471aac423@suse.com>
References: <5B20C98402000078001CABA0@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=qeqh=i7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fT0rq-0005Wb-IX
 for xen-devel@lists.xenproject.org; Wed, 13 Jun 2018 08:10:58 +0000
In-Reply-To: <5B20C98402000078001CABA0@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Marek Marczykowski <marmarek@invisiblethingslab.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTMvMDYvMTggMDk6MzYsIEphbiBCZXVsaWNoIHdyb3RlOgo+IErDvHJnZW4sIEJvcmlzLAo+
IAo+IGhhdmluZyBsb29rZWQgYXQgdGhhdCBpbiB0aGUgb3RoZXIgY29udGV4dCwgSSd2ZSBjb21l
IGFjcm9zcyB0aGUgb3RoZXIKPiBpbnZvY2F0aW9uIG9mIHRoZSBmdW5jdGlvbiBmcm9tIHhlbl9t
Y19mbHVzaCgpLiBJJ20gcHJldHR5IHN1cmUgdGhlCj4gc3RhYygpL2NsYWMoKSB1c2UgaXMgbm90
IGludGVuZGVkIGluIHRoaXMgY29udGV4dCwgYW5kIEkgZG9uJ3QgdGhpbmsKPiBNYXJlayBoYWQg
aW50ZW5kZWQgdGhpcyBzaWRlIGVmZmVjdCBpbiBjNTQ1OTBjYWM1IC0gYWZ0ZXIgYWxsIHRoZSB1
c2UKPiBvZiBwcml2Y21kX2NhbGwoKSBoZXJlIGxvb2tzIG1vcmUgbGlrZSBhbiBhYnVzZS4KCklu
ZGVlZC4KCkknbGwgd3JpdGUgYSBwYXRjaC4gVGhhbmtzIGZvciB0aGUgbm90aWNlLgoKCkp1ZXJn
ZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
