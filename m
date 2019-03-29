From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/Xen: streamline (and fix) PV CPU
 enumeration
Date: Fri, 29 Mar 2019 09:12:47 -0600
Message-ID: <5C9E35EF0200007800222E0B__9899.60829481191$1553872400$gmane$org@prv1-mh.provo.novell.com>
References: <5C9B92EA020000780022227B@prv1-mh.provo.novell.com>
 <2f027b4b-dce2-3e90-dc1b-c824bc8eb355@oracle.com>
 <5C9C8DDC0200007800222606@prv1-mh.provo.novell.com>
 <eda3938f-02a5-e5a2-4718-d75bc488f296@oracle.com>
 <5C9DDD530200007800222B22@prv1-mh.provo.novell.com>
 <24df98be-21e7-617e-7651-ae34e2a2e512@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NqUC=SA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h9tBe-0000Rp-Fn
 for xen-devel@lists.xenproject.org; Fri, 29 Mar 2019 15:12:54 +0000
In-Reply-To: <24df98be-21e7-617e-7651-ae34e2a2e512@oracle.com>
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI5LjAzLjE5IGF0IDE0OjQyLCA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+IHdy
b3RlOgo+IE9uIDMvMjkvMTkgNDo1NCBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDI4
LjAzLjE5IGF0IDE3OjUwLCA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+IHdyb3RlOgo+Pj4K
Pj4+IEdpdmVuIGVzcGVjaWFsbHkgeGVuX3B2X3NtcF9wcmVwYXJlX2NwdXMoKSwgSSB0aGluayBy
ZS13b3JraW5nIHByb3Blcgo+Pj4gc2V0dGluZyBvZiBwcmVzZW50L3Bvc3NpYmxlIG1hc2tzIGlz
IHdlbGwgYmV5b25kIHRoZSBzY29wZSBvZiB5b3VyCj4+PiBvcmlnaW5hbCBwYXRjaC4KPj4gV2Vs
bCwgdGhlbiB0aGUgcXVlc3Rpb24gaXMsIHdoYXQgKGlmIGFueSkgY2hhbmdlcyBhcmUgeW91Cj4+
IGV4cGVjdGluZyBtZSB0byBtYWtlIGZvciB0aGlzIGNoYW5nZSB0byBiZSBhY2NlcHRhYmxlPyBP
ciBkbwo+PiB5b3UgcGVyaGFwcyB3YW50IG1lIHRvIGFkZCBhIDJuZCBwYXRjaCBvbiB0b3AgYWRk
cmVzc2luZwo+PiB0aGUgb3RoZXIgb3V0bGluZWQgYW5vbWFsaWVzPwo+IAo+IElmIHlvdXIgZ29h
bCBpcyBqdXN0IHRvIGZpeCB0aGUgZG9tMF9tYXhfdmNwdXMgaXNzdWUgdGhlbiB0aGlzIHBhdGNo
IGlzCj4gc3VmZmljaWVudCAoYnV0IHRoZSBjb21taXQgbWVzc2FnZSBzaG91bGQgc2F5IHRoYXQg
dGhpcyBpcyB3aGF0IHRoZQo+IHBhdGNoIGlzIGZvcikuCj4gCj4gQnV0IGlmIHlvdSBhcmUgdHJ5
aW5nIHRvIG1ha2UgY3B1IG1hc2tzIG1hbmFnZW1lbnQgZG9uZSBwcm9wZXJseSB0aGVuIEkKPiB0
aGluayB0aGlzIHBhdGNoIGFsb25lIGRvZXMgbm90IGFkZHJlc3MgdGhpcyBmdWxseS4KCkkuZS4g
Zm9sZGluZyB0aGUgZnVydGhlciBpdGVtcyBkaXNjdXNzZWQgaW50byB0aGlzIHBhdGNoIHdvdWxk
IGJlCmZpbmUgYnkgeW91PyAoSSdtIGp1c3QgdHJ5aW5nIHRvIGF2b2lkIGhhdmluZyB0byBnbyB0
aHJvdWdoCnNldmVyYWwgbW9yZSByb3VuZHMgb2YgcGF0Y2ggc3VibWlzc2lvbnMuKQoKSmFuCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
