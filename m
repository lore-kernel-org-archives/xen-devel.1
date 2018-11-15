From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH v2 1/3] x86/HVM: __hvm_copy() should not write
 to p2m_ioreq_server pages
Date: Thu, 15 Nov 2018 05:50:22 -0700
Message-ID: <5BED6B8E02000078001FC61F@prv1-mh.provo.novell.com>
References: <5BEAA1DB02000078001FB5BD@prv1-mh.provo.novell.com>
 <5BED6A7E02000078001FC615@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=wsre=n2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gNH6G-0000tV-Qn
 for xen-devel@lists.xenproject.org; Thu, 15 Nov 2018 12:50:24 +0000
In-Reply-To: <5BED6A7E02000078001FC615@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Q29tbWl0IDNiZGVjNTMwYTUgKCJ4ODYvSFZNOiBzcGxpdCBwYWdlIHN0cmFkZGxpbmcgZW11bGF0
ZWQgYWNjZXNzZXMgaW4KbW9yZSBjYXNlcyIpIGludHJvZHVjZWQgYSBodm1fY29weV90b19ndWVz
dF9saW5lYXIoKSBhdHRlbXB0IGJlZm9yZQpmYWxsaW5nIGJhY2sgdG8gaHZtZW11bF9saW5lYXJf
bW1pb193cml0ZSgpLiBUaGlzIGlzIHdyb25nIGZvciB0aGUKcDJtX2lvcmVxX3NlcnZlciBzcGVj
aWFsIGNhc2UuIFRoYXQgY2hhbmdlIHdpZGVuZWQgYSBwcmUtZXhpc3RpbmcgaXNzdWUKdGhvdWdo
OiBPdGhlciB3cml0ZXMgdG8gc3VjaCBwYWdlcyBhbHNvIG5lZWQgdG8gYmUgZmFpbGVkIChvciBm
b3JjZWQKdGhyb3VnaCBlbXVsYXRpb24pLCBpbiBwYXJ0aWN1bGFyIGh5cGVyY2FsbCBidWZmZXIg
d3JpdGVzLgoKUmVwb3J0ZWQtYnk6IElnb3IgRHJ1emhpbmluIDxpZ29yLmRydXpoaW5pbkBjaXRy
aXguY29tPgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+ClJl
dmlld2VkLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgoKLS0tIGEv
eGVuL2FyY2gveDg2L2h2bS9odm0uYworKysgYi94ZW4vYXJjaC94ODYvaHZtL2h2bS5jCkBAIC0z
MjA0LDYgKzMyMDQsMTIgQEAgc3RhdGljIGVudW0gaHZtX3RyYW5zbGF0aW9uX3Jlc3VsdCBfX2h2
bQogICAgICAgICBpZiAoIHJlcyAhPSBIVk1UUkFOU19va2F5ICkKICAgICAgICAgICAgIHJldHVy
biByZXM7CiAKKyAgICAgICAgaWYgKCAoZmxhZ3MgJiBIVk1DT1BZX3RvX2d1ZXN0KSAmJiBwMm10
ID09IHAybV9pb3JlcV9zZXJ2ZXIgKQorICAgICAgICB7CisgICAgICAgICAgICBwdXRfcGFnZShw
YWdlKTsKKyAgICAgICAgICAgIHJldHVybiBIVk1UUkFOU19iYWRfZ2ZuX3RvX21mbjsKKyAgICAg
ICAgfQorCiAgICAgICAgIHAgPSAoY2hhciAqKV9fbWFwX2RvbWFpbl9wYWdlKHBhZ2UpICsgKGFk
ZHIgJiB+UEFHRV9NQVNLKTsKIAogICAgICAgICBpZiAoIGZsYWdzICYgSFZNQ09QWV90b19ndWVz
dCApCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
