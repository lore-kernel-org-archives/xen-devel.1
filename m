From: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1] xen/balloon: Fix mapping PG_offline
 pages to user space
Date: Thu, 14 Mar 2019 17:00:15 +0100
Message-ID: <81175478-d6cf-56ce-587c-87473e79fd50__37183.512355999$1552579273$gmane$org@redhat.com>
References: <20190314154025.21128-1-david@redhat.com>
 <5C8A77FD020000780021EC87@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mfUP=RR=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1h4SmK-0005eD-Gl
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2019 16:00:20 +0000
In-Reply-To: <5C8A77FD020000780021EC87@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, Julien Grall <julien.grall@arm.com>, Nadav Amit <namit@vmware.com>, xen-devel <xen-devel@lists.xenproject.org>, akpm@linux-foundation.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTQuMDMuMTkgMTY6NDksIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDE0LjAzLjE5IGF0
IDE2OjQwLCA8ZGF2aWRAcmVkaGF0LmNvbT4gd3JvdGU6Cj4+IC0tLSBhL2RyaXZlcnMveGVuL2Jh
bGxvb24uYwo+PiArKysgYi9kcml2ZXJzL3hlbi9iYWxsb29uLmMKPj4gQEAgLTYwNCw2ICs2MDQs
NyBAQCBpbnQgYWxsb2NfeGVuYmFsbG9vbmVkX3BhZ2VzKGludCBucl9wYWdlcywgc3RydWN0IHBh
Z2UgKipwYWdlcykKPj4gIAl3aGlsZSAocGdubyA8IG5yX3BhZ2VzKSB7Cj4+ICAJCXBhZ2UgPSBi
YWxsb29uX3JldHJpZXZlKHRydWUpOwo+PiAgCQlpZiAocGFnZSkgewo+PiArCQkJX19DbGVhclBh
Z2VPZmZsaW5lKHBhZ2UpOwo+PiAgCQkJcGFnZXNbcGdubysrXSA9IHBhZ2U7Cj4gCj4gV2hpbGUg
dGhpcyBvbmUncyBmaW5lLCAuLi4KPiAKPj4gQEAgLTY0Niw2ICs2NDcsNyBAQCB2b2lkIGZyZWVf
eGVuYmFsbG9vbmVkX3BhZ2VzKGludCBucl9wYWdlcywgc3RydWN0IHBhZ2UgKipwYWdlcykKPj4g
IAo+PiAgCWZvciAoaSA9IDA7IGkgPCBucl9wYWdlczsgaSsrKSB7Cj4+ICAJCWlmIChwYWdlc1tp
XSkKPj4gKwkJCV9fU2V0UGFnZU9mZmxpbmUocGFnZXNbaV0pOwo+PiAgCQkJYmFsbG9vbl9hcHBl
bmQocGFnZXNbaV0pOwo+PiAgCX0KPiAKPiAuLi4gSSB0aGluayB5b3Ugd2FudCB0byBhZGQgYSBw
YWlyIG9mIGJyYWNlcyBoZXJlLgo+IAo+IEphbgo+IAo+IAoKSW5kZWVkLCBkcm9wcGVkIGJ5IGFj
Y2lkZW50LiBXaWxsIHJlc2VuZCBpbiBhIG1pbnV0ZS4gVGhhbmtzIQoKLS0gCgpUaGFua3MsCgpE
YXZpZCAvIGRoaWxkZW5iCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
