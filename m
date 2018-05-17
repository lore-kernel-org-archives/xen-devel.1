From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.11] x86/cacheattr: fix
 mtrr_pat_not_equal
Date: Thu, 17 May 2018 11:55:47 +0200
Message-ID: <229de4a4-c8f0-34f0-e843-a5be1c08eb2b@suse.com>
References: <20180517094809.80469-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ents=ie=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fJFdY-0003ai-J0
 for xen-devel@lists.xenproject.org; Thu, 17 May 2018 09:55:52 +0000
In-Reply-To: <20180517094809.80469-1-roger.pau@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTcvMDUvMTggMTE6NDgsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiBUaGUgZnVuY3Rpb24g
aXMgc3VwcG9zZWQgdG8gcmV0dXJuIHdoZXRoZXIgdGhlIE1UUlIgYW5kIFBBVCBzdGF0ZSBvZgo+
IHR3byBDUFVzIG1hdGNoLiBDdXJyZW50bHkgdGhpcyBpcyBub3QgcHJvcGVybHkgZG9uZSBiZWNh
dXNlIHRoZSB0ZXN0Cj4gZm9yIHRoZSBkZWZ0eXBlIGFuZCB0aGUgZW5hYmxlIGJpdHMgcmVxdWly
ZWQgYm90aCB0aGUgZGVmdHlwZSBhbmQgdGhlCj4gZW5hYmxlIGJpdHMgdG8gYmUgZGlmZmVyZW50
LCB3aGlsZSBqdXN0IG9uZSBvZiB0aG9zZSBmaWVsZHMgYmVpbmcKPiBkaWZmZXJlbnQgY2FuIGFs
cmVhZHkgY2F1c2UgdGhlIE1UUlIgc3RhdGVzIG9uIHRoZSB2Q1BVIHRvIG5vdCBtYXRjaC4KPiAK
PiBGaXggdGhpcyBieSBjaGFuZ2luZyB0aGUgQU5EIGludG8gYW4gT1IgaW5zdGVhZCwgc28gdGhh
dCBlaXRoZXIgdGhlCj4gZGVmdHlwZSBvciB0aGUgZW5hYmxlZCBiaXRzIGJlaW5nIGRpZmZlcmVu
dCB3aWxsIGNhdXNlIHRoZSBmdW5jdGlvbiB0bwo+IHJldHVybiBtaXNtYXRjaGluZyBzdGF0ZS4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNv
bT4KClJlbGVhc2UtYWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCgpK
dWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
