From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 02/11] x86/vmx: Don't clobber %dr6 while
 debugging state is lazy
Date: Wed, 06 Jun 2018 07:50:38 -0600
Message-ID: <5B17E6AE02000078001C8C0E@prv1-mh.provo.novell.com>
References: <1528120755-17455-1-git-send-email-andrew.cooper3@citrix.com>
 <1528120755-17455-3-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1528120755-17455-3-git-send-email-andrew.cooper3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjA2LjE4IGF0IDE1OjU5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMKPiArKysgYi94ZW4vYXJjaC94
ODYvaHZtL3ZteC92bXguYwo+IEBAIC0zNjk2LDYgKzM2OTYsNyBAQCB2b2lkIHZteF92bWV4aXRf
aGFuZGxlcihzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykKPiAgICAgICAgICAgICAgICovCj4g
ICAgICAgICAgICAgIF9fdm1yZWFkKEVYSVRfUVVBTElGSUNBVElPTiwgJmV4aXRfcXVhbGlmaWNh
dGlvbik7Cj4gICAgICAgICAgICAgIEhWTVRSQUNFXzFEKFRSQVBfREVCVUcsIGV4aXRfcXVhbGlm
aWNhdGlvbik7Cj4gKyAgICAgICAgICAgIF9fcmVzdG9yZV9kZWJ1Z19yZWdpc3RlcnModik7Cj4g
ICAgICAgICAgICAgIHdyaXRlX2RlYnVncmVnKDYsIGV4aXRfcXVhbGlmaWNhdGlvbiB8IERSX1NU
QVRVU19SRVNFUlZFRF9PTkUpOwoKVGhlIGNoYW5nZSBpcyBjZXJ0YWlubHkgY29ycmVjdCBhcyBp
cywgYnV0IEknZCBzdGlsbCBsaWtlIHRvIHB1dCBvdXQgZm9yCmRpc2N1c3Npb24gdGhlIGFsdGVy
bmF0aXZlIG9wdGlvbjoKCiAgICBpZiAoIHYtPmFyY2guaHZtX3ZjcHUuZmxhZ19kcl9kaXJ0eSAp
CiAgICAgICAgd3JpdGVfZGVidWdyZWcoNiwgZXhpdF9xdWFsaWZpY2F0aW9uIHwgRFJfU1RBVFVT
X1JFU0VSVkVEX09ORSk7CiAgICBlbHNlCiAgICAgICAgdi0+YXJjaC5kZWJ1Z3JlZ1s2XSA9IGV4
aXRfcXVhbGlmaWNhdGlvbiB8IERSX1NUQVRVU19SRVNFUlZFRF9PTkU7CgpBZnRlciBhbGwgdGhl
IGd1ZXN0IG1heSBrbm93IGl0J3Mgc2luZ2xlIHN0ZXBwaW5nLCBhbmQgbWF5IG5vdCBjYXJlIHRv
CnJlYWQgRFI2IGF0IGFsbC4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
