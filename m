From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 3/4] dom0/pvh: change the order of the
 MMCFG initialization
Date: Fri, 10 Aug 2018 12:04:34 +0200
Message-ID: <20180810100434.4agjwww26p66rad3@mac>
References: <20180808100747.19464-1-roger.pau@citrix.com>
 <20180808100747.19464-4-roger.pau@citrix.com>
 <5B6AE3A302000078001DC0B1@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=0goo=kz=citrix.com=prvs=753db8765=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fo4Hq-0006T4-JY
 for xen-devel@lists.xenproject.org; Fri, 10 Aug 2018 10:04:50 +0000
Content-Disposition: inline
In-Reply-To: <5B6AE3A302000078001DC0B1@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBBdWcgMDgsIDIwMTggYXQgMDY6MzU6NDdBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA4LjA4LjE4IGF0IDEyOjA3LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gU28gaXQncyBkb25lIGJlZm9yZSB0aGUgaW9tbXUgaXMgaW5pdGlhbGl6ZWQuIFRo
aXMgaXMgcmVxdWlyZWQgaW4KPiA+IG9yZGVyIHRvIGJlIGFibGUgdG8gZmV0Y2ggdGhlIE1NQ0ZH
IHJlZ2lvbnMgZnJvbSB0aGUgZG9tYWluIHN0cnVjdC4KPiAKPiBJcyB0aGlzIGEgdXNlZnVsIGNo
YW5nZSB0byBtYWtlPyBSZWdpb25zIG5vdCByZXBvcnRlZCB0aHJvdWdoIHRoZSBNQ0ZHCj4gdGFi
bGUgd2lsbCBuZWVkIHB1bmNoaW5nIGhvbGVzIGFueXdheSwgc28gd2h5IG5vdCBwdW5jaCBob2xl
cyB1bmlmb3JtbHkKPiBpbiBhbGwgY2FzZXMsIGFsbG93aW5nIHRoZSBob2xlIHB1bmNoaW5nIGNv
ZGUgdG8gYmUgdGVzdGVkIGV2ZW4gb24gc3lzdGVtcwo+IHdpdGhvdXQgbm9uLWJvb3QtdGltZS1h
dmFpbGFibGUgcmVnaW9ucz8KCkkgY2FuIGFkZCB0aGlzIGhvbGUtcHVuY2hpbmcgY29kZSB0byBy
ZWdpc3Rlcl92cGNpX21tY2ZnX2hhbmRsZXIgc28gSQpjYW4gcmVtb3ZlIHRoaXMgcmVvcmRlcmlu
Zy4KCkknbSBob3dldmVyIHN0cnVnZ2xpbmcgdG8gZmluZCBhIGZ1bmN0aW9uIHRoYXQgd2lsbCBz
ZXQgYSBwMm0gcmFuZ2UgdG8KcDJtX2ludmFsaWQuIEFsbCB0aGUgZnVuY3Rpb25zIHRoYXQgSSBm
aW5kIHRvIGRlYWwgd2l0aCB0aGlzIGFzc3VtZQp0aGF0IHlvdSBrbm93IHRoZSBtZW1vcnkgdHlw
ZSB5b3UgYXJlIHRyeWluZyB0byByZW1vdmUgKGZvciBleGFtcGxlCmNsZWFyX2lkZW50aXR5X3Ay
bV9lbnRyeSkgYW5kIGZhaWwgaWYgdGhlIGN1cnJlbnQgdHlwZSBpcyBkaWZmZXJlbnQKdGhhbiBl
eHBlY3RlZC4KCkluIHRoaXMgY2FzZSBpdCdzIHF1aXRlIGxpa2VseSB0aGF0IHRoZSBNTUNGRyBy
ZWdpb24gaXMgbm90IG1hcHBlZCB0bwphbnl0aGluZywgc2hvdWxkIEkgaW50cm9kdWNlIGEgbmV3
IGhlbHBlciB0aGF0IHNldHMgYSBwMm0gcmFuZ2UgdG8KcDJtX2ludmFsaWQgcmVnYXJkbGVzcyBv
ZiB0aGUgY3VycmVudCB0eXBlPwoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
