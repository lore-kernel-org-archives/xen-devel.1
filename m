From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: vpci: deferral of register write until p2m changes are
 done
Date: Wed, 28 Nov 2018 11:09:49 +0100
Message-ID: <20181128100949.us5zjhswmxx42635@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ir32=OH=citrix.com=prvs=8634c6f68=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gRwnM-00034s-PQ
 for xen-devel@lists.xenproject.org; Wed, 28 Nov 2018 10:10:12 +0000
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8sCgpXaGlsZSBkb2luZyB0aGUgcmVjZW50IHZQQ0kgZml4ZXMgYW5kIGFsc28gd29ya2lu
ZyBvbiBTUi1JT1Ygc3VwcG9ydApJJ3ZlIGJlZW4gdGhpbmtpbmcgYWJvdXQgaG93IHZQQ0kgaGFu
ZGxlcyB3cml0ZXMgdG8gUENJIHJlZ2lzdGVycyB0aGF0CmltcGx5IG1vZGlmaWNhdGlvbnMgdG8g
dGhlIHAybSBmb3IgUFZIIERvbTAuCgpXaGVuIG1lbW9yeSBkZWNvZGluZyBvciBST00gQkFScyBh
cmUgZW5hYmxlZCBYZW4gcGVyZm9ybXMgdGhlCmZvbGxvd2luZyBmbG93OgoKMS4gQ3JlYXRlIGEg
cmFuZ2VzZXQgd2l0aCB0aGUgbWVtb3J5IHJlZ2lvbnMgdGhhdCBuZWVkIHRvIGJlCm1hcHBlZC91
bm1hcHBlZC4KMi4gQmxvY2sgdGhlIHZDUFUgYW5kIHBlcmZvcm0gdGhlIHAybSBjaGFuZ2VzIGlu
IGEgcHJlZW1wdGl2ZSB3YXkuCjMuIEFmdGVyIHRoZSBwMm0gY2hhbmdlcyBoYXZlIGJlZW4gYXBw
bGllZCAob3IgaW4gY2FzZSBvZiBlcnJvcikgd3JpdGUKdG8gdGhlIHJlZ2lzdGVyIGluIG9yZGVy
IHRvIGVuYWJsZS9kaXNhYmxlIG1lbW9yeSBkZWNvZGluZyBvciB0aGUgUk9NCkJBUiBhbmQgbWFy
ayB0aGUgQkFScyBhcyBlbmFibGVkLgoKSSdtIHVuc3VyZSBhYm91dCB0aGUgYmVuZWZpdCBvZiBk
ZWZlcnJpbmcgdGhlIHJlZ2lzdGVyIHdyaXRlIChzdGVwIDMpCmZvciBhIFBWSCBEb20wLCBzbyBJ
IHdvdWxkIGxpa2UgdG8gcGVyZm9ybSB0aGUgcmVnaXN0ZXIgd3JpdGUgYmVmb3JlCmFwcGx5aW5n
IHRoZSBjaGFuZ2VzIHRvIHRoZSBwMm0uCgpUaGlzIHdvdWxkIHNpbXBsaWZ5IHRoZSBsb2dpYyBv
ZiB0aGUgZGVmZXJyZWQgcDJtIG9wZXJhdGlvbnMgYnkgbm90CmhhdmluZyB0byBzdG9yZSB0aGUg
cmVnaXN0ZXIgdmFsdWUsIGFuZCB3b3VsZCBhbHNvIHJlbW92ZSB0aGUgdWdseQpoYWNrIHRoYXQg
d2UgY3VycmVudGx5IGhhdmUgZm9yIFJPTSBCQVJzIHdoZXJlIHZQQ0kgZmFicmljYXRlcyBhIGR1
bW15CmNvbW1hbmQgcmVnaXN0ZXIganVzdCB0byBzaWduYWwgd2hldGhlciB0aGUgb3BlcmF0aW9u
IGlzIGEgbWFwIG9yCnVubWFwLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
