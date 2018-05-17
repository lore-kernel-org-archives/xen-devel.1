From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.11] x86/cacheattr: fix
 mtrr_pat_not_equal
Date: Thu, 17 May 2018 13:49:34 +0200
Message-ID: <0e3018de-5b61-9eaf-d3b9-42bd3e75f9d0@suse.com>
References: <20180517094809.80469-1-roger.pau@citrix.com>
 <5AFD5CF402000078001C38BD@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ents=ie=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fJHPe-0005Od-3m
 for xen-devel@lists.xenproject.org; Thu, 17 May 2018 11:49:38 +0000
In-Reply-To: <5AFD5CF402000078001C38BD@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTcvMDUvMTggMTI6NDQsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDE3LjA1LjE4IGF0
IDExOjQ4LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+PiBUaGUgZnVuY3Rpb24gaXMg
c3VwcG9zZWQgdG8gcmV0dXJuIHdoZXRoZXIgdGhlIE1UUlIgYW5kIFBBVCBzdGF0ZSBvZgo+PiB0
d28gQ1BVcyBtYXRjaC4gQ3VycmVudGx5IHRoaXMgaXMgbm90IHByb3Blcmx5IGRvbmUgYmVjYXVz
ZSB0aGUgdGVzdAo+PiBmb3IgdGhlIGRlZnR5cGUgYW5kIHRoZSBlbmFibGUgYml0cyByZXF1aXJl
ZCBib3RoIHRoZSBkZWZ0eXBlIGFuZCB0aGUKPj4gZW5hYmxlIGJpdHMgdG8gYmUgZGlmZmVyZW50
LCB3aGlsZSBqdXN0IG9uZSBvZiB0aG9zZSBmaWVsZHMgYmVpbmcKPj4gZGlmZmVyZW50IGNhbiBh
bHJlYWR5IGNhdXNlIHRoZSBNVFJSIHN0YXRlcyBvbiB0aGUgdkNQVSB0byBub3QgbWF0Y2guCj4+
Cj4+IEZpeCB0aGlzIGJ5IGNoYW5naW5nIHRoZSBBTkQgaW50byBhbiBPUiBpbnN0ZWFkLCBzbyB0
aGF0IGVpdGhlciB0aGUKPj4gZGVmdHlwZSBvciB0aGUgZW5hYmxlZCBiaXRzIGJlaW5nIGRpZmZl
cmVudCB3aWxsIGNhdXNlIHRoZSBmdW5jdGlvbiB0bwo+PiByZXR1cm4gbWlzbWF0Y2hpbmcgc3Rh
dGUuCj4gCj4gVGhpcyBpcyBieSBmYXIgbm90IGVub3VnaCwgYnV0IEkgZGlkbid0IHZpZXcgdGhl
IGZ1bmN0aW9uIGFzIGNyaXRpY2FsCj4gZW5vdWdoIHRvIHdhcnJhbnQgc2VuZGluZyBvdXQgdGhl
IHBhdGNoIEkgaGF2ZSByaWdodCBhd2F5Lgo+IAo+IEphbgo+IHg4Ni9IVk06IGNvcnJlY3QgbXRy
cl9wYXRfbm90X2VxdWFsKCkKPiAKPiBUaGUgdHdvIHZDUFUtcyBkaWZmZXJyaW5nIGluIE1UUlIt
ZW5hYmxlZCBzdGF0ZSBtZWFucyBNVFJSIHNldHRpbmdzIGFyZQo+IG5vdCBlcXVhbC4gQm90aCB2
Q1BVLXMgaGF2aW5nIE1UUlJzIGRpc2FibGVkIG1lYW5zIG9ubHkgUEFUIG5lZWRzIHRvIGJlCj4g
Y29tcGFyZWQuIEFsb25nIHRob3NlIGxpbmVzIGZvciBmaXhlZCByYW5nZSBNVFJScy4gRGlmZmVy
cmluZyB2YXJpYWJsZQo+IHJhbmdlIGNvdW50cyBsaWtld2lzZSBtZWFuIHNldHRpbmdzIGFyZSBk
aWZmZXJlbnQgb3ZlcmFsbC4KPiAKPiBDb25zdGlmeSB0eXBlcyBhbmQgY29udmVydCBib29sX3Qg
dG8gYm9vbC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+CgpNeSBSYWIgdGFnIGZvciBSb2dlcidzIHBhdGNoIGlzIGFwcGxpY2FibGUgaGVyZSwgdG9v
OgoKUmVsZWFzZS1hY2tlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1
ZXJnZW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
