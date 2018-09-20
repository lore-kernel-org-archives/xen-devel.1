From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2] x86/HVM: correct hvmemul_map_linear_addr()
 for multi-page case
Date: Thu, 20 Sep 2018 13:41:26 +0100
Message-ID: <adf1e4f7-9845-d09c-026d-54cd7a7050cd@citrix.com>
References: <5B98D7CF02000078001E7AEA@prv1-mh.provo.novell.com>
 <5B9A381302000078001E81DC@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=y5lu=mc=citrix.com=prvs=794f34a96=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1g2yGw-00036H-1t
 for xen-devel@lists.xenproject.org; Thu, 20 Sep 2018 12:41:30 +0000
In-Reply-To: <5B9A381302000078001E81DC@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTMvMDkvMTggMTE6MTIsIEphbiBCZXVsaWNoIHdyb3RlOgo+IFRoZSBmdW5jdGlvbiBkb2Vz
IHR3byB0cmFuc2xhdGlvbnMgaW4gb25lIGdvIGZvciBhIHNpbmdsZSBndWVzdCBhY2Nlc3MuCj4g
QW55IGZhaWx1cmUgb2YgdGhlIGZpcnN0IHRyYW5zbGF0aW9uIHN0ZXAgKGd1ZXN0IGxpbmVhciAt
PiBndWVzdAo+IHBoeXNpY2FsKSwgcmVzdWx0aW5nIGluICNQRiwgb3VnaHQgdG8gdGFrZSBwcmVj
ZWRlbmNlIG92ZXIgYW55IGZhaWx1cmUKPiBvZiB0aGUgc2Vjb25kIHN0ZXAgKGd1ZXN0IHBoeXNp
Y2FsIC0+IGhvc3QgcGh5c2ljYWwpLgoKV2h5P8KgIFdoYXQgaXMgdGhlIGJhc2lzIG9mIHRoaXMg
cHJlc3VtcHRpb24/CgpBcyBmYXIgYXMgd2hhdCByZWFsIGhhcmR3YXJlIGRvZXMuLi4KClRoaXMg
dGVzdCBzZXRzIHVwIGEgYmFsbG9vbmVkIHBhZ2UgYW5kIGEgcmVhZC1vbmx5IHBhZ2UuwqAgSS5l
LiBhIHNlY29uZApzdGFnZSBmYXVsdCBvbiB0aGUgZmlyc3QgcGFydCBvZiBhIG1pc2FsaWduZWQg
YWNjZXNzLCBhbmQgYSBmaXJzdCBzdGFnZQpmYXVsdCBvbiB0aGUgc2Vjb25kIHBhcnQgb2YgdGhl
IGFjY2Vzcy4KCihkMSkgLS0tIFhlbiBUZXN0IEZyYW1ld29yayAtLS0KKGQxKSBFbnZpcm9ubWVu
dDogSFZNIDY0Yml0IChMb25nIG1vZGUgNCBsZXZlbHMpCihkMSkgVGVzdCBzcGxpdGZhdWx0Cihk
MSkgQWJvdXQgdG8gcmVhZAooWEVOKSAqKiogRVBUIHF1YWwgMDAwMDAwMDAwMDAwMDE4MSwgZ3Bh
IDAwMDAwMDAwMDAxMWNmZmMKKGQxKSBSZWFkaW5nIFBUUjogZ290IDAwMDAwMDAwZmZmZmZmZmYK
KGQxKSBBYm91dCB0byB3cml0ZQooWEVOKSAqKiogRVBUIHF1YWwgMDAwMDAwMDAwMDAwMDE4Miwg
Z3BhIDAwMDAwMDAwMDAxMWNmZmMKKGQxKSAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioK
KGQxKSBQQU5JQzogVW5oYW5kbGVkIGV4Y2VwdGlvbiBhdCAwMDA4OjAwMDAwMDAwMDAxMDQ3ZTAK
KGQxKSBWZWMgMTQgI1BGWy1kLXNXUF0gJWNyMiAwMDAwMDAwMDAwMTFkMDAwCihkMSkgKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqCgpUaGUgc2Vjb25kIHN0YWdlIGZhdWx0IGlzIHJlY29n
bmlzZWQgZmlyc3QsIHdoaWNoIGlzIGNvbnRyYXJ5IHRvIHlvdXIKcHJlc3VtcHRpb24sIGkuZS4g
dGhlIGNvZGUgaW4gaXRzIGN1cnJlbnQgZm9ybSBhcHBlYXJzIHRvIGJlIGNvcnJlY3QuCgp+QW5k
cmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
