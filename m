From: "Jan Beulich" <jbeulich@suse.com>
Subject: Re: [PATCH] x86/alt: Fix wrong usage of as_max in
 OLDINSTR_2
Date: Tue, 27 Mar 2018 23:52:56 -0600
Message-ID: <5ABB2DB8020000780012BABC@prv1-mh.provo.novell.com>
References: <dbcffebe-a10d-4c84-bcb5-44b82d5a9a8e@default>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <dbcffebe-a10d-4c84-bcb5-44b82d5a9a8e@default>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: zhenzhong.duan@oracle.com
Cc: wei.liu2@citrix.com, andrew.cooper3@citrix.com, srinivas.eeda@oracle.com, boris.ostrovsky@oracle.com, xen-devel@lists.xen.org, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

Pj4+IFpoZW56aG9uZyBEdWFuIDx6aGVuemhvbmcuZHVhbkBvcmFjbGUuY29tPiAwMy8yOC8xOCA0
OjAzIEFNID4+Pgo+V2hlbiBBTFRFUk5BVElWRV8yIGlzIHVzZWQsIHdlIHNlZSBiZWxvdyBlcnJv
ciBkdXJpbmcgYnVpbGQuCj4iZXJyb3I6IG1hY3JvICJhc19tYXgiIHJlcXVpcmVzIDIgYXJndW1l
bnRzLCBidXQgb25seSAxIGdpdmVuIgo+Cj5TaWduZWQtb2ZmLWJ5OiBaaGVuemhvbmcgRHVhbiA8
emhlbnpob25nLmR1YW5Ab3JhY2xlLmNvbT4KClNlZSAiW1BBVENIIHYyIDIvNl0geDg2OiBmaXgg
T0xESU5TVFJfMigpIiBzZW50IG9uIE1hciAxM3RoLgoKSmFuCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
