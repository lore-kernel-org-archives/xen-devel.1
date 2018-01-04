From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC v1 02/74] x86: Common cpuid faulting
 support
Date: Thu, 04 Jan 2018 07:19:49 -0700
Message-ID: <5A4E4615020000780019B163@prv-mh.provo.novell.com>
References: <20180104130625.28605-1-wei.liu2@citrix.com>
 <20180104130625.28605-3-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=q53i=d7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eX6NE-0007CJ-0H
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2018 14:20:00 +0000
In-Reply-To: <20180104130625.28605-3-wei.liu2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, wei.liu2@citrix.com
Cc: Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjAxLjE4IGF0IDE0OjA1LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
QEAgLTUxOCw3ICs1MjIsNyBAQCBzdGF0aWMgdm9pZCBlYXJseV9pbml0X2FtZChzdHJ1Y3QgY3B1
aW5mb194ODYgKmMpCj4gIAlpZiAoYyA9PSAmYm9vdF9jcHVfZGF0YSkKPiAgCQlhbWRfaW5pdF9s
ZXZlbGxpbmcoKTsKPiAgCj4gLQlhbWRfY3R4dF9zd2l0Y2hfbGV2ZWxsaW5nKE5VTEwpOwo+ICsJ
Y3R4dF9zd2l0Y2hfbGV2ZWxsaW5nKE5VTEwpOwo+ICB9CgpJIGRvbid0IHJlYWxseSB1bmRlcnN0
YW5kIHRoaXMgY2hhbmdlOiBXaHkgZG9uJ3QgeW91IGNhbGwKYW1kX2N0eHRfc3dpdGNoX21hc2tp
bmcoKSBpbnN0ZWFkPyBjdHh0X3N3aXRjaF9sZXZlbGxpbmcoTlVMTCkKZG9lc24ndCBkbyBhbnl0
aGluZyBlbHNlIChhc3N1bWluZyB0aGUgY2FsbCBoZXJlIGlzIHdyYXBwZWQgYnkgYQoiaWYgKCFj
cHVfaGFzX2NwdWlkX2ZhdWx0aW5nKSIpLiBTYW1lIGZvciB0aGUgSW50ZWwgdmFyaWFudCB0aGVu
LgoKPiArc3RhdGljIHZvaWQgc2V0X2NwdWlkX2ZhdWx0aW5nKGJvb2wgZW5hYmxlKQo+ICt7Cj4g
Kwl1aW50NjRfdCAqdGhpc19taXNjX2ZlYXR1cmVzID0gJnRoaXNfY3B1KG1zcl9taXNjX2ZlYXR1
cmVzKTsKPiArCXVpbnQ2NF90IHZhbCA9ICp0aGlzX21pc2NfZmVhdHVyZXM7Cj4gKwo+ICsJaWYg
KCEhKHZhbCAmIE1TUl9NSVNDX0ZFQVRVUkVTX0NQVUlEX0ZBVUxUSU5HKSA9PSBlbmFibGUpCj4g
KwkJcmV0dXJuOwo+ICsKPiArCXZhbCBePSBNU1JfTUlTQ19GRUFUVVJFU19DUFVJRF9GQVVMVElO
RzsKPiArCj4gKwl3cm1zcmwoTVNSX0lOVEVMX01JU0NfRkVBVFVSRVNfRU5BQkxFUywgdmFsKTsK
PiArCSp0aGlzX21pc2NfZmVhdHVyZXMgPSB2YWw7CgpJZiB5b3UgbWFpbnRhaW4gYSBjYWNoZSBm
b3IgdGhlIGZ1bGwgTVNSLCB0aGVuIEkgdGhpbmsgeW91J2QgYmV0dGVyCmNyZWF0ZSB3cmFwcGVy
cyB0byBkbyByZWFkcyBhbmQgd3JpdGVzLCBqdXN0IGxpa2Ugd2UgaGF2ZSBmb3IKRUZFUi4KCkph
bgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
