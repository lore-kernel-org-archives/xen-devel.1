From: Juergen Gross <jgross@suse.com>
Subject: [PATCH] xen: fix pv domain on amd in 4.9 stable branch
Date: Tue, 29 May 2018 15:11:36 +0200
Message-ID: <20180529131136.15624-1-jgross__43711.0880193815$1527599440$gmane$org@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ztdp=iq=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fNePg-0003xy-HH
 for xen-devel@lists.xenproject.org; Tue, 29 May 2018 13:11:44 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: stable@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, David Woodhouse <dwmw@amazon.co.uk>
List-Id: xen-devel@lists.xenproject.org

Q29tbWl0IDk0NGUwZmM1MWE4OWM5ODI3Yjk4ODEzZDY1ZGMwODMyNzQ3NzdjN2YgKCJ4ODYvYW1k
OiBkb24ndCBzZXQKWDg2X0JVR19TWVNSRVRfU1NfQVRUUlMgd2hlbiBydW5uaW5nIHVuZGVyIFhl
biIpIGJyZWFrcyBYZW4gcHYtZG9tYWlucwpvbiBBTUQgcHJvY2Vzc29ycywgYXMgYSBwcmVyZXF1
aXNpdGUgcGF0Y2ggZnJvbSB1cHN0cmVhbSB3YXNuJ3QgYWRkZWQKdG8gNC45LgoKRml4IHRoYXQg
YnkgYWRkaW5nIHRoZSBwcmVyZXF1aXNpdGUgc2V0dGluZyBvZiBYODZfRkVBVFVSRV9YRU5QViB0
byB0aGUKWGVuIHB2IGVhcmx5IGJvb3QgcGF0aC4KCkNjOiBEYXZpZCBXb29kaG91c2UgPGR3bXdA
YW1hem9uLmNvLnVrPgpDYzogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xl
LmNvbT4KU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgotLS0K
IGFyY2gveDg2L3hlbi9lbmxpZ2h0ZW4uYyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYveGVuL2VubGlnaHRlbi5jIGIvYXJjaC94
ODYveGVuL2VubGlnaHRlbi5jCmluZGV4IDA4MTQzN2I1ZjM4MS4uNjc0NjU2Y2RiNjhjIDEwMDY0
NAotLS0gYS9hcmNoL3g4Ni94ZW4vZW5saWdodGVuLmMKKysrIGIvYXJjaC94ODYveGVuL2VubGln
aHRlbi5jCkBAIC0xNjMyLDYgKzE2MzIsOSBAQCBhc21saW5rYWdlIF9fdmlzaWJsZSB2b2lkIF9f
aW5pdCB4ZW5fc3RhcnRfa2VybmVsKHZvaWQpCiAJeGVuX2luaXRfaXJxX29wcygpOwogCXhlbl9p
bml0X2NwdWlkX21hc2soKTsKIAorCS8qIE5lZWRlZCBmb3IgaW5pdF9hbWQoKS4gKi8KKwlzZXR1
cF9mb3JjZV9jcHVfY2FwKFg4Nl9GRUFUVVJFX1hFTlBWKTsKKwogI2lmZGVmIENPTkZJR19YODZf
TE9DQUxfQVBJQwogCS8qCiAJICogc2V0IHVwIHRoZSBiYXNpYyBhcGljIG9wcy4KLS0gCjIuMTMu
NgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
