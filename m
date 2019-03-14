From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v13] tolerate jitter in cpu_khz calculation
 to avoid TSC emulation
Date: Thu, 14 Mar 2019 08:36:16 -0600
Message-ID: <5C8A66E0020000780021EBD3@prv1-mh.provo.novell.com>
References: <20190313082855.14106-1-olaf@aepfle.de>
 <5C88CAEF020000780021DFA6@prv1-mh.provo.novell.com>
 <20190314145003.36695ef4.olaf@aepfle.de>
 <cfd355b6-da0b-7e02-a484-cc8476a36198@suse.com>
 <20190314151416.625d8cfa.olaf@aepfle.de>
 <38e61ca1-7390-a942-8b41-eacca522bcb1@suse.com>
 <20190314153322.2fcf6808.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=U6t1=RR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h4RT1-0004re-5b
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2019 14:36:19 +0000
In-Reply-To: <20190314153322.2fcf6808.olaf@aepfle.de>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjAzLjE5IGF0IDE1OjMzLCA8b2xhZkBhZXBmbGUuZGU+IHdyb3RlOgo+IEFtIFRo
dSwgMTQgTWFyIDIwMTkgMTU6MjQ6NTkgKzAxMDAKPiBzY2hyaWViIEp1ZXJnZW4gR3Jvc3MgPGpn
cm9zc0BzdXNlLmNvbT46Cj4gCj4+IEkgYmVsaWV2ZSBhIHBlci1kb21haW4gY29udHJvbGxhYmxl
IHZhbHVlIGlzIHRvIGJlIHByZWZlcnJlZC4gRGlmZmVyZW50Cj4+IGd1ZXN0cyBtaWdodCBoYXZl
IGRpZmZlcmVudCBqaXR0ZXIgdG9sZXJhbmNlLgo+IAo+IElmIG90aGVycyBhZ3JlZSB3aXRoIHRo
YXQsIEkgY2FuIHJlc3VtZSB2MTAgb2YgdGhpcyBwYXRjaCwgd2hpY2ggd2FzIHNlbnQgCj4gZW5k
IGxhc3QgeWVhci4KCldlbGwsIHVubGVzcyBJJ20gbWlzcmVtZW1iZXJpbmcgeW91IGhhZCBkcm9w
cGVkIHRoYXQgZnVuY3Rpb25hbGl0eQp3aXRob3V0IGFueW9uZSBoYXZpbmcgYXNrZWQgdG8gZG8g
c28uCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
