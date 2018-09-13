From: George Dunlap <dunlapg@umich.edu>
Subject: Fwd: [CentOS-virt] We need a patch in the kernel for tpm
Date: Thu, 13 Sep 2018 10:58:49 +0100
Message-ID: <CAFLBxZbT4neQ1dzv7ydo7Vxs+z+2Hm7bhZ+0AAB0UcB5_7SZ2g@mail.gmail.com>
References: <2049090.WGtHRRLPAi@dag.newtech.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ukhy=l3=gmail.com=dunlapg@srs-us1.protection.inumbo.net>)
 id 1g0OOs-0004Qu-1O
 for xen-devel@lists.xenproject.org; Thu, 13 Sep 2018 09:59:02 +0000
Received: by mail-qt0-x231.google.com with SMTP id r37-v6so4791078qtc.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Sep 2018 02:59:00 -0700 (PDT)
In-Reply-To: <2049090.WGtHRRLPAi@dag.newtech.fi>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SnVlcmdlbiAvIEJvcmlzIC0tIGdvdCB0aGlzICJwaW5nIiBmcm9tIHNvbWVvbmUgdXNpbmcgQ2Vu
dE9TLiAgTG9va3MKbGlrZSB0aGUgb3JpZ2luYWwgc3VibWl0dGVyIGFiYW5kb25lZCBpdCAtLSBk
byB5b3UgZ3V5cyB3YW50IHRvIHBpY2sKaXQgdXA/CgogLUdlb3JnZQoKLS0tLS0tLS0tLSBGb3J3
YXJkZWQgbWVzc2FnZSAtLS0tLS0tLS0KRnJvbTogRGFnIE55Z3JlbiA8ZGFnQG5ld3RlY2guZmk+
CkRhdGU6IFRodSwgU2VwIDEzLCAyMDE4IGF0IDEwOjQxIEFNClN1YmplY3Q6IFtDZW50T1Mtdmly
dF0gV2UgbmVlZCBhIHBhdGNoIGluIHRoZSBrZXJuZWwgZm9yIHRwbQpUbzogPGNlbnRvcy12aXJ0
QGNlbnRvcy5vcmc+CgoKSGkhCgpUaGluayBJIGZvdW5kIGEgcmVmZXJlbmNlIHRvIHRoZSBwcm9i
bGVtKHMpIEkgYW0gc2VlaW5nIHdpdGgKeGVuLXRwbWZyb250IGluIG15IHNldHVwIG9uIHRoZSBu
ZXQ6CgpodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzk0ODU2MzcvCgpUaGlzIHBh
dGNoIGhhcyBub3QgYmVlbiBvZmZpY2lhbGx5IGVudGVyZWQgYW5kIGl0IGlzIG5vdAppbmNsdWRl
ZCBpbiB0aGUga2VybmVsIHByb3ZpZGVkIGluIFNJRyB2aXJ0IGVpdGhlcgoKQ2FuIHdlIHBsZWFz
ZSBnZXQgaXQgaW4gPwoKQmVzdApEYWcKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KQ2VudE9TLXZpcnQgbWFpbGluZyBsaXN0CkNlbnRPUy12aXJ0QGNl
bnRvcy5vcmcKaHR0cHM6Ly9saXN0cy5jZW50b3Mub3JnL21haWxtYW4vbGlzdGluZm8vY2VudG9z
LXZpcnQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
