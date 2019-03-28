From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 0/7] x86: eliminate Intel-isms from x2APIC setup
Date: Thu, 28 Mar 2019 08:43:59 -0600
Message-ID: <5C9CDDAF020000780022282A@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=r6Gf=R7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h9WGC-0007D7-EJ
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2019 14:44:04 +0000
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Brian Woods <brian.woods@amd.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBpcyBhIGZpcnN0IHByZXBhcmF0b3J5IHN0ZXAgZm9yIGVuYWJsaW5nIHgyQVBJQyBzdXBw
b3J0IGFsc28KZm9yIEFNRCAocGx1cyBzb21lIG1pc2MgY2xlYW51cCkuCgoxOiBlbnRyeTogZHJv
cCB1bnVzZWQgaGVhZGVyIGluY2x1c2lvbnMKMjogQVBJQzogc3VwcHJlc3MgcmVkdW5kYW50ICJT
d2l0Y2hlZCB0byAuLi4iIG1lc3NhZ2VzCjM6IEFDUEk6IGFsc28gcGFyc2UgQU1EIElPTU1VIHRh
YmxlcyBlYXJseQo0OiBJT01NVTogaW50cm9kdWNlIGluaXQtb3BzIHN0cnVjdHVyZQo1OiBJT01N
VTogYWJzdHJhY3QgSW50ZWwtc3BlY2lmaWMgaW9tbXVfc3VwcG9ydHNfZWltKCkKNjogSU9NTVU6
IGFic3RyYWN0IEludGVsLXNwZWNpZmljIGlvbW11X3tlbixkaXN9YWJsZV94MmFwaWNfSVIoKQo3
OiBJT01NVTogaW5pdGlhbGl6ZSBpb21tdV9vcHMgaW4gdmVuZG9yLWluZGVwZW5kZW50IGNvZGUK
CkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
