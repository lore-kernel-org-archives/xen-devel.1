From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: [PATCH v2 1/3] sndif: Introduce protocol version
Date: Wed, 14 Mar 2018 18:02:43 +0200
Message-ID: <1521043365-26813-2-git-send-email-andr2000__11908.2205150791$1521043309$gmane$org@gmail.com>
References: <1521043365-26813-1-git-send-email-andr2000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=vp4x=ge=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1ew8ri-00080g-QH
 for xen-devel@lists.xenproject.org; Wed, 14 Mar 2018 16:02:58 +0000
Received: by mail-lf0-x244.google.com with SMTP id p74-v6so5632404lfd.3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Mar 2018 09:02:56 -0700 (PDT)
In-Reply-To: <1521043365-26813-1-git-send-email-andr2000@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: alsa-devel@alsa-project.org, xen-devel@lists.xenproject.org, konrad.wilk@oracle.com, tiwai@suse.de
Cc: andr2000@gmail.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVw
YW0uY29tPgoKUHJvdG9jb2wgdmVyc2lvbiB3YXMgcmVmZXJlbmNlZCBpbiB0aGUgcHJvdG9jb2wg
ZGVzY3JpcHRpb24sCmJ1dCBtaXNzZWQgaXRzIGRlZmluaXRpb24uIEZpeCB0aGlzIGJ5IGFkZGlu
ZyBhIGNvbnN0YW50CmZvciBjdXJyZW50IHByb3RvY29sIHZlcnNpb24uCgpTaWduZWQtb2ZmLWJ5
OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5j
b20+Ci0tLQogeGVuL2luY2x1ZGUvcHVibGljL2lvL3NuZGlmLmggfCA3ICsrKysrKysKIDEgZmls
ZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9wdWJs
aWMvaW8vc25kaWYuaCBiL3hlbi9pbmNsdWRlL3B1YmxpYy9pby9zbmRpZi5oCmluZGV4IGM1YzE5
Nzg0MDZiMy4uNjY3ZTYxMGZkYTJiIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvaW8v
c25kaWYuaAorKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvaW8vc25kaWYuaApAQCAtMzgsNiArMzgs
MTMgQEAKIAogLyoKICAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioKKyAqICAgICAgICAgICAgICAgICAg
ICAgICAgICAgUHJvdG9jb2wgdmVyc2lvbgorICoqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKgorICovCisj
ZGVmaW5lIFhFTlNORF9QUk9UT0NPTF9WRVJTSU9OICAgICAgICAgMQorCisvKgorICoqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKgogICogICAgICAgICAgICAgICAgICBGZWF0dXJlIGFuZCBQYXJhbWV0ZXIg
TmVnb3RpYXRpb24KICAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioKICAqCi0tIAoyLjcuNAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
