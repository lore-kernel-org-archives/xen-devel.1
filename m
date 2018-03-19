From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: [PATCH v3 1/5] sndif: Introduce protocol version
Date: Mon, 19 Mar 2018 09:22:20 +0200
Message-ID: <1521444144-12451-2-git-send-email-andr2000__3842.91924206099$1521444111$gmane$org@gmail.com>
References: <1521444144-12451-1-git-send-email-andr2000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=/zsf=gj=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1exp7u-0005AA-I3
 for xen-devel@lists.xenproject.org; Mon, 19 Mar 2018 07:22:38 +0000
Received: by mail-lf0-x242.google.com with SMTP id y19-v6so23847158lfd.4
 for <xen-devel@lists.xenproject.org>; Mon, 19 Mar 2018 00:22:37 -0700 (PDT)
In-Reply-To: <1521444144-12451-1-git-send-email-andr2000@gmail.com>
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
b20+ClJldmlld2VkLWJ5OiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNs
ZS5jb20+Ci0tLQogeGVuL2luY2x1ZGUvcHVibGljL2lvL3NuZGlmLmggfCA3ICsrKysrKysKIDEg
ZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9w
dWJsaWMvaW8vc25kaWYuaCBiL3hlbi9pbmNsdWRlL3B1YmxpYy9pby9zbmRpZi5oCmluZGV4IGM1
YzE5Nzg0MDZiMy4uNjY3ZTYxMGZkYTJiIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMv
aW8vc25kaWYuaAorKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvaW8vc25kaWYuaApAQCAtMzgsNiAr
MzgsMTMgQEAKIAogLyoKICAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioKKyAqICAgICAgICAgICAgICAg
ICAgICAgICAgICAgUHJvdG9jb2wgdmVyc2lvbgorICoqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKgorICov
CisjZGVmaW5lIFhFTlNORF9QUk9UT0NPTF9WRVJTSU9OICAgICAgICAgMQorCisvKgorICoqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKgogICogICAgICAgICAgICAgICAgICBGZWF0dXJlIGFuZCBQYXJhbWV0
ZXIgTmVnb3RpYXRpb24KICAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioKICAqCi0tIAoyLjcuNAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
