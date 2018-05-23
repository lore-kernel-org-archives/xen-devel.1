From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v5 1/2] xen/PVH: Set up GS segment for stack
 canary
Date: Wed, 23 May 2018 09:41:20 -0600
Message-ID: <5B058BA002000078001C523F__3239.83121566034$1527091231$gmane$org@prv1-mh.provo.novell.com>
References: <20180523143002.29252-1-boris.ostrovsky@oracle.com>
 <20180523143002.29252-2-boris.ostrovsky@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=f/rg=ik=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fLWCr-0007ik-Lv
 for xen-devel@lists.xenproject.org; Wed, 23 May 2018 16:01:41 +0000
In-Reply-To: <20180523143002.29252-2-boris.ostrovsky@oracle.com>
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
Cc: Juergen Gross <jgross@suse.com>, brgerst@gmail.com, linux-kernel@vger.kernel.org, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIzLjA1LjE4IGF0IDE2OjMwLCA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+IHdy
b3RlOgo+IEBAIC05OCw2ICsxMDEsMTIgQEAgRU5UUlkocHZoX3N0YXJ0X3hlbikKPiAgCS8qIDY0
LWJpdCBlbnRyeSBwb2ludC4gKi8KPiAgCS5jb2RlNjQKPiAgMToKPiArCS8qIFNldCBiYXNlIGFk
ZHJlc3MgaW4gc3RhY2sgY2FuYXJ5IGRlc2NyaXB0b3IuICovCj4gKwltb3YgJE1TUl9HU19CQVNF
LCVlY3gKPiArCW1vdiAkX3BhKGNhbmFyeSksICVyYXgKPiArCXhvciAlcmR4LCAlcmR4CgpXaHkg
cmF4IGFuZCByZHggaW5zdGVhZCBvZiBlYXggYW5kIGVkeD8gSW4gdGhlIGZvcm1lciBjYXNlLCB0
aGUKcmVsb2NhdGlvbiBwcm9kdWNlZCBtaWdodCBjb25mdXNlIHdoYXRldmVyIGVudGl0eSBwcm9j
ZXNzaW5nIGl0CihpdCdsbCBoYXZlIGEgc2lnbi1leHRlbmRlZCAzMi1iaXQgcXVhbnRpdHkgdG8g
ZGVhbCB3aXRoLCB3aGljaAp3b3VsZG4ndCBhbGxvdyByZXByZXNlbnRpbmcgYW4gYWRkcmVzcyBp
biB0aGUgWzJHYiwgNEdiKSByYW5nZSkuCkluIHRoZSBsYXR0ZXIgY2FzZSwgd2hpbGUgc3VyZWx5
IG5laXRoZXIgcGVyZm9ybWFuY2Ugbm9yIGNvZGUgc2l6ZQptYXR0ZXIgbXVjaCBoZXJlLCBpdCdz
IHN0aWxsIGEgYmFkIHByZWNlZGVudCAocGVvcGxlIGNvcHktYW5kLXBhc3RlCmNvZGUgYWxsIHRo
ZSB0aW1lKTogWmVyby1pbmcgb2YgcmVnaXN0ZXJzIHNob3VsZCBnZW5lcmFsbHkgdXNlIHRoZQoz
Mi1iaXQgZm9ybXMgb2YgdGhlIGluc24uIEdhcyBoYXMgYWN0dWFsbHkgZ2FpbmVkIGFuIG9wdGlt
aXphdGlvbgptb2RlIHJlY2VudGx5ICh1cG9uIHJlcXVlc3QgZnJvbSBMaW51cyBhbmQgdGhlIHg4
NiBtYWludGFpbmVycykKdG8gc2lsZW50bHkgInJlcGFpciIgc3VjaCBpbmVmZmljaWVuY2llcy4K
CkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
