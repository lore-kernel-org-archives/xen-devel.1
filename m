From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/4] xen/PVH: Use proper CS selector in long
 mode
Date: Wed, 2 May 2018 16:28:18 +0100
Message-ID: <c25989fb-b1da-ea88-37de-6c36ecdf72d2__34125.2938531854$1525274830$gmane$org@citrix.com>
References: <20180430162339.17143-1-boris.ostrovsky@oracle.com>
 <20180430162339.17143-3-boris.ostrovsky@oracle.com>
 <5AE9713D02000078001C007B@prv1-mh.provo.novell.com>
 <6b7a748d-e289-c370-123a-678c6ad7d9dd@oracle.com>
 <5AE9D27402000078001C02ED@prv1-mh.provo.novell.com>
 <cb819dcb-1597-680e-31b3-b63fecb6d4c1@oracle.com>
 <5AE9D49B02000078001C0322@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=4tft=hv=citrix.com=prvs=653accde0=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fDtg6-0001FN-6V
 for xen-devel@lists.xenproject.org; Wed, 02 May 2018 15:28:22 +0000
In-Reply-To: <5AE9D49B02000078001C0322@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMDUvMTggMTY6MDksIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDAyLjA1LjE4IGF0
IDE3OjA4LCA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+IHdyb3RlOgo+PiBPbiAwNS8wMi8y
MDE4IDExOjAwIEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IE9uIDAyLjA1LjE4IGF0IDE2
OjU3LCA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+IHdyb3RlOgo+Pj4+IE9uIDA1LzAyLzIw
MTggMDQ6MDUgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+PiBPbiAzMC4wNC4xOCBhdCAx
ODoyMywgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPiB3cm90ZToKPj4+Pj4+IFNpZ25lZC1v
ZmYtYnk6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+Cj4+Pj4+
IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+Pj4+Cj4+Pj4+
IEJ1dCB0byB1bmRlcnN0YW5kIHdoeSB0aGluZ3MgaGF2ZSBiZWVuIHdvcmtpbmcgbmV2ZXJ0aGVs
ZXNzIGl0IHdvdWxkCj4+Pj4+IGhhdmUgYmVlbiBuaWNlIGlmIHRoZSBjb21taXQgbWVzc2FnZSB3
YXNuJ3QgZW1wdHksIGJ1dCBpbnN0ZWFkIHNhaWQKPj4+Pj4gc29tZXRoaW5nIGxpa2UgIlRoZSB0
d28gaGFwcGVuIHRvIGJlIGlkZW50aWNhbCBvbiA2NC1iaXQuIgo+Pj4+IFdoeSBkbyB5b3UgdGhp
bmsgdGhleSBhcmUgaWRlbnRpY2FsPyBfX0tFUk5FTF9DUyBwb2ludHMgdG8gZW50cnkjMTIKPj4+
PiAod2hpY2ggd2UgZG9uJ3Qgc3BlY2lmeSBpbiBQVkggR0RUKSB3aGlsZSBfX0JPT1RfQ1MgaXMg
dGhlIHNlY29uZCBlbnRyeQo+Pj4+ICh3aGljaCB3ZSBkbyBjcmVhdGUpLgo+Pj4gVGhhdCdzIDMy
LWJpdCdzIF9fS0VSTkVMX0NTLiBJZiB0aGUgdHdvIHdlcmVuJ3QgaWRlbnRpY2FsLCB0aGUgbGpt
cAo+Pj4geW91IGFkanVzdCB3b3VsZCBuZXZlciBoYXZlIHdvcmtlZCBhZmFpY3QuCj4+Cj4+IE9o
LCByaWdodC4gTXkgdGhlb3J5IHdhcyB0aGF0IHdlIHdlcmUgcGlja2luZyB1cCBzb21ldGhpbmcg
ZnJvbSB0aGUKPj4gc3RhY2sgKHdoaWNoIGlzIHdoZXJlIDEydGggZW50cnkgd291bGQgYmUgcG9p
bnRpbmcpIGFuZCB0aGUgTCBiaXQsIHdoaWNoCj4+IEkgdGhpbmsgaXMgdGhlIG9ubHkgb25lIHdl
J2QgY2FyZSBhYm91dCwgaGFwcGVuZWQgdG8gYWx3YXlzIGJlIHNldCB0aGVyZS4KPiBJIGRvbid0
IHRoaW5rIHRoZSBMIGJpdCBpcyB0aGUgb25seSBvbmUgd2UgY2FyZSBhYm91dCwgYXMgSSBkb24n
dCB0aGluayB5b3UKPiBjYW4gbG9hZCBhIG5vbi1jb2RlIHNlbGVjdG9yIGludG8gQ1MgKGV2ZW4g
aWYgbm9uZSBvZiB0aGUgYXR0cmlidXRlcyBhcmUKPiBsYXRlciB1c2VkIGZvciBhbnl0aGluZyku
CgpUaGUgdHlwZS9zL2RwbC9wL2QvbCBhdHRyaWJ1dGVzIHN0aWxsIHZlcnkgbXVjaCBtYXR0ZXIg
ZXZlbiBpbiA2NGJpdC4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
