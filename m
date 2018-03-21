From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v4 1/8] x86: NOP out XPTI entry/exit code
 when it's not in use
Date: Wed, 21 Mar 2018 08:51:28 +0100
Message-ID: <2daf916d-2229-67ff-c879-ad5a66dbddaa@suse.com>
References: <5AAFC9E202000078001B36F7@prv-mh.provo.novell.com>
 <5AAFCB4202000078001B3707@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=n5/p=gl=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1eyYWy-00061k-2z
 for xen-devel@lists.xenproject.org; Wed, 21 Mar 2018 07:51:32 +0000
In-Reply-To: <5AAFCB4202000078001B3707@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMDMvMTggMTQ6MzcsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEludHJvZHVjZSBhIHN5bnRo
ZXRpYyBmZWF0dXJlIGZsYWcgdG8gdXNlIGFsdGVybmF0aXZlIGluc3RydWN0aW9uCj4gcGF0Y2hp
bmcgdG8gTk9QIG91dCBhbGwgY29kZSBvbiBlbnRyeS9leGl0IHBhdGhzLiBIYXZpbmcgTk9QcyBo
ZXJlIGlzCj4gZ2VuZXJhbGx5IGJldHRlciB0aGFuIHVzaW5nIGNvbmRpdGlvbmFsIGJyYW5jaGVz
Lgo+IAo+IEFsc28gY2hhbmdlIHRoZSBsaW1pdCBvbiB0aGUgbnVtYmVyIG9mIGJ5dGVzIHdlIGNh
biBwYXRjaCBpbiBvbmUgZ28gdG8KPiB0aGF0IHJlc3VsdGluZyBmcm9tIHRoZSBlbmNvZGluZyBp
biBzdHJ1Y3QgYWx0X2luc3RyIC0gdGhlcmUncyBubyBwb2ludAo+IHJlZHVjaW5nIGl0IGJlbG93
IHRoYXQgbGltaXQsIGFuZCB3aXRob3V0IGEgY2hlY2sgYmVpbmcgaW4gcGxhY2UgdGhhdAo+IHRo
ZSBsaW1pdCBpc24ndCBhY3R1YWxseSBleGNlZWRlZCwgc3VjaCBhbiBhcnRpZmljaWFsIGJvdW5k
YXJ5IGlzIGEKPiBsYXRlbnQgcmlzay4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+CgpUZXN0ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNl
LmNvbT4KUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCgpKdWVy
Z2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
