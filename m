From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: Reducing or removing direct map from xen (was Re:
 Ongoing/future speculative mitigation work)
Date: Fri, 22 Feb 2019 06:24:57 -0700
Message-ID: <5C6FF829020000780021933F@prv1-mh.provo.novell.com>
References: <20190124114455.eyke5dvkqsxhklav@zion.uk.xensource.com>
 <20190220122901.6kvc7ibyjo4uyzke@zion.uk.xensource.com>
 <20190220130052.b22syaca6cswc3pk@Air-de-Roger>
 <20190220130956.tkhsmdojzdf4nc7x@zion.uk.xensource.com>
 <20190220170809.jr6neinf5beescf4@zion.uk.xensource.com>
 <5C6FE1790200007800219178@prv1-mh.provo.novell.com>
 <20190222115033.2jhkceg6fv4bcmkm@zion.uk.xensource.com>
 <5C6FE5AB02000078002191B0@prv1-mh.provo.novell.com>
 <20190222121145.xkvchgp7yjckokri@zion.uk.xensource.com>
 <5C6FEF51020000780021923E@prv1-mh.provo.novell.com>
 <20190222131950.hk6ghta4hkpx5vec@zion.uk.xensource.com>
 <158783E402000088A293CED3@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jjk+=Q5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gxAp1-00080g-Pf
 for xen-devel@lists.xenproject.org; Fri, 22 Feb 2019 13:24:59 +0000
In-Reply-To: <158783E402000088A293CED3@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Martin Pohlack <mpohlack@amazon.de>, Julien Grall <julien.grall@arm.com>, Joao Martins <joao.m.martins@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Mihai Dontu <mdontu@bitdefender.com>, Marek Marczykowski <marmarek@invisiblethingslab.com>, Anthony Liguori <aliguori@amazon.com>, xen-devel <xen-devel@lists.xenproject.org>, uwed@amazon.de, Lars Kurth <lars.kurth@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ross Philipson <ross.philipson@oracle.com>, Dario Faggioli <dfaggioli@suse.com>, Matt Wilson <msw@amazon.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Daniel Kiper <daniel.kiper@oracle.com>, David Woodhouse <dwmw@amazon.co.uk>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIyLjAyLjE5IGF0IDE0OjE5LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
SSBoYXZlIG9ubHkgcmVhbGlzZWQgdGhpcyB0b2RheTogZXNzZW50aWFsbHkgd2Ugd2lsbCBlbmQg
dXAgaW1wbGVtZW50aW5nCj4geG1hbGxvYyB3aXRoIHZtYWxsb2MsIHdoaWNoIGF0IHRoZSBtb21l
bnQgZGVwZW5kcyBvbiB4bWFsbG9jIHRvIGFsbG9jYXRlCj4gdGhlIGFycmF5IG9mIG1mbnMuCgpX
aGljaCAocG90ZW50aWFsIGxvY2tpbmcgaXNzdWVzIGFzaWRlKSBpcyBub3QgYSBwcm9ibGVtLCBh
cyB0aGUgc2l6ZSBvZgp0aGUgTUZOIGFycmF5IHdpbGwgcmVkdWNlIGxvZ2FyaXRobWljYWxseSwg
dW50aWwgaXQgZXZlbnR1YWxseSBpcyBubyBsYXJnZXIKdGhhbiBhIHBhZ2UgYW55bW9yZS4KCkph
bgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
