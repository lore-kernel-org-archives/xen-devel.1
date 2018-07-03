From: "Kang, Luwei" <luwei.kang@intel.com>
Subject: Re: [PATCH v2 04/10] x86: Add Intel Processor Trace
 MSRs and bit definitions
Date: Tue, 3 Jul 2018 10:18:47 +0000
Message-ID: <82D7661F83C1A047AF7DC287873BF1E1680481C8@SHSMSX101.ccr.corp.intel.com>
References: <1527686884-5917-1-git-send-email-luwei.kang@intel.com>
 <1527686884-5917-5-git-send-email-luwei.kang@intel.com>
 <5B34F45802000078001CEEB7@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B34F45802000078001CEEB7@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Tim Deegan <tim@xen.org>, "Tian, Kevin" <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>, Julien Grall <julien.grall@arm.com>, "Nakajima, Jun" <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

PiA+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvbXNyLWluZGV4LmgKPiA+ICsrKyBiL3hlbi9p
bmNsdWRlL2FzbS14ODYvbXNyLWluZGV4LmgKPiA+IEBAIC01NDgsNCArNTQ4LDQxIEBACj4gPiAg
I2RlZmluZSBNU1JfUEtHQzlfSVJUTAkJCTB4MDAwMDA2MzQKPiA+ICAjZGVmaW5lIE1TUl9QS0dD
MTBfSVJUTAkJCTB4MDAwMDA2MzUKPiA+Cj4gPiArLyogSW50ZWwgUFQgTVNScyAqLwo+ID4gKyNk
ZWZpbmUgTVNSX0lBMzJfUlRJVF9DVEwJCTB4MDAwMDA1NzAKPiA+ICsjZGVmaW5lIFJUSVRfQ1RM
X1RSQUNFRU4JCSgxVUxMIDw8IDApCj4gPiArI2RlZmluZSBSVElUX0NUTF9DWUNFTgkJCSgxVUxM
IDw8IDEpCj4gPiArI2RlZmluZSBSVElUX0NUTF9PUwkJCSgxVUxMIDw8IDIpCj4gPiArI2RlZmlu
ZSBSVElUX0NUTF9VU1IJCQkoMVVMTCA8PCAzKQo+ID4gKyNkZWZpbmUgUlRJVF9DVExfUFdSX0VW
VF9FTgkJKDFVTEwgPDwgNCkKPiA+ICsjZGVmaW5lIFJUSVRfQ1RMX0ZVUF9PTl9QVFcJCSgxVUxM
IDw8IDUpCj4gPiArI2RlZmluZSBSVElUX0NUTF9GQUJSSUNfRU4JCSgxVUxMIDw8IDYpCj4gPiAr
I2RlZmluZSBSVElUX0NUTF9DUjNfRklMVEVSCQkoMVVMTCA8PCA3KQo+ID4gKyNkZWZpbmUgUlRJ
VF9DVExfVE9QQQkJCSgxVUxMIDw8IDgpCj4gPiArI2RlZmluZSBSVElUX0NUTF9NVENfRU4JCQko
MVVMTCA8PCA5KQo+ID4gKyNkZWZpbmUgUlRJVF9DVExfVFNDX0VOCQkJKDFVTEwgPDwgMTApCj4g
PiArI2RlZmluZSBSVElUX0NUTF9ESVNfUkVUQwkJKDFVTEwgPDwgMTEpCj4gPiArI2RlZmluZSBS
VElUX0NUTF9QVFdfRU4JCQkoMVVMTCA8PCAxMikKPiA+ICsjZGVmaW5lIFJUSVRfQ1RMX0JSQU5D
SF9FTgkJKDFVTEwgPDwgMTMpCj4gPiArI2RlZmluZSBSVElUX0NUTF9NVENfRlJFUV9PRkZTRVQJ
MTQKPiA+ICsjZGVmaW5lIFJUSVRfQ1RMX01UQ19GUkVRCQkoMHgwZlVMTCA8PCBSVElUX0NUTF9N
VENfRlJFUV9PRkZTRVQpCj4gCj4gTm8gZHVwbGljYXRlcyBsaWtlIHRoZXNlIHBsZWFzZSAtIHdp
dGggTUFTS19FWFRSKCkgLyBNQVNLX0lOU1IoKSBoYXZpbmcganVzdCB0aGUgbWFzayAoYW5kIG5v
IG9mZnNldC9zaGlmdCB2YWx1ZSkgaXMgc3VmZmljaWVudC4KCk9LLCBnZXQgaXQuIEkganVzdCBu
ZWVkIHRvIGRlZmluZQorI2RlZmluZSBSVElUX0NUTF9NVENfRlJFUQkJKDB4MGZVTEwgPDwgUlRJ
VF9DVExfTVRDX0ZSRVFfT0ZGU0VUKQpJZiBJIHdhbnQgdG8gZ2V0IHRoZSB2YWx1ZSBvZiB0aGlz
IGZpbGVkIChiaXQxNzoxNCkganVzdCBjYWxsICJNQVNLX0VYVFIodiwgUlRJVF9DVExfTVRDX0ZS
RVEpIiAKCj4gCj4gPiArI2RlZmluZSBSVElUX0NUTF9BRERSKG4pCQkoMHgwZlVMTCA8PCBSVElU
X0NUTF9BRERSX09GRlNFVChuKSkKPiA+ICsjZGVmaW5lIE1TUl9JQTMyX1JUSVRfU1RBVFVTCQkw
eDAwMDAwNTcxCj4gCj4gUGxlYXNlIGFkZCBibGFuayBsaW5lcyBiZXR3ZWVuIG9uZSBNU1IgKGFu
ZCBpdHMgYml0cykgYW5kIHRoZSBuZXh0IG9uZS4KCldpbGwgZml4IGl0LgoKVGhhbmtzLApMdXdl
aSBLYW5nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
