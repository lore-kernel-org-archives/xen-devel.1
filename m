From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/2] x86/mpparse: Don't print "limit
 reached" for every subsequent processor
Date: Mon, 20 May 2019 02:26:30 -0600
Message-ID: <5CE264B602000078002307B5@prv1-mh.provo.novell.com>
References: <1558119524-318-1-git-send-email-andrew.cooper3@citrix.com>
 <1558119524-318-2-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gSYI=TU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hSdd1-00061O-NC
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 08:26:39 +0000
In-Reply-To: <1558119524-318-2-git-send-email-andrew.cooper3@citrix.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE3LjA1LjE5IGF0IDIwOjU4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gV2hlbiB5b3UgYm9vdCBYZW4gd2l0aCB0aGUgZGVmYXVsdCAyNTYgTlJfQ1BVUywgb24g
YSBib3ggd2l0aCByYXRoZXIgbW9yZQo+IHByb2Nlc3NvcnMsIHRoZSByZXN1bHRpbmcgc3BldyBp
cyB1bm5lY2Vzc2VyaWx5IHZlcmJvc2UuICBJbnN0ZWFkLCBwcmludCB0aGUKPiBtZXNzYWdlIG9u
Y2UsIGUuZzoKPiAKPiAgKFhFTikgQUNQSTogWDJBUElDIChhcGljX2lkWzB4MTE1XSB1aWRbMHgx
MTVdIGVuYWJsZWQpCj4gIChYRU4pIFdBUk5JTkc6IE5SX0NQVVMgbGltaXQgb2YgMjU2IHJlYWNo
ZWQgLSBpZ25vcmluZyBmdXJ0aGVyIHByb2Nlc3NvcnMKPiAgKFhFTikgQUNQSTogWDJBUElDIChh
cGljX2lkWzB4MTE5XSB1aWRbMHgxMTldIGVuYWJsZWQpCj4gIChYRU4pIEFDUEk6IFgyQVBJQyAo
YXBpY19pZFsweDExZF0gdWlkWzB4MTFkXSBlbmFibGVkKQo+ICAoWEVOKSBBQ1BJOiBYMkFQSUMg
KGFwaWNfaWRbMHgxMjFdIHVpZFsweDEyMV0gZW5hYmxlZCkKPiAKPiBTaWduZWQtb2ZmLWJ5OiBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
