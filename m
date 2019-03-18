From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/spec_ctrl: Extend repoline safey
 calcuations for eIBRS and Atom parts
Date: Mon, 18 Mar 2019 07:24:40 -0600
Message-ID: <5C8F9C18020000780021FE06@prv1-mh.provo.novell.com>
References: <1552908469-31776-1-git-send-email-andrew.cooper3@citrix.com>
 <5C8F87F2020000780021FD44@prv1-mh.provo.novell.com>
 <bc948846-35b4-0024-509b-430e1ec860f0@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <bc948846-35b4-0024-509b-430e1ec860f0@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE4LjAzLjE5IGF0IDE0OjA0LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTgvMDMvMjAxOSAxMTo1OCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDE4
LjAzLjE5IGF0IDEyOjI3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+PiBI
b3dldmVyLCBhbiBhZGRpdGlvbmFsIG1lYW5pbmcgb2YgRW5oYW5jZWQgSVJCUyBpcyB0aGF0IHRo
ZSBwcm9jZXNzb3IgbWF5IG5vdAo+Pj4gYmUgcmV0cG9saW5lLXNhZmUuICBUaGUgR2VtaW5pIExh
a2UgcGxhdGZvcm0sIGJhc2VkIG9uIHRoZSBHb2xkbW9udCsKPj4+IG1pY3JvYXJjaGl0ZWN0dXJl
IGlzIHRoZSBmaXJzdCBBdG9tIHByb2Nlc3NvciB0byBzdXBwb3J0IGVJQlJTLCBldmVuIHRob3Vn
aCBpdAo+Pj4gaXMgaW4gcHJhY3RpY2Ugc2FmZS4KPj4gQnV0IGFmYWljdCB5b3UgZG9uJ3QgbWFy
ayB0aGVtIGFzIHNhZmUuCj4gCj4gQ29ycmVjdC4gIFRoYXQgaXMgZGVsaWJlcmF0ZS4KPiAKPj4g
QnV0IHRoZW4gYWdhaW4gSSBkb24ndCByZWNhbGw6Cj4+IFBlcmZvcm1hbmNlLXdpc2UsIGlzIHJl
dHBvbGluZSBjb25zaWRlcmVkIGJldHRlciBvciB3b3JzZSB0aGFuIElCUlM/Cj4+IERlcGVuZGlu
ZyBvbiB0aGF0IC4uLgo+IAo+IFJldHBvbGluZSBpcyBtb3JlIHBlcmZvcm1hbnQgdGhhbiBJUkJT
IGFzIGltcGxlbWVudGVkIGluIG1pY3JvY29kZSwgYnV0Cj4gdGhhdCBpcyBub3Qgd2hhdCB3ZSBh
cmUgY29tcGFyaW5nIHRvIGhlcmUuCj4gCj4gR29sZG1vbnQrIGlzIHRoZSBmaXJzdCBwcm9jZXNz
b3Igd2l0aCBoYXJkd2FyZSBmaXhlcyBmb3IgU3BlY3RyZSB2Mgo+IGlzc3Vlcy4gIFRoaXMgbWVh
bnMgdGhhdCBJQlJTIGlzbid0IGltcGxlbWVudGVkIGJlaGluZCB0aGUgc2NlbmVzIHdpdGgKPiAi
dHVybiBvZmYgdGhlIEJUQiIgb3IgImZsdXNoIHZpYSBjb252b2x1dGVkIG1lYW5zIi4gIFRoZXJl
IGlzIGEgcHJvcGVyCj4gTygxKSBmbHVzaCBvZiB0aGUgQlRCIGZvciBJQlBCLCBhbmQgdGhlIEJU
QiBub3cgdHJhY2tzIHRoZSBwcml2aWxlZ2UgYXQKPiB3aGljaCBhIHByZWRpY3Rpb24gd2FzIGxl
YXJudC4KPiAKPiBDYXNjYWRlIExha2Ugd2lsbCAoQUZBSUEpIGJlIHRoZSBmaXJzdCBCaWctQ29y
ZSBwcm9jZXNzb3Igd2l0aCBlSUJSUy4KCkluIHdoaWNoIGNhc2UKQWNrZWQtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
