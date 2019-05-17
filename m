From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] x86: cover for clang's lack of support of
 -mpreferred-stack-boundary=<N>
Date: Fri, 17 May 2019 09:00:47 -0600
Message-ID: <5CDECC9F020000780023023C@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mYL4=TR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hReLs-0003Wv-1z
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 15:00:52 +0000
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

V2hpbGUgY2xhbmcgc3VwcG9zZWRseSBzdXBwb3J0cyAtbXN0YWNrLWFsaWdubWVudD08Tj4gaW5z
dGVhZCwgSSdtIG5vdAp1c2luZyB0aGF0IGFsdGVybmF0aXZlIGhlcmUgZHVlIHRvIGJlaW5nIHVu
Y2VydGFpbiB3aGV0aGVyIHRoYXQncyBpbmRlZWQKYW4gZXhhY3QgZXF1aXZhbGVudCBvZiB0aGUg
Z2NjIG9wdGlvbi4gT25seSBtYWtlIHVzZSBvZiB0aGUgb3B0aW9uCmVudGlyZWx5IGNvbmRpdGlv
bmFsIGZvciBub3cuCgpSZXBvcnRlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT4KU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
PgoKLS0tIGEveGVuL2FyY2gveDg2L2VmaS9NYWtlZmlsZQorKysgYi94ZW4vYXJjaC94ODYvZWZp
L01ha2VmaWxlCkBAIC03LDcgKzcsOCBAQCBib290LmluaXQubzogYnVpbGRpZC5vCiAKIEVGSU9C
SiA6PSBib290LmluaXQubyBjb21wYXQubyBydW50aW1lLm8KIAotJChFRklPQkopOiBDRkxBR1Mt
c3RhY2stYm91bmRhcnkgOj0gLW1wcmVmZXJyZWQtc3RhY2stYm91bmRhcnk9NAorJChjYWxsIGNj
LW9wdGlvbi1hZGQsY2ZsYWdzLXN0YWNrLWJvdW5kYXJ5LENDLC1tcHJlZmVycmVkLXN0YWNrLWJv
dW5kYXJ5PTQpCiskKEVGSU9CSik6IENGTEFHUy1zdGFjay1ib3VuZGFyeSA6PSAkKGNmbGFncy1z
dGFjay1ib3VuZGFyeSkKIAogb2JqLXkgOj0gc3R1Yi5vCiBvYmotJChYRU5fQlVJTERfRUZJKSA6
PSAkKEVGSU9CSikgcmVsb2NzLWR1bW15Lm8KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
