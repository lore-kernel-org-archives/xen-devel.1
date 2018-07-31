From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] tools/gdbsx: fix 'g' packet response for
 64bit guests
Date: Tue, 31 Jul 2018 02:35:56 -0600
Message-ID: <5B601F6C02000078001D9474@prv1-mh.provo.novell.com>
References: <20180731023042.19031-1-marmarek@invisiblethingslab.com>
 <5B60176302000078001D941A@prv1-mh.provo.novell.com>
 <80414cf1-c4c4-ef0a-0b75-60760597ca63@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=3hbq=kp=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fkQ8Q-00045t-MK
 for xen-devel@lists.xenproject.org; Tue, 31 Jul 2018 08:36:02 +0000
In-Reply-To: <80414cf1-c4c4-ef0a-0b75-60760597ca63@citrix.com>
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Marek Marczykowski <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMxLjA3LjE4IGF0IDEwOjA5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMzEvMDcvMjAxOCAwOTowMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDMx
LjA3LjE4IGF0IDA0OjMwLCA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbT4gd3JvdGU6
Cj4+IE1hcmVrLAo+Pgo+PiBsb29rcyBsaWtlIGFsbCBvZiB0aGUgcGF0Y2hlcyB5b3UndmUgc2Vu
dCBlYXJseSB0aGlzIG1vcm5pbmcgbG9jYWwgdGltZQo+PiBoZXJlIGNhbWUgdGhyb3VnaCB0d2lj
ZSBvbiB4ZW4tZGV2ZWw6IFdvdWxkIHlvdSBwbGVhc2UgYXZvaWQKPj4gaGF2aW5nIHhlbi1kZXZl
bCBvbiBib3RoIHRoZSBUbyBhbmQgdGhlIENjIGxpc3RzIChqdXN0IHdpdGggZGlmZmVyZW50Cj4+
IGRvbWFpbnMpPwo+IAo+IEkndmUgb25seSBnb3QgYSBzaW5nbGUgY29weSwgYW5kIHRoZSBsaXN0
IGFyY2hpdmVzIG9ubHkgc2hvdyBhIHNpbmdsZSBjb3B5Lgo+IAo+IEFyZSB5b3Ugc3VyZSB0aGF0
J3Mgbm90IGp1c3Qgc29tZXRoaW5nIGxvY2FsIHRvIHlvdT8KCldlbGwsIEkgZG9uJ3Qgc2VlIGhv
dyB0aGVyZSBjYW4gYmUgb25seSBhIHNpbmdsZSBjb3B5IHdpdGgKeGVuLWRldmVsIG9uIGJvdGgg
dGhlIFRvIGFuZCBDYyBsaXN0cywgdW5sZXNzIGRlLWR1cGxpY2F0aW9uCmhhcHBlbnMgYXQgdGhl
IHJlY2VpdmVyIGVuZCAod2hpY2ggSSBjb3VsZCBpbWFnaW5lIGhhcHBlbnMKaW4gbGlzdCBhcmNo
aXZpbmcpLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
