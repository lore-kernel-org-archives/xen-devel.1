From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH v2 0/6] x86emul: fixes, improvements,
 and beginnings of AVX512 support
Date: Wed, 29 Aug 2018 08:20:00 -0600
Message-ID: <5B86AB9002000078001E31E3@prv1-mh.provo.novell.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=lc6w=lm=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fv1KG-0006UF-Aa
 for xen-devel@lists.xenproject.org; Wed, 29 Aug 2018 14:20:04 +0000
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

MTogZml4IEZNQSBzY2FsYXIgb3BlcmFuZCBzaXplcwoyOiBleHRlbmQgTUFTS01PVntRLERRVX0g
dGVzdHMKMzogc3VwcG9ydCBBVlg1MTIgb3BtYXNrIGluc25zCjQ6IGNsZWFuIHVwIEFWWDIgaW5z
biB1c2UgaW4gdGVzdCBoYXJuZXNzCjU6IGNvcnJlY3QgRVZFWCBkZWNvZGluZwo2OiBnZW5lcmFs
aXplIHZlY3RvciBsZW5ndGggaGFuZGxpbmcgZm9yIEFWWDUxMi9FVkVYCgpXaGlsZSBJIGFsc28g
aGF2ZSByZWFkeSBhIHBhdGNoIGVtdWxhdGluZyB0aGUgYmFzaWMgQVZYNTEyIG1vdmVzLAppdHMg
cHJlcmVxIHRvIHdpZGVuIHJlc3BlY3RpdmUgZmllbGRzIGluIEhWTSBjb2RlIHRvIGFsbG93IGZv
ciA2NCBieXRlCm9wZXJhbmQgc2l6ZXMgaGFzIGEgZGVwZW5kZW5jeSBvbiB0aGUgIng4Ni9IVk06
IGltcGxlbWVudCBtZW1vcnkKcmVhZCBjYWNoaW5nIiBzZXJpZXMsIHdoaWNoIGxvb2tzIHRvIGJl
IHN0YWxsZWQsIGFuZCBJIHByZWZlciB0byBhdm9pZApwb3N0aW5nIGZ1cnRoZXIgcGF0Y2hlcyB3
aXRoIGRlcGVuZGVuY2llcyBvbiBzdGFsbGVkIHNlcmllcy4KClNvbWUgc3VwcG9ydCBiZXlvbmQg
bW92ZXMgaXMgYWxzbyBtb3N0bHkgcmVhZHksIGJ1dCBpdCdzIG5vdCBxdWl0ZQplbm91Z2ggeWV0
IHRvIGVuYWJsZSB0ZXN0aW5nIHRoYXQgY29kZSBpbiB0aGUgaGFybmVzcywgYW5kIEknZCByYXRo
ZXIKbm90IHBvc3QgY29kZSB0aGF0IEkgaGF2ZW4ndCBwdXNoZWQgdGhyb3VnaCB0aGUgaGFybmVz
cyB5ZXQuIFRoZQpwYXJ0aWFsIHRlc3RpbmcgSSd2ZSBiZWVuIGRvaW5nIG1lYW5zLCBob3dldmVy
LCB0aGF0IGluIHBhcnRpY3VsYXIgdGhlCmxhc3QgdHdvIHBhdGNoZXMgaGVyZSBoYXZlIGJlZW4g
dGVzdGVkIGFscmVhZHksIGV2ZW4gaWYgbm8gc3VjaAp0ZXN0aW5nIHdvdWxkIGJlIHBvc3NpYmxl
IGZvciBvdGhlcnMgdW50aWwgZnVydGhlciBwYXRjaGVzIGFjdHVhbGx5IGdldApwb3N0ZWQuCgpK
YW4KCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
