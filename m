From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH 3/3] tools/libxc: retry hypercall in case of
 EFAULT
Date: Fri, 15 Jun 2018 17:28:14 +0100
Message-ID: <23331.59678.482034.488281@mariner.uk.xensource.com>
References: <20180615132641.5461-1-jgross@suse.com>
 <20180615132641.5461-4-jgross@suse.com>
 <ca5cfa19-fb80-cc6f-77c0-45fb8a0bf5f7@citrix.com>
 <32b9faa9-c788-8c88-7de4-6e6bc79ac844@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=cupv=jb=citrix.com=prvs=6970733d4=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fTraO-00066r-Jd
 for xen-devel@lists.xenproject.org; Fri, 15 Jun 2018 16:28:28 +0000
In-Reply-To: <32b9faa9-c788-8c88-7de4-6e6bc79ac844@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, wei.liu2@citrix.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SnVlcmdlbiBHcm9zcyB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gW1BBVENIIDMvM10gdG9vbHMv
bGlieGM6IHJldHJ5IGh5cGVyY2FsbCBpbiBjYXNlIG9mIEVGQVVMVCIpOgo+IE9uIDE1LzA2LzE4
IDE2OjU0LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+ID4gUHJvYmFibHkgYSB2ZXJ5IG1pbm9yIGlz
c3VlLCBidXQgaXMgaXQgd29ydGggY2FjaGluZyBuZXZlcl9mYXVsdCBvbmNlCj4gPiB3aGVuIG9w
ZW5pbmcgdGhlIHhjX2ludGVyZmFjZT/CoCBDYWxsaW5nIGludG8gYSBzZXBhcmF0ZSBzaGFyZWQg
b2JqZWN0IG9uCj4gPiBldmVyeSBkb21jdGwgaXNuJ3QgdGhlIGhlaWdodCBvZiBlZmZpY2llbmN5
Lgo+IAo+IFZpYSBhIGdsb2JhbCB2YXJpYWJsZSBvciBieSBleHRlbmRpbmcgc3RydWN0IHhjX2lu
dGVyZmFjZV9jb3JlPyBJYW4/CgpJIHRoaW5rIHRoaXMgaXMgYSB2ZXJ5IG1pbm9yIHBvaW50LiAg
QXJlIGRvbWN0bHMgcmVhbGx5IGEgaG90IHBhdGggPwpBIGNyb3NzLXNoYXJlZC1saWJyYXJ5IGNh
bGwgaXMgYSB2ZXJ5IG1pbm9yIG92ZXJoZWFkLgoKSWYgdGhpcyBpcyB0byBiZSBkb25lLCBpdCBz
aG91bGQgbm90IGJlIGEgZ2xvYmFsIHZhcmlhYmxlLgoKSWFuLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
