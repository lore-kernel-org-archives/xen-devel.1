From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: [PATCH 1/5] xen/sndif: Introduce protocol version
Date: Thu, 12 Apr 2018 19:00:58 +0300
Message-ID: <20180412160102.15833-2-oleksandr_andrushchenko__27997.2655502663$1523548828$gmane$org@epam.com>
References: <20180412160102.15833-1-oleksandr_andrushchenko@epam.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zar1=hb=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1f6ef8-0000kX-VS
 for xen-devel@lists.xenproject.org; Thu, 12 Apr 2018 16:01:27 +0000
Received: by mail-lf0-x241.google.com with SMTP id o102-v6so8446669lfg.8
 for <xen-devel@lists.xenproject.org>; Thu, 12 Apr 2018 09:01:26 -0700 (PDT)
In-Reply-To: <20180412160102.15833-1-oleksandr_andrushchenko@epam.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Cc: jgross@suse.com, iurii.konovalenko@globallogic.com, tiwai@suse.de, oleksandr.dmytryshyn@globallogic.com, andr2000@gmail.com, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

UHJvdG9jb2wgdmVyc2lvbiB3YXMgcmVmZXJlbmNlZCBpbiB0aGUgcHJvdG9jb2wgZGVzY3JpcHRp
b24sCmJ1dCBtaXNzZWQgaXRzIGRlZmluaXRpb24uIEZpeCB0aGlzIGJ5IGFkZGluZyBhIGNvbnN0
YW50CmZvciBjdXJyZW50IHByb3RvY29sIHZlcnNpb24uCgpTaWduZWQtb2ZmLWJ5OiBPbGVrc2Fu
ZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+Ci0tLQog
aW5jbHVkZS94ZW4vaW50ZXJmYWNlL2lvL3NuZGlmLmggfCA3ICsrKysrKysKIDEgZmlsZSBjaGFu
Z2VkLCA3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9pbmNsdWRlL3hlbi9pbnRlcmZhY2Uv
aW8vc25kaWYuaCBiL2luY2x1ZGUveGVuL2ludGVyZmFjZS9pby9zbmRpZi5oCmluZGV4IDVjOTE4
Mjc2ODM1ZS4uZmMxNzUyY2Y1YTE2IDEwMDY0NAotLS0gYS9pbmNsdWRlL3hlbi9pbnRlcmZhY2Uv
aW8vc25kaWYuaAorKysgYi9pbmNsdWRlL3hlbi9pbnRlcmZhY2UvaW8vc25kaWYuaApAQCAtMzYs
NiArMzYsMTMgQEAKICNpbmNsdWRlICJyaW5nLmgiCiAjaW5jbHVkZSAiLi4vZ3JhbnRfdGFibGUu
aCIKIAorLyoKKyAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioKKyAqICAgICAgICAgICAgICAgICAgICAg
ICAgICAgUHJvdG9jb2wgdmVyc2lvbgorICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKgorICovCisjZGVm
aW5lIFhFTlNORF9QUk9UT0NPTF9WRVJTSU9OCTEKKwogLyoKICAqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioKICAqICAgICAgICAgICAgICAgICAgRmVhdHVyZSBhbmQgUGFyYW1ldGVyIE5lZ290aWF0aW9u
Ci0tIAoyLjE3LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
