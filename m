From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 3/7] x86: introduce altinstruction_nop
 assembler macro
Date: Fri, 02 Mar 2018 00:24:59 -0700
Message-ID: <5A990A5B02000078001ADA12@prv-mh.provo.novell.com>
References: <5A7B31DF02000078001A61F9@prv-mh.provo.novell.com>
 <5A7B33AD02000078001A6225@prv-mh.provo.novell.com>
 <16f0a78d-e4da-2e3a-0b00-978fa69f9df1@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=z0cn=fy=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1erf3y-00006u-9g
 for xen-devel@lists.xenproject.org; Fri, 02 Mar 2018 07:25:06 +0000
In-Reply-To: <16f0a78d-e4da-2e3a-0b00-978fa69f9df1@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAxLjAzLjE4IGF0IDIwOjI1LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDcvMDIvMTggMTY6MTMsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBUaGlzIGFsbG93
cyBzaG9ydGVuaW5nIChhbmQgbWFraW5nIG1vcmUgb2J2aW91cyB3aGF0IHRoZXkgZG8pIHNvbWUK
Pj4gYWx0aW5zdHJ1Y3Rpb25fZW50cnkgdXNlcy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IAo+IEluIHByaW5jaXBsZSwgUmV2aWV3ZWQtYnk6
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+LAo+IGJ1dCBJJ2QgcHJl
ZmVyIGlmIHlvdSBoZWxkIGl0IGJhY2sgdW50aWwgbXkgbm9wIGNhbGN1bGF0aW9uIHNlcmllcyBp
cwo+IGluLCB3aGljaCB3aWxsIGRyb3AgdGhpcyBwYXRjaCBkb3duIHRvIHRoZSBzaW5nbGUgaHVu
ayBpbiBhbHRlcm5hdGl2ZS1hc20uaAoKSSB3YXMgY2VydGFpbmx5IGhvcGluZyB0byByZS1iYXNl
IHRoaXMgb24gdG9wIG9mIHlvdXIgd29yay4gSSBkb24ndApzZWUgdGhvdWdoIHdoeSB0aGF0IHNp
bmdsZSBodW5rIHdvdWxkIHRoZW4gc3RpbGwgYmUgd2FudGVkIGFzIGEKc3RhbmRhbG9uZSBwYXRj
aCAtIEknZCBzaW1wbHkgbW92ZSBpdCBpbnRvIHRoZSBuZXh0IG9uZS4KCkphbgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
