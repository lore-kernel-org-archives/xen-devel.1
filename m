From: Pawel Wieczorkiewicz <wipawel@amazon.de>
Subject: [livepatch-build-tools 2/4] livepatch-gcc: Ignore
 built_in.o and prelink.o object files
Date: Mon, 8 Apr 2019 08:32:22 +0000
Message-ID: <20190408083224.104802-2-wipawel@amazon.de>
References: <20190408083224.104802-1-wipawel@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20190408083224.104802-1-wipawel@amazon.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
Cc: mpohlack@amazon.de, ross.lagerwall@citrix.com, Pawel Wieczorkiewicz <wipawel@amazon.de>, konrad.wilk@oracle.com
List-Id: xen-devel@lists.xenproject.org

RG8gbm90IGNvcHkgb3ZlciB0aGUgYnVpbHRfaW4ubyBhbmQgcHJlbGluay5vIG9iamVjdCBmaWxl
cyB3aGVuIHRoZXkKZ2V0IHJlYnVpbHQgYXMgdGhleSBhcmUgdXNlZCBmb3IgdHJhbnNpZW50IGxp
bmtpbmcgYnkgWGVuJ3MgYnVpbGQKc3lzdGVtLgoKU2lnbmVkLW9mZi1ieTogUGF3ZWwgV2llY3pv
cmtpZXdpY3ogPHdpcGF3ZWxAYW1hem9uLmRlPgpSZXZpZXdlZC1ieTogTWFydGluIFBvaGxhY2sg
PG1wb2hsYWNrQGFtYXpvbi5kZT4KUmV2aWV3ZWQtYnk6IFBldHJlIEVmdGltZSA8ZXBldHJlQGFt
YXpvbi5jb20+Ci0tLQogbGl2ZXBhdGNoLWdjYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9saXZlcGF0Y2gtZ2NjIGIvbGl2ZXBhdGNoLWdjYwpp
bmRleCA2MTdmODY1Li4wMWU0YjhjIDEwMDc1NQotLS0gYS9saXZlcGF0Y2gtZ2NjCisrKyBiL2xp
dmVwYXRjaC1nY2MKQEAgLTM1LDYgKzM1LDggQEAgaWYgW1sgIiRUT09MQ0hBSU5DTUQiID1+ICRH
Q0NfUkUgXV0gOyB0aGVuCiAgICAgICAgICAgICB2ZXJzaW9uLm98XAogICAgICAgICAgICAgZGVi
dWcub3xcCiAgICAgICAgICAgICAqLnhlbi1zeW1zLioub3xcCisgICAgICAgICAgICBidWlsdF9p
bi5vfFwKKyAgICAgICAgICAgIHByZWxpbmsub3xcCiAgICAgICAgICAgICAuKi5vKQogICAgICAg
ICAgICAgICAgIGJyZWFrCiAgICAgICAgICAgICAgICAgOzsKLS0gCjIuMTYuNQoKCgoKQW1hem9u
IERldmVsb3BtZW50IENlbnRlciBHZXJtYW55IEdtYkgKS3JhdXNlbnN0ci4gMzgKMTAxMTcgQmVy
bGluCkdlc2NoYWVmdHNmdWVocmVyOiBDaHJpc3RpYW4gU2NobGFlZ2VyLCBSYWxmIEhlcmJyaWNo
ClVzdC1JRDogREUgMjg5IDIzNyA4NzkKRWluZ2V0cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxv
dHRlbmJ1cmcgSFJCIDE0OTE3MyBCCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
