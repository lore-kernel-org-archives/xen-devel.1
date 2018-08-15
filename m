From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] x86: write to correct variable in
 parse_pv_l1tf()
Date: Wed, 15 Aug 2018 04:34:45 -0600
Message-ID: <5B7401C502000078001DE4F9@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=e0/s=k6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fpt8a-00074R-FQ
 for xen-devel@lists.xenproject.org; Wed, 15 Aug 2018 10:34:48 +0000
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QXBwYXJlbnRseSBhIGNvcHktYW5kLXBhc3RlIG1pc3Rha2UuCgpTaWduZWQtb2ZmLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0gYS94ZW4vYXJjaC94ODYvc3BlY19jdHJs
LmMKKysrIGIveGVuL2FyY2gveDg2L3NwZWNfY3RybC5jCkBAIC0yMzIsNyArMjMyLDcgQEAgc3Rh
dGljIF9faW5pdCBpbnQgcGFyc2VfcHZfbDF0Zihjb25zdCBjaAogCiAgICAgLyogSW50ZXJwcmV0
ICdwdi1sMXRmJyBhbG9uZSBpbiBpdHMgcG9zaXRpdmUgYm9vbGVhbiBmb3JtLiAqLwogICAgIGlm
ICggKnMgPT0gJ1wwJyApCi0gICAgICAgIG9wdF94cHRpID0gT1BUX1BWX0wxVEZfRE9NMCB8IE9Q
VF9QVl9MMVRGX0RPTVU7CisgICAgICAgIG9wdF9wdl9sMXRmID0gT1BUX1BWX0wxVEZfRE9NMCB8
IE9QVF9QVl9MMVRGX0RPTVU7CiAKICAgICBkbyB7CiAgICAgICAgIHNzID0gc3RyY2hyKHMsICcs
Jyk7CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
