From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Fix VGA logdirty related display freezes with altp2m
Date: Thu, 18 Oct 2018 13:07:50 +0300
Message-ID: <1539857272-4660-1-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jzrj=m6=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gD5Dq-0004DR-I4
 for xen-devel@lists.xenproject.org; Thu, 18 Oct 2018 10:08:06 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: kevin.tian@intel.com, wei.liu2@citrix.com, jun.nakajima@intel.com, george.dunlap@eu.citrix.com, andrew.cooper3@citrix.com, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

SGVsbG8sCgpUaGlzIHNlcmllcyBhaW1zIHRvIHByZXZlbnQgdGhlIGRpc3BsYXkgZnJvbSBmcmVl
emluZyB3aGVuCmVuYWJsaW5nIGFsdHAybSBhbmQgc3dpdGNoaW5nIHRvIGEgbmV3IHZpZXcgKGFu
ZCBhc3NvcnRlZCBwcm9ibGVtcwp3aGVuIHJlc2l6aW5nIHRoZSBkaXNwbGF5KS4KClRoZSBmaXJz
dCBwYXRjaCBwcm9wYWdhdGVzIGVwdC5hZCBjaGFuZ2VzIHRvIGFsbCBhY3RpdmUgYWx0cDJtcywK
YW5kIHRoZSBzZWNvbmQgb25lIGFsbG9jYXRlcyBhIG5ldyBsb2dkaXJ0eSByYW5nZXNldCBmb3Ig
ZWFjaApuZXcgYWx0cDJtLCBhbmQgcHJvcGFnYXRlcyAodW5kZXIgbG9jaykgY2hhbmdlcyB0byBh
bGwgcDJtcy4KClRoZSBmaXJzdCBwYXRjaCBpcyB0aGUgc2FtZSBhczoKW1BBVENIIFY0XSB4ODYv
YWx0cDJtOiBwcm9wYWdhdGUgZXB0LmFkIGNoYW5nZXMgdG8gYWxsIGFjdGl2ZSBhbHRwMm1zCmJ1
dCBhcyBpdCBpcyBub3cgcmVxdWlyZWQgZm9yIHRoZSBzZWNvbmQgb25lIHRvIGFwcGx5IGNsZWFu
bHksIGl0CmhhcyBiZWVuIHJlc2VudCBhcyBwYXJ0IG9mIHRoaXMgc2VyaWVzLgoKW1BBVENIIDEv
Ml0geDg2L2FsdHAybTogcHJvcGFnYXRlIGVwdC5hZCBjaGFuZ2VzIHRvIGFsbCBhY3RpdmUgYWx0
cDJtcwpbUEFUQ0ggMi8yXSB4ODYvYWx0cDJtOiBmaXggZGlzcGxheSBmcm96ZW4gd2hlbiBzd2l0
Y2hpbmcgdG8gYSBuZXcKCgpUaGFua3MsClJhenZhbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
