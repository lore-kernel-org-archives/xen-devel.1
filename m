From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 15/25] x86/HVM: eliminate custom #MF/#XM
	handling
Date: Fri, 2 Feb 2018 13:38:28 +0000
Message-ID: <11f70520-c3fc-7b0d-229b-c24118f9d782@citrix.com>
References: <5A29550C020000780019585B@prv-mh.provo.novell.com>
 <5A2959D80200007800195947@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=g0dj=e4=citrix.com=prvs=564f8cbd0=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ehbXz-0004TQ-U9
 for xen-devel@lists.xenproject.org; Fri, 02 Feb 2018 13:38:31 +0000
In-Reply-To: <5A2959D80200007800195947@prv-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMTIvMTcgMTQ6MTAsIEphbiBCZXVsaWNoIHdyb3RlOgo+IFVzZSB0aGUgZ2VuZXJpYyBz
dHViIGV4Y2VwdGlvbiBoYW5kbGluZyBpbnN0ZWFkLgo+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IFJldmlld2VkLWJ5OiBQYXVsIER1cnJhbnQgPHBh
dWwuZHVycmFudEBjaXRyaXguY29tPgoKQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+LCBiZWNhdXNlIEknbSBoYXBweQp3aXRoIHRoZSBjaGFuZ2UgYnV0
IHlvdSd2ZSBnb3QgcXVpdGUgYSBsb3Qgb2YgcmViYXNpbmcgdG8gZ2V0IHRoaXMgdG8KYXBwbHkg
dG8gc3RhZ2luZy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
