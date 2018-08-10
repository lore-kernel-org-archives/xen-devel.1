From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 3/4] dom0/pvh: change the order of the
 MMCFG initialization
Date: Fri, 10 Aug 2018 05:41:32 -0600
Message-ID: <5B6D79EC02000078001DCEAF@prv1-mh.provo.novell.com>
References: <20180808100747.19464-1-roger.pau@citrix.com>
 <20180808100747.19464-4-roger.pau@citrix.com>
 <5B6AE3A302000078001DC0B1@prv1-mh.provo.novell.com>
 <20180810100434.4agjwww26p66rad3@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=aouf=kz=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fo5nT-00063x-9P
 for xen-devel@lists.xenproject.org; Fri, 10 Aug 2018 11:41:35 +0000
In-Reply-To: <20180810100434.4agjwww26p66rad3@mac>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEwLjA4LjE4IGF0IDEyOjA0LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFdlZCwgQXVnIDA4LCAyMDE4IGF0IDA2OjM1OjQ3QU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMDguMDguMTggYXQgMTI6MDcsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gU28gaXQncyBkb25lIGJlZm9yZSB0aGUgaW9tbXUgaXMgaW5pdGlhbGl6ZWQu
IFRoaXMgaXMgcmVxdWlyZWQgaW4KPj4gPiBvcmRlciB0byBiZSBhYmxlIHRvIGZldGNoIHRoZSBN
TUNGRyByZWdpb25zIGZyb20gdGhlIGRvbWFpbiBzdHJ1Y3QuCj4+IAo+PiBJcyB0aGlzIGEgdXNl
ZnVsIGNoYW5nZSB0byBtYWtlPyBSZWdpb25zIG5vdCByZXBvcnRlZCB0aHJvdWdoIHRoZSBNQ0ZH
Cj4+IHRhYmxlIHdpbGwgbmVlZCBwdW5jaGluZyBob2xlcyBhbnl3YXksIHNvIHdoeSBub3QgcHVu
Y2ggaG9sZXMgdW5pZm9ybWx5Cj4+IGluIGFsbCBjYXNlcywgYWxsb3dpbmcgdGhlIGhvbGUgcHVu
Y2hpbmcgY29kZSB0byBiZSB0ZXN0ZWQgZXZlbiBvbiBzeXN0ZW1zCj4+IHdpdGhvdXQgbm9uLWJv
b3QtdGltZS1hdmFpbGFibGUgcmVnaW9ucz8KPiAKPiBJIGNhbiBhZGQgdGhpcyBob2xlLXB1bmNo
aW5nIGNvZGUgdG8gcmVnaXN0ZXJfdnBjaV9tbWNmZ19oYW5kbGVyIHNvIEkKPiBjYW4gcmVtb3Zl
IHRoaXMgcmVvcmRlcmluZy4KPiAKPiBJJ20gaG93ZXZlciBzdHJ1Z2dsaW5nIHRvIGZpbmQgYSBm
dW5jdGlvbiB0aGF0IHdpbGwgc2V0IGEgcDJtIHJhbmdlIHRvCj4gcDJtX2ludmFsaWQuIEFsbCB0
aGUgZnVuY3Rpb25zIHRoYXQgSSBmaW5kIHRvIGRlYWwgd2l0aCB0aGlzIGFzc3VtZQo+IHRoYXQg
eW91IGtub3cgdGhlIG1lbW9yeSB0eXBlIHlvdSBhcmUgdHJ5aW5nIHRvIHJlbW92ZSAoZm9yIGV4
YW1wbGUKPiBjbGVhcl9pZGVudGl0eV9wMm1fZW50cnkpIGFuZCBmYWlsIGlmIHRoZSBjdXJyZW50
IHR5cGUgaXMgZGlmZmVyZW50Cj4gdGhhbiBleHBlY3RlZC4KPiAKPiBJbiB0aGlzIGNhc2UgaXQn
cyBxdWl0ZSBsaWtlbHkgdGhhdCB0aGUgTU1DRkcgcmVnaW9uIGlzIG5vdCBtYXBwZWQgdG8KPiBh
bnl0aGluZywgc2hvdWxkIEkgaW50cm9kdWNlIGEgbmV3IGhlbHBlciB0aGF0IHNldHMgYSBwMm0g
cmFuZ2UgdG8KPiBwMm1faW52YWxpZCByZWdhcmRsZXNzIG9mIHRoZSBjdXJyZW50IHR5cGU/CgpX
ZWxsLCBpZiB0aGVyZSBpcyBub25lIC0gd2h5IG5vdD8gQnV0IHJlYWxseSB0aGF0J3MgbW9yZSBs
aWtlIHNvbWV0aGluZyB0bwpnZXQgR2VvcmdlIHRvIGFncmVlIHRvLgoKSmFuCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
