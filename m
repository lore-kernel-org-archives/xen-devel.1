From: Laszlo Ersek <lersek@redhat.com>
Subject: [PATCH 1/4] OvmfPkg/License.txt: remove XenPvBlkDxe
 from the MIT licensed dir list
Date: Wed, 10 Apr 2019 14:58:06 +0200
Message-ID: <20190410125809.21985-2-lersek@redhat.com>
References: <20190410125809.21985-1-lersek@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=eTPk=SM=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hECo6-0006Ss-5w
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 12:58:26 +0000
In-Reply-To: <20190410125809.21985-1-lersek@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: edk2-devel-groups-io <devel@edk2.groups.io>
Cc: Lars Kurth <lars.kurth@citrix.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Jordan Justen <jordan.l.justen@intel.com>, Julien Grall <julien.grall@arm.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

QWxsIGZpbGVzIHVuZGVyICJPdm1mUGtnL1hlblB2QmxrRHhlIiBjYXJyeQoKICBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogQlNELTItQ2xhdXNlLVBhdGVudAoKTm9uZSBvZiB0aGVtIGFyZSBNSVQt
bGljZW5zZWQuCgpVcGRhdGUgIk92bWZQa2cvTGljZW5zZS50eHQiIGFjY29yZGluZ2x5LgoKQ2M6
IEFudGhvbnkgUGVyYXJkIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgpDYzogQXJkIEJpZXNo
ZXV2ZWwgPGFyZC5iaWVzaGV1dmVsQGxpbmFyby5vcmc+CkNjOiBKb3JkYW4gSnVzdGVuIDxqb3Jk
YW4ubC5qdXN0ZW5AaW50ZWwuY29tPgpDYzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJt
LmNvbT4KQ2M6IExhcnMgS3VydGggPGxhcnMua3VydGhAY2l0cml4LmNvbT4KQ2M6IHhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpCdWd6aWxsYTogaHR0cHM6Ly9idWd6aWxsYS50aWFub2Nv
cmUub3JnL3Nob3dfYnVnLmNnaT9pZD0xNjU0ClNpZ25lZC1vZmYtYnk6IExhc3psbyBFcnNlayA8
bGVyc2VrQHJlZGhhdC5jb20+Ci0tLQogT3ZtZlBrZy9MaWNlbnNlLnR4dCB8IDEgLQogMSBmaWxl
IGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9Pdm1mUGtnL0xpY2Vuc2UudHh0
IGIvT3ZtZlBrZy9MaWNlbnNlLnR4dAppbmRleCAwNjY2ZTFiYWM2NWUuLmEyZTAyYTE3OTZhYSAx
MDA2NDQKLS0tIGEvT3ZtZlBrZy9MaWNlbnNlLnR4dAorKysgYi9Pdm1mUGtnL0xpY2Vuc2UudHh0
CkBAIC01NCwxMSArNTQsMTAgQEAgUE9TU0lCSUxJVFkgT0YgU1VDSCBEQU1BR0UuCiAKIFNvbWUg
ZmlsZXMgYXJlIHN1YmplY3QgdG8gdGhlIGZvbGxvd2luZyBsaWNlbnNlLCB0aGUgTUlUIGxpY2Vu
c2UuIFRob3NlIGZpbGVzCiBhcmUgbG9jYXRlZCBpbjoKIC0gT3ZtZlBrZy9JbmNsdWRlL0luZHVz
dHJ5U3RhbmRhcmQvWGVuLwogLSBPdm1mUGtnL1hlbkJ1c0R4ZS8KLS0gT3ZtZlBrZy9YZW5QdkJs
a0R4ZS8KIAogUGVybWlzc2lvbiBpcyBoZXJlYnkgZ3JhbnRlZCwgZnJlZSBvZiBjaGFyZ2UsIHRv
IGFueSBwZXJzb24gb2J0YWluaW5nIGEgY29weQogb2YgdGhpcyBzb2Z0d2FyZSBhbmQgYXNzb2Np
YXRlZCBkb2N1bWVudGF0aW9uIGZpbGVzICh0aGUgIlNvZnR3YXJlIiksIHRvIGRlYWwKIGluIHRo
ZSBTb2Z0d2FyZSB3aXRob3V0IHJlc3RyaWN0aW9uLCBpbmNsdWRpbmcgd2l0aG91dCBsaW1pdGF0
aW9uIHRoZSByaWdodHMKIHRvIHVzZSwgY29weSwgbW9kaWZ5LCBtZXJnZSwgcHVibGlzaCwgZGlz
dHJpYnV0ZSwgc3VibGljZW5zZSwgYW5kL29yIHNlbGwKLS0gCjIuMTkuMS4zLmczMDI0N2FhNWQy
MDEKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
