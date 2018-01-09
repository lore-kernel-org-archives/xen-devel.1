From: Daniel Kiper <daniel.kiper@oracle.com>
Subject: [PATCH 0/4] x86/xen/efi: Initialize UEFI secure boot
	state during dom0 boot
Date: Tue,  9 Jan 2018 15:22:21 +0100
Message-ID: <1515507745-17391-1-git-send-email-daniel.kiper__37851.2228992351$1515507728$gmane$org@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=yi2q=ee=oracle.com=daniel.kiper@srs-us1.protection.inumbo.net>)
 id 1eYuo9-000087-Jh
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2018 14:23:17 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org, xen-devel@lists.xenproject.org
Cc: jgross@suse.com, ard.biesheuvel@linaro.org, mingo@redhat.com, hpa@zytor.com, boris.ostrovsky@oracle.com, tglx@linutronix.de
List-Id: xen-devel@lists.xenproject.org

SGksCgpJbml0aWFsaXplIFVFRkkgc2VjdXJlIGJvb3Qgc3RhdGUgZHVyaW5nIGRvbTAgYm9vdC4g
T3RoZXJ3aXNlIHRoZSBrZXJuZWwKbWF5IG5vdCBldmVuIGtub3cgdGhhdCBpdCBydW5zIG9uIHNl
Y3VyZSBib290IGVuYWJsZWQgcGxhdGZvcm0uCgpEYW5pZWwKCiBhcmNoL3g4Ni94ZW4vTWFrZWZp
bGUgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgNCArKystCiBhcmNoL3g4Ni94ZW4vZWZp
LmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxNCArKysrKysrKysrKysrCiBkcml2
ZXJzL2Zpcm13YXJlL2VmaS9saWJzdHViL3NlY3VyZWJvb3QtY29yZS5jIHwgICA3NyArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysKIGRyaXZlcnMvZmlybXdhcmUvZWZpL2xpYnN0dWIvc2VjdXJlYm9vdC5jICAgICAgfCAg
IDY2ICsrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCiA0IGZpbGVzIGNoYW5nZWQsIDk5IGluc2VydGlvbnMoKyksIDYyIGRlbGV0aW9ucygt
KQoKRGFuaWVsIEtpcGVyICg0KToKICAgICAgZWZpL3N0dWI6IEV4dHJhY3QgZWZpX2dldF9zZWN1
cmVib290KCkgdG8gc2VwYXJhdGUgZmlsZQogICAgICB4ODYveGVuL2VmaTogSW5pdGlhbGl6ZSBi
b290X3BhcmFtcy5zZWN1cmVfYm9vdCBpbiB4ZW5fZWZpX2luaXQoKQogICAgICBlZmk6IFR3ZWFr
IGVmaV9nZXRfc2VjdXJlYm9vdCgpIGFuZCBpdHMgZGF0YSBzZWN0aW9uIGFzc2lnbm1lbnQKICAg
ICAgZWZpOiBSZW5hbWUgZWZpX2dldF9zZWN1cmVib290KCkgdG8gX19lZmlfZ2V0X3NlY3VyZWJv
b3QoKSBhbmQgbWFrZSBpdCBzdGF0aWMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
