From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] kexec: suppress bogus warning
Date: Mon, 25 Feb 2019 04:23:08 -0700
Message-ID: <5C73D01C0200007800219C52@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=E5lv=RA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gyENo-00026l-GL
 for xen-devel@lists.xenproject.org; Mon, 25 Feb 2019 11:25:16 +0000
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

RG9uJ3QgZW1pdCB0aGUgImlnbm9yZWQiIHdhcm5pbmcgd2hlbiB0aGVyZSdzIG5vIHBsYWNlbWVu
dCBzcGVjaWZpY2F0aW9uCmFuZCB0aGUgdGFpbCBvZiB0aGUgc3BlY2lmaWVkIG9wdGlvbiBpcyBh
Y3R1YWxseSBlbXB0eS4KClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4KCi0tLSBhL3hlbi9jb21tb24va2V4ZWMuYworKysgYi94ZW4vY29tbW9uL2tleGVjLmMK
QEAgLTE3Myw3ICsxNzMsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBwYXJzZV9jcmFzaGtlcm5lbChj
b25zCiAgICAgICAgICAgICBrZXhlY19jcmFzaF9hcmVhX2xpbWl0ID0gcGFyc2Vfc2l6ZV9hbmRf
dW5pdChjdXIgPSBzdHIgKyAxLCAmc3RyKTsKICAgICAgICAgZWxzZSBpZiAoICFzdHJuY21wKHN0
ciwgIixiZWxvdz0iLCA3KSApCiAgICAgICAgICAgICBrZXhlY19jcmFzaF9hcmVhX2xpbWl0ID0g
cGFyc2Vfc2l6ZV9hbmRfdW5pdChjdXIgPSBzdHIgKyA3LCAmc3RyKTsKLSAgICAgICAgZWxzZQor
ICAgICAgICBlbHNlIGlmICggKnN0ciApCiAgICAgICAgIHsKICAgICAgICAgICAgIHByaW50ayhY
RU5MT0dfV0FSTklORyAiY3Jhc2hrZXJuZWw6ICclcycgaWdub3JlZFxuIiwgc3RyKTsKICAgICAg
ICAgICAgIHJjID0gLUVJTlZBTDsKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
