From: Anthony Liguori <aliguori@amzn.com>
Subject: [PATCH v2 06/23] console: do not print banner if below
	info log threshold
Date: Sun, 7 Jan 2018 12:28:22 -0800
Message-ID: <1515356919-922-7-git-send-email-aliguori@amzn.com>
References: <1515356919-922-1-git-send-email-aliguori@amzn.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=sjiq=ec=amzn.com=prvs=538cba048=aliguori@srs-us1.protection.inumbo.net>)
 id 1eYHYt-0004Ma-BL
 for xen-devel@lists.xenproject.org; Sun, 07 Jan 2018 20:28:55 +0000
In-Reply-To: <1515356919-922-1-git-send-email-aliguori@amzn.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Anthony Liguori <aliguori@amazon.com>, KarimAllah Ahmed <karahmed@amazon.de>, Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?q?Jan=20H=2E=20Sch=C3=B6nherr?= <jschoenh@amazon.de>, Matt Wilson <msw@amazon.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogQW50aG9ueSBMaWd1b3JpIDxhbGlndW9yaUBhbWF6b24uY29tPgoKT25seSBwcmludCB0
aGUgYmFubmVyIGlmIHRoZSBsb2cgdGhyZXNob2xkIGlzIGF0IGxlYXN0IGluZm8uCgpGb3IgVml4
ZW4gZ3Vlc3RzLCB3ZSB3YW50IHRoZSBjb25zb2xlIG91dHB1dCB0byBiZSBleGFjdGx5IHdoYXQg
dGhlClBWIGd1ZXN0IHdvdWxkIHNob3cgb24gaXQncyBvd24uICBUaGF0IG1lYW5zIHRoZSBpbm5l
ciBYZW4gYmFubmVyCmNhbiBwb3RlbnRpYWxseSBicmVhayBhdXRvbWF0aW9uIHRoYXQgYXNzdW1l
cyBhIHNwZWNpZmljIHR5cGUgb2YKY29uc29sZSBvdXRwdXQuCgpTaWduZWQtb2ZmLWJ5OiBBbnRo
b255IExpZ3VvcmkgPGFsaWd1b3JpQGFtYXpvbi5jb20+Ci0tLQogeGVuL2RyaXZlcnMvY2hhci9j
b25zb2xlLmMgfCA5ICsrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGUuYyBi
L3hlbi9kcml2ZXJzL2NoYXIvY29uc29sZS5jCmluZGV4IDBmODU3MDcuLjNlYjEzMGQgMTAwNjQ0
Ci0tLSBhL3hlbi9kcml2ZXJzL2NoYXIvY29uc29sZS5jCisrKyBiL3hlbi9kcml2ZXJzL2NoYXIv
Y29uc29sZS5jCkBAIC04MTIsOSArODEyLDEyIEBAIHZvaWQgX19pbml0IGNvbnNvbGVfaW5pdF9w
cmVpcnEodm9pZCkKICAgICBzZXJpYWxfc2V0X3J4X2hhbmRsZXIoc2VyY29uX2hhbmRsZSwgc2Vy
aWFsX3J4KTsKIAogICAgIC8qIEhFTExPIFdPUkxEIC0tLSBzdGFydC1vZi1kYXkgYmFubmVyIHRl
eHQuICovCi0gICAgc3Bpbl9sb2NrKCZjb25zb2xlX2xvY2spOwotICAgIF9fcHV0c3RyKHhlbl9i
YW5uZXIoKSk7Ci0gICAgc3Bpbl91bmxvY2soJmNvbnNvbGVfbG9jayk7CisgICAgaWYgKCAyIDwg
eGVubG9nX2xvd2VyX3RocmVzaCApIHsKKyAgICAgICAgLyogT25seSBkaXNwbGF5IGF0IFhFTkxP
R19JTkZPIGxldmVsICovCisgICAgICAgIHNwaW5fbG9jaygmY29uc29sZV9sb2NrKTsKKyAgICAg
ICAgX19wdXRzdHIoeGVuX2Jhbm5lcigpKTsKKyAgICAgICAgc3Bpbl91bmxvY2soJmNvbnNvbGVf
bG9jayk7CisgICAgfQogICAgIHByaW50aygiWGVuIHZlcnNpb24gJWQuJWQlcyAoJXNAJXMpICgl
cykgZGVidWc9JWMgIiBnY292X3N0cmluZyAiICVzXG4iLAogICAgICAgICAgICB4ZW5fbWFqb3Jf
dmVyc2lvbigpLCB4ZW5fbWlub3JfdmVyc2lvbigpLCB4ZW5fZXh0cmFfdmVyc2lvbigpLAogICAg
ICAgICAgICB4ZW5fY29tcGlsZV9ieSgpLCB4ZW5fY29tcGlsZV9kb21haW4oKSwKLS0gCjEuOS4x
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
