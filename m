From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 10/10] vpci/sriov: add support for SR-IOV
 capability
Date: Tue, 03 Jul 2018 05:47:15 -0600
Message-ID: <5B3B624302000078001D03CA@prv1-mh.provo.novell.com>
References: <20180620144234.51783-1-roger.pau@citrix.com>
 <20180620144234.51783-11-roger.pau@citrix.com>
 <20180703092759.etip2qie5gsibruy@citrix.com>
 <20180703102108.36bkr3glktzmc4pp@mac.bytemobile.com>
 <5B3B547302000078001D030D@prv1-mh.provo.novell.com>
 <20180703105134.hcbnz7emljfwkcxq@mac.bytemobile.com>
 <5B3B566602000078001D0343@prv1-mh.provo.novell.com>
 <20180703110720.icsnmpwdkp2nopqv@mac.bytemobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=uib8=jt=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1faJmB-0006Ni-NM
 for xen-devel@lists.xenproject.org; Tue, 03 Jul 2018 11:47:19 +0000
In-Reply-To: <20180703110720.icsnmpwdkp2nopqv@mac.bytemobile.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAzLjA3LjE4IGF0IDEzOjA3LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFR1ZSwgSnVsIDAzLCAyMDE4IGF0IDA0OjU2OjM4QU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMDMuMDcuMTggYXQgMTI6NTEsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gSSBkb24ndCB0aGluayB3ZSBldmVyIHdhbnQgdG8gYWxsb3cgRG9tVS1zIHRv
IG1hbmFnZSB0aGUgU1ItSU9WCj4+ID4gY2FwYWJpbGl0eSwgc28gdGhpcyBjb2RlIGlzIGFsd2F5
cyBnb2luZyB0byBiZSBEb20wIG9ubHkgQUZBSUNULiBJbgo+PiA+IGZhY3QgSSB0aGluayBJJ20g
Z29pbmcgdG8gYWRkIGFuIGFzc2VydCB0byB0aGF0IGVmZmVjdCBpbiB0aGUgU1ItSU9WCj4+ID4g
aW5pdCBoYW5kbGVyLgo+PiAKPj4gRGlkIHlvdSBjb25zaWRlciBuZXN0ZWQgdmlydCBoZXJlPwo+
IAo+IEkgY2FuIHNlZSB0aGlzIG1ha2luZyBtb3JlIHNlbnNlIGZvciBuZXN0ZWQgdmlydCwgc3Rp
bGwgaXQncyBnb2luZyB0bwo+IHJlcXVpcmUgYSBub24tdHJpdmlhbCBhbW91bnQgb2Ygd29yayB0
byBtYWtlIFNSLUlPViBzYWZlIGZvciBEb21VcyB0bwo+IG1hbmFnZSwgbm90IHRvIG1lbnRpb24g
dGhhdCBEb21VcyB3b3VsZCB0aGVuIGJlIGFibGUgdG8gbWFrZSBwY2kKPiBkZXZpY2VzIChWRnMp
IGFwcGVhciBhbmQgZGlzYXBwZWFyLCBhbmQgbGlrZWx5IGNvbGxpZGUgd2l0aCBleGlzdGluZwo+
IGRldmljZXM/CgpSaWdodCwgYXZvaWRpbmcgc3VjaCBjb2xsaXNpb25zIHdvdWxkIGJlIG9uZSB0
aGluZyB0byBhZGRyZXNzLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
