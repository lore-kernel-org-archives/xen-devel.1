From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/4] xen/PVH: Use proper CS selector in long
 mode
Date: Wed, 02 May 2018 09:00:04 -0600
Message-ID: <5AE9D27402000078001C02ED__6088.70457294888$1525273148$gmane$org@prv1-mh.provo.novell.com>
References: <20180430162339.17143-1-boris.ostrovsky@oracle.com>
 <20180430162339.17143-3-boris.ostrovsky@oracle.com>
 <5AE9713D02000078001C007B@prv1-mh.provo.novell.com>
 <6b7a748d-e289-c370-123a-678c6ad7d9dd@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=toke=hv=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fDtEq-0007Kn-LY
 for xen-devel@lists.xenproject.org; Wed, 02 May 2018 15:00:12 +0000
In-Reply-To: <6b7a748d-e289-c370-123a-678c6ad7d9dd@oracle.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAyLjA1LjE4IGF0IDE2OjU3LCA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+IHdy
b3RlOgo+IE9uIDA1LzAyLzIwMTggMDQ6MDUgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBP
biAzMC4wNC4xOCBhdCAxODoyMywgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPiB3cm90ZToK
Pj4+IFNpZ25lZC1vZmYtYnk6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNs
ZS5jb20+Cj4+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+
Cj4+IEJ1dCB0byB1bmRlcnN0YW5kIHdoeSB0aGluZ3MgaGF2ZSBiZWVuIHdvcmtpbmcgbmV2ZXJ0
aGVsZXNzIGl0IHdvdWxkCj4+IGhhdmUgYmVlbiBuaWNlIGlmIHRoZSBjb21taXQgbWVzc2FnZSB3
YXNuJ3QgZW1wdHksIGJ1dCBpbnN0ZWFkIHNhaWQKPj4gc29tZXRoaW5nIGxpa2UgIlRoZSB0d28g
aGFwcGVuIHRvIGJlIGlkZW50aWNhbCBvbiA2NC1iaXQuIgo+IAo+IAo+IFdoeSBkbyB5b3UgdGhp
bmsgdGhleSBhcmUgaWRlbnRpY2FsPyBfX0tFUk5FTF9DUyBwb2ludHMgdG8gZW50cnkjMTIKPiAo
d2hpY2ggd2UgZG9uJ3Qgc3BlY2lmeSBpbiBQVkggR0RUKSB3aGlsZSBfX0JPT1RfQ1MgaXMgdGhl
IHNlY29uZCBlbnRyeQo+ICh3aGljaCB3ZSBkbyBjcmVhdGUpLgoKVGhhdCdzIDMyLWJpdCdzIF9f
S0VSTkVMX0NTLiBJZiB0aGUgdHdvIHdlcmVuJ3QgaWRlbnRpY2FsLCB0aGUgbGptcAp5b3UgYWRq
dXN0IHdvdWxkIG5ldmVyIGhhdmUgd29ya2VkIGFmYWljdC4KCkphbgoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
