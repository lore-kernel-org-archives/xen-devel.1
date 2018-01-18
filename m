From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 3/5] x86/pv: Break
 handle_ldt_mapping_fault() out of handle_gdt_ldt_mapping_fault()
Date: Thu, 18 Jan 2018 00:48:10 -0700
Message-ID: <5A605F4A020000780019FB48@prv-mh.provo.novell.com>
References: <1515782244-6412-1-git-send-email-andrew.cooper3@citrix.com>
 <1515782244-6412-4-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1515782244-6412-4-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEyLjAxLjE4IGF0IDE5OjM3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gQWRqdXN0IGhhbmRsZV9sZHRfbWFwcGluZ19mYXVsdCgpIGV4Y2x1ZGUgdGhlIHVzZSBv
ZiB0aGlzIGZpeHVwIHBhdGggZm9yCj4gbm9uLVBWIGd1ZXN0cy4gIFdlbGwtZm9ybWVkIGNvZGUg
c2hvdWxkbid0IHJlZmVyZW5jZSB0aGUgTERUIHdoaWxlIGluIEhWTSB2Y3B1Cj4gY29udGV4dCwg
YnV0IGN1cnJlbnRseSBvbiBhIGNvbnRleHQgc3dpdGNoIGZyb20gUFYgdG8gSFZNIGNvbnRleHQs
IHRoZXJlIG1heQo+IGJlIGEgc3RhbGUgTERUIHNlbGVjdG9yIGxvYWRlZCwgb3ZlciBhbiB1bm1h
cHBlZCByZWdpb24uCj4gCj4gQnkgZXhwbGljaXRseSBleGNsdWRpbmcgSFZNIGNvbnRleHQgYXQg
dGhpcyBwb2ludCwgd2UgYXZvaWQgZXJyb25lb3VzCj4gaHlwZXJ2aXNvciBleGVjdXRpb24gcmVz
dWx0aW5nIGluIGEgY2FzY2FkZSBmYWlsdXJlLCBieSBmYWxsaW5nIGludG8KPiBwdl9tYXBfbGR0
X3NoYWRvd19wYWdlKCkuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
