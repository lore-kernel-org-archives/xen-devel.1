From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/3] x86/pv: Introduce and use
 x86emul_write_dr()
Date: Fri, 13 Apr 2018 05:55:25 -0600
Message-ID: <5AD09AAD02000078001BB0E0@prv1-mh.provo.novell.com>
References: <1523552156-20866-1-git-send-email-andrew.cooper3@citrix.com>
 <1523552156-20866-3-git-send-email-andrew.cooper3@citrix.com>
 <5AD06CAC02000078001BAFAA@prv1-mh.provo.novell.com>
 <3ce7dfa8-5682-27be-332a-de4458d34f48@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <3ce7dfa8-5682-27be-332a-de4458d34f48@citrix.com>
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjA0LjE4IGF0IDEzOjM3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTMvMDQvMTggMDk6MzksIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAxMi4w
NC4xOCBhdCAxODo1NSwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gQEAg
LTIwMjksNyArMjAzNSwxNyBAQCBsb25nIHNldF9kZWJ1Z3JlZyhzdHJ1Y3QgdmNwdSAqdiwgdW5z
aWduZWQgaW50IHJlZywgCj4gdW5zaWduZWQgbG9uZyB2YWx1ZSkKPj4+ICAgICAgICAgIGlmICgg
diA9PSBjdXJyICkKPj4+ICAgICAgICAgICAgICB3cml0ZV9kZWJ1Z3JlZygzLCB2YWx1ZSk7Cj4+
PiAgICAgICAgICBicmVhazsKPj4+ICsKPj4+ICsgICAgY2FzZSA0Ogo+Pj4gKyAgICAgICAgaWYg
KCB2LT5hcmNoLnB2X3ZjcHUuY3RybHJlZ1s0XSAmIFg4Nl9DUjRfREUgKQo+Pj4gKyAgICAgICAg
ICAgIHJldHVybiAtRU5PREVWOwo+Pj4gKwo+Pj4gKyAgICAgICAgLyogRmFsbHRocm91Z2ggKi8K
Pj4+ICAgICAgY2FzZSA2Ogo+Pj4gKyAgICAgICAgLyogVGhlIHVwcGVyIDMyIGJpdHMgYXJlIHN0
cmljdGx5IHJlc2VydmVkLiAqLwo+Pj4gKyAgICAgICAgaWYgKCB2YWx1ZSAhPSAodWludDMyX3Qp
dmFsdWUgKQo+Pj4gKyAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+Pj4gKwo+Pj4gICAgICAg
ICAgLyoKPj4+ICAgICAgICAgICAqIERSNjogQml0cyA0LTExLDE2LTMxIHJlc2VydmVkIChzZXQg
dG8gMSkuCj4+PiAgICAgICAgICAgKiAgICAgIEJpdCAxMiByZXNlcnZlZCAoc2V0IHRvIDApLgo+
PiBIb3cgYXJlIHRoZSB1cHBlciAzMiBiaXRzIGRpZmZlcmVudCBmcm9tIHRoZSBvdGhlciByZXNl
cnZlZCBiaXRzIChuYW1lZCBpbiB0aGUKPj4gY29tbWVudCB2aXNpYmxlIGhlcmUpPwo+IAo+IFRo
ZSB1cHBlciAzMiBiaXRzIGFyZSBNQlogYW5kIHdpbGwgcmFpc2UgI0dQIGlmIHNldC4gIFRoZSBs
b3dlciByZXNlcnZlZAo+IGJpdHMgYXJlIHdyaXRlLWlnbm9yZWQuCgpPaCwgaW5kZWVkLCBJIGRp
ZG4ndCByZWNhbGwgdGhhdC4KClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
