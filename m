From: Huaisheng Ye <yehs2007@gmail.com>
Subject: [RFC PATCH v2 12/12] arch/x86/include/asm/page.h:
 update usage of movableflags
Date: Mon, 21 May 2018 23:20:33 +0800
Message-ID: <1526916033-4877-13-git-send-email-yehs2007__32820.8467610695$1526961150$gmane$org@gmail.com>
References: <1526916033-4877-1-git-send-email-yehs2007@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=hc98=ii=gmail.com=yehs2007@srs-us1.protection.inumbo.net>)
 id 1fKmd7-0006BD-0Q
 for xen-devel@lists.xenproject.org; Mon, 21 May 2018 15:21:45 +0000
Received: by mail-pf0-x241.google.com with SMTP id a20-v6so7255913pfo.0
 for <xen-devel@lists.xenproject.org>; Mon, 21 May 2018 08:21:43 -0700 (PDT)
In-Reply-To: <1526916033-4877-1-git-send-email-yehs2007@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: akpm@linux-foundation.org, linux-mm@kvack.org
Cc: kstewart@linuxfoundation.org, "x86@kernel.org" <x86@kernel.org>, mhocko@suse.com, Huaisheng Ye <yehs1@lenovo.com>, hehy1@lenovo.com, Philippe Ombredanne <pombredanne@nexb.com>, gregkh@linuxfoundation.org, "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, willy@infradead.org, alexander.levin@verizon.com, iommu@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>, linux-btrfs@vger.kernel.org, chengnt@lenovo.com, xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>, colyli@suse.de, mgorman@techsingularity.net, vbabka@suse.cz
List-Id: xen-devel@lists.xenproject.org

RnJvbTogSHVhaXNoZW5nIFllIDx5ZWhzMUBsZW5vdm8uY29tPgoKR0ZQX0hJR0hVU0VSX01PVkFC
TEUgZG9lc24ndCBlcXVhbCB0byBHRlBfSElHSFVTRVIgfCBfX0dGUF9NT1ZBQkxFLAptb2RpZnkg
aXQgdG8gYWRhcHQgcGF0Y2ggb2YgZ2V0dGluZyByaWQgb2YgR0ZQX1pPTkVfVEFCTEUvQkFELgoK
U2lnbmVkLW9mZi1ieTogSHVhaXNoZW5nIFllIDx5ZWhzMUBsZW5vdm8uY29tPgpDYzogVGhvbWFz
IEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+CkNjOiBJbmdvIE1vbG5hciA8bWluZ29AcmVk
aGF0LmNvbT4KQ2M6ICJILiBQZXRlciBBbnZpbiIgPGhwYUB6eXRvci5jb20+CkNjOiBLYXRlIFN0
ZXdhcnQgPGtzdGV3YXJ0QGxpbnV4Zm91bmRhdGlvbi5vcmc+CkNjOiBHcmVnIEtyb2FoLUhhcnRt
YW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgpDYzogeDg2QGtlcm5lbC5vcmcgPHg4NkBr
ZXJuZWwub3JnPgpDYzogUGhpbGlwcGUgT21icmVkYW5uZSA8cG9tYnJlZGFubmVAbmV4Yi5jb20+
Ci0tLQogYXJjaC94ODYvaW5jbHVkZS9hc20vcGFnZS5oIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9p
bmNsdWRlL2FzbS9wYWdlLmggYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9wYWdlLmgKaW5kZXggNzU1
NWI0OC4uYTQ3ZjQyZCAxMDA2NDQKLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20vcGFnZS5oCisr
KyBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL3BhZ2UuaApAQCAtMzUsNyArMzUsOCBAQCBzdGF0aWMg
aW5saW5lIHZvaWQgY29weV91c2VyX3BhZ2Uodm9pZCAqdG8sIHZvaWQgKmZyb20sIHVuc2lnbmVk
IGxvbmcgdmFkZHIsCiB9CiAKICNkZWZpbmUgX19hbGxvY196ZXJvZWRfdXNlcl9oaWdocGFnZSht
b3ZhYmxlZmxhZ3MsIHZtYSwgdmFkZHIpIFwKLQlhbGxvY19wYWdlX3ZtYShHRlBfSElHSFVTRVIg
fCBfX0dGUF9aRVJPIHwgbW92YWJsZWZsYWdzLCB2bWEsIHZhZGRyKQorCWFsbG9jX3BhZ2Vfdm1h
KChtb3ZhYmxlZmxhZ3MgPyBHRlBfSElHSFVTRVJfTU9WQUJMRSA6IEdGUF9ISUdIVVNFUikgXAor
CXwgX19HRlBfWkVSTywgdm1hLCB2YWRkcikKICNkZWZpbmUgX19IQVZFX0FSQ0hfQUxMT0NfWkVS
T0VEX1VTRVJfSElHSFBBR0UKIAogI2lmbmRlZiBfX3BhCi0tIAoxLjguMy4xCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
