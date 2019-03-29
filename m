From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86emul/fuzz: adjust canonicalization in
 sanitize_input()
Date: Fri, 29 Mar 2019 09:23:14 -0600
Message-ID: <5C9E38620200007800222F8B@prv1-mh.provo.novell.com>
References: <5C9E30F40200007800222DDC@prv1-mh.provo.novell.com>
 <8B8E72C2-696B-4C0D-8733-78C7B93B9FB0@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NqUC=SA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h9tLg-0002NV-Bo
 for xen-devel@lists.xenproject.org; Fri, 29 Mar 2019 15:23:16 +0000
In-Reply-To: <8B8E72C2-696B-4C0D-8733-78C7B93B9FB0@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: george.dunlap@citrix.com
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI5LjAzLjE5IGF0IDE2OjE0LCA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKCj4gCj4+IE9uIE1hciAyOSwgMjAxOSwgYXQgMjo1MSBQTSwgSmFuIEJldWxpY2ggPEpCZXVs
aWNoQHN1c2UuY29tPiB3cm90ZToKPj4gCj4+IERyb3AgaXQgZW50aXJlbHkgZm9yICVyYnAgLSB0
aGlzIHJlZ2lzdGVyIGlzIG5vdCBzcGVjaWFsIHB1cnBvc2UgZW5vdWdoCj4+IHRvIHdhcnJhbnQg
c3VjaCBzcGVjaWFsIHRyZWF0bWVudC4gQWRkIGEgY29tbWVudCB0byBjbGFyaWZ5IHRoZSBwdXJw
b3NlCj4+IG9mIHRoZSBjYW5vbmljYWxpemF0aW9uIG9mICVyaXAgYW5kICVyc3AuCj4+IAo+PiBT
aWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gCj4gRkFPRDoK
PiAxLiBJIGRvbuKAmXQgb3Bwb3NlIHRoaXMsIGJ1dAo+IDIuIEkgZG9u4oCZdCBzdXBwb3J0IGl0
IGVpdGhlcjsgaG93ZXZlciwKPiAzLiBJIGRvbuKAmXQgdGhpbmsgbXkgQWNrIGlzIG5lY2Vzc2Fy
eS4KCldlbGwsIHByZWZlcmFibHkgSSB3b3VsZCBhZGRyZXNzIHlvdXIgY29uY2VybnMgZGVzcGl0
ZSAzLiBTbyBjb3VsZAp5b3UgY2xhcmlmeSB3aGF0IHlvdSB3b3VsZCBzdWdnZXN0IGluc3RlYWQ/
IEtlZXAgdGhpbmdzIGFzIHRoZXkKYXJlPyBEcm9wIGFsbCBjYW5vbmljYWxpemF0aW9uPyBJJ3Zl
IGJhc2ljYWxseSB0cmllZCB0byBmaW5kIGEgbWlkZGxlCmdyb3VuZCBiZXR3ZWVuIHRoZSB0d28g
ZXh0cmVtZXMuCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
