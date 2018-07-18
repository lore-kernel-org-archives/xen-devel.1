From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH v2 0/6] x86: (allow to) suppress use of
 hyper-threading
Date: Wed, 18 Jul 2018 02:15:03 -0600
Message-ID: <5B4EF70702000078001D53C7@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=rjtn=kc=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ffhc2-00042k-Nx
 for xen-devel@lists.xenproject.org; Wed, 18 Jul 2018 08:15:06 +0000
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SSd2ZSBiZWVuIGNvbnNpZGVyaW5nIHRvIGFkZCBhIHJlc3BlY3RpdmUgY29tbWFuZCBsaW5lIG9w
dGlvbiBmb3IKcXVpdGUgYSBsb25nIHRpbWUsIGJ1dCBuZXZlciBnb3QgYXJvdW5kIHRvLiBOb3cg
dGhhdCB0aGUgVExCbGVlZAppbmZvcm1hdGlvbiBpcyBwdWJsaWNbMV0sIHdlJ3JlIGF0IGEgcG9p
bnQgd2hlcmUgd2Ugbm90IG9ubHkgd2FudCwKYnV0IG5lZWQgdGhpcywgYW5kIHdoZXJlIHBlcmhh
cHMgaXQgbmVlZHMgdG8gYmUgdGhlIGRlZmF1bHQgb24KYWZmZWN0ZWQgc3lzdGVtcy4gVGhlIGZp
cnN0IDQgcGF0Y2hlcyBhcmUgYWxsIHByZXJlcXVpc2l0ZXMgdG8gdGhlCjV0aCBvbmU7IHRoZSBm
aW5hbCBvbmUgaXMgc2ltcGx5IGNsZWFudXAuCgoxOiBjcHVwb29sczogZml4IHN0YXRlIHdoZW4g
ZG93bmluZyBhIENQVSBmYWlsZWQKMjogeDg2OiBkaXN0aW5ndWlzaCBDUFUgb2ZmbGluaW5nIGZy
b20gQ1BVIHJlbW92YWwKMzogeDg2L0FNRDogZGlzdGluZ3Vpc2ggY29tcHV0ZSB1bml0cyBmcm9t
IGh5cGVyLXRocmVhZHMKNDogeDg2OiBicmluZyB1cCBhbGwgQ1BVcyBldmVuIGlmIG5vdCBhbGwg
YXJlIHN1cHBvc2VkIHRvIGJlIHVzZWQKNTogeDg2OiBjb21tYW5kIGxpbmUgb3B0aW9uIHRvIGF2
b2lkIHVzZSBvZiBzZWNvbmRhcnkgaHlwZXItdGhyZWFkcwo2OiBjcHVtYXNrOiB0aWR5IHssen1h
bGxvY19jcHVtYXNrX3ZhcigpIAoKSmFuCgpbMV0gaHR0cHM6Ly93d3cudnVzZWMubmV0L3Byb2pl
Y3RzL3RsYmxlZWQvCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
