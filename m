From: "Jan Beulich" <JBeulich@suse.com>
Subject: Ping: [PATCH] p2m: move p2m-common.h inclusion point
Date: Tue, 06 Nov 2018 09:43:25 -0700
Message-ID: <5BE1C4AD02000078001F8C4A@prv1-mh.provo.novell.com>
References: <5BB7397802000078001EEBA2@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=hxzx=nr=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gK4Rw-00065X-3y
 for xen-devel@lists.xenproject.org; Tue, 06 Nov 2018 16:43:32 +0000
In-Reply-To: <5BB7397802000078001EEBA2@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjEwLjE4IGF0IDEyOjE0LCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+IFRo
ZSBoZWFkZXIgaXMgKGhlbmNlIGl0cyBuYW1lKSBzdXBwb3NlZCB0byBiZSBhIGhlbHBlciBmb3Ig
dGhlIHBlci1hcmNoCj4gcDJtLmggZmlsZXMuIEl0IHdhcyBuZXZlciBzdXBwb3NlZCB0byBiZSBp
bmNsdWRlZCBkaXJlY3RseSwgYW5kIGZvciB0aGUKPiBwdXJwb3NlIG9mIHB1dHRpbmcgY29tbW9u
IGZ1bmN0aW9uIGRlY2xhcmF0aW9ucyBpbnRvIHRoZSBjb21tb24gaGVhZGVyCj4gaXQgaXMgbW9y
ZSBoZWxwZnVsIGlmIHRoaW5ncyBsaWtlIHAybV90IGFyZSBhbHJlYWR5IGF2YWlsYWJsZSBhdCB0
aGUKPiBpbmNsdXNpb24gcG9pbnQuCj4gCj4gVGFrZSB0aGUgb3Bwb3J0dW5pdHkgYW5kIGFsc28g
ZGl0Y2ggYSBkdXBsaWNhdGUgcHVibGljL21lbW9yeS5oIGZyb20gdGhlCj4gQVJNIGhlYWRlci4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpDYW4g
SSBnZXQgYW4gYWNrIG9yIG90aGVyd2lzZSBmcm9tIG9uZSBvZiB5b3UgdHdvLCBwbGVhc2U/CgpU
aGFua3MsIEphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
