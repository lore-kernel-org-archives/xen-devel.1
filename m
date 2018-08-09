From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] common/gnttab: Explicitly default to gnttab
 v1 during domain creation
Date: Thu, 09 Aug 2018 04:40:17 -0600
Message-ID: <5B6C1A1102000078001DC7DE@prv1-mh.provo.novell.com>
References: <1533810718-6010-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1533810718-6010-1-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA5LjA4LjE4IGF0IDEyOjMxLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gRm9yIHJlYXNvbnMgd2hpY2ggYXBwZWFyIHRvIGJlIGV4Y2x1c2l2ZWx5IGRvd24gdG8g
cG9vciByZXZpZXcgb2YgdGhlIGdyYW50Cj4gdGFibGUgdjIgY29kZSwgYSBncmFudCB0YWJsZSdz
IHZlcnNpb24gZmllbGQgd2FzIHdhc24ndCBpbml0aWFsaXNlZCBkdXJpbmcKPiBjcmVhdGlvbi4K
PiAKPiBBIG51bWJlciBvZiBwcm9ibGVtcyAoaW5jbHVkaW5nIFhTQXMpIGhhdmUgb2NjdXJyZWQg
aW4gdGhlIHBhc3QgdHJ5aW5nIHRyeWluZwo+IHRvIHVzZSBhIGdyYW50IHRhYmxlIHdoaWNoIGhh
c24ndCBiZWVuIHByb3Blcmx5IHNldCB1cCwgYW5kIHZhcmlvdXMgYXJlYXMgb2YKPiB0aGUgY29k
ZSBjb3BlIHdpdGggdjAgYnkgZGVmYXVsdGluZyB0byB2MS4KPiAKPiBJbiBwYXJ0aWN1bGFyLCB0
aGUgdG9vbHN0YWNrIHVzaW5nIEdOVFRBQk9QX3NldHVwX3RhYmxlIHRvIGJlIGFibGUgdG8gZmls
bCBpbgo+IHRoZSBzdG9yZS9jb25zb2xlIGdyYW50cyBoYXMgYSBzaWRlIGVmZmVjdCBvZiBzd2l0
Y2hpbmcgdG8gdjEuCj4gCj4gSW4gaGluZHNpZ2h0IGhvd2V2ZXIsIHRoaXMgImZpeHVwIGlmIHdl
IHNlZSAwIiBpcyBhIHZlcnkgcG9vciwgd2l0aCBhCj4gc3Vic3RhbnRpYWwgZGVncmVlIG9mIHJp
c2suICBFeHBsaWNpdGx5IGRlZmF1bHQgdG8gZ3JhbnQgdGFibGUgdjEgZHVyaW5nCj4gZG9tYWlu
IGNyZWF0ZSwgYW5kIGxldCB0aGUgcmVzdCBvZiB0aGUgY29kZSB3b3JrIHNhZmVseSBpbiB0aGUg
a25vd2xlZGdlIHRoYXQKPiB0aGUgdmVyc2lvbiBpcyBzZW5zaWJseSBzZXQuCj4gCj4gU2lnbmVk
LW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KClJldmll
d2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpPZiBjb3Vyc2Ugd2FudHMg
dG8gYmUgcmUtYmFzZWQgb3ZlciBQYXVsJ3MgcGF0Y2gsIG9yIGhpcyBvdmVyIHlvdXJzLApkZXBl
bmRpbmcgb24gd2hpY2ggb25lIGdvZXMgaW4gZWFybGllci4KCkphbgoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
