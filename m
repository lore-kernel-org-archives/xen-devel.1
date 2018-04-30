From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH v2 0/2] SVM: guest state handling adjustments
Date: Mon, 30 Apr 2018 04:17:07 -0600
Message-ID: <5AE6ED2302000078001BF867@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=xfxw=ht=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fD5rs-0003y2-O9
 for xen-devel@lists.xenproject.org; Mon, 30 Apr 2018 10:17:12 +0000
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

T25seSBwYXRjaCAxIGlzIGNsZWFybHkgbWVhbnQgZm9yIDQuMTEuIFRoZSBzZWNvbmQgcGF0Y2gs
IGhvd2V2ZXIsIGVsaW1pbmF0ZXMKYSAodGhlb3JldGljYWwpIHdpbmRvdyB0aGUgZmlyc3QgcGF0
Y2ggc3RpbGwgbGVhdmVzLCBzbyBzaG91bGQgYXQgbGVhc3QgYmUgY29uc2lkZXJlZC4KCjE6IHJl
LXdvcmsgVk1DQiBzeW5jLWluZwoyOiBpbnRyb2R1Y2UgYSBWTSBlbnRyeSBoZWxwZXIKClNpZ25l
ZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
