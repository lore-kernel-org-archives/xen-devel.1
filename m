From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH v3 0/2] SVM: guest state handling adjustments
Date: Fri, 04 May 2018 09:07:28 -0600
Message-ID: <5AEC773002000078001C0BCE@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=a/pu=hx=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fEcJ3-0005dx-C6
 for xen-devel@lists.xenproject.org; Fri, 04 May 2018 15:07:33 +0000
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T25seSBwYXRjaCAxIGlzIGNsZWFybHkgbWVhbnQgZm9yIDQuMTEuIFRoZSBzZWNvbmQgcGF0Y2gs
IGhvd2V2ZXIsIGVsaW1pbmF0ZXMKYSAodGhlb3JldGljYWwpIHdpbmRvdyB0aGUgZmlyc3QgcGF0
Y2ggc3RpbGwgbGVhdmVzLCBzbyBzaG91bGQgYXQgbGVhc3QgYmUgY29uc2lkZXJlZC4KRnVydGhl
cm1vcmUgcHJldmlvdXMgZGlzY3Vzc2lvbiBzdWdnZXN0cyB0aGF0IGl0IG1pZ2h0IGV2ZW4gYmUg
ZGVzaXJhYmxlIHRvIGZvbGQKYm90aCBwYXRjaGVzIGludG8gb25lIChvciBzd2FwIHRoZWlyIG9y
ZGVyKS4KCjE6IHJlLXdvcmsgVk1DQiBzeW5jLWluZwoyOiBpbnRyb2R1Y2UgYSBWTSBlbnRyeSBo
ZWxwZXIKClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
