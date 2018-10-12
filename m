From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC] VMX: fix vmx_handle_eoi()
Date: Fri, 12 Oct 2018 04:41:40 -0600
Message-ID: <5BC07A6402000078001F0F91@prv1-mh.provo.novell.com>
References: <5BC06A4B02000078001F0EE0@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=tlq1=my=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gAut5-0004wo-Dj
 for xen-devel@lists.xenproject.org; Fri, 12 Oct 2018 10:41:43 +0000
In-Reply-To: <5BC06A4B02000078001F0EE0@prv1-mh.provo.novell.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEyLjEwLjE4IGF0IDExOjMyLCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+IElu
IGNvbW1pdCAzMDMwNjZmZGIxZSAoIlZNWDogZml4IGludGVyYWN0aW9uIG9mIEFQSUMtViBhbmQg
VmlyaWRpYW4KPiBlbXVsYXRpb24iKSBJIHNjcmV3ZWQgdXAgcXVpdGUgaGVhdmlseTogSW5zdGVh
ZCBvZiBjbGVhcmluZyBTVkksIFJWSSB3YXMKPiBjbGVhcmVkLgoKSSB3YXMgd3JvbmcgaGVyZToK
Cj4gQEAgLTIxMTEsMTQgKzIxMjAsMTMgQEAgc3RhdGljIGJvb2wgdm14X3Rlc3RfcGlyKGNvbnN0
IHN0cnVjdCB2Ywo+ICAgICAgcmV0dXJuIHBpX3Rlc3RfcGlyKHZlYywgJnYtPmFyY2guaHZtLnZt
eC5waV9kZXNjKTsKPiAgfQo+ICAKPiAtc3RhdGljIHZvaWQgdm14X2hhbmRsZV9lb2kodTggdmVj
dG9yKQo+ICtzdGF0aWMgdm9pZCB2bXhfaGFuZGxlX2VvaSh1aW50OF90IHZlY3RvciwgaW50IGlz
cikKPiAgewo+IC0gICAgdW5zaWduZWQgbG9uZyBzdGF0dXM7Cj4gKyAgICB1OCBvbGRfc3ZpID0g
c2V0X3N2aShpc3IpOwo+ICsgICAgc3RhdGljIGJvb2wgd2FybmVkOwo+ICAKPiAtICAgIC8qIFdl
IG5lZWQgdG8gY2xlYXIgdGhlIFNWSSBmaWVsZC4gKi8KPiAtICAgIF9fdm1yZWFkKEdVRVNUX0lO
VFJfU1RBVFVTLCAmc3RhdHVzKTsKPiAtICAgIHN0YXR1cyAmPSBWTVhfR1VFU1RfSU5UUl9TVEFU
VVNfU1VCRklFTERfQklUTUFTSzsKClRoaXMgaW5kZWVkIGtlcHQgUlZJLCBidXQgd3JvbmdseSBt
YXNrZWQgb2ZmIGJpdHMgMTYgYW5kIHVwLiBCdXQKdGhhdCdzIGJlbmlnbiBhcyBsb25nIGFzIHRo
b3NlIGJpdHMgZG9uI3QgaGF2ZSBhIG1lYW5pbmcgYW55d2F5LgoKVGhlIHNlY29uZCBhc3BlY3Qg
LSBpZ25vcmluZyBJU1IgYml0cyAtIHN0aWxsIGhvbGRzLCBzbyB0aGUgY2hhbmdlCml0c2VsZiBp
cyBzdGlsbCBuZWVkZWQgYWZhaWN0LiBKdXN0IHRoZSBmaXJzdCBwYXJhZ3JhcGggb2YgdGhlCmRl
c2NyaXB0aW9uIHdvdWxkIG5lZWQgdG8gY2hhbmdlLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
