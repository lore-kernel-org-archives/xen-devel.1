From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v5 01/16] x86/mm: skip incrementing mfn if
 it is not a valid mfn
Date: Thu, 15 Mar 2018 15:05:04 +0000
Message-ID: <8f622811-fd96-3f86-8cce-21d9f5dce797@arm.com>
References: <20180314182009.14274-1-julien.grall@arm.com>
 <20180314182009.14274-2-julien.grall@arm.com>
 <5AAA338902000078001B1EA9@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5AAA338902000078001B1EA9@prv-mh.provo.novell.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxNS8wMy8xOCAwNzo0OSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTQuMDMuMTgg
YXQgMTk6MTksIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+IEZyb206IFdlaSBMaXUg
PHdlaS5saXUyQGNpdHJpeC5jb20+Cj4+Cj4+IFRoZSBmdW5jdGlvbiBpcyBjYWxsZWQgdG8gZmls
bCBpbiBwYWdlIHRhYmxlIGVudHJpZXMgaW4KPj4gcG9wdWxhdGVfcHRfcmFuZ2UuIFNraXAgaW5j
cmVtZW50aW5nIG1mbiBpZiBpdCBpcyBpbnZhbGlkLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBXZWkg
TGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+IAo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+Cj4gCj4gKFlvdSBzaG91bGQgaGF2ZSBDYy1lZCBBbmRyZXcgYW5k
IG1lLikKCkkgZm9yZ290IHRvIHVwZGF0ZSB0aGUgQ0NzIGZvciB0aGlzIG5ldyBwYXRjaC4gU29y
cnkgZm9yIHRoYXQuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
