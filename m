From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH v2 0/2] x86: deal with firmware setting bogus
 TSC_ADJUST values
Date: Fri, 02 Nov 2018 10:37:20 -0600
Message-ID: <5BDC7D4002000078001F759D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=wbrw=nn=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gIcRo-00012P-1o
 for xen-devel@lists.xenproject.org; Fri, 02 Nov 2018 16:37:24 +0000
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

MTogeDg2L1RTQzogZG9uJ3QgYWxsb3cgZGVhZGxpbmUgdGltZXIgdG8gYmUgdXNlZCB3aXRoIHVu
Zml4ZWQgZXJyYXRhCjI6IHg4NjogZGVhbCB3aXRoIGZpcm13YXJlIHNldHRpbmcgYm9ndXMgVFND
X0FESlVTVCB2YWx1ZXMKCnYyOiBOZXcgcGF0Y2ggMSwgb25seSBjb3NtZXRpYyBjaGFuZ2VzIHRv
IHBhdGNoIDIuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
