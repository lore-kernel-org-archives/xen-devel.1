From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH for-next 0/5] automation: test to build each
 commit in a branch
Date: Thu, 28 Feb 2019 13:44:43 +0000
Message-ID: <20190228134448.6097-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0So3=RD=citrix.com=prvs=955226cfb=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gzM02-00072S-Ex
 for xen-devel@lists.xenproject.org; Thu, 28 Feb 2019 13:45:22 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

V2UgaGF2ZSBhIHJlcXVpcmVtZW50IHRvIG1ha2UgZWFjaCBjb21taXQgYnVpbGRhYmxlIGluIHhl
bi5naXQuIFB1dCB0aGlzCmludG8gYSB0ZXN0IGluIEdpdGxhYiBDSS4KCldlaSBMaXUgKDUpOgog
IGF1dG9tYXRpb246IGFsbG93IGJ1aWxkLXRlc3Quc2ggdG8gcnVuIGluIGRldGFjaGVkIEhFQUQg
c3RhdGUKICBhdXRvbWF0aW9uOiBzZXQgcmV0IGZvciBwb3RlbnRpYWwgZXJyb3IgaW4gYnVpbGQt
dGVzdC5zaAogIGF1dG9tYXRpb246IGFkZCBhIHNjcmlwdCB0byBidWlsZCBuZXdseSBwdXNoZWQg
Y29tbWl0cyBpbiBHaXRsYWIgQ0kKICBETyBOT1QgQVBQTFk6IHRlbXBvcmFyaWx5IGRyb3Agc29t
ZSB0ZXN0cwogIGF1dG9tYXRpb246IGludHJvZHVjZSBhIHRlc3QgdG8gYnVpbGQgZWFjaCBjb21t
aXQKCiAuZ2l0bGFiLWNpLnltbCAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA0ICstCiBh
dXRvbWF0aW9uL2dpdGxhYi1jaS9idWlsZC1lYWNoLWNvbW1pdC5zaCB8IDE2ICsrKysrKysKIGF1
dG9tYXRpb24vZ2l0bGFiLWNpL3Rlc3QueWFtbCAgICAgICAgICAgIHwgNzUgKystLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQogYXV0b21hdGlvbi9zY3JpcHRzL2J1aWxkLXRlc3Quc2ggICAg
ICAgICAgfCAxOCArKysrKy0tLQogNCBmaWxlcyBjaGFuZ2VkLCAzNSBpbnNlcnRpb25zKCspLCA3
OCBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDc1NSBhdXRvbWF0aW9uL2dpdGxhYi1jaS9i
dWlsZC1lYWNoLWNvbW1pdC5zaAoKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
