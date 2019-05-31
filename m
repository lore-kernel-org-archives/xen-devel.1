From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 0/2]: x86/traps: improve show_trace()'s
 top-of-stack handling
Date: Fri, 31 May 2019 02:59:20 -0600
Message-ID: <5CF0ECE80200007800233D41@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1r68=T7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hWdNp-0007yV-OH
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 08:59:29 +0000
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

MTogZ3VhcmQgdG9wLW9mLXN0YWNrIHJlYWRzCjI6IHdpZGVuIGNvbmRpdGlvbiBmb3IgbG9nZ2lu
ZyB0b3Atb2Ytc3RhY2sKClRoZSBpc3N1ZSBwYXRjaCAyIGZpeGVzIChhIGN1cmlvdXMgbGFjayBv
ZiBhbiBpbnRlcm1lZGlhdGUgY2FsbCBzdGFjawplbnRyeSkgd2FzIG9ic2VydmVkIGluIHByYWN0
aWNlOyBwYXRjaCAxIGlzIGEgcmVzdWx0IG9mIG1lIGp1c3QgbG9va2luZwphdCB0aGUgY29kZSAo
YW5kIGlmIEkgaGF2ZSBtaXNzZWQgc29tZSBhc3BlY3Qgb2Ygd2h5IHRoaXMgaXNuJ3QgYQpwcm9i
bGVtIGluIHJlYWxpdHksIHRoYXQgcGF0Y2ggY291bGQgYmUgZWFzaWx5IGRyb3BwZWQpLgoKSmFu
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
