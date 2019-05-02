From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 0/9] XSA-292 follow-up
Date: Thu, 02 May 2019 05:35:09 -0600
Message-ID: <5CCAD5ED020000780022B2A2@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hM9zb-0000hn-Ao
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 11:35:11 +0000
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VmFyaW91cyBDUjMgYW5kIFBDSUQgcmVsYXRlZCBhZGp1c3RtZW50cywgZmlyc3QgYW5kIGZvcmVt
b3N0CmFuIGFsbW9zdCBmdWxsIHJlLXdyaXRlIG9mIHN3aXRjaF9jcjNfY3I0KCkgKGluIHBhdGNo
IDIpLgoKMTogeDg2OiBhZGp1c3QgY3IzX3BjaWQoKSByZXR1cm4gdHlwZQoyOiB4ODY6IGxpbWl0
IHRoZSBhbW91bnQgb2YgVExCIGZsdXNoaW5nIGluIHN3aXRjaF9jcjNfY3I0KCkKMzogeDg2L21t
OiBob25vciBvcHRfcGNpZCBhbHNvIGZvciAzMi1iaXQgUFYgZG9tYWlucwo0OiB4ODYvSFZNOiBt
b3ZlIE5PRkxVU0ggaGFuZGxpbmcgb3V0IG9mIGh2bV9zZXRfY3IzKCkKNTogeDg2L0hWTTogcmVm
dXNlIENSMyBsb2FkcyB3aXRoIHJlc2VydmVkICh1cHBlcikgYml0cyBzZXQKNjogeDg2L0hWTTog
cmVsYXggc2hhZG93IG1vZGUgY2hlY2sgaW4gaHZtX3NldF9jcjMoKQo3OiB4ODYvSFZNOiBjb3Nt
ZXRpY3MgdG8gaHZtX3NldF9jcjMoKQo4OiB4ODYvQ1BVSUQ6IGRyb3AgSU5WUENJRCBkZXBlbmRl
bmN5IG9uIFBDSUQKOTogeDg2OiBQQ0lEIGlzIHVudXNlZCB3aGVuICFQVgoKSmFuCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
