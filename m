From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 02/10] xen: rename un/map_mmio_regions to
 un/map_regions
Date: Thu, 02 May 2019 09:03:37 -0600
Message-ID: <5CCB06C9020000780022B577@prv1-mh.provo.novell.com>
References: <alpine.DEB.2.10.1904301358560.13269@sstabellini-ThinkPad-X260>
 <1556658172-8824-2-git-send-email-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hMDFW-0007Fx-LU
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 15:03:50 +0000
In-Reply-To: <1556658172-8824-2-git-send-email-sstabellini@kernel.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <stefanos@xilinx.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMwLjA0LjE5IGF0IDIzOjAyLCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6
Cj4gTm93IHRoYXQgbWFwX21taW9fcmVnaW9ucyB0YWtlcyBhIHAybXQgcGFyYW1ldGVyLCB0aGVy
ZSBpcyBubyBuZWVkIHRvCj4ga2VlcCAibW1pbyIgaW4gdGhlIG5hbWUuIFRoZSBwMm10IHBhcmFt
ZXRlciBkb2VzIGEgYmV0dGVyIGpvYiBhdAo+IGV4cHJlc3Npbmcgd2hhdCB0aGUgbWFwcGluZyBp
cyBhYm91dC4gTGV0J3Mgc2F2ZSB0aGUgZW52aXJvbm1lbnQgNQo+IGNoYXJhY3RlcnMgYXQgYSB0
aW1lLgoKQnV0IGFzIHBlciB0aGUgY292ZXIgbGV0dGVyIHRoZSBwdXJwb3NlIGlzIHRvIGFsbG93
IG1hcHBpbmcKaW9tZW0gKHdoaWNoIEkgdGFrZSBpcyBqdXN0IGFuIGFsdGVybmF0aXZlIHRlcm0g
Zm9yIE1NSU8pLgpFdmVuIGlmIHRoYXQncyBtaXNsZWFkaW5nLCB7LHVufW1hcF9yZWdpb25zKCkg
aXMgYSBsaXR0bGUgdG9vCnVuc3BlY2lmaWMgZm9yIG15IHRhc3RlLiBBdCB3aGljaCBwb2ludCBh
dCBsZWFzdCB0aGUKZW52aXJvbm1lbnQgc2F2aW5nIGFyZ3VtZW50IGdvZXMgYXdheSA7LSkKCkFz
IHRvIHRoZSBzZXJpZXMgYXMgYSB3aG9sZSwgSSBndWVzcyB5b3UgZmlyc3Qgd2FudCB0byBjb21l
CnRvIGFuIGFncmVlbWVudCB3aXRoIEp1bGllbi4gT25seSB0aGVuIGl0J2xsIG1ha2Ugc2Vuc2Ug
dG8KYWN0dWFsbHkgcmV2aWV3IHRoZSBjaGFuZ2VzLCBJIHRoaW5rLgoKSmFuCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
