From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH v3 0/4] x86: allow to suppress use of
 hyper-threading
Date: Thu, 19 Jul 2018 04:25:52 -0600
Message-ID: <5B50673002000078001D5CD3@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=hpq6=kd=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fg68E-0004lF-49
 for xen-devel@lists.xenproject.org; Thu, 19 Jul 2018 10:25:58 +0000
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
cnN0IDIgcGF0Y2hlcyBhcmUgcHJlcmVxdWlzaXRlcyB0byB0aGUgM3JkCm9uZTsgdGhlIGZpbmFs
IG9uZSBpcyBzaW1wbHkgY2xlYW51cC4KCkkndmUgcmV0YWluZWQgYWxsIHRhZ3MgcHJvdmlkZWQg
Zm9yIHYyLCBhcyB0aGUgY2hhbmdlcyBhcmUgcmVhbGx5CnNtYWxsIGFuZCBoYXZlIGxhcmdlbHkg
YmVlbiByZXF1ZXN0ZWQgZm9yIHRoZSB0YWdzIHRvIGFwcGx5LgoKMTogeDg2OiBkaXN0aW5ndWlz
aCBDUFUgb2ZmbGluaW5nIGZyb20gQ1BVIHJlbW92YWwKMjogeDg2OiBicmluZyB1cCBhbGwgQ1BV
cyBldmVuIGlmIG5vdCBhbGwgYXJlIHN1cHBvc2VkIHRvIGJlIHVzZWQKMzogeDg2OiBjb21tYW5k
IGxpbmUgb3B0aW9uIHRvIGF2b2lkIHVzZSBvZiBzZWNvbmRhcnkgaHlwZXItdGhyZWFkcwo0OiBj
cHVtYXNrOiB0aWR5IHssen1hbGxvY19jcHVtYXNrX3ZhcigpIAoKSmFuCgpbMV0gaHR0cHM6Ly93
d3cudnVzZWMubmV0L3Byb2plY3RzL3RsYmxlZWQvCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
