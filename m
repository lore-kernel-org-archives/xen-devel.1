From: Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH v3 2/4] x86: possibly bring up all CPUs even
 if not all are supposed to be used
Date: Thu, 19 Jul 2018 12:16:03 +0100
Message-ID: <4d714fe0-9ea2-efb4-cb35-c4e73b04a7ff@oracle.com>
References: <5B50673002000078001D5CD3@prv1-mh.provo.novell.com>
 <5B5068A602000078001D5CEC@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=khmn=kd=oracle.com=joao.m.martins@srs-us1.protection.inumbo.net>)
 id 1fg6uo-0002Eh-Nk
 for xen-devel@lists.xenproject.org; Thu, 19 Jul 2018 11:16:10 +0000
In-Reply-To: <5B5068A602000078001D5CEC@prv1-mh.provo.novell.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMTkvMjAxOCAxMTozMiBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gTm90ZTogT24gb25l
IG9mIG15IHRlc3Qgc3lzdGVtcyB0aGUgcGFya2VkIENQVXMgZ2V0IF9QU0QgZGF0YSByZXBvcnRl
ZAo+ICAgICAgIGJ5IERvbTAgdGhhdCBpcyBkaWZmZXJlbnQgZnJvbSB0aGUgbm9uLXBhcmtlZCBv
bmVzIChjb29yZF90eXBlIGlzCj4gICAgICAgMHhGQyBpbnN0ZWFkIG9mIDB4RkUpLiBHaXZpbmcg
RG9tMCBlbm91Z2ggdkNQVS1zIGVsaW1pbmF0ZXMgdGhpcwo+ICAgICAgIHByb2JsZW0sIHNvIHRo
ZXJlIGlzIGFwcGFyZW50bHkgc29tZXRoaW5nIGFtaXNzIGluIHRoZSBwcm9jZXNzb3IKPiAgICAg
ICBkcml2ZXIuIEkndmUgdHJpZWQgdG8gZmlndXJlIG91dCB3aGF0LCBidXQgSSBjb3VsZG4ndCwg
ZGVzcGl0ZSB0aGUKPiAgICAgICBBTUwgc3VnZ2VzdGluZyB0aGF0IHRoaXMgbWlnaHQgYmUgc29t
ZSBfT1NDIGludm9jYXRpb24gKGJ1dCBpZiBpdAo+ICAgICAgIGlzLCBJIGNhbid0IGZpbmQgaXQg
LSBhY3BpX3J1bl9vc2MoKSBjbGVhcmx5IGRvZXMgbm90IGFueXdoZXJlIGdldAo+ICAgICAgIGlu
dm9rZWQgaW4gYSBwZXItQ1BVIGZhc2hpb24pLgo+IAoKUmVnYXJkaW5nIHlvdXIgc2Vjb25kIG5v
dGUsIGNvdWxkIHRoZSBjb21taXQgYmVsb3cgKGluIHRoZSBsaW51eCBhY3BpIHByb2Nlc3Nvcgpk
cml2ZXIpIGhlbHAvZml4ZXMgaXQ/Cgo0ZDBmMWNlNjk1NTkgeGVuL2FjcGk6IHVwbG9hZCBfUFNE
IGluZm8gZm9yIG5vbiBEb20wIENQVXMgdG9vCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
